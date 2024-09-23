@implementation MTSchemaMTInvocationFailed(LTTranslationAdditions)

+ (id)lt_initWithWithError:()LTTranslationAdditions qssSessionId:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = (objc_class *)MEMORY[0x24BE95210];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v7, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setErrorDomain:", v9);

  v10 = objc_msgSend(v7, "code");
  objc_msgSend(v8, "setErrorCode:", v10);
  v11 = objc_alloc_init(MEMORY[0x24BE95240]);
  objc_msgSend(v11, "setError:", v8);
  objc_msgSend(v11, "setQssSessionId:", v6);

  return v11;
}

@end
