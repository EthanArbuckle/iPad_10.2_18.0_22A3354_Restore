@implementation MTSchemaMTLocalePair(LTTranslationAdditions)

+ (id)lt_initWithLocalePair:()LTTranslationAdditions
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BE95268];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "sourceLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSourceLocale:", convertFromNSLocale(v6));

  objc_msgSend(v4, "targetLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTargetLocale:", convertFromNSLocale(v7));
  return v5;
}

@end
