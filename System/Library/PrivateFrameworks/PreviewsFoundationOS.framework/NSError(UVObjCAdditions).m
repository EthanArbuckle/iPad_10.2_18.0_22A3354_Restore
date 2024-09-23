@implementation NSError(UVObjCAdditions)

+ (id)uv_errorWithUserInfo:()UVObjCAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend([a1 alloc], "initWithDomain:code:userInfo:", CFSTR("com.apple.Previews"), -1, v4);

  return v5;
}

+ (id)uv_errorWithDescription:()UVObjCAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = *MEMORY[0x24BDD0FC8];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "uv_errorWithUserInfo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)uv_errorWithFormat:()UVObjCAdditions
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;

  v10 = (objc_class *)MEMORY[0x24BDD17C8];
  v11 = a3;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  objc_msgSend(a1, "uv_errorWithDescription:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
