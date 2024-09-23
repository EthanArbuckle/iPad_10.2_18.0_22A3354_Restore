@implementation PKPassUpgradeControllerBase

- (PKPassUpgradeControllerBase)init
{

  return 0;
}

- (PKPassUpgradeControllerBase)initWithWebService:(id)a3 addPaymentPassToLibrary:(id)a4
{
  id v7;
  id v8;
  PKPassUpgradeControllerBase *v9;
  PKPassUpgradeControllerBase *v10;
  void *v11;
  id addPaymentPassToLibrary;
  NSMutableDictionary *v13;
  NSMutableDictionary *pendingPassUpgrades;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPassUpgradeControllerBase;
  v9 = -[PKPassUpgradeControllerBase init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentWebService, a3);
    v11 = _Block_copy(v8);
    addPaymentPassToLibrary = v10->_addPaymentPassToLibrary;
    v10->_addPaymentPassToLibrary = v11;

    v10->_pass_upgrade_lock._os_unfair_lock_opaque = 0;
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingPassUpgrades = v10->_pendingPassUpgrades;
    v10->_pendingPassUpgrades = v13;

  }
  return v10;
}

- (void)requestPassUpgrade:(id)a3 pass:(id)a4 diagnosticReason:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  os_unfair_lock_s *p_pass_upgrade_lock;
  uint64_t v17;
  PKPendingPassUpgrade *v18;
  void *v19;
  void *v20;
  PKPaymentRequestPassUpdateRequest *v21;
  PKPaymentRequestPassUpdateRequest *v22;
  PKPaymentWebService *paymentWebService;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    objc_msgSend(v11, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(6uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v27 = objc_msgSend(v10, "type");
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Requesting pass upgrade with reason %lu for pass %@", buf, 0x16u);
    }

    p_pass_upgrade_lock = &self->_pass_upgrade_lock;
    os_unfair_lock_lock(&self->_pass_upgrade_lock);
    -[NSMutableDictionary objectForKey:](self->_pendingPassUpgrades, "objectForKey:", v14);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (PKPendingPassUpgrade *)v17;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = (uint64_t)v14;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Coalescing pass upgrade requests for pass %@", buf, 0xCu);
      }

      -[PKPendingPassUpgrade completionHandlers](v18, "completionHandlers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = _Block_copy(v13);
      objc_msgSend(v19, "addObject:", v20);

      os_unfair_lock_unlock(p_pass_upgrade_lock);
    }
    else
    {
      v18 = -[PKPendingPassUpgrade initWithRequest:completionHandler:]([PKPendingPassUpgrade alloc], "initWithRequest:completionHandler:", v10, v13);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingPassUpgrades, "setObject:forKeyedSubscript:", v18, v14);
      os_unfair_lock_unlock(&self->_pass_upgrade_lock);
      v21 = -[PKPaymentRequestPassUpdateRequest initWithPaymentPass:updateRequest:]([PKPaymentRequestPassUpdateRequest alloc], "initWithPaymentPass:updateRequest:", v11, v10);
      v22 = v21;
      if (v12)
        -[PKWebServiceRequest addDiagnosticReason:](v21, "addDiagnosticReason:", v12);
      paymentWebService = self->_paymentWebService;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __83__PKPassUpgradeControllerBase_requestPassUpgrade_pass_diagnosticReason_completion___block_invoke;
      v24[3] = &unk_1E2ADB7F8;
      v24[4] = self;
      v25 = v14;
      -[PKPaymentWebService passUpgradeWithRequest:completion:](paymentWebService, "passUpgradeWithRequest:completion:", v22, v24);

    }
  }

}

void __83__PKPassUpgradeControllerBase_requestPassUpgrade_pass_diagnosticReason_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || !v6)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v35 = v25;
      v36 = 2112;
      v37 = v5;
      _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Pass upgrade (%@) request failed with error: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "completePassUpgradeForPassUniqueID:withError:", *(_QWORD *)(a1 + 40), v5);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "passURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v7, "appletState");
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWebRequestFinished:", 1);
    objc_msgSend(v12, "setRequiresAppletUpgrade:", v11 == 1);
    objc_msgSend(v12, "setUpgradePassURL:", v10);
    v13 = objc_msgSend(v12, "appletDidUpgrade");
    if (v11 == 1)
      v14 = v13;
    else
      v14 = 1;
    objc_msgSend(v12, "setPassUpgradeInProgress:", v14);
    v15 = objc_msgSend(v12, "upgradeIsComplete");
    v16 = *(_QWORD *)(a1 + 32);
    if (v15)
    {
      objc_msgSend(*(id *)(v16 + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
      PKLogFacilityTypeGetObject(6uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v35 = v18;
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Pass upgrade completed early for pass %@", buf, 0xCu);
      }

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v12, "completionHandlers", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v31;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v31 != v22)
              objc_enumerationMutation(v19);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v23++) + 16))();
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v21);
      }

    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 16));
      if ((v14 & 1) != 0)
      {
        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 32), "downloadUpgradedPassForPassUniqueID:atURL:", *(_QWORD *)(a1 + 40), v10);
        }
        else
        {
          PKLogFacilityTypeGetObject(6uLL);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            v35 = v29;
            _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, "Pass upgrade (%@) has no required work?", buf, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 32), "completePassUpgradeForPassUniqueID:withError:", *(_QWORD *)(a1 + 40), 0);
        }
      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          v35 = v27;
          _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Pass upgrade waiting for applet update (%@)", buf, 0xCu);
        }

      }
    }

  }
}

- (void)downloadUpgradedPassForPassUniqueID:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PKPaymentWebService *paymentWebService;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Downloading new pass for pass upgrade (%@) at url: %@", buf, 0x16u);
  }

  paymentWebService = self->_paymentWebService;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PKPassUpgradeControllerBase_downloadUpgradedPassForPassUniqueID_atURL___block_invoke;
  v11[3] = &unk_1E2ADB870;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  -[PKPaymentWebService passAtURL:completion:](paymentWebService, "passAtURL:completion:", v7, v11);

}

void __73__PKPassUpgradeControllerBase_downloadUpgradedPassForPassUniqueID_atURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2 == 1 && v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "targetDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "secureElementIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKDownloadRemoteAssetConfiguration configurationWithSEIDs:](PKDownloadRemoteAssetConfiguration, "configurationWithSEIDs:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73__PKPassUpgradeControllerBase_downloadUpgradedPassForPassUniqueID_atURL___block_invoke_2;
    v14[3] = &unk_1E2ADB848;
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v6;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v15, "downloadRemoteAssetsWithConfiguration:completion:", v9, v14);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Failed downloading new pass for pass upgrade (%@)", buf, 0xCu);
    }

    v13 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPaymentErrorDomain"), a2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "completePassUpgradeForPassUniqueID:withError:", v12, v8);
  }

}

void __73__PKPassUpgradeControllerBase_downloadUpgradedPassForPassUniqueID_atURL___block_invoke_2(id *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    if (v5)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = a1[6];
        *(_DWORD *)buf = 138412546;
        v16 = v8;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Downloading new pass assets for pass upgrade (%@) failed: %@", buf, 0x16u);
      }

      objc_msgSend(a1[4], "completePassUpgradeForPassUniqueID:withError:", a1[6], v6);
    }
    else
    {
      v9 = a1[4];
      v10 = a1[5];
      v11 = v9[1];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __73__PKPassUpgradeControllerBase_downloadUpgradedPassForPassUniqueID_atURL___block_invoke_3;
      v12[3] = &unk_1E2ADB820;
      v12[4] = v9;
      v13 = a1[6];
      v14 = a1[5];
      (*(void (**)(uint64_t, id, _QWORD *))(v11 + 16))(v11, v10, v12);

    }
  }

}

void __73__PKPassUpgradeControllerBase_downloadUpgradedPassForPassUniqueID_atURL___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 16));
  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpgradedPass:", a1[6]);
  v5 = objc_msgSend(v4, "upgradeIsComplete");
  v6 = a1[4];
  if (v5)
  {
    objc_msgSend(*(id *)(v6 + 24), "removeObjectForKey:", a1[5]);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[5];
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Pass upgrade completed for pass %@", buf, 0xCu);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "completionHandlers", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          if (v3)
            v14 = 0;
          else
            v14 = a1[6];
          (*(void (**)(_QWORD, id, uint64_t))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), v3, v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 16));
  }

}

- (void)completePassUpgradeForPassUniqueID:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_pass_upgrade_lock);
  -[NSMutableDictionary objectForKey:](self->_pendingPassUpgrades, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_pendingPassUpgrades, "removeObjectForKey:", v6);
  os_unfair_lock_unlock(&self->_pass_upgrade_lock);
  PKLogFacilityTypeGetObject(6uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "upgradedPass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = v6;
    v23 = 1024;
    v24 = v10 != 0;
    v25 = 1024;
    v26 = objc_msgSend(v8, "appletDidUpgrade");
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Pass upgrade (%@) failed: pass upgrade %d, applet updated %d", buf, 0x18u);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v8, "completionHandlers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)appletsDidUpdate
{
  NSObject *v3;
  os_unfair_lock_s *p_pass_upgrade_lock;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PKPassUpgradeControllerBase *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  void *v39;
  void *v40;
  PKPassUpgradeControllerBase *v41;
  id v42;
  id v43;
  id obj;
  uint64_t v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Pass Upgrade: Applets did update", buf, 2u);
  }

  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  p_pass_upgrade_lock = &self->_pass_upgrade_lock;
  os_unfair_lock_lock(&self->_pass_upgrade_lock);
  v5 = (void *)-[NSMutableDictionary copy](self->_pendingPassUpgrades, "copy");
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  v43 = v6;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v60;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v60 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v10);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "requiresAppletUpgrade")
          && (objc_msgSend(v12, "appletDidUpgrade") & 1) == 0)
        {
          objc_msgSend(v12, "setAppletDidUpgrade:", 1);
          if (objc_msgSend(v12, "upgradeIsComplete"))
          {
            objc_msgSend(v46, "setObject:forKeyedSubscript:", v12, v11);
            -[NSMutableDictionary removeObjectForKey:](self->_pendingPassUpgrades, "removeObjectForKey:", v11);
            goto LABEL_19;
          }
          v13 = self;
          objc_msgSend(v12, "upgradePassURL");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14
            && (v15 = (void *)v14,
                objc_msgSend(v12, "upgradedPass"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v16,
                v15,
                !v16))
          {
            if ((objc_msgSend(v12, "passUpgradeInProgress") & 1) == 0)
            {
              objc_msgSend(v12, "setPassUpgradeInProgress:", 1);
              objc_msgSend(v42, "setObject:forKeyedSubscript:", v12, v11);
              goto LABEL_17;
            }
            self = v13;
            if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v67 = v11;
              _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Pass download already in progress for pass upgrade (%@)", buf, 0xCu);
            }

          }
          else
          {
            if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v67 = v11;
              _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Pass upgrade %@ in invalid state", buf, 0xCu);
            }

LABEL_17:
            self = v13;
          }
          v6 = v43;
        }
LABEL_19:

        ++v10;
      }
      while (v8 != v10);
      v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      v8 = v17;
    }
    while (v17);
  }

  os_unfair_lock_unlock(p_pass_upgrade_lock);
  if (objc_msgSend(v46, "count"))
  {
    v41 = self;
    objc_msgSend(v46, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v18;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Applet update occured for pass upgrades: %@", buf, 0xCu);
    }

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v18;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    if (v19)
    {
      v20 = v19;
      v45 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v56 != v45)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v46, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v22;
            _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Pass upgrade completed for pass %@", buf, 0xCu);
          }
          v24 = v3;

          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          objc_msgSend(v23, "completionHandlers");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v52;
            do
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v52 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
                objc_msgSend(v23, "upgradedPass");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, _QWORD, void *))(v30 + 16))(v30, 0, v31);

              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
            }
            while (v27);
          }

          v3 = v24;
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      }
      while (v20);
    }

    self = v41;
    v6 = v43;
  }
  if (objc_msgSend(v42, "count"))
  {
    objc_msgSend(v42, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v32;
      _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Starting new pass downloads for pass upgrades: %@", buf, 0xCu);
    }

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v33 = v32;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v48;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v48 != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k);
          objc_msgSend(v42, "objectForKeyedSubscript:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "upgradePassURL");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPassUpgradeControllerBase downloadUpgradedPassForPassUniqueID:atURL:](self, "downloadUpgradedPassForPassUniqueID:atURL:", v38, v40);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
      }
      while (v35);
    }

    v6 = v43;
  }

}

- (PKPaymentWebService)paymentWebService
{
  return self->_paymentWebService;
}

- (void)setPaymentWebService:(id)a3
{
  objc_storeStrong((id *)&self->_paymentWebService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_pendingPassUpgrades, 0);
  objc_storeStrong(&self->_addPaymentPassToLibrary, 0);
}

@end
