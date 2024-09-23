@implementation PKApplyAddBeneficiaryViewController

- (PKApplyAddBeneficiaryViewController)initWithSetupDelegate:(id)a3 context:(int64_t)a4 pageContent:(id)a5 account:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  PKApplyAddBeneficiaryViewController *v33;
  PKApplyAddBeneficiaryViewController *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  id v44;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id obj;
  objc_super v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  id v61;
  void *v62;
  _BYTE v63[128];
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v43 = a5;
  v8 = a5;
  v44 = a6;
  v49 = a6;
  v50 = v8;
  objc_msgSend(v8, "fieldModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "visiblePaymentSetupFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __89__PKApplyAddBeneficiaryViewController_initWithSetupDelegate_context_pageContent_account___block_invoke;
  v59[3] = &unk_1E3E6EBF0;
  v14 = v13;
  v60 = v14;
  v15 = v12;
  v61 = v15;
  v48 = v10;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v59);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("self"), 1);
  v64[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v14;
  objc_msgSend(v14, "sortedArrayUsingDescriptors:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v18;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v56 != v21)
          objc_enumerationMutation(obj);
        objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "isFieldTypeLabel"))
        {
          objc_msgSend(v23, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v24, 0, v43, v44);
          objc_msgSend(v52, "setObject:forKeyedSubscript:", v27, v26);

          objc_msgSend(v23, "removeLastObject");
        }
        objc_msgSend(v23, "pk_arrayByApplyingBlock:", &__block_literal_global_115);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v28);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v20);
  }

  v29 = objc_alloc(MEMORY[0x1E0D67300]);
  v30 = (void *)objc_msgSend(v48, "copy");
  v31 = (void *)objc_msgSend(v52, "copy");
  v32 = (void *)objc_msgSend(v29, "initWithPaymentSetupFields:footerFields:", v30, v31);

  v54.receiver = self;
  v54.super_class = (Class)PKApplyAddBeneficiaryViewController;
  v33 = -[PKPaymentSetupFieldsViewController initWithWebService:context:setupDelegate:setupFieldsModel:](&v54, sel_initWithWebService_context_setupDelegate_setupFieldsModel_, 0, a4, v51, v32);
  v34 = v33;
  if (v33)
  {
    -[PKPaymentSetupFieldsViewController setSectionIdentifiers:](v33, "setSectionIdentifiers:", v11);
    objc_storeStrong((id *)&v34->_pageContent, v43);
    objc_storeStrong((id *)&v34->_account, v44);
    -[PKDynamicProvisioningFieldsPageContent fieldModel](v34->_pageContent, "fieldModel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "paymentSetupFields");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    if (v37)
    {
      v38 = objc_alloc(MEMORY[0x1E0DC34F0]);
      PKLocalizedPaymentString(CFSTR("SUBMIT"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v38, "initWithTitle:style:target:action:", v39, 2, v34, sel__handleNextButtonTapped);

      v62 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupFieldsViewController _setRightBarButtonItems:animated:](v34, "_setRightBarButtonItems:animated:", v41, 0);

    }
    else
    {
      -[PKPaymentSetupFieldsViewController _setNavigationBarEnabled:animated:](v34, "_setNavigationBarEnabled:animated:", 0, 0);
    }
  }

  return v34;
}

void __89__PKApplyAddBeneficiaryViewController_initWithSetupDelegate_context_pageContent_account___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = objc_msgSend(v13, "groupNumber");
  if (v3 >= 1)
  {
    v4 = v3;
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    v7 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "addObject:", v13);
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v13, 0);
      v11 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

    }
  }
  if (objc_msgSend(v13, "isMemberOfClass:", objc_opt_class()))
    objc_msgSend(v13, "setDisallowCurrentYear:", 0);

}

uint64_t __89__PKApplyAddBeneficiaryViewController_initWithSetupDelegate_context_pageContent_account___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (PKApplyAddBeneficiaryViewController)initWithController:(id)a3 setupDelegate:(id)a4 pageContent:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  PKApplyAddBeneficiaryViewController *v14;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = objc_msgSend(v9, "context");
  objc_msgSend(v9, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKApplyAddBeneficiaryViewController initWithSetupDelegate:context:pageContent:account:](self, "initWithSetupDelegate:context:pageContent:account:", v11, v12, v10, v13);

  if (v14)
    objc_storeStrong((id *)&v14->_controller, a3);

  return v14;
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
  v6.super_class = (Class)PKApplyAddBeneficiaryViewController;
  -[PKPaymentSetupFieldsViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKPaymentSetupFieldsViewController setHidesBackButton:animated:](self, "setHidesBackButton:animated:", 1, 0);
  v3 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_handleCancelTapped);
  cancelButton = self->_cancelButton;
  self->_cancelButton = v3;

  v7[0] = self->_cancelButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController _setLeftBarButtonItems:animated:](self, "_setLeftBarButtonItems:animated:", v5, 0);

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
    -[PKApplyAddBeneficiaryViewController navigationController](self, "navigationController");
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
      -[PKApplyAddBeneficiaryViewController view](self, "view");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v8;

    objc_msgSend(v18, "setUserInteractionEnabled:", v4);
    -[PKPaymentSetupTableViewController dockView](self, "dockView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setButtonsEnabled:", v4);

    -[PKApplyAddBeneficiaryViewController _setNavigationBarEnabled:](self, "_setNavigationBarEnabled:", v4);
    -[PKApplyAddBeneficiaryViewController navigationItem](self, "navigationItem");
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
  -[PKApplyAddBeneficiaryViewController navigationController](self, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  objc_msgSend(v10, "interactivePopGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[PKApplyAddBeneficiaryViewController navigationItem](self, "navigationItem");
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
  return (id)-[PKDynamicProvisioningFieldsPageContent title](self->_pageContent, "title");
}

- (id)defaultHeaderViewSubTitle
{
  return (id)-[PKDynamicProvisioningFieldsPageContent subtitle](self->_pageContent, "subtitle");
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKApplyAddBeneficiaryViewController;
  -[PKPaymentSetupFieldsViewController tableView:willDisplayCell:forRowAtIndexPath:](&v17, sel_tableView_willDisplayCell_forRowAtIndexPath_, a3, v8, a5);
  objc_msgSend(v8, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 18.0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "visibleSetupFieldIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minimumRequiredWidthForFieldIdentifiers:withFont:", v16, v13);

  PKFloatCeilToPixel();
  objc_msgSend(v8, "setMinimumTextLabelWidth:");
  objc_msgSend(v8, "setHidePrediction:", 1);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;

  -[PKPaymentSetupFieldsViewController sectionIdentifiers](self, "sectionIdentifiers", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PKPaymentSetupFieldsViewController sectionIdentifiers](self, "sectionIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)*MEMORY[0x1E0D6AF70];
    v11 = v9;
    v12 = v10;
    if (v11 == v12)
    {

    }
    else
    {
      v13 = v12;
      if (!v11 || !v12)
      {

LABEL_11:
        v15 = 0;
        goto LABEL_12;
      }
      v14 = objc_msgSend(v11, "isEqualToString:", v12);

      if (!v14)
        goto LABEL_11;
    }
    PKLocalizedFeatureString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

    return v15;
  }
  v15 = 0;
  return v15;
}

- (void)_terminateFlow
{
  void *v3;
  void *v4;
  id v5;

  -[PKApplyController endApplyFlow](self->_controller, "endApplyFlow");
  -[PKPaymentSetupFieldsViewController setupDelegate](self, "setupDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "viewControllerDidTerminateSetupFlow:", self);
  }
  else
  {
    -[PKApplyAddBeneficiaryViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_submit
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
  v9[0] = &unk_1E3FAD5D0;
  PKLocalizedString(CFSTR("WALLET"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = &unk_1E3FAD5E8;
  v10[0] = v4;
  v10[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKApplyAddBeneficiaryViewController showSpinner:](self, "showSpinner:", 1);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PKApplyAddBeneficiaryViewController__submit__block_invoke;
  v6[3] = &unk_1E3E6EC58;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "evaluatePolicy:options:reply:", 2, v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __46__PKApplyAddBeneficiaryViewController__submit__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *WeakRetained;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  void *v16;
  _QWORD v17[5];
  void *v18;
  _QWORD aBlock[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_2;
    aBlock[3] = &unk_1E3E62288;
    aBlock[4] = WeakRetained;
    v8 = _Block_copy(aBlock);
    v9 = v8;
    if (!a2 || a3)
    {
      v15[0] = v7;
      v15[1] = 3221225472;
      v15[2] = __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_5;
      v15[3] = &unk_1E3E61590;
      v16 = v8;
      v14 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], v15);
      v13 = v16;
    }
    else
    {
      v10 = (void *)v6[152];
      v11 = v6[154];
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_3;
      v17[3] = &unk_1E3E61720;
      v17[4] = v6;
      v18 = v8;
      v12 = v8;
      objc_msgSend(v10, "submitFieldsPage:completion:", v11, v17);
      v13 = v18;
    }

  }
}

uint64_t __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "showSpinner:", 0);
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "endApplyFlow");
    return objc_msgSend(*(id *)(a1 + 32), "_terminateFlow");
  }
  return result;
}

void __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_alertControllerForError:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v7, 1, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_4;
    v9[3] = &unk_1E3E614F0;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_alertControllerForError:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D69DC8]);

    v8 = (_QWORD *)MEMORY[0x1E0CB3388];
    v9 = v5;
    if (v7)
    {
      objc_msgSend(v5, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)*MEMORY[0x1E0D6B0B8];
    v13 = v11;
    v14 = v12;
    if (v13 == v14)
    {

    }
    else
    {
      v15 = v14;
      if (!v13 || !v14)
      {

LABEL_17:
        v17 = PKAlertForDisplayableErrorWithHandlers(v9, 0, 0, 0);
LABEL_37:

        goto LABEL_38;
      }
      v16 = objc_msgSend(v13, "isEqualToString:", v14);

      if ((v16 & 1) == 0)
        goto LABEL_17;
    }
    objc_msgSend(v9, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)*MEMORY[0x1E0D6BCB8];
    v22 = v20;
    v23 = v21;
    if (v22 == v23)
    {

    }
    else
    {
      v24 = v23;
      if (!v22 || !v23)
      {

LABEL_21:
        v26 = 0;
        v27 = 0;
        goto LABEL_22;
      }
      v25 = objc_msgSend(v22, "isEqualToString:", v23);

      if (!v25)
        goto LABEL_21;
    }
    objc_msgSend(v19, "localizedFailureReason");
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedRecoverySuggestion");
    v27 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    if (objc_msgSend(v9, "code") == 60049)
    {
      if (!(v26 | v27))
      {
        PKLocalizedFeatureString();
        v26 = objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v27 = objc_claimAutoreleasedReturnValue();
      }
    }
    else if (!(v26 | v27))
    {
      objc_msgSend(v9, "localizedFailureReason");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        v30 = v28;
      }
      else
      {
        objc_msgSend(v5, "localizedFailureReason");
        v30 = (id)objc_claimAutoreleasedReturnValue();
      }
      v26 = (uint64_t)v30;

      objc_msgSend(v9, "localizedRecoverySuggestion");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
      {
        v33 = v31;
      }
      else
      {
        objc_msgSend(v5, "localizedRecoverySuggestion");
        v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      v27 = (uint64_t)v33;

    }
    if (v26 | v27)
    {
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v26, v27, 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "actionWithTitle:style:handler:", v35, 1, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAction:", v36);

    }
    else
    {
      v17 = 0;
    }

    goto LABEL_37;
  }
  v17 = 0;
LABEL_38:

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_hiddenRightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_spinningNavBarItem, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_pageContent, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
