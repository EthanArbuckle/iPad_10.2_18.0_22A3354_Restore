@implementation PKPrecursorPassUpgradeController

- (PKPrecursorPassUpgradeController)init
{

  return 0;
}

- (PKPrecursorPassUpgradeController)initWithPass:(id)a3 webService:(id)a4
{
  id v7;
  id v8;
  PKPrecursorPassUpgradeController *v9;
  PKPrecursorPassUpgradeController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPrecursorPassUpgradeController;
  v9 = -[PKPrecursorPassUpgradeController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pass, a3);
    objc_storeStrong((id *)&v10->_webService, a4);
  }

  return v10;
}

- (void)_loadConfigurationIfNeeded
{
  NSArray *v3;
  NSArray *seids;
  NSString *v5;
  NSString *deviceClass;
  PKOSVersionRequirement *v7;
  PKOSVersionRequirement *deviceVersion;
  id v9;

  if (!self->_hasLoadedConfiguration)
  {
    self->_hasLoadedConfiguration = 1;
    -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secureElementIdentifiers");
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    seids = self->_seids;
    self->_seids = v3;

    objc_msgSend(v9, "deviceClass");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    deviceClass = self->_deviceClass;
    self->_deviceClass = v5;

    objc_msgSend(v9, "deviceVersion");
    v7 = (PKOSVersionRequirement *)objc_claimAutoreleasedReturnValue();
    deviceVersion = self->_deviceVersion;
    self->_deviceVersion = v7;

  }
}

- (NSArray)devicePrecursorRequests
{
  -[PKPrecursorPassUpgradeController _loadConfigurationIfNeeded](self, "_loadConfigurationIfNeeded");
  return (NSArray *)-[PKSecureElementPass precursorUpgradeRequestsForDeviceSEIDs:deviceClass:deviceVersion:](self->_pass, "precursorUpgradeRequestsForDeviceSEIDs:deviceClass:deviceVersion:", self->_seids, self->_deviceClass, self->_deviceVersion);
}

- (PKPassUpgradePrecursorPassRequest)devicePrimaryPrecursorRequest
{
  void *v2;
  void *v3;

  -[PKPrecursorPassUpgradeController devicePrecursorRequests](self, "devicePrecursorRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPassUpgradePrecursorPassRequest *)v3;
}

- (void)requestDescriptionFor:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a4;
  objc_msgSend(a3, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 && v7)
  {
    switch(objc_msgSend(v7, "type"))
    {
      case 1:
        -[PKPrecursorPassUpgradeController _proofingDescriptionFor:completion:](self, "_proofingDescriptionFor:completion:", v7, v8);
        break;
      case 2:
        -[PKPrecursorPassUpgradeController _carKeyDescriptionFor:completion:](self, "_carKeyDescriptionFor:completion:", v7, v8);
        break;
      case 3:
        -[PKPrecursorPassUpgradeController _genericReProvisionDescriptionFor:completion:](self, "_genericReProvisionDescriptionFor:completion:", v7, v8);
        break;
      case 4:
        -[PKPrecursorPassUpgradeController _issuerAppDescriptionFor:completion:](self, "_issuerAppDescriptionFor:completion:", v7, v8);
        break;
      default:
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v8[2](v8, 0);
  }

}

- (void)_proofingDescriptionFor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PKPrecursorPassUpgradeController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PKPrecursorPassUpgradeController__proofingDescriptionFor_completion___block_invoke;
  v10[3] = &unk_1E2ABE8F0;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPrecursorPassUpgradeController _fetchProofingStatusWithCompletion:](self, "_fetchProofingStatusWithCompletion:", v10);

}

void __71__PKPrecursorPassUpgradeController__proofingDescriptionFor_completion___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x25uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 134218242;
    v18 = a2;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "PKPrecursorPassUpgradeController: showing description for status: %lu, action: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1[5] + 8), "organizationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = 0;
  v9 = 0;
  switch(a2)
  {
    case 0:
    case 3:
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_NO_STATUS"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(*(id *)(a1[5] + 8), "identityType");
      v9 = 0;
      if (v11 <= 3)
      {
        PKLocalizedIdentityString(&off_1E2ADDA60[v11]->isa, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v12 = CFSTR("CARD_TYPE_IDENTITY_NO_STATUS_ACTION_TEXT");
      goto LABEL_21;
    case 1:
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_ACTION_REQUIRED"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_ACTION_REQUIRED_DESCRIPTION"), CFSTR("%@%@"), v6, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1[5] + 64), "learnMoreURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_ACTION_REQUIRED_ACTION_TEXT"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 4;
      if (!v10)
        goto LABEL_28;
      goto LABEL_27;
    case 2:
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_PENDING"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_PENDING_DESCRIPTION"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    case 4:
      goto LABEL_28;
    case 5:
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_AUTH_CODE"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_AUTH_CODE_DESCRIPTION"), CFSTR("%@"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("CARD_TYPE_IDENTITY_AUTH_CODE_ACTION_TEXT");
      goto LABEL_21;
    case 6:
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_RETRY_ADDING"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_RETRY_ADDING_DESCRIPTION"), CFSTR("%@"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("CARD_TYPE_IDENTITY_RETRY_ADDING_ACTION_TEXT");
      goto LABEL_13;
    case 7:
    case 9:
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_UNABLE_TO_ADD"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_UNABLE_TO_ADD_DESCRIPTION"), CFSTR("%@"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("CARD_TYPE_IDENTITY_UNABLE_TO_ADD_ACTION_TEXT");
LABEL_13:
      PKLocalizedIdentityString(&v13->isa, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      v14 = 3;
      if (!v10)
        goto LABEL_28;
      goto LABEL_27;
    case 8:
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_CANNOT_ADD"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_CANNOT_ADD_DESCRIPTION"), CFSTR("%@"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_CANNOT_ADD_ACTION_TEXT"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      v14 = 2;
      if (!v10)
        goto LABEL_28;
      goto LABEL_27;
    case 10:
      if (PKUseWLAN())
        v15 = CFSTR("CARD_TYPE_IDENTITY_WAITING_WLAN");
      else
        v15 = CFSTR("CARD_TYPE_IDENTITY_WAITING_WIFI");
      PKLocalizedIdentityString(&v15->isa, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
LABEL_26:
      v8 = 0;
      v14 = 0;
      v7 = 0;
      if (v10)
        goto LABEL_27;
      goto LABEL_28;
    case 11:
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_RETRY_AUTH_CODE"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_RETRY_AUTH_CODE_DESCRIPTION"), CFSTR("%@"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("CARD_TYPE_IDENTITY_RETRY_AUTH_CODE_ACTION_TEXT");
      goto LABEL_21;
    case 12:
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_LIVENESS_STEP_UP_TITLE"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedIdentityString(CFSTR("CARD_TYPE_IDENTITY_LIVENESS_STEP_UP_DESCRIPTION"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("CARD_TYPE_IDENTITY_LIVENESS_STEP_UP_ACTION_TEXT");
LABEL_21:
      PKLocalizedIdentityString(&v12->isa, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      v14 = 1;
      if (!v10)
        goto LABEL_28;
LABEL_27:
      v16 = -[PKPrecursorPassUpgradeRequestDescription _init]([PKPrecursorPassUpgradeRequestDescription alloc], "_init");
      objc_msgSend(v16, "setLocalizedTitle:", v10);
      objc_msgSend(v16, "setLocalizedDescription:", v9);
      objc_msgSend(v16, "setLocalizedActionText:", v8);
      objc_msgSend(v16, "setActionType:", v14);
      objc_msgSend(v16, "setActionURL:", v7);
      (*(void (**)(void))(a1[6] + 16))();

      break;
    default:
      v8 = 0;
      v9 = 0;
LABEL_28:
      (*(void (**)(void))(a1[6] + 16))();
      break;
  }

}

- (void)_carKeyDescriptionFor:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)_genericReProvisionDescriptionFor:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)_issuerAppDescriptionFor:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)_fetchProofingStatusWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  PKIdentityProofingConfiguration *currentProofingConfiguration;
  CIDVUIProofingFlowManager *v6;
  CIDVUIProofingFlowManager *identityProofingManager;
  NSObject *v8;
  CIDVUIProofingFlowManager *v9;
  _QWORD v10[5];
  void (**v11)(id, uint64_t);
  uint8_t buf[16];

  v4 = (void (**)(id, uint64_t))a3;
  currentProofingConfiguration = self->_currentProofingConfiguration;
  if (currentProofingConfiguration)
  {
    v4[2](v4, -[PKIdentityProofingConfiguration status](currentProofingConfiguration, "status"));
  }
  else
  {
    if (!self->_identityProofingManager)
    {
      v6 = (CIDVUIProofingFlowManager *)objc_msgSend(objc_alloc((Class)getCIDVUIProofingFlowManagerClass_0[0]()), "initWithDelegate:", self);
      identityProofingManager = self->_identityProofingManager;
      self->_identityProofingManager = v6;

    }
    PKLogFacilityTypeGetObject(0x25uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPrecursorPassUpgradeController: fetching proofing flow availability", buf, 2u);
    }

    v9 = self->_identityProofingManager;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __71__PKPrecursorPassUpgradeController__fetchProofingStatusWithCompletion___block_invoke;
    v10[3] = &unk_1E2ADD9A0;
    v10[4] = self;
    v11 = v4;
    -[CIDVUIProofingFlowManager proofingFlowAvailability:](v9, "proofingFlowAvailability:", v10);

  }
}

void __71__PKPrecursorPassUpgradeController__fetchProofingStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__PKPrecursorPassUpgradeController__fetchProofingStatusWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2AD8968;
  v12 = v7;
  v8 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v8;
  v13 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __71__PKPrecursorPassUpgradeController__fetchProofingStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateActiveProofingConfigureFrom:", *(_QWORD *)(a1 + 48));
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
    v3 = *(_QWORD *)(a1 + 56);
    v4 = v2;
    if (v2)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, objc_msgSend(v2, "status"));
    else
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

  }
}

- (BOOL)_updateActiveProofingConfigureFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  PKIdentityProofingConfiguration *v14;
  PKIdentityProofingConfiguration *v15;
  PKIdentityProofingConfiguration *currentProofingConfiguration;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  PKIdentityProofingConfiguration *v24;
  __int128 v26;
  PKPrecursorPassUpgradeController *v27;
  char v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKSecureElementPass issuerAdministrativeAreaCode](self->_pass, "issuerAdministrativeAreaCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = self;
  -[PKSecureElementPass issuerCountryCode](self->_pass, "issuerCountryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v7)
  {
    v9 = v7;
    v28 = 0;
    v10 = *(_QWORD *)v31;
    *(_QWORD *)&v8 = 138412290;
    v26 = v8;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v12, "state", v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v5;
        v15 = v13;
        currentProofingConfiguration = v15;
        if (v14 == v15)
        {

LABEL_12:
          objc_msgSend(v12, "country");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v6;
          v20 = v18;
          if (v19 == v20)
          {

LABEL_19:
            PKLogFacilityTypeGetObject(0x25uLL);
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v26;
              v35 = v12;
              _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "PKPrecursorPassUpgradeController: Found match: %@", buf, 0xCu);
            }

            v24 = -[PKIdentityProofingConfiguration initWithCIDVUIProofingConfiguration:]([PKIdentityProofingConfiguration alloc], "initWithCIDVUIProofingConfiguration:", v12);
            currentProofingConfiguration = v27->_currentProofingConfiguration;
            v27->_currentProofingConfiguration = v24;
            v28 = 1;
            goto LABEL_23;
          }
          v21 = v20;
          if (v6 && v20)
          {
            v22 = objc_msgSend(v19, "caseInsensitiveCompare:", v20);

            if (v22)
              continue;
            goto LABEL_19;
          }

          goto LABEL_23;
        }
        if (!v5 || !v15)
        {

          goto LABEL_23;
        }
        v17 = -[PKIdentityProofingConfiguration caseInsensitiveCompare:](v14, "caseInsensitiveCompare:", v15);

        if (!v17)
          goto LABEL_12;
LABEL_23:

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (!v9)
        goto LABEL_28;
    }
  }
  v28 = 0;
LABEL_28:

  return v28 & 1;
}

- (void)reloadPrecursorRequests
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[PKPrecursorPassUpgradeController devicePrimaryPrecursorRequest](self, "devicePrimaryPrecursorRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "type") == 1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__PKPrecursorPassUpgradeController_reloadPrecursorRequests__block_invoke;
    v6[3] = &unk_1E2AC88D0;
    v6[4] = self;
    -[PKPrecursorPassUpgradeController _fetchProofingStatusWithCompletion:](self, "_fetchProofingStatusWithCompletion:", v6);
  }

}

void __59__PKPrecursorPassUpgradeController_reloadPrecursorRequests__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(WeakRetained, "precursorPassUpgradeRequestDidChange");

}

- (void)proofingFlowManager:(id)a3 completedProofingWithError:(id)a4
{
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject(0x25uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKPrecursorPassUpgradeController: Did receive identity proofing completed", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKPrecursorPassUpgradeController_proofingFlowManager_completedProofingWithError___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __83__PKPrecursorPassUpgradeController_proofingFlowManager_completedProofingWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadPrecursorRequests");
}

- (void)proofingFlowManager:(id)a3 didChangeActiveConfigurations:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v5 = a4;
  PKLogFacilityTypeGetObject(0x25uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKPrecursorPassUpgradeController: Did receive identity proofing change", buf, 2u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__PKPrecursorPassUpgradeController_proofingFlowManager_didChangeActiveConfigurations___block_invoke;
  v8[3] = &unk_1E2ABE0D0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __86__PKPrecursorPassUpgradeController_proofingFlowManager_didChangeActiveConfigurations___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (objc_msgSend(*(id *)(a1 + 32), "_updateActiveProofingConfigureFrom:", *(_QWORD *)(a1 + 40)))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
    objc_msgSend(WeakRetained, "precursorPassUpgradeRequestDidChange");

  }
}

- (void)mockIdentityPrecursorPassUpgradeRequestDescriptions:(id)a3
{
  id v4;
  id v5;
  PKAsyncUnaryOperationComposer *v6;
  PKIdentityProofingConfiguration *v7;
  PKIdentityProofingConfiguration *currentProofingConfiguration;
  PKPassUpgradePrecursorPassProofingAction *v9;
  uint64_t v10;
  id v11;
  PKPassUpgradePrecursorPassProofingAction *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  id v52;
  _QWORD aBlock[5];
  PKPassUpgradePrecursorPassProofingAction *v54;
  id v55;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v7 = objc_alloc_init(PKIdentityProofingConfiguration);
  currentProofingConfiguration = self->_currentProofingConfiguration;
  self->_currentProofingConfiguration = v7;

  v9 = objc_alloc_init(PKPassUpgradePrecursorPassProofingAction);
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke;
  aBlock[3] = &unk_1E2ADD9F0;
  aBlock[4] = self;
  v54 = v9;
  v11 = v5;
  v55 = v11;
  v12 = v9;
  v51[0] = v10;
  v51[1] = 3221225472;
  v51[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_3;
  v51[3] = &unk_1E2ADDA18;
  v51[4] = self;
  v13 = _Block_copy(aBlock);
  v52 = v13;
  -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v51);
  v49[0] = v10;
  v49[1] = 3221225472;
  v49[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_4;
  v49[3] = &unk_1E2ADDA18;
  v49[4] = self;
  v14 = v13;
  v50 = v14;
  -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v49);
  v47[0] = v10;
  v47[1] = 3221225472;
  v47[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_5;
  v47[3] = &unk_1E2ADDA18;
  v47[4] = self;
  v15 = v14;
  v48 = v15;
  -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v47);
  v45[0] = v10;
  v45[1] = 3221225472;
  v45[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_6;
  v45[3] = &unk_1E2ADDA18;
  v45[4] = self;
  v16 = v15;
  v46 = v16;
  -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v45);
  v43[0] = v10;
  v43[1] = 3221225472;
  v43[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_7;
  v43[3] = &unk_1E2ADDA18;
  v43[4] = self;
  v17 = v16;
  v44 = v17;
  -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v43);
  v41[0] = v10;
  v41[1] = 3221225472;
  v41[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_8;
  v41[3] = &unk_1E2ADDA18;
  v41[4] = self;
  v18 = v17;
  v42 = v18;
  -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v41);
  v39[0] = v10;
  v39[1] = 3221225472;
  v39[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_9;
  v39[3] = &unk_1E2ADDA18;
  v39[4] = self;
  v19 = v18;
  v40 = v19;
  -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v39);
  v37[0] = v10;
  v37[1] = 3221225472;
  v37[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_10;
  v37[3] = &unk_1E2ADDA18;
  v37[4] = self;
  v20 = v19;
  v38 = v20;
  -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v37);
  v35[0] = v10;
  v35[1] = 3221225472;
  v35[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_11;
  v35[3] = &unk_1E2ADDA18;
  v35[4] = self;
  v21 = v20;
  v36 = v21;
  -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v35);
  v33[0] = v10;
  v33[1] = 3221225472;
  v33[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_12;
  v33[3] = &unk_1E2ADDA18;
  v33[4] = self;
  v22 = v21;
  v34 = v22;
  -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v33);
  v31[0] = v10;
  v31[1] = 3221225472;
  v31[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_13;
  v31[3] = &unk_1E2ADDA18;
  v31[4] = self;
  v32 = v22;
  v23 = v22;
  -[PKAsyncUnaryOperationComposer addOperation:](v6, "addOperation:", v31);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_14;
  v28[3] = &unk_1E2ADDA40;
  v29 = v11;
  v30 = v4;
  v25 = v11;
  v26 = v4;
  v27 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v6, "evaluateWithInput:completion:", v24, v28);

}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_2;
  v11[3] = &unk_1E2ADD9C8;
  v12 = *(id *)(a1 + 48);
  v13 = v5;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "_proofingDescriptionFor:completion:", v8, v11);

}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = a4;
  objc_msgSend(v5, "setStatus:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v8 = a4;
  objc_msgSend(v5, "setStatus:", 1);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https:apple.com"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLearnMoreURL:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = a4;
  objc_msgSend(v5, "setStatus:", 2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = a4;
  objc_msgSend(v5, "setStatus:", 3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = a4;
  objc_msgSend(v5, "setStatus:", 4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = a4;
  objc_msgSend(v5, "setStatus:", 5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = a4;
  objc_msgSend(v5, "setStatus:", 6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = a4;
  objc_msgSend(v5, "setStatus:", 7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = a4;
  objc_msgSend(v5, "setStatus:", 8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = a4;
  objc_msgSend(v5, "setStatus:", 9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = a4;
  objc_msgSend(v5, "setStatus:", 11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__PKPrecursorPassUpgradeController_mockIdentityPrecursorPassUpgradeRequestDescriptions___block_invoke_14(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (PKPrecursorPassUpgradeControllerDelegate)delegate
{
  return (PKPrecursorPassUpgradeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentProofingConfiguration, 0);
  objc_storeStrong((id *)&self->_deviceVersion, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_seids, 0);
  objc_storeStrong((id *)&self->_identityProofingManager, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
