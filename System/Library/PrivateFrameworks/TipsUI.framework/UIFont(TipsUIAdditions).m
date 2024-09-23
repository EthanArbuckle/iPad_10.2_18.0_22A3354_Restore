@implementation UIFont(TipsUIAdditions)

+ (id)TPSFontTallScript
{
  if (TPSFontTallScript_predicate[0] != -1)
    dispatch_once(TPSFontTallScript_predicate, &__block_literal_global_3);
  return (id)TPSFontTallScript_gTPSFontTallScript;
}

+ (id)TPSFontTallScriptSpecialCaseLanguageCodeTallScript
{
  if (TPSFontTallScriptSpecialCaseLanguageCodeTallScript_predicate != -1)
    dispatch_once(&TPSFontTallScriptSpecialCaseLanguageCodeTallScript_predicate, &__block_literal_global_34);
  return (id)TPSFontTallScriptSpecialCaseLanguageCodeTallScript_gTPSFontTallScriptSpecialCaseLanguageCodeTallScript;
}

+ (uint64_t)tps_fontWithSize:()TipsUIAdditions weight:languageCode:
{
  return objc_msgSend(a1, "tps_preferredFontForTextStyle:symoblicTraits:weight:size:languageCode:", *MEMORY[0x24BEBE1D0], 0, a3, a5, a4);
}

+ (uint64_t)tps_preferredFontForTextStyle:()TipsUIAdditions symoblicTraits:languageCode:
{
  return objc_msgSend(a1, "tps_preferredFontForTextStyle:symoblicTraits:weight:size:languageCode:", *MEMORY[0x24BEBB608], 0.0);
}

+ (id)tps_preferredFontForTextStyle:()TipsUIAdditions symoblicTraits:weight:size:languageCode:
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  float v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  _BYTE v35[157];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v12 = a7;
  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a5, a6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fontAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (v12
    || (objc_msgSend(MEMORY[0x24BDBCEA0], "tps_userPreferredLocalizations"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "firstObject"),
        v12 = (id)objc_claimAutoreleasedReturnValue(),
        v16,
        v12))
  {
    objc_msgSend(a1, "TPSFontTallScriptSpecialCaseLanguageCodeTallScript");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsObject:", v12);

    if ((v18 & 1) != 0)
    {
      v19 = 0.33;
    }
    else
    {
      v12 = objc_retainAutorelease(v12);
      objc_msgSend(v12, "UTF8String");
      uloc_addLikelySubtags();
      v20 = (void *)MEMORY[0x24BDBCEA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v35);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsFromLocaleIdentifier:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "TPSFontTallScript");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BDBD420]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "containsObject:", v24))
        v19 = 0.33;
      else
        v19 = 0.0;

    }
  }
  else
  {
    v19 = 0.0;
  }
  v25 = *MEMORY[0x24BEBB608];
  if (*MEMORY[0x24BEBB608] != a2)
  {
    v33 = *MEMORY[0x24BDC4E80];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, *MEMORY[0x24BDC4DE0]);

  }
  *(float *)&v25 = v19;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v28, *MEMORY[0x24BDC4D50]);

  v29 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(MEMORY[0x24BEBB528], "fontDescriptorWithFontAttributes:", v15);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "fontWithDescriptor:size:", v30, a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

@end
