import pytest

def test_docker(host):
    output = host.run('docker -v')
    assert output.rc == 0
    assert u'Docker version ' in output.stdout
    assert output.stderr == ''

def test_pip(host):
    assert host.exists("pip")

def test_pytest(host):
    assert host.exists("py.test")
