@implementation PMSharedAccountsGroupMemberPickerViewController

- (PMSharedAccountsGroupMemberPickerViewController)initWithAlreadyAddedAddresses:(id)a3
{
  id v4;
  PMSharedAccountsGroupMemberPickerViewController *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  CNAutocompleteSearchManager *contactsSearchManager;
  uint64_t v18;
  NSMutableSet *addressesThatHaveBeenFetched;
  uint64_t v20;
  NSSet *alreadyAddedAddresses;
  uint64_t v22;
  NSMutableDictionary *addressToEligibility;
  uint64_t v24;
  NSMutableSet *addressesCurrentlyBeingCheckedForAvailability;
  PMSharedAccountsGroupMemberPickerViewController *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PMSharedAccountsGroupMemberPickerViewController;
  v5 = -[PMSharedAccountsGroupMemberPickerViewController init](&v28, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v5, sel__cancelButtonPressed);
    -[PMSharedAccountsGroupMemberPickerViewController navigationItem](v5, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:", v6);

    v8 = objc_alloc(MEMORY[0x24BEBD410]);
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v9, 2, v5, sel__addMembersButtonPressed);
    -[PMSharedAccountsGroupMemberPickerViewController navigationItem](v5, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:", v10);

    -[PMSharedAccountsGroupMemberPickerViewController navigationItem](v5, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rightBarButtonItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabled:", 0);

    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PMSharedAccountsGroupMemberPickerViewController navigationItem](v5, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:", v14);

    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BE19150]), "initWithAutocompleteSearchType:", 1);
    contactsSearchManager = v5->_contactsSearchManager;
    v5->_contactsSearchManager = (CNAutocompleteSearchManager *)v16;

    -[CNAutocompleteSearchManager setSearchTypes:](v5->_contactsSearchManager, "setSearchTypes:", 3);
    -[CNAutocompleteSearchManager setShouldIncludeGroupResults:](v5->_contactsSearchManager, "setShouldIncludeGroupResults:", 1);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    addressesThatHaveBeenFetched = v5->_addressesThatHaveBeenFetched;
    v5->_addressesThatHaveBeenFetched = (NSMutableSet *)v18;

    v20 = objc_msgSend(v4, "copy");
    alreadyAddedAddresses = v5->_alreadyAddedAddresses;
    v5->_alreadyAddedAddresses = (NSSet *)v20;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    addressToEligibility = v5->_addressToEligibility;
    v5->_addressToEligibility = (NSMutableDictionary *)v22;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v24 = objc_claimAutoreleasedReturnValue();
    addressesCurrentlyBeingCheckedForAvailability = v5->_addressesCurrentlyBeingCheckedForAvailability;
    v5->_addressesCurrentlyBeingCheckedForAvailability = (NSMutableSet *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  CNComposeRecipientTextView *v6;
  CNComposeRecipientTextView *recipientTextView;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CNAutocompleteResultsTableViewController *v15;
  CNAutocompleteResultsTableViewController *contactsResultsTableViewController;
  void *v17;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *recipientTextViewHeightConstraint;
  void *v22;
  NSLayoutConstraint *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;
  _QWORD v51[8];
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v50.receiver = self;
  v50.super_class = (Class)PMSharedAccountsGroupMemberPickerViewController;
  -[PMSharedAccountsGroupMemberPickerViewController viewDidLoad](&v50, sel_viewDidLoad);
  -[PMSharedAccountsGroupMemberPickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v6 = (CNComposeRecipientTextView *)objc_alloc_init(MEMORY[0x24BE19168]);
  recipientTextView = self->_recipientTextView;
  self->_recipientTextView = v6;

  -[CNComposeRecipientTextView setDelegate:](self->_recipientTextView, "setDelegate:", self);
  -[CNComposeRecipientTextView setTranslatesAutoresizingMaskIntoConstraints:](self->_recipientTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNComposeRecipientTextView setShowsAddButtonWhenExpanded:](self->_recipientTextView, "setShowsAddButtonWhenExpanded:", 0);
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView setLabel:](self->_recipientTextView, "setLabel:", v8);

  v9 = objc_alloc(MEMORY[0x24BDD1458]);
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v12);
  -[CNComposeRecipientTextView textView](self->_recipientTextView, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAttributedPlaceholder:", v13);

  objc_msgSend(v5, "addSubview:", self->_recipientTextView);
  v15 = (CNAutocompleteResultsTableViewController *)objc_alloc_init(MEMORY[0x24BE19138]);
  contactsResultsTableViewController = self->_contactsResultsTableViewController;
  self->_contactsResultsTableViewController = v15;

  -[CNAutocompleteResultsTableViewController setDelegate:](self->_contactsResultsTableViewController, "setDelegate:", self);
  -[CNAutocompleteResultsTableViewController view](self->_contactsResultsTableViewController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNAutocompleteResultsTableViewController view](self->_contactsResultsTableViewController, "view");
  v49 = v5;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:");
  -[CNComposeRecipientTextView heightAnchor](self->_recipientTextView, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19168], "preferredHeight");
  objc_msgSend(v19, "constraintEqualToConstant:");
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  recipientTextViewHeightConstraint = self->_recipientTextViewHeightConstraint;
  self->_recipientTextViewHeightConstraint = v20;

  objc_msgSend(v5, "safeAreaLayoutGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x24BDD1628];
  -[CNComposeRecipientTextView topAnchor](self->_recipientTextView, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v46;
  -[CNComposeRecipientTextView leadingAnchor](self->_recipientTextView, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v43;
  -[CNComposeRecipientTextView trailingAnchor](self->_recipientTextView, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self->_recipientTextViewHeightConstraint;
  v51[2] = v40;
  v51[3] = v23;
  objc_msgSend(v18, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v35;
  v24 = v18;
  objc_msgSend(v18, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v25;
  v38 = v24;
  objc_msgSend(v24, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = v28;
  objc_msgSend(v24, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView bottomAnchor](self->_recipientTextView, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "activateConstraints:", v32);

  -[PMSharedAccountsGroupMemberPickerViewController _resetSearchQuery](self, "_resetSearchQuery");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PMSharedAccountsGroupMemberPickerViewController;
  -[PMSharedAccountsGroupMemberPickerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CNComposeRecipientTextView becomeFirstResponder](self->_recipientTextView, "becomeFirstResponder");
}

- (void)_addMembersButtonPressed
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[CNComposeRecipientTextView recipients](self->_recipientTextView, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "memberPickerViewController:addedRecipients:", self, v3);

}

- (void)_cancelButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "memberPickerViewController:addedRecipients:", self, 0);

}

- (BOOL)_doesGroupOnlyContainKnownContacts:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_allObjectsPassTest:", &__block_literal_global_2);

  return v4;
}

BOOL __86__PMSharedAccountsGroupMemberPickerViewController__doesGroupOnlyContainKnownContacts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_isEveryMemberInContactsGroupAlreadyInSharingGroup:(id)a3
{
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __102__PMSharedAccountsGroupMemberPickerViewController__isEveryMemberInContactsGroupAlreadyInSharingGroup___block_invoke;
  v6[3] = &unk_2513E7588;
  v6[4] = self;
  LOBYTE(self) = objc_msgSend(v4, "safari_allObjectsPassTest:", v6);

  return (char)self;
}

uint64_t __102__PMSharedAccountsGroupMemberPickerViewController__isEveryMemberInContactsGroupAlreadyInSharingGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "normalizedAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_isAddressAlreadyPartOfGroupOrInvitedAddresses:", v3);

  return v4;
}

- (BOOL)_isAddressAlreadyPartOfGroupOrInvitedAddresses:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[CNComposeRecipientTextView uncommentedAddresses](self->_recipientTextView, "uncommentedAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_msgSend(v5, "containsObject:", v4) & 1) != 0
    || -[NSSet containsObject:](self->_alreadyAddedAddresses, "containsObject:", v4);

  return v6;
}

- (BOOL)_hasEligibilityCachedForRecipient:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  NSMutableDictionary *addressToEligibility;
  void *v10;
  _QWORD v12[5];

  v4 = a3;
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __85__PMSharedAccountsGroupMemberPickerViewController__hasEligibilityCachedForRecipient___block_invoke;
    v12[3] = &unk_2513E7588;
    v12[4] = self;
    v8 = objc_msgSend(v7, "safari_allObjectsPassTest:", v12);
  }
  else
  {
    addressToEligibility = self->_addressToEligibility;
    objc_msgSend(v4, "normalizedAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](addressToEligibility, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10 != 0;

  }
  return v8;
}

BOOL __85__PMSharedAccountsGroupMemberPickerViewController__hasEligibilityCachedForRecipient___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
  objc_msgSend(a2, "normalizedAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)_fetchEligibilityForRecipient:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSMutableSet *addressesThatHaveBeenFetched;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v6, "children");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_mapObjectsUsingBlock:", &__block_literal_global_29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v12);

  }
  else
  {
    objc_msgSend(v6, "normalizedAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);
  }

  objc_msgSend(v8, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_2;
  v30[3] = &unk_2513E75F0;
  v30[4] = self;
  objc_msgSend(v13, "safari_filterObjectsUsingBlock:", v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet addObjectsFromArray:](self->_addressesCurrentlyBeingCheckedForAvailability, "addObjectsFromArray:", v15);
  -[NSMutableSet addObjectsFromArray:](self->_addressesThatHaveBeenFetched, "addObjectsFromArray:", v15);
  v16 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    addressesThatHaveBeenFetched = self->_addressesThatHaveBeenFetched;
    v18 = v16;
    v19 = -[NSMutableSet count](addressesThatHaveBeenFetched, "count");
    *(_DWORD *)buf = 134217984;
    v32 = v19;
    _os_log_impl(&dword_243521000, v18, OS_LOG_TYPE_DEFAULT, "PMSharedAccountsGroupMemberPickerViewController has tried to fetch %lu unique handles so far.", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDE8498], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_32;
  v25[3] = &unk_2513E7640;
  v25[4] = self;
  v26 = v15;
  v28 = v6;
  v29 = v7;
  v27 = v8;
  v21 = v6;
  v22 = v8;
  v23 = v7;
  v24 = v15;
  objc_msgSend(v20, "checkAvailabilityForHandles:completion:", v24, v25);

}

uint64_t __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "normalizedAddress");
}

uint64_t __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 0;
  else
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "containsObject:", v3) ^ 1;

  return v5;
}

void __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_2_33;
  block[3] = &unk_2513E7618;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v6;
  v16 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 48);
  v14 = v5;
  v15 = *(id *)(a1 + 56);
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_2_33(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1032);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minusSet:", v3);

  if (*(_QWORD *)(a1 + 48))
  {
    v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_2_33_cold_1((void **)(a1 + 48), v4);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = *(id *)(a1 + 56);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v10, (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "setObject:forKeyedSubscript:", v11, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(a1 + 32), "_updatePreferredHandleForRecipientIfNecessary:", *(_QWORD *)(a1 + 72));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

- (void)_handleSelectionForSingleRecipient:(id)a3
{
  id v4;
  NSMutableDictionary *addressToEligibility;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v4 = a3;
  addressToEligibility = self->_addressToEligibility;
  objc_msgSend(v4, "normalizedAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](addressToEligibility, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    objc_msgSend(v4, "normalizedAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PMSharedAccountsGroupMemberPickerViewController _isAddressAlreadyPartOfGroupOrInvitedAddresses:](self, "_isAddressAlreadyPartOfGroupOrInvitedAddresses:", v9);

    if (!v10)
      -[PMSharedAccountsGroupMemberPickerViewController _addRecipient:](self, "_addRecipient:", v4);
    -[PMSharedAccountsGroupMemberPickerViewController _resetSearchQuery](self, "_resetSearchQuery");
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "displayString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PMOngoingCredentialSharingStrings unableToInviteContactBecauseOfUnsupportedDevicesAlertMessageWithContactName:](PMOngoingCredentialSharingStrings, "unableToInviteContactBecauseOfUnsupportedDevicesAlertMessageWithContactName:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v14, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BEBD3A8];
    _WBSLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __86__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForSingleRecipient___block_invoke;
    v21[3] = &unk_2513E7668;
    v21[4] = self;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v20);

    -[PMSharedAccountsGroupMemberPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
  }

}

uint64_t __86__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForSingleRecipient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetSearchQuery");
}

- (void)_handleSelectionForMultipleRecipientsInGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  BOOL v23;
  NSMutableDictionary *addressToEligibility;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __96__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForMultipleRecipientsInGroup___block_invoke;
  v46[3] = &unk_2513E7588;
  v46[4] = self;
  if (objc_msgSend(v5, "safari_allObjectsPassTest:", v46))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD17C8];
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v8, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BEBD3A8];
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __96__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForMultipleRecipientsInGroup___block_invoke_2;
    v45[3] = &unk_2513E7668;
    v45[4] = self;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v45);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v15);

    -[PMSharedAccountsGroupMemberPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
LABEL_21:

    goto LABEL_22;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v17)
  {
    v18 = v17;
    v38 = v5;
    v39 = 0;
    v19 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v42 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v21, "normalizedAddress");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[PMSharedAccountsGroupMemberPickerViewController _isAddressAlreadyPartOfGroupOrInvitedAddresses:](self, "_isAddressAlreadyPartOfGroupOrInvitedAddresses:", v22);

        if (!v23)
        {
          addressToEligibility = self->_addressToEligibility;
          objc_msgSend(v21, "normalizedAddress");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](addressToEligibility, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "BOOLValue");

          if (v27)
            -[PMSharedAccountsGroupMemberPickerViewController _addRecipient:](self, "_addRecipient:", v21);
          else
            v39 = 1;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v18);

    v5 = v38;
    if ((v39 & 1) != 0)
    {
      objc_msgSend(v4, "displayString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "length");

      if (v29)
      {
        v30 = (void *)MEMORY[0x24BDD17C8];
        _WBSLocalizedString();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "displayString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", v31, v32);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        _WBSLocalizedString();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v33 = MEMORY[0x24BDAC760];
      +[PMOngoingCredentialSharingStrings unableToInviteMultipleContactsBecauseOfUnsupportedDevicesAlertMessage](PMOngoingCredentialSharingStrings, "unableToInviteMultipleContactsBecauseOfUnsupportedDevicesAlertMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v8, v11, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x24BEBD3A8];
      _WBSLocalizedString();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v33;
      v40[1] = 3221225472;
      v40[2] = __96__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForMultipleRecipientsInGroup___block_invoke_3;
      v40[3] = &unk_2513E7668;
      v40[4] = self;
      objc_msgSend(v35, "actionWithTitle:style:handler:", v36, 0, v40);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addAction:", v37);

      -[PMSharedAccountsGroupMemberPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v34, 1, 0);
      goto LABEL_21;
    }
  }
  else
  {

  }
  -[PMSharedAccountsGroupMemberPickerViewController _resetSearchQuery](self, "_resetSearchQuery");
LABEL_22:

}

uint64_t __96__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForMultipleRecipientsInGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
  objc_msgSend(a2, "normalizedAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue") ^ 1;
  else
    v5 = 1;

  return v5;
}

uint64_t __96__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForMultipleRecipientsInGroup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetSearchQuery");
}

uint64_t __96__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForMultipleRecipientsInGroup___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetSearchQuery");
}

- (void)_addRecipient:(id)a3
{
  void *v4;
  void *v5;

  -[CNComposeRecipientTextView addRecipient:](self->_recipientTextView, "addRecipient:", a3);
  -[PMSharedAccountsGroupMemberPickerViewController _resetSearchQuery](self, "_resetSearchQuery");
  -[PMSharedAccountsGroupMemberPickerViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

  -[PMSharedAccountsGroupMemberPickerViewController _updateRecipientTextViewHeight](self, "_updateRecipientTextViewHeight");
}

- (void)_updateRecipientTextViewHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[CNComposeRecipientTextView textView](self->_recipientTextView, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;

  objc_msgSend(MEMORY[0x24BE19168], "preferredHeight");
  if (v6 <= (double)(unint64_t)v5)
    v6 = (double)(unint64_t)v5;
  v7 = (double)(unint64_t)v6;
  -[NSLayoutConstraint constant](self->_recipientTextViewHeightConstraint, "constant");
  if (v8 != v7)
    -[NSLayoutConstraint setConstant:](self->_recipientTextViewHeightConstraint, "setConstant:", v7);
}

- (void)_resetSearchQuery
{
  id v3;

  -[CNComposeRecipientTextView clearText](self->_recipientTextView, "clearText");
  -[CNAutocompleteResultsTableViewController setRecipients:](self->_contactsResultsTableViewController, "setRecipients:", MEMORY[0x24BDBD1A8]);
  v3 = (id)-[CNAutocompleteSearchManager searchForText:consumer:](self->_contactsSearchManager, "searchForText:consumer:", &stru_251400780, self);
}

- (BOOL)_cachedIsRecipientEligible:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  NSMutableDictionary *addressToEligibility;
  void *v11;
  void *v12;
  char v13;
  _QWORD v14[5];

  v4 = a3;
  objc_msgSend(v4, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __78__PMSharedAccountsGroupMemberPickerViewController__cachedIsRecipientEligible___block_invoke;
    v14[3] = &unk_2513E7588;
    v14[4] = self;
    v8 = objc_msgSend(v7, "safari_containsObjectPassingTest:", v14);

    return v8;
  }
  else
  {
    addressToEligibility = self->_addressToEligibility;
    objc_msgSend(v4, "normalizedAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](addressToEligibility, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    return v13;
  }
}

uint64_t __78__PMSharedAccountsGroupMemberPickerViewController__cachedIsRecipientEligible___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
  objc_msgSend(a2, "normalizedAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)_updatePreferredHandleForRecipientIfNecessary:(id)a3
{
  NSMutableDictionary *addressToEligibility;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[PMSharedAccountsGroupMemberPickerViewController _cachedIsRecipientEligible:](self, "_cachedIsRecipientEligible:", v10))
    {
      addressToEligibility = self->_addressToEligibility;
      objc_msgSend(v10, "normalizedAddress");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](addressToEligibility, "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");

      if ((v7 & 1) == 0)
      {
        objc_msgSend(v10, "children");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __97__PMSharedAccountsGroupMemberPickerViewController__updatePreferredHandleForRecipientIfNecessary___block_invoke;
        v11[3] = &unk_2513E7588;
        v11[4] = self;
        objc_msgSend(v8, "safari_firstObjectPassingTest:", v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNAutocompleteResultsTableViewController setPreferredRecipient:forRecipient:](self->_contactsResultsTableViewController, "setPreferredRecipient:forRecipient:", v9, v10);
      }
    }
  }

}

uint64_t __97__PMSharedAccountsGroupMemberPickerViewController__updatePreferredHandleForRecipientIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1000);
  objc_msgSend(a2, "normalizedAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  void (**v13)(id, void *);

  v7 = a4;
  v8 = (void (**)(id, void *))a5;
  if (-[PMSharedAccountsGroupMemberPickerViewController _hasEligibilityCachedForRecipient:](self, "_hasEligibilityCachedForRecipient:", v7))
  {
    if (-[PMSharedAccountsGroupMemberPickerViewController _cachedIsRecipientEligible:](self, "_cachedIsRecipientEligible:", v7))
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v9);

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __114__PMSharedAccountsGroupMemberPickerViewController_autocompleteResultsController_tintColorForRecipient_completion___block_invoke;
    v11[3] = &unk_2513E7690;
    v13 = v8;
    v11[4] = self;
    v12 = v7;
    -[PMSharedAccountsGroupMemberPickerViewController _fetchEligibilityForRecipient:completionHandler:](self, "_fetchEligibilityForRecipient:completionHandler:", v12, v11);

  }
}

void __114__PMSharedAccountsGroupMemberPickerViewController_autocompleteResultsController_tintColorForRecipient_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  if ((objc_msgSend(*(id *)(a1 + 32), "_cachedIsRecipientEligible:", *(_QWORD *)(a1 + 40)) & 1) != 0)
    objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PMSharedAccountsGroupMemberPickerViewController _handleSelectionForMultipleRecipientsInGroup:](self, "_handleSelectionForMultipleRecipientsInGroup:", v6);
  else
    -[PMSharedAccountsGroupMemberPickerViewController _handleSelectionForSingleRecipient:](self, "_handleSelectionForSingleRecipient:", v6);

}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDBAE90];
  if (v6)
  {
    objc_msgSend(v5, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "viewControllerForContact:", v8);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    -[PMSharedAccountsGroupMemberPickerViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v16, 1);

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBACA0];
    objc_msgSend(v5, "normalizedAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contactWithDisplayName:handleStrings:", 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllerForUnknownContact:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PMSharedAccountsGroupMemberPickerViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pushViewController:animated:", v14, 1);

  }
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  NSNumber *v5;
  NSNumber *currentSearchTaskID;
  id v7;

  v7 = a4;
  if (self->_currentSearchTaskID)
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_contactsSearchManager, "cancelTaskWithID:");
  -[CNAutocompleteSearchManager searchForText:consumer:](self->_contactsSearchManager, "searchForText:consumer:", v7, self);
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  currentSearchTaskID = self->_currentSearchTaskID;
  self->_currentSearchTaskID = v5;

}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  -[CNComposeRecipientTextView recipients](self->_recipientTextView, "recipients", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;
  -[PMSharedAccountsGroupMemberPickerViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v6);

  -[PMSharedAccountsGroupMemberPickerViewController _updateRecipientTextViewHeight](self, "_updateRecipientTextViewHeight");
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  void *v5;
  id v6;
  _QWORD v7[5];

  v6 = (id)objc_msgSend(a3, "mutableCopy");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __91__PMSharedAccountsGroupMemberPickerViewController_consumeAutocompleteSearchResults_taskID___block_invoke;
  v7[3] = &unk_2513E76B8;
  v7[4] = self;
  objc_msgSend(v6, "safari_removeObjectsPassingTest:", v7);
  -[PMSharedAccountsGroupMemberPickerViewController _recipientsWithEligibleAddressesAsDefaultAddressesIfPossible:](self, "_recipientsWithEligibleAddressesAsDefaultAddressesIfPossible:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultsTableViewController setRecipients:](self->_contactsResultsTableViewController, "setRecipients:", v5);

}

uint64_t __91__PMSharedAccountsGroupMemberPickerViewController_consumeAutocompleteSearchResults_taskID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_doesGroupOnlyContainKnownContacts:", v3))
      v4 = objc_msgSend(*(id *)(a1 + 32), "_isEveryMemberInContactsGroupAlreadyInSharingGroup:", v3);
    else
      v4 = 1;
  }
  else
  {
    objc_msgSend(v3, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v3, "normalizedAddress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "_isAddressAlreadyPartOfGroupOrInvitedAddresses:", v7);

    }
    else
    {
      v4 = 1;
    }

  }
  return v4;
}

- (id)_recipientsWithEligibleAddressesAsDefaultAddressesIfPossible:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableDictionary *addressToEligibility;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  if (objc_msgSend(v4, "count"))
  {
    v6 = 0;
    v21 = v4;
    v22 = v5;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v7;
        objc_msgSend(v7, "children");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v25;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v25 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              addressToEligibility = self->_addressToEligibility;
              objc_msgSend(v14, "normalizedAddress");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](addressToEligibility, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "BOOLValue");

              if (v18)
              {
                v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19170]), "initWithChildren:defaultChild:", v9, v14);
                v5 = v22;
                objc_msgSend(v22, "replaceObjectAtIndex:withObject:", v6, v19);

                goto LABEL_14;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            v5 = v22;
            if (v11)
              continue;
            break;
          }
        }
LABEL_14:

        v4 = v21;
        v7 = v23;
      }

      ++v6;
    }
    while (v6 < objc_msgSend(v4, "count"));
  }

  return v5;
}

- (void)finishedSearchingForAutocompleteResults
{
  NSNumber *currentSearchTaskID;

  currentSearchTaskID = self->_currentSearchTaskID;
  self->_currentSearchTaskID = 0;

}

- (BOOL)shouldConfirmAddingRecipients
{
  return self->_shouldConfirmAddingRecipients;
}

- (void)setShouldConfirmAddingRecipients:(BOOL)a3
{
  self->_shouldConfirmAddingRecipients = a3;
}

- (PMSharedAccountsGroupMemberPickerViewControllerDelegate)delegate
{
  return (PMSharedAccountsGroupMemberPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_addressesThatHaveBeenFetched, 0);
  objc_storeStrong((id *)&self->_addressesCurrentlyBeingCheckedForAvailability, 0);
  objc_storeStrong((id *)&self->_recipientTextViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_alreadyAddedAddresses, 0);
  objc_storeStrong((id *)&self->_recipientGroupToEligibility, 0);
  objc_storeStrong((id *)&self->_addressToEligibility, 0);
  objc_storeStrong((id *)&self->_currentSearchTaskID, 0);
  objc_storeStrong((id *)&self->_contactsSearchManager, 0);
  objc_storeStrong((id *)&self->_recipientTextView, 0);
  objc_storeStrong((id *)&self->_contactsResultsTableViewController, 0);
}

void __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_2_33_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_243521000, v3, OS_LOG_TYPE_ERROR, "Failed to check recipient eligibility for shared account groups with error: %@", (uint8_t *)&v5, 0xCu);

}

@end
