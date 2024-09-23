@implementation NSError(TSUWarning)

+ (id)tsu_errorWithWarning:()TSUWarning
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v8 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(a3, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iWork.TSUWarningErrorDomain"), 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
