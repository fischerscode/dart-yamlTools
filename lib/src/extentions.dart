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

  bool? asBool() {
    var value = asScalar()?.value;
    if (value is bool) {
      return value;
    } else {
      return null;
    }
  }

  num? asNum() {
    var value = asScalar()?.value;
    if (value is num) {
      return value;
    } else {
      return null;
    }
  }

  int? asInt() {
    return asNum()?.toInt();
  }

  double? asDouble() {
    return asNum()?.toDouble();
  }

  YamlNode? getMapValue(String key) {
    return asMap()?.get(key);
  }
}

extension ExtendedYamlMap on YamlMap {
  YamlNode? get(String key) {
    if (this[key] is YamlNode) return this[key] as YamlNode;
    if (this[key] is String) return YamlScalar.wrap(this[key]);
    if (this[key] is bool) return YamlScalar.wrap(this[key]);
    if (this[key] is num) return YamlScalar.wrap(this[key]);
    return null;
  }
}

extension ExtendedYamlList on YamlList {
  YamlNode? get(int index) {
    if (this[index] is YamlNode) return this[index] as YamlNode;
    if (this[index] is String) return YamlScalar.wrap(this[index]);
    if (this[index] is bool) return YamlScalar.wrap(this[index]);
    if (this[index] is num) return YamlScalar.wrap(this[index]);
    return null;
  }
}
