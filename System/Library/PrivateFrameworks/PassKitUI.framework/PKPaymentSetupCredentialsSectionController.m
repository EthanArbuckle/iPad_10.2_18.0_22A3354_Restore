@implementation PKPaymentSetupCredentialsSectionController

- (PKPaymentSetupCredentialsSectionController)initWithCredentials:(id)a3 provisioningController:(id)a4 context:(int64_t)a5 product:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPaymentSetupCredentialsSectionController *v13;
  PKPaymentSetupCredentialsSectionController *v14;
  id *p_provisioningController;
  uint64_t v16;
  NSString *lastBackedUpDefaultPaymentPassSerialNumber;
  void *v18;
  void *v19;
  void *v20;
  PKPassSnapshotCoordinator *v21;
  PKPassSnapshotCoordinator *snapshotCoordinator;
  uint64_t v23;
  PKProvisioningSEStorageSnapshot *storageSnapshot;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentSetupCredentialsSectionController;
  v13 = -[PKPaymentSetupListSectionController init](&v26, sel_init);
  v14 = v13;
  if (v13)
  {
    p_provisioningController = (id *)&v13->_provisioningController;
    objc_storeStrong((id *)&v13->_provisioningController, a4);
    PKLastBackedUpDefaultPaymentPassSerialNumber();
    v16 = objc_claimAutoreleasedReturnValue();
    lastBackedUpDefaultPaymentPassSerialNumber = v14->_lastBackedUpDefaultPaymentPassSerialNumber;
    v14->_lastBackedUpDefaultPaymentPassSerialNumber = (NSString *)v16;

    v14->_setupContext = a5;
    objc_storeStrong((id *)&v14->_product, a6);
    objc_msgSend(*p_provisioningController, "webService");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "targetDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "secureElementIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = -[PKPassSnapshotCoordinator initWithSEIDs:]([PKPassSnapshotCoordinator alloc], "initWithSEIDs:", v20);
    snapshotCoordinator = v14->_snapshotCoordinator;
    v14->_snapshotCoordinator = v21;

    objc_msgSend(*p_provisioningController, "storageSnapshot");
    v23 = objc_claimAutoreleasedReturnValue();
    storageSnapshot = v14->_storageSnapshot;
    v14->_storageSnapshot = (PKProvisioningSEStorageSnapshot *)v23;

    -[PKProvisioningSEStorageSnapshot reset](v14->_storageSnapshot, "reset");
    objc_msgSend(*p_provisioningController, "addDelegate:", v14);
    -[PKPaymentSetupCredentialsSectionController _loadCredentials:create:](v14, "_loadCredentials:create:", v10, 1);
    -[PKPaymentSetupCredentialsSectionController _updateMaximumSelectableCredentials](v14, "_updateMaximumSelectableCredentials");
    -[PKPaymentSetupCredentialsSectionController _primeItemSelectionAndReloadData:](v14, "_primeItemSelectionAndReloadData:", 0);

  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[PKPaymentProvisioningController removeDelegate:](self->_provisioningController, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupCredentialsSectionController;
  -[PKPaymentSetupCredentialsSectionController dealloc](&v3, sel_dealloc);
}

- (id)selectedCredentials
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  NSArray *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_sectionIdentifiers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_allCredentials, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v20 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              if (objc_msgSend(v14, "selected"))
              {
                objc_msgSend(v14, "credential");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v15);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v11);
        }

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  return v16;
}

- (BOOL)hasSelectedCredentials
{
  void *v2;
  BOOL v3;

  -[PKPaymentSetupCredentialsSectionController selectedCredentials](self, "selectedCredentials");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- ($96EE1C12479E9B303E9C2794B92A11A2)credentialSelectionState
{
  __int16 v2;
  __int16 v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__PKPaymentSetupCredentialsSectionController_credentialSelectionState__block_invoke;
  v5[3] = &unk_1E3E70420;
  v5[4] = &v10;
  v5[5] = &v6;
  -[PKPaymentSetupCredentialsSectionController _enumerateCredentials:](self, "_enumerateCredentials:", v5);
  v2 = *((unsigned __int8 *)v11 + 24);
  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return ($96EE1C12479E9B303E9C2794B92A11A2)(v2 | (v3 << 8));
}

uint64_t __70__PKPaymentSetupCredentialsSectionController_credentialSelectionState__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  char v14;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v10 + 24))
  {
    v11 = 1;
  }
  else
  {
    v11 = objc_msgSend(v8, "isAvailable");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v10 + 24) = v11;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v12 + 24))
  {
    v13 = 1;
  }
  else
  {
    v13 = objc_msgSend(v9, "selected");
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v12 + 24) = v13;
  v14 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v14)
    v14 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  *a4 = v14;

  return 0;
}

- (id)unselectedCredentialRequiringAction
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__33;
  v9 = __Block_byref_object_dispose__33;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__PKPaymentSetupCredentialsSectionController_unselectedCredentialRequiringAction__block_invoke;
  v4[3] = &unk_1E3E70448;
  v4[4] = &v5;
  -[PKPaymentSetupCredentialsSectionController _enumerateCredentials:](self, "_enumerateCredentials:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __81__PKPaymentSetupCredentialsSectionController_unselectedCredentialRequiringAction__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  objc_msgSend(v6, "credential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "selected") & 1) == 0 && objc_msgSend(v6, "isAvailable"))
  {
    objc_msgSend(v7, "accountCredential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "feature");

      if (v11 == 2)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v7);
        *a4 = 1;
      }
    }

  }
  return 0;
}

- (id)availableCredentialRequiringAction
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__33;
  v9 = __Block_byref_object_dispose__33;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__PKPaymentSetupCredentialsSectionController_availableCredentialRequiringAction__block_invoke;
  v4[3] = &unk_1E3E70448;
  v4[4] = &v5;
  -[PKPaymentSetupCredentialsSectionController _enumerateCredentials:](self, "_enumerateCredentials:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __80__PKPaymentSetupCredentialsSectionController_availableCredentialRequiringAction__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a3, "credential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountCredential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "feature");

    if (v10 == 2)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);
      *a4 = 1;
    }
  }

  return 0;
}

- (void)setCredential:(id)a3 selected:(BOOL)a4
{
  -[PKPaymentSetupCredentialsSectionController _setCredential:selected:silently:](self, "_setCredential:selected:silently:", a3, a4, 0);
}

- (void)reloadCredentialStores
{
  uint64_t (**v3)(void);
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPaymentSetupCredentialsSectionController_reloadCredentialStores__block_invoke;
  aBlock[3] = &unk_1E3E70470;
  aBlock[4] = self;
  v3 = (uint64_t (**)(void))_Block_copy(aBlock);
  v4 = v3[2]();
  -[PKPaymentSetupCredentialsSectionController _updateRemoteCredentialCache](self, "_updateRemoteCredentialCache");
  -[PKPaymentSetupCredentialsSectionController _updateMaximumSelectableCredentials](self, "_updateMaximumSelectableCredentials");
  v5 = ((uint64_t (*)(uint64_t (**)(void)))v3[2])(v3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataChangeDelegate);
  objc_msgSend(WeakRetained, "reloadAnimated:", v4 != v5);

}

uint64_t __68__PKPaymentSetupCredentialsSectionController_reloadCredentialStores__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v8, "count");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)doesContainCredentialThatRequiresAuth:(id)a3
{
  return objc_msgSend(a3, "pk_containsObjectPassingTest:", &__block_literal_global_134);
}

uint64_t __84__PKPaymentSetupCredentialsSectionController_doesContainCredentialThatRequiresAuth___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCarKeyTerminalPairingCredential") ^ 1;
}

- (void)setEditing:(BOOL)a3
{
  NSHashTable *v5;
  NSHashTable *selectedCredentialsBeforeEditing;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id WeakRetained;
  NSHashTable *v13;
  _QWORD v14[5];
  BOOL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (((!self->_isEditing ^ a3) & 1) == 0)
  {
    self->_isEditing = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "pk_hashTableUsingPointerPersonality");
      v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      selectedCredentialsBeforeEditing = self->_selectedCredentialsBeforeEditing;
      self->_selectedCredentialsBeforeEditing = v5;

      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[PKPaymentSetupCredentialsSectionController selectedCredentials](self, "selectedCredentials");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            -[NSHashTable addObject:](self->_selectedCredentialsBeforeEditing, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v9);
      }

    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__PKPaymentSetupCredentialsSectionController_setEditing___block_invoke;
    v14[3] = &unk_1E3E704D8;
    v15 = a3;
    v14[4] = self;
    -[PKPaymentSetupCredentialsSectionController _enumerateCredentials:](self, "_enumerateCredentials:", v14);
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataChangeDelegate);
    objc_msgSend(WeakRetained, "reloadAnimated:", 0);

    if (!a3)
    {
      v13 = self->_selectedCredentialsBeforeEditing;
      self->_selectedCredentialsBeforeEditing = 0;

    }
  }
}

id __57__PKPaymentSetupCredentialsSectionController_setEditing___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  if ((objc_msgSend(v4, "isRefund") & 1) != 0
    || (objc_msgSend(v4, "isUnavailable") & 1) != 0
    || (objc_msgSend(v4, "isBeingProvisioned") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7 = (void *)objc_msgSend(v4, "copy");
    v5 = v7;
    v8 = *(unsigned __int8 *)(a1 + 40);
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(v7, "setSelected:", 0);
      objc_msgSend(v5, "setUseMultiSelectAccessory:", 0);
      v9 = objc_msgSend(v4, "isDeletable") ^ 1;
    }
    else
    {
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
      objc_msgSend(v4, "credential");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "containsObject:", v11);

      objc_msgSend(v5, "setSelected:", v12);
      objc_msgSend(v5, "setUseMultiSelectAccessory:", 1);
      v9 = 0;
    }
    objc_msgSend(v5, "setDisplayInfo:", v9);
    objc_msgSend(v5, "setReserverSpaceForSelectedAccessory:", v8 == 0);
  }

  return v5;
}

- (BOOL)shouldShowEditButton
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__PKPaymentSetupCredentialsSectionController_shouldShowEditButton__block_invoke;
  v4[3] = &unk_1E3E70448;
  v4[4] = &v5;
  -[PKPaymentSetupCredentialsSectionController _enumerateCredentials:](self, "_enumerateCredentials:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __66__PKPaymentSetupCredentialsSectionController_shouldShowEditButton__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isAvailable") && objc_msgSend(v6, "isDeletable"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

  return 0;
}

- (id)identifiers
{
  return self->_sectionIdentifiers;
}

- (id)snapshotForSectionIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_allCredentials, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentSetupCredentialsSectionController;
  -[PKPaymentSetupListSectionController decoratePaymentSetListCell:forItem:](&v26, sel_decoratePaymentSetListCell_forItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    objc_msgSend(v8, "textProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumberOfLines:", 1);
    objc_msgSend(v8, "secondaryTextProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setLineBreakMode:", 4);
    objc_msgSend(v11, "setNumberOfLines:", 2);
    -[PKPaymentSetupCredentialsSectionController _cardArtForCredentialItem:](self, "_cardArtForCredentialItem:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v12);

    objc_msgSend(v8, "imageProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupCredentialsSectionController _defaultCardSize](self, "_defaultCardSize");
    v15 = v14;
    v17 = v16;
    objc_msgSend(v13, "setMaximumSize:");
    objc_msgSend(v13, "setReservedLayoutSize:", v15, v17);
    objc_msgSend(v13, "setCornerRadius:", 2.0);
    objc_msgSend(v6, "setContentConfiguration:", v8);
    if (objc_msgSend(v9, "isDeletable"))
    {
      objc_msgSend(v6, "accessories");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");

      v20 = objc_alloc_init(MEMORY[0x1E0DC3558]);
      objc_msgSend(v20, "setReservedLayoutWidth:", 50.0);
      objc_msgSend(v19, "addObject:", v20);
      objc_msgSend(v6, "setAccessories:", v19);
      if (self->_isEditing)
      {
        objc_msgSend(v9, "title");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("REMOVE_PARKED_PASS_BUTTON_ACCESSIBILITY"), CFSTR("%@"), v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v6, "setAccessibilityLabel:", v22);
    if (objc_msgSend(v9, "isCellDisabled"))
      v23 = 0.4;
    else
      v23 = 1.0;
    objc_msgSend(v6, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAlpha:", v23);

  }
  return v8;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0DC3390];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  -[PKPaymentSetupCredentialsSectionController snapshotForSectionIdentifier:](self, "snapshotForSectionIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendItems:", v8);
  return v7;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKPaymentSetupListSectionController defaultListLayout](self, "defaultListLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHeaderMode:", 1);
  objc_msgSend(v8, "setFooterMode:", 1);
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __92__PKPaymentSetupCredentialsSectionController_layoutWithLayoutEnvironment_sectionIdentifier___block_invoke;
  v14 = &unk_1E3E64EA8;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v8, "setTrailingSwipeActionsConfigurationProvider:", &v11);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v8, v6, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9;
}

id __92__PKPaymentSetupCredentialsSectionController_layoutWithLayoutEnvironment_sectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_credentialItemFromIndexPath:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isDeletable"))
  {
    v7 = (void *)MEMORY[0x1E0DC36C8];
    PKLocalizedPaymentString(CFSTR("REMOVE_PARKED_PASS_BUTTON"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __92__PKPaymentSetupCredentialsSectionController_layoutWithLayoutEnvironment_sectionIdentifier___block_invoke_2;
    v17 = &unk_1E3E70500;
    objc_copyWeak(&v19, v4);
    v18 = v6;
    objc_msgSend(v7, "contextualActionWithStyle:title:handler:", 1, v8, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC3D08];
    v20[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1, v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationWithActions:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v19);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __92__PKPaymentSetupCredentialsSectionController_layoutWithLayoutEnvironment_sectionIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_promptToDeleteItem:completion:", *(_QWORD *)(a1 + 32), v6);

}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  char v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  char v28;
  __CFString *v29;
  __CFString *v30;
  char v31;
  __CFString *v32;
  __CFString *v33;
  char v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[2];
  void *v46;
  _QWORD v47[2];
  _QWORD v48[2];
  uint64_t v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)*MEMORY[0x1E0DC48A8];
  v12 = v9;
  v13 = v11;
  if (v13 == v12)
  {

  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_13;
    }
    v15 = objc_msgSend(v12, "isEqualToString:", v13);

    if (!v15)
    {
LABEL_13:
      objc_msgSend(MEMORY[0x1E0DC39A8], "plainFooterConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *MEMORY[0x1E0DC1138];
      PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC4900]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor", v44, *MEMORY[0x1E0DC1140], v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSDictionary objectForKeyedSubscript:](self->_footerForSectionIdentifier, "objectForKeyedSubscript:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 5.0;
      v27 = 5.0;
      if (!v16)
        goto LABEL_31;
      goto LABEL_30;
    }
  }
  -[PKPaymentSetupCredentialsSectionController headerForSectionIdentifier:](self, "headerForSectionIdentifier:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39A8], "plainHeaderConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (__CFString *)v10;
  v19 = v18;
  if (v18 == CFSTR("available"))
  {
    v23 = 0;
    v24 = 0.0;
    goto LABEL_26;
  }
  if (!v18)
    goto LABEL_23;
  v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("available"));

  v21 = v19;
  v22 = v21;
  if ((v20 & 1) != 0)
  {
    v23 = 0;
    v24 = 0.0;
    if (v21 == CFSTR("background_provisioning"))
      goto LABEL_27;
LABEL_26:
    v40 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("background_provisioning"));

    if (v40)
      goto LABEL_27;
    goto LABEL_28;
  }
  if (v21 == CFSTR("background_provisioning"))
    goto LABEL_22;
  v28 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("background_provisioning"));

  if ((v28 & 1) != 0)
    goto LABEL_22;
  v29 = v22;
  if (v29 == CFSTR("unavailable")
    || (v30 = v29,
        v31 = -[__CFString isEqualToString:](v29, "isEqualToString:", CFSTR("unavailable")),
        v30,
        (v31 & 1) != 0)
    || (v32 = v30, v32 == CFSTR("refund"))
    || (v33 = v32,
        v34 = -[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("refund")),
        v33,
        (v34 & 1) != 0))
  {
LABEL_22:
    v49 = *MEMORY[0x1E0DC1138];
    v35 = v49;
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 25.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v36;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v47[0] = v35;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B58], (NSString *)*MEMORY[0x1E0DC4900], *MEMORY[0x1E0DC1420]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v38;
    v47[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_23:
    v51[0] = *MEMORY[0x1E0DC1138];
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A90], (NSString *)*MEMORY[0x1E0DC4900]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v38;
    v51[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v24 = 10.0;
  if (v19 == CFSTR("background_provisioning"))
  {
LABEL_27:
    +[PKCellAccessoryLoadingIndicator accessory](PKCellAccessoryLoadingIndicator, "accessory");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessories:", v42);

    goto LABEL_29;
  }
  if (v19)
    goto LABEL_26;
LABEL_28:
  objc_msgSend(v8, "setAccessories:", MEMORY[0x1E0C9AA60]);
LABEL_29:
  v27 = 10.0;
  if (v16)
  {
LABEL_30:
    objc_msgSend(v17, "setDirectionalLayoutMargins:", v27, 0.0, v24, 0.0);
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v16, v23);
    objc_msgSend(v17, "setAttributedText:", v43);

  }
LABEL_31:
  objc_msgSend(v8, "setContentConfiguration:", v17, v27);

}

- (id)headerForSectionIdentifier:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  char v16;
  __CFString *v17;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == CFSTR("unavailable"))
    goto LABEL_4;
  if (!v3)
    goto LABEL_15;
  v5 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("unavailable"));

  if (v5)
  {
LABEL_4:
    v6 = CFSTR("UNAVAILABLE_CARDS");
LABEL_5:
    PKLocalizedPaymentString(&v6->isa);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v17 = v7;
    goto LABEL_17;
  }
  v8 = v4;
  if (v8 == CFSTR("refund")
    || (v9 = v8, v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("refund")), v9, v10))
  {
    v6 = CFSTR("REFUNDED_PURCHASES");
    goto LABEL_5;
  }
  v11 = v9;
  if (v11 == CFSTR("background_provisioning")
    || (v12 = v11,
        v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("background_provisioning")),
        v12,
        v13))
  {
    v6 = CFSTR("CARDS_BEING_BACKGROUND_PROVISIONED_SECTION_HEADER");
    goto LABEL_5;
  }
  v14 = v12;
  if (v14 != CFSTR("available"))
  {
    v15 = v14;
    v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("available"));

    if ((v16 & 1) == 0)
    {
LABEL_15:
      v7 = v4;
      goto LABEL_16;
    }
  }
  v17 = 0;
LABEL_17:

  return v17;
}

- (id)footerForSectionIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_footerForSectionIdentifier, "objectForKeyedSubscript:", a3);
}

- (void)didSelectItem:(id)a3
{
  void *WeakRetained;
  void *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "isRefund"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "credential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "presentRefundFlowForCredential:", v5);
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  if (objc_msgSend(v10, "isUnavailable"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "credential");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "presentUnavailableDetailsForCredential:", v5);
    goto LABEL_5;
  }
  if (!self->_isEditing)
  {
    if ((objc_msgSend(v10, "isBeingProvisioned") & 1) != 0)
      goto LABEL_7;
    objc_msgSend(v10, "credential");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupCredentialsSectionController setCredential:selected:](self, "setCredential:selected:", WeakRetained, objc_msgSend(v10, "selected") ^ 1);
    goto LABEL_6;
  }
  if ((objc_msgSend(v10, "isDeletable") & 1) == 0)
  {
    objc_msgSend(v10, "credential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isSafariCredential");

    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    WeakRetained = v9;
    if (v8)
      objc_msgSend(v9, "showUnableToDeleteSafariCredentialError");
    else
      objc_msgSend(v9, "showUnableToDeleteCredentialError");
    goto LABEL_6;
  }
  if (UIAccessibilityIsVoiceOverRunning())
    -[PKPaymentSetupCredentialsSectionController _promptToDeleteItem:completion:](self, "_promptToDeleteItem:completion:", v10, 0);
LABEL_7:
  v6 = objc_loadWeakRetained((id *)&self->_dataChangeDelegate);
  objc_msgSend(v6, "deselectCells");

}

- (BOOL)shouldHighlightItem:(id)a3
{
  return objc_msgSend(a3, "isCellDisabled") ^ 1;
}

- (void)paymentPassUpdatedOnCredential:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__PKPaymentSetupCredentialsSectionController_paymentPassUpdatedOnCredential___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __77__PKPaymentSetupCredentialsSectionController_paymentPassUpdatedOnCredential___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_credentialItemForCredential:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPassSnapshot:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_cardArtForCredentialItem:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setPassSnapshot:", v2);
    objc_msgSend(*(id *)(a1 + 32), "_replaceAndReloadItem:withNewItem:", v4, v3);

  }
}

- (void)_loadCredentials:(id)a3 create:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  void (**v8)(void *, void *);
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *allCredentials;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  PKPaymentSetupCredentialListItem *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  unsigned int v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSArray *v54;
  NSArray *sectionIdentifiers;
  NSDictionary *v56;
  NSDictionary *footerForSectionIdentifier;
  NSArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  id WeakRetained;
  id v65;
  id v66;
  id v67;
  _BOOL4 v68;
  uint64_t v69;
  void (**v70)(void *, void *);
  id v71;
  int IsSetupAssistant;
  void *v73;
  uint64_t v74;
  id obj;
  unsigned int v76;
  PKPaymentSetupCredentialsSectionController *v77;
  unsigned int v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD aBlock[4];
  id v92;
  uint8_t v93[128];
  uint8_t buf[4];
  void *v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v68 = a4;
  v98 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "pk_weakPointerPersonalityToStrongObjectsMapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPaymentSetupCredentialsSectionController__loadCredentials_create___block_invoke;
  aBlock[3] = &unk_1E3E61E98;
  v7 = v6;
  v92 = v7;
  v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v9 = self->_sectionIdentifiers;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v88 != v12)
          objc_enumerationMutation(v9);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_allCredentials, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v14);

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
    }
    while (v11);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  allCredentials = self->_allCredentials;
  self->_allCredentials = v16;

  IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v5;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
  v73 = v15;
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v84;
    v70 = v8;
    v71 = v7;
    v77 = self;
    v69 = *(_QWORD *)v84;
    do
    {
      v21 = 0;
      v74 = v19;
      do
      {
        if (*(_QWORD *)v84 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v21);
        if (!objc_msgSend(v15, "containsObject:", v22))
        {
          objc_msgSend(v7, "objectForKey:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (PKPaymentSetupCredentialListItem *)objc_msgSend(v24, "copy");

          if (v23)
          {
            objc_msgSend(v7, "removeObjectForKey:", v22);
          }
          else
          {
            if (!v68)
              goto LABEL_54;
            v23 = -[PKPaymentSetupCredentialListItem initWithCredential:]([PKPaymentSetupCredentialListItem alloc], "initWithCredential:", v22);
            -[PKPaymentSetupListItem setReserverSpaceForSelectedAccessory:](v23, "setReserverSpaceForSelectedAccessory:", 1);
          }
          if (IsSetupAssistant)
          {
            objc_msgSend(v22, "remoteCredential");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_24;
          }
          -[PKPaymentProvisioningController pendingProvisioningForCredential:](self->_provisioningController, "pendingProvisioningForCredential:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "remoteCredential");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = 0;
            v28 = 0;
            v78 = 0;
            v29 = 1;
            v30 = CFSTR("background_provisioning");
LABEL_38:
            v76 = v27;
            -[NSMutableDictionary objectForKeyedSubscript:](v77->_allCredentials, "objectForKeyedSubscript:", v30);
            v39 = (id)objc_claimAutoreleasedReturnValue();
            if (!v39)
            {
              v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v77->_allCredentials, "setObject:forKeyedSubscript:", v39, v30);
            }
            objc_msgSend(v39, "addObject:", v23);
            v40 = objc_msgSend(v22, "hash");
            if (-[PKPaymentSetupCredentialListItem lastCheckedCredentialHash](v23, "lastCheckedCredentialHash") != v40)
            {
              -[PKPaymentSetupCredentialsSectionController _titleTextForCredential:](v77, "_titleTextForCredential:", v22);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPaymentSetupListItem setTitle:](v23, "setTitle:", v41);

              v29 = v29;
              -[PKPaymentSetupCredentialsSectionController _detailTextForCredential:](v77, "_detailTextForCredential:", v22);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPaymentSetupListItem setSubtitle:](v23, "setSubtitle:", v42);

              -[PKPaymentSetupCredentialListItem setLastCheckedCredentialHash:](v23, "setLastCheckedCredentialHash:", v40);
            }
            if (v78)
              v43 = (v29 | objc_msgSend(v22, "isDeletable")) ^ 1;
            else
              v43 = 0;
            -[PKPaymentSetupCredentialListItem setIsAvailable:](v23, "setIsAvailable:", v78);
            -[PKPaymentSetupCredentialListItem setIsUnavailable:](v23, "setIsUnavailable:", v28);
            -[PKPaymentSetupCredentialListItem setIsRefund:](v23, "setIsRefund:", v76);
            -[PKPaymentSetupCredentialListItem setIsBeingProvisioned:](v23, "setIsBeingProvisioned:", v29);
            if ((v28 & 1) != 0)
            {
              v44 = 1;
            }
            else if (v77->_isEditing)
            {
              v44 = v43;
            }
            else
            {
              v44 = 0;
            }
            -[PKPaymentSetupListItem setDisplayInfo:](v23, "setDisplayInfo:", v44);
            -[PKPaymentSetupListItem setUseMultiSelectAccessory:](v23, "setUseMultiSelectAccessory:", v78);
            -[PKPaymentSetupListItem setDisplayChevron:](v23, "setDisplayChevron:", v76);
            -[PKPaymentSetupCredentialListItem setIsCellDisabled:](v23, "setIsCellDisabled:", v29);
            if ((v76 | v28 | v29) == 1)
              -[PKPaymentSetupListItem setSelected:](v23, "setSelected:", 0);
            v15 = v73;
            objc_msgSend(v73, "addObject:", v22);

            v8 = v70;
            v7 = v71;
            self = v77;
            v19 = v74;
            v20 = v69;
            goto LABEL_53;
          }
LABEL_24:
          if (v25)
          {
            v31 = objc_msgSend(v25, "status");
            if (v31 == 3)
            {
              v27 = 0;
              v29 = 0;
              v78 = 0;
              v28 = 1;
              v30 = CFSTR("unavailable");
              goto LABEL_38;
            }
            if (v31 == 5)
            {
              objc_msgSend(v25, "transferableFromDevices");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "firstObject");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "name");
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v34)
              {
                PKLocalizedPaymentString(CFSTR("TRANSFERABLE_FROM_CARDS_DEVICE_NAME"), CFSTR("%@"), v34);
                v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
                PKLocalizedPaymentString(CFSTR("TRANSFERABLE_FROM_CARDS_FOOTER_DEVICE_NAME"), CFSTR("%@"), v34);
              }
              else
              {
                PKLocalizedPaymentString(CFSTR("TRANSFERABLE_FROM_CARDS"));
                v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
                PKLocalizedPaymentString(CFSTR("TRANSFERABLE_FROM_CARDS_FOOTER"));
              }
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "setObject:forKeyedSubscript:", v38, v30);

              if ((objc_msgSend(v67, "containsObject:", v30) & 1) == 0)
                objc_msgSend(v67, "addObject:", v30);

              if (v30)
              {
                v27 = 0;
                v28 = 0;
                v29 = 0;
                v78 = 1;
                goto LABEL_38;
              }
            }
          }
          else
          {
            objc_msgSend(v22, "purchasedProductCredential");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "purchase");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "state");

            if (v37 == 3)
            {
              v28 = 0;
              v29 = 0;
              v25 = 0;
              v78 = 0;
              v27 = 1;
              v30 = CFSTR("refund");
              goto LABEL_38;
            }
          }
          v27 = 0;
          v28 = 0;
          v29 = 0;
          v78 = 1;
          v30 = CFSTR("available");
          goto LABEL_38;
        }
        PKLogFacilityTypeGetObject();
        v23 = (PKPaymentSetupCredentialListItem *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v23->super.super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v95 = v22;
          _os_log_impl(&dword_19D178000, &v23->super.super, OS_LOG_TYPE_DEFAULT, "Attempting to show parked card screen with duplicate credential %@", buf, 0xCu);
        }
LABEL_53:

LABEL_54:
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
    }
    while (v19);
  }

  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_allCredentials, "objectForKeyedSubscript:", CFSTR("available"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "count");

  if (v47)
    objc_msgSend(v45, "addObject:", CFSTR("available"));
  objc_msgSend(v45, "addObjectsFromArray:", v67);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_allCredentials, "objectForKeyedSubscript:", CFSTR("background_provisioning"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "count");

  if (v49)
    objc_msgSend(v45, "addObject:", CFSTR("background_provisioning"));
  -[NSMutableDictionary objectForKeyedSubscript:](self->_allCredentials, "objectForKeyedSubscript:", CFSTR("refund"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "count");

  if (v51)
    objc_msgSend(v45, "addObject:", CFSTR("refund"));
  -[NSMutableDictionary objectForKeyedSubscript:](self->_allCredentials, "objectForKeyedSubscript:", CFSTR("unavailable"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "count");

  if (v53)
    objc_msgSend(v45, "addObject:", CFSTR("unavailable"));
  v54 = (NSArray *)objc_msgSend(v45, "copy");
  sectionIdentifiers = self->_sectionIdentifiers;
  self->_sectionIdentifiers = v54;

  v56 = (NSDictionary *)objc_msgSend(v66, "copy");
  footerForSectionIdentifier = self->_footerForSectionIdentifier;
  self->_footerForSectionIdentifier = v56;

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v58 = self->_sectionIdentifiers;
  v59 = -[NSArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v80;
    do
    {
      for (j = 0; j != v60; ++j)
      {
        if (*(_QWORD *)v80 != v61)
          objc_enumerationMutation(v58);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_allCredentials, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentSetupCredentialsSectionController _sortCredentialItems:](self, "_sortCredentialItems:", v63);

      }
      v60 = -[NSArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
    }
    while (v60);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "setShowNoResultsView:", -[PKPaymentSetupCredentialsSectionController _hasCredentialsToShow](self, "_hasCredentialsToShow") ^ 1);

  v65 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v65, "credentialSelectionDidChange");

}

void __70__PKPaymentSetupCredentialsSectionController__loadCredentials_create___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v8, "credential");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v8, v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_sortCredentialItems:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__PKPaymentSetupCredentialsSectionController__sortCredentialItems___block_invoke;
  v3[3] = &unk_1E3E70528;
  v3[4] = self;
  objc_msgSend(a3, "sortUsingComparator:", v3);
}

uint64_t __67__PKPaymentSetupCredentialsSectionController__sortCredentialItems___block_invoke(uint64_t a1, void *a2, void *a3)
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

  v8 = objc_msgSend(v6, "compare:withBackedUpDefaultPaymentPassSerialNumber:", v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  return v8;
}

- (void)_updateRemoteCredentialCache
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PKPaymentProvisioningController associatedCredentials](self->_provisioningController, "associatedCredentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = v6;

  -[PKPaymentProvisioningController purchaseCredentials](self->_provisioningController, "purchaseCredentials");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pk_safelyAddObjectsFromArray:", v7);

  -[PKPaymentProvisioningController provisioningExtensionCredentials](self->_provisioningController, "provisioningExtensionCredentials");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pk_safelyAddObjectsFromArray:", v8);

  -[PKPaymentProvisioningController pendingCarKeyCredentials](self->_provisioningController, "pendingCarKeyCredentials");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pk_safelyAddObjectsFromArray:", v9);

  -[PKPaymentSetupCredentialsSectionController _loadCredentials:create:](self, "_loadCredentials:create:", v10, 0);
}

- (unint64_t)_numberOfSelectedCredentials
{
  void *v2;
  unint64_t v3;

  -[PKPaymentSetupCredentialsSectionController selectedCredentials](self, "selectedCredentials");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pk_countObjectsPassingTest:", &__block_literal_global_68);

  return v3;
}

uint64_t __74__PKPaymentSetupCredentialsSectionController__numberOfSelectedCredentials__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPeerPaymentCredential") ^ 1;
}

- (unint64_t)_numberOfSelectedPeerPaymentCredentials
{
  void *v2;
  unint64_t v3;

  -[PKPaymentSetupCredentialsSectionController selectedCredentials](self, "selectedCredentials");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pk_countObjectsPassingTest:", &__block_literal_global_69_0);

  return v3;
}

uint64_t __85__PKPaymentSetupCredentialsSectionController__numberOfSelectedPeerPaymentCredentials__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPeerPaymentCredential");
}

- (BOOL)_canSelectedCredential:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint8_t v9[16];

  if (self->_storageSnapshot)
  {
    objc_msgSend(a3, "appletTypes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "count"))
    {
      if ((-[PKProvisioningSEStorageSnapshot addAppletTypesToSnapshot:](self->_storageSnapshot, "addAppletTypesToSnapshot:", v5) & 1) == 0)
      {
        v6 = -[PKPaymentSetupCredentialsSectionController _numberOfSelectedCredentials](self, "_numberOfSelectedCredentials") == 0;
LABEL_12:

        return v6;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Allowing credential to be selected because no applet type specified", v9, 2u);
      }

    }
    v6 = 1;
    goto LABEL_12;
  }
  return (objc_msgSend(a3, "isPeerPaymentCredential") & 1) != 0
      || -[PKPaymentSetupCredentialsSectionController _numberOfSelectedCredentials](self, "_numberOfSelectedCredentials") < self->_maximumNumberOfSelectableCredentials;
}

- (BOOL)_hasCredentialsToShow
{
  return -[NSMutableDictionary count](self->_allCredentials, "count") != 0;
}

- (BOOL)_isCarKeyProduct
{
  void *v2;
  char v3;

  -[PKPaymentSetupProduct productIdentifier](self->_product, "productIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D6B000]);

  return v3;
}

- (void)_updateMaximumSelectableCredentials
{
  unint64_t v3;
  unint64_t v5;
  id WeakRetained;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if ((PKPaymentSetupContextIsMerchantApp() & 1) != 0
    || -[PKPaymentSetupCredentialsSectionController _isCarKeyProduct](self, "_isCarKeyProduct"))
  {
    self->_maximumNumberOfSelectableCredentials = 1;
  }
  else
  {
    if ((PKDisableDynamicSEAllocation() & 1) != 0 || !self->_storageSnapshot)
    {
      v3 = -[PKPaymentProvisioningController availableSecureElementPassSpaces](self->_provisioningController, "availableSecureElementPassSpaces");
      v8 = 0;
      v9 = &v8;
      v10 = 0x2020000000;
      v11 = 0;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __81__PKPaymentSetupCredentialsSectionController__updateMaximumSelectableCredentials__block_invoke;
      v7[3] = &unk_1E3E70448;
      v7[4] = &v8;
      -[PKPaymentSetupCredentialsSectionController _enumerateCredentials:](self, "_enumerateCredentials:", v7);
      if (v3 == 0x7FFFFFFFFFFFFFFFLL || v3 == 0)
      {
        v5 = v9[3];
      }
      else
      {
        v5 = v9[3];
        if (v3 < v5)
          v5 = v3;
      }
      self->_maximumNumberOfSelectableCredentials = v5;
      _Block_object_dispose(&v8, 8);
    }
    else if (!self->_maximumNumberOfSelectableCredentials)
    {
      self->_maximumNumberOfSelectableCredentials = -1;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "credentialSelectionDidChange");

  }
}

uint64_t __81__PKPaymentSetupCredentialsSectionController__updateMaximumSelectableCredentials__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(a3, "isAvailable");
  return 0;
}

- (BOOL)_setCredential:(id)a3 selected:(BOOL)a4 silently:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  NSArray *WeakRetained;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  BOOL v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v29;
  _BOOL4 v30;
  unsigned int v31;
  NSArray *obj;
  PKPaymentSetupCredentialsSectionController *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v5 = a5;
  v6 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v33 = self;
  WeakRetained = self->_sectionIdentifiers;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](WeakRetained, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v10)
  {
    v12 = 0;
    v15 = 0;
    goto LABEL_27;
  }
  v11 = v10;
  obj = WeakRetained;
  v30 = v5;
  v31 = v6;
  v12 = 0;
  v13 = *(_QWORD *)v35;
LABEL_3:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v35 != v13)
      objc_enumerationMutation(obj);
    -[NSMutableDictionary objectForKeyedSubscript:](v33->_allCredentials, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v14));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    if (v16)
      break;
LABEL_10:

LABEL_12:
    if (++v14 == v11)
    {
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v11)
        goto LABEL_3;
      v15 = 0;
      v21 = 0;
      WeakRetained = obj;
      goto LABEL_37;
    }
  }
  v17 = v16;
  v18 = 0;
  while (1)
  {
    v19 = v12;
    objc_msgSend(v15, "objectAtIndexedSubscript:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "credential");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v20 == v8)
      break;
    if (v17 == ++v18)
      goto LABEL_10;
  }
  if (!v15)
    goto LABEL_12;

  if (!v12)
    goto LABEL_39;
  if (objc_msgSend(v12, "selected") == v31)
  {
    v21 = 1;
    goto LABEL_40;
  }
  if (v31)
  {
    v22 = v30;
    if (-[PKPaymentSetupCredentialsSectionController _canSelectedCredential:](v33, "_canSelectedCredential:", v8))
      goto LABEL_33;
    if (v33->_maximumNumberOfSelectableCredentials == 1 && !v30)
    {
      v23 = objc_msgSend(v15, "count");
      if (v23)
      {
        v24 = v23;
        v25 = 0;
        while (1)
        {
          objc_msgSend(v15, "objectAtIndexedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "selected"))
            break;

          if (v24 == ++v25)
            goto LABEL_33;
        }
        v29 = (void *)objc_msgSend(v26, "copy");
        objc_msgSend(v29, "setSelected:", 0);
        -[PKPaymentSetupCredentialsSectionController _replaceAndReloadItem:withNewItem:](v33, "_replaceAndReloadItem:withNewItem:", v26, v29);

LABEL_32:
      }
      goto LABEL_33;
    }
    if (v30)
    {
LABEL_39:
      v21 = 0;
      goto LABEL_40;
    }
    WeakRetained = (NSArray *)objc_loadWeakRetained((id *)&v33->_delegate);
    -[NSArray showMaxSelectionAlertForCredential:](WeakRetained, "showMaxSelectionAlertForCredential:", v8);
LABEL_27:
    v21 = 0;
  }
  else
  {
    v22 = v30;
    if (v33->_storageSnapshot)
    {
      objc_msgSend(v8, "appletTypes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "count"))
        -[PKProvisioningSEStorageSnapshot removeAppletTypesFromSnapshot:](v33->_storageSnapshot, "removeAppletTypesFromSnapshot:", v26);
      goto LABEL_32;
    }
LABEL_33:
    WeakRetained = (NSArray *)objc_msgSend(v12, "copy");
    -[NSArray setSelected:](WeakRetained, "setSelected:", v31);
    if (v22)
    {
      objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v18, WeakRetained);
    }
    else
    {
      -[PKPaymentSetupCredentialsSectionController _replaceAndReloadItem:withNewItem:](v33, "_replaceAndReloadItem:withNewItem:", v12, WeakRetained);
      v27 = objc_loadWeakRetained((id *)&v33->_delegate);
      objc_msgSend(v27, "credentialSelectionDidChange");

    }
    v21 = 1;
  }
LABEL_37:

LABEL_40:
  return v21;
}

- (void)_primeItemSelectionAndReloadData:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(_QWORD *, uint64_t, void *, _BYTE *);
  void *v14;
  id v15;
  PKPaymentSetupCredentialsSectionController *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[4];

  if (!self->_isEditing)
  {
    v3 = a3;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "targetDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceClass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __79__PKPaymentSetupCredentialsSectionController__primeItemSelectionAndReloadData___block_invoke;
    v14 = &unk_1E3E705B0;
    v8 = v7;
    v15 = v8;
    v16 = self;
    v17 = v23;
    v18 = &v19;
    -[PKPaymentSetupCredentialsSectionController _enumerateCredentials:](self, "_enumerateCredentials:", &v11);
    if (v3)
    {
      if (*((_BYTE *)v20 + 24))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_dataChangeDelegate);
        objc_msgSend(WeakRetained, "reloadAnimated:", 0, v11, v12, v13, v14);

        v10 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v10, "credentialSelectionDidChange");

      }
    }

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(v23, 8);
  }
}

uint64_t __79__PKPaymentSetupCredentialsSectionController__primeItemSelectionAndReloadData___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  if ((objc_msgSend(v6, "selected") & 1) == 0 && objc_msgSend(v6, "isAvailable"))
  {
    objc_msgSend(v6, "credential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteCredential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8 || objc_msgSend(v8, "status") != 5)
      goto LABEL_12;
    objc_msgSend(v8, "transferableFromDevices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "deviceClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = (void *)a1[4];
      v14 = v11;
      v15 = v13;
      if (v14 == v15)
      {

LABEL_11:
LABEL_12:
        v18 = (void *)a1[5];
        objc_msgSend(v6, "credential");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "_setCredential:selected:silently:", v19, 1, 1);

        if ((v20 & 1) == 0)
        {
          if ((PKDisableDynamicSEAllocation() & 1) == 0 && !*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
            *(_QWORD *)(a1[5] + 152) = 1;
          *a4 = 1;
        }
        ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
        v21 = *(_QWORD *)(a1[7] + 8);
        if (*(_BYTE *)(v21 + 24))
          v22 = 1;
        else
          v22 = v20;
        *(_BYTE *)(v21 + 24) = v22;
        goto LABEL_23;
      }
      v16 = v15;
      if (v15)
      {
        v17 = objc_msgSend(v14, "isEqualToString:", v15);

        if (!v17)
          goto LABEL_22;
        goto LABEL_11;
      }

    }
LABEL_22:

LABEL_23:
  }

  return 0;
}

- (void)_promptToDeleteItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__PKPaymentSetupCredentialsSectionController__promptToDeleteItem_completion___block_invoke;
  v11[3] = &unk_1E3E685A8;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(WeakRetained, "showDeleteConfirmationWithCompletion:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

uint64_t __77__PKPaymentSetupCredentialsSectionController__promptToDeleteItem_completion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t result;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "deleteItem:", *(_QWORD *)(a1 + 32));

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)deleteItem:(id)a3
{
  id v4;
  char v5;
  NSHashTable *selectedCredentialsBeforeEditing;
  void *v7;
  NSObject *v8;
  PKPaymentProvisioningController *provisioningController;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  _QWORD *v20;
  id v21;
  char v22;
  id location;
  _QWORD block[4];
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v4 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__33;
  v35 = __Block_byref_object_dispose__33;
  v36 = (id)objc_msgSend(v4, "copy");
  objc_msgSend((id)v32[5], "setSelected:", 0);
  objc_msgSend((id)v32[5], "setLoadingIndicatorVisible:", 1);
  -[PKPaymentSetupCredentialsSectionController _replaceAndReloadItem:withNewItem:](self, "_replaceAndReloadItem:withNewItem:", v4, v32[5]);
  if ((objc_msgSend(v4, "selected") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    selectedCredentialsBeforeEditing = self->_selectedCredentialsBeforeEditing;
    objc_msgSend(v4, "credential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NSHashTable containsObject:](selectedCredentialsBeforeEditing, "containsObject:", v7);

  }
  v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__33;
  v29[4] = __Block_byref_object_dispose__33;
  v30 = 0;
  provisioningController = self->_provisioningController;
  objc_msgSend(v4, "credential");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __57__PKPaymentSetupCredentialsSectionController_deleteItem___block_invoke;
  v26[3] = &unk_1E3E705D8;
  v28 = v29;
  v12 = v8;
  v27 = v12;
  -[PKPaymentProvisioningController deleteCredential:completionHandler:](provisioningController, "deleteCredential:completionHandler:", v10, v26);

  dispatch_group_enter(v12);
  v13 = dispatch_time(0, 1000000000);
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __57__PKPaymentSetupCredentialsSectionController_deleteItem___block_invoke_2;
  block[3] = &unk_1E3E612E8;
  v25 = v12;
  v14 = v12;
  v15 = MEMORY[0x1E0C80D38];
  dispatch_after(v13, MEMORY[0x1E0C80D38], block);
  objc_initWeak(&location, self);
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __57__PKPaymentSetupCredentialsSectionController_deleteItem___block_invoke_3;
  v17[3] = &unk_1E3E70600;
  objc_copyWeak(&v21, &location);
  v19 = &v31;
  v20 = v29;
  v22 = v5;
  v17[4] = self;
  v18 = v4;
  v16 = v4;
  dispatch_group_notify(v14, v15, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);

}

void __57__PKPaymentSetupCredentialsSectionController_deleteItem___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __57__PKPaymentSetupCredentialsSectionController_deleteItem___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__PKPaymentSetupCredentialsSectionController_deleteItem___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copy");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      if (*(_BYTE *)(a1 + 72))
      {
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 128))
        {
          v5 = (void *)*((_QWORD *)WeakRetained + 15);
          objc_msgSend(*(id *)(a1 + 40), "credential");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v6);

        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setSelected:", 1);
        }
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setLoadingIndicatorVisible:", 0);
      objc_msgSend(WeakRetained, "_replaceAndReloadItem:withNewItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      v8 = objc_loadWeakRetained((id *)WeakRetained + 20);
      objc_msgSend(v8, "showCredentialDeletionError");
    }
    else
    {
      objc_msgSend(WeakRetained, "_removeCredentialItem:", *(_QWORD *)(a1 + 40));
      v7 = objc_loadWeakRetained((id *)WeakRetained + 21);
      objc_msgSend(v7, "reloadAnimated:", 1);

      v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));
      objc_msgSend(v8, "setShowNoResultsView:", objc_msgSend(*(id *)(a1 + 32), "_hasCredentialsToShow") ^ 1);
    }

  }
}

- (id)_titleTextForCredential:(id)a3
{
  return (id)objc_msgSend(a3, "longDescription");
}

- (id)_detailTextForCredential:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "detailDescriptionWithEnvironment:", PKPaymentSetupContextIsSetupAssistant());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_cardArtForCredentialItem:(id)a3
{
  id v4;
  PKPassSnapshotCoordinator *snapshotCoordinator;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  snapshotCoordinator = self->_snapshotCoordinator;
  -[PKPaymentSetupCredentialsSectionController _defaultCardSize](self, "_defaultCardSize");
  v7 = v6;
  v9 = v8;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PKPaymentSetupCredentialsSectionController__cardArtForCredentialItem___block_invoke;
  v13[3] = &unk_1E3E70628;
  v13[4] = self;
  v14 = v4;
  v10 = v4;
  -[PKPassSnapshotCoordinator cardSnapshotForSource:withSize:completion:](snapshotCoordinator, "cardSnapshotForSource:withSize:completion:", v10, v13, v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __72__PKPaymentSetupCredentialsSectionController__cardArtForCredentialItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_msgSend(a3, "credential");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_credentialItemForCredential:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(v7, "setPassSnapshot:", v5);
  objc_msgSend(v7, "setIsSnapshotFetchInProgress:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_replaceAndReloadItem:withNewItem:", *(_QWORD *)(a1 + 40), v7);

}

- (CGSize)_defaultCardSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 51.0;
  v3 = 32.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_replaceAndReloadItem:(id)a3 withNewItem:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id WeakRetained;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a4;
  objc_msgSend(v5, "credential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__PKPaymentSetupCredentialsSectionController__replaceAndReloadItem_withNewItem___block_invoke;
  v10[3] = &unk_1E3E70650;
  v11 = v6;
  v9 = v5;
  v12 = v9;
  v7 = v6;
  if (-[PKPaymentSetupCredentialsSectionController _enumerateCredentials:](self, "_enumerateCredentials:", v10))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataChangeDelegate);
    objc_msgSend(WeakRetained, "reloadItem:animated:", v9, 0);

  }
}

id __80__PKPaymentSetupCredentialsSectionController__replaceAndReloadItem_withNewItem___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  int v7;
  id v8;

  objc_msgSend(a3, "credential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PKEqualObjects();

  if (v7)
  {
    *a4 = 1;
    v8 = *(id *)(a1 + 40);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_credentialItemForCredential:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__33;
  v15 = __Block_byref_object_dispose__33;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PKPaymentSetupCredentialsSectionController__credentialItemForCredential___block_invoke;
  v8[3] = &unk_1E3E70678;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[PKPaymentSetupCredentialsSectionController _enumerateCredentials:](self, "_enumerateCredentials:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __75__PKPaymentSetupCredentialsSectionController__credentialItemForCredential___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  int v9;

  v7 = a3;
  objc_msgSend(v7, "credential");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = PKEqualObjects();

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

  return 0;
}

- (id)_credentialItemFromIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[PKPaymentSetupCredentialsSectionController identifiers](self, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_allCredentials, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_removeCredentialItem:(id)a3
{
  id v4;
  id v5;
  uint64_t (**v6)(void *, void *);
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD aBlock[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPaymentSetupCredentialsSectionController__removeCredentialItem___block_invoke;
  aBlock[3] = &unk_1E3E706A0;
  v5 = v4;
  v19 = v5;
  v6 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_sectionIdentifiers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v7);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_allCredentials, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v6[2](v6, v12);

      if ((v13 & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

BOOL __68__PKPaymentSetupCredentialsSectionController__removeCredentialItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 1;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "credential");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "credential");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == v10)
        break;
      v7 = ++v6 < v5;
      if (v5 == v6)
        goto LABEL_5;
    }
    objc_msgSend(v3, "removeObjectAtIndex:", v6);
  }
  else
  {
LABEL_5:
    v7 = 0;
  }

  return v7;
}

- (BOOL)_enumerateCredentials:(id)a3
{
  void (**v4)(id, uint64_t, void *, unsigned __int8 *);
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  int v16;
  NSArray *obj;
  uint64_t v19;
  PKPaymentSetupCredentialsSectionController *v20;
  uint64_t v21;
  unsigned __int8 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_sectionIdentifiers;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v5 = 0;
  if (v21)
  {
    v19 = *(_QWORD *)v24;
    v20 = self;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v19)
        objc_enumerationMutation(obj);
      v7 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v6);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_allCredentials, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      v22 = 0;
      if (v9)
      {
        v10 = v9;
        v11 = 1;
        do
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v11 - 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v7, v12, &v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v8, "setObject:atIndexedSubscript:", v13, v11 - 1);
            v5 = 1;
          }
          v14 = v22;

          if (v14)
            break;
        }
        while (v11++ < v10);
      }
      self = v20;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v20->_allCredentials, "setObject:forKeyedSubscript:", v8, v7);
      v16 = v22;

      if (v16)
        break;
      if (++v6 == v21)
      {
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v21)
          goto LABEL_3;
        break;
      }
    }
  }

  return v5 & 1;
}

- (unint64_t)maximumNumberOfSelectableCredentials
{
  return self->_maximumNumberOfSelectableCredentials;
}

- (void)setMaximumNumberOfSelectableCredentials:(unint64_t)a3
{
  self->_maximumNumberOfSelectableCredentials = a3;
}

- (PKPaymentSetupCredentialsSectionControllerDelegate)delegate
{
  return (PKPaymentSetupCredentialsSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKDynamicListDataChangeDelegate)dataChangeDelegate
{
  return (PKDynamicListDataChangeDelegate *)objc_loadWeakRetained((id *)&self->_dataChangeDelegate);
}

- (void)setDataChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dataChangeDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataChangeDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storageSnapshot, 0);
  objc_storeStrong((id *)&self->_snapshotCoordinator, 0);
  objc_storeStrong((id *)&self->_selectedCredentialsBeforeEditing, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_footerForSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_allCredentials, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastBackedUpDefaultPaymentPassSerialNumber, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end
