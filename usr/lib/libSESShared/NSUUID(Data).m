@implementation NSUUID(Data)

+ (id)ses_withData:()Data
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "bytes");

  return (id)objc_msgSend(v5, "initWithUUIDBytes:", v7);
}

+ (id)ses_withUUIDString:()Data
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", v4);

  return v5;
}

- (id)ses_toData
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 16);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(a1, "getUUIDBytes:", objc_msgSend(v2, "mutableBytes"));
  return v2;
}

@end
