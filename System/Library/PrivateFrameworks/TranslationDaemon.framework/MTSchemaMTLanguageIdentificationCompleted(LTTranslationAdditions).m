@implementation MTSchemaMTLanguageIdentificationCompleted(LTTranslationAdditions)

+ (id)lt_initWithInputSource:()LTTranslationAdditions topLocale:lowConfidenceLocales:
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;

  v7 = a4;
  v8 = (objc_class *)MEMORY[0x24BE95258];
  v9 = a5;
  v10 = objc_alloc_init(v8);
  v11 = v10;
  if (a3 <= 4)
    objc_msgSend(v10, "setInputSource:", a3);
  objc_msgSend(v11, "setTopLocale:", convertFromNSLocale(v7));
  objc_msgSend(v11, "setLidConfidences:", v9);

  return v11;
}

@end
