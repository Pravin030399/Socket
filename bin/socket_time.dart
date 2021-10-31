import 'dart:convert';
import 'dart:io';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

void main(List<String> arguments) {
final channel = IOWebSocketChannel.connect(
'wss://ws.binaryws.com/websockets/v3?app_id=1089');


channel.stream.listen((message) {
final decodeMessage = jsonDecode(message);
    final getSymbol = decodeMessage['tick']['symbol'];
    final getPrice = decodeMessage['tick']['quote'];
    final serverTimeAsEpoch = decodeMessage['tick']['epoch'];
final serverTime = 			DateTime.fromMillisecondsSinceEpoch(serverTimeAsEpoch * 1000);
    print('Name: $getSymbol Price: $getPrice, Date: $serverTime');

});
  final userInput = stdin.readLineSync();
  channel.sink.add('{"ticks":"$userInput"}');
// channel.sink.add('{"ticks":"R_100"}');
}
