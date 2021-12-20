import 'package:http/http.dart' as http;
import 'dart:convert';

const url = 'http://rest.coinapi.io/v1/exchangerate';
const apiKey = 'E2B54B20-81E2-465D-89D8-B93502B0ACF8';
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

class CoinData {
  Future getCoinData(String coinName) async {
    //Gunakan map untuk menggumpulkan nilai dari loop
    Map<String, String> cryptoPrices = {};
    //menggunakan loop dari cryptolist dan request data setiap looping, kemudia disimpan ke map
    for (String cryList in cryptoList) {
      http.Response response = await http
          .get(Uri.parse('${url}/${cryList}/${coinName}?apikey=${apiKey}'));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double jsonData = data['rate'];
        cryptoPrices[cryList] = jsonData.toStringAsFixed(0);
      } else {
        print(response.statusCode);
      }
    }
    return cryptoPrices;
  }
}
