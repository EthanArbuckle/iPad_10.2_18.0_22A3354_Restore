@implementation MTSchemaMTFrameworkRequestSent(LTTranslationAdditions)

+ (id)lt_initWithFrameworkRequestId:()LTTranslationAdditions qssSessionId:requestType:requestRoute:requestSize:
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;

  v11 = (objc_class *)MEMORY[0x24BE95220];
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v11);
  objc_msgSend(v14, "setFrameworkRequestId:", v13);

  objc_msgSend(v14, "setQssSessionId:", v12);
  if (a5 <= 4)
    objc_msgSend(v14, "setRequestType:", a5);
  if (a6 <= 2)
    objc_msgSend(v14, "setRequestRoute:", a6);
  objc_msgSend(v14, "setRequestSize:", a7);
  return v14;
}

@end
