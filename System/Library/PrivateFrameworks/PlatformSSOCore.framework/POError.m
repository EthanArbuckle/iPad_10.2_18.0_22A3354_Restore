@implementation POError

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:underlyingError:description:", a3, 0, a4);
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  POError *v11;

  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD1398]);
  if (v8)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD0FC8]);
  v11 = -[POError initWithDomain:code:userInfo:]([POError alloc], "initWithDomain:code:userInfo:", CFSTR("com.apple.PlatformSSO"), a3, v10);

  return v11;
}

+ (id)internalErrorWithMessage:(id)a3
{
  id v3;
  POError *v4;
  void *v5;
  POError *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [POError alloc];
  v8 = *MEMORY[0x24BDD0FC8];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[POError initWithDomain:code:userInfo:](v4, "initWithDomain:code:userInfo:", CFSTR("com.apple.PlatformSSO"), -1000, v5);
  return v6;
}

@end
