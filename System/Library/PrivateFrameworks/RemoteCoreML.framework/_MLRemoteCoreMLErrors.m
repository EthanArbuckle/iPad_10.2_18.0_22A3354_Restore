@implementation _MLRemoteCoreMLErrors

+ (id)createErrorWithCode:(int64_t)a3 description:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD1540];
  v15 = *MEMORY[0x24BDD0FC8];
  v16[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.remoteCoreML"), a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[_MLLog common](_MLLog, "common");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_229FCB000, v9, OS_LOG_TYPE_INFO, "%@ : %@", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

+ (id)clientTimeoutErrorForMethod:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: Client call timeout."), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createErrorWithCode:description:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
