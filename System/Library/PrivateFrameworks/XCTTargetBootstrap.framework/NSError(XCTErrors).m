@implementation NSError(XCTErrors)

+ (id)_xct_error:()XCTErrors description:
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v10 = (objc_class *)MEMORY[0x24BDD17C8];
  v11 = a4;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  v16 = *MEMORY[0x24BDD0FC8];
  v17[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.xctest.error"), a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_xct_error:()XCTErrors description:userInfo:
{
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v11 = (objc_class *)MEMORY[0x24BDD17C8];
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v13, &a9);

  v15 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.xctest.error"), a3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
