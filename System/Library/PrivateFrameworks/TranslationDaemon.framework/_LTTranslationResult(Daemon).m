@implementation _LTTranslationResult(Daemon)

+ (id)passthroughResultWithString:()Daemon sanitizedString:locale:
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = (objc_class *)MEMORY[0x24BDF64A8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v7);
  objc_msgSend(v11, "setLocale:", v8);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6488]), "initWithFormattedString:sanitizedFormattedString:confidence:lowConfidence:romanization:tokens:preToPostITN:", v10, v9, 0, 0, 0, 0, 1000.0);
  v15[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslations:", v13);

  return v11;
}

+ (id)resultWithLocale:()Daemon translations:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BDF64A8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setLocale:", v7);

  objc_msgSend(v8, "setTranslations:", v6);
  objc_msgSend(v8, "setIdentifier:", CFSTR("NO_IDENTIFIER"));
  return v8;
}

@end
