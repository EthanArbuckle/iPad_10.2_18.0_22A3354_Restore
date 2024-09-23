@implementation MTSchemaMTInvocationStarted(LTTranslationAdditions)

+ (id)lt_initWithTask:()LTTranslationAdditions inputMode:invocationType:explicitLanguageFilterEnabled:onDevice:translateAppContext:
{
  id v13;
  id v14;
  void *v15;

  v13 = a8;
  v14 = objc_alloc_init(MEMORY[0x24BE95248]);
  objc_msgSend(v14, "setIsExplicitLanguageFilterEnabled:", a6);
  objc_msgSend(v14, "setIsOnDeviceTranslation:", a7);
  if (a3 <= 3)
    objc_msgSend(v14, "setTask:", a3);
  if (a4 <= 4)
    objc_msgSend(v14, "setInputSource:", a4);
  if (a5 <= 0xE)
    objc_msgSend(v14, "setInvocationType:", a5);
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BE951E0], "lt_initWithTranslateAppContext:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAppInvocationMetadata:", v15);

    objc_msgSend(v14, "setIsLanguageIdentificationEnabled:", objc_msgSend(v13, "languageIdentificationEnabled"));
  }

  return v14;
}

@end
