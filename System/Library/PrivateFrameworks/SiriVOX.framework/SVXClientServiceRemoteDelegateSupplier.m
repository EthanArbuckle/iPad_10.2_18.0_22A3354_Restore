@implementation SVXClientServiceRemoteDelegateSupplier

- (id)remoteServiceDelegateWithConnection:(id)a3 errorHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  SVXClientServiceRemoteDelegateSupplier *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (!v6)
  {
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[SVXClientServiceRemoteDelegateSupplier remoteServiceDelegateWithConnection:errorHandler:]";
      v14 = 2112;
      v15 = self;
      _os_log_error_impl(&dword_214934000, v9, OS_LOG_TYPE_ERROR, "%s %@ is already invalidated.", (uint8_t *)&v12, 0x16u);
      if (!v7)
        goto LABEL_6;
    }
    else if (!v7)
    {
LABEL_6:
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);

    goto LABEL_6;
  }
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

@end
