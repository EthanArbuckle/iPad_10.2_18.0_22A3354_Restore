@implementation MTSchemaMTClientEventMetadata(LTTranslationAdditions)

+ (id)lt_initWithMtId:()LTTranslationAdditions sessionId:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BE95200];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setMtId:", v7);

  objc_msgSend(v8, "setSessionId:", v6);
  return v8;
}

@end
