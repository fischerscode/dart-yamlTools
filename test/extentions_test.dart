import 'package:test/test.dart';
import 'package:yaml/yaml.dart';
import 'package:yamltools/yamltools.dart';

void main() {
  final yaml = loadYamlNode('''
foo: true
bar: "Bar"
list:
  - foo: "Foo"
    id: 0
    num: 1.23
  - foo: "Foo"
    id: 1
    num: 4
''');
  test('Test', () {
    expect(yaml.getMapValue('foo')?.asScalar()?.value, true);
    expect(yaml.getMapValue('bar')?.asString(), 'Bar');
    expect(
        yaml
            .getMapValue('list')
            ?.asList()
            ?.get(0)
            ?.getMapValue('foo')
            ?.asString(),
        'Foo');
    expect(
        yaml.getMapValue('list')?.asList()?.get(0)?.getMapValue('id')?.asNum(),
        0);
    expect(
        yaml.getMapValue('list')?.asList()?.get(0)?.getMapValue('id')?.asInt(),
        0);
    expect(
        yaml.getMapValue('list')?.asList()?.get(0)?.getMapValue('num')?.asNum(),
        1.23);
    expect(
        yaml
            .getMapValue('list')
            ?.asList()
            ?.get(0)
            ?.getMapValue('num')
            ?.asDouble(),
        1.23);
    expect(
        yaml
            .getMapValue('list')
            ?.asList()
            ?.get(1)
            ?.getMapValue('foo')
            ?.asString(),
        'Foo');
    expect(
        yaml
            .getMapValue('list')
            ?.asList()
            ?.get(1)
            ?.getMapValue('id')
            ?.asDouble(),
        1);
    expect(
        yaml.getMapValue('list')?.asList()?.get(1)?.getMapValue('num')?.asNum(),
        4);
  });
}
