{% set hosts = {'github.com': 22} %}

{% for host, cfg in salt['pillar.get']('build-infra:remote-hosts', {}).items() %}
{%   if cfg is mapping %}
{%     do hosts.update({host: cfg.get('ssh_port', 22)}) %}
{%   else %}
{%     do hosts.update({host: 22}) %}
{%   endif %}
{% endfor %}

{% set netvm = salt['pillar.get']('build-infra:netvm', 'sys-net') %}
{% set envs = salt['pillar.get']('build-infra:build-envs', {}).keys() | list %}

/etc/qubes/policy.d/30-local-connectssh.policy:
  file.managed:
    - makedirs: True
    - contents: |
{%- for host, port in hosts.items() %}
{%-   for env in envs %}
        local.ConnectSSH +{{host}}+{{port}} build-{{env}} {{netvm}} allow
{%-   endfor %}
{%- endfor %}
        local.ConnectSSH * @anyvm @anyvm deny

{# remove legacy /etc/qubes-rpc/policy/ files this state used to manage #}
/etc/qubes-rpc/policy/local.ConnectSSH:
  file.absent
{% for host in hosts.keys() %}
/etc/qubes-rpc/policy/local.ConnectSSH+{{host}}:
  file.absent
{% endfor %}
