@implementation MTSchemaMTInvocationEnded(LTTranslationAdditions)

+ (id)lt_initWithExists:()LTTranslationAdditions qssSessionId:
{
  objc_class *v5;
  id v6;
  id v7;

  v5 = (objc_class *)MEMORY[0x24BE95238];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setExists:", a3);
  objc_msgSend(v7, "setQssSessionId:", v6);

  return v7;
}

@end
