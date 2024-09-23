@implementation SVXInstanceInfoSupplier

- (SVXInstanceInfoSupplier)initWithRemoteDelegateSupplier:(id)a3 performer:(id)a4
{
  id v7;
  id v8;
  SVXInstanceInfoSupplier *v9;
  SVXInstanceInfoSupplier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXInstanceInfoSupplier;
  v9 = -[SVXInstanceInfoSupplier init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_remoteDelegateSupplier, a3);
    objc_storeStrong((id *)&v10->_performer, a4);
  }

  return v10;
}

- (void)getInstanceInfoWithConnection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SVXPerforming *performer;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  performer = self->_performer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke;
  v11[3] = &unk_24D24EED8;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[SVXPerforming performBlock:](performer, "performBlock:", v11);

}

- (void)_updateInstanceInfo:(id)a3
{
  AFInstanceInfo *v4;
  AFInstanceInfo *cacheInstanceInfo;
  NSObject *v6;
  AFInstanceInfo *v7;
  AFInstanceInfo *v8;
  AFInstanceInfo *v9;
  int v10;
  const char *v11;
  __int16 v12;
  AFInstanceInfo *v13;
  __int16 v14;
  AFInstanceInfo *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (AFInstanceInfo *)a3;
  cacheInstanceInfo = self->_cacheInstanceInfo;
  if (cacheInstanceInfo != v4 && (-[AFInstanceInfo isEqual:](cacheInstanceInfo, "isEqual:", v4) & 1) == 0)
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v7 = self->_cacheInstanceInfo;
      v10 = 136315650;
      v11 = "-[SVXInstanceInfoSupplier _updateInstanceInfo:]";
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s instanceInfo: %@ -> %@", (uint8_t *)&v10, 0x20u);
    }
    v8 = (AFInstanceInfo *)-[AFInstanceInfo copy](v4, "copy");
    v9 = self->_cacheInstanceInfo;
    self->_cacheInstanceInfo = v8;

  }
}

- (AFInstanceInfo)cacheInstanceInfo
{
  return self->_cacheInstanceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheInstanceInfo, 0);
  objc_storeStrong((id *)&self->_remoteDelegateSupplier, 0);
  objc_storeStrong((id *)&self->_performer, 0);
}

void __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke(uint64_t a1)
{
  void (**v1)(_QWORD, _QWORD);
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  void (**v13)(_QWORD, _QWORD);
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = *(void (***)(_QWORD, _QWORD))(a1 + 48);
  if (v1)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 24);
    if (v4)
    {
      v5 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[SVXInstanceInfoSupplier getInstanceInfoWithConnection:completion:]_block_invoke";
        v16 = 2112;
        v17 = v4;
        _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
        v1 = *(void (***)(_QWORD, _QWORD))(a1 + 48);
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      }
      v1[2](v1, v4);
    }
    else
    {
      v6 = *(void **)(v3 + 16);
      v7 = MEMORY[0x24BDAC760];
      v8 = *(_QWORD *)(a1 + 40);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_1;
      v12[3] = &unk_24D24DEF8;
      v12[4] = v3;
      v13 = v1;
      objc_msgSend(v6, "remoteServiceDelegateWithConnection:errorHandler:", v8, v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_3;
      v10[3] = &unk_24D24BD78;
      v10[4] = *(_QWORD *)(a1 + 32);
      v11 = *(id *)(a1 + 48);
      objc_msgSend(v9, "getInstanceInfoWithCompletion:", v10);

    }
  }
}

void __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_2;
  v7[3] = &unk_24D24EF28;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "performBlock:", v7);

}

void __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_2_4;
  v11[3] = &unk_24D24F068;
  v12 = v6;
  v14 = v5;
  v15 = v7;
  v13 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

uint64_t __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_2_4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t (*v4)(void);
  NSObject *v5;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[SVXInstanceInfoSupplier getInstanceInfoWithConnection:completion:]_block_invoke_2";
      v10 = 2112;
      v11 = v2;
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v8, 0x16u);
    }
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateInstanceInfo:", *(_QWORD *)(a1 + 48));
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 136315394;
      v9 = "-[SVXInstanceInfoSupplier getInstanceInfoWithConnection:completion:]_block_invoke";
      v10 = 2112;
      v11 = v7;
      _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v8, 0x16u);
    }
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  return v4();
}

uint64_t __68__SVXInstanceInfoSupplier_getInstanceInfoWithConnection_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SVXInstanceInfoSupplier getInstanceInfoWithConnection:completion:]_block_invoke_2";
    v7 = 2112;
    v8 = v4;
    _os_log_error_impl(&dword_214934000, v2, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v5, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
