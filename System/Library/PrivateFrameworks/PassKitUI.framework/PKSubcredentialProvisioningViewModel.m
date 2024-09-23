@implementation PKSubcredentialProvisioningViewModel

- (PKSubcredentialProvisioningViewModel)initWithDelegate:(id)a3
{
  id v4;
  PKSubcredentialProvisioningViewModel *v5;
  PKSubcredentialProvisioningController *v6;
  PKSubcredentialProvisioningController *provisioningController;

  v4 = a3;
  v5 = -[PKSubcredentialProvisioningViewModel init](self, "init");
  if (v5)
  {
    v6 = (PKSubcredentialProvisioningController *)objc_alloc_init(MEMORY[0x1E0D676F0]);
    provisioningController = v5->_provisioningController;
    v5->_provisioningController = v6;

    -[PKSubcredentialProvisioningController setDelegate:](v5->_provisioningController, "setDelegate:", v4);
  }

  return v5;
}

- (void)startProvisioning
{
  PKSubcredentialProvisioningConfiguration *config;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  config = self->_config;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PKSubcredentialProvisioningViewModel_startProvisioning__block_invoke;
  v4[3] = &unk_1E3E61C58;
  objc_copyWeak(&v5, &location);
  -[PKSubcredentialProvisioningViewModel setNewAuthRandomIfNecessaryWithConfiguration:completion:](self, "setNewAuthRandomIfNecessaryWithConfiguration:completion:", config, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__PKSubcredentialProvisioningViewModel_startProvisioning__block_invoke(uint64_t a1, int a2)
{
  id *v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(WeakRetained[2], "remoteDeviceConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "sharingRequest");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localDeviceWebService");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __57__PKSubcredentialProvisioningViewModel_startProvisioning__block_invoke_2;
        v13[3] = &unk_1E3E61310;
        objc_copyWeak(&v14, v3);
        objc_msgSend(v5, "rescindSimilarInvitationsToSharingRequest:withWebService:completion:", v8, v9, v13);

        objc_destroyWeak(&v14);
      }
      else
      {
        objc_msgSend(v5[1], "startProvisioningWithConfiguration:", v5[2]);
      }
    }
    else
    {
      objc_msgSend(WeakRetained[1], "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2938];
      v16[0] = CFSTR("Failed to set auth random");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D6B9E8], 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "subcredentialProvisioningController:didFinishWithError:inState:", v5[1], v12, 0);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "subcredentialProvisioningController:didFinishWithError:", v5[1], v12);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "subcredentialProvisioningController:didEnterState:", v5[1], 0);

    }
  }

}

void __57__PKSubcredentialProvisioningViewModel_startProvisioning__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[1], "startProvisioningWithConfiguration:", WeakRetained[2]);
    v2 = v3;
  }

}

- (void)cancelProvisioningWithCompletion:(id)a3
{
  id v4;
  PKSubcredentialProvisioningController *provisioningController;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  provisioningController = self->_provisioningController;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__PKSubcredentialProvisioningViewModel_cancelProvisioningWithCompletion___block_invoke;
  v7[3] = &unk_1E3E61590;
  v8 = v4;
  v6 = v4;
  -[PKSubcredentialProvisioningController cancelProvisioningWithCompletion:](provisioningController, "cancelProvisioningWithCompletion:", v7);

}

uint64_t __73__PKSubcredentialProvisioningViewModel_cancelProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setNewAuthRandomIfNecessaryWithConfiguration:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "configurationType");
  if (v7 - 2 < 2)
  {
    objc_msgSend(v5, "remoteDeviceInvitation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteDeviceWebService");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v7 <= 1)
  {
    objc_msgSend(v5, "localDeviceConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "webService");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;

    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:
  objc_msgSend(v10, "targetDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __96__PKSubcredentialProvisioningViewModel_setNewAuthRandomIfNecessaryWithConfiguration_completion___block_invoke;
    v14[3] = &unk_1E3E6DB58;
    v15 = v6;
    objc_msgSend(v11, "paymentWebService:setNewAuthRandomIfNecessaryReturningPairingState:", v10, v14);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Missing target device", v13, 2u);
    }

    if (v6)
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

uint64_t __96__PKSubcredentialProvisioningViewModel_setNewAuthRandomIfNecessaryWithConfiguration_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)rescindSimilarInvitationsToSharingRequest:(id)a3 withWebService:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  uint8_t v11[16];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  PKLogFacilityTypeGetObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Bypassing rescind step and returning immediately.", v11, 2u);
  }

  if (v9)
    v9[2](v9);

}

- (PKSubcredentialProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningController, a3);
}

- (PKSubcredentialProvisioningConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end
