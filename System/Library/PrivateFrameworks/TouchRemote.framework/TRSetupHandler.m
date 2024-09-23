@implementation TRSetupHandler

- (TRSetupHandler)initWithDelegate:(id)a3
{
  id v4;
  TRSetupHandler *v5;
  TRSetupHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TRSetupHandler;
  v5 = -[TRSetupHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)registerMessageHandlersForSession:(id)a3
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke;
  v13[3] = &unk_24C2E4DC8;
  v13[4] = self;
  v5 = a3;
  objc_msgSend(v5, "setRequestHandler:forRequestClass:", v13, objc_opt_class());
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_2;
  v12[3] = &unk_24C2E4DC8;
  v12[4] = self;
  objc_msgSend(v5, "setRequestHandler:forRequestClass:", v12, objc_opt_class());
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_3;
  v11[3] = &unk_24C2E4DC8;
  v11[4] = self;
  objc_msgSend(v5, "setRequestHandler:forRequestClass:", v11, objc_opt_class());
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_4;
  v10[3] = &unk_24C2E4DC8;
  v10[4] = self;
  objc_msgSend(v5, "setRequestHandler:forRequestClass:", v10, objc_opt_class());
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_5;
  v9[3] = &unk_24C2E4DC8;
  v9[4] = self;
  objc_msgSend(v5, "setRequestHandler:forRequestClass:", v9, objc_opt_class());
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_6;
  v8[3] = &unk_24C2E4DC8;
  v8[4] = self;
  objc_msgSend(v5, "setRequestHandler:forRequestClass:", v8, objc_opt_class());
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_7;
  v7[3] = &unk_24C2E4DC8;
  v7[4] = self;
  objc_msgSend(v5, "setRequestHandler:forRequestClass:", v7, objc_opt_class());
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_8;
  v6[3] = &unk_24C2E4DC8;
  v6[4] = self;
  objc_msgSend(v5, "setRequestHandler:forRequestClass:", v6, objc_opt_class());

}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleHandshakeRequest:withResponseHandler:", a2, a3);
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleConfigurationRequest:withResponseHandler:", a2, a3);
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleNetworkRequest:withResponseHandler:", a2, a3);
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleActivationRequest:withResponseHandler:", a2, a3);
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCompanionAuthenticationRequest:withResponseHandler:", a2, a3);
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleProxyDeviceRequest:withResponseHandler:", a2, a3);
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleProxyAuthenticationRequest:withResponseHandler:", a2, a3);
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCompletionRequest:withResponseHandler:", a2, a3);
}

- (void)_handleHandshakeRequest:(id)a3 withResponseHandler:(id)a4
{
  void (**v4)(id, _QWORD, TRHandshakeResponse *);
  TRHandshakeResponse *v5;

  v4 = (void (**)(id, _QWORD, TRHandshakeResponse *))a4;
  v5 = objc_alloc_init(TRHandshakeResponse);
  -[TRHandshakeResponse setProtocolVersion:](v5, "setProtocolVersion:", 0);
  v4[2](v4, 0, v5);

}

- (void)_handleConfigurationRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  -[TRSetupHandler delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "deviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("DeviceName"));
    v12 = (void *)objc_msgSend(v11, "copy");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "setupHandler:configurationWithParams:completion:", self, v12, v7);
    }
    else
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __66__TRSetupHandler__handleConfigurationRequest_withResponseHandler___block_invoke;
      v14[3] = &unk_24C2E4FB0;
      v15 = v7;
      objc_msgSend(v8, "setupHandler:prepareConfigurationWithParams:completion:", self, v12, v14);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9001, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v13, 0);

  }
}

void __66__TRSetupHandler__handleConfigurationRequest_withResponseHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  TRSetupConfigurationResponse *v6;

  v5 = a3;
  v6 = objc_alloc_init(TRSetupConfigurationResponse);
  -[TRSetupConfigurationResponse setNeedsNetwork:](v6, "setNeedsNetwork:", a2);
  -[TRSetupConfigurationResponse setUnauthenticatedAccountServices:](v6, "setUnauthenticatedAccountServices:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleNetworkRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[TRSetupHandler delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "networkSSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "networkPassword");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("NetworkSSID"));
      if (v10)
        objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("NetworkPassword"));
      v12 = (void *)objc_msgSend(v11, "copy");
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __60__TRSetupHandler__handleNetworkRequest_withResponseHandler___block_invoke;
      v14[3] = &unk_24C2E51B0;
      v15 = v7;
      objc_msgSend(v8, "setupHandler:joinNetworkWithParams:completion:", self, v12, v14);

    }
    else
    {
      v13 = *MEMORY[0x24BDD0FD8];
      v16[0] = *MEMORY[0x24BDD0FC8];
      v16[1] = v13;
      v17[0] = CFSTR("Invalid Message Parameters");
      v17[1] = CFSTR("Missing SSID parameter");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9202, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v12, 0);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9001, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v9, 0);
  }

}

void __60__TRSetupHandler__handleNetworkRequest_withResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  TRSetupNetworkResponse *v4;

  v4 = objc_alloc_init(TRSetupNetworkResponse);
  -[TRSetupNetworkResponse setHasNetwork:](v4, "setHasNetwork:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_handleActivationRequest:(id)a3 withResponseHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  -[TRSetupHandler delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __63__TRSetupHandler__handleActivationRequest_withResponseHandler___block_invoke;
      v11[3] = &unk_24C2E51D8;
      v12 = v5;
      objc_msgSend(v6, "setupHandler:activateWithCompletionWithError:", self, v11);
      v7 = v12;
    }
    else
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __63__TRSetupHandler__handleActivationRequest_withResponseHandler___block_invoke_2;
      v9[3] = &unk_24C2E51B0;
      v10 = v5;
      objc_msgSend(v6, "setupHandler:activateWithCompletion:", self, v9);
      v7 = v10;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9001, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v5 + 2))(v5, v8, 0);

  }
}

void __63__TRSetupHandler__handleActivationRequest_withResponseHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  TRSetupActivationResponse *v6;

  v5 = a3;
  v6 = objc_alloc_init(TRSetupActivationResponse);
  -[TRSetupActivationResponse setActivated:](v6, "setActivated:", a2);
  -[TRSetupActivationResponse setError:](v6, "setError:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__TRSetupHandler__handleActivationRequest_withResponseHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  TRSetupActivationResponse *v4;

  v4 = objc_alloc_init(TRSetupActivationResponse);
  -[TRSetupActivationResponse setActivated:](v4, "setActivated:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_handleCompanionAuthenticationRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[TRSetupHandler delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetedAccountServices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "companionDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "shouldUseAIDA");
    if (v9)
    {
      if (v10)
      {
        if (v11)
        {
          v29[0] = CFSTR("Account");
          v29[1] = CFSTR("TargetedAccountServices");
          v30[0] = v9;
          v30[1] = v10;
          v30[2] = v11;
          v29[2] = CFSTR("CompanionDevice");
          v29[3] = CFSTR("UseAIDA");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v30[3] = v13;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v27[0] = MEMORY[0x24BDAC760];
            v27[1] = 3221225472;
            v27[2] = __76__TRSetupHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke;
            v27[3] = &unk_24C2E5200;
            v15 = &v28;
            v28 = v7;
            objc_msgSend(v8, "setupHandler:performCompanionAuthenticationWithParams:completionWithErrorAuthResults:", self, v14, v27);
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v25[0] = MEMORY[0x24BDAC760];
            v25[1] = 3221225472;
            v25[2] = __76__TRSetupHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke_2;
            v25[3] = &unk_24C2E5028;
            v15 = &v26;
            v26 = v7;
            objc_msgSend(v8, "setupHandler:performCompanionAuthenticationWithParams:completionWithError:", self, v14, v25);
          }
          else
          {
            v23[0] = MEMORY[0x24BDAC760];
            v23[1] = 3221225472;
            v23[2] = __76__TRSetupHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke_3;
            v23[3] = &unk_24C2E5050;
            v15 = &v24;
            v24 = v7;
            objc_msgSend(v8, "setupHandler:performCompanionAuthenticationWithParams:completion:", self, v14, v23);
          }
          v22 = *v15;
          goto LABEL_17;
        }
        v21 = *MEMORY[0x24BDD0FD8];
        v31[0] = *MEMORY[0x24BDD0FC8];
        v31[1] = v21;
        v32[0] = CFSTR("Invalid Message Parameters");
        v32[1] = CFSTR("Missing companionDevice parameter");
        v17 = (void *)MEMORY[0x24BDBCE70];
        v18 = v32;
        v19 = v31;
      }
      else
      {
        v20 = *MEMORY[0x24BDD0FD8];
        v33[0] = *MEMORY[0x24BDD0FC8];
        v33[1] = v20;
        v34[0] = CFSTR("Invalid Message Parameters");
        v34[1] = CFSTR("Missing targetedAccountServices parameter");
        v17 = (void *)MEMORY[0x24BDBCE70];
        v18 = v34;
        v19 = v33;
      }
    }
    else
    {
      v16 = *MEMORY[0x24BDD0FD8];
      v35[0] = *MEMORY[0x24BDD0FC8];
      v35[1] = v16;
      v36[0] = CFSTR("Invalid Message Parameters");
      v36[1] = CFSTR("Missing account parameter");
      v17 = (void *)MEMORY[0x24BDBCE70];
      v18 = v36;
      v19 = v35;
    }
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9202, v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v22, 0);
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9001, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v9, 0);
LABEL_18:

}

void __76__TRSetupHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  TRSetupAuthenticationResponse *v10;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = objc_alloc_init(TRSetupAuthenticationResponse);
  -[TRSetupAuthenticationResponse setUnauthenticatedAccountServices:](v10, "setUnauthenticatedAccountServices:", v9);

  -[TRSetupAuthenticationResponse setError:](v10, "setError:", v8);
  -[TRSetupAuthenticationResponse setAuthenticationResults:](v10, "setAuthenticationResults:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__TRSetupHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  TRSetupAuthenticationResponse *v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(TRSetupAuthenticationResponse);
  -[TRSetupAuthenticationResponse setUnauthenticatedAccountServices:](v7, "setUnauthenticatedAccountServices:", v6);

  -[TRSetupAuthenticationResponse setError:](v7, "setError:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __76__TRSetupHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  TRSetupAuthenticationResponse *v4;

  v3 = a2;
  v4 = objc_alloc_init(TRSetupAuthenticationResponse);
  -[TRSetupAuthenticationResponse setUnauthenticatedAccountServices:](v4, "setUnauthenticatedAccountServices:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleProxyDeviceRequest:(id)a3 withResponseHandler:(id)a4
{
  void *v4;
  void (**v5)(id, _QWORD, TRSetupProxyDeviceResponse *);
  TRSetupProxyDeviceResponse *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BE0AD68];
  v5 = (void (**)(id, _QWORD, TRSetupProxyDeviceResponse *))a4;
  objc_msgSend(v4, "currentDevice");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLinkType:", 3);
  v6 = objc_alloc_init(TRSetupProxyDeviceResponse);
  -[TRSetupProxyDeviceResponse setProxyDevice:](v6, "setProxyDevice:", v7);
  v5[2](v5, 0, v6);

}

- (void)_handleProxyAuthenticationRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[TRSetupHandler delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rawPassword");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetedAccountServices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "shouldUseAIDA");
    if (v9)
    {
      if (v10)
      {
        if (v11)
        {
          v29[0] = CFSTR("Account");
          v29[1] = CFSTR("TargetedAccountServices");
          v30[0] = v9;
          v30[1] = v11;
          v30[2] = v10;
          v29[2] = CFSTR("AccountRawPassword");
          v29[3] = CFSTR("UseAIDA");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v30[3] = v13;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v27[0] = MEMORY[0x24BDAC760];
            v27[1] = 3221225472;
            v27[2] = __72__TRSetupHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke;
            v27[3] = &unk_24C2E5200;
            v15 = &v28;
            v28 = v7;
            objc_msgSend(v8, "setupHandler:performProxyAuthenticationWithParamsAuthResult:completionWithErrorAuthResults:", self, v14, v27);
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v25[0] = MEMORY[0x24BDAC760];
            v25[1] = 3221225472;
            v25[2] = __72__TRSetupHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke_2;
            v25[3] = &unk_24C2E5028;
            v15 = &v26;
            v26 = v7;
            objc_msgSend(v8, "setupHandler:performProxyAuthenticationWithParams:completionWithError:", self, v14, v25);
          }
          else
          {
            v23[0] = MEMORY[0x24BDAC760];
            v23[1] = 3221225472;
            v23[2] = __72__TRSetupHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke_3;
            v23[3] = &unk_24C2E5050;
            v15 = &v24;
            v24 = v7;
            objc_msgSend(v8, "setupHandler:performProxyAuthenticationWithParams:completion:", self, v14, v23);
          }
          v22 = *v15;
          goto LABEL_17;
        }
        v21 = *MEMORY[0x24BDD0FD8];
        v31[0] = *MEMORY[0x24BDD0FC8];
        v31[1] = v21;
        v32[0] = CFSTR("Invalid Message Parameters");
        v32[1] = CFSTR("Missing targetedAccountServices parameter");
        v17 = (void *)MEMORY[0x24BDBCE70];
        v18 = v32;
        v19 = v31;
      }
      else
      {
        v20 = *MEMORY[0x24BDD0FD8];
        v33[0] = *MEMORY[0x24BDD0FC8];
        v33[1] = v20;
        v34[0] = CFSTR("Invalid Message Parameters");
        v34[1] = CFSTR("Missing accountRawPassword parameter");
        v17 = (void *)MEMORY[0x24BDBCE70];
        v18 = v34;
        v19 = v33;
      }
    }
    else
    {
      v16 = *MEMORY[0x24BDD0FD8];
      v35[0] = *MEMORY[0x24BDD0FC8];
      v35[1] = v16;
      v36[0] = CFSTR("Invalid Message Parameters");
      v36[1] = CFSTR("Missing account parameter");
      v17 = (void *)MEMORY[0x24BDBCE70];
      v18 = v36;
      v19 = v35;
    }
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9202, v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v22, 0);
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9001, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v9, 0);
LABEL_18:

}

void __72__TRSetupHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  TRSetupAuthenticationResponse *v10;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = objc_alloc_init(TRSetupAuthenticationResponse);
  -[TRSetupAuthenticationResponse setUnauthenticatedAccountServices:](v10, "setUnauthenticatedAccountServices:", v9);

  -[TRSetupAuthenticationResponse setError:](v10, "setError:", v8);
  -[TRSetupAuthenticationResponse setAuthenticationResults:](v10, "setAuthenticationResults:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__TRSetupHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  TRSetupAuthenticationResponse *v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(TRSetupAuthenticationResponse);
  -[TRSetupAuthenticationResponse setUnauthenticatedAccountServices:](v7, "setUnauthenticatedAccountServices:", v6);

  -[TRSetupAuthenticationResponse setError:](v7, "setError:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __72__TRSetupHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  TRSetupAuthenticationResponse *v4;

  v3 = a2;
  v4 = objc_alloc_init(TRSetupAuthenticationResponse);
  -[TRSetupAuthenticationResponse setUnauthenticatedAccountServices:](v4, "setUnauthenticatedAccountServices:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleCompletionRequest:(id)a3 withResponseHandler:(id)a4
{
  void (**v6)(id, _QWORD, TRSetupCompletionResponse *);
  void *v7;
  TRSetupCompletionResponse *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, TRSetupCompletionResponse *))a4;
  -[TRSetupHandler delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_alloc_init(TRSetupCompletionResponse);
    v6[2](v6, 0, v8);

    objc_msgSend(v7, "setupHandler:didCompleteSuccessfully:errorCode:", self, objc_msgSend(v9, "completedSuccessfully"), objc_msgSend(v9, "errorCode"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9001, 0);
    v8 = (TRSetupCompletionResponse *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, TRSetupCompletionResponse *, TRSetupCompletionResponse *))v6)[2](v6, v8, 0);

  }
}

- (TRSetupHandlerDelegate)delegate
{
  return (TRSetupHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
