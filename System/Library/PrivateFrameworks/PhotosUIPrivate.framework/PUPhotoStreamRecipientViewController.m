@implementation PUPhotoStreamRecipientViewController

- (PUPhotoStreamRecipientViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PUPhotoStreamRecipientViewController *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  IDSBatchIDQueryController *idsBatchIDQueryController;
  uint64_t v9;
  NSMutableSet *validPhoneNumbers;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUPhotoStreamRecipientViewController;
  v4 = -[PUPhotoStreamRecipientViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    PLPhotoSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "Initialiting IDS controller...", v12, 2u);
    }

    v6 = objc_alloc(MEMORY[0x1E0D342B0]);
    v7 = objc_msgSend(v6, "initWithService:delegate:queue:", *MEMORY[0x1E0D34220], v4, MEMORY[0x1E0C80D38]);
    idsBatchIDQueryController = v4->_idsBatchIDQueryController;
    v4->_idsBatchIDQueryController = (IDSBatchIDQueryController *)v7;

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 10);
    v9 = objc_claimAutoreleasedReturnValue();
    validPhoneNumbers = v4->_validPhoneNumbers;
    v4->_validPhoneNumbers = (NSMutableSet *)v9;

  }
  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  IDSBatchIDQueryController *idsBatchIDQueryController;
  objc_super v5;
  uint8_t buf[16];

  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEBUG, "Invalidating IDS controller", buf, 2u);
  }

  -[IDSBatchIDQueryController invalidate](self->_idsBatchIDQueryController, "invalidate");
  idsBatchIDQueryController = self->_idsBatchIDQueryController;
  self->_idsBatchIDQueryController = 0;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotoStreamRecipientViewController;
  -[PUPhotoStreamRecipientViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  CNAutocompleteResultsTableViewController *v5;
  CNAutocompleteResultsTableViewController *searchResultsTableViewController;
  void *v7;
  double v8;
  double v9;
  CNComposeRecipientTextView *v10;
  CNComposeRecipientTextView *recipientView;
  void *v12;
  UIScrollView *v13;
  UIScrollView *recipientContainerView;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PUPhotoStreamRecipientViewController;
  -[PUPhotoStreamRecipientViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[PUPhotoStreamRecipientViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (CNAutocompleteResultsTableViewController *)objc_alloc_init(MEMORY[0x1E0D13640]);
  searchResultsTableViewController = self->_searchResultsTableViewController;
  self->_searchResultsTableViewController = v5;

  -[CNAutocompleteResultsTableViewController setDelegate:](self->_searchResultsTableViewController, "setDelegate:", self);
  -[CNAutocompleteResultsTableViewController tableView](self->_searchResultsTableViewController, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", v7);
  objc_msgSend(MEMORY[0x1E0D136B0], "preferredHeight");
  v9 = v8;
  self->_recipientViewSize.width = 0.0;
  self->_recipientViewSize.height = v8;
  v10 = (CNComposeRecipientTextView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D136B0]), "initWithFrame:", 0.0, 0.0, 0.0, v8);
  recipientView = self->_recipientView;
  self->_recipientView = v10;

  -[CNComposeRecipientTextView setAutoresizingMask:](self->_recipientView, "setAutoresizingMask:", 18);
  -[CNComposeRecipientTextView setDelegate:](self->_recipientView, "setDelegate:", self);
  PLLocalizedFrameworkString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView setLabel:](self->_recipientView, "setLabel:", v12);

  v13 = (UIScrollView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C28]), "initWithFrame:", 0.0, 0.0, 0.0, v9);
  recipientContainerView = self->_recipientContainerView;
  self->_recipientContainerView = v13;

  -[UIScrollView setAutoresizingMask:](self->_recipientContainerView, "setAutoresizingMask:", 18);
  -[UIScrollView setBounces:](self->_recipientContainerView, "setBounces:", 0);
  -[UIScrollView setContentSize:](self->_recipientContainerView, "setContentSize:", 290.0, 200.0);
  -[UIScrollView addSubview:](self->_recipientContainerView, "addSubview:", self->_recipientView);
  objc_msgSend(v3, "addSubview:", self->_recipientContainerView);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotoStreamRecipientViewController;
  -[PUPhotoStreamRecipientViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PUPhotoStreamRecipientViewController _searchForRecipientWithText:](self, "_searchForRecipientWithText:", &stru_1E58AD278);
  -[CNComposeRecipientTextView reflow](self->_recipientView, "reflow");
  -[CNComposeRecipientTextView textView](self->_recipientView, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PUPhotoStreamRecipientViewController;
  -[PUPhotoStreamRecipientViewController viewWillAppear:](&v15, sel_viewWillAppear_, a3);
  -[PUPhotoStreamRecipientViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[PUPhotoStreamRecipientViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

}

- (void)makeRecipientViewResignFirstResponder
{
  id v2;

  -[CNComposeRecipientTextView textView](self->_recipientView, "textView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)makeRecipientViewFirstResponder
{
  id v2;

  -[CNComposeRecipientTextView textView](self->_recipientView, "textView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat height;
  _QWORD v14[5];
  CGRect v15;
  CGFloat width;
  CGFloat v17;
  CGRect v18;
  CGRect remainder;
  CGRect slice;
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)PUPhotoStreamRecipientViewController;
  -[PUPhotoStreamRecipientViewController viewWillLayoutSubviews](&v21, sel_viewWillLayoutSubviews);
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  self->_lastHeight = fmin(self->_recipientViewSize.height, 88.0);
  -[PUPhotoStreamRecipientViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v22.size.height = v11 - v12;
  v22.origin.y = v7 + v12;
  v22.origin.x = v5;
  v22.size.width = v9;
  CGRectDivide(v22, &slice, &remainder, self->_lastHeight, CGRectMinYEdge);
  v14[1] = 3221225472;
  v15 = slice;
  height = self->_recipientViewSize.height;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[2] = __62__PUPhotoStreamRecipientViewController_viewWillLayoutSubviews__block_invoke;
  v14[3] = &unk_1E58A59F0;
  v14[4] = self;
  width = slice.size.width;
  v17 = height;
  v18 = remainder;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v14, 0.25);

}

- (NSArray)recipients
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CNComposeRecipientTextView recipients](self->_recipientView, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        +[PUPhotoStreamRecipientViewController _bestMessagingTransportForComposeRecipient:](PUPhotoStreamRecipientViewController, "_bestMessagingTransportForComposeRecipient:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc(MEMORY[0x1E0D7B960]);
        if (v10)
        {
          objc_msgSend(v10, "address");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v10, "addressKind");
          v14 = v11;
          v15 = v12;
        }
        else
        {
          objc_msgSend(v9, "address");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v11;
          v15 = v12;
          v13 = 0;
        }
        v16 = (void *)objc_msgSend(v14, "initWithAddress:nameComponents:recipientKind:", v15, 0, v13);

        objc_msgSend(v3, "addObject:", v16);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (CNContactStore)contactStore
{
  NSObject *v3;
  void *v4;
  CNContactStore *v5;
  CNContactStore *contactStore;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 1) > 1)
  {
    if (!self->_contactStore)
    {
      v5 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
      contactStore = self->_contactStore;
      self->_contactStore = v5;

    }
  }
  else
  {
    PLUIGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_ERROR, "We should never attempt to access the contact store when it isn't authorized.  %@", (uint8_t *)&v8, 0xCu);

    }
  }
  return self->_contactStore;
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id *p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained(p_delegate);
    objc_msgSend(v8, "recipientViewControllerDidAddRecipient:", self);

  }
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v6;
  void *v7;
  NSNumber *currentSearchTaskID;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "clearText");
  if (objc_msgSend(v6, "length"))
  {
    -[PUPhotoStreamRecipientViewController composeRecipientView:composeRecipientForAddress:](self, "composeRecipientView:composeRecipientForAddress:", v9, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v9, "addRecipient:", v7);

  }
  if (self->_currentSearchTaskID)
  {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:");
    currentSearchTaskID = self->_currentSearchTaskID;
    self->_currentSearchTaskID = 0;

  }
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id *p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained(p_delegate);
    objc_msgSend(v8, "recipientViewControllerDidAddRecipient:", self);

  }
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  -[PUPhotoStreamRecipientViewController _searchForRecipientWithText:](self, "_searchForRecipientWithText:");
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(v7, "recipientViewController:didEnterText:", self, v8);

  }
}

- (void)composeRecipientView:(id)a3 didChangeSize:(CGSize)a4
{
  double height;
  CGFloat width;
  void *v7;
  double v8;
  void *v9;

  height = a4.height;
  width = a4.width;
  -[CNComposeRecipientTextView window](self->_recipientView, "window", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CNComposeRecipientTextView frame](self->_recipientView, "frame");
    if (v8 != height)
    {
      self->_recipientViewSize.width = width;
      self->_recipientViewSize.height = height;
      -[PUPhotoStreamRecipientViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNeedsLayout");

      -[CNComposeRecipientTextView setNeedsUpdateConstraints](self->_recipientView, "setNeedsUpdateConstraints");
    }
  }
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id WeakRetained;
  CNContactPickerViewController *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CNContactPickerViewController *contactPickerPresentedController;
  CNContactPickerViewController *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(&self->_delegate);

  if (WeakRetained)
  {
    v5 = (CNContactPickerViewController *)objc_alloc_init(MEMORY[0x1E0C974B0]);
    -[CNContactPickerViewController setDelegate:](v5, "setDelegate:", self);
    v6 = *MEMORY[0x1E0C966A8];
    v17[0] = *MEMORY[0x1E0C967C0];
    v17[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerViewController setDisplayedPropertyKeys:](v5, "setDisplayedPropertyKeys:", v7);

    -[CNContactPickerViewController setAllowsEditing:](v5, "setAllowsEditing:", 0);
    PLLocalizedFrameworkString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerViewController setPrompt:](v5, "setPrompt:", v8);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(emailAddresses.@count == 1 AND phoneNumbers.@count == 0) OR (emailAddresses.@count == 0 AND phoneNumbers.@count == 1)"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPickerViewController setPredicateForSelectionOfContact:](v5, "setPredicateForSelectionOfContact:", v9);

    -[CNContactPickerViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 7);
    -[PUPhotoStreamRecipientViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "effectiveUserInterfaceLayoutDirection");

    if (v11)
      v12 = 4;
    else
      v12 = 8;
    -[CNContactPickerViewController popoverPresentationController](v5, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPermittedArrowDirections:", v12);
    objc_msgSend(v13, "setDelegate:", self);
    -[PUPhotoStreamRecipientViewController _dismissContactPicker](self, "_dismissContactPicker");
    contactPickerPresentedController = self->_contactPickerPresentedController;
    self->_contactPickerPresentedController = v5;
    v15 = v5;

    -[PUPhotoStreamRecipientViewController parentViewController](self, "parentViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentViewController:animated:completion:", v15, 1, 0);

  }
}

- (void)composeRecipientView:(id)a3 showPersonCardForAtom:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v6 = (void *)MEMORY[0x1E0D7B6B8];
  v7 = a4;
  objc_msgSend(v6, "sharedContactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contactsMatchingEmailAddress:keysToFetch:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = v13;
LABEL_4:
    objc_msgSend(v9, "labeledValueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _ViewControllerForContact((uint64_t)v15, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contactsMatchingPhoneNumber:keysToFetch:", v17, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0C97200], "em_contactFromEmailAddress:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForUnknownContact:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v15, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "length"))
    objc_msgSend(v19, "setPrimaryPropertyKey:", *MEMORY[0x1E0C966A8]);
  objc_msgSend(v19, "setAllowsActions:", 0);
LABEL_5:

  if (v19)
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);

    if (WeakRetained)
    {
      objc_msgSend(v23, "navTitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTitle:", v21);

      objc_msgSend(v19, "setModalPresentationStyle:", 3);
      -[PUPhotoStreamRecipientViewController navigationController](self, "navigationController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "pushViewController:animated:", v19, 1);

    }
  }

}

- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4
{
  void *v5;
  CNAutocompleteResultsTableViewController *searchResultsTableViewController;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "recipient", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  searchResultsTableViewController = self->_searchResultsTableViewController;
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultsTableViewController updateRecipients:disambiguatingRecipient:](searchResultsTableViewController, "updateRecipients:disambiguatingRecipient:", v7, v5);

}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL8 v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7B6B8], "sharedContactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v7, "unifiedContactWithIdentifier:keysToFetch:error:", v4, v6, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;

  if (v9)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[PUPhotoStreamRecipientViewController composeRecipientView:composeRecipientForAddress:]";
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "%s: Error while fetching contact: %@", buf, 0x16u);
    }

  }
  v11 = objc_msgSend(MEMORY[0x1E0D7B888], "px_recipientKindFromString:", v4) != 1;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13688]), "initWithContact:address:kind:", v8, v4, v11);

  return v12;
}

- (void)_searchForRecipientWithText:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSNumber *v7;
  NSNumber *currentSearchTaskID;
  id v9;

  v9 = a3;
  -[PUPhotoStreamRecipientViewController _searchManager](self, "_searchManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_currentSearchTaskID)
    objc_msgSend(v4, "cancelTaskWithID:");
  if (objc_msgSend(v9, "length"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D135B0]);
    objc_msgSend(v6, "setBundleIdentifiers:", &unk_1E59BA588);
    objc_msgSend(v5, "searchForText:withAutocompleteFetchContext:consumer:", v9, v6, self);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    currentSearchTaskID = self->_currentSearchTaskID;
    self->_currentSearchTaskID = v7;

  }
  else
  {
    -[CNAutocompleteResultsTableViewController setRecipients:](self->_searchResultsTableViewController, "setRecipients:", 0);
  }

}

- (id)_searchManager
{
  CNAutocompleteSearchManager *searchManager;
  CNAutocompleteSearchManager *v4;
  CNAutocompleteSearchManager *v5;

  searchManager = self->_searchManager;
  if (!searchManager)
  {
    v4 = (CNAutocompleteSearchManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13658]), "initWithAutocompleteSearchType:", 4);
    v5 = self->_searchManager;
    self->_searchManager = v4;

    -[CNAutocompleteSearchManager setSearchTypes:](self->_searchManager, "setSearchTypes:", 3);
    searchManager = self->_searchManager;
  }
  return searchManager;
}

- (void)finishedSearchingForAutocompleteResults
{
  NSNumber *currentSearchTaskID;

  currentSearchTaskID = self->_currentSearchTaskID;
  self->_currentSearchTaskID = 0;

}

- (id)_selectedNormalizedPhoneForRecipient:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "kind") == 1)
  {
    objc_msgSend(v3, "normalizedAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_setSearchResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        -[PUPhotoStreamRecipientViewController _selectedNormalizedPhoneForRecipient:](self, "_selectedNormalizedPhoneForRecipient:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10), (_QWORD)v18);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
        {
          v13 = (void *)MEMORY[0x1AF4295E0](v11, 0, 1);
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  v14 = objc_msgSend(v5, "count");
  PLPhotoSharingGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    v17 = v5;
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEFAULT, "Querying status for phone numbers: %@", buf, 0xCu);
      v17 = v5;
    }
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEFAULT, "Stop querying status for phone numbers", buf, 2u);
    }
    v17 = 0;
  }

  -[IDSBatchIDQueryController setDestinations:](self->_idsBatchIDQueryController, "setDestinations:", v17);
  -[CNAutocompleteResultsTableViewController setRecipients:](self->_searchResultsTableViewController, "setRecipients:", v6);

}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  _QWORD v17[6];
  _BYTE buf[24];
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "Error updating IDS destinations %@ : %@", buf, 0x16u);
    }

  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v19 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __103__PUPhotoStreamRecipientViewController_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke;
    v17[3] = &unk_1E58A5A18;
    v17[4] = self;
    v17[5] = buf;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v17);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      PLPhotoSharingGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEFAULT, "Invalidate results table address tint colors", v16, 2u);
      }

      -[CNAutocompleteResultsTableViewController invalidateAddressTintColors](self->_searchResultsTableViewController, "invalidateAddressTintColors");
    }
    _Block_object_dispose(buf, 8);
  }

}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CNComposeRecipientTextView recipients](self->_recipientView, "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PXComposeRecipientsContainsComposeRecipient();

  if (v8)
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "Ignored attempt to add a recipient again: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    -[CNComposeRecipientTextView addRecipient:](self->_recipientView, "addRecipient:", v6);
    -[CNComposeRecipientTextView clearText](self->_recipientView, "clearText");
    -[CNComposeRecipientTextView reflow](self->_recipientView, "reflow");
    -[PUPhotoStreamRecipientViewController _searchForRecipientWithText:](self, "_searchForRecipientWithText:", &stru_1E58AD278);
  }

}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  objc_msgSend(v5, "contact");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labeledValueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _ViewControllerForContact((uint64_t)v9, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setModalPresentationStyle:", 3);
  -[PUPhotoStreamRecipientViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v7, 1);

}

- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a5;
  -[PUPhotoStreamRecipientViewController _selectedNormalizedPhoneForRecipient:](self, "_selectedNormalizedPhoneForRecipient:", a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x1AF4295E0](v7, 0, 1);
    if (v9 && -[NSMutableSet containsObject:](self->_validPhoneNumbers, "containsObject:", v9))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v10);

    }
  }

}

- (void)_addRecipientForContact:(id)a3 address:(id)a4 kind:(unint64_t)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0D13688];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithContact:address:kind:", v10, v9, a5);

  -[CNComposeRecipientTextView recipients](self->_recipientView, "recipients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = PXComposeRecipientsContainsComposeRecipient();

  if ((_DWORD)v8)
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_DEFAULT, "Ignored attempt to add a recipient again: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  else
  {
    -[CNComposeRecipientTextView addRecipient:](self->_recipientView, "addRecipient:", v11);
  }

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  if (a4)
  {
    v5 = a4;
    objc_msgSend(v5, "emailAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(v5, "emailAddresses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
    }
    else
    {
      objc_msgSend(v5, "phoneNumbers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 1;
    }

    -[PUPhotoStreamRecipientViewController _addRecipientForContact:address:kind:](self, "_addRecipientForContact:address:kind:", v5, v10, v11);
  }
  -[PUPhotoStreamRecipientViewController _dismissContactPicker](self, "_dismissContactPicker", a3);
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  id v22;

  v22 = a4;
  objc_msgSend(v22, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C966A8]);

  objc_msgSend(v22, "value");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v7)
  {
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_7:
        objc_msgSend(v9, "stringValue");
        v11 = v9;
        v10 = 1;
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "px_descriptionForAssertionMessage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoStreamRecipientViewController.m"), 597, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("contactProperty.value"), v19, v21);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoStreamRecipientViewController.m"), 597, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("contactProperty.value"), v19);
    }

    goto LABEL_7;
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoStreamRecipientViewController.m"), 594, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("contactProperty.value"), v14);
LABEL_12:

    v10 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoStreamRecipientViewController.m"), 594, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("contactProperty.value"), v14, v16);

    goto LABEL_12;
  }
  v10 = 0;
LABEL_9:
  objc_msgSend(v22, "contact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamRecipientViewController _addRecipientForContact:address:kind:](self, "_addRecipientForContact:address:kind:", v12, v9, v10);

  -[PUPhotoStreamRecipientViewController _dismissContactPicker](self, "_dismissContactPicker");
}

- (void)_dismissContactPicker
{
  CNContactPickerViewController *v3;
  CNContactPickerViewController *contactPickerPresentedController;
  void *v5;
  CNContactPickerViewController *v6;

  if (self->_contactPickerPresentedController)
  {
    -[PUPhotoStreamRecipientViewController presentedViewController](self, "presentedViewController");
    v3 = (CNContactPickerViewController *)objc_claimAutoreleasedReturnValue();
    contactPickerPresentedController = self->_contactPickerPresentedController;

    if (v3 == contactPickerPresentedController)
      -[PUPhotoStreamRecipientViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    -[CNContactPickerViewController popoverPresentationController](self->_contactPickerPresentedController, "popoverPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", 0);

    v6 = self->_contactPickerPresentedController;
    self->_contactPickerPresentedController = 0;

  }
}

- (void)prepareForPopoverPresentation:(id)a3
{
  CNContactPickerViewController *v4;
  CNContactPickerViewController *contactPickerPresentedController;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "presentedViewController");
  v4 = (CNContactPickerViewController *)objc_claimAutoreleasedReturnValue();
  contactPickerPresentedController = self->_contactPickerPresentedController;

  if (v4 == contactPickerPresentedController)
  {
    -[CNComposeRecipientTextView addButton](self->_recipientView, "addButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSourceView:", v6);
    objc_msgSend(v6, "bounds");
    objc_msgSend(v7, "setSourceRect:");

  }
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  CNContactPickerViewController *contactPickerPresentedController;
  id v4;

  contactPickerPresentedController = self->_contactPickerPresentedController;
  self->_contactPickerPresentedController = 0;
  v4 = a3;

  objc_msgSend(v4, "setDelegate:", 0);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (double)bottomTableOffset
{
  return self->_bottomTableOffset;
}

- (void)setBottomTableOffset:(double)a3
{
  self->_bottomTableOffset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactPickerPresentedController, 0);
  objc_storeStrong((id *)&self->_validPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_idsBatchIDQueryController, 0);
  objc_storeStrong((id *)&self->_currentSearchTaskID, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_recipientContainerView, 0);
  objc_storeStrong((id *)&self->_recipientView, 0);
  objc_storeStrong((id *)&self->_searchResultsTableViewController, 0);
}

void __103__PUPhotoStreamRecipientViewController_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLPhotoSharingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "IDS status update for %@: %@", (uint8_t *)&v8, 0x16u);
  }

  if (objc_msgSend(v6, "integerValue") == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "addObject:", v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __62__PUPhotoStreamRecipientViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setContentSize:", *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setFrame:", 0.0, 0.0, *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "contentSize");
  v3 = v2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "bounds");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setContentOffset:animated:", 1, 0.0, v3 - v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  if (*(double *)(*(_QWORD *)(a1 + 32) + 1072) > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      objc_msgSend(v7, "contentInset");
      objc_msgSend(v7, "setContentInset:");
      objc_msgSend(v7, "verticalScrollIndicatorInsets");
      objc_msgSend(v7, "setVerticalScrollIndicatorInsets:");
    }
  }

}

+ (id)_bestMessagingTransportForComposeRecipient:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  void *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUPhotoStreamRecipientViewController.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composeRecipient"));

  }
  objc_msgSend(v5, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "address");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v6)
  {
    if (v7)
    {
      v12 = objc_msgSend(MEMORY[0x1E0D7B888], "px_recipientKindFromString:", v7);
      if (v12)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B880]), "initWithAddress:addressKind:", v8, v12);
        goto LABEL_14;
      }
      PLUIGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v8;
        v14 = "The result for best messaging transport address:%@ is invalid";
        goto LABEL_12;
      }
    }
    else
    {
      PLUIGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v5;
        v14 = "The result for best messaging transport recipient:%@ is invalid";
LABEL_12:
        _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
      }
    }

    v11 = 0;
    goto LABEL_14;
  }
  v9 = (void *)MEMORY[0x1E0D7B888];
  objc_msgSend(v5, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_bestMessagingTransportForContact:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v11;
}

@end
