@implementation PKDynamicProvisioningFieldsPageViewController

- (PKDynamicProvisioningFieldsPageViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 fieldsPage:(id)a6
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  PKDynamicProvisioningFieldsPageViewController *v24;
  PKDynamicProvisioningFieldsPageViewController *v25;
  id obj;
  id obja;
  id v29;
  id v32;
  id v33;
  objc_super v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;

  v33 = a3;
  v32 = a5;
  obj = a6;
  v29 = a6;
  objc_msgSend(v29, "fieldModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visiblePaymentSetupFields");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v9);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __101__PKDynamicProvisioningFieldsPageViewController_initWithWebService_context_setupDelegate_fieldsPage___block_invoke;
  v35[3] = &unk_1E3E71F90;
  v14 = v13;
  v36 = v14;
  v15 = v11;
  v37 = v15;
  v16 = v12;
  v38 = v16;
  v17 = v10;
  v39 = v17;
  v41 = &v47;
  v18 = v9;
  v40 = v18;
  v42 = &v43;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v35);
  if (!*((_BYTE *)v48 + 24))
  {
    v19 = (void *)objc_msgSend(v14, "copy", obj);
    objc_msgSend(v16, "addObject:", v19);

  }
  if (*((_BYTE *)v44 + 24))
  {
    v20 = objc_alloc(MEMORY[0x1E0D67300]);
    v21 = (void *)objc_msgSend(v17, "copy");
    v22 = (void *)objc_msgSend(v15, "copy");
    v23 = (void *)objc_msgSend(v20, "initWithPaymentSetupFields:footerFields:", v21, v22);

  }
  else
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D67300]), "initWithPaymentSetupFields:", v18);
  }
  v34.receiver = self;
  v34.super_class = (Class)PKDynamicProvisioningFieldsPageViewController;
  v24 = -[PKPaymentSetupFieldsViewController initWithWebService:context:setupDelegate:setupFieldsModel:](&v34, sel_initWithWebService_context_setupDelegate_setupFieldsModel_, v33, a4, v32, v23, obj);
  v25 = v24;
  if (v24)
  {
    -[PKPaymentSetupFieldsViewController setSectionIdentifiers:](v24, "setSectionIdentifiers:", v16);
    objc_storeStrong((id *)&v25->_fieldsPage, obja);
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v25;
}

void __101__PKDynamicProvisioningFieldsPageViewController_initWithWebService_context_setupDelegate_fieldsPage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  if (objc_msgSend(v17, "isFieldTypeLabel"))
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = *(void **)(a1 + 40);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v17, 0);
      objc_msgSend(v7, "setValue:forKey:", v8, v6);

      v9 = *(void **)(a1 + 48);
      v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      objc_msgSend(v9, "addObject:", v10);

      objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 56), "removeObject:", v17);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 64), "count") - 1 == a3;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v17);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 64), "count") - 1 == a3;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      }
      else
      {
        v16 = *(void **)(a1 + 32);
        objc_msgSend(v17, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v15);
      }

    }
    goto LABEL_10;
  }
  v11 = objc_msgSend(v17, "isFieldTypeFooter");
  v12 = v17;
  if ((v11 & 1) == 0)
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v17, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v6);
LABEL_10:

    v12 = v17;
  }

}

- (void)viewDidLoad
{
  UIBarButtonItem *v3;
  UIBarButtonItem *cancelButton;
  void *v5;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)PKDynamicProvisioningFieldsPageViewController;
  -[PKPaymentSetupFieldsViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKPaymentSetupFieldsViewController setHidesBackButton:animated:](self, "setHidesBackButton:animated:", 1, 0);
  v3 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_handleCancelTapped);
  cancelButton = self->_cancelButton;
  self->_cancelButton = v3;

  -[UIBarButtonItem setAccessibilityIdentifier:](self->_cancelButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67AF8]);
  v7[0] = self->_cancelButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController _setLeftBarButtonItems:animated:](self, "_setLeftBarButtonItems:animated:", v5, 0);

}

- (void)handleCancelTapped
{
  -[PKDynamicProvisioningFieldsPageViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)showSpinner:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *hiddenRightBarButtonItem;
  UIActivityIndicatorView *v14;
  UIActivityIndicatorView *activityIndicatorView;
  UIBarButtonItem *v16;
  UIBarButtonItem *spinningNavBarItem;
  id v18;

  if (self->_isLoading != a3)
  {
    self->_isLoading = a3;
    v4 = !a3;
    -[PKDynamicProvisioningFieldsPageViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[PKDynamicProvisioningFieldsPageViewController view](self, "view");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v8;

    objc_msgSend(v18, "setUserInteractionEnabled:", v4);
    -[PKPaymentSetupTableViewController dockView](self, "dockView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setButtonsEnabled:", v4);

    -[PKDynamicProvisioningFieldsPageViewController _setNavigationBarEnabled:](self, "_setNavigationBarEnabled:", v4);
    -[PKDynamicProvisioningFieldsPageViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (self->_isLoading)
    {
      self->_backHidden = objc_msgSend(v10, "hidesBackButton");
      objc_msgSend(v11, "rightBarButtonItem");
      v12 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
      hiddenRightBarButtonItem = self->_hiddenRightBarButtonItem;
      self->_hiddenRightBarButtonItem = v12;

      if (!self->_spinningNavBarItem)
      {
        v14 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        activityIndicatorView = self->_activityIndicatorView;
        self->_activityIndicatorView = v14;

        v16 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_activityIndicatorView);
        spinningNavBarItem = self->_spinningNavBarItem;
        self->_spinningNavBarItem = v16;

      }
      -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
      objc_msgSend(v11, "setRightBarButtonItem:", self->_spinningNavBarItem);
      objc_msgSend(v11, "setHidesBackButton:", 1);
    }
    else
    {
      -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
      objc_msgSend(v11, "setRightBarButtonItem:", self->_hiddenRightBarButtonItem);
      objc_msgSend(v11, "setHidesBackButton:", self->_backHidden);
      -[UIBarButtonItem setEnabled:](self->_hiddenRightBarButtonItem, "setEnabled:", -[PKPaymentSetupFieldsViewController isComplete](self, "isComplete"));
    }
    objc_msgSend(v18, "setNeedsLayout");

  }
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[PKDynamicProvisioningFieldsPageViewController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  objc_msgSend(v10, "interactivePopGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[PKDynamicProvisioningFieldsPageViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  objc_msgSend(v7, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v3);

}

- (id)defaultHeaderViewTitle
{
  return (id)-[PKDynamicProvisioningFieldsPageContent title](self->_fieldsPage, "title");
}

- (id)defaultHeaderViewSubTitle
{
  return (id)-[PKDynamicProvisioningFieldsPageContent subtitle](self->_fieldsPage, "subtitle");
}

- (PKDynamicProvisioningFieldsPageContent)fieldsPage
{
  return self->_fieldsPage;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldsPage, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_hiddenRightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_spinningNavBarItem, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
}

@end
