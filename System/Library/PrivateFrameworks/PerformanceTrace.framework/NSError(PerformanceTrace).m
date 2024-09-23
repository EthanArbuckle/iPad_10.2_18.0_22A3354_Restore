@implementation NSError(PerformanceTrace)

+ (id)error:()PerformanceTrace description:
{
  void *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD1540];
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a4, *MEMORY[0x24BDD0FC8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v8 = a3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Unknown Error (description cannot be nil)"), *MEMORY[0x24BDD0FC8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v8 = 0;
  }
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PerformanceTraceError"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)error:()PerformanceTrace description:underlyingError:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (!v7)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = (void *)MEMORY[0x24BDBCE70];
    v16 = *MEMORY[0x24BDD0FC8];
    v17 = CFSTR("Unknown Error (description cannot be nil)");
LABEL_6:
    objc_msgSend(v15, "dictionaryWithObject:forKey:", v17, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    v13 = 0;
    goto LABEL_7;
  }
  if (!v8)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = (void *)MEMORY[0x24BDBCE70];
    v16 = *MEMORY[0x24BDD0FC8];
    v17 = CFSTR("Unknown Error (underlyingError cannot be nil)");
    goto LABEL_6;
  }
  v10 = *MEMORY[0x24BDD1398];
  v20[0] = *MEMORY[0x24BDD0FC8];
  v20[1] = v10;
  v21[0] = v7;
  v21[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD1540];
  v13 = a3;
LABEL_7:
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PerformanceTraceError"), v13, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
