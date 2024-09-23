@implementation PKSubcredentialPairingFlowController

+ (id)contextFromPaymentCredential:(id)a3 provisioningController:(id)a4
{
  id v5;
  id v6;
  PKSubcredentialPairingFlowControllerContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v7 = -[PKSubcredentialPairingFlowControllerContext initWithFlowType:referralSource:]([PKSubcredentialPairingFlowControllerContext alloc], "initWithFlowType:referralSource:", 4, 8);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialProvisioningFlowControllerContext setLocalDeviceWebService:](v7, "setLocalDeviceWebService:", v8);

  objc_msgSend(v5, "webService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialProvisioningFlowControllerContext setRemoteDeviceWebService:](v7, "setRemoteDeviceWebService:", v9);

  objc_msgSend(v6, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialProvisioningFlowControllerContext setProvisionedPass:](v7, "setProvisionedPass:", v10);

  objc_msgSend(v6, "credentialToShare");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSubcredentialPairingFlowControllerContext setCredentialToShare:](v7, "setCredentialToShare:", v11);
  +[PKSubcredentialPairingFlowController sharingRequestForContext:withCredential:](PKSubcredentialPairingFlowController, "sharingRequestForContext:withCredential:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSubcredentialPairingFlowControllerContext setRemoteDeviceSharingRequest:](v7, "setRemoteDeviceSharingRequest:", v12);

  -[PKSubcredentialPairingFlowControllerContext setProvisioningController:](v7, "setProvisioningController:", v5);
  return v7;
}

- (PKSubcredentialPairingFlowController)initWithDelegate:(id)a3
{
  id v4;
  PKSubcredentialPairingFlowController *v5;
  PKSubcredentialPairingFlowController *v6;

  v4 = a3;
  v5 = -[PKSubcredentialPairingFlowController init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)nextViewControllerFromProvisioningOperation:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __objc2_class **v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __objc2_class *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  void (**v29)(id, void *);
  id v30;
  id buf[2];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (!v7)
    goto LABEL_37;
  objc_msgSend(v6, "provisioningContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  switch(objc_msgSend(v6, "operation"))
  {
    case 0:
    case 2:
      objc_msgSend(v9, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D6B9E8]) && objc_msgSend(v10, "code") == 3)
      {
        v12 = objc_msgSend(v9, "passwordManuallyEntered");

        if ((v12 & 1) != 0)
        {
          v13 = off_1E3E1D408;
LABEL_9:
          v14 = (void *)objc_msgSend(objc_alloc(*v13), "initWithFlowController:context:", self, v9);
          objc_msgSend(v9, "setError:", 0);
          v7[2](v7, v14);

          goto LABEL_27;
        }
      }
      else
      {

      }
      v13 = &off_1E3E1D410;
      goto LABEL_9;
    case 1:
      -[PKSubcredentialPairingFlowController nextViewControllerFromHeroViewController:completion:](self, "nextViewControllerFromHeroViewController:completion:", v6, v7);
      goto LABEL_36;
    case 3:
      objc_msgSend(v9, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {

      }
      else
      {
        objc_msgSend(v9, "provisionedPass");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v21 = PKSubcredentialPairingCompletedViewController;
LABEL_26:
          v14 = (void *)objc_msgSend([v21 alloc], "initWithFlowController:context:", self, v9);
          v7[2](v7, v14);
LABEL_27:

          goto LABEL_36;
        }
      }
      if (!objc_msgSend(v9, "shouldExitFlowOnError"))
      {
        v21 = PKSubcredentialPairingErrorViewController;
        goto LABEL_26;
      }
      PKLogFacilityTypeGetObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Exiting flow due to error", (uint8_t *)buf, 2u);
      }

LABEL_22:
      v7[2](v7, 0);
LABEL_36:

LABEL_37:
      return;
    case 4:
      objc_msgSend((id)objc_opt_class(), "credentialToShareForContext:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "sharingRequestForContext:withCredential:", v9, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v9, "remoteDeviceWebService");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_initWeak(buf, self);
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __99__PKSubcredentialPairingFlowController_nextViewControllerFromProvisioningOperation_withCompletion___block_invoke;
          v25[3] = &unk_1E3E645B8;
          objc_copyWeak(&v30, buf);
          v26 = v9;
          v27 = v17;
          v28 = v18;
          v29 = v7;
          -[PKSubcredentialPairingFlowController canProvisionOnRemoteDeviceWithContext:sharingRequest:completion:](self, "canProvisionOnRemoteDeviceWithContext:sharingRequest:completion:", v26, v28, v25);

          objc_destroyWeak(&v30);
          objc_destroyWeak(buf);
        }
        else
        {
          PKLogFacilityTypeGetObject();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, "No remote device to accept invitation with", (uint8_t *)buf, 2u);
          }

          v7[2](v7, 0);
        }

      }
      else
      {
        PKLogFacilityTypeGetObject();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_19D178000, v23, OS_LOG_TYPE_DEFAULT, "No invitation to send to remote device", (uint8_t *)buf, 2u);
        }

        v7[2](v7, 0);
      }

      goto LABEL_36;
    case 5:
      objc_msgSend(v9, "provisionedRemotePass");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_22;
      v21 = PKAddCredentialToWatchCompletedViewController;
      goto LABEL_26;
    case 6:
      goto LABEL_22;
    default:
      goto LABEL_36;
  }
}

void __99__PKSubcredentialPairingFlowController_nextViewControllerFromProvisioningOperation_withCompletion___block_invoke(id *a1, char a2)
{
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;

  WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __99__PKSubcredentialPairingFlowController_nextViewControllerFromProvisioningOperation_withCompletion___block_invoke_2;
    v6[3] = &unk_1E3E64590;
    v12 = a2;
    v7 = a1[4];
    v8 = a1[5];
    v9 = a1[6];
    v5 = a1[7];
    v10 = WeakRetained;
    v11 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __99__PKSubcredentialPairingFlowController_nextViewControllerFromProvisioningOperation_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  PKAddCredentialToWatchViewController *v4;
  uint8_t buf[16];

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCredentialToShare:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setRemoteDeviceSharingRequest:", *(_QWORD *)(a1 + 48));
    v2 = *(_QWORD *)(a1 + 64);
    v4 = -[PKAddCredentialToWatchViewController initWithFlowController:context:]([PKAddCredentialToWatchViewController alloc], "initWithFlowController:context:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
    (*(void (**)(uint64_t, PKAddCredentialToWatchViewController *))(v2 + 16))(v2, v4);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Remote device can't accept invitation", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

- (void)nextViewControllerFromHeroViewController:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  __objc2_class **v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];

  v6 = (void (**)(id, void *))a4;
  objc_msgSend(a3, "provisioningContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "flowType");
  v9 = off_1E3E1D408;
  switch(v8)
  {
    case 0:
      goto LABEL_7;
    case 2:
      objc_msgSend(v7, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "password");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v12)
        v9 = &off_1E3E1D410;
LABEL_7:
      v13 = (void *)objc_msgSend(objc_alloc(*v9), "initWithFlowController:context:", self, v7);
      if (v13)
        goto LABEL_11;
      break;
    case 1:
      v9 = &off_1E3E1D410;
      goto LABEL_7;
  }
  PKLogFacilityTypeGetObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Invalid flow type to advance from.", v15, 2u);
  }

  v13 = 0;
LABEL_11:
  if (v6)
    v6[2](v6, v13);

}

- (void)provisioningFinishedWithOperation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  PKSubcredentialPairingFlowController *v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __74__PKSubcredentialPairingFlowController_provisioningFinishedWithOperation___block_invoke;
  v10 = &unk_1E3E61388;
  v11 = v4;
  v12 = self;
  v5 = v4;
  v6 = _Block_copy(&v7);
  -[PKSubcredentialPairingFlowController _handOffToFlowManagerFromOperation:completion:](self, "_handOffToFlowManagerFromOperation:completion:", v5, v6, v7, v8, v9, v10);

}

void __74__PKSubcredentialPairingFlowController_provisioningFinishedWithOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "provisioningContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = *(void **)(a1 + 32);
  else
    v3 = 0;
  v4 = v3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "operation");
    v13 = 134217984;
    v14 = v6;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Provisioning was finished on operation: %ld", (uint8_t *)&v13, 0xCu);
  }

  +[PKSubcredentialPairingAnalyticsReporter endSubcredentialPairingSession](PKSubcredentialPairingAnalyticsReporter, "endSubcredentialPairingSession");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", v4);
  }
  else
  {
    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v2, "provisionedPass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subcredentialProvisioningFlowController:didFinishWithPass:error:", v10, v11, v12);

  }
}

- (void)provisioningWasCanceledWithOperation:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v4, "operation");
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Provisioning was cancelled on operation: %ld", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);
  if (WeakRetained)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v4;
    else
      v7 = 0;
    v8 = v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "viewControllerDidCancelSetupFlow:", v8);
    else
      objc_msgSend(WeakRetained, "viewControllerDidTerminateSetupFlow:", v8);
  }
  else
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "userCanceledPairingWithSubcredentialProvisioningFlowController:", self);
  }

}

- (void)_handOffToFlowManagerFromOperation:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "provisioningContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  objc_msgSend(v7, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "provisioningController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKHeadUnitPairingFlowBridge startHeadUnitPairingFlowWithContext:navController:provisioningController:completion:](PKHeadUnitPairingFlowBridge, "startHeadUnitPairingFlowWithContext:navController:provisioningController:completion:", v10, v8, v9, v5);

}

- (id)localDeviceProvisioningViewModelForOperation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PKSubcredentialProvisioningViewModel *v23;
  NSObject *v24;
  id v26;
  PKSubcredentialProvisioningViewModel *v27;
  void *v28;
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(v3, "provisioningContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v27 = -[PKSubcredentialProvisioningViewModel initWithDelegate:]([PKSubcredentialProvisioningViewModel alloc], "initWithDelegate:", v3);
    -[PKSubcredentialProvisioningViewModel provisioningController](v27, "provisioningController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v3;
    objc_msgSend(v3, "pairingSessionWithDelegate:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "localDeviceWebService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "targetDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceDescriptionForPaymentWebService:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0D66C08]);
    objc_msgSend(v5, "issuerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithMake:model:keyType:", v12, v13, 0);

    v15 = objc_alloc(MEMORY[0x1E0D676F8]);
    objc_msgSend(v5, "password");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "issuerIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "manufacturerIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)v7;
    v19 = (void *)objc_msgSend(v15, "initWithSession:pairingPassword:keyName:issuerIdentifier:manufacturerIdentifier:webService:registrationMetadata:radioTechnologies:", v7, v16, v10, v17, v18, v8, v14, objc_msgSend(v5, "supportedRadioTechnologies"));

    objc_msgSend(v4, "appEntitlementWhitelist");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "applicationID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAppIdentifier:", v22);

    }
    v23 = v27;
    -[PKSubcredentialProvisioningViewModel setConfig:](v27, "setConfig:", v19);

    v3 = v26;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, "Starting provisioning without config?", buf, 2u);
    }

    v23 = 0;
  }

  return v23;
}

- (id)remoteDeviceProvisioningViewModelForOperation:(id)a3
{
  id v3;
  void *v4;
  PKSubcredentialProvisioningViewModel *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  id v18;
  uint64_t v19;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "provisioningContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKSubcredentialProvisioningViewModel initWithDelegate:]([PKSubcredentialProvisioningViewModel alloc], "initWithDelegate:", v3);
  objc_msgSend(v4, "credentialToShare");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isShareable"))
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Configuring remote device provisioning for sharing flow", (uint8_t *)&v21, 2u);
    }

    -[PKSubcredentialProvisioningViewModel provisioningController](v5, "provisioningController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sharingSessionWithDelegate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0D67700]);
    objc_msgSend(v4, "remoteDeviceSharingRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localDeviceWebService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteDeviceWebService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithSharingRequest:sharingSession:localDeviceWebService:remoteDeviceWebService:userAuthDelegate:", v11, v9, v12, v13, v3);

  }
  else
  {
    v15 = objc_msgSend(v4, "shouldRequestInvitation");
    PKLogFacilityTypeGetObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = "No";
      if ((_DWORD)v15)
        v17 = "Yes";
      v21 = 136315138;
      v22 = v17;
      _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Configuring remote device provisioning for accept invite flow (requesting invite: %s)", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend(v4, "remoteDeviceInvitation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0D676E8]);
    v19 = objc_msgSend(v4, "declineRelatedInvitations");
    objc_msgSend(v4, "localDeviceWebService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteDeviceWebService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v18, "initWithInvitation:canRequestInvitation:declineRelatedInvitations:localDeviceWebService:remoteDeviceWebService:", v9, v15, v19, v11, v12);
  }

  -[PKSubcredentialProvisioningViewModel setConfig:](v5, "setConfig:", v14);
  return v5;
}

- (void)canProvisionOnRemoteDeviceWithContext:(id)a3 sharingRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    objc_msgSend(v8, "localDeviceWebService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteDeviceWebService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "targetDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (v9)
      {
        objc_msgSend(v9, "credential");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isShareable") & 1) != 0)
        {
          if (v13)
          {
            objc_msgSend(v8, "configuration");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_initWeak(location, self);
            v19[1] = 3221225472;
            v19[2] = __104__PKSubcredentialPairingFlowController_canProvisionOnRemoteDeviceWithContext_sharingRequest_completion___block_invoke;
            v19[3] = &unk_1E3E645E0;
            v19[0] = MEMORY[0x1E0C809B0];
            objc_copyWeak(&v26, location);
            v25 = v10;
            v20 = v11;
            v21 = v13;
            v22 = v9;
            v23 = v12;
            v16 = v15;
            v24 = v16;
            objc_msgSend(v21, "paymentWebService:canAddSecureElementPassWithConfiguration:completion:", v23, v16, v19);

            objc_destroyWeak(&v26);
            objc_destroyWeak(location);

LABEL_19:
            goto LABEL_20;
          }
          PKLogFacilityTypeGetObject();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(location[0]) = 0;
            _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Target device not found", (uint8_t *)location, 2u);
          }
        }
        else
        {
          PKLogFacilityTypeGetObject();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(location[0]) = 138412290;
            *(id *)((char *)location + 4) = v14;
            _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Unable to share credential: %@", (uint8_t *)location, 0xCu);
          }
        }

        (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
        goto LABEL_19;
      }
      PKLogFacilityTypeGetObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "No sharing request to check", (uint8_t *)location, 2u);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "No remote device to check if it can accept invitation on", (uint8_t *)location, 2u);
      }
    }

    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
LABEL_20:

  }
}

void __104__PKSubcredentialPairingFlowController_canProvisionOnRemoteDeviceWithContext_sharingRequest_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    if (WeakRetained)
    {
      objc_msgSend(*(id *)(a1 + 32), "targetDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "paymentWebService:supportedRegionFeatureOfType:", *(_QWORD *)(a1 + 32), 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "ownerSharingOSVersionRequirement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "deviceVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "deviceClass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "versionMeetsRequirements:deviceClass:", v10, v11);

      if ((v12 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "invitations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count") == 1)
        {
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v15 = *(void **)(a1 + 40);
            v16 = *(_QWORD *)(a1 + 56);
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __104__PKSubcredentialPairingFlowController_canProvisionOnRemoteDeviceWithContext_sharingRequest_completion___block_invoke_57;
            v22[3] = &unk_1E3E63438;
            v23 = *(id *)(a1 + 72);
            objc_msgSend(v15, "paymentWebService:canAcceptInvitation:withCompletionV2:", v16, v14, v22);

          }
          else
          {
            PKLogFacilityTypeGetObject();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19D178000, v21, OS_LOG_TYPE_DEFAULT, "Unable to check if target device supports invitation", buf, 2u);
            }

            (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
          }

        }
        else
        {
          PKLogFacilityTypeGetObject();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "No invitations no check", buf, 2u);
          }

          (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
        }

      }
      else
      {
        PKLogFacilityTypeGetObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "Sharing is not allowed to this device", buf, 2u);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      }

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Device cannot add secure element pass with configuration: %@. Error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __104__PKSubcredentialPairingFlowController_canProvisionOnRemoteDeviceWithContext_sharingRequest_completion___block_invoke_57(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Device can not accept invitation: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)prewarmPairingWithContext:(id)a3 completion:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0D66C90];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v7, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "manufacturerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v9, "issuerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__PKSubcredentialPairingFlowController_prewarmPairingWithContext_completion___block_invoke;
  v12[3] = &unk_1E3E63438;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v8, "prewarmWithManufacturerIdentifier:completion:", v10, v12);

}

void __77__PKSubcredentialPairingFlowController_prewarmPairingWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __77__PKSubcredentialPairingFlowController_prewarmPairingWithContext_completion___block_invoke_2;
    v5[3] = &unk_1E3E618A0;
    v7 = v4;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __77__PKSubcredentialPairingFlowController_prewarmPairingWithContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)sharingRequestForContext:(id)a3 withCredential:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "provisionedPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "No pass to create invitation from", (uint8_t *)&v21, 2u);
    }
    goto LABEL_9;
  }
  if (!a4)
  {
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "uniqueID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v19;
      _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Pass (%@) has no credentials to create invitation from", (uint8_t *)&v21, 0xCu);

    }
LABEL_9:

    v13 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v5, "localDeviceWebService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "provisionedPass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entitlementsForPassIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "pk_firstObjectPassingTest:", &__block_literal_global_30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66AA8]), "initWithPaymentPass:entitlements:", v6, v11);
    objc_msgSend(v13, "setEntitlement:", v12);
    objc_msgSend(v5, "remoteDeviceWebService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "targetDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deviceDescriptionForPaymentWebService:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRecipientName:", v16);

    objc_msgSend(v15, "deviceIDSIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRecipientIdentifier:", v17);

    objc_msgSend(v13, "setForLocalDevice:", 1);
  }
  else
  {
    v13 = 0;
  }

LABEL_12:
  return v13;
}

uint64_t __80__PKSubcredentialPairingFlowController_sharingRequestForContext_withCredential___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "active");
}

+ (id)credentialToShareForContext:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "provisionedPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "devicePaymentApplications", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v4);
      objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "subcredentials");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (id)startingViewControllerForContext:(id)a3
{
  id v4;
  unint64_t v5;
  __objc2_class *v6;
  void *v7;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "flowType");
  if (v5 < 3)
  {
    v6 = PKSubcredentialHeroViewController;
LABEL_5:
    v7 = (void *)objc_msgSend([v6 alloc], "initWithFlowController:context:", self, v4);
    goto LABEL_6;
  }
  if (v5 - 3 < 2)
  {
    v6 = PKAddCredentialToWatchViewController;
    goto LABEL_5;
  }
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = objc_msgSend(v4, "flowType");
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Unsupported flow type: %ld", (uint8_t *)&v10, 0xCu);
  }

  v7 = 0;
LABEL_6:

  return v7;
}

- (id)alertForOperation:(id)a3 withError:(id)a4 retryHandler:(id)a5 cancelationHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  char v47;
  uint64_t v48;
  const __CFString *v49;
  const __CFString *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  __CFString *v56;
  uint64_t v57;
  __CFString *v58;
  __CFString *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v72;
  char v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  PKSubcredentialPairingFlowController *v79;
  void *v80;
  void *v81;
  void *v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[4];
  id v86;
  uint8_t buf[4];
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    v79 = self;
    objc_msgSend(v10, "provisioningContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "provisionedPass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "provisioningContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "credentialToShare");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v15)
      v19 = objc_msgSend(v17, "isShareable");
    else
      v19 = 1;
    -[NSObject domain](v11, "domain");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v80, "isEqualToString:", *MEMORY[0x1E0D6B9E8]))
    {
      v77 = v16;
      PKLogFacilityTypeGetObject();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v80;
        _os_log_impl(&dword_19D178000, v29, OS_LOG_TYPE_DEFAULT, "Unexpected domain to create alert from: %@", buf, 0xCu);
      }
      v30 = 0;
      v31 = 0;
      v81 = 0;
      v82 = 0;
      goto LABEL_70;
    }
    v73 = v19;
    v21 = v13;
    v76 = v12;
    v22 = v18;
    -[NSObject userInfo](v11, "userInfo");
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v23, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "code");
    if ((objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0D69DC8]) & 1) != 0)
    {
      -[PKSubcredentialPairingFlowController localizedIssuerNameForProvisioningOperation:](v79, "localizedIssuerNameForProvisioningOperation:", v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v21;
      PKAlertForSubcredentialDisplayableErrorWithCancelHandler(v24, v27, v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v22;
      v12 = v76;
      v13 = v28;
LABEL_80:

      goto LABEL_81;
    }
    v72 = v23;
    v77 = v16;
    v74 = v25;
    if (objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0CB32E8]) && (v26 == -1001 || v26 == -1009))
    {
      PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_CONNECTIVITY_BODY"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v22;
      v12 = v76;
      if (v76)
        PKLocalizedString(CFSTR("CANCEL_BUTTON_TITLE"));
      else
        PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v24;
      v13 = v21;
      PKLocalizedPaymentString(CFSTR("TRY_AGAIN_BUTTON_TITLE"));
      v33 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = v22;
      if ((objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0D6BCB8]) & 1) == 0
        && !objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0D6B0B8]))
      {
        PKSubcredentialProvisioningDisplayableDAError();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v76;
        if (v34)
        {
          v78 = v18;
          PKLogFacilityTypeGetObject();
          v35 = objc_claimAutoreleasedReturnValue();
          v13 = v21;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v88 = v34;
            _os_log_impl(&dword_19D178000, v35, OS_LOG_TYPE_DEFAULT, "Will display DA error: %@", buf, 0xCu);
          }

          v36 = v34;
          v11 = v36;
          v18 = v78;
        }
        else
        {
          v13 = v21;
        }

        v30 = 0;
        v75 = 0;
        v81 = 0;
        v82 = 0;
        v32 = v24;
        goto LABEL_33;
      }
      v32 = v24;
      objc_msgSend(v24, "localizedFailureReason");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedRecoverySuggestion");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v12 = v76;
      v13 = v21;
    }
    v81 = (void *)v33;
    if (v30 && v75)
    {
LABEL_69:

      v29 = v72;
      v31 = v75;
LABEL_70:

      if (!objc_msgSend(v30, "length") || !objc_msgSend(v31, "length"))
      {
        PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
        v61 = objc_claimAutoreleasedReturnValue();

        -[PKSubcredentialPairingFlowController localizedIssuerNameForProvisioningOperation:](v79, "localizedIssuerNameForProvisioningOperation:", v10);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedCredentialString(CFSTR("CARKEY_FAILED_ADDING_KEY"), CFSTR("%@"), v62);
        v63 = objc_claimAutoreleasedReturnValue();

        PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
        v64 = objc_claimAutoreleasedReturnValue();

        v82 = (void *)v64;
        v31 = (void *)v63;
        v30 = (void *)v61;
      }
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v30, v31, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = MEMORY[0x1E0C809B0];
      if (v13 && v82)
      {
        v66 = (void *)MEMORY[0x1E0DC3448];
        v85[0] = MEMORY[0x1E0C809B0];
        v85[1] = 3221225472;
        v85[2] = __100__PKSubcredentialPairingFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke;
        v85[3] = &unk_1E3E61CA8;
        v86 = v13;
        objc_msgSend(v66, "actionWithTitle:style:handler:", v82, 1, v85);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAction:", v67);

      }
      v68 = v81;
      if (v12 && v81)
      {
        v69 = (void *)MEMORY[0x1E0DC3448];
        v83[0] = v65;
        v83[1] = 3221225472;
        v83[2] = __100__PKSubcredentialPairingFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke_2;
        v83[3] = &unk_1E3E61CA8;
        v84 = v12;
        objc_msgSend(v69, "actionWithTitle:style:handler:", v81, 0, v83);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAction:", v70);

        v68 = v81;
      }

      v16 = v77;
      goto LABEL_80;
    }
LABEL_33:
    switch(-[NSObject code](v11, "code"))
    {
      case 0:
      case 1:
      case 2:
      case 11:
      case 24:
      case 25:
        goto LABEL_40;
      case 3:
        objc_msgSend(v10, "provisioningContext");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "passwordManuallyEntered");

        if ((v47 & 1) != 0)
          goto LABEL_44;
        -[PKSubcredentialPairingFlowController localizedIssuerNameForProvisioningOperation:](v79, "localizedIssuerNameForProvisioningOperation:", v10);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedCredentialString(CFSTR("CARKEY_INVALID_PAIRING_CODE_PROVIDED_TITLE"), CFSTR("%@"), v60);
        v37 = objc_claimAutoreleasedReturnValue();

        v59 = CFSTR("CARKEY_INVALID_PAIRING_CODE_PROVIDED_BODY");
        goto LABEL_65;
      case 4:
      case 10:
      case 22:
LABEL_44:

        v20 = 0;
        v16 = v77;
        goto LABEL_80;
      case 5:
      case 7:
      case 8:
      case 9:
        PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
        v37 = objc_claimAutoreleasedReturnValue();

        -[PKSubcredentialPairingFlowController localizedIssuerNameForProvisioningOperation:](v79, "localizedIssuerNameForProvisioningOperation:", v10);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedCredentialString(CFSTR("CARKEY_FAILED_ADDING_KEY_CAN_RETRY"), CFSTR("%@"), v38);
        v39 = objc_claimAutoreleasedReturnValue();

        if (v12)
          PKLocalizedString(CFSTR("CANCEL_BUTTON_TITLE"));
        else
          PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
        v43 = objc_claimAutoreleasedReturnValue();

        PKLocalizedPaymentString(CFSTR("TRY_AGAIN_BUTTON_TITLE"));
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = v81;
        v81 = (void *)v44;
        v82 = v45;
        goto LABEL_66;
      case 6:
      case 12:
      case 14:
      case 16:
        goto LABEL_37;
      case 13:
      case 15:
        if ((v73 & 1) != 0)
        {
LABEL_37:
          PKLogFacilityTypeGetObject();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D178000, v40, OS_LOG_TYPE_DEFAULT, "Unexpected failure reason", buf, 2u);
          }

LABEL_40:
          PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
          v37 = objc_claimAutoreleasedReturnValue();

          -[PKSubcredentialPairingFlowController localizedIssuerNameForProvisioningOperation:](v79, "localizedIssuerNameForProvisioningOperation:", v10);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedCredentialString(CFSTR("CARKEY_FAILED_ADDING_KEY"), CFSTR("%@"), v41);
          v42 = objc_claimAutoreleasedReturnValue();

          PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
          v43 = objc_claimAutoreleasedReturnValue();
          v75 = (void *)v42;
        }
        else
        {
          PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
          v37 = objc_claimAutoreleasedReturnValue();

          v59 = CFSTR("CARKEY_INVITATION_NEEDS_RESEND_WATCH");
LABEL_65:
          PKLocalizedCredentialString(&v59->isa);
          v39 = objc_claimAutoreleasedReturnValue();

          PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
          v43 = objc_claimAutoreleasedReturnValue();
LABEL_66:
          v75 = (void *)v39;
        }
        v30 = (void *)v37;
        goto LABEL_68;
      case 17:
        PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
        v48 = objc_claimAutoreleasedReturnValue();

        v49 = CFSTR("UNABLE_TO_SHARE_NO_TOKENS_BODY_WATCH");
        v50 = CFSTR("UNABLE_TO_SHARE_NO_TOKENS_BODY");
        goto LABEL_56;
      case 18:
        PKLocalizedCredentialString(CFSTR("CARKEY_BLUETOOTH_ERROR_TITLE"));
        v48 = objc_claimAutoreleasedReturnValue();

        PKLocalizedCredentialString(CFSTR("CARKEY_BLUETOOTH_ERROR_BODY"));
        v51 = objc_claimAutoreleasedReturnValue();

        PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_SETTINGS_BUTTON"));
        v43 = objc_claimAutoreleasedReturnValue();

        PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = v81;
        v81 = (void *)v52;
        v82 = v53;
        goto LABEL_62;
      case 19:
        PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
        v48 = objc_claimAutoreleasedReturnValue();

        PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_CONNECTIVITY_BODY"));
        v51 = objc_claimAutoreleasedReturnValue();

        PKLocalizedPaymentString(CFSTR("TRY_AGAIN_BUTTON_TITLE"));
        v54 = objc_claimAutoreleasedReturnValue();

        PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
        v55 = objc_claimAutoreleasedReturnValue();
        v81 = (void *)v54;
        v32 = v24;
        goto LABEL_61;
      case 20:
        PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
        v48 = objc_claimAutoreleasedReturnValue();

        v49 = CFSTR("CARKEY_DEVICE_NOT_SUPPORTED_WATCH");
        v50 = CFSTR("CARKEY_DEVICE_NOT_SUPPORTED");
        goto LABEL_56;
      case 21:
        PKLocalizedPaymentString(CFSTR("OS_VERSION_UPDATE_REQUIRED_ERROR_TITLE"));
        v48 = objc_claimAutoreleasedReturnValue();

        if (v15)
          v56 = CFSTR("OS_VERSION_UPDATE_REQUIRED_ERROR_MESSAGE_WATCH");
        else
          v56 = CFSTR("OS_VERSION_UPDATE_REQUIRED_ERROR_MESSAGE_IPHONE");
        PKLocalizedPaymentString(&v56->isa);
        v57 = objc_claimAutoreleasedReturnValue();
        goto LABEL_60;
      case 23:
        PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
        v48 = objc_claimAutoreleasedReturnValue();

        v58 = CFSTR("CARKEY_FAILED_ADDING_KEY_BT_LIMIT");
        goto LABEL_59;
      case 26:
        PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
        v48 = objc_claimAutoreleasedReturnValue();

        v58 = CFSTR("CARKEY_NFC_ONLY_NOT_SUPPORTED_ERROR_BODY");
        goto LABEL_59;
      case 27:
        PKLocalizedCredentialString(CFSTR("CARKEY_CANNOT_ADD_TITLE"));
        v48 = objc_claimAutoreleasedReturnValue();

        v49 = CFSTR("CARKEY_CAR_NOT_SUPPORTED_WATCH");
        v50 = CFSTR("CARKEY_CAR_NOT_SUPPORTED");
LABEL_56:
        if (v15)
          v58 = (__CFString *)v49;
        else
          v58 = (__CFString *)v50;
LABEL_59:
        PKLocalizedCredentialString(&v58->isa);
        v57 = objc_claimAutoreleasedReturnValue();
LABEL_60:
        v51 = v57;

        PKLocalizedCredentialString(CFSTR("SUBCREDENTIAL_MESSAGES_OK_BUTTON"));
        v55 = objc_claimAutoreleasedReturnValue();
LABEL_61:
        v43 = v55;
LABEL_62:
        v75 = (void *)v51;
        v30 = (void *)v48;
LABEL_68:

        v82 = (void *)v43;
        break;
      default:
        goto LABEL_69;
    }
    goto LABEL_69;
  }
  PKLogFacilityTypeGetObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Unable to create valid alert, no error set", buf, 2u);
  }
  v20 = 0;
LABEL_81:

  return v20;
}

uint64_t __100__PKSubcredentialPairingFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __100__PKSubcredentialPairingFlowController_alertForOperation_withError_retryHandler_cancelationHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)localizedIssuerNameForProvisioningOperation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(a3, "provisioningContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "issuerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localDeviceWebService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentWebService:supportedRegionFeatureOfType:", v6, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "localizedNameForIssuerWithIdentifier:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    PKLocalizedCredentialString(CFSTR("GENERIC_PARTNER_NAME"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (PKSubcredentialProvisioningFlowControllerDelegate)delegate
{
  return (PKSubcredentialProvisioningFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
