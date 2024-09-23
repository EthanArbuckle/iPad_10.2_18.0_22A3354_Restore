@implementation SoftwareTransparency

- (SoftwareTransparency)initWithApplication:(unint64_t)a3
{
  SoftwareTransparency *v4;
  SoftwareTransparency *v5;
  SoftwareTransparency *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SoftwareTransparency;
  v4 = -[SoftwareTransparency init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_application = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)retryable:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "code") == 4097)
  {
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDD0B88]);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)tooManyRetries
{
  id v2;

  v2 = objc_alloc(MEMORY[0x24BDD1540]);
  return (id)objc_msgSend(v2, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4097, 0);
}

- (id)connection
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SoftwareTransparency endpoint](self, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDD1988]);
    -[SoftwareTransparency endpoint](self, "endpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithListenerEndpoint:", v5);

    +[SWTransparencyXPCInterface interface](SWTransparencyXPCInterface, "interface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v7);

    objc_msgSend(v6, "resume");
  }
  else
  {
    -[SoftwareTransparency proxyCreating](self, "proxyCreating");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[SoftwareTransparency proxyCreating](self, "proxyCreating");
    else
      +[TransparencyXPCConnection swTransparencyConnection](TransparencyXPCConnection, "swTransparencyConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SoftwareTransparency connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)verifyProofs:(id)a3 for:(id)a4 completion:(id)a5
{
  -[SoftwareTransparency verifyProofs:for:counter:completion:](self, "verifyProofs:for:counter:completion:", a3, a4, 1, a5);
}

- (void)verifyProofs:(id)a3 for:(id)a4 counter:(int)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  int v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
  if (a5 < 5)
  {
    v15 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __60__SoftwareTransparency_verifyProofs_for_counter_completion___block_invoke;
    v22[3] = &unk_24DC8EA00;
    v22[4] = self;
    v16 = v12;
    v25 = v16;
    v17 = v10;
    v23 = v17;
    v18 = v11;
    v24 = v18;
    v26 = a5;
    -[SoftwareTransparency remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __60__SoftwareTransparency_verifyProofs_for_counter_completion___block_invoke_2;
    v20[3] = &unk_24DC8EA28;
    v21 = v16;
    objc_msgSend(v19, "verifyProofs:forObject:completion:", v17, v18, v20);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "tooManyRetries");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v13)[2](v13, 1, v14);

  }
}

void __60__SoftwareTransparency_verifyProofs_for_counter_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend((id)objc_opt_class(), "retryable:", v3) & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "verifyProofs:for:counter:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (*(_DWORD *)(a1 + 64) + 1), *(_QWORD *)(a1 + 56));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __60__SoftwareTransparency_verifyProofs_for_counter_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, objc_msgSend(a2, "result"), v5);

}

- (void)verifyExpiringProofs:(id)a3 for:(id)a4 completion:(id)a5
{
  -[SoftwareTransparency verifyExpiringProofs:for:counter:completion:](self, "verifyExpiringProofs:for:counter:completion:", a3, a4, 1, a5);
}

- (void)verifyExpiringProofs:(id)a3 for:(id)a4 counter:(int)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  int v23;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
  if (a5 < 5)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __68__SoftwareTransparency_verifyExpiringProofs_for_counter_completion___block_invoke;
    v19[3] = &unk_24DC8EA00;
    v19[4] = self;
    v15 = v12;
    v22 = v15;
    v16 = v10;
    v20 = v16;
    v17 = v11;
    v21 = v17;
    v23 = a5;
    -[SoftwareTransparency remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "verifyProofs:forObject:completion:", v16, v17, v15);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "tooManyRetries");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v14);

  }
}

void __68__SoftwareTransparency_verifyExpiringProofs_for_counter_completion___block_invoke(uint64_t a1, void *a2)
{
  SWTransparencyExpiringVerificationResult *v3;
  void *v4;
  SWTransparencyExpiringVerificationResult *v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend((id)objc_opt_class(), "retryable:", v6) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "verifyExpiringProofs:for:counter:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (*(_DWORD *)(a1 + 64) + 1), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = [SWTransparencyExpiringVerificationResult alloc];
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SWTransparencyExpiringVerificationResult initWithResult:expiry:](v3, "initWithResult:expiry:", 1, v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)sysdiagnoseInfoWithCompletion:(id)a3
{
  -[SoftwareTransparency sysdiagnoseInfo:completion:](self, "sysdiagnoseInfo:completion:", 1, a3);
}

- (void)sysdiagnoseInfo:(int)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  int v13;

  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (a3 < 5)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51__SoftwareTransparency_sysdiagnoseInfo_completion___block_invoke;
    v11[3] = &unk_24DC8EA50;
    v11[4] = self;
    v9 = v6;
    v12 = v9;
    v13 = a3;
    -[SoftwareTransparency remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sysdiagnoseInfoWithCompletion:", v9);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "tooManyRetries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);

  }
}

void __51__SoftwareTransparency_sysdiagnoseInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend((id)objc_opt_class(), "retryable:", v3) & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "sysdiagnoseInfo:completion:", (*(_DWORD *)(a1 + 48) + 1), *(_QWORD *)(a1 + 40));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)triggerMilestoneRefreshWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SoftwareTransparency connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__SoftwareTransparency_triggerMilestoneRefreshWithCompletion___block_invoke;
  v8[3] = &unk_24DC8EA78;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggerMilestoneRefreshWithCompletion:", v6);

}

uint64_t __62__SoftwareTransparency_triggerMilestoneRefreshWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)triggerPublicKeyBagRefreshWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SoftwareTransparency connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__SoftwareTransparency_triggerPublicKeyBagRefreshWithCompletion___block_invoke;
  v8[3] = &unk_24DC8EA78;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggerPublicKeybagRefreshWithCompletion:", v6);

}

uint64_t __65__SoftwareTransparency_triggerPublicKeyBagRefreshWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)triggerConsistencyVerificationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SoftwareTransparency connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__SoftwareTransparency_triggerConsistencyVerificationWithCompletion___block_invoke;
  v8[3] = &unk_24DC8EA78;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggerConsistencyVerificationWithCompletion:", v6);

}

uint64_t __69__SoftwareTransparency_triggerConsistencyVerificationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)postCFU:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[SoftwareTransparency connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__SoftwareTransparency_postCFU_completion___block_invoke;
  v11[3] = &unk_24DC8EA78;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postCFU:completion:", v7, v9);

}

uint64_t __43__SoftwareTransparency_postCFU_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearAllCFUWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SoftwareTransparency connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__SoftwareTransparency_clearAllCFUWithCompletion___block_invoke;
  v8[3] = &unk_24DC8EA78;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearAllCFUWithCompletion:", v6);

}

uint64_t __50__SoftwareTransparency_clearAllCFUWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)waitStateMachineReadyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SoftwareTransparency connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__SoftwareTransparency_waitStateMachineReadyWithCompletion___block_invoke;
  v8[3] = &unk_24DC8EA78;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "waitStateMachineReadyWithCompletion:", v6);

}

uint64_t __60__SoftwareTransparency_waitStateMachineReadyWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dailyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SoftwareTransparency connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__SoftwareTransparency_dailyWithCompletion___block_invoke;
  v8[3] = &unk_24DC8EA78;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dailyWithCompletion:", v6);

}

uint64_t __44__SoftwareTransparency_dailyWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)application
{
  return self->_application;
}

- (void)setApplication:(unint64_t)a3
{
  self->_application = a3;
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSXPCProxyCreating)proxyCreating
{
  return (NSXPCProxyCreating *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProxyCreating:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyCreating, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
