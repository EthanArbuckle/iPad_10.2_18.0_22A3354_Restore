@implementation CRCTCTextDecoderV3

- (CVNLPTextDecodingPruningPolicy)pruningPolicy
{
  *(_OWORD *)&retstr->var0 = xmmword_1D513AD08;
  *(_QWORD *)&retstr->var3 = 10;
  return self;
}

+ (id)lmSupportedLanguages
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  _QWORD v9[12];
  _QWORD v10[15];

  v10[14] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("en-US");
  v10[1] = CFSTR("fr-FR");
  v10[2] = CFSTR("it-IT");
  v10[3] = CFSTR("de-DE");
  v10[4] = CFSTR("es-ES");
  v10[5] = CFSTR("pt-BR");
  v10[6] = CFSTR("ru-RU");
  v10[7] = CFSTR("uk-UA");
  v10[8] = CFSTR("ko-KR");
  v10[9] = CFSTR("ja-JP");
  v10[10] = CFSTR("th-TH");
  v10[11] = CFSTR("vi-VT");
  v10[12] = CFSTR("ar-SA");
  v10[13] = CFSTR("ars-SA");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    v9[0] = CFSTR("tr-TR");
    v9[1] = CFSTR("id-ID");
    v9[2] = CFSTR("cs-CZ");
    v9[3] = CFSTR("da-DK");
    v9[4] = CFSTR("nl-NL");
    v9[5] = CFSTR("no-NO");
    v9[6] = CFSTR("nn-NO");
    v9[7] = CFSTR("nb-NO");
    v9[8] = CFSTR("ms-MY");
    v9[9] = CFSTR("pl-PL");
    v9[10] = CFSTR("ro-RO");
    v9[11] = CFSTR("sv-SE");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 12);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  if (_os_feature_enabled_impl())
  {
    v8[0] = CFSTR("zh-Hans");
    v8[1] = CFSTR("zh-Hant");
    v8[2] = CFSTR("yue-Hans");
    v8[3] = CFSTR("yue-Hant");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v6;
  }
  return v2;
}

@end
