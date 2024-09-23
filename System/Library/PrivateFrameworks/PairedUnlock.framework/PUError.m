@implementation PUError

+ (id)errorWithCode:(unint64_t)a3 description:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDD0FC8];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.pairedunlock"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PUError)init
{

  return 0;
}

@end
