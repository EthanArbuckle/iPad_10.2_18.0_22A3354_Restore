@implementation PKPassDetailsIdentityBioBindingSectionController

- (PKPassDetailsIdentityBioBindingSectionController)init
{

  return 0;
}

- (PKPassDetailsIdentityBioBindingSectionController)initWithPass:(id)a3 webService:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  PKPassDetailsIdentityBioBindingSectionController *v10;
  PKPassDetailsIdentityBioBindingSectionController *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKPassDetailsIdentityBioBindingSectionController;
  v10 = -[PKPaymentPassDetailSectionController init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pass, a3);
    objc_storeWeak((id *)&v11->_delegate, v9);
  }

  return v11;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  return objc_msgSend(a3, "isIdentityPass");
}

- (void)_updateSectionIdentifiersNotify:(BOOL)a3 animated:(BOOL)a4
{
  int mapped;
  int hasInvalidBioBinding;
  _BOOL4 v7;
  id WeakRetained;
  void *v10;
  id v11;

  mapped = self->_mapped;
  hasInvalidBioBinding = self->_hasInvalidBioBinding;
  self->_mapped = hasInvalidBioBinding;
  if (mapped != hasInvalidBioBinding && a3)
  {
    v7 = a4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = WeakRetained;
    if (v7)
    {
      -[PKPassDetailsIdentityBioBindingSectionController sectionIdentifiers](self, "sectionIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadSections:", v10);

    }
    else
    {
      objc_msgSend(WeakRetained, "reloadData:", 0);
    }

  }
}

- (void)loadBioBindingStateWithAnimated:(BOOL)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(void *, _QWORD);
  Class NPKIDVRemoteDeviceSessionClass;
  _QWORD v11[4];
  void (**v12)(void *, _QWORD);
  _QWORD aBlock[5];
  id v14;
  BOOL v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PKPassDetailsIdentityBioBindingSectionController_loadBioBindingStateWithAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E3E653B0;
  aBlock[4] = self;
  v15 = a3;
  v8 = v6;
  v14 = v8;
  v9 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  if (-[PKSecureElementPass passActivationState](self->_pass, "passActivationState"))
  {
    v9[2](v9, 0);
  }
  else
  {
    NPKIDVRemoteDeviceSessionClass = getNPKIDVRemoteDeviceSessionClass();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __95__PKPassDetailsIdentityBioBindingSectionController_loadBioBindingStateWithAnimated_completion___block_invoke_2;
    v11[3] = &unk_1E3E65400;
    v12 = v9;
    -[objc_class sessionForDeviceID:completion:](NPKIDVRemoteDeviceSessionClass, "sessionForDeviceID:completion:", 0, v11);

  }
}

uint64_t __95__PKPassDetailsIdentityBioBindingSectionController_loadBioBindingStateWithAnimated_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = a2;
  objc_msgSend(*(id *)(a1 + 32), "_updateSectionIdentifiersNotify:animated:", 1, *(unsigned __int8 *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __95__PKPassDetailsIdentityBioBindingSectionController_loadBioBindingStateWithAnimated_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __95__PKPassDetailsIdentityBioBindingSectionController_loadBioBindingStateWithAnimated_completion___block_invoke_10;
    v8[3] = &unk_1E3E653D8;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "fetchRemoteBiometricAuthenticationStatusForCredentialType:completion:", 1, v8);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKPassDetailsIdentityBioBindingSectionController: Failed to obtain NPK remote device session with error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __95__PKPassDetailsIdentityBioBindingSectionController_loadBioBindingStateWithAnimated_completion___block_invoke_10(uint64_t a1, int a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  _BOOL4 v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPassDetailsIdentityBioBindingSectionController: Unable to fetch remote biometric authentication status. Error: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v7)
  {
    v8 = CFSTR("No");
    if (a2)
      v8 = CFSTR("Yes");
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKPassDetailsIdentityBioBindingSectionController: Credential trust lost: %@", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)preflight:(id)a3
{
  -[PKPassDetailsIdentityBioBindingSectionController loadBioBindingStateWithAnimated:completion:](self, "loadBioBindingStateWithAnimated:completion:", 0, a3);
}

- (id)allSectionIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("BioBindingSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sectionIdentifiers
{
  void *v3;

  if (-[PKPaymentPassDetailSectionController detailViewStyle](self, "detailViewStyle") == 2
    && !-[PKPaymentPassDetailSectionController currentSegment](self, "currentSegment")
    && self->_mapped)
  {
    -[PKPassDetailsIdentityBioBindingSectionController allSectionIdentifiers](self, "allSectionIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (PKEqualObjects())
  {
    if (objc_msgSend(v8, "row"))
    {
      PKLocalizedIdentityString(CFSTR("IDENTITY_WATCH_BIO_BINDING_FAILURE_ACTION_BUTTON"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailSectionController linkCellWithText:forTableView:](self, "linkCellWithText:forTableView:", v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = -[PKSecureElementPass identityType](self->_pass, "identityType");
      if (v11 > 3)
      {
        v9 = 0;
      }
      else
      {
        PKLocalizedIdentityString(&off_1E3E65440[v11]->isa);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      PKLocalizedIdentityString(CFSTR("IDENTITY_WATCH_BIO_BINDING_FAILURE_TITLE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentPassDetailSectionController stackedInfoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "stackedInfoCellWithPrimaryText:detailText:cellStyle:forTableView:", v12, v9, 1, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  if (PKEqualObjects())
    return 2 * self->_hasInvalidBioBinding;
  else
    return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  id WeakRetained;
  id v14;
  _QWORD v15[5];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v9, 1);
  v11 = PKEqualObjects();

  if (v11 && objc_msgSend(v9, "row") == 1)
  {
    objc_msgSend(v8, "cellForRowAtIndexPath:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailSectionController showSpinner:inCell:overrideTextColor:](self, "showSpinner:inCell:overrideTextColor:", 1, v12, 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __104__PKPassDetailsIdentityBioBindingSectionController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke;
    v15[3] = &unk_1E3E61388;
    v15[4] = self;
    v16 = v12;
    v14 = v12;
    objc_msgSend(WeakRetained, "didSelectDeleteReAddForSectionController:completion:", self, v15);

  }
}

void __104__PKPassDetailsIdentityBioBindingSectionController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "linkTextColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showSpinner:inCell:overrideTextColor:", 0, v2, v3);

}

- (PKPassDetailsIdentityBioBindingSectionControllerDelegate)delegate
{
  return (PKPassDetailsIdentityBioBindingSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
