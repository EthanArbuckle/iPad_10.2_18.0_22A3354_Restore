@implementation TRCompanionAuthOperationHandler

- (TRCompanionAuthOperationHandler)initWithCompanionAuthHandler:(id)a3
{
  id v4;
  TRCompanionAuthOperationHandler *v5;
  uint64_t v6;
  id companionAuthHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRCompanionAuthOperationHandler;
  v5 = -[TRCompanionAuthOperationHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    companionAuthHandler = v5->_companionAuthHandler;
    v5->_companionAuthHandler = (id)v6;

  }
  return v5;
}

- (TRCompanionAuthOperationHandler)initWithCompanionAuthHandlerWithError:(id)a3
{
  id v4;
  TRCompanionAuthOperationHandler *v5;
  uint64_t v6;
  id companionAuthHandlerWithError;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRCompanionAuthOperationHandler;
  v5 = -[TRCompanionAuthOperationHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    companionAuthHandlerWithError = v5->_companionAuthHandlerWithError;
    v5->_companionAuthHandlerWithError = (id)v6;

  }
  return v5;
}

- (void)registerMessageHandlersForSession:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__TRCompanionAuthOperationHandler_registerMessageHandlersForSession___block_invoke;
  v4[3] = &unk_24C2E4DC8;
  v4[4] = self;
  v3 = a3;
  objc_msgSend(v3, "setRequestHandler:forRequestClass:", v4, objc_opt_class());

}

uint64_t __69__TRCompanionAuthOperationHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCompanionAuthenticationRequest:withResponseHandler:", a2, a3);
}

- (void)_handleCompanionAuthenticationRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void (**companionAuthHandlerWithError)(id, void *, _QWORD *);
  void **v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void (**companionAuthHandler)(id, void *, _QWORD *);
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (*(_OWORD *)&self->_companionAuthHandler != 0)
  {
    objc_msgSend(v6, "account");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetedAccountServices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "companionDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "shouldUseAIDA");
    if (v20)
    {
      if (v8)
      {
        if (v9)
        {
          v28[0] = CFSTR("TRCompanionAuthOperationHandlerParamKeyAccount");
          v28[1] = CFSTR("TRCompanionAuthOperationHandlerParamKeyTargetedAccountServices");
          v29[0] = v20;
          v29[1] = v8;
          v29[2] = v9;
          v28[2] = CFSTR("TRCompanionAuthOperationHandlerParamKeyCompanionDevice");
          v28[3] = CFSTR("TRCompanionAuthOperationHandlerParamKeyUseAIDA");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v29[3] = v11;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          companionAuthHandlerWithError = (void (**)(id, void *, _QWORD *))self->_companionAuthHandlerWithError;
          if (companionAuthHandlerWithError)
          {
            v26[0] = MEMORY[0x24BDAC760];
            v26[1] = 3221225472;
            v26[2] = __93__TRCompanionAuthOperationHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke;
            v26[3] = &unk_24C2E5028;
            v14 = &v27;
            v27 = v7;
            companionAuthHandlerWithError[2](companionAuthHandlerWithError, v12, v26);
          }
          else
          {
            companionAuthHandler = (void (**)(id, void *, _QWORD *))self->_companionAuthHandler;
            v24[0] = MEMORY[0x24BDAC760];
            v24[1] = 3221225472;
            v24[2] = __93__TRCompanionAuthOperationHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke_2;
            v24[3] = &unk_24C2E5050;
            v14 = &v25;
            v25 = v7;
            companionAuthHandler[2](companionAuthHandler, v12, v24);
          }
          v22 = *v14;
          goto LABEL_14;
        }
        v21 = *MEMORY[0x24BDD0FD8];
        v30[0] = *MEMORY[0x24BDD0FC8];
        v30[1] = v21;
        v31[0] = CFSTR("Invalid Message Parameters");
        v31[1] = CFSTR("Missing companionDevice parameter");
        v16 = (void *)MEMORY[0x24BDBCE70];
        v17 = v31;
        v18 = v30;
      }
      else
      {
        v19 = *MEMORY[0x24BDD0FD8];
        v32[0] = *MEMORY[0x24BDD0FC8];
        v32[1] = v19;
        v33[0] = CFSTR("Invalid Message Parameters");
        v33[1] = CFSTR("Missing targetedAccountServices parameter");
        v16 = (void *)MEMORY[0x24BDBCE70];
        v17 = v33;
        v18 = v32;
      }
    }
    else
    {
      v15 = *MEMORY[0x24BDD0FD8];
      v34[0] = *MEMORY[0x24BDD0FC8];
      v34[1] = v15;
      v35[0] = CFSTR("Invalid Message Parameters");
      v35[1] = CFSTR("Missing account parameter");
      v16 = (void *)MEMORY[0x24BDBCE70];
      v17 = v35;
      v18 = v34;
    }
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9202, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v22, 0);
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9001, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v20, 0);
LABEL_15:

}

void __93__TRCompanionAuthOperationHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __93__TRCompanionAuthOperationHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  TRSetupAuthenticationResponse *v4;

  v3 = a2;
  v4 = objc_alloc_init(TRSetupAuthenticationResponse);
  -[TRSetupAuthenticationResponse setUnauthenticatedAccountServices:](v4, "setUnauthenticatedAccountServices:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)companionAuthHandler
{
  return self->_companionAuthHandler;
}

- (void)setCompanionAuthHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)companionAuthHandlerWithError
{
  return self->_companionAuthHandlerWithError;
}

- (void)setCompanionAuthHandlerWithError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_companionAuthHandlerWithError, 0);
  objc_storeStrong(&self->_companionAuthHandler, 0);
}

@end
