import 'package:yaml/yaml.dart';
import 'package:yamltools/yamltools.dart';

void main() {
  var yamlString = '''
test:
  - text: hello world
    type: greeting
''';
  var yaml = loadYamlNode(yamlString).getMapValue('test');
  print(
      '${yaml?.asList()?.nodes.first.getMapValue('text')} is a ${yaml?.asList()?.nodes.first.getMapValue('type')}');
}
