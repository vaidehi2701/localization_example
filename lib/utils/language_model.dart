class LanguageModel {
  final String name;
  final String flag;
  final String languageCode;

  LanguageModel(this.name, this.flag, this.languageCode);

  static List<LanguageModel> languageList() {
    return <LanguageModel>[
      LanguageModel("English", "US", "en"),
      LanguageModel("हिंदी", "IN", "hi"),
    ];
  }
}
