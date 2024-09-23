@implementation NSError(SVVideoError)

+ (id)videoErrorWithUnderlyingError:()SVVideoError
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "errorCodeForUnderlyingErrorDomain:", v5);

  if (v4)
  {
    v10 = v4;
    v11[0] = *MEMORY[0x24BDD1398];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1B8];
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SVVideoErrorDomain"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)videoErrorWithErrorCode:()SVVideoError
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SVVideoErrorDomain"), a3, MEMORY[0x24BDBD1B8]);
}

+ (uint64_t)errorCodeForUnderlyingErrorDomain:()SVVideoError
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD1308]) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB1C58]))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

@end
