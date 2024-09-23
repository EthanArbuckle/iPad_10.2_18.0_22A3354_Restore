@implementation PKAccountProvisioningController

- (PKAccountProvisioningController)initWithAccountCredential:(id)a3 provisioningController:(id)a4 accountService:(id)a5
{
  return -[PKAccountProvisioningController initWithAccountCredential:provisioningController:usingRemoteLibrary:](self, "initWithAccountCredential:provisioningController:usingRemoteLibrary:", a3, a4, 0);
}

- (PKAccountProvisioningController)initWithAccountCredential:(id)a3 provisioningController:(id)a4 usingRemoteLibrary:(BOOL)a5
{
  id v9;
  id v10;
  PKAccountProvisioningController *v11;
  PKAccountProvisioningController *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKAccountProvisioningController;
  v11 = -[PKAccountProvisioningController init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_provisioningController, a4);
    objc_storeStrong((id *)&v12->_accountCredential, a3);
    v12->_usingRemoteLibrary = a5;
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[PKAccountProvisioningController _stopPassActivationObserver](self, "_stopPassActivationObserver");
  v3.receiver = self;
  v3.super_class = (Class)PKAccountProvisioningController;
  -[PKAccountProvisioningController dealloc](&v3, sel_dealloc);
}

- (void)provisionAccountPassToLocalDevice
{
  NSObject *v3;
  PKAccountCredential *accountCredential;
  PKPaymentProvisioningController *provisioningController;
  _QWORD v6[5];
  id v7;
  id buf[2];

  PKLogFacilityTypeGetObject(0xEuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Requesting local device provisioning of credential", (uint8_t *)buf, 2u);
  }

  if ((self->_provisionLocalPassState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    *(int64x2_t *)&self->_provisionLocalPassState = vdupq_n_s64(2uLL);
    -[PKAccountProvisioningController _stopPassActivationObserver](self, "_stopPassActivationObserver");
    objc_initWeak(buf, self);
    accountCredential = self->_accountCredential;
    provisioningController = self->_provisioningController;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke;
    v6[3] = &unk_1E2ACD960;
    objc_copyWeak(&v7, buf);
    v6[4] = self;
    -[PKAccountProvisioningController _setupAccountAndProvisionAccountCredenital:provisioningController:completion:](self, "_setupAccountAndProvisionAccountCredenital:provisioningController:completion:", accountCredential, provisioningController, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
}

void __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  id *v9;
  _QWORD *WeakRetained;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void (**v20)(void);
  unint64_t v21;
  uint64_t v22;
  void (**v23)(void);
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD aBlock[4];
  id v32;
  uint8_t buf[4];
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(0xEuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("YES");
    if (!v5)
      v8 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v34 = v8;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Finished provisioning to local device with success: %@", buf, 0xCu);
  }

  v9 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      WeakRetained[10] = 0;
      WeakRetained[11] = 0;
      objc_msgSend(WeakRetained, "_informDelegateOfError:", v6);
    }
    else
    {
      objc_msgSend(v5, "uniqueID");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v11[9];
      v11[9] = v12;

      objc_msgSend((id)v11[2], "setPaymentPass:", v5);
      if (objc_msgSend((id)objc_opt_class(), "_isPaymentPassActivated:forAccountCredential:", v5, v11[2]))
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 1;
        v11[11] = 3;
      }
      else
      {
        objc_msgSend(v11, "_startPassActivationObserver");
      }
      objc_msgSend((id)v11[2], "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accountIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_21;
      aBlock[3] = &unk_1E2AC3648;
      objc_copyWeak(&v32, v9);
      v17 = _Block_copy(aBlock);
      v24 = v16;
      v25 = 3221225472;
      v26 = __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_3;
      v27 = &unk_1E2ACD938;
      objc_copyWeak(&v30, v9);
      v18 = v15;
      v28 = v18;
      v19 = v17;
      v29 = v19;
      v20 = (void (**)(void))_Block_copy(&v24);
      v21 = objc_msgSend(v14, "type", v24, v25, v26, v27);
      if (v21 <= 4)
      {
        v22 = 1 << v21;
        v23 = v20;
        if ((v22 & 0x1A) == 0)
          v23 = (void (**)(void))v19;
        v23[2]();
      }

      objc_destroyWeak(&v30);
      objc_destroyWeak(&v32);

    }
  }

}

void __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_21(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_2;
    block[3] = &unk_1E2ABE120;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 3;
  objc_msgSend(*(id *)(a1 + 32), "_informDelegateOfStateUpdate");
  return objc_msgSend(*(id *)(a1 + 32), "_processRemainingTasks");
}

void __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  __int16 v8;
  _QWORD v9[4];
  id v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "webService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_4;
      v9[3] = &unk_1E2ACD910;
      v6 = *(_QWORD *)(a1 + 32);
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v5, "paymentWebService:updateAccountWithIdentifier:completion:", v4, v6, v9);

    }
    else
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 0;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Error: Target device does not support updating account", (uint8_t *)&v8, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

uint64_t __68__PKAccountProvisioningController_provisionAccountPassToLocalDevice__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)makeAccountPassDefaultOnLocalDevice
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  NSObject *v9;
  __int16 v10;
  uint8_t buf[16];
  __int16 v12;

  if ((self->_makeAccountPassDefaultOnLocalDeviceState & 0xFFFFFFFFFFFFFFFELL) == 2)
    return;
  if (!-[NSString length](self->_provisionedPassUniqueID, "length"))
  {
    if (self->_makeAccountPassDefaultOnLocalDeviceState == 1)
      return;
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v12 = 0;
    v7 = "Pass provisioning not complete - queueing work to make it default";
    v8 = (uint8_t *)&v12;
    goto LABEL_16;
  }
  if (!self->_passIsActivated)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:

      self->_makeAccountPassDefaultOnLocalDeviceState = 1;
      return;
    }
    v10 = 0;
    v7 = "Pass is not yet activated, queuing request";
    v8 = (uint8_t *)&v10;
LABEL_16:
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    goto LABEL_17;
  }
  self->_makeAccountPassDefaultOnLocalDeviceState = 2;
  -[PKAccountCredential paymentPass](self->_accountCredential, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKEnableAutomaticSelectionForPaymentPass(v3);

  -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "paymentWebService:setDefaultPaymentPassUniqueIdentifier:", v4, self->_provisionedPassUniqueID);
  }
  else
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Error: Target device does not support setting default", buf, 2u);
    }

  }
  self->_makeAccountPassDefaultOnLocalDeviceState = 3;
  -[PKAccountProvisioningController _informDelegateOfStateUpdate](self, "_informDelegateOfStateUpdate");
  -[PKAccountProvisioningController _processRemainingTasks](self, "_processRemainingTasks");

}

- (void)performAMPEnrollmentShouldEnroll:(BOOL)a3 shouldMakeDefault:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  PKAccountProvisioningController *v17;
  id v18;
  uint8_t buf[16];
  _QWORD aBlock[4];
  id v21;
  id v22;
  id location[2];

  if ((self->_addToAMPState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    self->_enrollInAMP = a3;
    self->_makeDefaultInAMP = a3 && a4;
    if (-[NSString length](self->_provisionedPassUniqueID, "length"))
    {
      self->_addToAMPState = 2;
      +[PKAMPEnrollmentManager sharedManager](PKAMPEnrollmentManager, "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountCredential paymentPass](self->_accountCredential, "paymentPass");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKDismissedKeyForPass(CFSTR("AMPEnrollmentDismissed"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(location, self);
      v9 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __86__PKAccountProvisioningController_performAMPEnrollmentShouldEnroll_shouldMakeDefault___block_invoke;
      aBlock[3] = &unk_1E2ACD9B0;
      v10 = v8;
      v21 = v10;
      objc_copyWeak(&v22, location);
      v11 = _Block_copy(aBlock);
      if (a3)
      {
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __86__PKAccountProvisioningController_performAMPEnrollmentShouldEnroll_shouldMakeDefault___block_invoke_30;
        v14[3] = &unk_1E2ACD9D8;
        v15 = v6;
        v16 = v7;
        v17 = self;
        v18 = v11;
        objc_msgSend(v15, "enrollmentStatusForPaymentPass:completion:progress:", v16, v14, v18);

      }
      else
      {
        PKLogFacilityTypeGetObject(0xEuLL);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Skipping making card non default in AMP", buf, 2u);
        }

        (*((void (**)(void *, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
      }

      objc_destroyWeak(&v22);
      objc_destroyWeak(location);

    }
    else if (self->_addToAMPState != 1)
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Pass provisioning not complete - queueing work to add to AMP", (uint8_t *)location, 2u);
      }

      self->_addToAMPState = 1;
    }
  }
}

void __86__PKAccountProvisioningController_performAMPEnrollmentShouldEnroll_shouldMakeDefault___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__PKAccountProvisioningController_performAMPEnrollmentShouldEnroll_shouldMakeDefault___block_invoke_2;
  v7[3] = &unk_1E2ACD988;
  v11 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], v7);
  objc_destroyWeak(&v10);

}

void __86__PKAccountProvisioningController_performAMPEnrollmentShouldEnroll_shouldMakeDefault___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xEuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 32);
    v7[0] = 67109378;
    v7[1] = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "AMP enrollment completed:%d (%@)", (uint8_t *)v7, 0x12u);
  }

  PKSharedCacheSetBoolForKey(*(unsigned __int8 *)(a1 + 56), *(void **)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained && *((_QWORD *)WeakRetained + 15) == 2)
  {
    *((_BYTE *)WeakRetained + 50) = *(_BYTE *)(a1 + 56);
    *((_QWORD *)WeakRetained + 15) = 3;
    objc_msgSend(WeakRetained, "_informDelegateOfStateUpdate");
    objc_msgSend(v6, "_processRemainingTasks");
  }

}

void __86__PKAccountProvisioningController_performAMPEnrollmentShouldEnroll_shouldMakeDefault___block_invoke_30(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = v5;
  if (a2 != 2)
  {
    v7 = v5;
    if (a2 == 1)
      objc_msgSend(*(id *)(a1 + 32), "enrollPaymentPass:isDefault:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 33), *(_QWORD *)(a1 + 56));
    else
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v6 = v7;
  }

}

- (void)addToIDMS
{
  void *v3;
  PKAccountWebServiceAccountActionRequest *v4;
  void *v5;
  void *v6;
  PKAccountAction *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  if ((self->_addToIDMSState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    self->_addToIDMSState = 2;
    -[PKAccountCredential account](self->_accountCredential, "account");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(PKAccountWebServiceAccountActionRequest);
    objc_msgSend(v3, "accountIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceAccountActionRequest setAccountIdentifier:](v4, "setAccountIdentifier:", v5);

    objc_msgSend(v3, "accountBaseURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountWebServiceAccountActionRequest setBaseURL:](v4, "setBaseURL:", v6);

    v7 = objc_alloc_init(PKAccountAction);
    -[PKAccountAction setActionType:](v7, "setActionType:", 1);
    -[PKAccountWebServiceAccountActionRequest setAction:](v4, "setAction:", v7);
    objc_initWeak(&location, self);
    -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__PKAccountProvisioningController_addToIDMS__block_invoke;
    v9[3] = &unk_1E2ACDA00;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "accountActionWithRequest:completion:", v4, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
}

void __44__PKAccountProvisioningController_addToIDMS__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PKAccountProvisioningController_addToIDMS__block_invoke_2;
    block[3] = &unk_1E2ABE120;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __44__PKAccountProvisioningController_addToIDMS__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(0xEuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Completed account pass default in IDMS", v4, 2u);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = 3;
  objc_msgSend(*(id *)(a1 + 32), "_informDelegateOfStateUpdate");
  return objc_msgSend(*(id *)(a1 + 32), "_processRemainingTasks");
}

- (void)provisionAccountPassToWatchAsDefault:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NPKCompanionAgentConnection *v8;
  NPKCompanionAgentConnection *watchConnection;
  void *v10;
  void *v11;
  NPKCompanionAgentConnection *v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD aBlock[4];
  id v20;
  id buf[2];

  v3 = a3;
  if (PKIsPairedWithWatch())
  {
    if ((self->_provisionWatchPassState & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      self->_provisionWatchPassState = 2;
      PKLogFacilityTypeGetObject(0xEuLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Requesting watch provisioning of credential", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      v6 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __72__PKAccountProvisioningController_provisionAccountPassToWatchAsDefault___block_invoke;
      aBlock[3] = &unk_1E2AC3648;
      objc_copyWeak(&v20, buf);
      v7 = _Block_copy(aBlock);
      if (!self->_watchConnection)
      {
        v8 = (NPKCompanionAgentConnection *)objc_alloc_init((Class)getNPKCompanionAgentConnectionClass_1[0]());
        watchConnection = self->_watchConnection;
        self->_watchConnection = v8;

      }
      -[PKAccountCredential account](self->_accountCredential, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accountIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = self->_watchConnection;
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __72__PKAccountProvisioningController_provisionAccountPassToWatchAsDefault___block_invoke_3;
      v16[3] = &unk_1E2ABDAE0;
      v13 = v11;
      v17 = v13;
      v14 = v7;
      v18 = v14;
      -[NPKCompanionAgentConnection provisionPassForAccountIdentifier:makeDefault:completion:](v12, "provisionPassForAccountIdentifier:makeDefault:completion:", v13, v3, v16);

      objc_destroyWeak(&v20);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "No watch paired for provisioning of credential", (uint8_t *)buf, 2u);
    }

  }
}

void __72__PKAccountProvisioningController_provisionAccountPassToWatchAsDefault___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__PKAccountProvisioningController_provisionAccountPassToWatchAsDefault___block_invoke_2;
    block[3] = &unk_1E2ABE120;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __72__PKAccountProvisioningController_provisionAccountPassToWatchAsDefault___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 3;
  objc_msgSend(*(id *)(a1 + 32), "_informDelegateOfStateUpdate");
  return objc_msgSend(*(id *)(a1 + 32), "_processRemainingTasks");
}

void __72__PKAccountProvisioningController_provisionAccountPassToWatchAsDefault___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject(0xEuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Finished provisioning to watch with success: %@ error: %@", (uint8_t *)&v9, 0x16u);
  }

  if (a2)
  {
    +[PKPassLibrary sharedInstanceWithRemoteLibrary](PKPassLibrary, "sharedInstanceWithRemoteLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "paymentPassWithAssociatedAccountIdentifier:completion:", *(_QWORD *)(a1 + 32), &__block_literal_global_96);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __72__PKAccountProvisioningController_provisionAccountPassToWatchAsDefault___block_invoke_36(uint64_t a1, void *a2)
{
  PKEnableAutomaticSelectionForPaymentPass(a2);
}

- (void)_processRemainingTasks
{
  if (self->_addToIDMSState == 1)
    -[PKAccountProvisioningController addToIDMS](self, "addToIDMS");
  if (self->_makeAccountPassDefaultOnLocalDeviceState == 1)
    -[PKAccountProvisioningController makeAccountPassDefaultOnLocalDevice](self, "makeAccountPassDefaultOnLocalDevice");
  if (self->_addToAMPState == 1)
    -[PKAccountProvisioningController performAMPEnrollmentShouldEnroll:shouldMakeDefault:](self, "performAMPEnrollmentShouldEnroll:shouldMakeDefault:", self->_enrollInAMP, self->_makeDefaultInAMP);
}

- (void)_setupAccountAndProvisionAccountCredenital:(id)a3 provisioningController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD aBlock[5];
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__PKAccountProvisioningController__setupAccountAndProvisionAccountCredenital_provisioningController_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDF68;
  v12 = v10;
  aBlock[4] = self;
  v23 = v12;
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __112__PKAccountProvisioningController__setupAccountAndProvisionAccountCredenital_provisioningController_completion___block_invoke_2;
  v17[3] = &unk_1E2ACDA70;
  v18 = v9;
  v19 = v8;
  v20 = _Block_copy(aBlock);
  v21 = v12;
  v13 = v12;
  v14 = v8;
  v15 = v9;
  v16 = v20;
  objc_msgSend(v15, "validatePreconditionsAndRegister:", v17);

}

void __112__PKAccountProvisioningController__setupAccountAndProvisionAccountCredenital_provisioningController_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  if (*(_QWORD *)(a1 + 40))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v6 = a3;
    objc_msgSend(v5, "provisionedPasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "secureElementPass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "paymentPass");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v11;
    if (!a2)
      v10 = 0;
    (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v10, v6);

  }
}

void __112__PKAccountProvisioningController__setupAccountAndProvisionAccountCredenital_provisioningController_completion___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  PKProvisioningContext *v4;
  PKProvisioningBackgroundCoordinator *v5;
  id v6;
  PKProvisioningBackgroundCoordinator *v7;
  _QWORD v8[4];
  PKProvisioningBackgroundCoordinator *v9;
  id v10;

  if (a3 || (a2 & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = -[PKProvisioningContext initWithEnvironment:provisioningController:groupsController:]([PKProvisioningContext alloc], "initWithEnvironment:provisioningController:groupsController:", 0, *(_QWORD *)(a1 + 32), 0);
    v5 = -[PKProvisioningBackgroundCoordinator initWithSetupContext:credential:previouslyAcceptedTerms:]([PKProvisioningBackgroundCoordinator alloc], "initWithSetupContext:credential:previouslyAcceptedTerms:", v4, *(_QWORD *)(a1 + 40), 1);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __112__PKAccountProvisioningController__setupAccountAndProvisionAccountCredenital_provisioningController_completion___block_invoke_3;
    v8[3] = &unk_1E2ACDA48;
    v6 = *(id *)(a1 + 56);
    v9 = v5;
    v10 = v6;
    v7 = v5;
    -[PKProvisioningBackgroundCoordinator startWithCompletion:](v7, "startWithCompletion:", v8);

  }
}

void __112__PKAccountProvisioningController__setupAccountAndProvisionAccountCredenital_provisioningController_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureElementPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject(0xEuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      objc_msgSend(v8, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Sucessfully provisioned pass %@", (uint8_t *)&v14, 0xCu);

    }
    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v8, 0);
  }
  else
  {
    if (v10)
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Pass provisioning failed with error: %@", (uint8_t *)&v14, 0xCu);
    }

    v12 = *(_QWORD *)(a1 + 40);
    if ((objc_msgSend(v5, "hasLocalizedTitleAndMessage") & 1) != 0)
    {
      objc_msgSend(v5, "displayableError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v12 + 16))(v12, 0, 0);
    }
  }

}

+ (BOOL)_isPaymentPassActivated:(id)a3 forAccountCredential:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v5 = a3;
  objc_msgSend(a4, "passDetailsResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "status");

  v8 = (unint64_t)(v7 + 1) <= 6
    && (((1 << (v7 + 1)) & 0x47) == 0 || !objc_msgSend(v5, "activationState"));

  return v8;
}

- (id)_notificationDidChangeNames
{
  if (self->_usingRemoteLibrary)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("PKPassLibraryRemotePaymentPassesDidChange"), CFSTR("PKPassLibraryDidChangeNotification"), 0);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("PKPassLibraryDidChangeNotification"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_startPassActivationObserver
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  OS_dispatch_source *v11;
  OS_dispatch_source *activationTimer;
  dispatch_time_t v13;
  NSObject *v14;
  _QWORD handler[4];
  id v16;
  id buf[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xEuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Starting pass activiation observer", (uint8_t *)buf, 2u);
  }

  -[PKAccountProvisioningController _notificationDidChangeNames](self, "_notificationDidChangeNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__passLibraryDidChange_, v9, 0);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  if (self->_passActivationTimeout > 0.0 && !self->_activationTimer)
  {
    v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    activationTimer = self->_activationTimer;
    self->_activationTimer = v11;

    v13 = dispatch_time(0, (uint64_t)(self->_passActivationTimeout * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->_activationTimer, v13, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    objc_initWeak(buf, self);
    v14 = self->_activationTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __63__PKAccountProvisioningController__startPassActivationObserver__block_invoke;
    handler[3] = &unk_1E2AC3648;
    objc_copyWeak(&v16, buf);
    dispatch_source_set_event_handler(v14, handler);
    dispatch_resume((dispatch_object_t)self->_activationTimer);
    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
  }

}

void __63__PKAccountProvisioningController__startPassActivationObserver__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Pass activation timeout occured. Forcing activiation callback", v5, 2u);
    }

    v3 = WeakRetained[5];
    if (v3)
    {
      dispatch_source_cancel(v3);
      v4 = (void *)WeakRetained[5];
      WeakRetained[5] = 0;

    }
    objc_msgSend(WeakRetained, "_handlePassActiviated");
  }

}

- (void)_stopPassActivationObserver
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *activationTimer;
  OS_dispatch_source *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xEuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Stopping pass activiation observer", buf, 2u);
  }

  -[PKAccountProvisioningController _notificationDidChangeNames](self, "_notificationDidChangeNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObserver:name:object:", self, v9, 0);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v6);
  }
  activationTimer = self->_activationTimer;
  if (activationTimer)
  {
    dispatch_source_cancel(activationTimer);
    v12 = self->_activationTimer;
    self->_activationTimer = 0;

  }
}

- (void)_passLibraryDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD block[5];
  _QWORD v10[6];
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  PKLogFacilityTypeGetObject(0xEuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Pass activiation observer - library did change", buf, 2u);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PKPassLibraryReplacementPassesUserInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    *(_QWORD *)buf = 0;
    v12 = buf;
    v13 = 0x2020000000;
    v14 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__PKAccountProvisioningController__passLibraryDidChange___block_invoke;
    v10[3] = &unk_1E2ACDA98;
    v10[4] = self;
    v10[5] = buf;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
    if (v12[24])
    {
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __57__PKAccountProvisioningController__passLibraryDidChange___block_invoke_2;
      block[3] = &unk_1E2ABE120;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    _Block_object_dispose(buf, 8);
  }

}

void __57__PKAccountProvisioningController__passLibraryDidChange___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  id v8;

  objc_msgSend(a2, "paymentPass");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

  if (v7)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend((id)objc_opt_class(), "_isPaymentPassActivated:forAccountCredential:", v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  }

}

uint64_t __57__PKAccountProvisioningController__passLibraryDidChange___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(0xEuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "Pass activation change detected", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_handlePassActiviated");
}

- (void)_handlePassActiviated
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_localPassActivationState != 3)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Pass activated", v4, 2u);
    }

    self->_passIsActivated = 1;
    self->_localPassActivationState = 3;
    -[PKAccountProvisioningController _stopPassActivationObserver](self, "_stopPassActivationObserver");
    -[PKAccountProvisioningController _informDelegateOfStateUpdate](self, "_informDelegateOfStateUpdate");
    -[PKAccountProvisioningController _processRemainingTasks](self, "_processRemainingTasks");
  }
}

- (void)_informDelegateOfError:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "accountProvisioningController:displayableError:", self, v7);

  }
}

- (void)_informDelegateOfStateUpdate
{
  PKAccountProvisioningControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "accountProvisioningControllerUpdatedState:", self);

  }
}

- (double)passActivationTimeout
{
  return self->_passActivationTimeout;
}

- (void)setPassActivationTimeout:(double)a3
{
  self->_passActivationTimeout = a3;
}

- (PKAccountProvisioningControllerDelegate)delegate
{
  return (PKAccountProvisioningControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)provisionedPassUniqueID
{
  return self->_provisionedPassUniqueID;
}

- (void)setProvisionedPassUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)didAddToAMP
{
  return self->_didAddToAMP;
}

- (void)setDidAddToAMP:(BOOL)a3
{
  self->_didAddToAMP = a3;
}

- (unint64_t)provisionLocalPassState
{
  return self->_provisionLocalPassState;
}

- (unint64_t)localPassActivationState
{
  return self->_localPassActivationState;
}

- (unint64_t)provisionWatchPassState
{
  return self->_provisionWatchPassState;
}

- (unint64_t)addToIDMSState
{
  return self->_addToIDMSState;
}

- (unint64_t)makeAccountPassDefaultOnLocalDeviceState
{
  return self->_makeAccountPassDefaultOnLocalDeviceState;
}

- (unint64_t)addToAMPState
{
  return self->_addToAMPState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisionedPassUniqueID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activationTimer, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_accountCredential, 0);
  objc_storeStrong((id *)&self->_watchConnection, 0);
}

@end
