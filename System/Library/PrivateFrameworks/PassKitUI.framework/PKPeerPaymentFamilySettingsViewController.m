@implementation PKPeerPaymentFamilySettingsViewController

- (PKPeerPaymentFamilySettingsViewController)initWithPass:(id)a3 dataProvider:(id)a4 peerPaymentAccount:(id)a5 familyCollection:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPeerPaymentFamilySettingsViewController *v13;
  PKPeerPaymentFamilySettingsViewController *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  PKContactResolver *contactResolver;
  PKContactAvatarManager *v20;
  PKContactAvatarManager *contactAvatarManager;
  PKPeerPaymentAssociatedAccountsController *v22;
  PKFamilyMemberCollection *familyCollection;
  PKContactAvatarManager *v24;
  id v25;
  uint64_t v26;
  PKPeerPaymentAssociatedAccountsController *peerPaymentAssociatedAccountsController;
  void *v28;
  void *v29;
  objc_super v31;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v31.receiver = self;
  v31.super_class = (Class)PKPeerPaymentFamilySettingsViewController;
  v13 = -[PKPeerPaymentFamilySettingsViewController initWithStyle:](&v31, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1));
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_paymentServiceDataProvider, a4);
    objc_storeStrong((id *)&v14->_peerPaymentAccount, a5);
    objc_storeStrong((id *)&v14->_familyCollection, a6);
    v15 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v16 = objc_alloc(MEMORY[0x1E0D66C60]);
    -[PKPeerPaymentFamilySettingsViewController _contactKeysToFetch](v14, "_contactKeysToFetch");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithContactStore:keysToFetch:", v15, v17);
    contactResolver = v14->_contactResolver;
    v14->_contactResolver = (PKContactResolver *)v18;

    v20 = -[PKContactAvatarManager initWithContactResolver:paymentDataProvider:]([PKContactAvatarManager alloc], "initWithContactResolver:paymentDataProvider:", v14->_contactResolver, v14->_paymentServiceDataProvider);
    contactAvatarManager = v14->_contactAvatarManager;
    v14->_contactAvatarManager = v20;

    v22 = [PKPeerPaymentAssociatedAccountsController alloc];
    familyCollection = v14->_familyCollection;
    v24 = v14->_contactAvatarManager;
    v25 = objc_alloc_init(MEMORY[0x1E0D66F18]);
    v26 = -[PKPeerPaymentAssociatedAccountsController initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:](v22, "initWithFamilyCollection:avatarManager:passLibraryDataProvider:context:", familyCollection, v24, v25, 0);
    peerPaymentAssociatedAccountsController = v14->_peerPaymentAssociatedAccountsController;
    v14->_peerPaymentAssociatedAccountsController = (PKPeerPaymentAssociatedAccountsController *)v26;

    -[PKPeerPaymentFamilySettingsViewController navigationItem](v14, "navigationItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentLexingtonString(CFSTR("MORE_MENU_FAMILY_SHARING"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTitle:", v29);

    -[PKPeerPaymentFamilySettingsViewController _updateFamilyRows](v14, "_updateFamilyRows");
  }

  return v14;
}

- (void)_updateFamilyRows
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *sortedFamilyMemberRowModels;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  PKContactAvatarManager *contactAvatarManager;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *obj;
  uint64_t v24;
  _QWORD v25[6];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[PKFamilyMemberCollection familyMembers](self->_familyCollection, "familyMembers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_peerPaymentAccount && self->_familyCollection && objc_msgSend(v3, "count"))
  {
    v22 = v4;
    +[PKPeerPaymentFamilyMemberRowModel sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:peerPaymentAccount:](PKPeerPaymentFamilyMemberRowModel, "sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:peerPaymentAccount:", v4, self->_peerPaymentAccount);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sortedFamilyMemberRowModels = self->_sortedFamilyMemberRowModels;
    self->_sortedFamilyMemberRowModels = v5;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = self->_sortedFamilyMemberRowModels;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = v7;
      v24 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v24)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v10, "familyMember");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "account");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "altDSID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            v15 = v13;
          }
          else
          {
            objc_msgSend(v10, "invitation");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "altDSID");
            v15 = (id)objc_claimAutoreleasedReturnValue();

          }
          -[PKContactAvatarManager cachedAvatarForAltDSID:](self->_contactAvatarManager, "cachedAvatarForAltDSID:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            contactAvatarManager = self->_contactAvatarManager;
            objc_msgSend(v10, "account");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "invitation");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v25[0] = MEMORY[0x1E0C809B0];
            v25[1] = 3221225472;
            v25[2] = __62__PKPeerPaymentFamilySettingsViewController__updateFamilyRows__block_invoke;
            v25[3] = &unk_1E3E61428;
            v25[4] = v10;
            v25[5] = self;
            -[PKContactAvatarManager avatarForFamilyMember:peerPaymentAccount:invitation:completion:](contactAvatarManager, "avatarForFamilyMember:peerPaymentAccount:invitation:completion:", v11, v19, v20, v25);

          }
          objc_msgSend(v10, "setImage:", v17);

        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v8);
    }

    -[PKPeerPaymentFamilySettingsViewController tableView](self, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reloadData");

    v4 = v22;
  }

}

void __62__PKPeerPaymentFamilySettingsViewController__updateFamilyRows__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[5];
  id v7;
  uint64_t v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKPeerPaymentFamilySettingsViewController__updateFamilyRows__block_invoke_2;
  block[3] = &unk_1E3E61400;
  v4 = *(_QWORD *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __62__PKPeerPaymentFamilySettingsViewController__updateFamilyRows__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_sortedFamilyMemberRowModels, "count", a3, a4) + 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  PKFamilyMemberTableViewCell *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = objc_msgSend(a4, "row");
  if (v7 >= -[NSArray count](self->_sortedFamilyMemberRowModels, "count"))
  {
    PKLocalizedPeerPaymentLexingtonString(CFSTR("BACK_OF_PASS_Family_SHARING_SETTINGS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("linkCell"));
    v9 = (PKFamilyMemberTableViewCell *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      v9 = (PKFamilyMemberTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("linkCell"));
    -[PKFamilyMemberTableViewCell textLabel](v9, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v8);

    -[PKFamilyMemberTableViewCell textLabel](v9, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v16);

  }
  else
  {
    -[NSArray objectAtIndex:](self->_sortedFamilyMemberRowModels, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("familyMemberCell"));
    v9 = (PKFamilyMemberTableViewCell *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v9 = -[PKFamilyMemberTableViewCell initWithStyle:reuseIdentifier:]([PKFamilyMemberTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("familyMemberCell"));
      -[PKFamilyMemberTableViewCell textLabel](v9, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextColor:", v11);

      -[PKFamilyMemberTableViewCell detailTextLabel](v9, "detailTextLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTextColor:", v13);

    }
    -[PKFamilyMemberTableViewCell setRowModel:](v9, "setRowModel:", v8);
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  PKPeerPaymentAssociatedAccountPresentationContext *v12;
  PKPeerPaymentAssociatedAccountsController *peerPaymentAssociatedAccountsController;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t v18[16];

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "row");
  if (v8 >= -[NSArray count](self->_sortedFamilyMemberRowModels, "count"))
  {
    PKLogFacilityTypeGetObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_19D178000, v15, OS_LOG_TYPE_DEFAULT, "Opening apple cash family sharing settings from dashboard menu", v18, 2u);
    }

    PKPeerPaymentGetAppleCashFamilySettingsSensitiveURLForAltDSID();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "openSensitiveURL:withOptions:", v16, 0);

  }
  else
  {
    -[NSArray objectAtIndex:](self->_sortedFamilyMemberRowModels, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "familyMember");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray objectAtIndex:](self->_sortedFamilyMemberRowModels, "objectAtIndex:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v11, "state") - 1) <= 2)
    {
      v12 = -[PKPeerPaymentAssociatedAccountPresentationContext initWithPKFamilyMember:options:]([PKPeerPaymentAssociatedAccountPresentationContext alloc], "initWithPKFamilyMember:options:", v10, 0);
      peerPaymentAssociatedAccountsController = self->_peerPaymentAssociatedAccountsController;
      -[PKPeerPaymentFamilySettingsViewController navigationController](self, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentAssociatedAccountsController presentAssociatedAccountsFlowWithPresentationContext:fromNavigationController:](peerPaymentAssociatedAccountsController, "presentAssociatedAccountsFlowWithPresentationContext:fromNavigationController:", v12, v14);

    }
  }
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return (id)PKLocalizedPeerPaymentLexingtonString(CFSTR("BACK_OF_PASS_FAMILY_SHARING_FOOTER"));
}

- (id)_contactKeysToFetch
{
  void *v2;
  Class v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v3 = (Class)_MergedGlobals_1_2[0]();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", objc_msgSend(v4, "_supportsForceTouch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend((Class)off_1EE492C78[0](), "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend((Class)off_1EE492C80(), "descriptorForRequiredKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C966A8];
  v11[3] = v7;
  v11[4] = v8;
  v11[5] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentAssociatedAccountsController, 0);
  objc_storeStrong((id *)&self->_sortedFamilyMemberRowModels, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_contactAvatarManager, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
}

@end
