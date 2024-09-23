@implementation PKPaymentSetupAssistantCoreController

+ (id)requiredPaymentSetupFileURLs
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKRequiredPaymentSetupFileURLs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKLogFacilityTypeGetObject(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Returning file URLS for payment setup iCloud restore: %@", (uint8_t *)&v6, 0xCu);

  }
  return v2;
}

- (PKPaymentSetupAssistantCoreController)initWithSetupAssistantContext:(id)a3
{
  id v5;
  PKPaymentSetupAssistantCoreController *v6;
  PKPaymentSetupAssistantCoreController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupAssistantCoreController;
  v6 = -[PKPaymentSetupAssistantCoreController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_setupAssistantContext, a3);
    v7->_preflightState = 0;
  }

  return v7;
}

- (void)_extendedSetupAssistantNeedsToRunWithCompletion:(id)a3
{
  void (**v4)(id, _BOOL8);
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  id v8;
  void (**v9)(id, _BOOL8);
  void (**v10)(_QWORD);
  _QWORD v11[4];
  void (**v12)(_QWORD);
  void (**v13)(id, _BOOL8);
  uint64_t *v14;
  uint64_t v15;
  _QWORD aBlock[4];
  id v17;
  void (**v18)(id, _BOOL8);
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v4 = (void (**)(id, _BOOL8))a3;
  v25 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v24 = -[PKPaymentSetupAssistantCoreController _setupAssistantNeedsToRunReturningRequirements:](self, "_setupAssistantNeedsToRunReturningRequirements:", &v25);
  if (!*((_BYTE *)v22 + 24))
  {
    v5 = 0;
    goto LABEL_10;
  }
  if ((v25 & 1) == 0)
  {
    v5 = 1;
LABEL_10:
    v4[2](v4, v5);
    goto LABEL_11;
  }
  if (-[PKPaymentSetupAssistantContextProtocol setupAssistant](self->_setupAssistantContext, "setupAssistant") != 1)
  {
    v5 = *((_BYTE *)v22 + 24) != 0;
    goto LABEL_10;
  }
  -[PKPaymentSetupAssistantCoreController _defaultWebService](self, "_defaultWebService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPaymentSetupAssistantCoreController__extendedSetupAssistantNeedsToRunWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2AD8C38;
  v19 = &v21;
  v8 = v6;
  v17 = v8;
  v9 = v4;
  v18 = v9;
  v20 = v25;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (PKNetworkConnectivityAvailable() && objc_msgSend(v8, "needsConfiguration"))
  {
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __89__PKPaymentSetupAssistantCoreController__extendedSetupAssistantNeedsToRunWithCompletion___block_invoke_32;
    v11[3] = &unk_1E2AD8C60;
    v12 = v10;
    v13 = v9;
    v14 = &v21;
    v15 = v25;
    objc_msgSend(v8, "configurePaymentServiceWithCompletion:", v11);

  }
  else
  {
    v10[2](v10);
  }

LABEL_11:
  _Block_object_dispose(&v21, 8);

}

uint64_t __89__PKPaymentSetupAssistantCoreController__extendedSetupAssistantNeedsToRunWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "paymentSetupSupportedInRegion") == 1;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    PKLogFacilityTypeGetObject(0x28uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentSetupAssistantCoreController: performed extended needsToRun check and decided not to run", v4, 2u);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __89__PKPaymentSetupAssistantCoreController__extendedSetupAssistantNeedsToRunWithCompletion___block_invoke_32(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a2 != 1 || a3)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), a1[7]);
  else
    return (*(uint64_t (**)(void))(a1[4] + 16))();
}

- (BOOL)_setupAssistantNeedsToRunReturningRequirements:(unint64_t *)a3
{
  NSObject *v6;
  void *v7;
  PKPaymentSetupAssistantContextProtocol *setupAssistantContext;
  uint64_t v9;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  PKPaymentSetupAssistantContextProtocol *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x28uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    setupAssistantContext = self->_setupAssistantContext;
    v12 = 138543618;
    v13 = (uint64_t)v7;
    v14 = 2112;
    v15 = setupAssistantContext;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ with context: %@", (uint8_t *)&v12, 0x16u);

  }
  v9 = -[PKPaymentSetupAssistantContextProtocol setupAssistant](self->_setupAssistantContext, "setupAssistant");
  if (v9 == 2)
    return -[PKPaymentSetupAssistantCoreController _bridgeNeedsToRun:](self, "_bridgeNeedsToRun:", a3);
  if (v9 == 1)
    return -[PKPaymentSetupAssistantCoreController _phoneNeedsToRun:](self, "_phoneNeedsToRun:", a3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[PKPaymentSetupAssistantContextProtocol setupAssistant](self->_setupAssistantContext, "setupAssistant");
    v12 = 134217984;
    v13 = v11;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Error: _setupAssistantNeedsToRunReturningRequirements called with unsupported type %lu. File a radar!", (uint8_t *)&v12, 0xCu);
  }

  return 0;
}

- (BOOL)_phoneNeedsToRun:(unint64_t *)a3
{
  PKSetupAssistantRequirementsChecker *v5;
  void *v6;
  PKSetupAssistantRequirementsChecker *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = [PKSetupAssistantRequirementsChecker alloc];
  +[PKPaymentWebServiceTargetDevice localTargetDevice](PKPaymentWebServiceTargetDevice, "localTargetDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKSetupAssistantRequirementsChecker initWithTargetDevice:](v5, "initWithTargetDevice:", v6);

  -[PKSetupAssistantRequirementsChecker checkPhoneRequirementsWithContext:](v7, "checkPhoneRequirementsWithContext:", self->_setupAssistantContext);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a3)
    *a3 = objc_msgSend(v8, "missingRequirements");
  PKLogFacilityTypeGetObject(0x28uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v9;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Does Phone Apple Pay Buddy Need to Run?: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  v11 = objc_msgSend(v9, "shouldRun");
  return v11;
}

- (BOOL)_bridgeNeedsToRun:(unint64_t *)a3
{
  PKPaymentSetupAssistantContextProtocol *v6;
  void *v7;
  __CFString *v8;
  BOOL v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v27;
  __CFString *v28;
  const char *v29;
  const __CFString *v31;
  void *v32;
  __int16 v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (-[PKPaymentSetupAssistantContextProtocol conformsToProtocol:](self->_setupAssistantContext, "conformsToProtocol:", &unk_1EE296BC8))
  {
    v6 = self->_setupAssistantContext;
    -[PKPaymentSetupAssistantContextProtocol parentFamilyMember](v6, "parentFamilyMember");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupAssistantContextProtocol pairingFamilyMember](v6, "pairingFamilyMember");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (!v9)
    {
      objc_msgSend((Class)getNPKCompanionAgentConnectionClass_4[0](), "watchPeerPaymentWebService");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPeerPaymentWebService sharedService](PKPeerPaymentWebService, "sharedService");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v19;
      objc_msgSend(v19, "targetDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "account");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "targetDevice");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "account");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      PKLogFacilityTypeGetObject(0xBuLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v35 = v8;
        v36 = 2112;
        v37 = v7;
        v38 = 2112;
        v39 = v22;
        v40 = 2112;
        v41 = v24;
        _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Checking if bridge setup assistant needs to run for pairing member %@, parent member %@, and pairingPeerPaymentAccount %@, parentFamilyMember %@", buf, 0x2Au);
      }

      v33 = 0;
      -[PKPaymentSetupAssistantCoreController _shouldRunAppleCashFlow:shouldRunPaymentSetupFlow:pairingFamilyMember:pairingPeerPaymentAccount:parentFamilyMember:parentPeerPaymentAccount:](self, "_shouldRunAppleCashFlow:shouldRunPaymentSetupFlow:pairingFamilyMember:pairingPeerPaymentAccount:parentFamilyMember:parentPeerPaymentAccount:", &v33, (char *)&v33 + 1, v8, v22, v7, v24);
      if (a3)
        *a3 = 0;
      v18 = (_BYTE)v33 != 0;
      if ((_BYTE)v33)
      {
        PKLogFacilityTypeGetObject(0x28uLL);
        v27 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
LABEL_29:

          return v18;
        }
        NSStringFromSelector(a2);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v28;
        v29 = "%{public}@ returning YES for Apple Cash setup";
LABEL_28:
        _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);

        goto LABEL_29;
      }
      if (!HIBYTE(v33))
      {
        PKLogFacilityTypeGetObject(0x28uLL);
        v27 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          goto LABEL_29;
        NSStringFromSelector(a2);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v28;
        v29 = "%{public}@ returning NO due to bad configuration";
        goto LABEL_28;
      }

    }
  }
  if (!PKDaemonIsAvailable()
    || (PKStoreDemoModeEnabled() & 1) != 0
    || !objc_msgSend((Class)getNPKCompanionAgentConnectionClass_4[0](), "isSetupAssistantProvisioningSupported"))
  {
    v16 = 0;
    v18 = 0;
    if (!a3)
      return v18;
LABEL_20:
    *a3 = v16;
    return v18;
  }
  +[PKPaymentWebServiceTargetDevice localTargetDevice](PKPaymentWebServiceTargetDevice, "localTargetDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appleAccountInformation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "aidaAccountAvailable");
  objc_msgSend(v11, "aaAlternateDSID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = PKIsBeneficiaryAccountWithAltDsid(v13);

  if (v14)
  {
    PKLogFacilityTypeGetObject(0x28uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "AppleIDAuth account is beneficiary account", buf, 2u);
    }

  }
  v16 = v12 ^ 1u;
  if ((objc_msgSend(v11, "isManagedAppleAccount") & 1) != 0)
  {
    PKLogFacilityTypeGetObject(0x28uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "AppleIDAuth account is managed", buf, 2u);
    }

    v18 = 0;
  }
  else
  {
    v18 = v14 ^ 1;
    PKLogFacilityTypeGetObject(0x28uLL);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v31 = CFSTR("NO");
    if (v12)
      v31 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    v35 = v31;
    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "AppleIDAuth account for primary Apple Account: %{public}@", buf, 0xCu);
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v35 = (const __CFString *)(v12 ^ 1u);
    _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Does Bridge Apple Pay Buddy Need to Run?: YES (Requirements mask %li)", buf, 0xCu);
  }

  if (a3)
    goto LABEL_20;
  return v18;
}

- (BOOL)_macNeedsToRun:(unint64_t *)a3
{
  void *v5;
  PKSetupAssistantRequirementsChecker *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[PKPaymentWebServiceTargetDevice localTargetDevice](PKPaymentWebServiceTargetDevice, "localTargetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKSetupAssistantRequirementsChecker initWithTargetDevice:]([PKSetupAssistantRequirementsChecker alloc], "initWithTargetDevice:", v5);
  -[PKSetupAssistantRequirementsChecker checkMacRequirementsWithContext:](v6, "checkMacRequirementsWithContext:", self->_setupAssistantContext);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3)
    *a3 = objc_msgSend(v7, "missingRequirements");
  PKLogFacilityTypeGetObject(0x28uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v8;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Does Mac Apple Pay Buddy Need to Run?: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  v10 = objc_msgSend(v8, "shouldRun");
  return v10;
}

- (void)_preflightPaymentSetupProvisioningController:(id)a3 completion:(id)a4
{
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  int64_t v17;
  dispatch_time_t v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  PKPaymentSetupAssistantContextProtocol *setupAssistantContext;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  PKPaymentSetupAssistantCoreController *v46;
  id v47;
  id v48;
  id v49[2];
  char v50;
  _QWORD handler[4];
  id v52;
  id v53;
  _BYTE *v54;
  _QWORD aBlock[4];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _BYTE *v61;
  _QWORD *v62;
  id v63[2];
  id location;
  _QWORD v65[3];
  char v66;
  uint8_t buf[4];
  id v68;
  __int16 v69;
  PKPaymentSetupAssistantContextProtocol *v70;
  __int16 v71;
  void *v72;
  _BYTE v73[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  dispatch_source_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
    {
      objc_msgSend(v8, "webService");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v12;
      if (v12)
      {
        objc_msgSend(v12, "targetDevice");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[PKPaymentSetupAssistantContextProtocol setupAssistant](self->_setupAssistantContext, "setupAssistant") != 2
          && (objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v42, "currentPassbookState") & 2) != 0)
        {
          PKLogFacilityTypeGetObject(0x28uLL);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v73 = 138412290;
            *(_QWORD *)&v73[4] = v11;
            _os_log_impl(&dword_18FC92000, v38, OS_LOG_TYPE_DEFAULT, "%@ Preflight Error: Wallet deleted from device, we should not be presented during Buddy", v73, 0xCu);
          }

          (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
        }
        else
        {
          objc_storeStrong((id *)&self->_provisioningController, a3);
          self->_preflightState = 0;
          v65[0] = 0;
          v65[1] = v65;
          v65[2] = 0x2020000000;
          v66 = 0;
          v13 = MEMORY[0x1E0C80D38];
          v14 = MEMORY[0x1E0C80D38];
          *(_QWORD *)v73 = 0;
          *(_QWORD *)&v73[8] = v73;
          *(_QWORD *)&v73[16] = 0x3032000000;
          v74 = __Block_byref_object_copy__70;
          v75 = __Block_byref_object_dispose__70;
          v76 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v13);
          v15 = -[PKPaymentSetupAssistantContextProtocol setupAssistant](self->_setupAssistantContext, "setupAssistant");
          v16 = *(NSObject **)(*(_QWORD *)&v73[8] + 40);
          if (v15 == 2)
            v17 = 80000000000;
          else
            v17 = 59000000000;
          v18 = dispatch_time(0, v17);
          dispatch_source_set_timer(v16, v18, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
          objc_initWeak(&location, self);
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke;
          aBlock[3] = &unk_1E2AD8C88;
          objc_copyWeak(v63, &location);
          v19 = v11;
          v56 = v19;
          v63[1] = (id)a2;
          v61 = v73;
          v62 = v65;
          v60 = v9;
          v20 = v43;
          v57 = v20;
          v58 = v42;
          v41 = v8;
          v59 = v41;
          v21 = _Block_copy(aBlock);
          v22 = *(NSObject **)(*(_QWORD *)&v73[8] + 40);
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke_115;
          handler[3] = &unk_1E2AD8CB0;
          v23 = v19;
          v52 = v23;
          v54 = v73;
          v24 = v21;
          v53 = v24;
          dispatch_source_set_event_handler(v22, handler);
          dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)&v73[8] + 40));
          objc_msgSend(v20, "supportedRegionFeatureOfType:didFailOSVersionRequirements:", 14, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0;
          objc_msgSend(v25, "createProductsRequestWithIsFetchBlocked:", &v50);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26 && !v50)
            objc_msgSend(v41, "setFetchProductsFromStaticDataSource:", 1);
          PKLogFacilityTypeGetObject(0x28uLL);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v39 = v26;
            v40 = v25;
            setupAssistantContext = self->_setupAssistantContext;
            NSStringFromSelector(a2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v68 = v23;
            v69 = 2112;
            v70 = setupAssistantContext;
            v71 = 2112;
            v72 = v29;
            _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, "%@ Start controller preflight with context %@. %@", buf, 0x20u);

            v26 = v39;
            v25 = v40;
          }

          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke_116;
          v44[3] = &unk_1E2AD8D00;
          objc_copyWeak(v49, &location);
          v30 = v23;
          v49[1] = (id)a2;
          v45 = v30;
          v46 = self;
          v31 = v24;
          v48 = v31;
          v47 = v41;
          objc_msgSend(v47, "preflightWithRequirements:completionRequirements:completion:", 173, 173, v44);

          objc_destroyWeak(v49);
          objc_destroyWeak(v63);
          objc_destroyWeak(&location);
          _Block_object_dispose(v73, 8);

          _Block_object_dispose(v65, 8);
        }

      }
      else
      {
        PKLogFacilityTypeGetObject(0x28uLL);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v73 = 138412546;
          *(_QWORD *)&v73[4] = v11;
          *(_WORD *)&v73[12] = 2112;
          *(_QWORD *)&v73[14] = v37;
          _os_log_impl(&dword_18FC92000, v36, OS_LOG_TYPE_DEFAULT, "%@ Preflight Error: No webservice for Buddy provisioning preflight in %@", v73, 0x16u);

        }
        (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
      }

    }
    else
    {
      PKLogFacilityTypeGetObject(0x28uLL);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v73 = 138412546;
        *(_QWORD *)&v73[4] = v11;
        *(_WORD *)&v73[12] = 2112;
        *(_QWORD *)&v73[14] = v35;
        _os_log_impl(&dword_18FC92000, v34, OS_LOG_TYPE_DEFAULT, "%@ Preflight Error: No controller for Buddy provisioning preflight in %@", v73, 0x16u);

      }
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0x28uLL);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v73 = 138412546;
      *(_QWORD *)&v73[4] = v11;
      *(_WORD *)&v73[12] = 2112;
      *(_QWORD *)&v73[14] = v33;
      _os_log_impl(&dword_18FC92000, v32, OS_LOG_TYPE_DEFAULT, "%@ Preflight Error: No completion for Buddy provisioning preflight in %@", v73, 0x16u);

    }
  }

}

void __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke(uint64_t a1, char a2)
{
  _QWORD *WeakRetained;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void (*v33)(void);
  uint64_t v34;
  _BYTE v35[22];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (!WeakRetained)
  {
    PKLogFacilityTypeGetObject(0x28uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v35 = 138412546;
      *(_QWORD *)&v35[4] = v6;
      *(_WORD *)&v35[12] = 2112;
      *(_QWORD *)&v35[14] = v7;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "%@ Preflight completion should be safe to finish, but unable to store preflight state as self no longer exists. %@", v35, 0x16u);

    }
  }
  v8 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v8)
  {
    dispatch_source_cancel(v8);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  if (*(_BYTE *)(v11 + 24))
  {
    PKLogFacilityTypeGetObject(0x28uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v35 = 138412546;
      *(_QWORD *)&v35[4] = v13;
      *(_WORD *)&v35[12] = 2112;
      *(_QWORD *)&v35[14] = v14;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "%@ Preflight already being handled. Bailing out. %@", v35, 0x16u);

    }
    goto LABEL_43;
  }
  *(_BYTE *)(v11 + 24) = 1;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "context");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "deviceRegion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject configuration](v12, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "buddyProvisioningEnabledForRegion:", v15) & 1) == 0)
    {
      PKLogFacilityTypeGetObject(0x28uLL);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v35 = 138412546;
        *(_QWORD *)&v35[4] = v24;
        *(_WORD *)&v35[12] = 2112;
        *(_QWORD *)&v35[14] = v15;
        v25 = "%@ Preflight. Buddy provisioning disabled for region: %@";
LABEL_40:
        _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, v25, v35, 0x16u);
      }
LABEL_41:

      v33 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_42:
      v33();

LABEL_43:
      goto LABEL_44;
    }
    if (!objc_msgSend(v16, "buddyManualProvisioningEnabledForRegion:", v15))
    {
LABEL_31:
      objc_msgSend(*(id *)(a1 + 56), "associatedCredentials", *(_OWORD *)v35);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

      if (v30)
      {
        if (WeakRetained)
        {
          v27 = 2;
          goto LABEL_34;
        }
        goto LABEL_35;
      }
      PKLogFacilityTypeGetObject(0x28uLL);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v34 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v35 = 138412546;
        *(_QWORD *)&v35[4] = v34;
        *(_WORD *)&v35[12] = 2112;
        *(_QWORD *)&v35[14] = v15;
        v25 = "%@ Preflight. Manual provisioning disabled for region: %@, and 0 cards on file.";
        goto LABEL_40;
      }
      goto LABEL_41;
    }
    if (objc_msgSend(*(id *)(a1 + 56), "isCurrentUserUnder13") == 1)
    {
      PKLogFacilityTypeGetObject(0x28uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v35 = 138412290;
        *(_QWORD *)&v35[4] = v18;
        v19 = "%@ Preflight. Manual provisioning disabled for because user is child.";
LABEL_29:
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, v19, v35, 0xCu);
      }
    }
    else
    {
      if (!objc_msgSend(v16, "browseProvisioningBankAppsEnabledForRegion:", v15))
      {
        if (objc_msgSend(*(id *)(a1 + 40), "paymentSetupSupportedInRegion") == 1)
        {
          if (WeakRetained)
          {
            v27 = 6;
LABEL_34:
            WeakRetained[3] |= v27;
          }
LABEL_35:
          PKLogFacilityTypeGetObject(0x28uLL);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)v35 = 138412290;
            *(_QWORD *)&v35[4] = v32;
            _os_log_impl(&dword_18FC92000, v31, OS_LOG_TYPE_DEFAULT, "%@ Preflight completed successfully!", v35, 0xCu);
          }

          v33 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
          goto LABEL_42;
        }
        PKLogFacilityTypeGetObject(0x28uLL);
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          goto LABEL_30;
        v28 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v35 = 138412290;
        *(_QWORD *)&v35[4] = v28;
        v19 = "%@ Preflight. Manual provisioning disabled because region is not supported.";
        goto LABEL_29;
      }
      PKLogFacilityTypeGetObject(0x28uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v35 = 138412290;
        *(_QWORD *)&v35[4] = v26;
        v19 = "%@ Preflight. Manual provisioning disabled because region has browse banks enabled.";
        goto LABEL_29;
      }
    }
LABEL_30:

    goto LABEL_31;
  }
  PKLogFacilityTypeGetObject(0x28uLL);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 96));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v35 = 138412546;
    *(_QWORD *)&v35[4] = v21;
    *(_WORD *)&v35[12] = 2112;
    *(_QWORD *)&v35[14] = v22;
    _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "%@ Preflight did not succeed, return. %@", v35, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_44:

}

uint64_t __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke_115(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "%@ Error: Preflight timeout called", (uint8_t *)&v9, 0xCu);
  }

  -[objc_class sharedInstance](_MergedGlobals_184(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  off_1ECF21C30();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didCompleteFlow:", v5);

  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke_116(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void (*v27)(void);
  void *v28;
  char v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    *((_QWORD *)WeakRetained + 3) |= 1uLL;
    PKLogFacilityTypeGetObject(0x28uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      v10 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v36 = v9;
      v37 = 2112;
      v38 = v10;
      v39 = 2112;
      v40 = v5;
      v41 = 2112;
      v42 = v11;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%@ Controller preflighted with context %@. Error: %@. %@", buf, 0x2Au);

    }
    if (v5 || (a2 & 1) == 0)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(void **)(a1 + 32);
        NSStringFromSelector(*(SEL *)(a1 + 72));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v36 = v25;
        v37 = 2112;
        v38 = v26;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%@ Preflight failed, return. %@", buf, 0x16u);

      }
      v27 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
      goto LABEL_23;
    }
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setupAssistant");
    if (v12 == 2)
    {
      objc_msgSend(*(id *)(a1 + 48), "associatedCredentials");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "count"))
      {

      }
      else
      {
        v29 = objc_msgSend(*(id *)(a1 + 48), "isProvisioningForAltAccount");

        if ((v29 & 1) == 0)
        {
          objc_msgSend(v7, "_bridgeContextDefaultLocalCredential");
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
          v14 = (void *)v13;
          if (v13)
          {
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v14, "longDescription");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = *(void **)(a1 + 32);
              NSStringFromSelector(*(SEL *)(a1 + 72));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v36 = v15;
              v37 = 2112;
              v38 = v16;
              v39 = 2112;
              v40 = v17;
              _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%@ Preflight, associating credentials %@. %@", buf, 0x20u);

            }
            v18 = *(void **)(a1 + 48);
            v34 = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke_118;
            v30[3] = &unk_1E2AD8CD8;
            v20 = *(id *)(a1 + 32);
            v21 = *(_QWORD *)(a1 + 72);
            v31 = v20;
            v33 = v21;
            v32 = *(id *)(a1 + 56);
            objc_msgSend(v18, "associateCredentials:withCompletionHandler:", v19, v30);

            goto LABEL_24;
          }
        }
      }
    }
    else if (v12 == 1)
    {
      objc_msgSend(v7, "_peerPaymentCredential");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v27 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_23:
    v27();
    goto LABEL_24;
  }
  PKLogFacilityTypeGetObject(0x28uLL);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = *(void **)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v36 = v23;
    v37 = 2112;
    v38 = v24;
    _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "%@ Preflight failed with unexpected error, return. %@", buf, 0x16u);

  }
LABEL_24:

}

void __97__PKPaymentSetupAssistantCoreController__preflightPaymentSetupProvisioningController_completion___block_invoke_118(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject(0x28uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138413058;
    v10 = v7;
    v11 = 1024;
    v12 = a2;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "%@ Preflight, associated credentials. success: %d, displayableError: %@. %@", (uint8_t *)&v9, 0x26u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_bridgeContextDefaultLocalCredential
{
  PKPaymentService *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  PKPaymentLocalPassCredential *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t buf[16];

  v2 = objc_alloc_init(PKPaymentService);
  -[PKPaymentService defaultPaymentPassUniqueIdentifier](v2, "defaultPaymentPassUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject peerPaymentPassUniqueID](v4, "peerPaymentPassUniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    v7 = v5;
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      if (!v7)
      {

        goto LABEL_13;
      }
      v9 = objc_msgSend(v6, "isEqualToString:", v7);

      if (!v9)
      {
LABEL_13:
        -[NSObject passWithUniqueID:](v4, "passWithUniqueID:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "paymentPass");
        v11 = objc_claimAutoreleasedReturnValue();

        if (v11
          && -[NSObject supportsSerialNumberBasedProvisioning](v11, "supportsSerialNumberBasedProvisioning")&& (-[NSObject requiresTransferSerialNumberBasedProvisioning](v11, "requiresTransferSerialNumberBasedProvisioning") & 1) == 0)
        {
          v10 = -[PKPaymentLocalPassCredential initWithPaymentPass:]([PKPaymentLocalPassCredential alloc], "initWithPaymentPass:", v11);
          goto LABEL_20;
        }
        PKLogFacilityTypeGetObject(0x28uLL);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "No valid default pass for Bridge", v15, 2u);
        }

LABEL_19:
        v10 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    PKLogFacilityTypeGetObject(0x28uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Default phone pass is Apple Cash, do not offer it", v16, 2u);
    }
    goto LABEL_19;
  }
  PKLogFacilityTypeGetObject(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "No default pass from the phone to offer Bridge for setup", buf, 2u);
  }
  v10 = 0;
LABEL_21:

  return v10;
}

- (unint64_t)_specialCaseSEPassCountInPassLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "passesOfType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v3;
  objc_msgSend(v3, "peerPaymentPassUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v8 = v7;
    v19 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v12, "isHomeKeyPass"))
        {
          PKLogFacilityTypeGetObject(0x28uLL);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Home Key card is present but ignoring as it is always automatically ingested.", buf, 2u);
          }
LABEL_9:

          ++v9;
          continue;
        }
        if (objc_msgSend(v12, "hasAssociatedPeerPaymentAccount"))
        {
          objc_msgSend(v12, "uniqueID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v5);

          if (v15)
          {
            if (objc_msgSend(v12, "passActivationState") == 4)
            {
              PKLogFacilityTypeGetObject(0x28uLL);
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Apple Cash card is present but ignoring as it has been automatically ingested.", buf, 2u);
              }
              v19 = 1;
              goto LABEL_9;
            }
            v19 = 1;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (!v8)
        goto LABEL_21;
    }
  }
  v19 = 0;
  v9 = 0;
LABEL_21:

  if (v5 && (v19 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0x28uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Peer payment passID %@ found but no pass found in library", buf, 0xCu);
    }

  }
  return v9;
}

- (id)_peerPaymentCredential
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  PKPeerPaymentCredential *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[PKPeerPaymentWebService sharedService](PKPeerPaymentWebService, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "state");
  v6 = objc_msgSend(v4, "stage");
  if (v5 != 1 || (v6 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v8 = v6;
    PKLogFacilityTypeGetObject(0xBuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      PKPeerPaymentAccountStateToString(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKPeerPaymentAccountStageToString(v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Could not return peer payment credential because account state was: %{public}@ stage was: %{public}@", (uint8_t *)&v14, 0x16u);

    }
LABEL_10:

    v12 = 0;
    goto LABEL_11;
  }
  v12 = -[PKPeerPaymentCredential initWithPeerPaymentAccount:]([PKPeerPaymentCredential alloc], "initWithPeerPaymentAccount:", v4);
  if (!v12)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Could not generate peer payment credential", (uint8_t *)&v14, 2u);
    }
    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

- (id)_provisioningContextWithProvisioningController:(id)a3 setupAssistantCredentials:(id)a4 maximumSelectable:(unint64_t)a5
{
  id v7;
  id v8;
  PKPaymentSetupAssistantCoreProvisioningContext *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[PKPaymentSetupAssistantCoreProvisioningContext initWithProvisioningController:setupAssistantCredentials:maximumSelectable:]([PKPaymentSetupAssistantCoreProvisioningContext alloc], "initWithProvisioningController:setupAssistantCredentials:maximumSelectable:", v8, v7, a5);

  return v9;
}

- (id)_setupAssistantCredentialForPaymentCredential:(id)a3
{
  id v3;
  PKPaymentSetupAssistantCoreCredential *v4;

  v3 = a3;
  v4 = -[PKPaymentSetupAssistantCoreCredential initWithPaymentCredential:]([PKPaymentSetupAssistantCoreCredential alloc], "initWithPaymentCredential:", v3);

  return v4;
}

- (id)_setupAssistantCredentialForPaymentPass:(id)a3
{
  id v3;
  PKPaymentSetupAssistantCoreCredential *v4;

  v3 = a3;
  v4 = -[PKPaymentSetupAssistantCoreCredential initWithPaymentPass:]([PKPaymentSetupAssistantCoreCredential alloc], "initWithPaymentPass:", v3);

  return v4;
}

- (id)_defaultWebService
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[PKPaymentSetupAssistantContextProtocol setupAssistant](self->_setupAssistantContext, "setupAssistant");
  if (v3 == 2)
  {
    objc_msgSend((Class)getNPKCompanionAgentConnectionClass_4[0](), "watchPaymentWebService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 1)
  {
    +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKLogFacilityTypeGetObject(0x28uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[PKPaymentSetupAssistantContextProtocol setupAssistant](self->_setupAssistantContext, "setupAssistant");
      v8 = 134217984;
      v9 = v6;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Error: _defaultWebService called with unsupported type %lu. File a radar!", (uint8_t *)&v8, 0xCu);
    }

    v4 = 0;
  }
  return v4;
}

- (id)_provisioningControllerWithWebService:(id)a3
{
  id v4;
  PKPaymentProvisioningController *v5;
  void *v6;

  v4 = a3;
  v5 = -[PKPaymentProvisioningController initWithWebService:]([PKPaymentProvisioningController alloc], "initWithWebService:", v4);

  -[PKPaymentSetupAssistantContextProtocol externalizedContext](self->_setupAssistantContext, "externalizedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentProvisioningController storeExternalizedAuth:](v5, "storeExternalizedAuth:", v6);

  return v5;
}

- (void)_shouldRunAppleCashFlow:(BOOL *)a3 shouldRunPaymentSetupFlow:(BOOL *)a4 pairingFamilyMember:(id)a5 pairingPeerPaymentAccount:(id)a6 parentFamilyMember:(id)a7 parentPeerPaymentAccount:(id)a8
{
  id v13;
  id v14;
  id v15;
  char v16;
  char v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  uint8_t v26[16];

  v13 = a5;
  v14 = a7;
  v15 = a8;
  if (PKDaemonIsAvailable())
    v16 = PKStoreDemoModeEnabled() ^ 1;
  else
    v16 = 0;
  if (objc_msgSend(v14, "isMe"))
    v17 = objc_msgSend(v14, "isOrganizer");
  else
    v17 = 0;
  objc_msgSend(v13, "altDSID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || !v14)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Cannot run add associated account in companion setup without parent and pairing family member", v26, 2u);
    }
    v16 = 0;
LABEL_42:

    v25 = 0;
    if (!a3)
      goto LABEL_44;
    goto LABEL_43;
  }
  if ((v17 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      v20 = "Cannot run add associated account in companion setup without parent being the organizer";
      goto LABEL_34;
    }
LABEL_35:

    v16 = 0;
    goto LABEL_36;
  }
  if (!v15)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      v20 = "Cannot run add associated account in companion setup because the parent doesnt have a peer payment account";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (a6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      v20 = "Cannot run add associated account in companion setup when an account is already defined";
LABEL_34:
      _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, v20, v26, 2u);
      goto LABEL_35;
    }
    goto LABEL_35;
  }
  objc_msgSend(v15, "peerPaymentAccountWithAltDSID:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      v20 = "Cannot run add associated account in companion since there is already and associated account for the pairing"
            " member on the parent members account.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  objc_msgSend(v15, "accountInvitationWithAltDSID:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "status");

  if (v24 == 1)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      v20 = "Cannot run add associated account in companion since there is already a pending invitation for the pairing m"
            "ember on the parent members account.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (!objc_msgSend(v13, "memberType") || objc_msgSend(v13, "memberType") == -1)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      v20 = "Cannot run add associated account in companion setup when the pairing member is an adult.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if ((objc_msgSend(v15, "supportsFamilySharing") & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      v20 = "Cannot run add associated account in companion setup because family sharing feature is not supported.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
LABEL_36:
  if (objc_msgSend(v14, "memberType", *(_QWORD *)v26) || (objc_msgSend(v14, "isParent") & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0x28uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Cannot run regular payment setup flow as family member is not parent/adult.", v26, 2u);
    }
    goto LABEL_42;
  }
  v25 = 1;
  if (a3)
LABEL_43:
    *a3 = v16;
LABEL_44:
  if (a4)
    *a4 = v25;

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; setupAssistantContext: '%@';>"),
               objc_opt_class(),
               self,
               self->_setupAssistantContext);
}

- (BOOL)_hasManuallyAddedSecureElementPasses:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t (**v4)(_QWORD);
  char v5;
  _QWORD v7[4];
  id v8;
  _QWORD aBlock[5];

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PKPaymentSetupAssistantCoreController__hasManuallyAddedSecureElementPasses___block_invoke;
  aBlock[3] = &unk_1E2AD8D28;
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__PKPaymentSetupAssistantCoreController__hasManuallyAddedSecureElementPasses___block_invoke_132;
  v7[3] = &unk_1E2ABD9A0;
  v4 = _Block_copy(aBlock);
  v8 = v4;
  if (qword_1EE1DB6E8 != -1)
  {
    dispatch_once(&qword_1EE1DB6E8, v7);
    if (v3)
      goto LABEL_3;
LABEL_5:
    v5 = _MergedGlobals_5 != 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = v4[2](v4);
LABEL_6:

  return v5;
}

uint64_t __78__PKPaymentSetupAssistantCoreController__hasManuallyAddedSecureElementPasses___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v7[16];

  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countPassesOfType:", 1);
  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  if (v3 <= objc_msgSend(*(id *)(a1 + 32), "_specialCaseSEPassCountInPassLibrary:", v2))
  {
    PKLogFacilityTypeGetObject(0x28uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Only special case passes are present, ignoring pass count so Apple pay setup will be offered.", v7, 2u);
    }

    goto LABEL_7;
  }
  v4 = 1;
LABEL_8:

  return v4;
}

uint64_t __78__PKPaymentSetupAssistantCoreController__hasManuallyAddedSecureElementPasses___block_invoke_132(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _MergedGlobals_5 = result;
  return result;
}

- (void)_expressSetupProvisioningContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__PKPaymentSetupAssistantCoreController__expressSetupProvisioningContext___block_invoke;
    v7[3] = &unk_1E2AD8DC0;
    v7[4] = self;
    v8 = v4;
    -[PKPaymentSetupAssistantCoreController _extendedSetupAssistantNeedsToRunWithCompletion:](self, "_extendedSetupAssistantNeedsToRunWithCompletion:", v7);

  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[PKPaymentSetupAssistantCoreController _expressSetupProvisioningContext:]";
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "%s Error: No completion provided", buf, 0xCu);
    }

  }
}

void __74__PKPaymentSetupAssistantCoreController__expressSetupProvisioningContext___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12[2];
  id location;

  if (a3 || !a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_defaultWebService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_provisioningControllerWithWebService:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, *(id *)(a1 + 32));
      v6 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __74__PKPaymentSetupAssistantCoreController__expressSetupProvisioningContext___block_invoke_2;
      v8[3] = &unk_1E2AD8D98;
      objc_copyWeak(v12, &location);
      v11 = *(id *)(a1 + 40);
      v12[1] = 0;
      v7 = v5;
      v9 = v7;
      v10 = v4;
      objc_msgSend(v6, "_preflightPaymentSetupProvisioningController:completion:", v7, v8);

      objc_destroyWeak(v12);
      objc_destroyWeak(&location);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

void __74__PKPaymentSetupAssistantCoreController__expressSetupProvisioningContext___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PKPaymentPrepareToProvisionRequest *v29;
  id obj;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (a2 && WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "associatedCredentials");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v14, "remoteCredential");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (!v15
            || ((v17 = objc_msgSend(v15, "status"), (unint64_t)(v17 + 1) <= 5)
              ? (v18 = ((1 << (v17 + 1)) & 0x33) == 0)
              : (v18 = 1),
                v18))
          {
            objc_msgSend(v6, "_setupAssistantCredentialForPaymentCredential:", v14);
            v19 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "safelyAddObject:", v19);
            v11 = (void *)v19;
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    if (objc_msgSend(v8, "count"))
    {
      PKLastBackedUpDefaultPaymentPassSerialNumber();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __74__PKPaymentSetupAssistantCoreController__expressSetupProvisioningContext___block_invoke_134;
      v31[3] = &unk_1E2AD8D50;
      v21 = v20;
      v32 = v21;
      objc_msgSend(v8, "sortUsingComparator:", v31);
      v5 = v6;
      if (PKDisableDynamicSEAllocation())
      {
        v22 = objc_msgSend(*(id *)(a1 + 32), "availableSecureElementPassSpaces");
        if (v22 == 0x7FFFFFFFFFFFFFFFLL)
          v22 = objc_msgSend(v8, "count");
      }
      else
      {
        v22 = 0;
      }
      v24 = *(_QWORD *)(a1 + 32);
      v25 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v6, "_provisioningContextWithProvisioningController:setupAssistantCredentials:maximumSelectable:", v24, v25, v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (PKEnableBuddyBackgroundProvisioning())
      {
        objc_msgSend(v26, "selectedCredentials");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "pk_objectsPassingTest:", &__block_literal_global_190);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = -[PKPaymentPrepareToProvisionRequest initWithCredentials:]([PKPaymentPrepareToProvisionRequest alloc], "initWithCredentials:", v28);
        objc_msgSend(*(id *)(a1 + 40), "prepareToProvisionForRequest:completion:", v29, 0);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      PKLogFacilityTypeGetObject(0x28uLL);
      v23 = objc_claimAutoreleasedReturnValue();
      v5 = v6;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = obj;
        _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "No provisionable associated credentials found in %@. Returning nil setup assistant provisioning context.", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __74__PKPaymentSetupAssistantCoreController__expressSetupProvisioningContext___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  objc_msgSend(a2, "credential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "compare:withBackedUpDefaultPaymentPassSerialNumber:", v7, *(_QWORD *)(a1 + 32));
  return v8;
}

uint64_t __74__PKPaymentSetupAssistantCoreController__expressSetupProvisioningContext___block_invoke_2_136(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsSuperEasyProvisioning") ^ 1;
}

- (void)_expressCardRemovalProvisioningContext:(id)a3
{
  void (**v5)(id, void *);
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a3;
  if (v5)
  {
    +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject passesOfType:](v6, "passesOfType:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    -[NSObject peerPaymentPassUniqueID](v6, "peerPaymentPassUniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __80__PKPaymentSetupAssistantCoreController__expressCardRemovalProvisioningContext___block_invoke;
    v26[3] = &unk_1E2AD8DE8;
    v21 = v9;
    v27 = v21;
    objc_msgSend(v7, "sortedArrayUsingComparator:", v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "paymentPass");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            -[PKPaymentSetupAssistantCoreController _setupAssistantCredentialForPaymentPass:](self, "_setupAssistantCredentialForPaymentPass:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "safelyAddObject:", v17);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v13);
    }

    v18 = (void *)objc_msgSend(v8, "copy");
    -[PKPaymentSetupAssistantCoreController _provisioningContextWithProvisioningController:setupAssistantCredentials:maximumSelectable:](self, "_provisioningContextWithProvisioningController:setupAssistantCredentials:maximumSelectable:", 0, v18, objc_msgSend(v8, "count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v5[2](v5, v19);
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v20;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "%@ Error: No completion provided", buf, 0xCu);

    }
  }

}

uint64_t __80__PKPaymentSetupAssistantCoreController__expressCardRemovalProvisioningContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_12;
  if (objc_msgSend(v5, "hasAssociatedPeerPaymentAccount"))
  {
    objc_msgSend(v5, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if ((objc_msgSend(v6, "hasAssociatedPeerPaymentAccount") & 1) == 0)
    {
LABEL_10:
      if ((v8 & 1) != 0)
      {
        v11 = -1;
        goto LABEL_13;
      }
LABEL_12:
      objc_msgSend(v5, "ingestedDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ingestedDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "compare:", v13);

      goto LABEL_13;
    }
  }
  else
  {
    if ((objc_msgSend(v6, "hasAssociatedPeerPaymentAccount") & 1) == 0)
      goto LABEL_12;
    v8 = 0;
  }
  objc_msgSend(v6, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (!v10)
    goto LABEL_10;
  if ((v8 & 1) != 0)
    goto LABEL_12;
  v11 = 1;
LABEL_13:

  return v11;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (unint64_t)preflightState
{
  return self->_preflightState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_setupAssistantContext, 0);
}

@end
