@implementation PKPeerPaymentFamilyCircleViewController

- (PKPeerPaymentFamilyCircleViewController)initWithFamilyCollection:(id)a3 avatarManager:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6
{
  id v11;
  id v12;
  PKPeerPaymentFamilyCircleViewController *v13;
  PKPaymentService *v14;
  PKPaymentService *paymentService;
  uint64_t v16;
  PKPeerPaymentService *peerPaymentService;
  uint64_t v18;
  PKPeerPaymentAccount *account;
  void *v20;
  uint64_t v21;
  NSArray *sortedRows;
  void *v23;
  void *v24;
  id v26;
  objc_super v27;

  v26 = a3;
  v11 = a4;
  v12 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PKPeerPaymentFamilyCircleViewController;
  v13 = -[PKPeerPaymentFamilyCircleViewController initWithStyle:](&v27, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1));
  if (v13)
  {
    v14 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E0D672B0]);
    paymentService = v13->_paymentService;
    v13->_paymentService = v14;

    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v16 = objc_claimAutoreleasedReturnValue();
    peerPaymentService = v13->_peerPaymentService;
    v13->_peerPaymentService = (PKPeerPaymentService *)v16;

    -[PKPeerPaymentService account](v13->_peerPaymentService, "account");
    v18 = objc_claimAutoreleasedReturnValue();
    account = v13->_account;
    v13->_account = (PKPeerPaymentAccount *)v18;

    objc_storeStrong((id *)&v13->_familyCollection, a3);
    objc_storeStrong((id *)&v13->_avatarManager, a4);
    objc_storeStrong((id *)&v13->_passLibraryDataProvider, a5);
    v13->_context = a6;
    objc_msgSend(v26, "familyMembers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPeerPaymentFamilyMemberRowModel sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:peerPaymentAccount:](PKPeerPaymentFamilyMemberRowModel, "sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:peerPaymentAccount:", v20, v13->_account);
    v21 = objc_claimAutoreleasedReturnValue();
    sortedRows = v13->_sortedRows;
    v13->_sortedRows = (NSArray *)v21;

    -[PKPeerPaymentFamilyCircleViewController _loadAvatarImagesIfNecessary](v13, "_loadAvatarImagesIfNecessary");
    PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_FAMILY_TITLE"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentFamilyCircleViewController setTitle:](v13, "setTitle:", v23);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v13, sel__peerPaymentAccountChanged_, *MEMORY[0x1E0D6B288], v13->_peerPaymentService);

  }
  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentFamilyCircleViewController;
  -[PKPeerPaymentFamilyCircleViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PKPeerPaymentFamilyCircleViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kFamilyMemberCellReuseIdentifier"));

  -[PKPeerPaymentFamilyCircleViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pkui_setupForReadableContentGuide");

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentFamilyCircleViewController;
  -[PKPeerPaymentFamilyCircleViewController viewDidAppear:](&v13, sel_viewDidAppear_, a3);
  if ((-[PKPeerPaymentAccount supportsFamilySharing](self->_account, "supportsFamilySharing") & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "Peer Payment family sharing feature not supported.", v12, 2u);
    }

    v5 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_FEATURE_NOT_SUPPORTED_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_FEATURE_NOT_SUPPORTED_MESSAGE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addAction:", v11);
    -[PKPeerPaymentFamilyCircleViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[PKPeerPaymentAccount supportsFamilySharing](self->_account, "supportsFamilySharing", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (-[PKPeerPaymentAccount supportsFamilySharing](self->_account, "supportsFamilySharing", a3, a4))
    return -[NSArray count](self->_sortedRows, "count");
  else
    return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSArray *sortedRows;
  uint64_t v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kFamilyMemberCellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sortedRows = self->_sortedRows;
  v9 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndex:](sortedRows, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRowModel:", v10);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  NSArray *sortedRows;
  uint64_t v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  sortedRows = self->_sortedRows;
  v8 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndex:](sortedRows, "objectAtIndex:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentFamilyCircleViewController _handleRowTapped:](self, "_handleRowTapped:", v9);

}

- (void)_handleRowTapped:(id)a3
{
  uint64_t v4;
  PKPeerPaymentAssociatedAccountViewController *v5;
  void *v6;
  uint64_t v7;
  PKPeerPaymentTurnOnAssociatedAccountViewController *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "state");
  if ((unint64_t)(v4 - 1) < 2)
  {
    v5 = [PKPeerPaymentAssociatedAccountViewController alloc];
    objc_msgSend(v11, "familyMember");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKPeerPaymentAssociatedAccountViewController initWithFamilyMember:familyCollection:account:context:](v5, "initWithFamilyMember:familyCollection:account:context:", v6, self->_familyCollection, self->_account, self->_context);
LABEL_5:
    v9 = (void *)v7;

    -[PKPeerPaymentFamilyCircleViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", v9, 1);

    goto LABEL_6;
  }
  if (v4 == 3)
  {
    v8 = [PKPeerPaymentTurnOnAssociatedAccountViewController alloc];
    objc_msgSend(v11, "familyMember");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKPeerPaymentTurnOnAssociatedAccountViewController initWithFamilyMember:familyCollection:delegate:passLibraryDataProvider:context:setupType:](v8, "initWithFamilyMember:familyCollection:delegate:passLibraryDataProvider:context:setupType:", v6, self->_familyCollection, self, self->_passLibraryDataProvider, self->_context, 0);
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  BOOL v5;

  -[NSArray objectAtIndex:](self->_sortedRows, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state") != 4;

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_FAMILY_HEADER_TITLE"));
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[PKPeerPaymentFamilyCircleViewController _pendingInvitations](self, "_pendingInvitations", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
  }
  else
  {
    PKLocalizedPeerPaymentLexingtonString(CFSTR("BACK_OF_PASS_FAMILY_SHARING_FOOTER"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v4;
  uint64_t v5;
  PKFooterHyperlinkView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PKPeerPaymentFamilyCircleViewController _pendingInvitations](self, "_pendingInvitations", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = objc_alloc_init(PKFooterHyperlinkView);
    PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_FAMILY_PENDING_FOOTER_TEXT_LINK"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_FAMILY_PENDING_FOOTER_TEXT"), CFSTR("%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/kb/HT211324"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKAttributedStringByAddingLinkToSubstring(v8, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFooterHyperlinkView setAttributedText:](v6, "setAttributedText:", v10);

    v11 = &__block_literal_global_46;
    -[PKFooterHyperlinkView setAction:](v6, "setAction:", &__block_literal_global_46);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)addPeerPaymentAssociatedAccountSetupCompletedWithSucess:(BOOL)a3 updatedAccount:(id)a4 forFamilyMember:(id)a5
{
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKPeerPaymentAccount *account;
  void *v15;
  void *v16;
  PKPeerPaymentAssociatedAccountViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v7 = a3;
  v21 = a4;
  v9 = a5;
  if (v7)
  {
    if (v21)
      objc_storeStrong((id *)&self->_account, a4);
    -[PKPeerPaymentFamilyCircleViewController _reloadSortedRows](self, "_reloadSortedRows");
    -[PKPeerPaymentFamilyCircleViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v12, "removeLastObject");
    account = self->_account;
    objc_msgSend(v9, "altDSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAccount peerPaymentAccountWithAltDSID:](account, "peerPaymentAccountWithAltDSID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = -[PKPeerPaymentAssociatedAccountViewController initWithFamilyMember:familyCollection:account:context:]([PKPeerPaymentAssociatedAccountViewController alloc], "initWithFamilyMember:familyCollection:account:context:", v9, self->_familyCollection, self->_account, self->_context);
      objc_msgSend(v12, "addObject:", v17);

    }
    -[PKPeerPaymentFamilyCircleViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v18, "setViewControllers:", v19);

  }
  -[PKPeerPaymentFamilyCircleViewController navigationController](self, "navigationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)_pendingInvitations
{
  return (id)-[NSArray pk_objectsPassingTest:](self->_sortedRows, "pk_objectsPassingTest:", &__block_literal_global_40);
}

BOOL __62__PKPeerPaymentFamilyCircleViewController__pendingInvitations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "state") == 4;
}

- (void)_reloadSortedRows
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_sortedRows;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "familyMember", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "altDSID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKPeerPaymentAccount peerPaymentAccountWithAltDSID:](self->_account, "peerPaymentAccountWithAltDSID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAccount:", v11);

        -[PKPeerPaymentAccount accountInvitationWithAltDSID:](self->_account, "accountInvitationWithAltDSID:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setInvitation:", v12);

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  -[PKPeerPaymentFamilyCircleViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadData");

}

- (void)_loadAvatarImagesIfNecessary
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  PKContactAvatarManager *avatarManager;
  void *v8;
  PKPeerPaymentAccount *account;
  void *v10;
  void *v11;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  if (-[PKPeerPaymentAccount supportsFamilySharing](self->_account, "supportsFamilySharing"))
  {
    if (-[NSArray count](self->_sortedRows, "count"))
    {
      v3 = 0;
      do
      {
        v13 = 0;
        v14 = &v13;
        v15 = 0x3032000000;
        v16 = __Block_byref_object_copy__5;
        v17 = __Block_byref_object_dispose__5;
        -[NSArray objectAtIndexedSubscript:](self->_sortedRows, "objectAtIndexedSubscript:", v3);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v14[5], "familyMember");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "altDSID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {
          -[PKContactAvatarManager cachedAvatarForAltDSID:](self->_avatarManager, "cachedAvatarForAltDSID:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v14[5], "setImage:", v6);
          if (!v6)
          {
            avatarManager = self->_avatarManager;
            objc_msgSend((id)v14[5], "familyMember");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            account = self->_account;
            objc_msgSend((id)v14[5], "invitation");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v12[0] = MEMORY[0x1E0C809B0];
            v12[1] = 3221225472;
            v12[2] = __71__PKPeerPaymentFamilyCircleViewController__loadAvatarImagesIfNecessary__block_invoke;
            v12[3] = &unk_1E3E654D0;
            v12[4] = self;
            v12[5] = &v13;
            v12[6] = v3;
            -[PKContactAvatarManager avatarForFamilyMember:peerPaymentAccount:invitation:completion:](avatarManager, "avatarForFamilyMember:peerPaymentAccount:invitation:completion:", v8, account, v10, v12);

          }
        }

        _Block_object_dispose(&v13, 8);
        ++v3;
      }
      while (v3 < -[NSArray count](self->_sortedRows, "count"));
    }
    -[PKPeerPaymentFamilyCircleViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadData");

  }
}

void __71__PKPeerPaymentFamilyCircleViewController__loadAvatarImagesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  __int128 v7;
  uint64_t v8;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__PKPeerPaymentFamilyCircleViewController__loadAvatarImagesIfNecessary__block_invoke_2;
  v5[3] = &unk_1E3E654A8;
  v6 = v3;
  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __71__PKPeerPaymentFamilyCircleViewController__loadAvatarImagesIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setImage:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", *(_QWORD *)(a1 + 56), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadRowsAtIndexPaths:withRowAnimation:", v4, 100);

}

- (id)_familyMemberWithDSID:(id)a3
{
  id v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_sortedRows;
  v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "familyMember", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dsid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = PKEqualObjects();

        if (v12)
        {
          objc_msgSend(v9, "familyMember");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_peerPaymentAccountChanged:(id)a3
{
  PKPeerPaymentService *peerPaymentService;
  _QWORD v4[5];

  peerPaymentService = self->_peerPaymentService;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__PKPeerPaymentFamilyCircleViewController__peerPaymentAccountChanged___block_invoke;
  v4[3] = &unk_1E3E654F8;
  v4[4] = self;
  -[PKPeerPaymentService updateAccountWithCompletion:](peerPaymentService, "updateAccountWithCompletion:", v4);
}

void __70__PKPeerPaymentFamilyCircleViewController__peerPaymentAccountChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__PKPeerPaymentFamilyCircleViewController__peerPaymentAccountChanged___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __70__PKPeerPaymentFamilyCircleViewController__peerPaymentAccountChanged___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1040), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSortedRows");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_sortedRows, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end
