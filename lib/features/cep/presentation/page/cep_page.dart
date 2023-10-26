import 'package:flutter/material.dart';
import 'package:flutterstudy_cepapp/features/cep/data/service/cep_service.dart';

class CepPage extends StatefulWidget {
  const CepPage({super.key});

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  var _searchCepController = TextEditingController();
  bool _loading = false;
  bool _enableField = true;
  String? _result;

  @override
  void dispose() {
    super.dispose();
    _searchCepController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body, appBar: appBar);
  }

  AppBar get appBar {
    return AppBar(
      title: const Text('Find CEP'),
    );
  }

  Widget get body {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          searchCepTextField,
          searchCepButton,
          resultContainer,
        ],
      ),
    );
  }

  Widget get searchCepTextField {
    return TextField(
      controller: _searchCepController,
      autofocus: true,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(labelText: 'Type CEP'),
      enabled: _enableField,
    );
  }

  Widget get searchCepButton {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: !_loading ? ElevatedButton(
        onPressed: () => _searchCep(),
        child: const Text('Find'),
      ) : const CircularProgressIndicator(),
    );
  }

  Widget get resultContainer {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Text(_result ?? ''),
    );
  }

  void _searching(bool enable) => setState(() {
      _result = enable ? '' : _result;
      _loading = enable;
      _enableField = !enable;
    });

  Future _searchCep() async {
    _searching(true);
    final cep = _searchCepController.text;
    final resultCep = await CepService.fetchCep(cepNumber: cep);
    setState(() => _result = resultCep.toJson().toString());
    _searching(false);
  }
}
