@implementation PRLanguage

+ (id)supportedKeyboardLanguages
{
  return &unk_1EA8E72B8;
}

+ (id)dataBundle
{
  id v2;

  v2 = (id)_dataBundle;
  if (!_dataBundle)
  {
    v2 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    _dataBundle = (uint64_t)v2;
  }
  return v2;
}

+ (id)localizationsForLanguage:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = objc_msgSend((id)objc_msgSend(a1, "dataBundle"), "localizations");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("American English")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("AmericanEnglish")) & 1) != 0)
  {
    a3 = CFSTR("en_US");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Australian English")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("AustralianEnglish")) & 1) != 0)
  {
    a3 = CFSTR("en_AU");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Canadian English")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("CanadianEnglish")) & 1) != 0)
  {
    a3 = CFSTR("en_CA");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("British English")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("BritishEnglish")) & 1) != 0)
  {
    a3 = CFSTR("en_GB");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Indian English")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("IndianEnglish")) & 1) != 0)
  {
    a3 = CFSTR("en_IN");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Singapore English")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("SingaporeEnglish")) & 1) != 0)
  {
    a3 = CFSTR("en_SG");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Japanese English")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("JapaneseEnglish")) & 1) != 0)
  {
    a3 = CFSTR("en_JP");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Chinese English")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("ChineseEnglish")) & 1) != 0)
  {
    a3 = CFSTR("en_CN");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("New Zealand English")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("NewZealandEnglish")) & 1) != 0)
  {
    a3 = CFSTR("en_NZ");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("South African English")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("SouthAfricanEnglish")) & 1) != 0)
  {
    a3 = CFSTR("en_ZA");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Swiss German")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("SwissGerman")) & 1) != 0)
  {
    a3 = CFSTR("de_CH");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Brazilian Portuguese")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("BrazilianPortuguese")) & 1) != 0)
  {
    a3 = CFSTR("pt_BR");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("European Portuguese")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("EuropeanPortuguese")) & 1) != 0)
  {
    a3 = CFSTR("pt_PT");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Norwegian Bokmål")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("NorwegianBokmål")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("Bokmål")) & 1) != 0)
  {
    a3 = CFSTR("nb");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Norwegian Nynorsk")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("NorwegianNynorsk")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("Nynorsk")) & 1) != 0)
  {
    a3 = CFSTR("nn");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Irish Gaelic")) & 1) != 0
         || objc_msgSend(a3, "isEqualToString:", CFSTR("IrishGaelic")))
  {
    a3 = CFSTR("ga");
  }
  if (v4
    && (v5 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3),
        (v6 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:forPreferences:", v4, v5)) != 0)
    && ((v7 = v6, !objc_msgSend(v6, "count"))
     || (objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 0), "isEqualToString:", CFSTR("English")) & 1) == 0
     && !objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 0), "isEqualToString:", CFSTR("en"))
     || (objc_msgSend(a3, "isEqualToString:", CFSTR("English")) & 1) != 0
     || (objc_msgSend(a3, "isEqualToString:", CFSTR("en")) & 1) != 0
     || (objc_msgSend(a3, "hasPrefix:", CFSTR("en_")) & 1) != 0
     || (objc_msgSend(a3, "hasPrefix:", CFSTR("en-")) & 1) != 0))
  {
    return v7;
  }
  else
  {
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3);
  }
}

+ (id)localizationForLanguage:(id)a3
{
  id result;
  id v6;

  if (localizationForLanguage__onceToken != -1)
    dispatch_once(&localizationForLanguage__onceToken, &__block_literal_global_3);
  result = (id)objc_msgSend((id)localizationForLanguage__localizationDict, "objectForKey:", a3);
  if (!result)
  {
    result = (id)objc_msgSend(a1, "localizationsForLanguage:", a3);
    if (result)
    {
      v6 = result;
      result = (id)objc_msgSend(result, "count");
      if (result)
        result = (id)objc_msgSend(v6, "objectAtIndex:", 0);
    }
  }
  if (!result)
    return a3;
  return result;
}

uint64_t __38__PRLanguage_localizationForLanguage___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("English"), CFSTR("en"), CFSTR("en"), CFSTR("en"), CFSTR("en_US"), CFSTR("en_GB"), CFSTR("en_GB"), CFSTR("en_CA"), CFSTR("en_CA"), CFSTR("en_AU"), CFSTR("en_AU"), CFSTR("en_IN"), CFSTR("en_IN"), CFSTR("en_SG"), CFSTR("en_SG"), CFSTR("en_JP"), CFSTR("en_JP"),
             CFSTR("en_CN"),
             CFSTR("en_CN"),
             CFSTR("en_NZ"),
             CFSTR("en_NZ"),
             CFSTR("en_ZA"),
             CFSTR("en_ZA"),
             CFSTR("fr"),
             CFSTR("French"),
             CFSTR("fr"),
             CFSTR("fr"),
             CFSTR("fr"),
             CFSTR("fr_FR"),
             CFSTR("fr"),
             CFSTR("fr_CA"),
             CFSTR("fr"),
             CFSTR("fr_CH"),
             CFSTR("de"),
             CFSTR("German"),
             CFSTR("de"),
             CFSTR("de"),
             CFSTR("de"),
             CFSTR("de_DE"),
             CFSTR("de"),
             CFSTR("de_AT"),
             CFSTR("de"),
             CFSTR("de_CH"),
             CFSTR("it"),
             CFSTR("Italian"),
             CFSTR("it"),
             CFSTR("it"),
             CFSTR("it"),
             CFSTR("it_IT"),
             CFSTR("es"),
             CFSTR("Spanish"),
             CFSTR("es"),
             CFSTR("es"),
             CFSTR("es"),
             CFSTR("es_ES"),
             CFSTR("es_MX"),
             CFSTR("es_MX"),
             CFSTR("pt_BR"),
             CFSTR("Portuguese"),
             CFSTR("pt_BR"),
             CFSTR("pt"));
  localizationForLanguage__localizationDict = result;
  return result;
}

+ (id)fallbackLocalizationForLanguage:(id)a3
{
  id result;
  id v6;

  if (fallbackLocalizationForLanguage__onceToken != -1)
    dispatch_once(&fallbackLocalizationForLanguage__onceToken, &__block_literal_global_396);
  result = (id)objc_msgSend((id)fallbackLocalizationForLanguage__localizationDict, "objectForKey:", a3);
  if (!result)
  {
    result = (id)objc_msgSend(a1, "localizationsForLanguage:", a3);
    if (result)
    {
      v6 = result;
      if ((unint64_t)objc_msgSend(result, "count") < 2)
        result = 0;
      else
        result = (id)objc_msgSend(v6, "objectAtIndex:", 1);
    }
  }
  if (!result)
    return a3;
  return result;
}

uint64_t __46__PRLanguage_fallbackLocalizationForLanguage___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("English"), CFSTR("en"), CFSTR("en"), CFSTR("en"), CFSTR("en_US"), CFSTR("en"), CFSTR("en_GB"), CFSTR("en"), CFSTR("en_CA"), CFSTR("en"), CFSTR("en_AU"), CFSTR("en"), CFSTR("en_IN"), CFSTR("en"), CFSTR("en_SG"), CFSTR("en"), CFSTR("en_JP"),
             CFSTR("en"),
             CFSTR("en_CN"),
             CFSTR("en"),
             CFSTR("en_NZ"),
             CFSTR("en"),
             CFSTR("en_ZA"),
             CFSTR("fr"),
             CFSTR("French"),
             CFSTR("fr"),
             CFSTR("fr"),
             CFSTR("fr"),
             CFSTR("fr_FR"),
             CFSTR("fr"),
             CFSTR("fr_CA"),
             CFSTR("fr"),
             CFSTR("fr_CH"),
             CFSTR("de"),
             CFSTR("German"),
             CFSTR("de"),
             CFSTR("de"),
             CFSTR("de"),
             CFSTR("de_DE"),
             CFSTR("de"),
             CFSTR("de_AT"),
             CFSTR("de"),
             CFSTR("de_CH"),
             CFSTR("it"),
             CFSTR("Italian"),
             CFSTR("it"),
             CFSTR("it"),
             CFSTR("it"),
             CFSTR("it_IT"),
             CFSTR("es"),
             CFSTR("Spanish"),
             CFSTR("es"),
             CFSTR("es"),
             CFSTR("es"),
             CFSTR("es_ES"),
             CFSTR("es"),
             CFSTR("es_MX"),
             CFSTR("pt"),
             CFSTR("Portuguese"),
             CFSTR("pt"),
             CFSTR("pt"));
  fallbackLocalizationForLanguage__localizationDict = result;
  return result;
}

+ (id)languageModelLocalizationForLanguage:(id)a3
{
  id result;

  if (languageModelLocalizationForLanguage__onceToken != -1)
    dispatch_once(&languageModelLocalizationForLanguage__onceToken, &__block_literal_global_397);
  result = (id)objc_msgSend((id)languageModelLocalizationForLanguage__localizationDict, "objectForKey:", a3);
  if (!result)
    return a3;
  return result;
}

uint64_t __51__PRLanguage_languageModelLocalizationForLanguage___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("English"), CFSTR("en_US"), CFSTR("en"), CFSTR("en_US"), CFSTR("en_US"), CFSTR("en_GB"), CFSTR("en_GB"), CFSTR("en_CA"), CFSTR("en_CA"), CFSTR("en_AU"), CFSTR("en_AU"), CFSTR("en_IN"), CFSTR("en_IN"), CFSTR("en_SG"), CFSTR("en_SG"), CFSTR("en_JP"), CFSTR("en_JP"),
             CFSTR("en_US"),
             CFSTR("en_CN"),
             CFSTR("en_NZ"),
             CFSTR("en_NZ"),
             CFSTR("en_ZA"),
             CFSTR("en_ZA"),
             CFSTR("fr_FR"),
             CFSTR("French"),
             CFSTR("fr_FR"),
             CFSTR("fr"),
             CFSTR("fr_FR"),
             CFSTR("fr_FR"),
             CFSTR("fr_CA"),
             CFSTR("fr_CA"),
             CFSTR("fr_CH"),
             CFSTR("fr_CH"),
             CFSTR("fr_BE"),
             CFSTR("fr_BE"),
             CFSTR("de"),
             CFSTR("German"),
             CFSTR("de"),
             CFSTR("de"),
             CFSTR("de"),
             CFSTR("de_DE"),
             CFSTR("de"),
             CFSTR("de_AT"),
             CFSTR("de"),
             CFSTR("de_CH"),
             CFSTR("it"),
             CFSTR("Italian"),
             CFSTR("it"),
             CFSTR("it"),
             CFSTR("it"),
             CFSTR("it_IT"),
             CFSTR("es_ES"),
             CFSTR("Spanish"),
             CFSTR("es_ES"),
             CFSTR("es"),
             CFSTR("es_ES"),
             CFSTR("es_ES"),
             CFSTR("es_MX"),
             CFSTR("es_MX"),
             CFSTR("pt_BR"),
             CFSTR("Portuguese"));
  languageModelLocalizationForLanguage__localizationDict = result;
  return result;
}

+ (id)languageModelFallbackLocalizationForLanguage:(id)a3
{
  id result;

  if (languageModelFallbackLocalizationForLanguage__onceToken != -1)
    dispatch_once(&languageModelFallbackLocalizationForLanguage__onceToken, &__block_literal_global_400);
  result = (id)objc_msgSend((id)languageModelFallbackLocalizationForLanguage__localizationDict, "objectForKey:", a3);
  if (!result)
    return a3;
  return result;
}

uint64_t __59__PRLanguage_languageModelFallbackLocalizationForLanguage___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("English"), CFSTR("en"), CFSTR("en"), CFSTR("en"), CFSTR("en_US"), CFSTR("en"), CFSTR("en_GB"), CFSTR("en"), CFSTR("en_CA"), CFSTR("en"), CFSTR("en_AU"), CFSTR("en"), CFSTR("en_IN"), CFSTR("en"), CFSTR("en_SG"), CFSTR("en"), CFSTR("en_JP"),
             CFSTR("en"),
             CFSTR("en_CN"),
             CFSTR("en"),
             CFSTR("en_NZ"),
             CFSTR("en"),
             CFSTR("en_ZA"),
             CFSTR("fi"),
             CFSTR("Finnish"),
             CFSTR("fi"),
             CFSTR("fi"),
             CFSTR("fi"),
             CFSTR("fi_FI"),
             CFSTR("fr_FR"),
             CFSTR("French"),
             CFSTR("fr_FR"),
             CFSTR("fr"),
             CFSTR("fr_FR"),
             CFSTR("fr_FR"),
             CFSTR("fr_FR"),
             CFSTR("fr_CA"),
             CFSTR("fr_FR"),
             CFSTR("fr_CH"),
             CFSTR("de"),
             CFSTR("German"),
             CFSTR("de"),
             CFSTR("de"),
             CFSTR("de"),
             CFSTR("de_DE"),
             CFSTR("de"),
             CFSTR("de_AT"),
             CFSTR("de"),
             CFSTR("de_CH"),
             CFSTR("it"),
             CFSTR("Italian"),
             CFSTR("it"),
             CFSTR("it"),
             CFSTR("it"),
             CFSTR("it_IT"),
             CFSTR("es"),
             CFSTR("Spanish"),
             CFSTR("es"),
             CFSTR("es"),
             CFSTR("es"),
             CFSTR("es_ES"));
  languageModelFallbackLocalizationForLanguage__localizationDict = result;
  return result;
}

+ (id)textInputModeForLanguage:(id)a3
{
  id result;

  if (textInputModeForLanguage__onceToken != -1)
    dispatch_once(&textInputModeForLanguage__onceToken, &__block_literal_global_401);
  result = (id)objc_msgSend((id)textInputModeForLanguage__textInputModeDict, "objectForKey:", a3);
  if (!result)
    return a3;
  return result;
}

uint64_t __39__PRLanguage_textInputModeForLanguage___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("English"), CFSTR("en_US"), CFSTR("en"), CFSTR("en_US"), CFSTR("en_US"), CFSTR("en_GB"), CFSTR("en_GB"), CFSTR("en_CA"), CFSTR("en_CA"), CFSTR("en_AU"), CFSTR("en_AU"), CFSTR("en_IN"), CFSTR("en_IN"), CFSTR("en_SG"), CFSTR("en_SG"), CFSTR("en_JP"), CFSTR("en_JP"),
             CFSTR("en_US"),
             CFSTR("en_CN"),
             CFSTR("en_NZ"),
             CFSTR("en_NZ"),
             CFSTR("en_ZA"),
             CFSTR("en_ZA"),
             CFSTR("fr_FR"),
             CFSTR("French"),
             CFSTR("fr_FR"),
             CFSTR("fr"),
             CFSTR("fr_FR"),
             CFSTR("fr_FR"),
             CFSTR("fr_CA"),
             CFSTR("fr_CA"),
             CFSTR("fr_CH"),
             CFSTR("fr_CH"),
             CFSTR("de_DE"),
             CFSTR("German"),
             CFSTR("de_DE"),
             CFSTR("de"),
             CFSTR("de_DE"),
             CFSTR("de_DE"),
             CFSTR("de_AT"),
             CFSTR("de_AT"),
             CFSTR("de_CH"),
             CFSTR("de_CH"),
             CFSTR("it_IT"),
             CFSTR("Italian"),
             CFSTR("it_IT"),
             CFSTR("it"),
             CFSTR("it_IT"),
             CFSTR("it_IT"),
             CFSTR("es_ES"),
             CFSTR("Spanish"),
             CFSTR("es_ES"),
             CFSTR("es"),
             CFSTR("es_ES"),
             CFSTR("es_ES"),
             CFSTR("es_MX"),
             CFSTR("es_MX"),
             CFSTR("pt_BR"),
             CFSTR("Portuguese"),
             CFSTR("pt_BR"),
             CFSTR("pt"));
  textInputModeForLanguage__textInputModeDict = result;
  return result;
}

+ (unint64_t)orthographyIndexForLanguageCode:(unsigned __int8)a3
{
  if ((a3 - 1) > 0x24)
    return 0;
  else
    return qword_1DE2EF878[(char)(a3 - 1)];
}

+ (unint64_t)orthographyIndexForOtherLanguage:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Amharic")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("am")) & 1) != 0)
  {
    return 244;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Najdi Arabic")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("ars")) & 1) != 0)
  {
    return 160;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Armenian")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("hy")) & 1) != 0)
  {
    return 226;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Bengali")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("bn")) & 1) != 0)
  {
    return 230;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Burmese")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("Myanmar")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("my")) & 1) != 0)
  {
    return 242;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Cherokee")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("chr")) & 1) != 0)
  {
    return 245;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Croatian")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("hr")) & 1) != 0)
  {
    return 40;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Georgian")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("ka")) & 1) != 0)
  {
    return 243;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Gujarati")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("gu")) & 1) != 0)
  {
    return 232;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Hindi")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("hi")) & 1) != 0)
  {
    return 192;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Icelandic")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("is")) & 1) != 0)
  {
    return 18;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Indonesian")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("id")) & 1) != 0)
  {
    return 74;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Inuktitut")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("iu")) & 1) != 0)
  {
    return 208;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Kannada")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("kn")) & 1) != 0)
  {
    return 236;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Kazakh")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("kk")) & 1) != 0)
  {
    return 138;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Khmer")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("kh")) & 1) != 0)
  {
    return 247;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Lao")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("lo")) & 1) != 0)
  {
    return 240;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Malayalam")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("ml")) & 1) != 0)
  {
    return 237;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Marathi")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("mr")) & 1) != 0)
  {
    return 193;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Mongolian")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("mn")) & 1) != 0)
  {
    return 248;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Norwegian Nynorsk")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("NorwegianNynorsk")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("Nynorsk")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("nn")) & 1) != 0)
  {
    return 16;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Oriya")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("or")) & 1) != 0)
  {
    return 233;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Persian")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("Farsi")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("fa")) & 1) != 0)
  {
    return 161;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Punjabi")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("pa")) & 1) != 0)
  {
    return 231;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Sinhalese")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("si")) & 1) != 0)
  {
    return 238;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Slovak")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("sk")) & 1) != 0)
  {
    return 46;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Tamil")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("ta")) & 1) != 0)
  {
    return 234;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Telugu")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("te")) & 1) != 0)
  {
    return 235;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Tibetan")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("bo")) & 1) != 0)
  {
    return 241;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Ukrainian")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("uk")) & 1) != 0)
  {
    return 129;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Urdu")) & 1) != 0
    || objc_msgSend(a3, "hasPrefix:", CFSTR("ur")))
  {
    return 162;
  }
  return 0;
}

+ (unsigned)encodingForOrthographyIndex:(unint64_t)a3
{
  unsigned int result;

  result = 1280;
  if ((uint64_t)a3 > 47)
  {
    if ((uint64_t)a3 <= 73)
    {
      if (a3 == 48)
        return result;
      if (a3 == 55)
        return 1284;
    }
    else
    {
      if (a3 == 74)
        return result;
      if (a3 == 128 || a3 == 130)
        return 517;
    }
    return 134217984;
  }
  switch(a3)
  {
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x16uLL:
    case 0x22uLL:
      return result;
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
      result = 514;
      break;
    default:
      return 134217984;
  }
  return result;
}

+ (void)getCodesForLanguage:(id)a3 languageCode:(char *)a4 languageDialect:(char *)a5 languageMode:(char *)a6 orthographyIndex:(unint64_t *)a7 encoding:(unsigned int *)a8
{
  char v15;
  char v16;
  uint64_t v17;
  unint64_t v18;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("English")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("en")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("American English")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("AmericanEnglish")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("en_US")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("en-US")) & 1) != 0)
  {
    goto LABEL_7;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Indian English")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("IndianEnglish")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("en_IN")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("Singapore English")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("SingaporeEnglish")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("en_SG")) & 1) != 0)
  {
LABEL_28:
    v16 = 0;
    v15 = 64;
    goto LABEL_8;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Japanese English")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("JapaneseEnglish")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("en_JP")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("Chinese English")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("ChineseEnglish")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("en_CN")) & 1) != 0)
  {
    goto LABEL_7;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Australian English")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("AustralianEnglish")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("en_AU")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("en-AU")) & 1) != 0)
  {
    goto LABEL_28;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Canadian English")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("CanadianEnglish")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("en_CA")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("en-CA")) & 1) != 0)
  {
    v16 = 0;
    v15 = 32;
    goto LABEL_8;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("New Zealand English")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("NewZealandEnglish")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("en_NZ")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("South African English")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("SouthAfricanEnglish")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("en_ZA")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("British English")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("BritishEnglish")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("en")) & 1) != 0)
  {
    goto LABEL_28;
  }
  if ((objc_msgSend(a3, "hasPrefix:", CFSTR("en")) & 1) != 0)
  {
LABEL_7:
    v15 = 0;
    v16 = 0;
LABEL_8:
    v17 = 16;
    goto LABEL_9;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Swiss German")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("SwissGerman")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("de_CH")) & 1) != 0)
  {
    v16 = 0;
    v15 = 64;
LABEL_58:
    v17 = 6;
    goto LABEL_9;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("German")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("de")) & 1) != 0)
  {
    v16 = 0;
    v15 = 0x80;
    goto LABEL_58;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Brazilian Portuguese")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("BrazilianPortuguese")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("pt_BR")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("pt-BR")) & 1) != 0)
  {
    v16 = 0;
    v15 = 64;
LABEL_67:
    v17 = 12;
    goto LABEL_9;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("European Portuguese")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("EuropeanPortuguese")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("pt_PT")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("pt-PT")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("Portuguese")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("pt")) & 1) != 0)
  {
    v16 = 0;
    v15 = 0x80;
    goto LABEL_67;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Arabic")) & 1) != 0
    || (objc_msgSend(a3, "hasPrefix:", CFSTR("ar")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 20;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Bulgarian")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("bg")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 25;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Catalan")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("ca")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0x80;
    v17 = 3;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Czech")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("cs")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 1;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Danish")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("da")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 10;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Dutch")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("nl")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 11;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Finnish")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("fi")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 14;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("French")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("fr")) & 1) != 0)
  {
    v15 = 0;
    v16 = 96;
    v17 = 5;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Greek")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("el")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 15;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Hebrew")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("he")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 22;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Hungarian")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("hu")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 4;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Italian")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("it")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 9;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Korean")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("ko")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 29;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Norwegian")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("Norwegian Nynorsk")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("NorwegianNynorsk")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("Nynorsk")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("nb")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 13;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Polish")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("pl")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 18;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Russian")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("ru")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0x80;
    v17 = 2;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Spanish")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("es")) & 1) != 0)
  {
    v15 = 0;
    v16 = 64;
    v17 = 8;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Swedish")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("sv")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 7;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Thai")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("th")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 35;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Turkish")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("tr")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 28;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Vietnamese")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("vi")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 36;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Irish Gaelic")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("IrishGaelic")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("Gaelic")) & 1) != 0
         || (objc_msgSend(a3, "hasPrefix:", CFSTR("ga")) & 1) != 0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 21;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Romanian")) & 1) != 0
         || objc_msgSend(a3, "hasPrefix:", CFSTR("ro")))
  {
    v15 = 0;
    v16 = 0;
    v17 = 34;
  }
  else
  {
    v17 = 0;
    v15 = 0;
    v16 = 0;
  }
LABEL_9:
  v18 = objc_msgSend(a1, "orthographyIndexForLanguageCode:", v17);
  if (!v18)
    v18 = objc_msgSend(a1, "orthographyIndexForOtherLanguage:", a3);
  if (a4)
    *a4 = v17;
  if (a5)
    *a5 = v15;
  if (a6)
    *a6 = v16;
  if (a7)
    *a7 = v18;
  if (a8)
    *a8 = objc_msgSend(a1, "encodingForOrthographyIndex:", v18);
}

+ (id)supportedLanguages
{
  return &unk_1EA8E72A0;
}

+ (id)supportedAssetLanguages
{
  return &unk_1EA8E72D0;
}

+ (id)supportedLocalizations
{
  return &unk_1EA8E72E8;
}

+ (id)supportedAssetLexiconLanguages
{
  return &unk_1EA8E7300;
}

+ (id)supportedCompletionLanguages
{
  return &unk_1EA8E7318;
}

+ (id)supportedSingleCompletionLanguages
{
  return &unk_1EA8E7330;
}

+ (id)supportedLatinLanguages
{
  return &unk_1EA8E7348;
}

+ (id)supportedNonLatinLanguages
{
  return &unk_1EA8E7360;
}

+ (id)supportedCyrillicLanguages
{
  return &unk_1EA8E7378;
}

+ (id)supportedArabicLanguages
{
  return &unk_1EA8E7390;
}

+ (id)supportedDevanagariLanguages
{
  return &unk_1EA8E73A8;
}

+ (id)supportedTransliterationLanguages
{
  return &unk_1EA8E73C0;
}

+ (id)supportedSpellingFallbackLanguages
{
  return &unk_1EA8E73D8;
}

+ (id)cyrillicLanguages
{
  return &unk_1EA8E73F0;
}

+ (id)arabicLanguages
{
  return &unk_1EA8E7408;
}

+ (id)devanagariLanguages
{
  return &unk_1EA8E7420;
}

+ (id)transliterationLocalizationForLanguage:(id)a3
{
  void *v4;

  v4 = (void *)baseLanguageForLanguage((uint64_t)a3);
  if (objc_msgSend((id)objc_msgSend(a1, "supportedTransliterationLanguages"), "containsObject:", v4))
    return (id)objc_msgSend(v4, "stringByAppendingString:", CFSTR("_Latn"));
  else
    return 0;
}

+ (id)spellingFallbackLocalizationForLanguage:(id)a3
{
  uint64_t v4;

  v4 = baseLanguageForLanguage((uint64_t)a3);
  if (!objc_msgSend((id)objc_msgSend(a1, "supportedSpellingFallbackLanguages"), "containsObject:", v4))
    return 0;
  if (objc_msgSend((id)objc_msgSend(a1, "supportedTransliterationLanguages"), "containsObject:", v4))
    return CFSTR("en_IN");
  return CFSTR("en_US");
}

+ (id)supportedEnglishLocalizationAdditions
{
  return &unk_1EA8E74F8;
}

+ (id)englishLocalizationAdditionForLanguage:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "supportedEnglishLocalizationAdditions"), "objectForKey:", baseLanguageForLanguage((uint64_t)a3));
}

+ (id)languagesUsingOrdinalPeriod
{
  return &unk_1EA8E7438;
}

+ (id)languagesUsingSentencePieceModel
{
  return &unk_1EA8E7450;
}

+ (id)languagesUsingUnigramProbabilities
{
  return &unk_1EA8E7468;
}

+ (id)languageObjectWithIdentifier:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:", a3);
}

- (PRLanguage)initWithIdentifier:(id)a3
{
  PRLanguage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRLanguage;
  v4 = -[PRLanguage init](&v6, sel_init);
  if (v4)
  {
    v4->_identifier = (NSString *)objc_msgSend(a3, "copy");
    v4->_localization = (NSString *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "localizationForLanguage:", a3), "copy");
    v4->_fallbackLocalization = (NSString *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "fallbackLocalizationForLanguage:", a3), "copy");
    objc_msgSend((id)objc_opt_class(), "getCodesForLanguage:languageCode:languageDialect:languageMode:orthographyIndex:encoding:", a3, &v4->_languageCode, &v4->_languageDialect, &v4->_languageMode, &v4->_orthoIndex, &v4->_encoding);
  }
  return v4;
}

- (unint64_t)hash
{
  return objc_msgSend(-[PRLanguage identifier](self, "identifier"), "hash");
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return objc_msgSend(-[PRLanguage identifier](self, "identifier"), "isEqual:", objc_msgSend(a3, "identifier"));
  }
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRLanguage;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@<%@>"), -[PRLanguage description](&v3, sel_description), -[PRLanguage identifier](self, "identifier"));
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("PRLanguage requires keyed coding"), 0));
  objc_msgSend(a3, "encodeObject:forKey:", -[PRLanguage identifier](self, "identifier"), CFSTR("PRIdentifier"));
}

- (PRLanguage)initWithCoder:(id)a3
{
  PRLanguage *result;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("PRLanguage requires keyed coding"), 0));
  result = (PRLanguage *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PRIdentifier"));
  if (result)
    return -[PRLanguage initWithIdentifier:](self, "initWithIdentifier:", result);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRLanguage;
  -[PRLanguage dealloc](&v3, sel_dealloc);
}

- (id)identifier
{
  return self->_identifier;
}

- (id)localization
{
  return self->_localization;
}

- (id)fallbackLocalization
{
  return self->_fallbackLocalization;
}

- (id)languageModelLocalization
{
  return (id)objc_msgSend((id)objc_opt_class(), "languageModelLocalizationForLanguage:", -[PRLanguage identifier](self, "identifier"));
}

- (id)languageModelFallbackLocalization
{
  return (id)objc_msgSend((id)objc_opt_class(), "languageModelFallbackLocalizationForLanguage:", -[PRLanguage identifier](self, "identifier"));
}

- (id)transliterationLocalization
{
  return (id)objc_msgSend((id)objc_opt_class(), "transliterationLocalizationForLanguage:", -[PRLanguage identifier](self, "identifier"));
}

- (id)spellingFallbackLocalization
{
  return (id)objc_msgSend((id)objc_opt_class(), "spellingFallbackLocalizationForLanguage:", -[PRLanguage identifier](self, "identifier"));
}

- (unsigned)encoding
{
  return self->_encoding;
}

- (unint64_t)orthographyIndex
{
  return self->_orthoIndex;
}

- (unsigned)languageCode
{
  return self->_languageCode;
}

- (unsigned)languageDialect
{
  return self->_languageDialect;
}

- (unsigned)languageMode
{
  return self->_languageMode;
}

- (const)oneLetterWords
{
  const char *result;

  result = 0;
  switch(self->_orthoIndex)
  {
    case 6uLL:
      result = englishOneLetterWords[0];
      break;
    case 7uLL:
      result = frenchOneLetterWords;
      break;
    case 9uLL:
      result = (const char *)italianOneLetterWords;
      break;
    case 0xAuLL:
      result = (const char *)spanishOneLetterWords;
      break;
    default:
      return result;
  }
  return result;
}

- (const)twoLetterWords
{
  unint64_t orthoIndex;
  const char *result;

  orthoIndex = self->_orthoIndex;
  switch(orthoIndex)
  {
    case 6uLL:
      result = englishTwoLetterWords[0];
      break;
    case 7uLL:
      result = (const char *)frenchTwoLetterWords;
      break;
    case 8uLL:
      result = (const char *)germanTwoLetterWords;
      break;
    case 9uLL:
      result = (const char *)italianTwoLetterWords;
      break;
    case 0xAuLL:
      result = (const char *)spanishTwoLetterWords;
      break;
    case 0xBuLL:
      result = (const char *)portugueseTwoLetterWords;
      break;
    case 0xCuLL:
      result = (const char *)dutchTwoLetterWords;
      break;
    case 0xDuLL:
      result = (const char *)danishTwoLetterWords;
      break;
    case 0xEuLL:
      result = (const char *)swedishTwoLetterWords;
      break;
    case 0xFuLL:
      result = (const char *)norwegianTwoLetterWords;
      break;
    case 0x10uLL:
      result = (const char *)nynorskTwoLetterWords;
      break;
    default:
      if (orthoIndex == 48)
      {
        result = (const char *)finnishTwoLetterWords;
      }
      else if (orthoIndex == 55)
      {
        result = (const char *)turkishTwoLetterWords;
      }
      else
      {
        result = 0;
      }
      break;
  }
  return result;
}

- (const)accents
{
  const char *result;
  unint64_t orthoIndex;

  result = 0;
  orthoIndex = self->_orthoIndex;
  switch(orthoIndex)
  {
    case 7uLL:
      result = (const char *)frenchAccents;
      break;
    case 8uLL:
      result = (const char *)germanAccents;
      break;
    case 9uLL:
      result = (const char *)italianAccents;
      break;
    case 0xAuLL:
      result = (const char *)spanishAccents;
      break;
    case 0xBuLL:
      result = (const char *)portugueseAccents;
      break;
    case 0xCuLL:
      return result;
    case 0xDuLL:
      result = (const char *)danishAccents;
      break;
    case 0xEuLL:
      result = (const char *)swedishAccents;
      break;
    case 0xFuLL:
      result = (const char *)norwegianAccents;
      break;
    case 0x10uLL:
      result = (const char *)nynorskAccents;
      break;
    default:
      if (orthoIndex == 48)
      {
        result = (const char *)finnishAccents;
      }
      else if (orthoIndex == 55)
      {
        result = (const char *)turkishAccents;
      }
      break;
  }
  return result;
}

- (BOOL)isBicameral
{
  if (-[PRLanguage isArabic](self, "isArabic")
    || -[PRLanguage isHebrew](self, "isHebrew")
    || -[PRLanguage isHindi](self, "isHindi")
    || -[PRLanguage isKorean](self, "isKorean")
    || -[PRLanguage isPunjabi](self, "isPunjabi")
    || -[PRLanguage isTelugu](self, "isTelugu"))
  {
    return 0;
  }
  else
  {
    return !-[PRLanguage isThai](self, "isThai");
  }
}

- (BOOL)isSupportedAssetLexiconLanguage
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "supportedAssetLexiconLanguages");
  if ((objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(v3, "containsObject:", -[PRLanguage fallbackLocalization](self, "fallbackLocalization"));
}

- (BOOL)isSupportedCompletionLanguage
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "supportedCompletionLanguages");
  if ((objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(v3, "containsObject:", -[PRLanguage fallbackLocalization](self, "fallbackLocalization"));
}

- (BOOL)isSupportedSingleCompletionLanguage
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "supportedSingleCompletionLanguages");
  if ((objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(v3, "containsObject:", -[PRLanguage fallbackLocalization](self, "fallbackLocalization"));
}

- (BOOL)isSupportedLatinLanguage
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "supportedLatinLanguages");
  if ((objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(v3, "containsObject:", -[PRLanguage fallbackLocalization](self, "fallbackLocalization"));
}

- (BOOL)usesOrdinalPeriod
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "languagesUsingOrdinalPeriod");
  if ((objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(v3, "containsObject:", -[PRLanguage fallbackLocalization](self, "fallbackLocalization"));
}

- (BOOL)usesSentencePieceModel
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "languagesUsingSentencePieceModel");
  if ((objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(v3, "containsObject:", -[PRLanguage fallbackLocalization](self, "fallbackLocalization"));
}

- (BOOL)usesUnigramProbabilities
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "languagesUsingUnigramProbabilities");
  if ((objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(v3, "containsObject:", -[PRLanguage fallbackLocalization](self, "fallbackLocalization"));
}

- (BOOL)usesArabicScript
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "arabicLanguages");
  if ((objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(v3, "containsObject:", -[PRLanguage fallbackLocalization](self, "fallbackLocalization"));
}

- (BOOL)usesCyrillicScript
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "cyrillicLanguages");
  if ((objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(v3, "containsObject:", -[PRLanguage fallbackLocalization](self, "fallbackLocalization"));
}

- (BOOL)usesDevanagariScript
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "devanagariLanguages");
  if ((objc_msgSend(v3, "containsObject:", -[PRLanguage localization](self, "localization")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(v3, "containsObject:", -[PRLanguage fallbackLocalization](self, "fallbackLocalization"));
}

- (BOOL)isArabic
{
  return self->_orthoIndex == 160;
}

- (BOOL)isBengali
{
  return self->_orthoIndex == 230;
}

- (BOOL)isBulgarian
{
  return self->_orthoIndex == 130;
}

- (BOOL)isCatalan
{
  return self->_orthoIndex == 22;
}

- (BOOL)isCroatian
{
  return self->_orthoIndex == 40;
}

- (BOOL)isCzech
{
  return self->_orthoIndex == 41;
}

- (BOOL)isDanish
{
  return self->_orthoIndex == 13;
}

- (BOOL)isDutch
{
  return self->_orthoIndex == 12;
}

- (BOOL)isEnglish
{
  return self->_orthoIndex == 6;
}

- (BOOL)isFinnish
{
  return self->_orthoIndex == 48;
}

- (BOOL)isFrench
{
  return self->_orthoIndex == 7;
}

- (BOOL)isGerman
{
  return self->_orthoIndex == 8;
}

- (BOOL)isGreek
{
  return self->_orthoIndex == 224;
}

- (BOOL)isGujarati
{
  return self->_orthoIndex == 232;
}

- (BOOL)isHebrew
{
  return self->_orthoIndex == 227;
}

- (BOOL)isHindi
{
  return self->_orthoIndex == 192;
}

- (BOOL)isHungarian
{
  return self->_orthoIndex == 42;
}

- (BOOL)isIcelandic
{
  return self->_orthoIndex == 18;
}

- (BOOL)isIndonesian
{
  return self->_orthoIndex == 74;
}

- (BOOL)isIrishGaelic
{
  return self->_orthoIndex == 34;
}

- (BOOL)isItalian
{
  return self->_orthoIndex == 9;
}

- (BOOL)isKannada
{
  return self->_orthoIndex == 236;
}

- (BOOL)isKorean
{
  return self->_orthoIndex == 3;
}

- (BOOL)isKazakh
{
  return self->_orthoIndex == 138;
}

- (BOOL)isLithuanian
{
  return self->_orthoIndex == 51;
}

- (BOOL)isMalayalam
{
  return self->_orthoIndex == 237;
}

- (BOOL)isMarathi
{
  return self->_orthoIndex == 193;
}

- (BOOL)isNorwegian
{
  return self->_orthoIndex == 15;
}

- (BOOL)isNynorsk
{
  return self->_orthoIndex == 16;
}

- (BOOL)isPersian
{
  return self->_orthoIndex == 161;
}

- (BOOL)isPolish
{
  return self->_orthoIndex == 43;
}

- (BOOL)isPortuguese
{
  return self->_orthoIndex == 11;
}

- (BOOL)isPunjabi
{
  return self->_orthoIndex == 231;
}

- (BOOL)isRomanian
{
  return self->_orthoIndex == 44;
}

- (BOOL)isRussian
{
  return self->_orthoIndex == 128;
}

- (BOOL)isSlovak
{
  return self->_orthoIndex == 46;
}

- (BOOL)isSlovenian
{
  return self->_orthoIndex == 47;
}

- (BOOL)isSpanish
{
  return self->_orthoIndex == 10;
}

- (BOOL)isSwedish
{
  return self->_orthoIndex == 14;
}

- (BOOL)isTamil
{
  return self->_orthoIndex == 234;
}

- (BOOL)isTelugu
{
  return self->_orthoIndex == 235;
}

- (BOOL)isThai
{
  return self->_orthoIndex == 239;
}

- (BOOL)isTurkish
{
  return self->_orthoIndex == 55;
}

- (BOOL)isUkrainian
{
  return self->_orthoIndex == 129;
}

- (BOOL)isUrdu
{
  return self->_orthoIndex == 162;
}

- (BOOL)isVietnamese
{
  return self->_orthoIndex == 85;
}

@end
