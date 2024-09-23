@implementation SLUtils

+ (id)createErrorWithMsg:(id)a3 code:(unint64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  v11 = CFSTR("reason");
  v12[0] = a3;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
