@implementation PKPeerPaymentSetupFlowController

- (PKPeerPaymentSetupFlowController)initWithPeerPaymentCredential:(id)a3 provisioningController:(id)a4 passLibraryDataProvider:(id)a5 configuration:(id)a6 context:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPeerPaymentSetupFlowController *v17;
  PKPeerPaymentSetupFlowController *v18;
  uint64_t v19;
  PKPeerPaymentAccount *peerPaymentAccount;
  PKPassLibraryDataProvider *v21;
  PKPassLibraryDataProvider *passLibraryDataProvider;
  PKPaymentProvisioningController *v23;
  void *provisioningController;
  id v25;
  uint64_t v26;
  PKPaymentProvisioningController *v27;
  uint64_t v28;
  PKPeerPaymentWebService *peerPaymentWebService;
  void *v30;
  void *v31;
  PKPaymentWebService *v32;
  PKPaymentWebService *paymentWebService;
  uint64_t v34;
  PKPeerPaymentService *peerPaymentService;
  PKDeviceSharingCapabilitiesManager *v36;
  PKDeviceSharingCapabilitiesManager *deviceCapabiltiesManager;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  PKPaymentPass *peerPaymentPass;
  PKPaymentPass *v47;
  PKPaymentPass *v48;
  PKPaymentPass *v49;
  uint64_t v50;
  PKPassView *v51;
  uint64_t v52;
  UIImage *passSnapShot;
  void *v54;
  uint64_t v55;
  void *v56;
  _QWORD v58[4];
  id v59;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = -[PKPeerPaymentSetupFlowController init](self, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_peerPaymentCredential, a3);
    -[PKPeerPaymentCredential account](v18->_peerPaymentCredential, "account");
    v19 = objc_claimAutoreleasedReturnValue();
    peerPaymentAccount = v18->_peerPaymentAccount;
    v18->_peerPaymentAccount = (PKPeerPaymentAccount *)v19;

    if (v15)
      v21 = (PKPassLibraryDataProvider *)v15;
    else
      v21 = (PKPassLibraryDataProvider *)objc_alloc_init(MEMORY[0x1E0D66F18]);
    passLibraryDataProvider = v18->_passLibraryDataProvider;
    v18->_passLibraryDataProvider = v21;

    if (v14)
    {
      v23 = (PKPaymentProvisioningController *)v14;
      provisioningController = v18->_provisioningController;
      v18->_provisioningController = v23;
    }
    else
    {
      v25 = objc_alloc(MEMORY[0x1E0D67230]);
      -[PKPeerPaymentSetupFlowController _paymentWebService](v18, "_paymentWebService");
      provisioningController = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "initWithWebService:", provisioningController);
      v27 = v18->_provisioningController;
      v18->_provisioningController = (PKPaymentProvisioningController *)v26;

    }
    v18->_context = a7;
    objc_storeStrong((id *)&v18->_configuration, a6);
    -[PKPeerPaymentSetupFlowController _peerPaymentWebService](v18, "_peerPaymentWebService");
    v28 = objc_claimAutoreleasedReturnValue();
    peerPaymentWebService = v18->_peerPaymentWebService;
    v18->_peerPaymentWebService = (PKPeerPaymentWebService *)v28;

    -[PKPaymentProvisioningController webService](v18->_provisioningController, "webService");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      v32 = v30;
    }
    else
    {
      -[PKPeerPaymentSetupFlowController _paymentWebService](v18, "_paymentWebService");
      v32 = (PKPaymentWebService *)objc_claimAutoreleasedReturnValue();
    }
    paymentWebService = v18->_paymentWebService;
    v18->_paymentWebService = v32;

    -[PKPeerPaymentWebService peerPaymentService](v18->_peerPaymentWebService, "peerPaymentService");
    v34 = objc_claimAutoreleasedReturnValue();
    peerPaymentService = v18->_peerPaymentService;
    v18->_peerPaymentService = (PKPeerPaymentService *)v34;

    v36 = (PKDeviceSharingCapabilitiesManager *)objc_alloc_init(MEMORY[0x1E0D66CC0]);
    deviceCapabiltiesManager = v18->_deviceCapabiltiesManager;
    v18->_deviceCapabiltiesManager = v36;

    -[PKPeerPaymentAccount associatedPassUniqueID](v18->_peerPaymentAccount, "associatedPassUniqueID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentWebService targetDevice](v18->_paymentWebService, "targetDevice");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_opt_respondsToSelector();

    if ((v40 & 1) != 0)
    {
      -[PKPaymentWebService targetDevice](v18->_paymentWebService, "targetDevice");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "paymentWebService:passesOfType:", v18->_paymentWebService, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __135__PKPeerPaymentSetupFlowController_initWithPeerPaymentCredential_provisioningController_passLibraryDataProvider_configuration_context___block_invoke;
      v58[3] = &unk_1E3E6A2B0;
      v59 = v38;
      objc_msgSend(v42, "pk_objectsPassingTest:", v58);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "firstObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "paymentPass");
      v45 = objc_claimAutoreleasedReturnValue();
      peerPaymentPass = v18->_peerPaymentPass;
      v18->_peerPaymentPass = (PKPaymentPass *)v45;

    }
    if (objc_msgSend(v38, "length"))
    {
      v47 = v18->_peerPaymentPass;
      if (v47)
      {
        v48 = v47;
      }
      else
      {
        -[PKPassLibraryDataProvider passWithUniqueID:](v18->_passLibraryDataProvider, "passWithUniqueID:", v38);
        v48 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue();
      }
      v49 = v48;
      -[PKPaymentPass loadImageSetSync:preheat:](v48, "loadImageSetSync:preheat:", 0, 1);
      if (objc_msgSend(v13, "flowState") == 2)
        v50 = 1536;
      else
        v50 = 512;
      v51 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", v49, 5, v50);
      -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v51, "snapshotOfFrontFaceWithRequestedSize:", 257.0, 157.0);
      v52 = objc_claimAutoreleasedReturnValue();
      passSnapShot = v18->_passSnapShot;
      v18->_passSnapShot = (UIImage *)v52;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = *MEMORY[0x1E0D6B2B8];
    -[PKPeerPaymentWebService targetDevice](v18->_peerPaymentWebService, "targetDevice");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObserver:selector:name:object:", v18, sel__handlePeerPaymentAccountDidChangeNotification, v55, v56);

    -[PKPeerPaymentSetupFlowController _fetchAppleCashCapabilitiesIfNecessary](v18, "_fetchAppleCashCapabilitiesIfNecessary");
  }

  return v18;
}

uint64_t __135__PKPeerPaymentSetupFlowController_initWithPeerPaymentCredential_provisioningController_passLibraryDataProvider_configuration_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (id)passesIncludingPeerPaymentPass:(BOOL)a3 isCheckingTotalPassCount:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[PKPaymentWebService targetDevice](self->_paymentWebService, "targetDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paymentWebService:passesOfType:", self->_paymentWebService, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPeerPaymentAccount associatedPassUniqueID](self->_peerPaymentAccount, "associatedPassUniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (a3)
          goto LABEL_11;
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "uniqueID");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = v9;
        v17 = v16;
        if (v15 == v16)
        {

          continue;
        }
        if (v9 && v15)
        {
          v18 = objc_msgSend(v15, "isEqualToString:", v16);

          if ((v18 & 1) != 0)
            continue;
LABEL_11:
          if (a4)
            goto LABEL_16;
          goto LABEL_12;
        }

        if (a4)
        {
LABEL_16:
          objc_msgSend(v22, "addObject:", v14);
          continue;
        }
LABEL_12:
        if ((objc_msgSend(v14, "isHomeKeyPass") & 1) == 0)
          goto LABEL_16;
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  v19 = (void *)objc_msgSend(v22, "copy");
  return v19;
}

- (void)setOperations:(unint64_t)a3
{
  -[PKPeerPaymentSetupFlowController _fitlerOperations:peerPaymentAccount:context:](self, "_fitlerOperations:peerPaymentAccount:context:", a3, self->_peerPaymentAccount, self->_context);
}

- (id)firstPeerPaymentAccountSetupViewController
{
  uint64_t v3;
  __objc2_class **v4;
  void *v5;

  v3 = -[PKPeerPaymentSetupFlowControllerConfiguration peerPaymentSetupConfigurationType](self->_configuration, "peerPaymentSetupConfigurationType");
  if (v3)
  {
    if (v3 != 1)
    {
      v5 = 0;
      return v5;
    }
    v4 = off_1E3E1CA90;
  }
  else
  {
    v4 = &off_1E3E1CBE8;
  }
  v5 = (void *)objc_msgSend(objc_alloc(*v4), "initWithPeerPaymentSetupFlowController:", self);
  return v5;
}

- (void)nextViewControllerAfterPerfomingOperations:(unint64_t)a3 completion:(id)a4
{
  id v6;

  v6 = a4;
  -[PKPeerPaymentSetupFlowController setOperations:](self, "setOperations:", a3);
  -[PKPeerPaymentSetupFlowController _nextViewControllerWithCompletion:](self, "_nextViewControllerWithCompletion:", v6);

}

- (void)_nextViewControllerWithCompletion:(id)a3
{
  id v4;
  unint64_t operations;
  NSObject *v6;
  _BOOL4 v7;
  unint64_t completedOperations;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4)
  {
    operations = self->_operations;
    if ((operations & 1) != 0)
    {
      PKLogFacilityTypeGetObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        PKPeerPaymentSetupOperationDescriptionForOperations(1uLL);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v11;
        _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Processing peer payment setup operation: %@", buf, 0xCu);

      }
      if (!-[PKPeerPaymentSetupFlowController _willDisplayErrorForOperationOperationInContext:completion:](self, "_willDisplayErrorForOperationOperationInContext:completion:", 1, v4))-[PKPeerPaymentSetupFlowController _termsOperationWithTermsResponse:completion:](self, "_termsOperationWithTermsResponse:completion:", 0, v4);
    }
    else if ((operations & 2) != 0)
    {
      PKLogFacilityTypeGetObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        PKPeerPaymentSetupOperationDescriptionForOperations(2uLL);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v13;
        _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Checking peer payment setup operation: %@", buf, 0xCu);

      }
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke;
      v36[3] = &unk_1E3E669E0;
      v36[4] = self;
      v37 = v4;
      -[PKPeerPaymentSetupFlowController _checkManateeCapabilityWithCompletion:](self, "_checkManateeCapabilityWithCompletion:", v36);

    }
    else if ((operations & 4) != 0)
    {
      PKLogFacilityTypeGetObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        PKPeerPaymentSetupOperationDescriptionForOperations(4uLL);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v15;
        _os_log_impl(&dword_19D178000, v14, OS_LOG_TYPE_DEFAULT, "Processing peer payment setup operation: %@", buf, 0xCu);

      }
      if (!-[PKPeerPaymentSetupFlowController _willDisplayErrorForOperationOperationInContext:completion:](self, "_willDisplayErrorForOperationOperationInContext:completion:", 4, v4))-[PKPeerPaymentSetupFlowController _presentEnsurePassCountWithCompletion:](self, "_presentEnsurePassCountWithCompletion:", v4);
    }
    else if ((operations & 8) != 0)
    {
      PKLogFacilityTypeGetObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        PKPeerPaymentSetupOperationDescriptionForOperations(8uLL);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v17;
        _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Checking peer payment setup operation: %@", buf, 0xCu);

      }
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_26;
      v34[3] = &unk_1E3E669E0;
      v34[4] = self;
      v35 = v4;
      -[PKPeerPaymentSetupFlowController _checkMissingTLKsWithCompletion:](self, "_checkMissingTLKsWithCompletion:", v34);

    }
    else if ((operations & 0x10) != 0)
    {
      PKLogFacilityTypeGetObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        PKPeerPaymentSetupOperationDescriptionForOperations(0x10uLL);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v19;
        _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Checking peer payment setup operation: %@", buf, 0xCu);

      }
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_28;
      v32[3] = &unk_1E3E669E0;
      v32[4] = self;
      v33 = v4;
      -[PKPeerPaymentSetupFlowController _checkCloudStoreSetupWithCompletion:](self, "_checkCloudStoreSetupWithCompletion:", v32);

    }
    else if ((operations & 0x20) != 0)
    {
      PKLogFacilityTypeGetObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        PKPeerPaymentSetupOperationDescriptionForOperations(0x20uLL);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v21;
        _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "Processing peer payment setup operation: %@", buf, 0xCu);

      }
      if (!-[PKPeerPaymentSetupFlowController _willDisplayErrorForOperationOperationInContext:completion:](self, "_willDisplayErrorForOperationOperationInContext:completion:", 32, v4))
      {
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_30;
        v30[3] = &unk_1E3E642A8;
        v30[4] = self;
        v31 = v4;
        -[PKPeerPaymentSetupFlowController _provisionPassWithCompletion:](self, "_provisionPassWithCompletion:", v30);

      }
    }
    else if ((operations & 0x40) != 0)
    {
      PKLogFacilityTypeGetObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        PKPeerPaymentSetupOperationDescriptionForOperations(0x40uLL);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v23;
        _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, "Processing peer payment setup operation: %@", buf, 0xCu);

      }
      if (!-[PKPeerPaymentSetupFlowController _willDisplayErrorForOperationOperationInContext:completion:](self, "_willDisplayErrorForOperationOperationInContext:completion:", 64, v4))-[PKPeerPaymentSetupFlowController _presentIdentityVerificationFlowWithError:completion:](self, "_presentIdentityVerificationFlowWithError:completion:", 0, v4);
    }
    else if ((operations & 0x80) != 0)
    {
      PKLogFacilityTypeGetObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        PKPeerPaymentSetupOperationDescriptionForOperations(0x80uLL);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v25;
        _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, "Processing peer payment setup operation: %@", buf, 0xCu);

      }
      if (!-[PKPeerPaymentSetupFlowController _willDisplayErrorForOperationOperationInContext:completion:](self, "_willDisplayErrorForOperationOperationInContext:completion:", 128, v4))
      {
        objc_initWeak((id *)buf, self);
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_34;
        v27[3] = &unk_1E3E7B480;
        objc_copyWeak(&v29, (id *)buf);
        v27[4] = self;
        v28 = v4;
        -[PKPeerPaymentSetupFlowController _addAssociatedAccountWithCompletion:](self, "_addAssociatedAccountWithCompletion:", v27);

        objc_destroyWeak(&v29);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if ((operations & 0x100) == 0)
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Completed peer payment setup operations", buf, 2u);
        }

        completedOperations = self->_completedOperations;
        if ((completedOperations & 0x20) != 0)
        {
          if (!-[PKPeerPaymentSetupFlowControllerConfiguration peerPaymentSetupConfigurationType](self->_configuration, "peerPaymentSetupConfigurationType"))goto LABEL_50;
          completedOperations = self->_completedOperations;
        }
        if ((completedOperations & 0x80) == 0)
        {
          -[PKPeerPaymentSetupFlowController firstPeerPaymentAccountSetupViewController](self, "firstPeerPaymentAccountSetupViewController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *, _QWORD, _QWORD))v4 + 2))(v4, v9, 0, 0);

          goto LABEL_51;
        }
LABEL_50:
        (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);
        goto LABEL_51;
      }
      if (v7)
      {
        PKPeerPaymentSetupOperationDescriptionForOperations(0x100uLL);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v39 = v26;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Processing peer payment setup operation: %@", buf, 0xCu);

      }
      -[PKPeerPaymentSetupFlowController _completedOperation:](self, "_completedOperation:", 256);
      -[PKPeerPaymentSetupFlowController _nextViewControllerWithCompletion:](self, "_nextViewControllerWithCompletion:", v4);
    }
  }
LABEL_51:

}

uint64_t __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  uint64_t result;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "_completedOperation:", 2);
    return objc_msgSend(*(id *)(a1 + 32), "_nextViewControllerWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    result = objc_msgSend(v3, "_willDisplayErrorForOperationOperationInContext:completion:", 2, *(_QWORD *)(a1 + 40));
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 32), "_presentManateeCapableOperationWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_26(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    if ((objc_msgSend(v3, "_willDisplayErrorForOperationOperationInContext:completion:", 8, *(_QWORD *)(a1 + 40)) & 1) == 0)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2;
      v5[3] = &unk_1E3E7B430;
      v4 = *(void **)(a1 + 40);
      v6 = *(id *)(a1 + 32);
      v7 = v4;
      objc_msgSend(v6, "_presentMissingTLKsFlowWithCompletion:", v5);

    }
  }
  else
  {
    objc_msgSend(v3, "_completedOperation:", 8);
    objc_msgSend(*(id *)(a1 + 32), "_nextViewControllerWithCompletion:", *(_QWORD *)(a1 + 40));
  }
}

void __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  id v8;

  v7 = a4;
  v8 = v7;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_completedOperation:", 8);
    objc_msgSend(*(id *)(a1 + 32), "_nextViewControllerWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleDisplayableError:completion:", v7, *(_QWORD *)(a1 + 40));
  }

}

void __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_28(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "_completedOperation:", 16);
    objc_msgSend(*(id *)(a1 + 32), "_nextViewControllerWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else if ((objc_msgSend(v3, "_willDisplayErrorForOperationOperationInContext:completion:", 16, *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2_29;
    v5[3] = &unk_1E3E7B430;
    v4 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    v7 = v4;
    objc_msgSend(v6, "_setupCloudStoreWithCompletion:", v5);

  }
}

void __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2_29(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  id v8;

  v7 = a4;
  v8 = v7;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_completedOperation:", 16);
    objc_msgSend(*(id *)(a1 + 32), "_nextViewControllerWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleDisplayableError:completion:", v7, *(_QWORD *)(a1 + 40));
  }

}

void __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v4, "_handleDisplayableError:completion:", a3, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v4, "_completedOperation:", 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2_31;
    v6[3] = &unk_1E3E7B458;
    v5 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v5, "_nextViewControllerWithCompletion:", v6);

  }
}

uint64_t __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_34(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  _QWORD *WeakRetained;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v10 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2_35;
      aBlock[3] = &unk_1E3E61850;
      aBlock[4] = WeakRetained;
      v20 = *(id *)(a1 + 40);
      v11 = _Block_copy(aBlock);
      v12 = v11;
      if (v9[6])
      {
        objc_msgSend(v9, "_completedOperation:", 256);
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(void **)(v13 + 72);
        *(_QWORD *)(v13 + 72) = 0;

        v15 = (void *)v9[6];
        v17[0] = v10;
        v17[1] = 3221225472;
        v17[2] = __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_3;
        v17[3] = &unk_1E3E61850;
        v17[4] = v9;
        v18 = v12;
        objc_msgSend(v15, "dismissViewControllerAnimated:completion:", 1, v17);

      }
      else
      {
        (*((void (**)(void *))v11 + 2))(v11);
      }

    }
    else
    {
      v16 = *(_QWORD *)(a1 + 40);
      if (a3)
        (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(v16 + 16))(*(_QWORD *)(a1 + 40), 0, 1, 0);
      else
        objc_msgSend(WeakRetained, "_handleDisplayableError:completion:", v7, v16);
    }
  }

}

uint64_t __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_2_35(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_completedOperation:", 128);
  return objc_msgSend(*(id *)(a1 + 32), "_nextViewControllerWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __70__PKPeerPaymentSetupFlowController__nextViewControllerWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_handleDisplayableError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void (**v9)(void *, _QWORD *);
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  int v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[5];
  _QWORD v48[5];
  id v49;
  _QWORD v50[4];
  id v51;
  PKPeerPaymentSetupFlowController *v52;
  id v53;
  uint8_t buf[16];
  _QWORD aBlock[6];

  v6 = a3;
  v7 = a4;
  if (!v7)
    goto LABEL_36;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke;
  aBlock[3] = &unk_1E3E63C08;
  aBlock[4] = self;
  v9 = (void (**)(void *, _QWORD *))_Block_copy(aBlock);
  switch(objc_msgSend(MEMORY[0x1E0D673F8], "proposedResolutionForError:", v6))
  {
    case 0:
      v39[0] = v8;
      v39[1] = 3221225472;
      v39[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_2_53;
      v39[3] = &unk_1E3E61590;
      v40 = v7;
      v9[2](v9, v39);
      v10 = v40;
      goto LABEL_18;
    case 1:
      v11 = v6;
      objc_msgSend(v11, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D69DC8]);

      v14 = v11;
      if (v13)
      {
        objc_msgSend(v11, "userInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v14, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "code");
      v18 = (id)*MEMORY[0x1E0D6B2D8];
      v19 = v16;
      v20 = v19;
      if (v19 == v18)
      {
        v37 = v14;
        v21 = v8;

        if (v17 != 40310)
        {
          v27 = v20;
          v23 = 1;
          goto LABEL_25;
        }
      }
      else
      {
        if (!v19 || !v18)
        {

          goto LABEL_30;
        }
        v37 = v14;
        v21 = v8;
        v22 = objc_msgSend(v19, "isEqualToString:", v18);

        if (!v22 || v17 != 40310)
        {
          v23 = objc_msgSend(v20, "isEqualToString:", v18);
LABEL_25:
          v8 = v21;
          v14 = v37;

          if (v23
            && v17 == 40014
            && -[PKPeerPaymentSetupFlowControllerConfiguration peerPaymentSetupConfigurationType](self->_configuration, "peerPaymentSetupConfigurationType") == 1)
          {
            if (self->_confirmNameViewControllerBeingPresented)
            {
              PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ERROR_LEGAL_NAME_ALREADY_ENTERED_INVALID_TITLE"));
              v38 = objc_claimAutoreleasedReturnValue();
              PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ERROR_LEGAL_NAME_ALREADY_ENTERED_INVALID_MESSAGE"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v38, v36, 1);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v14;
              v30 = v8;
              v31 = (void *)MEMORY[0x1E0DC3448];
              PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v47[0] = v30;
              v14 = v29;
              v47[1] = 3221225472;
              v47[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_2_49;
              v47[3] = &unk_1E3E61D68;
              v47[4] = self;
              objc_msgSend(v31, "actionWithTitle:style:handler:", v32, 0, v47);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addAction:", v33);

              -[PKPeerPaymentConfirmNameViewController presentViewController:animated:completion:](self->_confirmNameViewControllerBeingPresented, "presentViewController:animated:completion:", v28, 1, 0);
              v34 = (void *)v38;
LABEL_33:

              goto LABEL_34;
            }
            -[PKPeerPaymentSetupFlowController _presentNameConfirmationViewControllerWithError:completion:](self, "_presentNameConfirmationViewControllerWithError:completion:", v37, v7);
            goto LABEL_34;
          }
LABEL_30:
          PKLogFacilityTypeGetObject();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19D178000, v35, OS_LOG_TYPE_DEFAULT, "Attempting to display an alert after an error was received", buf, 2u);
          }

          v44[0] = v8;
          v44[1] = 3221225472;
          v44[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_51;
          v44[3] = &unk_1E3E618A0;
          v46 = v7;
          v45 = v11;
          v9[2](v9, v44);

          v34 = v46;
          goto LABEL_33;
        }
      }
      PKLogFacilityTypeGetObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v26, OS_LOG_TYPE_DEFAULT, "Presenting HSA2 upgrade flow after error from server was returned.", buf, 2u);
      }

      v48[0] = v21;
      v48[1] = 3221225472;
      v48[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_40;
      v48[3] = &unk_1E3E61850;
      v48[4] = self;
      v49 = v7;
      v9[2](v9, v48);

      v14 = v37;
LABEL_34:

LABEL_35:
LABEL_36:

      return;
    case 2:
      PKLogFacilityTypeGetObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, "Attempting to display terms after an error was received", buf, 2u);
      }

      v50[0] = v8;
      v50[1] = 3221225472;
      v50[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_39;
      v50[3] = &unk_1E3E65388;
      v51 = v6;
      v52 = self;
      v53 = v7;
      v9[2](v9, v50);

      v10 = v51;
      goto LABEL_18;
    case 3:
      PKLogFacilityTypeGetObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v25, OS_LOG_TYPE_DEFAULT, "Attempting to display CIP after an error was received", buf, 2u);
      }

      v41[0] = v8;
      v41[1] = 3221225472;
      v41[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_52;
      v41[3] = &unk_1E3E65388;
      v41[4] = self;
      v42 = v6;
      v43 = v7;
      v9[2](v9, v41);

      v10 = v42;
LABEL_18:

      goto LABEL_35;
    default:
      goto LABEL_35;
  }
}

void __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  _QWORD v6[4];
  void (**v7)(_QWORD);

  v3 = a2;
  v4 = v3;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_2;
    v6[3] = &unk_1E3E61590;
    v7 = v3;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  }
  else
  {
    v3[2](v3);
  }

}

uint64_t __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_39(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v9 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D69DC8]);

  if (v3)
  {
    objc_msgSend(v9, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v5;
  }
  else
  {
    v6 = v9;
  }
  v10 = v6;
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D6BA30]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_termsOperationWithTermsResponse:completion:", v8, *(_QWORD *)(a1 + 48));
}

uint64_t __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentManateeCapableOperationWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_2_49(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "showSpinner:", 0);
}

uint64_t __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_52(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentIdentityVerificationFlowWithError:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __71__PKPeerPaymentSetupFlowController__handleDisplayableError_completion___block_invoke_2_53(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_completedOperation:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  unint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    PKPeerPaymentSetupOperationDescriptionForOperations(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "User completed peer payment setup operation %@", (uint8_t *)&v8, 0xCu);

  }
  v7 = self->_completedOperations | a3;
  self->_operations &= ~a3;
  self->_completedOperations = v7;
}

- (void)_termsOperationWithTermsResponse:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v7 = a4;
  if (!-[PKPeerPaymentSetupFlowController _willDisplayErrorForOperationOperationInContext:completion:](self, "_willDisplayErrorForOperationOperationInContext:completion:", 1, v7))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__PKPeerPaymentSetupFlowController__termsOperationWithTermsResponse_completion___block_invoke;
    v8[3] = &unk_1E3E642A8;
    v8[4] = self;
    v9 = v7;
    -[PKPeerPaymentSetupFlowController _presentTermWithTermsResponse:completion:](self, "_presentTermWithTermsResponse:completion:", v6, v8);

  }
}

void __80__PKPeerPaymentSetupFlowController__termsOperationWithTermsResponse_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_handleDisplayableError:completion:", v7, *(_QWORD *)(a1 + 40));

  }
  else if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_completedOperation:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_nextViewControllerWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_presentTermWithTermsResponse:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  PKPeerPaymentTermsController *v13;
  void *v14;
  PKPeerPaymentTermsController *v15;
  PKPeerPaymentTermsController *termsController;
  NSObject *v17;
  PKPeerPaymentTermsController *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v7)
  {
    objc_msgSend(v6, "termsURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "termsIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (!v8 || !v9)
    {
      -[PKPeerPaymentAccount termsURL](self->_peerPaymentAccount, "termsURL");
      v11 = objc_claimAutoreleasedReturnValue();

      -[PKPeerPaymentAccount termsIdentifier](self->_peerPaymentAccount, "termsIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
      v10 = (void *)v12;
    }
    v13 = [PKPeerPaymentTermsController alloc];
    -[PKPeerPaymentAccount associatedPassUniqueID](self->_peerPaymentAccount, "associatedPassUniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKPeerPaymentTermsController initWithTermsURL:termsIdentifier:passUniqueID:webService:](v13, "initWithTermsURL:termsIdentifier:passUniqueID:webService:", v8, v10, v14, self->_peerPaymentWebService);
    termsController = self->_termsController;
    self->_termsController = v15;

    -[PKPeerPaymentTermsController setPaymentSetupContext:](self->_termsController, "setPaymentSetupContext:", -[PKPeerPaymentSetupFlowController context](self, "context"));
    if (-[PKPeerPaymentSetupFlowControllerDataSource shouldPushTerms](self->_parentViewController, "shouldPushTerms"))-[PKPeerPaymentTermsController setCustomPresentationHandler:](self->_termsController, "setCustomPresentationHandler:", &__block_literal_global_247);
    PKLogFacilityTypeGetObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Presenting terms for peer payment setup", buf, 2u);
    }

    v18 = self->_termsController;
    -[PKPeerPaymentSetupFlowControllerDataSource navigationController](self->_parentViewController, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __77__PKPeerPaymentSetupFlowController__presentTermWithTermsResponse_completion___block_invoke_56;
    v20[3] = &unk_1E3E64398;
    v20[4] = self;
    v21 = v7;
    -[PKPeerPaymentTermsController presentTermsOverController:showInterstitialViewController:withCompletionHandler:](v18, "presentTermsOverController:showInterstitialViewController:withCompletionHandler:", v19, 0, v20);

  }
}

uint64_t __77__PKPeerPaymentSetupFlowController__presentTermWithTermsResponse_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "presentViewController:withTransition:completion:", a3, 1, 0);
}

void __77__PKPeerPaymentSetupFlowController__presentTermWithTermsResponse_completion___block_invoke_56(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  BOOL v11;

  v5 = a3;
  if ((unint64_t)(a2 - 1) >= 2)
  {
    if (!a2)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__PKPeerPaymentSetupFlowController__presentTermWithTermsResponse_completion___block_invoke_2;
    v8[3] = &unk_1E3E668F0;
    v10 = v6;
    v11 = a2 == 2;
    v9 = v5;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);

  }
}

uint64_t __77__PKPeerPaymentSetupFlowController__presentTermWithTermsResponse_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_presentManateeCapableOperationWithCompletion:(id)a3
{
  id v4;
  PKSecurityCapabilitiesController *v5;
  PKSecurityCapabilitiesController *securityCapabiltiesController;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  PKSecurityCapabilitiesController *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4
    && !-[PKPeerPaymentSetupFlowController _willDisplayErrorForOperationOperationInContext:completion:](self, "_willDisplayErrorForOperationOperationInContext:completion:", 2, v4))
  {
    v5 = -[PKSecurityCapabilitiesController initWithRequirements:feature:context:]([PKSecurityCapabilitiesController alloc], "initWithRequirements:feature:context:", 8, 1, -[PKPeerPaymentSetupFlowController context](self, "context"));
    securityCapabiltiesController = self->_securityCapabiltiesController;
    self->_securityCapabiltiesController = v5;

    -[PKPeerPaymentSetupFlowControllerDataSource navigationController](self->_parentViewController, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (PKPaymentSetupContextIsBridge())
    {
      objc_msgSend(v7, "viewControllers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Presenting hsa2 flow for peer payment setup", buf, 2u);
    }

    v11 = self->_securityCapabiltiesController;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke;
    v12[3] = &unk_1E3E64398;
    v12[4] = self;
    v13 = v4;
    -[PKSecurityCapabilitiesController presentSecurityRepairFlowWithPresentingViewController:completion:](v11, "presentSecurityRepairFlowWithPresentingViewController:completion:", v8, v12);

  }
}

void __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke_2;
  v9[3] = &unk_1E3E65E58;
  v13 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(void);
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    PKSecurityCapabilitiesErrorToString(a1[7]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[4];
    *(_DWORD *)buf = 138412546;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Finished checking peer payment security capabilities with upgrade error %@, error %@", buf, 0x16u);

  }
  v5 = a1[7];
  if (v5 == 3)
  {
    v6 = *(void (**)(void))(a1[6] + 16);
    goto LABEL_8;
  }
  if (v5 || a1[4])
  {
    *(_BYTE *)(a1[5] + 32) = 1;
    v6 = *(void (**)(void))(a1[6] + 16);
LABEL_8:
    v6();
    return;
  }
  *(_BYTE *)(a1[5] + 32) = 1;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    PKPeerPaymentSetupOperationDescriptionForOperations(2uLL);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "User successfully completed %@. Ensuring that they indeed supportsDeviceToDeviceEncryption", buf, 0xCu);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke_59;
  v9[3] = &unk_1E3E669E0;
  v8 = (void *)a1[6];
  v10 = (id)a1[5];
  v11 = v8;
  objc_msgSend(v10, "_checkManateeCapabilityWithCompletion:", v9);

}

void __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke_59(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke_2_60;
  block[3] = &unk_1E3E66830;
  v5 = a2;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __82__PKPeerPaymentSetupFlowController__presentManateeCapableOperationWithCompletion___block_invoke_2_60(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_completedOperation:", 2);
    objc_msgSend(*(id *)(a1 + 32), "_nextViewControllerWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Error: Possible bug on CoreCDP. User is not manatee capable after successful completion of hsa2 upgrade flow", v5, 2u);
    }

    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v3 + 16))(v3, 0, 0, v4);

  }
}

- (void)_presentEnsurePassCountWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id nextViewControllerCompletion;
  NSObject *v7;
  PKPaymentSelectPassesViewController *v8;
  void *v9;
  PKPaymentSelectPassesViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = _Block_copy(v4);

  nextViewControllerCompletion = self->_nextViewControllerCompletion;
  self->_nextViewControllerCompletion = v5;

  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Presenting pass picker flow for peer payment setup", v15, 2u);
  }

  v8 = [PKPaymentSelectPassesViewController alloc];
  -[PKPeerPaymentSetupFlowController passesIncludingPeerPaymentPass:isCheckingTotalPassCount:](self, "passesIncludingPeerPaymentPass:isCheckingTotalPassCount:", 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKPaymentSelectPassesViewController initWithSecureElementPasses:context:delegate:peerPaymentAccount:reporter:](v8, "initWithSecureElementPasses:context:delegate:peerPaymentAccount:reporter:", v9, self->_context, self, self->_peerPaymentAccount, 0);

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MAXIMUM_CARDS_REACHED_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSelectPassesViewController setHeaderTitle:](v10, "setHeaderTitle:", v11);

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MAXIMUM_CARDS_REACHED_MESSAGE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSelectPassesViewController setHeaderSubtitle:](v10, "setHeaderSubtitle:", v12);

  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_REMOVE_CARD"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSelectPassesViewController setButtonText:](v10, "setButtonText:", v13);

  -[PKPeerPaymentSetupFlowControllerDataSource navigationController](self->_parentViewController, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pushViewController:animated:", v10, 1);

}

- (void)_presentMissingTLKsFlowWithCompletion:(id)a3
{
  id v4;
  PKSecurityCapabilitiesController *v5;
  PKSecurityCapabilitiesController *securityCapabiltiesController;
  NSObject *v7;
  PKSecurityCapabilitiesController *v8;
  PKPeerPaymentSetupFlowControllerDataSource *parentViewController;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4)
  {
    v5 = -[PKSecurityCapabilitiesController initWithRequirements:feature:context:]([PKSecurityCapabilitiesController alloc], "initWithRequirements:feature:context:", 16, 1, -[PKPeerPaymentSetupFlowController context](self, "context"));
    securityCapabiltiesController = self->_securityCapabiltiesController;
    self->_securityCapabiltiesController = v5;

    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Presenting missing TLKs for peer payment setup", buf, 2u);
    }

    v8 = self->_securityCapabiltiesController;
    parentViewController = self->_parentViewController;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__PKPeerPaymentSetupFlowController__presentMissingTLKsFlowWithCompletion___block_invoke;
    v10[3] = &unk_1E3E79990;
    v11 = v4;
    -[PKSecurityCapabilitiesController presentSecurityRepairFlowWithPresentingViewController:completion:](v8, "presentSecurityRepairFlowWithPresentingViewController:completion:", parentViewController, v10);

  }
}

void __74__PKPeerPaymentSetupFlowController__presentMissingTLKsFlowWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PKPeerPaymentSetupFlowController__presentMissingTLKsFlowWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E6F560;
  v10 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __74__PKPeerPaymentSetupFlowController__presentMissingTLKsFlowWithCompletion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    PKSecurityCapabilitiesErrorToString(a1[6]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[4];
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Finished checking missing tlks with upgrade error %@, error %@", (uint8_t *)&v6, 0x16u);

  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)_setupCloudStoreWithCompletion:(id)a3
{
  id v4;
  PKSecurityCapabilitiesController *v5;
  PKSecurityCapabilitiesController *securityCapabiltiesController;
  NSObject *v7;
  PKSecurityCapabilitiesController *v8;
  PKPeerPaymentSetupFlowControllerDataSource *parentViewController;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4)
  {
    v5 = -[PKSecurityCapabilitiesController initWithRequirements:feature:context:]([PKSecurityCapabilitiesController alloc], "initWithRequirements:feature:context:", 32, 1, -[PKPeerPaymentSetupFlowController context](self, "context"));
    securityCapabiltiesController = self->_securityCapabiltiesController;
    self->_securityCapabiltiesController = v5;

    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Starting cloud store setup for peer payment setup", buf, 2u);
    }

    v8 = self->_securityCapabiltiesController;
    parentViewController = self->_parentViewController;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__PKPeerPaymentSetupFlowController__setupCloudStoreWithCompletion___block_invoke;
    v10[3] = &unk_1E3E79990;
    v11 = v4;
    -[PKSecurityCapabilitiesController presentSecurityRepairFlowWithPresentingViewController:completion:](v8, "presentSecurityRepairFlowWithPresentingViewController:completion:", parentViewController, v10);

  }
}

void __67__PKPeerPaymentSetupFlowController__setupCloudStoreWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKPeerPaymentSetupFlowController__setupCloudStoreWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E6F560;
  v10 = a2;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __67__PKPeerPaymentSetupFlowController__setupCloudStoreWithCompletion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    PKSecurityCapabilitiesErrorToString(a1[6]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = a1[4];
    v8 = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Finished checking cloud store setup upgrade error %@, error %@", (uint8_t *)&v8, 0x16u);

  }
  v5 = a1[6];
  if (v5 == 3)
  {
    v6 = *(uint64_t (**)(void))(a1[5] + 16);
  }
  else
  {
    if (v5)
      MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68510], 0);
    v6 = *(uint64_t (**)(void))(a1[5] + 16);
  }
  return v6();
}

- (void)_provisionPassWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  PKPeerPaymentCredential *peerPaymentCredential;
  PKPeerPaymentCredential *v8;
  PKPeerPaymentCredential **p_peerPaymentCredential;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Begin provisioning pass for peer payment setup", buf, 2u);
    }

    -[PKPaymentProvisioningController resetForNewProvisioning](self->_provisioningController, "resetForNewProvisioning");
    -[PKPeerPaymentWebService targetDevice](self->_peerPaymentWebService, "targetDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    p_peerPaymentCredential = &self->_peerPaymentCredential;
    peerPaymentCredential = self->_peerPaymentCredential;
    v8 = p_peerPaymentCredential[1];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__PKPeerPaymentSetupFlowController__provisionPassWithCompletion___block_invoke;
    v10[3] = &unk_1E3E653D8;
    v11 = v4;
    objc_msgSend(v6, "provisionPeerPaymentPassWithProvisioningController:credential:completion:", v8, peerPaymentCredential, v10);

  }
}

void __65__PKPeerPaymentSetupFlowController__provisionPassWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKPeerPaymentSetupFlowController__provisionPassWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E668F0;
  v11 = a2;
  v6 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65__PKPeerPaymentSetupFlowController__provisionPassWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Completed provisioning pass for peer payment setup", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v3 + 16))(*(_QWORD *)(a1 + 40), 1, 0);
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D685F8], 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

- (void)_presentIdentityVerificationFlowWithError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id nextViewControllerCompletion;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void (**v18)(void *, _QWORD *);
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  _QWORD aBlock[5];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v8 = _Block_copy(v7);
  nextViewControllerCompletion = self->_nextViewControllerCompletion;
  self->_nextViewControllerCompletion = v8;

  if (self->_nextViewControllerCompletion
    && !-[PKPeerPaymentSetupFlowController _willDisplayErrorForOperationOperationInContext:completion:](self, "_willDisplayErrorForOperationOperationInContext:completion:", 64, v7))
  {
    objc_msgSend(v6, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D69DC8]);

    if (v11)
    {
      objc_msgSend(v6, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v13;
    }
    objc_msgSend(v6, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D6A3A0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v16, OS_LOG_TYPE_DEFAULT, "Presenting identity verification for peer payment setup", buf, 2u);
    }

    v17 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke;
    aBlock[3] = &unk_1E3E7B4F0;
    aBlock[4] = self;
    v18 = (void (**)(void *, _QWORD *))_Block_copy(aBlock);
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_4;
    v23[3] = &unk_1E3E7B518;
    v23[4] = self;
    v19 = _Block_copy(v23);
    v20 = v19;
    if (v15)
    {
      (*((void (**)(void *, void *))v19 + 2))(v19, v15);
    }
    else
    {
      v21[0] = v17;
      v21[1] = 3221225472;
      v21[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_4_79;
      v21[3] = &unk_1E3E7B540;
      v21[4] = self;
      v22 = v19;
      v18[2](v18, v21);

    }
  }

}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D67418]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDevSigned:", objc_msgSend(v5, "devSigned"));

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_2;
  v8[3] = &unk_1E3E7B4C8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "peerPaymentIdentityVerificationRequest:completion:", v4, v8);

}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_3;
  block[3] = &unk_1E3E61450;
  v11 = v5;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_3(uint64_t a1)
{
  if (!*(_QWORD *)(a1 + 32))
    MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68530]);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  PKPeerPaymentIdentityVerificationController *v6;
  PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController *v7;
  PKPeerPaymentIdentityVerificationController *v8;
  PKNavigationController *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  PKPeerPaymentIdentityVerificationController *v15;
  id v16;
  id v17;
  id location;
  _QWORD v19[5];
  _QWORD aBlock[5];

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_5;
  aBlock[3] = &unk_1E3E63BA0;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v5 = _Block_copy(aBlock);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "peerPaymentSetupConfigurationType") == 1)
  {
    v6 = -[PKPeerPaymentIdentityVerificationController initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:]([PKPeerPaymentIdentityVerificationController alloc], "initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), v3, *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
    v7 = -[PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController initWithPeerPaymentSetupFlowController:]([PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController alloc], "initWithPeerPaymentSetupFlowController:", *(_QWORD *)(a1 + 32));
    v19[0] = v4;
    v19[1] = 3221225472;
    v19[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_2_75;
    v19[3] = &unk_1E3E612E8;
    v19[4] = *(_QWORD *)(a1 + 32);
    -[PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController setCancelHandler:](v7, "setCancelHandler:", v19);
    objc_initWeak(&location, v7);
    v11 = v4;
    v12 = 3221225472;
    v13 = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_3_76;
    v14 = &unk_1E3E61B90;
    objc_copyWeak(&v17, &location);
    v8 = v6;
    v15 = v8;
    v16 = v5;
    -[PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController setContinueHandler:](v7, "setContinueHandler:", &v11);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    if (v8)
    {
      if (v7)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else
  {
    v7 = 0;
  }
  v8 = -[PKPeerPaymentIdentityVerificationController initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:]([PKPeerPaymentIdentityVerificationController alloc], "initWithPeerPaymentWebService:identityVerificationResponse:setupDelegate:hideInitialSplashScreen:context:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), v3, *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  if (v7)
    goto LABEL_8;
LABEL_7:
  -[PKPeerPaymentIdentityVerificationController firstViewController](v8, "firstViewController", v11, v12, v13, v14);
  v7 = (PKPeerPaymentAddAssociatedAccountIdentityVerificationExplanationViewController *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    (*((void (**)(void *, _QWORD))v5 + 2))(v5, 0);
    goto LABEL_9;
  }
LABEL_8:
  v9 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v7);
  -[PKNavigationController setModalInPresentation:](v9, "setModalInPresentation:", 1);
  -[PKNavigationController setSupportedInterfaceOrientations:](v9, "setSupportedInterfaceOrientations:", 2);
  PKPaymentSetupApplyContextAppearance(objc_msgSend(*(id *)(a1 + 32), "context"), v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:completion:", v9, 1, 0);

LABEL_9:
}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  void *v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);
  _QWORD aBlock[5];

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_6;
  aBlock[3] = &unk_1E3E612E8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  v6 = v5;
  if (v3)
  {
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_71;
    v7[3] = &unk_1E3E61590;
    v8 = v5;
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v7);

  }
  else
  {
    v5[2](v5);
  }

}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Error: no view controller defined for identity verification flow.", v7, 2u);
  }

  MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68528], 0);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v3 + 16))(v3, 0, 0, v4);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = 0;

}

uint64_t __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_71(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_2_75(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  *(_QWORD *)(v2 + 72) = 0;

}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_3_76(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "firstViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v5, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pushViewController:animated:", v3, 1);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

    WeakRetained = v5;
  }

}

void __89__PKPeerPaymentSetupFlowController__presentIdentityVerificationFlowWithError_completion___block_invoke_4_79(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v11)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(_QWORD **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_handleDisplayableError:completion:", v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

    }
    else
    {
      (*(void (**)(void))(v7[9] + 16))();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 72);
      *(_QWORD *)(v9 + 72) = 0;

    }
  }

}

- (void)_addAssociatedAccountWithCompletion:(id)a3
{
  id v4;
  PKPeerPaymentSetupFlowControllerConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  PKPeerPaymentWebService *peerPaymentWebService;
  NSObject *v13;
  _QWORD v14[4];
  PKPeerPaymentSetupFlowControllerConfiguration *v15;
  PKPeerPaymentSetupFlowController *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4)
  {
    if (-[PKPeerPaymentSetupFlowControllerConfiguration peerPaymentSetupConfigurationType](self->_configuration, "peerPaymentSetupConfigurationType") == 1)v5 = self->_configuration;
    else
      v5 = 0;
    -[PKPeerPaymentSetupFlowControllerConfiguration familyMember](v5, "familyMember");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentSetupFlowControllerConfiguration firstName](v5, "firstName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentSetupFlowControllerConfiguration lastName](v5, "lastName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0D673E0]);
      objc_msgSend(v10, "setFirstName:", v8);
      objc_msgSend(v10, "setLastName:", v9);
      objc_msgSend(v10, "setAltDSID:", v7);
      objc_msgSend(v10, "setRole:", 1);
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v19 = v8;
        v20 = 2112;
        v21 = v9;
        v22 = 2112;
        v23 = v7;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Starting add associated account flow for firstName: %@  lastName: %@ altDSID:  %@.", buf, 0x20u);
      }

      peerPaymentWebService = self->_peerPaymentWebService;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke;
      v14[3] = &unk_1E3E7B5B8;
      v17 = v4;
      v15 = v5;
      v16 = self;
      -[PKPeerPaymentWebService peerPaymentAddAssociatedAccountWithRequest:completion:](peerPaymentWebService, "peerPaymentAddAssociatedAccountWithRequest:completion:", v10, v14);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEFAULT, "Error: cannot add an associated account for a nil altDSID", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, id))v4 + 2))(v4, 0, 0, v10);
    }

  }
}

void __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E66418;
  v12 = v6;
  v13 = v5;
  v16 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void (**v8)(void *, _QWORD *);
  _QWORD v9[4];
  id v10;
  _QWORD aBlock[5];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v14 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Addition of associated account completed with error %@", buf, 0xCu);
  }

  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    v4 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v4 + 16))(v4, 0, 0, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "updatedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_81;
    aBlock[3] = &unk_1E3E7B590;
    aBlock[4] = *(_QWORD *)(a1 + 56);
    v5 = v6;
    v12 = v5;
    v8 = (void (**)(void *, _QWORD *))_Block_copy(aBlock);
    if (v5)
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Updating preferences for newly added associated account %@", buf, 0xCu);
      }

      v9[0] = v7;
      v9[1] = 3221225472;
      v9[2] = __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_84;
      v9[3] = &unk_1E3E61590;
      v10 = *(id *)(a1 + 64);
      v8[2](v8, v9);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
}

void __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "targetDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_2_82;
  v7[3] = &unk_1E3E7B568;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "setPreferences:completion:", v5, v7);

}

void __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_2_82(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_3;
  v6[3] = &unk_1E3E61850;
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Error updating preferences for new associated account %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __72__PKPeerPaymentSetupFlowController__addAssociatedAccountWithCompletion___block_invoke_84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_presentNameConfirmationViewControllerWithError:(id)a3 completion:(id)a4
{
  void *v5;
  id nextViewControllerCompletion;
  PKPeerPaymentSetupFlowControllerConfiguration *v7;
  void *v8;
  PKPeerPaymentConfirmNameViewController *v9;
  void *v10;
  PKPeerPaymentConfirmNameViewController *v11;
  PKPeerPaymentConfirmNameViewController *confirmNameViewControllerBeingPresented;
  PKNavigationController *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a4;
  v5 = _Block_copy(v17);
  nextViewControllerCompletion = self->_nextViewControllerCompletion;
  self->_nextViewControllerCompletion = v5;

  if (self->_nextViewControllerCompletion
    && !-[PKPeerPaymentSetupFlowController _willDisplayErrorForOperationOperationInContext:completion:](self, "_willDisplayErrorForOperationOperationInContext:completion:", 256, v17))
  {
    if (-[PKPeerPaymentSetupFlowControllerConfiguration peerPaymentSetupConfigurationType](self->_configuration, "peerPaymentSetupConfigurationType") == 1)v7 = self->_configuration;
    else
      v7 = 0;
    -[PKPeerPaymentSetupFlowControllerConfiguration familyMember](v7, "familyMember");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = [PKPeerPaymentConfirmNameViewController alloc];
      -[PKPeerPaymentSetupFlowControllerConfiguration familyMember](v7, "familyMember");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PKPeerPaymentConfirmNameViewController initWithFamilyMember:delegate:context:](v9, "initWithFamilyMember:delegate:context:", v10, self, self->_context);
      confirmNameViewControllerBeingPresented = self->_confirmNameViewControllerBeingPresented;
      self->_confirmNameViewControllerBeingPresented = v11;

      v13 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", self->_confirmNameViewControllerBeingPresented);
      -[PKNavigationController setModalInPresentation:](v13, "setModalInPresentation:", 1);
      -[PKPeerPaymentSetupFlowControllerDataSource navigationController](self->_parentViewController, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "presentViewController:animated:completion:", v13, 1, 0);

    }
    else
    {
      v15 = self->_nextViewControllerCompletion;
      objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v16);

      v13 = (PKNavigationController *)self->_nextViewControllerCompletion;
      self->_nextViewControllerCompletion = 0;
    }

  }
}

- (void)_fitlerOperations:(unint64_t)a3 peerPaymentAccount:(id)a4 context:(int64_t)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t completedOperations;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  PKLogFacilityTypeGetObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    PKPeerPaymentSetupOperationDescriptionForOperations(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v9;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Setting new peer payment setup operations %@", (uint8_t *)&v16, 0xCu);

  }
  completedOperations = self->_completedOperations;
  self->_operations = a3 & ~completedOperations;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    PKPeerPaymentSetupOperationDescriptionForOperations(completedOperations);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v11;
    _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Removing completed peer payment setup operations %@", (uint8_t *)&v16, 0xCu);

  }
  if ((-[PKPeerPaymentAccount termsAcceptanceRequired](self->_peerPaymentAccount, "termsAcceptanceRequired") & 1) == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      PKPeerPaymentSetupOperationDescriptionForOperations(1uLL);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v12;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Filtering out peer payment setup operation %@", (uint8_t *)&v16, 0xCu);

    }
    -[PKPeerPaymentSetupFlowController _completedOperation:](self, "_completedOperation:", 1);
  }
  if (!-[PKPeerPaymentSetupFlowController _cipState](self, "_cipState"))
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      PKPeerPaymentSetupOperationDescriptionForOperations(0x40uLL);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v13;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Filtering out peer payment setup operation %@", (uint8_t *)&v16, 0xCu);

    }
    -[PKPeerPaymentSetupFlowController _completedOperation:](self, "_completedOperation:", 64);
  }
  if (!-[PKPeerPaymentSetupFlowController _hasTooManyPasses](self, "_hasTooManyPasses"))
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      PKPeerPaymentSetupOperationDescriptionForOperations(4uLL);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v14;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Filtering out peer payment setup operation %@", (uint8_t *)&v16, 0xCu);

    }
    -[PKPeerPaymentSetupFlowController _completedOperation:](self, "_completedOperation:", 4);
  }
  if (-[PKPeerPaymentSetupFlowControllerConfiguration peerPaymentSetupConfigurationType](self->_configuration, "peerPaymentSetupConfigurationType") == 1&& -[PKPeerPaymentSetupFlowController _peerPaymentPassIsProvisioned](self, "_peerPaymentPassIsProvisioned"))
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      PKPeerPaymentSetupOperationDescriptionForOperations(0x20uLL);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "Filtering out peer payment setup operation %@", (uint8_t *)&v16, 0xCu);

    }
    -[PKPeerPaymentSetupFlowController _completedOperation:](self, "_completedOperation:", 32);
  }

}

- (BOOL)_willDisplayErrorForOperationOperationInContext:(unint64_t)a3 completion:(id)a4
{
  __int16 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  uint8_t buf[4];
  void *v81;
  uint64_t v82;

  v4 = a3;
  v82 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((v4 & 2) != 0)
  {
    if (PKPaymentSetupContextIsSetupAssistant())
    {
      PKLogFacilityTypeGetObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        PKPeerPaymentSetupOperationDescriptionForOperations(2uLL);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v81 = v18;
        _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "Not performing operation %@ because the user is in setup assistant", buf, 0xCu);

      }
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_HSA2_ACCOUNT_REQUIRED_ERROR_TITLE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_HSA2_ACCOUNT_REQUIRED_ERROR_DESCRIPTION"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPaymentString(CFSTR("SET_UP_LATER_BUTTON_TITLE"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke;
      v78[3] = &unk_1E3E61CA8;
      v79 = v6;
      objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, v78);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v21);

      -[PKPeerPaymentSetupFlowControllerDataSource navigationController](self->_parentViewController, "navigationController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "presentViewController:animated:completion:", v11, 1, 0);

      v16 = v79;
      goto LABEL_49;
    }
    if (PKPaymentSetupContextIsBridge())
    {
      if (self->_hasPresentedDeviceToDeviceEncryptionFlow)
      {
        PKLogFacilityTypeGetObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          PKPeerPaymentSetupOperationDescriptionForOperations(2uLL);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v81 = v25;
          _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, "Not performing operation %@ because the user is in bridge and has already need the device to device encryption flow", buf, 0xCu);

        }
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_WATCH_SECURITY_STILL_PENDING_TITLE"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_WATCH_SECURITY_STILL_PENDING_MESSAGE"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_97;
        v76[3] = &unk_1E3E61CA8;
        v77 = v6;
        objc_msgSend(v26, "actionWithTitle:style:handler:", v27, 1, v76);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addAction:", v28);

        -[PKPeerPaymentSetupFlowControllerDataSource navigationController](self->_parentViewController, "navigationController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "presentViewController:animated:completion:", v11, 1, 0);

        v16 = v77;
        goto LABEL_49;
      }
    }
    else if (self->_hasPresentedDeviceToDeviceEncryptionFlow)
    {
      PKLogFacilityTypeGetObject();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        PKPeerPaymentSetupOperationDescriptionForOperations(2uLL);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v81 = v37;
        _os_log_impl(&dword_19D178000, v36, OS_LOG_TYPE_DEFAULT, "Not performing operation %@ because the user has already need the device to device encryption flow", buf, 0xCu);

      }
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_GENERIC_ERROR_TITLE"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_SETUP_GENERIC_ERROR_MESSAGE"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayableErrorCustom();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v74[0] = MEMORY[0x1E0C809B0];
      v74[1] = 3221225472;
      v74[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_102;
      v74[3] = &unk_1E3E61590;
      v75 = v6;
      v40 = PKAlertForDisplayableErrorWithHandlers(v9, 0, v74, 0);
      -[PKPeerPaymentSetupFlowControllerDataSource navigationController](self->_parentViewController, "navigationController");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "presentViewController:animated:completion:", v40, 1, 0);

      goto LABEL_51;
    }
    goto LABEL_44;
  }
  if ((v4 & 0x40) == 0)
  {
    if ((v4 & 8) != 0)
    {
      if (PKPaymentSetupContextIsSetupAssistant())
      {
        PKLogFacilityTypeGetObject();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          PKPeerPaymentSetupOperationDescriptionForOperations(8uLL);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v81 = v31;
          _os_log_impl(&dword_19D178000, v30, OS_LOG_TYPE_DEFAULT, "Not performing operation %@ because the user is in setup assistant", buf, 0xCu);

        }
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACTIVATION_FAILED_TITLE"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACTIVATION_FAILED_MESSAGE"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedPaymentString(CFSTR("SET_UP_LATER_BUTTON_TITLE"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_121;
        v66[3] = &unk_1E3E61CA8;
        v67 = v6;
        objc_msgSend(v32, "actionWithTitle:style:handler:", v33, 0, v66);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addAction:", v34);

        -[PKPeerPaymentSetupFlowControllerDataSource navigationController](self->_parentViewController, "navigationController");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "presentViewController:animated:completion:", v11, 1, 0);

        v16 = v67;
        goto LABEL_49;
      }
    }
    else if ((v4 & 4) != 0)
    {
      if (PKPaymentSetupContextIsSetupAssistant())
      {
        PKLogFacilityTypeGetObject();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          PKPeerPaymentSetupOperationDescriptionForOperations(4uLL);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v81 = v47;
          _os_log_impl(&dword_19D178000, v46, OS_LOG_TYPE_DEFAULT, "Not performing operation %@ because the user is in setup assistant", buf, 0xCu);

        }
        MEMORY[0x1A1AE3A74](*MEMORY[0x1E0D68508], 0);
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_GENERIC_ERROR_TITLE"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_GENERIC_ERROR_MESSAGE"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedPaymentString(CFSTR("SET_UP_LATER_BUTTON_TITLE"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_126;
        v64[3] = &unk_1E3E61CA8;
        v65 = v6;
        objc_msgSend(v48, "actionWithTitle:style:handler:", v49, 0, v64);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addAction:", v50);

        -[PKPeerPaymentSetupFlowControllerDataSource navigationController](self->_parentViewController, "navigationController");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "presentViewController:animated:completion:", v11, 1, 0);

        v16 = v65;
        goto LABEL_49;
      }
    }
    else if ((v4 & 0x100) != 0
           && -[PKPeerPaymentSetupFlowControllerConfiguration peerPaymentSetupConfigurationType](self->_configuration, "peerPaymentSetupConfigurationType") != 1)
    {
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        PKPeerPaymentSetupOperationDescriptionForOperations(0x100uLL);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v81 = v8;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Not performing operation %@ because the user is not adding an associated account", buf, 0xCu);

      }
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_GENERIC_ERROR_TITLE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_GENERIC_ERROR_MESSAGE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPaymentString(CFSTR("SET_UP_LATER_BUTTON_TITLE"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_127;
      v62[3] = &unk_1E3E61CA8;
      v63 = v6;
      objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v62);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v14);

      -[PKPeerPaymentSetupFlowControllerDataSource navigationController](self->_parentViewController, "navigationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "presentViewController:animated:completion:", v11, 1, 0);

      v16 = v63;
      goto LABEL_49;
    }
    goto LABEL_44;
  }
  v23 = -[PKPeerPaymentSetupFlowController _cipState](self, "_cipState");
  if (v23 == 2)
  {
    if ((PKDeviceSupportsPeerPaymentIdentityVerification() & 1) != 0)
    {
      PKLogFacilityTypeGetObject();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        PKPeerPaymentSetupOperationDescriptionForOperations(0x40uLL);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v81 = v43;
        _os_log_impl(&dword_19D178000, v42, OS_LOG_TYPE_DEFAULT, "Not performing operation %@ because the cannot perform CIP.", buf, 0xCu);

      }
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACCOUNT_STATE_FOOTER_CONTACT_SUPPORT_BUTTON"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_ACCOUNT_STATE_FOOTER_CONTACT_SUPPORT_BODY"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((PKPaymentSetupContextIsSetupAssistant() & 1) != 0)
        PKLocalizedPaymentString(CFSTR("SET_UP_LATER_BUTTON_TITLE"));
      else
        PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)MEMORY[0x1E0DC3448];
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_107;
      v70[3] = &unk_1E3E61CA8;
      v71 = v6;
      objc_msgSend(v54, "actionWithTitle:style:handler:", v11, 0, v70);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addAction:", v55);

      -[PKPeerPaymentSetupFlowControllerDataSource navigationController](self->_parentViewController, "navigationController");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "presentViewController:animated:completion:", v53, 1, 0);

      goto LABEL_50;
    }
    goto LABEL_39;
  }
  if (v23 != 1)
  {
    if ((PKDeviceSupportsPeerPaymentIdentityVerification() & 1) != 0)
      goto LABEL_44;
LABEL_39:
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_2;
    v72[3] = &unk_1E3E61590;
    v73 = v6;
    PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(v72);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentSetupFlowControllerDataSource navigationController](self->_parentViewController, "navigationController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "presentViewController:animated:completion:", v44, 1, 0);

    v9 = v73;
LABEL_51:

    v52 = 1;
    goto LABEL_52;
  }
  if ((PKDeviceSupportsPeerPaymentIdentityVerification() & 1) == 0)
    goto LABEL_39;
  if (PKPaymentSetupContextIsSetupAssistant())
  {
    if (-[PKPeerPaymentSetupFlowControllerConfiguration peerPaymentSetupConfigurationType](self->_configuration, "peerPaymentSetupConfigurationType") == 1)
    {
      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ERROR_IDENTITY_VERIFICATION_SETUP_ASSISTANT_FAMILY_ALERT_TITLE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_ERROR_IDENTITY_VERIFICATION_SETUP_ASSISTANT_FAMILY_ALERT_MESSAGE"));
    }
    else
    {
      PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_SETUP_ASSISTANT_ALERT_TITLE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPeerPaymentString(CFSTR("IDENTITY_VERIFICATION_SETUP_ASSISTANT_ALERT_MESSAGE"));
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedPaymentString(CFSTR("SET_UP_LATER_BUTTON_TITLE"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_2_116;
    v68[3] = &unk_1E3E61CA8;
    v69 = v6;
    objc_msgSend(v57, "actionWithTitle:style:handler:", v58, 0, v68);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v59);

    -[PKPeerPaymentSetupFlowControllerDataSource navigationController](self->_parentViewController, "navigationController");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "presentViewController:animated:completion:", v11, 1, 0);

    v16 = v69;
LABEL_49:

LABEL_50:
    goto LABEL_51;
  }
LABEL_44:
  v52 = 0;
LABEL_52:

  return v52;
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_97(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_107(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_2_116(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_121(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_126(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__PKPeerPaymentSetupFlowController__willDisplayErrorForOperationOperationInContext_completion___block_invoke_127(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_hasTooManyPasses
{
  NSObject *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  objc_class *v7;
  __CFString *v8;
  NSObject *v9;
  objc_class *v10;
  __CFString *v11;
  NSObject *v12;
  const __CFString *v13;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((PKDisableDynamicSEAllocation() & 1) != 0)
  {
    -[PKPaymentWebService targetDevice](self->_paymentWebService, "targetDevice");
    v3 = objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentSetupFlowController passesIncludingPeerPaymentPass:isCheckingTotalPassCount:](self, "passesIncludingPeerPaymentPass:isCheckingTotalPassCount:", 0, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "pk_countObjectsPassingTest:", &__block_literal_global_129);
    if (v5)
    {
      if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v6 = -[NSObject maximumPaymentCards](v3, "maximumPaymentCards");
      }
      else
      {
        PKLogFacilityTypeGetObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = (objc_class *)objc_opt_class();
          NSStringFromClass(v10);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v15 = 138543362;
          v16 = v11;
          _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - Target device did not respond to max payment cards. Assuming local maximum.", (uint8_t *)&v15, 0xCu);

        }
        v6 = PKMaxPaymentCards();
      }
      LODWORD(v5) = v6 - 1 < v5;
    }
    PKLogFacilityTypeGetObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("NO");
      if ((_DWORD)v5)
        v13 = CFSTR("YES");
      v15 = 138412290;
      v16 = v13;
      _os_log_impl(&dword_19D178000, v12, OS_LOG_TYPE_DEFAULT, "Need to ensure pass count %@ for peer payment setup", (uint8_t *)&v15, 0xCu);
    }

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - _hasTooManyPasses returning false because dynamic se allocation enabled", (uint8_t *)&v15, 0xCu);

    }
    LOBYTE(v5) = 0;
  }

  return v5;
}

BOOL __53__PKPeerPaymentSetupFlowController__hasTooManyPasses__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passActivationState") != 4;
}

- (void)_checkManateeCapabilityWithCompletion:(id)a3
{
  id v4;
  PKSecurityCapabilitiesController *v5;
  PKSecurityCapabilitiesController *securityCapabiltiesController;
  PKSecurityCapabilitiesController *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    v5 = -[PKSecurityCapabilitiesController initWithRequirements:feature:context:]([PKSecurityCapabilitiesController alloc], "initWithRequirements:feature:context:", 8, 1, self->_context);
    securityCapabiltiesController = self->_securityCapabiltiesController;
    self->_securityCapabiltiesController = v5;

    v7 = self->_securityCapabiltiesController;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__PKPeerPaymentSetupFlowController__checkManateeCapabilityWithCompletion___block_invoke;
    v8[3] = &unk_1E3E6AAD0;
    v9 = v4;
    -[PKSecurityCapabilitiesController isEnabledForSecuirtyRequirementsWithCompletion:](v7, "isEnabledForSecuirtyRequirementsWithCompletion:", v8);

  }
}

void __74__PKPeerPaymentSetupFlowController__checkManateeCapabilityWithCompletion___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__PKPeerPaymentSetupFlowController__checkManateeCapabilityWithCompletion___block_invoke_2;
  v3[3] = &unk_1E3E61A58;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __74__PKPeerPaymentSetupFlowController__checkManateeCapabilityWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_checkCloudStoreSetupWithCompletion:(id)a3
{
  id v4;
  PKSecurityCapabilitiesController *v5;
  PKSecurityCapabilitiesController *securityCapabiltiesController;
  PKSecurityCapabilitiesController *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    v5 = -[PKSecurityCapabilitiesController initWithRequirements:feature:context:]([PKSecurityCapabilitiesController alloc], "initWithRequirements:feature:context:", 32, 1, self->_context);
    securityCapabiltiesController = self->_securityCapabiltiesController;
    self->_securityCapabiltiesController = v5;

    v7 = self->_securityCapabiltiesController;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__PKPeerPaymentSetupFlowController__checkCloudStoreSetupWithCompletion___block_invoke;
    v8[3] = &unk_1E3E6AAD0;
    v9 = v4;
    -[PKSecurityCapabilitiesController isEnabledForSecuirtyRequirementsWithCompletion:](v7, "isEnabledForSecuirtyRequirementsWithCompletion:", v8);

  }
}

void __72__PKPeerPaymentSetupFlowController__checkCloudStoreSetupWithCompletion___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  char v9;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PKPeerPaymentSetupFlowController__checkCloudStoreSetupWithCompletion___block_invoke_2;
  block[3] = &unk_1E3E7B600;
  v5 = *(id *)(a1 + 32);
  v9 = a2;
  v7 = v5;
  v8 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __72__PKPeerPaymentSetupFlowController__checkCloudStoreSetupWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    v3 = *(_QWORD *)(a1 + 40) == 0;
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, _BOOL8))(v2 + 16))(v2, v3);
}

- (void)_checkMissingTLKsWithCompletion:(id)a3
{
  id v4;
  PKSecurityCapabilitiesController *v5;
  PKSecurityCapabilitiesController *securityCapabiltiesController;
  PKSecurityCapabilitiesController *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    v5 = -[PKSecurityCapabilitiesController initWithRequirements:feature:context:]([PKSecurityCapabilitiesController alloc], "initWithRequirements:feature:context:", 16, 1, -[PKPeerPaymentSetupFlowController context](self, "context"));
    securityCapabiltiesController = self->_securityCapabiltiesController;
    self->_securityCapabiltiesController = v5;

    v7 = self->_securityCapabiltiesController;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__PKPeerPaymentSetupFlowController__checkMissingTLKsWithCompletion___block_invoke;
    v8[3] = &unk_1E3E6AAD0;
    v9 = v4;
    -[PKSecurityCapabilitiesController isEnabledForSecuirtyRequirementsWithCompletion:](v7, "isEnabledForSecuirtyRequirementsWithCompletion:", v8);

  }
}

void __68__PKPeerPaymentSetupFlowController__checkMissingTLKsWithCompletion___block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[4];
  id v3;
  char v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __68__PKPeerPaymentSetupFlowController__checkMissingTLKsWithCompletion___block_invoke_2;
  v2[3] = &unk_1E3E61A58;
  v4 = a2;
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __68__PKPeerPaymentSetupFlowController__checkMissingTLKsWithCompletion___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  _QWORD *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (!v2)
      v4 = CFSTR("YES");
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Need to present missing TLKs flow %@ for peer payment setup", (uint8_t *)&v7, 0xCu);
  }

  v5 = (_QWORD *)MEMORY[0x1E0D683A0];
  if (v2)
    v5 = (_QWORD *)MEMORY[0x1E0D68518];
  MEMORY[0x1A1AE3A74](*v5, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)_cipState
{
  unint64_t result;

  if (-[PKPeerPaymentAccount state](self->_peerPaymentAccount, "state") == 1
    && -[PKPeerPaymentAccount stage](self->_peerPaymentAccount, "stage") == 3)
  {
    return 0;
  }
  result = -[PKPeerPaymentAccount state](self->_peerPaymentAccount, "state");
  if (result != 1)
  {
    if (-[PKPeerPaymentAccount identityVerificationRequired](self->_peerPaymentAccount, "identityVerificationRequired"))return 1;
    else
      return 2;
  }
  return result;
}

- (BOOL)_peerPaymentPassIsProvisioned
{
  return -[PKPaymentPass activationState](self->_peerPaymentPass, "activationState") != PKPaymentPassActivationStateDeactivated;
}

- (void)_fetchAppleCashCapabilitiesIfNecessary
{
  PKPeerPaymentSetupFlowControllerConfiguration *v3;
  void *v4;
  NSObject *v5;
  PKDeviceSharingCapabilitiesManager *deviceCapabiltiesManager;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[PKPeerPaymentSetupFlowControllerConfiguration peerPaymentSetupConfigurationType](self->_configuration, "peerPaymentSetupConfigurationType") == 1)
  {
    if (-[PKPeerPaymentSetupFlowControllerConfiguration peerPaymentSetupConfigurationType](self->_configuration, "peerPaymentSetupConfigurationType") == 1)v3 = self->_configuration;
    else
      v3 = 0;
    -[PKPeerPaymentSetupFlowControllerConfiguration familyMember](v3, "familyMember");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Fetching family member apple cash capabilities %@", buf, 0xCu);
    }

    if (v4)
    {
      deviceCapabiltiesManager = self->_deviceCapabiltiesManager;
      objc_msgSend(v4, "appleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDeviceSharingCapabilitiesManager fetchDeviceCapabilitesForAppleIDs:associatedFamilyMembers:](deviceCapabiltiesManager, "fetchDeviceCapabilitesForAppleIDs:associatedFamilyMembers:", v8, v9);

    }
  }
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id v4;
  NSObject *v5;
  PKPeerPaymentService *peerPaymentService;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Completed identity verification for peer payment setup", buf, 2u);
  }

  peerPaymentService = self->_peerPaymentService;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PKPeerPaymentSetupFlowController_viewControllerDidTerminateSetupFlow___block_invoke;
  v8[3] = &unk_1E3E7B628;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[PKPeerPaymentService updateAccountWithCompletion:](peerPaymentService, "updateAccountWithCompletion:", v8);

}

void __72__PKPeerPaymentSetupFlowController_viewControllerDidTerminateSetupFlow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PKPeerPaymentSetupFlowController_viewControllerDidTerminateSetupFlow___block_invoke_2;
  block[3] = &unk_1E3E61400;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __72__PKPeerPaymentSetupFlowController_viewControllerDidTerminateSetupFlow___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v2 = (void *)a1[4];
  if (v2)
    objc_storeStrong((id *)(a1[5] + 144), v2);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__PKPeerPaymentSetupFlowController_viewControllerDidTerminateSetupFlow___block_invoke_3;
  v5[3] = &unk_1E3E612E8;
  v3 = (void *)a1[6];
  v5[4] = a1[5];
  return objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v5);
}

void __72__PKPeerPaymentSetupFlowController_viewControllerDidTerminateSetupFlow___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  v2 = objc_msgSend(*(id *)(a1 + 32), "_cipState");
  if ((unint64_t)(v2 - 1) >= 3)
  {
    if (!v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_completedOperation:", 64);
      objc_msgSend(*(id *)(a1 + 32), "_nextViewControllerWithCompletion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    }
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "The user account is still not in a good state and CIP might still be required.", v8, 2u);
    }

    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0D673F8], "displayableErrorForError:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v5);

      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 72);
      *(_QWORD *)(v6 + 72) = 0;

    }
  }
}

- (void)viewControllerDidCancelSetupFlow:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v4 = a3;
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Completed identity verification with cancel for peer payment setup", buf, 2u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PKPeerPaymentSetupFlowController_viewControllerDidCancelSetupFlow___block_invoke;
  v6[3] = &unk_1E3E612E8;
  v6[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v6);

}

uint64_t __69__PKPeerPaymentSetupFlowController_viewControllerDidCancelSetupFlow___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD))(result + 16))(result, 0, 1, 0);
  return result;
}

- (void)selectPassesViewControllerDidTapBackButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id nextViewControllerCompletion;
  uint8_t v10[16];

  v4 = a3;
  -[PKPeerPaymentSetupFlowControllerDataSource navigationController](self->_parentViewController, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v6, "count") - 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "The user tapped the back button when removing a pass", v10, 2u);
      }

      nextViewControllerCompletion = self->_nextViewControllerCompletion;
      if (nextViewControllerCompletion)
        (*((void (**)(id, _QWORD, uint64_t, _QWORD))nextViewControllerCompletion + 2))(nextViewControllerCompletion, 0, 1, 0);
    }
  }

}

- (void)selectPassesViewController:(id)a3 didSelectPasses:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKPaymentWebService *paymentWebService;
  id v15;
  id v16;
  id v17;
  id obj;
  void *v19;
  _QWORD block[5];
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v8 = a4;
  v17 = a5;
  -[PKPaymentWebService targetDevice](self->_paymentWebService, "targetDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_group_create();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__68;
  v30[4] = __Block_byref_object_dispose__68;
  v31 = 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12);
        dispatch_group_enter(v9);
        paymentWebService = self->_paymentWebService;
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __90__PKPeerPaymentSetupFlowController_selectPassesViewController_didSelectPasses_completion___block_invoke;
        v23[3] = &unk_1E3E79B80;
        v25 = v30;
        v24 = v9;
        objc_msgSend(v19, "paymentWebService:removePass:withCompletionHandler:", paymentWebService, v13, v23);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v10);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKPeerPaymentSetupFlowController_selectPassesViewController_didSelectPasses_completion___block_invoke_2;
  block[3] = &unk_1E3E7B650;
  block[4] = self;
  v21 = v17;
  v22 = v30;
  v15 = v17;
  dispatch_group_notify(v9, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v30, 8);
}

void __90__PKPeerPaymentSetupFlowController_selectPassesViewController_didSelectPasses_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6 && (a2 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __90__PKPeerPaymentSetupFlowController_selectPassesViewController_didSelectPasses_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v3)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, 0);
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 72);
      *(_QWORD *)(v4 + 72) = 0;

    }
    else
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "_hasTooManyPasses");
      v7 = *(_QWORD **)(a1 + 32);
      if (!v6)
      {
        objc_msgSend(v7, "_completedOperation:", 4);
        v7 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v7, "_nextViewControllerWithCompletion:", v7[9]);
    }
  }
}

- (void)confirmNameViewControllerCancelled:(id)a3
{
  PKPeerPaymentConfirmNameViewController *v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v4 = (PKPeerPaymentConfirmNameViewController *)a3;
  if (self->_confirmNameViewControllerBeingPresented == v4)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Name confirmation view controller canceled", buf, 2u);
    }

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__PKPeerPaymentSetupFlowController_confirmNameViewControllerCancelled___block_invoke;
    v6[3] = &unk_1E3E612E8;
    v6[4] = self;
    -[PKPeerPaymentConfirmNameViewController dismissViewControllerAnimated:completion:](v4, "dismissViewControllerAnimated:completion:", 1, v6);
  }

}

void __71__PKPeerPaymentSetupFlowController_confirmNameViewControllerCancelled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v2 + 16))(v2, 0, 1, 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 72);
    *(_QWORD *)(v3 + 72) = 0;

  }
}

- (void)confirmNameViewController:(id)a3 enteredFirstName:(id)a4 lastName:(id)a5
{
  PKPeerPaymentConfirmNameViewController *v8;
  id v9;
  id v10;
  NSObject *v11;
  PKPeerPaymentSetupFlowControllerConfiguration *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = (PKPeerPaymentConfirmNameViewController *)a3;
  v9 = a4;
  v10 = a5;
  if (self->_confirmNameViewControllerBeingPresented == v8)
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "Name confirmation view controller completed with %@ %@", (uint8_t *)&v13, 0x16u);
    }

    if (-[PKPeerPaymentSetupFlowControllerConfiguration peerPaymentSetupConfigurationType](self->_configuration, "peerPaymentSetupConfigurationType") == 1)v12 = self->_configuration;
    else
      v12 = 0;
    -[PKPeerPaymentSetupFlowControllerConfiguration setFirstName:](v12, "setFirstName:", v9);
    -[PKPeerPaymentSetupFlowControllerConfiguration setLastName:](v12, "setLastName:", v10);
    if (self->_nextViewControllerCompletion)
      -[PKPeerPaymentSetupFlowController _nextViewControllerWithCompletion:](self, "_nextViewControllerWithCompletion:");

  }
}

- (void)_handlePeerPaymentAccountDidChangeNotification
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKPeerPaymentSetupFlowController__handlePeerPaymentAccountDidChangeNotification__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __82__PKPeerPaymentSetupFlowController__handlePeerPaymentAccountDidChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "targetDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 144);
  *(_QWORD *)(v3 + 144) = v2;

}

- (id)_peerPaymentWebService
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];
  uint8_t buf[16];

  if (PKPaymentSetupContextIsBridge()
    && -[PKPeerPaymentSetupFlowControllerConfiguration peerPaymentSetupConfigurationType](self->_configuration, "peerPaymentSetupConfigurationType") != 1)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Using watch peer payment web service for peer payment setup", buf, 2u);
    }

    -[objc_class watchPeerPaymentWebService](getNPKCompanionAgentConnectionClass_9(), "watchPeerPaymentWebService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Using phone peer payment web service for peer payment setup", v7, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_paymentWebService
{
  if (PKPaymentSetupContextIsBridge())
    -[objc_class watchPaymentWebService](getNPKCompanionAgentConnectionClass_9(), "watchPaymentWebService");
  else
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PKPeerPaymentSetupFlowControllerDataSource)parentViewController
{
  return self->_parentViewController;
}

- (void)setParentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_parentViewController, a3);
}

- (int64_t)context
{
  return self->_context;
}

- (PKPeerPaymentSetupFlowControllerConfiguration)configuration
{
  return self->_configuration;
}

- (PKPeerPaymentCredential)peerPaymentCredential
{
  return self->_peerPaymentCredential;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (PKPeerPaymentWebService)peerPaymentWebService
{
  return self->_peerPaymentWebService;
}

- (PKPaymentWebService)paymentWebService
{
  return self->_paymentWebService;
}

- (PKPeerPaymentService)peerPaymentService
{
  return self->_peerPaymentService;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (PKDeviceSharingCapabilitiesManager)deviceCapabiltiesManager
{
  return self->_deviceCapabiltiesManager;
}

- (UIImage)passSnapShot
{
  return self->_passSnapShot;
}

- (PKPeerPaymentSetupFlowControllerDelegate)flowItemDelegate
{
  return (PKPeerPaymentSetupFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_flowItemDelegate);
}

- (void)setFlowItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flowItemDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_storeStrong((id *)&self->_passSnapShot, 0);
  objc_storeStrong((id *)&self->_deviceCapabiltiesManager, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_peerPaymentCredential, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_parentViewController, 0);
  objc_storeStrong(&self->_nextViewControllerCompletion, 0);
  objc_storeStrong((id *)&self->_confirmNameViewControllerBeingPresented, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_securityCapabiltiesController, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_peerPaymentPass, 0);
}

@end
