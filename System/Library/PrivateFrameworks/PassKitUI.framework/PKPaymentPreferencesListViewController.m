@implementation PKPaymentPreferencesListViewController

- (PKPaymentPreferencesListViewController)initWithPreferences:(id)a3 title:(id)a4 style:(int64_t)a5 handler:(id)a6 contactFormatValidator:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKPaymentPreferencesListViewController *v17;
  PKPaymentPreferencesListViewController *v18;
  void *v19;
  id handler;
  objc_super v22;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentPreferencesListViewController;
  v17 = -[PKDynamicCollectionViewController init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    v22.receiver = v17;
    v22.super_class = (Class)PKPaymentPreferencesListViewController;
    -[PKPaymentPreferencesListViewController setTitle:](&v22, sel_setTitle_, v14);
    objc_storeStrong((id *)&v18->_preferences, a3);
    v19 = _Block_copy(v15);
    handler = v18->_handler;
    v18->_handler = v19;

    objc_storeStrong((id *)&v18->_contactFormatValidator, a7);
    v18->_style = a5;
    -[PKPaymentPreferencesListViewController _setupSectionControllers](v18, "_setupSectionControllers");
  }

  return v18;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPreferencesListViewController;
  -[PKDynamicCollectionViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsSelectionDuringEditing:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPreferencesListViewController;
  -[PKDynamicCollectionViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  v3 = (void *)MEMORY[0x1E0D66A58];
  v4 = *MEMORY[0x1E0D698F8];
  v5 = *MEMORY[0x1E0D68F50];
  v9[0] = *MEMORY[0x1E0D68AA0];
  v9[1] = v5;
  v6 = *MEMORY[0x1E0D69100];
  v10[0] = *MEMORY[0x1E0D68C50];
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subject:sendEvent:", v4, v7);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferencesListViewController;
  -[PKDynamicCollectionViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__keyboardDidShow_, *MEMORY[0x1E0DC4E70], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  -[PKPaymentPreferencesListViewController _updateNavigationBarButtons](self, "_updateNavigationBarButtons");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPreferencesListViewController;
  -[PKPaymentPreferencesListViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  -[PKPaymentPreferencesListViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5 = (void *)MEMORY[0x1E0D66A58];
  v6 = *MEMORY[0x1E0D698F8];
  v7 = *MEMORY[0x1E0D68F50];
  v11[0] = *MEMORY[0x1E0D68AA0];
  v11[1] = v7;
  v8 = *MEMORY[0x1E0D69100];
  v12[0] = *MEMORY[0x1E0D68C58];
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject:sendEvent:", v6, v9);

}

- (void)_updateNavigationBarButtons
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PKPaymentPreferencesListViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", 0);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_preferences;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "supportsDeletion", (_QWORD)v14))
        {
          if ((objc_msgSend(v9, "isReadOnly") & 1) == 0)
          {
            objc_msgSend(v9, "preferences");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "count");

            if (v11)
            {
              -[PKPaymentPreferencesListViewController navigationItem](self, "navigationItem");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPaymentPreferencesListViewController editButtonItem](self, "editButtonItem");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setRightBarButtonItem:", v13);

              goto LABEL_13;
            }
          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  PKPaymentPreferenceOptionListItem *editingItem;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPreferencesListViewController;
  -[PKDynamicCollectionViewController setEditing:animated:](&v7, sel_setEditing_animated_, a3, a4);
  if (!a3)
  {
    -[PKPaymentPreferencesListViewController _endCurrentInlineEditing](self, "_endCurrentInlineEditing");
    editingItem = self->_editingItem;
    self->_editingItem = 0;

  }
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
  -[PKPaymentPreferencesListViewController _setupSectionControllers](self, "_setupSectionControllers");
}

- (void)_setupSectionControllers
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  PKPaymentPreferenceContactSectionController *v9;
  void *v10;
  void *v11;
  NSArray *obj;
  _QWORD aBlock[4];
  id v14;
  id location;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_preferences;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_initWeak(&location, self);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __66__PKPaymentPreferencesListViewController__setupSectionControllers__block_invoke;
        aBlock[3] = &unk_1E3E7A550;
        objc_copyWeak(&v14, &location);
        v8 = _Block_copy(aBlock);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = -[PKPaymentPreferenceContactSectionController initWithContactPreference:contactFormatValidator:style:preferencesChangedHandler:]([PKPaymentPreferenceContactSectionController alloc], "initWithContactPreference:contactFormatValidator:style:preferencesChangedHandler:", v7, self->_contactFormatValidator, self->_style, v8);
          -[PKPaymentPreferenceContactSectionController setContactDelegate:](v9, "setContactDelegate:", self);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v9 = -[PKPaymentPreferenceSectionController initWithPreference:style:preferencesChangedHandler:]([PKPaymentPreferenceCardSectionController alloc], "initWithPreference:style:preferencesChangedHandler:", v7, self->_style, v8);
          else
            v9 = 0;
        }
        -[PKPaymentPreferenceSectionController setDelegate:](v9, "setDelegate:", self);
        objc_msgSend(v3, "addObject:", v9);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  if (self->_preferenceHasSeparateAddItemsSection && objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLinkedSectionController:", v10);

  }
  -[PKDynamicCollectionViewController setSections:animated:](self, "setSections:animated:", v3, 0);

}

void __66__PKPaymentPreferencesListViewController__setupSectionControllers__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_reloadEditedSection:", v3);

}

- (void)_keyboardDidShow:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  double MaxY;
  double v27;
  void *v28;
  void *v29;
  id v30;
  CGRect v31;
  CGRect v32;

  objc_msgSend(a3, "userInfo");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = *MEMORY[0x1E0DC49E8];
  v14 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v15 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[PKPaymentPreferencesListViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertRect:fromView:", 0, v6, v8, v10, v12);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  MaxY = CGRectGetMaxY(v31);
  v32.origin.x = v18;
  v32.origin.y = v20;
  v32.size.width = v22;
  v32.size.height = v24;
  v27 = MaxY - CGRectGetMinY(v32) + 10.0;

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setContentInset:", v13, v14, v27, v15);

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setScrollIndicatorInsets:", v13, v14, v27, v15);

}

- (void)_keyboardWillHide:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[PKDynamicCollectionViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC49E8];
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v8 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  objc_msgSend(v4, "setContentInset:", *MEMORY[0x1E0DC49E8], v6, v7, v8);

  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScrollIndicatorInsets:", v5, v6, v7, v8);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "deselectItemAtIndexPath:animated:", v6, 1);
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPreferencesListViewController;
  -[PKDynamicCollectionViewController collectionView:didSelectItemAtIndexPath:](&v8, sel_collectionView_didSelectItemAtIndexPath_, v7, v6);

}

- (BOOL)collectionViewIsEditingForSectionController:(id)a3
{
  void *v3;
  char v4;

  -[PKDynamicCollectionViewController collectionView](self, "collectionView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditing");

  return v4;
}

- (void)presentHideMyEmailAlertController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedHideMyEmailString(CFSTR("HME_2FA_ALERT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedHideMyEmailString(CFSTR("HME_2FA_ALERT_DESCRIPTION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("CANCEL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v8);

  v9 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("CONTINUE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, &__block_literal_global_233);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addAction:", v11);
  objc_msgSend(v12, "setPreferredAction:", v11);
  -[PKPaymentPreferencesListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

}

void __75__PKPaymentPreferencesListViewController_presentHideMyEmailAlertController__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E98]);
  v2 = (id)objc_msgSend(v0, "initWithString:", *MEMORY[0x1E0D6A160]);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "openSensitiveURL:withOptions:", v2, 0);

  }
}

- (void)showAddressEditorForContactItem:(id)a3 inSectionController:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  PKAddressEditorViewController *v13;
  PKAddressEditorViewController *v14;
  void *v15;
  PKAddressEditorViewController *v16;
  void *v17;
  PKBlurredContainerNavigationController *v18;
  id v19;

  v19 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_editingContactSectionController, a4);
  objc_storeStrong((id *)&self->_editingItem, a3);
  objc_msgSend(v19, "contactPreference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactPreference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorsForPreference:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  -[PKPaymentPreferencesListViewController _requiredKeysForContactPreference:](self, "_requiredKeysForContactPreference:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [PKAddressEditorViewController alloc];
  v14 = v13;
  if (v11)
  {
    objc_msgSend(v9, "errorsForPreference:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PKAddressEditorViewController initWithContact:requiredKeys:highlightedKeys:errors:style:](v14, "initWithContact:requiredKeys:highlightedKeys:errors:style:", v8, v12, 0, v15, 1);

  }
  else
  {
    v16 = -[PKAddressEditorViewController initWithContact:requiredKeys:highlightedKeys:errors:style:](v13, "initWithContact:requiredKeys:highlightedKeys:errors:style:", v8, v12, 0, 0, 1);
  }
  -[PKAddressEditorViewController setDelegate:](v16, "setDelegate:", self);
  objc_msgSend(v9, "editExistingTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddressEditorViewController setTitle:](v16, "setTitle:", v17);

  -[PKAddressEditorViewController setContactFormatValidator:](v16, "setContactFormatValidator:", self->_contactFormatValidator);
  v18 = -[PKBlurredContainerNavigationController initWithRootViewController:]([PKBlurredContainerNavigationController alloc], "initWithRootViewController:", v16);
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKBlurredContainerNavigationController setModalPresentationStyle:](v18, "setModalPresentationStyle:", 2);
  }
  -[PKPaymentPreferencesListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);

}

- (void)showAddressPickerForPreference:(id)a3 inSectionController:(id)a4
{
  id v6;
  NSString *v7;
  PKAddressSearcherViewController *v8;
  void *v9;
  void *v10;
  PKBlurredContainerNavigationController *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (PKUIStoreDemoGatewayWithViewController(self))
  {
    objc_storeStrong((id *)&self->_editingContactSectionController, a4);
    objc_msgSend(v13, "addNewTitle");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKAddressSearcherViewController initWithStyle:]([PKAddressSearcherViewController alloc], "initWithStyle:", 1);
    -[PKPaymentPreferencesListViewController _requiredKeysForContactPreference:](self, "_requiredKeysForContactPreference:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddressSearcherViewController setRequiredKeys:](v8, "setRequiredKeys:", v9);

    PKLocalizedPaymentString(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddressSearcherViewController setTitle:](v8, "setTitle:", v10);

    -[PKAddressSearcherViewController setDelegate:](v8, "setDelegate:", self);
    -[PKAddressSearcherViewController setContactFormatValidator:](v8, "setContactFormatValidator:", self->_contactFormatValidator);
    v11 = -[PKBlurredContainerNavigationController initWithRootViewController:]([PKBlurredContainerNavigationController alloc], "initWithRootViewController:", v8);
    if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      -[PKBlurredContainerNavigationController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 2);
      objc_msgSend(MEMORY[0x1E0DC3F20], "defaultFormSheetSize");
      -[PKBlurredContainerNavigationController setPreferredContentSize:](v11, "setPreferredContentSize:");
    }
    PKLocalizedPaymentString(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKBlurredContainerNavigationController setTitle:](v11, "setTitle:", v12);

    -[PKPaymentPreferencesListViewController setEditing:](self, "setEditing:", 0);
    -[PKPaymentPreferencesListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

  }
}

- (void)showContactsPickerForPreference:(id)a3 inSectionController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (PKUIStoreDemoGatewayWithViewController(self))
  {
    objc_storeStrong((id *)&self->_editingContactSectionController, a4);
    objc_msgSend(v6, "contactKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(getCNContactPickerViewControllerClass_0());
    if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      objc_msgSend(v9, "setModalPresentationStyle:", 2);
    }
    objc_msgSend(v9, "setDelegate:", self);
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDisplayedPropertyKeys:", v10);

    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C966A8]) & 1) != 0)
    {
      v11 = CFSTR("emailAddresses.@count = 1");
      v12 = CFSTR("emailAddresses.@count > 0");
    }
    else if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C967F0]) & 1) != 0)
    {
      v11 = CFSTR("postalAddresses.@count = 1");
      v12 = CFSTR("postalAddresses.@count > 0");
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C967C0]))
      {
LABEL_11:
        -[PKPaymentPreferencesListViewController setEditing:](self, "setEditing:", 0);
        -[PKPaymentPreferencesListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

        goto LABEL_12;
      }
      v11 = CFSTR("phoneNumbers.@count = 1");
      v12 = CFSTR("phoneNumbers.@count > 0");
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicateForEnablingContact:", v13);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicateForSelectionOfContact:", v14);

    goto LABEL_11;
  }
LABEL_12:

}

- (void)presentMeCardAlertControllerWithContact:(id)a3 contactKey:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  const __CFString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v7 = a4;
  v8 = a5;
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C966A8]) & 1) != 0)
  {
    v9 = CFSTR("EMAIL");
  }
  else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    v9 = CFSTR("PHONE");
  }
  else
  {
    v9 = CFSTR("ADDRESS");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IN_APP_PAYMENT_OPTIONS_EDIT_ME_CARD_%@_NO_LABEL"), v9);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_OPTIONS_EDIT_ME_CARD_TITLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v13, v11, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IN_APP_PAYMENT_OPTIONS_CHANGE_%@"), v9);
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __101__PKPaymentPreferencesListViewController_presentMeCardAlertControllerWithContact_contactKey_handler___block_invoke;
  v23[3] = &unk_1E3E61CA8;
  v24 = v8;
  v18 = v8;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 2, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v19);

  v20 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("CANCEL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v22);

  -[PKPaymentPreferencesListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

uint64_t __101__PKPaymentPreferencesListViewController_presentMeCardAlertControllerWithContact_contactKey_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startInlineEditingForContactItem:(id)a3 inSectionController:(id)a4
{
  PKPaymentPreferenceOptionListItem *v6;
  PKPaymentPreferenceContactSectionController *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  PKPaymentPreferenceOptionListItem *editingItem;
  PKPaymentPreferenceOptionListItem *v23;
  PKPaymentPreferenceContactSectionController *editingContactSectionController;
  id v25;

  v6 = (PKPaymentPreferenceOptionListItem *)a3;
  v7 = (PKPaymentPreferenceContactSectionController *)a4;
  if ((-[PKPaymentPreferencesListViewController isEditing](self, "isEditing") & 1) == 0)
    -[PKPaymentPreferencesListViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
  -[PKPaymentPreferencesListViewController _endCurrentInlineEditing](self, "_endCurrentInlineEditing");
  if (v6)
  {
    -[PKPaymentPreferenceContactSectionController contactItems](v7, "contactItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", v6);
  }
  else
  {
    -[PKPaymentPreferenceSectionController appendNewItemForEditing](v7, "appendNewItemForEditing");
    v6 = (PKPaymentPreferenceOptionListItem *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPreferenceSectionController preference](v7, "preference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isHideMyEmail");

    if (v13)
      v14 = 2;
    else
      v14 = 1;
    -[PKPaymentPreferenceSectionController preference](v7, "preference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count") == v14)
    {
      v9 = 0;
    }
    else
    {
      -[PKPaymentPreferenceSectionController preference](v7, "preference");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "preferences");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v17, "count") - v14;

    }
  }

  -[PKDynamicCollectionViewController sections](self, "sections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "indexOfObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, v19);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cellForItemAtIndexPath:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "beginEditing");
  editingItem = self->_editingItem;
  self->_editingItem = v6;
  v23 = v6;

  editingContactSectionController = self->_editingContactSectionController;
  self->_editingContactSectionController = v7;

}

- (void)_reloadEditedSection:(id)a3
{
  void (**handler)(id, PKPaymentPreferencesListViewController *, NSArray *);
  void *v5;
  id v6;

  v6 = a3;
  -[PKPaymentPreferencesListViewController _updateNavigationBarButtons](self, "_updateNavigationBarButtons");
  handler = (void (**)(id, PKPaymentPreferencesListViewController *, NSArray *))self->_handler;
  if (handler)
    handler[2](handler, self, self->_preferences);
  objc_msgSend(v6, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController reloadDataForSectionIdentifier:animated:](self, "reloadDataForSectionIdentifier:animated:", v5, 1);

}

- (id)_requiredKeysForContactPreference:(id)a3
{
  id v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "contactKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C967F0]);

  if (v6)
  {
    v7 = *MEMORY[0x1E0C970C8];
    v11[0] = *MEMORY[0x1E0D69BD8];
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v8);

    if (objc_msgSend(v3, "showPhoneticName"))
      objc_msgSend(v4, "addObject:", *MEMORY[0x1E0D69BE8]);
  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (void)_handleSelectedContact:(id)a3
{
  PKPaymentPreferenceContactSectionController *editingContactSectionController;
  PKPaymentPreferenceOptionListItem *editingItem;
  uint64_t v5;
  _QWORD v6[5];

  editingContactSectionController = self->_editingContactSectionController;
  editingItem = self->_editingItem;
  v5 = *MEMORY[0x1E0C967F0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PKPaymentPreferencesListViewController__handleSelectedContact___block_invoke;
  v6[3] = &unk_1E3E7A598;
  v6[4] = self;
  -[PKPaymentPreferenceContactSectionController saveContact:forItem:withContactKey:completion:](editingContactSectionController, "saveContact:forItem:withContactKey:completion:", a3, editingItem, v5, v6);
}

uint64_t __65__PKPaymentPreferencesListViewController__handleSelectedContact___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_reloadEditedSection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064));
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__PKPaymentPreferencesListViewController__handleSelectedContact___block_invoke_2;
  v4[3] = &unk_1E3E612E8;
  v4[4] = v2;
  return objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v4);
}

void __65__PKPaymentPreferencesListViewController__handleSelectedContact___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1064);
  *(_QWORD *)(v2 + 1064) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1072);
  *(_QWORD *)(v4 + 1072) = 0;

}

- (void)_endCurrentInlineEditing
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_editingItem && self->_editingContactSectionController)
  {
    -[PKDynamicCollectionViewController sections](self, "sections");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "indexOfObject:", self->_editingContactSectionController);

    -[PKPaymentPreferenceSectionController items](self->_editingContactSectionController, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:", self->_editingItem);

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PKDynamicCollectionViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForItemAtIndexPath:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PKPaymentPreferencesListViewController _updateContactAtIndex:withCell:](self, "_updateContactAtIndex:withCell:", v6, v8);

  }
}

- (void)_updateContactAtIndex:(unint64_t)a3 withCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void (**v26)(_QWORD);
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD aBlock[5];
  id v32;
  id v33;
  id v34;
  unint64_t v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "textFieldText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endEditing");
  -[PKPaymentPreferenceOptionListItem preference](self->_editingItem, "preference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && objc_msgSend(v7, "length"))
  {
    -[PKPaymentPreferenceContactSectionController contactPreference](self->_editingContactSectionController, "contactPreference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contactKey");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    if (objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0C966A8]))
    {
      objc_msgSend(v8, "emailAddresses");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v7);
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "stringValue");
        v15 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v15;
      }
      v7 = v7;

      v29 = v7;
    }
    else if (objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0C967C0]))
    {
      objc_msgSend(v8, "phoneNumbers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v7);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
      v29 = 0;
    }
    v17 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(v12, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "labeledValueWithLabel:value:", v18, v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v46[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v19, v30);

    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__65;
    v44 = __Block_byref_object_dispose__65;
    v45 = 0;
    objc_msgSend(v9, "preferences");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __73__PKPaymentPreferencesListViewController__updateContactAtIndex_withCell___block_invoke;
    v36[3] = &unk_1E3E7A5C0;
    v22 = v10;
    v38 = &v40;
    v39 = a3;
    v37 = v22;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v36);

    if (v41[5])
    {
      -[PKPaymentPreferencesListViewController _resetEditingContact:withCell:forRow:](self, "_resetEditingContact:withCell:forRow:", v8, v6, a3);
      v23 = objc_msgSend(v9, "indexOfContact:", v41[5]);
      v24 = objc_msgSend(v9, "selectedIndex");
      if (v23 != 0x7FFFFFFFFFFFFFFFLL && v24 != v23)
      {
        -[PKPaymentPreferenceSectionController setSelectedIndex:](self->_editingContactSectionController, "setSelectedIndex:", v23);
        -[PKPaymentPreferencesListViewController _reloadEditedSection:](self, "_reloadEditedSection:", self->_editingContactSectionController);
      }
    }
    else
    {
      aBlock[0] = v21;
      aBlock[1] = 3221225472;
      aBlock[2] = __73__PKPaymentPreferencesListViewController__updateContactAtIndex_withCell___block_invoke_2;
      aBlock[3] = &unk_1E3E69CC8;
      aBlock[4] = self;
      v32 = v22;
      v25 = v30;
      v33 = v25;
      v34 = v9;
      v35 = a3;
      v26 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (objc_msgSend(v8, "contactSource") == 1)
      {
        v27 = (void *)objc_msgSend(v26, "copy");
        -[PKPaymentPreferencesListViewController presentMeCardAlertControllerWithContact:contactKey:handler:](self, "presentMeCardAlertControllerWithContact:contactKey:handler:", v8, v25, v27);

      }
      else
      {
        v26[2](v26);
      }

    }
    _Block_object_dispose(&v40, 8);

  }
  else
  {
    -[PKPaymentPreferencesListViewController _resetEditingContact:withCell:forRow:](self, "_resetEditingContact:withCell:forRow:", v8, v6, a3);
  }

}

void __73__PKPaymentPreferencesListViewController__updateContactAtIndex_withCell___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualIgnoringIdentifiers:") && *(_QWORD *)(a1 + 48) != a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __73__PKPaymentPreferencesListViewController__updateContactAtIndex_withCell___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v2 + 1064);
  v5 = *(_QWORD *)(v2 + 1072);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__PKPaymentPreferencesListViewController__updateContactAtIndex_withCell___block_invoke_3;
  v10[3] = &unk_1E3E7A5E8;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v4, "saveContact:forItem:withContactKey:completion:", v3, v5, v6, v10);

}

uint64_t __73__PKPaymentPreferencesListViewController__updateContactAtIndex_withCell___block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "selectedIndex");
  objc_msgSend(*(id *)(a1 + 32), "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v2 == 0x7FFFFFFFFFFFFFFFLL || v2 >= v4)
  {
    if (*(_QWORD *)(a1 + 48) < v4)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1064), "setSelectedIndex:");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "preferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "errorsForPreference:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 && *(_QWORD *)(a1 + 48) < v4)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1064), "setSelectedIndex:");

  }
  return objc_msgSend(*(id *)(a1 + 40), "_reloadEditedSection:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1064));
}

- (void)_resetEditingContact:(id)a3 withCell:(id)a4 forRow:(unint64_t)a5
{
  id v8;

  v8 = a4;
  if (objc_msgSend(a3, "contactSource") == 1)
  {
    objc_msgSend(v8, "resetTextFieldTextFromLabel");
  }
  else
  {
    -[PKPaymentPreferenceContactSectionController deleteItem:forRow:](self->_editingContactSectionController, "deleteItem:forRow:", self->_editingItem, a5);
    -[PKPaymentPreferencesListViewController _reloadEditedSection:](self, "_reloadEditedSection:", self->_editingContactSectionController);
  }

}

- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4
{
  PKPaymentPreferenceContactSectionController *editingContactSectionController;
  PKPaymentPreferenceOptionListItem *editingItem;
  uint64_t v7;
  _QWORD v8[5];

  editingContactSectionController = self->_editingContactSectionController;
  editingItem = self->_editingItem;
  v7 = *MEMORY[0x1E0C967F0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__PKPaymentPreferencesListViewController_addressEditorViewController_selectedContact___block_invoke;
  v8[3] = &unk_1E3E7A598;
  v8[4] = self;
  -[PKPaymentPreferenceContactSectionController saveContact:forItem:withContactKey:completion:](editingContactSectionController, "saveContact:forItem:withContactKey:completion:", a4, editingItem, v7, v8);
}

void __86__PKPaymentPreferencesListViewController_addressEditorViewController_selectedContact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__PKPaymentPreferencesListViewController_addressEditorViewController_selectedContact___block_invoke_2;
  v6[3] = &unk_1E3E61388;
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v6);

}

void __86__PKPaymentPreferencesListViewController_addressEditorViewController_selectedContact___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "handler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064), *(_QWORD *)(a1 + 40));

  }
}

- (void)addressEditorViewControllerDidCancel:(id)a3
{
  -[PKPaymentPreferencesListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)addressSearcherViewController:(id)a3 selectedContact:(id)a4
{
  -[PKPaymentPreferencesListViewController _handleSelectedContact:](self, "_handleSelectedContact:", a4);
  JUMPOUT(0x1A1AE3A74);
}

- (void)addressSearcherViewControllerDidCancel:(id)a3
{
  -[PKPaymentPreferencesListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  -[PKPaymentPreferencesListViewController _handleSelectedContact:](self, "_handleSelectedContact:", a4);
  JUMPOUT(0x1A1AE3A74);
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C97338];
  v6 = a4;
  objc_msgSend(v6, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labeledValueWithLabel:value:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C97360]);
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setValue:forKey:", v11, v12);
  -[PKPaymentPreferencesListViewController _handleSelectedContact:](self, "_handleSelectedContact:", v10);

}

- (NSArray)preferences
{
  return self->_preferences;
}

- (BOOL)preferenceHasSeparateAddItemsSection
{
  return self->_preferenceHasSeparateAddItemsSection;
}

- (void)setPreferenceHasSeparateAddItemsSection:(BOOL)a3
{
  self->_preferenceHasSeparateAddItemsSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_editingItem, 0);
  objc_storeStrong((id *)&self->_editingContactSectionController, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
