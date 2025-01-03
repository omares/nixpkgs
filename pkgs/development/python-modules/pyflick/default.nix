{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  aiohttp,
  json-api-doc,
  python-dateutil,
}:

buildPythonPackage rec {
  pname = "pyflick";
  version = "1.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ZephireNZ";
    repo = "PyFlick";
    tag = "v${version}";
    hash = "sha256-Csm5gXMIGEhHgzN/7sO/1iM/wZklI2Jc0C69tgYWxnQ=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonRelaxDeps = [ "aiohttp" ];

  dependencies = [
    aiohttp
    json-api-doc
    python-dateutil
  ];

  # no tests implemented
  doCheck = false;

  pythonImportsCheck = [
    "pyflick"
    "pyflick.authentication"
  ];

  meta = with lib; {
    description = "Python API For Flick Electric in New Zealand";
    homepage = "https://github.com/ZephireNZ/PyFlick";
    license = licenses.mit;
    maintainers = with maintainers; [ dotlambda ];
  };
}
