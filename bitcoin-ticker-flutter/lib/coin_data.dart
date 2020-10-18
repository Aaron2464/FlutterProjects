import 'package:bitcoin_ticker/networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const URL = 'https://rest.coinapi.io/v1/exchangerate';
const String apiKey = 'DC769B5B-3AFE-42C9-8672-5E5847A215FC';

class CoinData {
  Future<dynamic> getCoin(String quote) async {
    Map<String, String> cryptoPrice = {};

    for (String coin in cryptoList) {
      var url = '$URL/$coin/$quote?apikey=$apiKey';
      NetworkHelper networkHelper = new NetworkHelper(url);
      var data = await networkHelper.getCoinData();
      double lastPrice = data['rate'];
      cryptoPrice[coin] = lastPrice.round().toString();
    }
    return cryptoPrice;
  }
}
