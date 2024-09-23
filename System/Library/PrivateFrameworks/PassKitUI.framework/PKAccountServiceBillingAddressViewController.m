@implementation PKAccountServiceBillingAddressViewController

- (PKAccountServiceBillingAddressViewController)initWithBillingAddress:(id)a3 account:(id)a4 accountService:(id)a5 detailViewStyle:(int64_t)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PKAccountServiceBillingAddressViewController *v17;
  PKAccountServiceBillingAddressViewController *v18;
  uint64_t v19;
  id handler;
  PKAccountService *accountService;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PKAccountServiceBillingAddressViewController;
  v17 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v28, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 2);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_currentBillingAddress, a3);
    objc_storeStrong((id *)&v18->_account, a4);
    objc_storeStrong((id *)&v18->_accountService, a5);
    v18->_accountFeatureIdentifier = -[PKAccount feature](v18->_account, "feature");
    v18->_detailViewStyle = a6;
    v19 = objc_msgSend(v16, "copy");
    handler = v18->_handler;
    v18->_handler = (id)v19;

    v18->_loadingNewBillingContact = 1;
    objc_initWeak(&location, v18);
    accountService = v18->_accountService;
    -[PKAccount accountIdentifier](v18->_account, "accountIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __118__PKAccountServiceBillingAddressViewController_initWithBillingAddress_account_accountService_detailViewStyle_handler___block_invoke;
    v24[3] = &unk_1E3E77848;
    objc_copyWeak(&v26, &location);
    v25 = v14;
    -[PKAccountService userInfoForAccountIdentifier:forceFetch:completion:](accountService, "userInfoForAccountIdentifier:forceFetch:completion:", v22, 1, v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __118__PKAccountServiceBillingAddressViewController_initWithBillingAddress_account_accountService_detailViewStyle_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __118__PKAccountServiceBillingAddressViewController_initWithBillingAddress_account_accountService_detailViewStyle_handler___block_invoke_2;
  v9[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __118__PKAccountServiceBillingAddressViewController_initWithBillingAddress_account_accountService_detailViewStyle_handler___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 40), "creditPrimaryUser");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && !*(_QWORD *)(a1 + 48))
    {
      objc_storeStrong(v4 + 135, v3);
      (*((void (**)(void))v4[140] + 2))();
    }
    *((_BYTE *)v4 + 1128) = 0;
    objc_msgSend(v4, "reloadSection:", 0);

    WeakRetained = v4;
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAccountServiceBillingAddressViewController;
  -[PKSectionTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKAccountServiceBillingAddressViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  -[PKAccountServiceBillingAddressViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  return a3 < 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section"));
  if (v8 == 1)
  {
    -[PKAccountServiceBillingAddressViewController _enterNewBillingAddressCellForRowIndex:tableView:](self, "_enterNewBillingAddressCellForRowIndex:tableView:", objc_msgSend(v7, "row"), v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[PKAccountServiceBillingAddressViewController _currentBillingAddressCellForRowIndex:tableView:](self, "_currentBillingAddressCellForRowIndex:tableView:", objc_msgSend(v7, "row"), v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_7:

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if ((unint64_t)a4 > 1)
  {
    v6 = 0;
  }
  else
  {
    PKLocalizedFeatureString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (unint64_t)a4 < 2;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  objc_msgSend(a3, "rowHeight");
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  if ((unint64_t)a4 <= 2)
    objc_msgSend(a3, "sectionHeaderHeight");
  return result;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3)) == 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v6, "section")) == 1)
    -[PKAccountServiceBillingAddressViewController _didSelectChangeAddress](self, "_didSelectChangeAddress");
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a4;
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v8, "section"))
    || self->_loadingNewBillingContact)
  {
    v9 = 0;
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 1;
  }
  if (!objc_msgSend(v10, "length"))
  {

    v10 = 0;
    if (v9)
      goto LABEL_6;
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  if (!v9)
    goto LABEL_8;
LABEL_6:
  v11 = (void *)MEMORY[0x1E0DC36B8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __106__PKAccountServiceBillingAddressViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
  v16[3] = &unk_1E3E6D5A8;
  v17 = v10;
  objc_msgSend(v11, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v12;
}

id __106__PKAccountServiceBillingAddressViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_4;
  v4 = (void *)MEMORY[0x1E0DC3428];
  PKLocalizedString(CFSTR("MENU_ACTION_COPY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__PKAccountServiceBillingAddressViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v11[3] = &unk_1E3E6D580;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, 0, 0, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DC39D0];
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "menuWithTitle:children:", &stru_1E3E7D690, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v9 = 0;
  }

  return v9;
}

void __106__PKAccountServiceBillingAddressViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setString:", *(_QWORD *)(a1 + 32));

}

- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CNContact *v9;
  CNContact *currentBillingAddress;
  PKAccountService *accountService;
  void *v12;
  CNContact *v13;
  _QWORD v14[4];
  CNContact *v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  -[PKAccountServiceBillingAddressViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  self->_loadingNewBillingContact = 1;
  v9 = self->_currentBillingAddress;
  currentBillingAddress = self->_currentBillingAddress;
  self->_currentBillingAddress = 0;

  -[PKSectionTableViewController reloadSection:](self, "reloadSection:", 0);
  objc_initWeak(&location, self);
  accountService = self->_accountService;
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92__PKAccountServiceBillingAddressViewController_addressEditorViewController_selectedContact___block_invoke;
  v14[3] = &unk_1E3E77870;
  objc_copyWeak(&v16, &location);
  v13 = v9;
  v15 = v13;
  -[PKAccountService updateUserInfoForAccountIdentifier:contact:completion:](accountService, "updateUserInfoForAccountIdentifier:contact:completion:", v12, v7, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __92__PKAccountServiceBillingAddressViewController_addressEditorViewController_selectedContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __92__PKAccountServiceBillingAddressViewController_addressEditorViewController_selectedContact___block_invoke_2;
    v9[3] = &unk_1E3E62460;
    v9[4] = WeakRetained;
    v10 = v5;
    v11 = v6;
    v12 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

uint64_t __92__PKAccountServiceBillingAddressViewController_addressEditorViewController_selectedContact___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1128) = 0;
  v2 = *(void **)(a1 + 40);
  if (v2 && !*(_QWORD *)(a1 + 48))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v2;
    v3 = *(void **)(v5 + 1080);
    *(_QWORD *)(v5 + 1080) = v6;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1080), *(id *)(a1 + 56));
    +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104), 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v4, 1, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "reloadSection:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1120) + 16))();
}

- (void)addressEditorViewControllerDidCancel:(id)a3
{
  id v3;

  -[PKAccountServiceBillingAddressViewController navigationController](self, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_didSelectChangeAddress
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  PKAddressEditorViewController *v12;
  void *v13;
  void *v14;
  PKAddressEditorViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[PKAccountServiceBillingAddressViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:");

  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C97378]);
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "countryCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setISOCountryCode:", v5);

    v6 = objc_alloc_init(MEMORY[0x1E0C97360]);
    v7 = (void *)MEMORY[0x1E0C97338];
    v8 = *MEMORY[0x1E0C96FF8];
    v9 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v7, "labeledValueWithLabel:value:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPostalAddresses:", v11);

    v12 = [PKAddressEditorViewController alloc];
    v13 = (void *)objc_msgSend(v6, "copy");
    -[PKAccountServiceBillingAddressViewController requiredBillingAddressKeys](self, "requiredBillingAddressKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKAddressEditorViewController initWithContact:requiredKeys:highlightedKeys:errors:style:](v12, "initWithContact:requiredKeys:highlightedKeys:errors:style:", v13, v14, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 1);

    -[PKAddressEditorViewController setDelegate:](v15, "setDelegate:", self);
    -[PKAddressEditorViewController setCountryIsEditable:](v15, "setCountryIsEditable:", 0);
    -[PKAddressEditorViewController setModalPresentationStyle:](v15, "setModalPresentationStyle:", -[PKAccountServiceBillingAddressViewController modalPresentationStyle](self, "modalPresentationStyle"));
    -[PKAddressEditorViewController view](v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v17);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v15);
    -[PKAccountServiceBillingAddressViewController navigationController](self, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "presentViewController:animated:completion:", v18, 1, 0);

  }
}

- (id)_currentBillingAddressCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("PKCreditAccountBillingAddressCurrentAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("PKCreditAccountBillingAddressCurrentAddress"));
  if (self->_loadingNewBillingContact)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v6, "startAnimating");
    objc_msgSend(v5, "setEditingAccessoryView:", v6);
    objc_msgSend(v5, "setAccessoryView:", v6);
  }
  else
  {
    objc_msgSend(v5, "setEditingAccessoryView:", 0);
    objc_msgSend(v5, "setAccessoryView:", 0);
    objc_msgSend(v5, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContact pkFormattedContactAddressWithoutName](self->_currentBillingAddress, "pkFormattedContactAddressWithoutName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

    objc_msgSend(v6, "setNumberOfLines:", 0);
  }

  return v5;
}

- (id)_enterNewBillingAddressCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("PKCreditAccountBillingAddressUpdateAddress"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("PKCreditAccountBillingAddressUpdateAddress"));
    objc_msgSend(v4, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v6);

  }
  objc_msgSend(v4, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  return v4;
}

- (id)requiredBillingAddressKeys
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C97098];
  v5[0] = *MEMORY[0x1E0C970C8];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0C970B0];
  v5[2] = *MEMORY[0x1E0C970C0];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)modalPresentationStyle
{
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    return 16;
  }
  else
  {
    return 5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_currentBillingAddress, 0);
}

@end
