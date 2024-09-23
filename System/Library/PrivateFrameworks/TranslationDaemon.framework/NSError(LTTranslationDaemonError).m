@implementation NSError(LTTranslationDaemonError)

+ (id)ltd_errorWithCode:()LTTranslationDaemonError description:userInfo:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("LTTranslationDaemonErrorDomain"), a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
