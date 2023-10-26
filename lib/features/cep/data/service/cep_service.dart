import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterstudy_cepapp/features/cep/data/model/cep_model.dart';
import 'package:http/http.dart' as http;

class CepService {
  static String baseURL = 'https://viacep.com.br/ws/';
  static const formatJson = '/json/';

  static Future<Cep> fetchCep({required String cepNumber}) async {
    final response = await http.get(Uri.parse(baseURL + cepNumber.toString() + formatJson));

    if (response.statusCode == 200) {
      debugPrint(response.statusCode.toString());
      return Cep.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed load CEP.');
    }
  }
}
