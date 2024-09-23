@implementation MTSchemaMTFrameworkRequestResponseReceived(LTTranslationAdditions)

+ (id)lt_initWithFrameworkRequestId:()LTTranslationAdditions requestRoute:numberOfSentences:
{
  objc_class *v7;
  id v8;
  id v9;

  v7 = (objc_class *)MEMORY[0x24BE95218];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setFrameworkRequestId:", v8);

  objc_msgSend(v9, "setNumSentences:", a5);
  if (a4 <= 2)
    objc_msgSend(v9, "setRequestRoute:", a4);
  return v9;
}

@end
