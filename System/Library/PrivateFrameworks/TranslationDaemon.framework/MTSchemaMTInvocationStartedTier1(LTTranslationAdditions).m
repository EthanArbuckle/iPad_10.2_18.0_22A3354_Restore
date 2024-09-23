@implementation MTSchemaMTInvocationStartedTier1(LTTranslationAdditions)

+ (id)lt_initWithLinkId:()LTTranslationAdditions appBundleId:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BE95250];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setLinkId:", v7);

  objc_msgSend(v8, "setAppBundleId:", v6);
  return v8;
}

@end
