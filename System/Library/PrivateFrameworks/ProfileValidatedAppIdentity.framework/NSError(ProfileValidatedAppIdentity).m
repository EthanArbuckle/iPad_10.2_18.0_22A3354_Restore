@implementation NSError(ProfileValidatedAppIdentity)

+ (uint64_t)pvai_errorWithCode:()ProfileValidatedAppIdentity
{
  return objc_msgSend(a1, "pvai_errorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)pvai_errorWithCode:()ProfileValidatedAppIdentity userInfo:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicecheck.error.pvappidentity"), a3, a4);
}

+ (id)pvai_wrappedError:()ProfileValidatedAppIdentity error:
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  v5 = a4;
  v6 = v5;
  if (!v5)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1540], "pvai_errorWithCode:userInfo:", a3, v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.devicecheck.error.pvappidentity"));

  if ((v8 & 1) == 0)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD1398]);
    goto LABEL_6;
  }
  v9 = v6;
LABEL_7:

  return v9;
}

@end
