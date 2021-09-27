part of yamltools;

extension ExtendedYamlNode on YamlNode {
  YamlMap? asMap() {
    if (this is YamlMap) return this as YamlMap;
    return null;
  }

  YamlList? asList() {
    if (this is YamlList) return this as YamlList;
    return null;
  }

  YamlScalar? asScalar() {
    if (this is YamlScalar) return this as YamlScalar;
    return null;
  }

  String? asString() {
    return asScalar()?.toString();
  }

  YamlNode? getMapValue(String key) {
    return asMap()?.get(key);
  }
}

extension ExtendedYamlMap on YamlMap {
  YamlNode? get(String key) {
    if (this[key] is YamlNode) return this[key] as YamlNode;
    if (this[key] is String) return YamlScalar.wrap(this[key]);
    return null;
  }
}
