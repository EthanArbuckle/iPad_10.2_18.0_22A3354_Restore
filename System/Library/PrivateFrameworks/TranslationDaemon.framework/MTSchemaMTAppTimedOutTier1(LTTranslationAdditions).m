@implementation MTSchemaMTAppTimedOutTier1(LTTranslationAdditions)

+ (id)lt_initWithPayload:()LTTranslationAdditions localePair:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x24BE951F8];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setTranslationPayload:", v7);

  objc_msgSend(MEMORY[0x24BE95268], "lt_initWithLocalePair:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLocalePair:", v9);
  return v8;
}

@end
