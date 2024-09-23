@implementation PKExpressPassController

- (PKExpressPassController)initWithPaymentDataProvider:(id)a3 passLibraryDataProvider:(id)a4 isForWatch:(BOOL)a5
{
  id v8;
  id v9;
  PKExpressPassController *v10;
  PKExpressPassController *v11;
  id WeakRetained;
  id v13;
  char v14;
  id v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKExpressPassController;
  v10 = -[PKExpressPassController init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_paymentDataProvider, v8);
    objc_storeWeak((id *)&v11->_passLibraryDataProvider, v9);
    v11->_isForWatch = a5;
    WeakRetained = objc_loadWeakRetained((id *)&v11->_paymentDataProvider);
    v11->_hasSupportsExpressForAutomaticSelectionTechnologyTypeCheck = objc_opt_respondsToSelector() & 1;

    v13 = objc_loadWeakRetained((id *)&v11->_paymentDataProvider);
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      v15 = objc_loadWeakRetained((id *)&v11->_paymentDataProvider);
      v11->_apiVersion = objc_msgSend(v15, "apiVersion");

    }
    else
    {
      v11->_apiVersion = 0;
    }
  }

  return v11;
}

- (id)expressModeSupportedForPass:(id)a3
{
  id v4;
  PKExpressPassInformation *v5;
  id v6;
  NSObject *v7;
  _QWORD v9[5];
  uint8_t buf[16];

  v4 = a3;
  if (self->_hasSupportsExpressForAutomaticSelectionTechnologyTypeCheck)
  {
    v5 = [PKExpressPassInformation alloc];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__PKExpressPassController_expressModeSupportedForPass___block_invoke;
    v9[3] = &unk_1E2AD6EE0;
    v9[4] = self;
    v6 = -[PKExpressPassInformation initForPaymentPass:withTechologyTest:](v5, "initForPaymentPass:withTechologyTest:", v4, v9);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentDataProvider is missing supportsExpressForAutomaticSelectionTechnologyType", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

uint64_t __55__PKExpressPassController_expressModeSupportedForPass___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = objc_msgSend(WeakRetained, "supportsExpressForAutomaticSelectionTechnologyType:", a2);

  return v4;
}

- (BOOL)isExpressModeSupportedForPass:(id)a3
{
  id v4;
  PKExpressPassInformation *v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  _QWORD v10[5];
  uint8_t buf[16];

  v4 = a3;
  if (self->_hasSupportsExpressForAutomaticSelectionTechnologyTypeCheck)
  {
    v5 = [PKExpressPassInformation alloc];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__PKExpressPassController_isExpressModeSupportedForPass___block_invoke;
    v10[3] = &unk_1E2AD6EE0;
    v10[4] = self;
    v6 = -[PKExpressPassInformation initForPaymentPass:withTechologyTest:](v5, "initForPaymentPass:withTechologyTest:", v4, v10);
    v7 = v6 != 0;

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPaymentDataProvider is missing supportsExpressForAutomaticSelectionTechnologyType", buf, 2u);
    }

    v7 = 0;
  }

  return v7;
}

uint64_t __57__PKExpressPassController_isExpressModeSupportedForPass___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = objc_msgSend(WeakRetained, "supportsExpressForAutomaticSelectionTechnologyType:", a2);

  return v4;
}

- (void)conflictingExpressPassesWithPassConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  id WeakRetained;
  char v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];
  _QWORD v18[5];
  void (**v19)(_QWORD, _QWORD);
  _QWORD v20[5];
  void (**v21)(_QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v7)
  {
    if (!self->_apiVersion)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
    v10 = objc_opt_respondsToSelector();

    v11 = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
    if ((v10 & 1) != 0)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __84__PKExpressPassController_conflictingExpressPassesWithPassConfiguration_completion___block_invoke;
      v20[3] = &unk_1E2ACAB58;
      v20[4] = self;
      v21 = v8;
      objc_msgSend(v11, "conflictingExpressPassIdentifiersForPassConfiguration:withCompletion:", v6, v20);

      v12 = v21;
LABEL_8:

      goto LABEL_12;
    }
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
      objc_msgSend(v6, "passInformation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __84__PKExpressPassController_conflictingExpressPassesWithPassConfiguration_completion___block_invoke_2;
      v18[3] = &unk_1E2ACAB58;
      v18[4] = self;
      v19 = v8;
      objc_msgSend(v14, "conflictingExpressPassIdentifiersForPassInformation:withCompletion:", v15, v18);

      v12 = v19;
      goto LABEL_8;
    }
    PKLogFacilityTypeGetObject(6uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Unable to check for express mode conflicts", v17, 2u);
    }

    v8[2](v8, 0);
  }
LABEL_12:

}

void __84__PKExpressPassController_conflictingExpressPassesWithPassConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v4);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
          objc_msgSend(WeakRetained, "passWithUniqueID:", v11, (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v5, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v14 = *(_QWORD *)(a1 + 40);
    v15 = (void *)objc_msgSend(v5, "copy");
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __84__PKExpressPassController_conflictingExpressPassesWithPassConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v4);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
          objc_msgSend(WeakRetained, "passWithUniqueID:", v11, (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v5, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v14 = *(_QWORD *)(a1 + 40);
    v15 = (void *)objc_msgSend(v5, "copy");
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)conflictingExpressPassesWithPassInformation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  PKExpressPassConfiguration *v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (!self->_apiVersion)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
    objc_msgSend(v6, "passUniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "passWithUniqueID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "secureElementPass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[PKExpressPassConfiguration initWithPassInformation:forSecureElementPass:]([PKExpressPassConfiguration alloc], "initWithPassInformation:forSecureElementPass:", v6, v12);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__PKExpressPassController_conflictingExpressPassesWithPassInformation_completion___block_invoke;
    v14[3] = &unk_1E2ACAB80;
    v15 = v8;
    -[PKExpressPassController conflictingExpressPassesWithPassConfiguration:completion:](self, "conflictingExpressPassesWithPassConfiguration:completion:", v13, v14);

  }
}

uint64_t __82__PKExpressPassController_conflictingExpressPassesWithPassInformation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)existingExpressPassConfigurationForPass:(id)a3
{
  id v4;
  void *v5;
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  PKExpressPassConfiguration *v13;
  uint64_t v14;
  PKExpressPassConfiguration *i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  char v20;
  id v21;
  void *v22;
  uint64_t v23;
  PKExpressPassConfiguration *j;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  PKExpressPassConfiguration *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)p_paymentDataProvider);
  v8 = objc_opt_respondsToSelector();

  v9 = objc_loadWeakRetained((id *)p_paymentDataProvider);
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "expressPassConfigurations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = v11;
    v13 = (PKExpressPassConfiguration *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v13; i = (PKExpressPassConfiguration *)((char *)i + 1))
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v16, "passUniqueIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v5 && v17)
          {
            v19 = objc_msgSend(v17, "isEqual:", v5);

            if ((v19 & 1) != 0)
              goto LABEL_29;
          }
          else
          {

            if (v18 == v5)
            {
LABEL_29:
              v29 = v16;
              goto LABEL_32;
            }
          }
        }
        v13 = (PKExpressPassConfiguration *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_33:

    goto LABEL_34;
  }
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    v21 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    objc_msgSend(v21, "expressPassesInformation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v12 = v22;
    v13 = (PKExpressPassConfiguration *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v13)
    {
      v23 = *(_QWORD *)v32;
      while (2)
      {
        for (j = 0; j != v13; j = (PKExpressPassConfiguration *)((char *)j + 1))
        {
          if (*(_QWORD *)v32 != v23)
            objc_enumerationMutation(v12);
          v25 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v25, "passUniqueIdentifier", (_QWORD)v31);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v5 && v26)
          {
            v28 = objc_msgSend(v26, "isEqual:", v5);

            if ((v28 & 1) != 0)
              goto LABEL_31;
          }
          else
          {

            if (v27 == v5)
            {
LABEL_31:
              v29 = -[PKExpressPassConfiguration initWithPassInformation:forSecureElementPass:]([PKExpressPassConfiguration alloc], "initWithPassInformation:forSecureElementPass:", v25, v4);
LABEL_32:
              v13 = v29;
              goto LABEL_33;
            }
          }
        }
        v13 = (PKExpressPassConfiguration *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v13)
          continue;
        break;
      }
    }
    goto LABEL_33;
  }
  v13 = 0;
LABEL_34:

  return v13;
}

- (id)existingExpressPassInformationForPass:(id)a3
{
  void *v3;
  void *v4;

  -[PKExpressPassController existingExpressPassConfigurationForPass:](self, "existingExpressPassConfigurationForPass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)supportsLowPowerExpressMode
{
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v4;
  id v5;
  char v6;

  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  v5 = objc_loadWeakRetained((id *)p_paymentDataProvider);
  v6 = objc_msgSend(v5, "supportsLowPowerExpressMode");

  return v6;
}

- (id)expressModeUpgradeRequestForPass:(id)a3
{
  void *v3;
  void *v4;

  -[PKExpressPassController eligibleExpressUpgradeRequestsForPass:](self, "eligibleExpressUpgradeRequestsForPass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)eligibleExpressUpgradeRequestsForPass:(id)a3
{
  id v4;
  void *v5;
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  char v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD aBlock[5];
  uint8_t buf[16];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_hasSupportsExpressForAutomaticSelectionTechnologyTypeCheck)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__PKExpressPassController_eligibleExpressUpgradeRequestsForPass___block_invoke;
    aBlock[3] = &unk_1E2AD6EE0;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    p_paymentDataProvider = &self->_paymentDataProvider;
    WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
    objc_msgSend(WeakRetained, "secureElementIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_loadWeakRetained((id *)p_paymentDataProvider);
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        v11 = objc_loadWeakRetained((id *)p_paymentDataProvider);
        objc_msgSend(v11, "deviceClass");
        v12 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Unable to get device class", buf, 2u);
        }

        PKDeviceClass();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v16 = objc_loadWeakRetained((id *)p_paymentDataProvider);
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        v18 = objc_loadWeakRetained((id *)p_paymentDataProvider);
        objc_msgSend(v18, "deviceVersion");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Unable to get device version", buf, 2u);
        }

        +[PKOSVersionRequirement fromDeviceVersion](PKOSVersionRequirement, "fromDeviceVersion");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v25[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "eligibleExpressUpgradeRequestsForDeviceClass:deviceSEIDs:deviceVersion:technologyTest:", v12, v21, v19, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Unable to get device SEID", buf, 2u);
      }
      v14 = 0;
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "PKPaymentDataProvider is missing supportsExpressForAutomaticSelectionTechnologyType", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

uint64_t __65__PKExpressPassController_eligibleExpressUpgradeRequestsForPass___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = objc_msgSend(WeakRetained, "supportsExpressForAutomaticSelectionTechnologyType:", a2);

  return v4;
}

- (BOOL)hasEligibleExpressUpgradeRequestForPass:(id)a3
{
  void *v3;
  BOOL v4;

  -[PKExpressPassController eligibleExpressUpgradeRequestsForPass:](self, "eligibleExpressUpgradeRequestsForPass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)upgradeExpressModeForPass:(id)a3 withCredential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__PKExpressPassController_upgradeExpressModeForPass_withCredential_completion___block_invoke;
  v10[3] = &unk_1E2AD6F08;
  v11 = v8;
  v9 = v8;
  -[PKExpressPassController upgradeExpressModeForPass:withCredential:resultHandler:](self, "upgradeExpressModeForPass:withCredential:resultHandler:", a3, a4, v10);

}

uint64_t __79__PKExpressPassController_upgradeExpressModeForPass_withCredential_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)upgradeExpressModeForPass:(id)a3 withCredential:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  NSObject *v12;
  const char *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  if (objc_msgSend(WeakRetained, "isDeviceInRestrictedMode"))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LOWORD(location[0]) = 0;
    v13 = "Device in restricted mode, skipping pass upgrade.";
    goto LABEL_13;
  }
  if (self->_isForWatch)
  {
    v14 = objc_loadWeakRetained(&self->_presentingViewController);

    if (!v14)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      LOWORD(location[0]) = 0;
      v13 = "Missing presenting view controller, skipping pass upgrade.";
LABEL_13:
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)location, 2u);
LABEL_14:

      if (v10)
        (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
      goto LABEL_21;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    LOWORD(location[0]) = 0;
    v13 = "PKPaymentDataProvider is missing passUpgradeWithRequest:pass:visibleViewController:completion:, skipping pass upgrade.";
    goto LABEL_13;
  }
  -[PKExpressPassController expressModeUpgradeRequestForPass:](self, "expressModeUpgradeRequestForPass:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_initWeak(location, self);
    v16 = objc_loadWeakRetained(&self->_presentingViewController);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __82__PKExpressPassController_upgradeExpressModeForPass_withCredential_resultHandler___block_invoke;
    v18[3] = &unk_1E2AD6F30;
    objc_copyWeak(&v21, location);
    v20 = v10;
    v18[4] = self;
    v19 = v9;
    objc_msgSend(WeakRetained, "passUpgradeWithRequest:pass:visibleViewController:completion:", v15, v8, v16, v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Missing upgrade request for pass, skipping pass upgrade.", (uint8_t *)location, 2u);
    }

    if (v10)
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

LABEL_21:
}

void __82__PKExpressPassController_upgradeExpressModeForPass_withCredential_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void (*v10)(void);
  NSObject *v11;
  uint64_t v12;
  void (*v13)(void);
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  PKExpressPassConfiguration *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!v5 && v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "expressModeSupportedForPass:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
        {
          v17 = -[PKExpressPassConfiguration initWithPassInformation:forSecureElementPass:]([PKExpressPassConfiguration alloc], "initWithPassInformation:forSecureElementPass:", v8, v6);
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __82__PKExpressPassController_upgradeExpressModeForPass_withCredential_resultHandler___block_invoke_42;
          v19[3] = &unk_1E2ACAB58;
          v18 = *(_QWORD *)(a1 + 40);
          v21 = *(id *)(a1 + 48);
          v20 = v6;
          objc_msgSend(WeakRetained, "setExpressModeWithPassConfiguration:credential:completion:", v17, v18, v19);

          goto LABEL_21;
        }
        v9 = *(_QWORD *)(a1 + 48);
        if (!v9)
        {
LABEL_21:

          goto LABEL_22;
        }
        v10 = *(void (**)(void))(v9 + 16);
      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Upgraded pass cannot be made express, skipping setting express pass.", buf, 2u);
        }

        v16 = *(_QWORD *)(a1 + 48);
        if (!v16)
          goto LABEL_21;
        v10 = *(void (**)(void))(v16 + 16);
      }
      v10();
      goto LABEL_21;
    }
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
    {
      v13 = *(void (**)(void))(v14 + 16);
      goto LABEL_14;
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v5;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Pass upgrade completed (%@, %@) but instance was invalidated, skipping setting express pass.", buf, 0x16u);
    }

    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
    {
      v13 = *(void (**)(void))(v12 + 16);
LABEL_14:
      v13();
    }
  }
LABEL_22:

}

void __82__PKExpressPassController_upgradeExpressModeForPass_withCredential_resultHandler___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  if (!v3)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Failed setting express pass after pass upgrade.", v6, 2u);
    }

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 32), 0);

}

- (void)setExpressModeWithPassConfiguration:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  id WeakRetained;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  void (**v19)(id, _QWORD);
  _QWORD v20[5];
  void (**v21)(id, _QWORD);
  _QWORD v22[4];
  void (**v23)(id, _QWORD);
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  if (self->_isForWatch)
  {
    v12 = objc_loadWeakRetained(&self->_presentingViewController);

    if (!v12)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Missing presenting view controller, skipping setting express pass.", buf, 2u);
      }

      if (v10)
        v10[2](v10, 0);
      goto LABEL_14;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = objc_loadWeakRetained(&self->_presentingViewController);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke;
      v22[3] = &unk_1E2ACAD80;
      v23 = v10;
      objc_msgSend(WeakRetained, "setExpressWithPassConfiguration:visibleViewController:requiresAuth:completion:", v8, v13, 1, v22);

      v14 = v23;
LABEL_13:

LABEL_14:
      return;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "passInformation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_loadWeakRetained(&self->_presentingViewController);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke_2;
      v20[3] = &unk_1E2ACAD58;
      v20[4] = self;
      v21 = v10;
      objc_msgSend(WeakRetained, "setExpressWithPassInformation:visibleViewController:requiresAuth:completion:", v16, v17, 1, v20);

      v14 = v21;
      goto LABEL_13;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke_4;
    v18[3] = &unk_1E2ACAD80;
    v19 = v10;
    objc_msgSend(WeakRetained, "setExpressWithPassConfiguration:credential:completion:", v8, v9, v18);
    v14 = v19;
    goto LABEL_13;
  }
  __break(1u);
}

uint64_t __85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (!a2)
      a3 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

void __85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v8 = v5;
    if ((a2 & 1) != 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke_3;
      v9[3] = &unk_1E2AD6F58;
      v9[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "pk_setBySafelyApplyingBlock:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    }
    v5 = v8;
  }

}

PKExpressPassConfiguration *__85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  PKExpressPassConfiguration *v8;

  v2 = (id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "passUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "passWithUniqueID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureElementPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PKExpressPassConfiguration initWithPassInformation:forSecureElementPass:]([PKExpressPassConfiguration alloc], "initWithPassInformation:forSecureElementPass:", v3, v7);
  return v8;
}

uint64_t __85__PKExpressPassController_setExpressModeWithPassConfiguration_credential_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)setExpressModeWithPassInformation:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  PKExpressPassConfiguration *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
  objc_msgSend(v10, "passUniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "passWithUniqueID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "secureElementPass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[PKExpressPassConfiguration initWithPassInformation:forSecureElementPass:]([PKExpressPassConfiguration alloc], "initWithPassInformation:forSecureElementPass:", v10, v14);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83__PKExpressPassController_setExpressModeWithPassInformation_credential_completion___block_invoke;
  v17[3] = &unk_1E2ACAB80;
  v18 = v8;
  v16 = v8;
  -[PKExpressPassController setExpressModeWithPassConfiguration:credential:completion:](self, "setExpressModeWithPassConfiguration:credential:completion:", v15, v9, v17);

}

void __83__PKExpressPassController_setExpressModeWithPassInformation_credential_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "pk_setByApplyingBlock:", &__block_literal_global_171);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __83__PKExpressPassController_setExpressModeWithPassInformation_credential_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passInformation");
}

- (void)_disableExpressModeForPassWithUniqueIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  if (self->_isForWatch)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = objc_loadWeakRetained(&self->_presentingViewController);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __89__PKExpressPassController__disableExpressModeForPassWithUniqueIdentifier_withCompletion___block_invoke;
      v15[3] = &unk_1E2ACAD58;
      v10 = &v16;
      v15[4] = self;
      v16 = v7;
      v11 = v7;
      objc_msgSend(WeakRetained, "removeExpressPassWithUniqueIdentifier:visibleViewController:completion:", v6, v9, v15);

LABEL_6:
      return;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__PKExpressPassController__disableExpressModeForPassWithUniqueIdentifier_withCompletion___block_invoke_3;
    v13[3] = &unk_1E2ACAD80;
    v10 = &v14;
    v14 = v7;
    v12 = v7;
    objc_msgSend(WeakRetained, "removeExpressPassWithUniqueIdentifier:completion:", v6, v13);
    goto LABEL_6;
  }
  __break(1u);
}

void __89__PKExpressPassController__disableExpressModeForPassWithUniqueIdentifier_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v8 = v5;
    if ((a2 & 1) != 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __89__PKExpressPassController__disableExpressModeForPassWithUniqueIdentifier_withCompletion___block_invoke_2;
      v9[3] = &unk_1E2AD6F58;
      v9[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "pk_setBySafelyApplyingBlock:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    }
    v5 = v8;
  }

}

PKExpressPassConfiguration *__89__PKExpressPassController__disableExpressModeForPassWithUniqueIdentifier_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  PKExpressPassConfiguration *v8;

  v2 = (id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "passUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "passWithUniqueID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureElementPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PKExpressPassConfiguration initWithPassInformation:forSecureElementPass:]([PKExpressPassConfiguration alloc], "initWithPassInformation:forSecureElementPass:", v3, v7);
  return v8;
}

uint64_t __89__PKExpressPassController__disableExpressModeForPassWithUniqueIdentifier_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)disableExpressModeForPass:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__PKExpressPassController_disableExpressModeForPass_withCompletion___block_invoke;
  v10[3] = &unk_1E2ACAB80;
  v11 = v6;
  v9 = v6;
  -[PKExpressPassController disableExpressModeForPassesWithUniqueIdentifiers:withCompletion:](self, "disableExpressModeForPassesWithUniqueIdentifiers:withCompletion:", v8, v10);

}

void __68__PKExpressPassController_disableExpressModeForPass_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "pk_setByApplyingBlock:", &__block_literal_global_57_0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __68__PKExpressPassController_disableExpressModeForPass_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passInformation");
}

- (void)disableExpressModeForPassesWithUniqueIdentifiers:(id)a3 withCompletion:(id)a4
{
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  PKAsyncUnaryOperationComposer *v22;
  _QWORD v23[4];
  id v24;
  uint8_t *v25;
  _QWORD v26[6];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  id location;
  _QWORD v39[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  v19 = WeakRetained;
  if (!self->_isForWatch)
  {
LABEL_5:
    v22 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    objc_initWeak(&location, self);
    *(_QWORD *)buf = 0;
    v33 = buf;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__59;
    v36 = __Block_byref_object_dispose__59;
    v37 = 0;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = v20;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v29;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v14);
          v26[0] = v13;
          v26[1] = 3221225472;
          v26[2] = __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke_61;
          v26[3] = &unk_1E2AC8E70;
          objc_copyWeak(&v27, &location);
          v26[4] = v15;
          v26[5] = buf;
          -[PKAsyncUnaryOperationComposer addOperation:](v22, "addOperation:", v26);
          objc_destroyWeak(&v27);
          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke_3;
    v23[3] = &unk_1E2AC5140;
    v24 = v21;
    v25 = buf;
    v17 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v22, "evaluateWithInput:completion:", v16, v23);

    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&location);

    goto LABEL_17;
  }
  v7 = WeakRetained;
  v8 = objc_loadWeakRetained(&self->_presentingViewController);

  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = objc_loadWeakRetained(&self->_presentingViewController);
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke;
      v39[3] = &unk_1E2ACAD80;
      v40 = v21;
      objc_msgSend(v7, "removeExpressPassesWithUniqueIdentifiers:visibleViewController:completion:", v20, v9, v39);

      goto LABEL_17;
    }
    goto LABEL_5;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Missing presenting view controller when removing express passes.", buf, 2u);
  }

  if (v21)
    (*((void (**)(id, _QWORD))v21 + 2))(v21, 0);
LABEL_17:

}

uint64_t __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (!a2)
      a3 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

void __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke_61(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke_2;
  v13[3] = &unk_1E2ACF8E0;
  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v15 = v7;
  v16 = v9;
  v14 = v6;
  v11 = v6;
  v12 = v7;
  objc_msgSend(WeakRetained, "_disableExpressModeForPassWithUniqueIdentifier:withCompletion:", v10, v13);

}

void __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __91__PKExpressPassController_disableExpressModeForPassesWithUniqueIdentifiers_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

- (id)enabledExpressPasses
{
  PKPaymentDataProvider **p_paymentDataProvider;
  id WeakRetained;
  char v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_paymentDataProvider = &self->_paymentDataProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  v5 = objc_opt_respondsToSelector();

  v6 = objc_loadWeakRetained((id *)p_paymentDataProvider);
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "expressPassConfigurations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_7;
  }
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    objc_msgSend(v7, "expressPassesInformation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __47__PKExpressPassController_enabledExpressPasses__block_invoke;
    v25[3] = &unk_1E2AD6F58;
    v25[4] = self;
    objc_msgSend(v10, "pk_setBySafelyApplyingBlock:", v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  v8 = 0;
LABEL_7:
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v17, "passUniqueIdentifier", (_QWORD)v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v11, "setObject:forKey:", v17, v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v14);
  }

  v19 = (void *)objc_msgSend(v11, "copy");
  return v19;
}

PKExpressPassConfiguration *__47__PKExpressPassController_enabledExpressPasses__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  PKExpressPassConfiguration *v8;

  v2 = (id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "passUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "passWithUniqueID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureElementPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PKExpressPassConfiguration initWithPassInformation:forSecureElementPass:]([PKExpressPassConfiguration alloc], "initWithPassInformation:forSecureElementPass:", v3, v7);
  return v8;
}

- (id)expressState
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[PKExpressPassController enabledExpressPasses](self, "enabledExpressPasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__PKExpressPassController_expressState__block_invoke;
  v7[3] = &unk_1E2AD6F80;
  v8 = v3;
  v4 = v3;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

void __39__PKExpressPassController_expressState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "passInformation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (BOOL)deviceUsesAutomaticAuthorization
{
  _BOOL4 v3;
  BOOL result;
  BOOL v5;
  uint64_t v7;
  char v8;

  v8 = 0;
  v7 = 0;
  v3 = +[PKSecureElement supportsExpressForAutomaticSelectionTechnologyType:byHardware:outError:](PKSecureElement, "supportsExpressForAutomaticSelectionTechnologyType:byHardware:outError:", 3, &v8, &v7);
  result = 0;
  if (v8)
    v5 = 1;
  else
    v5 = !v3;
  if (!v5 && v7 == 0)
    return !self->_isForWatch;
  return result;
}

- (id)presentingViewController
{
  return objc_loadWeakRetained(&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak(&self->_presentingViewController, a3);
}

- (int64_t)apiVersion
{
  return self->_apiVersion;
}

- (void)setApiVersion:(int64_t)a3
{
  self->_apiVersion = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_passLibraryDataProvider);
  objc_destroyWeak((id *)&self->_paymentDataProvider);
}

@end
