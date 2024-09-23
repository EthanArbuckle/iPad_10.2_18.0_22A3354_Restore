@implementation MTSchemaMTInvocationCancelled(LTTranslationAdditions)

+ (id)lt_initWithExists:()LTTranslationAdditions reason:qssSessionId:
{
  objc_class *v6;
  id v7;
  id v8;

  v6 = (objc_class *)MEMORY[0x24BE95228];
  v7 = a5;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setExists:", a3);
  objc_msgSend(v8, "setQssSessionId:", v7);

  return v8;
}

@end
