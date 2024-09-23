@implementation PKReportIssueViewController

+ (BOOL)canReportIssueForTransaction:(id)a3 bankConnectInstitution:(id)a4 paymentPass:(id)a5
{
  id v7;
  id v8;
  int v9;
  int v10;
  char v11;
  uint64_t v13;

  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(a4, "problemReportingEnabled");
  v10 = objc_msgSend(v7, "bankConnectTransactionWasClassifiedByMaps");
  if (objc_msgSend(v7, "isBankConnectTransaction") && (v9 & v10) == 0
    || objc_msgSend(v8, "associatedAccountFeatureIdentifier") == 4)
  {
    v11 = 0;
  }
  else
  {
    v13 = 0;
    do
    {
      v11 = PKPaymentTransactionSupportsIssueType(v13, v7, v8);
      if ((v11 & 1) != 0)
        break;
    }
    while (v13++ != 5);
  }

  return v11;
}

+ (BOOL)canSelectIssueTypeForTransaction:(id)a3
{
  id v3;
  unint64_t v4;
  BOOL v5;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "transactionType");
  v5 = 1;
  if (v4 <= 0x16)
  {
    if (((1 << v4) & 0x7FFBFC) != 0)
      goto LABEL_3;
    if (v4 != 10)
      goto LABEL_4;
    if (!+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat"))
    {
LABEL_3:
      v5 = 0;
    }
    else
    {
      objc_msgSend(v3, "payments");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "isCurrentlyCancellable"))
        v5 = objc_msgSend(v3, "transactionStatus") != 5;
      else
        v5 = 0;

    }
  }
LABEL_4:

  return v5;
}

- (PKReportIssueViewController)initWithTransaction:(id)a3 transactionSourceCollection:(id)a4 paymentPass:(id)a5 familyCollection:(id)a6 account:(id)a7 accountUserCollection:(id)a8 bankConnectInstitution:(id)a9 physicalCards:(id)a10 detailViewStyle:(int64_t)a11 context:(unint64_t)a12
{
  id v19;
  PKReportIssueViewController *v20;
  PKReportIssueViewController *v21;
  void **p_paymentPass;
  FKPIIStringProcessor *v23;
  FKPIIStringProcessor *bankConnectPIIStringProcessor;
  uint64_t v25;
  PKPaymentService *paymentService;
  PKPaymentTransactionCellController *v27;
  PKPaymentTransactionCellController *transactionCellController;
  uint64_t v29;
  NSSet *physicalCards;
  uint64_t v31;
  UIBarButtonItem *cancelButton;
  uint64_t v33;
  UIBarButtonItem *submitButton;
  void *v35;
  void *v36;
  int64_t v37;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v45 = a3;
  v44 = a4;
  v43 = a5;
  v42 = a6;
  v41 = a7;
  v40 = a8;
  v39 = a9;
  v19 = a10;
  v46.receiver = self;
  v46.super_class = (Class)PKReportIssueViewController;
  v20 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v46, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 6);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_transaction, a3);
    objc_storeStrong((id *)&v21->_transactionSourceCollection, a4);
    p_paymentPass = (void **)&v21->_paymentPass;
    objc_storeStrong((id *)&v21->_paymentPass, a5);
    objc_storeStrong((id *)&v21->_account, a7);
    objc_storeStrong((id *)&v21->_accountUserCollection, a8);
    objc_storeStrong((id *)&v21->_bankConnectInstitution, a9);
    v23 = (FKPIIStringProcessor *)objc_alloc_init(MEMORY[0x1E0CADD28]);
    bankConnectPIIStringProcessor = v21->_bankConnectPIIStringProcessor;
    v21->_bankConnectPIIStringProcessor = v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D672B0]), "initWithDelegate:", v21);
    paymentService = v21->_paymentService;
    v21->_paymentService = (PKPaymentService *)v25;

    v27 = -[PKPaymentTransactionCellController initWithContactResolver:]([PKPaymentTransactionCellController alloc], "initWithContactResolver:", 0);
    transactionCellController = v21->_transactionCellController;
    v21->_transactionCellController = v27;

    objc_storeStrong((id *)&v21->_familyCollection, a6);
    v29 = objc_msgSend(v19, "copy");
    physicalCards = v21->_physicalCards;
    v21->_physicalCards = (NSSet *)v29;

    v21->_context = a12;
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v21, sel__cancelButtonTapped_);
    cancelButton = v21->_cancelButton;
    v21->_cancelButton = (UIBarButtonItem *)v31;

    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v21, sel__submitButtonTapped_);
    submitButton = v21->_submitButton;
    v21->_submitButton = (UIBarButtonItem *)v33;

    -[PKReportIssueViewController navigationItem](v21, "navigationItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v35, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    if (a12 != 1)
      objc_msgSend(v35, "setLeftBarButtonItem:", v21->_cancelButton);
    objc_msgSend(v35, "setRightBarButtonItem:", v21->_submitButton, a6, v39, v40, v41, v42, v43, v44);
    PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_TITLE"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTitle:", v36);

    v21->_canPerformUnrecognizedTransaction = PKPaymentTransactionSupportsIssueType(1, v45, *p_paymentPass);
    v21->_canPerformDispute = PKPaymentTransactionSupportsIssueType(0, v45, *p_paymentPass);
    v21->_canPerformOther = PKPaymentTransactionSupportsIssueType(5, v45, *p_paymentPass);
    v21->_canPerformIncorrectMerchant = PKPaymentTransactionSupportsIssueType(2, v45, *p_paymentPass);
    v21->_canPerformCancelAccountServicePayment = PKPaymentTransactionSupportsIssueType(3, v45, *p_paymentPass);
    if (a12 == 1)
    {
      v21->_selectedIssue = 2;
      v21->_hasIssueSelected = 1;
    }
    if (-[PKReportIssueViewController _numberOfIssueTypesEnabled](v21, "_numberOfIssueTypesEnabled") == 1
      && !v21->_hasIssueSelected)
    {
      v37 = 0;
      while (!-[PKReportIssueViewController _issueTypeEnabled:](v21, "_issueTypeEnabled:", v37))
      {
        if (++v37 == 6)
          goto LABEL_13;
      }
      v21->_selectedIssue = v37;
      v21->_hasIssueSelected = 1;
    }
LABEL_13:
    -[PKReportIssueViewController _updateNavigationButtons](v21, "_updateNavigationButtons");

  }
  return v21;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKReportIssueViewController;
  -[PKSectionTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKReportIssueViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKReportIssueCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKTransactionCellReuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKTransactionCommentsCellReuseIdentifier"));
  if (self->_context != 1
    && -[PKAccount feature](self->_account, "feature") == 2
    && !+[PKReportIssueViewController canSelectIssueTypeForTransaction:](PKReportIssueViewController, "canSelectIssueTypeForTransaction:", self->_transaction))
  {
    self->_selectedIssue = 5;
    self->_hasIssueSelected = 1;
    -[PKReportIssueViewController _reportIssueInBusinessChat](self, "_reportIssueInBusinessChat");
  }

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKReportIssueViewController;
  -[PKReportIssueViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKReportIssueViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKReportIssueViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKReportIssueViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (id)_createPrivacyFooterViewForContext:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  PKFooterHyperlinkView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0D65188], "pk_privacyFlowForContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    PKLocalizedBankConnectString(CFSTR("BANK_CONNECT_RAP_PRIVACY_FOOTER_TEXT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedButtonTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      PKLocalizedBankConnectString(CFSTR("BANK_CONNECT_RAP_PRIVACY_FOOTER_FORMAT"), CFSTR("%@%@"), v5, v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v6;
    }
    v10 = v8;
    v11 = (void *)MEMORY[0x1E0C99E98];
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("onboarding:%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(PKFooterHyperlinkView);
    PKAttributedStringByAddingLinkToSubstring(v10, v7, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFooterHyperlinkView setAttributedText:](v9, "setAttributedText:", v16);

    PKGenericOnboardingPresenter(self, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PKOpenOnboardingHyperlinkAction(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFooterHyperlinkView setAction:](v9, "setAction:", v18);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_statementName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PKPaymentTransaction merchant](self->_transaction, "merchant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rawName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  unint64_t context;
  BOOL v4;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;

  context = self->_context;
  v4 = context == 1;
  switch(a3)
  {
    case 0uLL:
      v6 = context == 1;
      return !v6;
    case 1uLL:
      -[PKPaymentTransaction merchant](self->_transaction, "merchant");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKReportIssueViewController _statementName](self, "_statementName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v4 = 0;
        goto LABEL_27;
      }
      objc_msgSend(v7, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {

LABEL_24:
        v4 = 0;
        goto LABEL_26;
      }
      v4 = context != 1;
      if (v11)
      {
        v13 = objc_msgSend(v10, "isEqualToString:", v11);

        if (!v13)
          goto LABEL_26;
        goto LABEL_24;
      }

LABEL_26:
LABEL_27:

      return v4;
    case 2uLL:
      if (-[PKReportIssueViewController _numberOfIssueTypesEnabled](self, "_numberOfIssueTypesEnabled"))
        v6 = context == 1;
      else
        v6 = 1;
      return !v6;
    case 3uLL:
      if (!self->_hasIssueSelected)
        return 0;
      if (self->_selectedIssue)
        v6 = 1;
      else
        v6 = context == 1;
      return !v6;
    case 4uLL:
    case 5uLL:
      if (self->_hasIssueSelected && self->_selectedIssue == 2)
        return 1;
      return v4;
    default:
      return 0;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5;
  int64_t result;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  result = 1;
  switch(v5)
  {
    case 0uLL:
    case 1uLL:
    case 5uLL:
      return result;
    case 2uLL:
      result = -[PKReportIssueViewController _numberOfIssueTypesEnabled](self, "_numberOfIssueTypesEnabled");
      break;
    case 3uLL:
      result = 4;
      break;
    case 4uLL:
      result = 3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section")))
  {
    case 0uLL:
      -[PKReportIssueViewController _transactionCellForTableView:atIndexPath:](self, "_transactionCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1uLL:
      -[PKReportIssueViewController _statementNameCellForTableView:atIndexPath:](self, "_statementNameCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2uLL:
      -[PKReportIssueViewController _issueTypeCellForTableView:atIndexPath:](self, "_issueTypeCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3uLL:
      -[PKReportIssueViewController _disputeTypeCellForTableView:atIndexPath:](self, "_disputeTypeCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4uLL:
      -[PKReportIssueViewController _mapsIssueCellForTableView:atIndexPath:](self, "_mapsIssueCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5uLL:
      -[PKReportIssueViewController _commentsCellForTableView:atIndexPath:](self, "_commentsCellForTableView:atIndexPath:", v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  unint64_t v4;
  void *v5;

  v4 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4) - 1;
  if (v4 > 4)
  {
    v5 = 0;
  }
  else
  {
    PKLocalizedPaymentString(&off_1E3E767A8[v4]->isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  unint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v6, "section"));
  switch(v7)
  {
    case 4uLL:
      -[PKReportIssueViewController _handleMapsIssueTypeSelectedInTableView:atIndexPath:](self, "_handleMapsIssueTypeSelectedInTableView:atIndexPath:", v8, v6);
      break;
    case 3uLL:
      -[PKReportIssueViewController _handleDisputeTypeSelectedInTableView:atIndexPath:](self, "_handleDisputeTypeSelectedInTableView:atIndexPath:", v8, v6);
      break;
    case 2uLL:
      -[PKReportIssueViewController _handleIssueTypeSelectedInTableView:atIndexPath:](self, "_handleIssueTypeSelectedInTableView:atIndexPath:", v8, v6);
      break;
  }

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3)) - 2 <= 2
      && !self->_reportingIssue;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  unint64_t v4;
  double result;

  v4 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3));
  result = *MEMORY[0x1E0DC53D8];
  if (v4 == 5)
    return 200.0;
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v5;

  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4) == 5
    && -[PKPaymentTransaction isBankConnectTransaction](self->_transaction, "isBankConnectTransaction"))
  {
    -[PKReportIssueViewController _createPrivacyFooterViewForContext:](self, "_createPrivacyFooterViewForContext:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKReportIssueViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PKReportIssueViewController_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __54__PKReportIssueViewController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  id obj;

  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", *(_QWORD *)(a1 + 32));
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1152), obj);
    objc_msgSend(*(id *)(a1 + 40), "reloadSection:", 0);
  }

}

- (void)_handleIssueTypeSelectedInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = -[PKReportIssueViewController _issueTypeForRowIndex:](self, "_issueTypeForRowIndex:", objc_msgSend(v6, "row"));
  v8 = v7;
  if (!self->_hasIssueSelected)
    goto LABEL_4;
  if (v7 != self->_selectedIssue)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[PKReportIssueViewController _rowIndexForIssueType:](self, "_rowIndexForIssueType:"), -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 2));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellForRowAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAccessoryType:", 0);
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[PKReportIssueViewController _rowIndexForIssueType:](self, "_rowIndexForIssueType:", v8), -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 2));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellForRowAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setAccessoryType:", 3);
    self->_hasIssueSelected = 1;
    self->_selectedIssue = v8;
    self->_hasMapsIssueSelected = 0;
    self->_hasDisputeTypeSelected = 0;
    -[PKReportIssueViewController _updateNavigationButtons](self, "_updateNavigationButtons");
    -[PKSectionTableViewController updateSectionVisibilityAndReloadIfNecessaryForSections:](self, "updateSectionVisibilityAndReloadIfNecessaryForSections:", &unk_1E3FAE950);

  }
  objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)_handleDisputeTypeSelectedInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  int64_t v8;
  int64_t selectedDisputeType;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  v8 = v7;
  if (!self->_hasDisputeTypeSelected)
    goto LABEL_4;
  selectedDisputeType = self->_selectedDisputeType;
  if (v7 != selectedDisputeType)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", selectedDisputeType, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 3));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cellForRowAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAccessoryType:", 0);
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v8, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 3));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cellForRowAtIndexPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setAccessoryType:", 3);
    self->_hasDisputeTypeSelected = 1;
    self->_selectedDisputeType = v8;
    -[PKReportIssueViewController _updateNavigationButtons](self, "_updateNavigationButtons");

  }
  objc_msgSend(v14, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)_handleMapsIssueTypeSelectedInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  int64_t v8;
  int64_t selectedMapsIssue;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  v8 = v7;
  if (!self->_hasMapsIssueSelected)
    goto LABEL_4;
  selectedMapsIssue = self->_selectedMapsIssue;
  if (v7 != selectedMapsIssue)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", selectedMapsIssue, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 4));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cellForRowAtIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAccessoryType:", 0);
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v8, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 4));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cellForRowAtIndexPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setAccessoryType:", 3);
    self->_hasMapsIssueSelected = 1;
    self->_selectedMapsIssue = v8;
    -[PKReportIssueViewController _updateNavigationButtons](self, "_updateNavigationButtons");

  }
  objc_msgSend(v14, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (id)_transactionCellForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  PKTransactionSourceCollection *transactionSourceCollection;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKTransactionCellReuseIdentifier"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  transactionSourceCollection = self->_transactionSourceCollection;
  -[PKPaymentTransaction transactionSourceIdentifier](self->_transaction, "transactionSourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionSourceCollection transactionSourceForTransactionSourceIdentifier:](transactionSourceCollection, "transactionSourceForTransactionSourceIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKFamilyMemberCollection familyMemberForTransactionSource:](self->_familyCollection, "familyMemberForTransactionSource:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransactionCellController configureCell:forTransaction:transactionSource:familyMember:account:detailStyle:deviceName:avatarViewDelegate:](self->_transactionCellController, "configureCell:forTransaction:transactionSource:familyMember:account:detailStyle:deviceName:avatarViewDelegate:", v5, self->_transaction, v8, v9, self->_account, 0, 0, 0);
  objc_msgSend(v5, "transactionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShowsDisclosureView:", 0);

  return v5;
}

- (id)_statementNameCellForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *statementName;
  void *v10;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKReportIssueCellReuseIdentifier"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_statementName)
  {
    -[PKReportIssueViewController _statementName](self, "_statementName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKReportIssueViewController _formattedStatementNameFromRawName:](self, "_formattedStatementNameFromRawName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uppercaseString");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    statementName = self->_statementName;
    self->_statementName = v8;

  }
  objc_msgSend(v5, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", self->_statementName);

  objc_msgSend(v5, "setAccessoryType:", 0);
  return v5;
}

- (id)_issueTypeCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKReportIssueCellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  v9 = -[PKReportIssueViewController _issueTypeForRowIndex:](self, "_issueTypeForRowIndex:", v8);
  v10 = v9;
  if (v9 > 5)
  {
    v11 = 0;
  }
  else
  {
    PKLocalizedPaymentString(&off_1E3E767D0[v9]->isa);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  if (self->_hasIssueSelected)
  {
    if (self->_selectedIssue == v10)
      v13 = 3;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v7, "setAccessoryType:", v13);

  return v7;
}

- (id)_disputeTypeCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKReportIssueCellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  if (v8 > 3)
  {
    v9 = 0;
  }
  else
  {
    PKLocalizedPaymentString(&off_1E3E76800[v8]->isa);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  if (self->_hasDisputeTypeSelected)
  {
    if (self->_selectedDisputeType == v8)
      v11 = 3;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v7, "setAccessoryType:", v11);

  return v7;
}

- (id)_mapsIssueCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKReportIssueCellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  if (v8 > 2)
  {
    v9 = 0;
  }
  else
  {
    PKLocalizedPaymentString(&off_1E3E76820[v8]->isa);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  if (self->_hasMapsIssueSelected)
  {
    if (self->_selectedMapsIssue == v8)
      v11 = 3;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v7, "setAccessoryType:", v11);

  return v7;
}

- (id)_commentsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PKTransactionCommentsCellReuseIdentifier"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_REQUIRED"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  objc_msgSend(v6, "setAttributedPlaceholder:", v9);
  objc_msgSend(v6, "setDelegate:", self);

  return v5;
}

- (id)_formattedStatementNameFromRawName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  const __CFString *v10;
  char v11;
  id v12;
  void *v13;
  id v15;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v3);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCharactersToBeSkipped:", v6);
  v15 = 0;
  v7 = objc_msgSend(v5, "scanUpToCharactersFromSet:intoString:", v6, &v15);
  v8 = v15;
  v9 = v8;
  if (v7)
  {
    do
    {
      if (objc_msgSend(v9, "length"))
      {
        if (objc_msgSend(v5, "isAtEnd"))
          v10 = &stru_1E3E7D690;
        else
          v10 = CFSTR(" ");
        objc_msgSend(v4, "appendFormat:", CFSTR("%@%@"), v9, v10);
      }
      v15 = v9;
      v11 = objc_msgSend(v5, "scanUpToCharactersFromSet:intoString:", v6, &v15);
      v12 = v15;

      v9 = v12;
    }
    while ((v11 & 1) != 0);
  }
  else
  {
    v12 = v8;
  }
  v13 = (void *)objc_msgSend(v4, "copy");

  return v13;
}

- (unint64_t)_numberOfIssueTypesEnabled
{
  uint64_t v3;
  unint64_t v4;

  v3 = 0;
  v4 = 0;
  do
    v4 += -[PKReportIssueViewController _issueTypeEnabled:](self, "_issueTypeEnabled:", v3++);
  while (v3 != 6);
  return v4;
}

- (int64_t)_issueTypeForRowIndex:(int64_t)a3
{
  int64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  do
  {
    if (-[PKReportIssueViewController _issueTypeEnabled:](self, "_issueTypeEnabled:", v5))
    {
      if (v6 == a3)
        return v5;
      ++v6;
    }
    ++v5;
  }
  while (v5 != 6);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)_rowIndexForIssueType:(int64_t)a3
{
  uint64_t v5;
  int64_t v6;

  v5 = 0;
  v6 = 0;
  do
  {
    if (-[PKReportIssueViewController _issueTypeEnabled:](self, "_issueTypeEnabled:", v5))
    {
      if (a3 == v5)
        return v6;
      ++v6;
    }
    ++v5;
  }
  while (v5 != 6);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_issueTypeEnabled:(int64_t)a3
{
  return (unint64_t)a3 <= 5 && *((_BYTE *)&self->super.super.super.super.super.isa + *off_1E3E76838[a3]) != 0;
}

- (void)_updateNavigationButtons
{
  uint64_t hasDisputeTypeSelected;
  void *v4;
  void *v5;
  int64_t selectedIssue;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;

  -[UIBarButtonItem setEnabled:](self->_cancelButton, "setEnabled:", !self->_reportingIssue);
  if (self->_hasIssueSelected && !self->_reportingIssue)
  {
    selectedIssue = self->_selectedIssue;
    if (selectedIssue)
    {
      if (selectedIssue == 2)
      {
        if (-[PKSectionTableViewController isSectionMapped:](self, "isSectionMapped:", 5))
        {
          -[PKReportIssueViewController tableView](self, "tableView");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 5));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "textView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "text");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "length") != 0;

        }
        else
        {
          v12 = 0;
        }
        hasDisputeTypeSelected = self->_hasMapsIssueSelected && v12;
      }
      else
      {
        hasDisputeTypeSelected = 1;
      }
    }
    else
    {
      hasDisputeTypeSelected = self->_hasDisputeTypeSelected;
    }
  }
  else
  {
    hasDisputeTypeSelected = 0;
  }
  -[UIBarButtonItem setEnabled:](self->_submitButton, "setEnabled:", hasDisputeTypeSelected);
  if (self->_reportingIssue)
  {
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v13, "startAnimating");
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v13);
    -[PKReportIssueViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:", v4);

  }
  else
  {
    -[PKReportIssueViewController navigationItem](self, "navigationItem");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItem:", self->_submitButton);
  }

}

- (void)_cancelButtonTapped:(id)a3
{
  id v3;

  -[PKReportIssueViewController presentingViewController](self, "presentingViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_submitButtonTapped:(id)a3
{
  id v4;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *activityIndicator;
  void *v7;
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
  unint64_t selectedIssue;
  _QWORD v21[5];
  _QWORD v22[5];

  v4 = a3;
  if (self->_hasIssueSelected)
  {
    if (-[PKPaymentTransaction isBankConnectTransaction](self->_transaction, "isBankConnectTransaction"))
    {
      if (self->_selectedIssue == 2)
        -[PKReportIssueViewController _reportBankConnectIssueToMaps](self, "_reportBankConnectIssueToMaps");
    }
    else if (self->_canPerformCancelAccountServicePayment)
    {
      if (!self->_cancelingPayment)
      {
        self->_cancelingPayment = 1;
        v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        activityIndicator = self->_activityIndicator;
        self->_activityIndicator = v5;

        -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
        -[PKReportIssueViewController navigationItem](self, "navigationItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_activityIndicator);
        objc_msgSend(v7, "setRightBarButtonItem:", v8);

        v9 = (void *)MEMORY[0x1E0DC3450];
        PKLocalizedFeatureString();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v11, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedFeatureString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = MEMORY[0x1E0C809B0];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __51__PKReportIssueViewController__submitButtonTapped___block_invoke;
        v22[3] = &unk_1E3E61D68;
        v22[4] = self;
        objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 2, v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAction:", v16);

        v17 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedFeatureString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v15;
        v21[1] = 3221225472;
        v21[2] = __51__PKReportIssueViewController__submitButtonTapped___block_invoke_2;
        v21[3] = &unk_1E3E61D68;
        v21[4] = self;
        objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAction:", v19);

        -[PKReportIssueViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
      }
    }
    else
    {
      selectedIssue = self->_selectedIssue;
      if (selectedIssue <= 5)
      {
        if (selectedIssue == 2)
          -[PKReportIssueViewController _reportIssueToMaps](self, "_reportIssueToMaps");
        else
          -[PKReportIssueViewController _reportIssueInBusinessChat](self, "_reportIssueInBusinessChat");
      }
    }
  }

}

uint64_t __51__PKReportIssueViewController__submitButtonTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelPayment");
}

uint64_t __51__PKReportIssueViewController__submitButtonTapped___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_reportIssueInBusinessChat");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1256) = 0;
  return result;
}

- (void)_cancelPayment
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PKPaymentWebService *paymentWebService;
  PKPaymentWebService *v10;
  PKPaymentWebService *v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[PKPaymentTransaction payments](self->_transaction, "payments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0D66970]);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccountIdentifier:", v6);

  -[PKAccount accountBaseURL](self->_account, "accountBaseURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBaseURL:", v7);

  objc_msgSend(v4, "referenceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaymentReferenceIdentifier:", v8);

  objc_initWeak(&location, self);
  paymentWebService = self->_paymentWebService;
  if (!paymentWebService)
  {
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v10 = (PKPaymentWebService *)objc_claimAutoreleasedReturnValue();
    v11 = self->_paymentWebService;
    self->_paymentWebService = v10;

    paymentWebService = self->_paymentWebService;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__PKReportIssueViewController__cancelPayment__block_invoke;
  v12[3] = &unk_1E3E766C8;
  objc_copyWeak(&v13, &location);
  -[PKPaymentWebService cancelPaymentWithRequest:completion:](paymentWebService, "cancelPaymentWithRequest:completion:", v5, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __45__PKReportIssueViewController__cancelPayment__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Cancel Payment => %@:%@", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PKReportIssueViewController__cancelPayment__block_invoke_112;
  v9[3] = &unk_1E3E61B68;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  v10 = v6;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v11);
}

void __45__PKReportIssueViewController__cancelPayment__block_invoke_112(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1256] = 0;
    objc_msgSend(WeakRetained, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItem:", *((_QWORD *)v3 + 147));

    if (*(_QWORD *)(a1 + 32))
    {
      v5 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedFeatureString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedFeatureString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __45__PKReportIssueViewController__cancelPayment__block_invoke_2;
      v18[3] = &unk_1E3E61D68;
      v18[4] = v3;
      objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:", v11);

      v12 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedFeatureString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:", v14);

      objc_msgSend(v3, "presentViewController:animated:completion:", v8, 1, 0);
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x1E0D672B0]);
      v15 = *((id *)v3 + 135);
      objc_msgSend(v15, "setTransactionStatus:", 5);
      objc_msgSend(v15, "transactionSourceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __45__PKReportIssueViewController__cancelPayment__block_invoke_3;
      v17[3] = &unk_1E3E68110;
      v17[4] = v3;
      objc_msgSend(v8, "insertOrUpdatePaymentTransaction:forTransactionSourceIdentifier:completion:", v15, v16, v17);

    }
  }

}

uint64_t __45__PKReportIssueViewController__cancelPayment__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportIssueInBusinessChat");
}

void __45__PKReportIssueViewController__cancelPayment__block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PKReportIssueViewController__cancelPayment__block_invoke_4;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __45__PKReportIssueViewController__cancelPayment__block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_reportIssueInBusinessChat
{
  int64_t selectedIssue;
  uint64_t v4;
  unint64_t selectedDisputeType;
  void *v6;
  PKFamilyMemberCollection *familyCollection;
  void *v8;
  void *v9;
  PKBusinessChatTransactionDisputeContext *v10;
  void *v11;
  PKBusinessChatTransactionDisputeContext *v12;
  PKBusinessChatController *v13;
  PKBusinessChatController *businessChatController;
  PKBusinessChatController *v15;
  _QWORD v16[4];
  id v17;
  id location;

  if (+[PKBusinessChatController deviceSupportsBusinessChat](PKBusinessChatController, "deviceSupportsBusinessChat")&& !self->_reportingIssue)
  {
    selectedIssue = self->_selectedIssue;
    if ((unint64_t)(selectedIssue - 3) >= 3)
    {
      if (selectedIssue)
      {
        if (selectedIssue == 1)
          v4 = 0;
        else
          v4 = 5;
      }
      else
      {
        selectedDisputeType = self->_selectedDisputeType;
        if (selectedDisputeType < 4)
          v4 = selectedDisputeType + 1;
        else
          v4 = 5;
      }
    }
    else if (-[PKPaymentTransaction transactionType](self->_transaction, "transactionType") == 10)
    {
      v4 = 9;
    }
    else
    {
      v4 = 5;
    }
    self->_reportingIssue = 1;
    -[PKReportIssueViewController _updateNavigationButtons](self, "_updateNavigationButtons");
    -[PKAccountUserCollection accountUserForTransaction:](self->_accountUserCollection, "accountUserForTransaction:", self->_transaction);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    familyCollection = self->_familyCollection;
    objc_msgSend(v6, "altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFamilyMemberCollection familyMemberForAltDSID:](familyCollection, "familyMemberForAltDSID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = [PKBusinessChatTransactionDisputeContext alloc];
    -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKBusinessChatTransactionDisputeContext initWithPaymentPass:transaction:account:accountUser:familyMember:physicalCards:intent:](v10, "initWithPaymentPass:transaction:account:accountUser:familyMember:physicalCards:intent:", v11, self->_transaction, self->_account, v6, v9, self->_physicalCards, v4);

    if (!self->_businessChatController)
    {
      v13 = objc_alloc_init(PKBusinessChatController);
      businessChatController = self->_businessChatController;
      self->_businessChatController = v13;

    }
    objc_initWeak(&location, self);
    v15 = self->_businessChatController;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__PKReportIssueViewController__reportIssueInBusinessChat__block_invoke;
    v16[3] = &unk_1E3E61DB8;
    objc_copyWeak(&v17, &location);
    -[PKBusinessChatController openBusinessChatWithContext:completion:](v15, "openBusinessChatWithContext:completion:", v12, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
}

void __57__PKReportIssueViewController__reportIssueInBusinessChat__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PKReportIssueViewController__reportIssueInBusinessChat__block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __57__PKReportIssueViewController__reportIssueInBusinessChat__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[1240] = 0;
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateNavigationButtons");
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
      objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);
    }
    else
    {
      objc_msgSend(v5, "presentingViewController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
    }

    WeakRetained = v5;
  }

}

- (void)_resetMapsMerchantAndBrandWithIssueReportIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  PKPaymentService *paymentService;
  PKPaymentTransaction *transaction;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  paymentService = self->_paymentService;
  transaction = self->_transaction;
  v9 = a3;
  -[PKPaymentTransaction identifier](transaction, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTransaction transactionSourceIdentifier](self->_transaction, "transactionSourceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__PKReportIssueViewController__resetMapsMerchantAndBrandWithIssueReportIdentifier_completion___block_invoke;
  v13[3] = &unk_1E3E766F0;
  v14 = v6;
  v12 = v6;
  -[PKPaymentService removeMapsDataForTransactionWithIdentifier:forTransactionSourceIdentifier:issueReportIdentifier:completion:](paymentService, "removeMapsDataForTransactionWithIdentifier:forTransactionSourceIdentifier:issueReportIdentifier:completion:", v10, v11, v9, v13);

}

uint64_t __94__PKReportIssueViewController__resetMapsMerchantAndBrandWithIssueReportIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (void)_reprocessTransactionMerchantWithIssueReportIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  PKPaymentTransaction *transaction;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[PKPaymentTransaction transactionSourceIdentifier](self->_transaction, "transactionSourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionSourceCollection transactionSourceForTransactionSourceIdentifier:](self->_transactionSourceCollection, "transactionSourceForTransactionSourceIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paymentPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0D67710]);
  transaction = self->_transaction;
  objc_msgSend(v10, "devicePrimaryPaymentApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithTransaction:paymentApplication:", transaction, v13);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66E68]), "initWithSource:", v14);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__PKReportIssueViewController__reprocessTransactionMerchantWithIssueReportIdentifier_completion___block_invoke;
  v19[3] = &unk_1E3E76718;
  v19[4] = self;
  v20 = v6;
  v21 = v8;
  v22 = v7;
  v16 = v7;
  v17 = v8;
  v18 = v6;
  objc_msgSend(v15, "startLookupWithCompletion:", v19);

}

void __97__PKReportIssueViewController__reprocessTransactionMerchantWithIssueReportIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__PKReportIssueViewController__reprocessTransactionMerchantWithIssueReportIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E3E669B8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __97__PKReportIssueViewController__reprocessTransactionMerchantWithIssueReportIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v2 = objc_msgSend(*(id *)(a1 + 32), "result");
  v3 = *(id **)(a1 + 40);
  if (v2 != 2)
  {
    objc_msgSend(v3, "_resetMapsMerchantAndBrandWithIssueReportIdentifier:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    return;
  }
  objc_msgSend(v3[135], "merchant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "merchant");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "brand");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)v5, "identifier");
  objc_msgSend(v4, "mapsMerchant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 != objc_msgSend(v8, "identifier"))
  {

LABEL_9:
    objc_msgSend(v4, "setMapsMerchant:", v5);
    objc_msgSend(v4, "setMapsBrand:", v6);
    objc_msgSend(v4, "setFallbackcategory:", objc_msgSend(*(id *)(a1 + 32), "fallbackCategory"));
    objc_msgSend(v4, "setMapsDataIsFromLocalMatch:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1080), "setIssueReportIdentifier:", *(_QWORD *)(a1 + 48));
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 1128);
    v14 = *(_QWORD *)(v12 + 1080);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __97__PKReportIssueViewController__reprocessTransactionMerchantWithIssueReportIdentifier_completion___block_invoke_3;
    v16[3] = &unk_1E3E766F0;
    v15 = *(_QWORD *)(a1 + 56);
    v17 = *(id *)(a1 + 64);
    objc_msgSend(v13, "insertOrUpdatePaymentTransaction:forTransactionSourceIdentifier:completion:", v14, v15, v16);

    goto LABEL_10;
  }
  v9 = objc_msgSend((id)v6, "identifier");
  objc_msgSend(v4, "mapsBrand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "identifier");

  if (v9 != v11 || v5 | v6 && objc_msgSend(v4, "mapsDataIsFromLocalMatch"))
    goto LABEL_9;
  objc_msgSend(*(id *)(a1 + 40), "_resetMapsMerchantAndBrandWithIssueReportIdentifier:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
LABEL_10:

}

uint64_t __97__PKReportIssueViewController__reprocessTransactionMerchantWithIssueReportIdentifier_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

- (void)_reportBankConnectIssueToMaps
{
  unint64_t selectedMapsIssue;
  PKPaymentTransaction *transaction;
  FKInstitution *bankConnectInstitution;
  void *v6;
  FKPIIStringProcessor *bankConnectPIIStringProcessor;
  PKPaymentPass *paymentPass;
  PKPaymentTransaction *v9;
  FKInstitution *v10;
  id v11;
  FKPIIStringProcessor *v12;
  PKPaymentPass *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  const __CFString *v26;
  double v27;
  double v28;
  PKPaymentTransaction *v29;
  FKPIIStringProcessor *v30;
  PKPaymentPass *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  uint64_t v50;
  PKPaymentTransaction *v51;
  Class (__cdecl *v52)();
  FKPIIStringProcessor *v53;
  PKPaymentPass *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  PKPaymentTransaction *v99;
  void *v100;
  PKReportIssueViewController *v101;
  void *v102;
  void *v103;
  FKPIIStringProcessor *v104;
  void *v105;
  const __CFString *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  FKInstitution *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  PKPaymentPass *v121;
  PKPaymentPass *v122;
  void *v123;
  id v124;
  void *v125;

  if (self->_reportingIssue || !self->_hasMapsIssueSelected)
    return;
  self->_reportingIssue = 1;
  -[PKReportIssueViewController _updateNavigationButtons](self, "_updateNavigationButtons");
  selectedMapsIssue = self->_selectedMapsIssue;
  if (selectedMapsIssue > 2)
    v98 = 0;
  else
    v98 = qword_19DF17A08[selectedMapsIssue];
  transaction = self->_transaction;
  bankConnectInstitution = self->_bankConnectInstitution;
  -[PKReportIssueViewController _reportComments](self, "_reportComments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  bankConnectPIIStringProcessor = self->_bankConnectPIIStringProcessor;
  paymentPass = self->_paymentPass;
  v9 = transaction;
  v10 = bankConnectInstitution;
  v11 = v6;
  v12 = bankConnectPIIStringProcessor;
  v13 = paymentPass;
  -[PKPaymentTransaction merchant](v9, "merchant");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mapsMerchant");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mapsBrand");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postalAddress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v11;
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0C973B0];
    objc_msgSend(v15, "postalAddress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringFromPostalAddress:style:", v18, 0);
    v19 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  -[PKPaymentTransaction location](v9, "location");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "coordinate");
  v22 = v21;
  v24 = v23;

  v124 = objc_alloc(off_1EE4C6368());
  v112 = objc_msgSend(v14, "industryCode");
  v118 = v15;
  if (objc_msgSend(v15, "identifier"))
    v25 = v15;
  else
    v25 = v123;
  v110 = objc_msgSend(v25, "identifier");
  objc_msgSend(v14, "name");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rawName");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "industryCategory");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "originURL");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "absoluteString");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = &stru_1E3E7D690;
  v117 = (void *)v19;
  if (v19)
    v26 = (const __CFString *)v19;
  v106 = v26;
  -[PKPaymentTransaction transactionDate](v9, "transactionDate");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "timeIntervalSince1970");
  v28 = v27;
  -[PKPaymentTransaction transactionType](v9, "transactionType");
  PKPaymentTransactionTypeToString();
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v9;
  v30 = v12;
  v31 = v13;
  v116 = v10;
  -[PKPaymentTransaction bankConnectMetadata](v29, "bankConnectMetadata");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_alloc(MEMORY[0x1E0C99E60]);
  v121 = v31;
  -[PKPaymentPass issuerCountryCode](v31, "issuerCountryCode");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "initWithObjects:", v34, 0);

  -[PKPaymentTransaction merchantProvidedDescription](v29, "merchantProvidedDescription");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[FKPIIStringProcessor redactFromString:forCountryCodes:](v30, "redactFromString:forCountryCodes:", v36, v35);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "originalTransactionDescription");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[FKPIIStringProcessor redactFromString:forCountryCodes:](v30, "redactFromString:forCountryCodes:", v37, v35);
  v38 = objc_claimAutoreleasedReturnValue();

  v39 = objc_alloc_init(off_1EE4C6370());
  v40 = -[PKPaymentTransaction transactionType](v29, "transactionType");
  v41 = 0;
  if (v40 <= 0x16)
    v41 = qword_19DF178F0[v40];
  objc_msgSend(v39, "setTransactionType:", v41);
  objc_msgSend(v39, "setBankTransactionDescription:", v38);
  -[PKPaymentTransaction transactionDate](v29, "transactionDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "timeIntervalSinceReferenceDate");
  objc_msgSend(v39, "setTransactionTimestamp:");

  objc_msgSend(v32, "bankMerchantCategoryCode");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "integerValue");
  if (v44)
  {
    objc_msgSend(v39, "setIndustryCode:", v44);
  }
  else
  {
    -[PKPaymentTransaction merchant](v29, "merchant");
    v45 = v38;
    v46 = v32;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setIndustryCode:", objc_msgSend(v47, "industryCode"));

    v32 = v46;
    v38 = v45;
  }

  objc_msgSend(v39, "setEnableBrandMuidFallback:", 1);
  -[PKPaymentTransaction currencyCode](v29, "currencyCode");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTransactionCurrencyCode:", v48);

  v49 = -[PKPaymentTransaction transactionStatus](v29, "transactionStatus");
  v119 = v14;
  v105 = v32;
  v102 = (void *)v38;
  v103 = (void *)v35;
  v101 = self;
  if (v49 > 3)
    v50 = 0;
  else
    v50 = qword_19DF179A8[v49];
  objc_msgSend(v39, "setTransactionStatus:", v50);
  v51 = v29;
  v52 = (Class (__cdecl *)())off_1EE4C6378;
  v53 = v30;
  v54 = v121;
  v55 = objc_alloc_init(v52());
  -[PKPaymentTransaction bankConnectMetadata](v51, "bankConnectMetadata");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v51;
  -[PKPaymentTransaction merchant](v51, "merchant");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bankMerchantAddress");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bankMerchantName");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[PKPaymentPass issuerCountryCode](v54, "issuerCountryCode");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v54;

  v62 = (void *)objc_msgSend(v60, "initWithObjects:", v61, 0);
  -[FKPIIStringProcessor redactFromString:forCountryCodes:](v53, "redactFromString:forCountryCodes:", v59, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v53;

  objc_msgSend(v56, "bankMerchantNumber");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setMerchantId:", v64);

  objc_msgSend(v55, "setMerchantDoingBusinessAsName:", v63);
  objc_msgSend(v55, "setMerchantEnhancedName:", v63);
  objc_msgSend(v58, "city");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v65)
  {
    objc_msgSend(v55, "setMerchantCity:", v65);
  }
  else
  {
    objc_msgSend(v57, "city");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setMerchantCity:", v66);

  }
  objc_msgSend(v57, "rawCity");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setMerchantRawCity:", v67);

  objc_msgSend(v58, "state");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    objc_msgSend(v55, "setMerchantState:", v68);
  }
  else
  {
    objc_msgSend(v57, "state");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setMerchantState:", v69);

  }
  objc_msgSend(v57, "rawState");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setMerchantRawState:", v70);

  objc_msgSend(v58, "postalCode");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    objc_msgSend(v55, "setMerchantZip:", v71);
  }
  else
  {
    objc_msgSend(v57, "zip");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setMerchantZip:", v72);

  }
  objc_msgSend(v58, "street");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setMerchantAddress:", v73);

  objc_msgSend(v58, "street");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setMerchantRawAddress:", v74);

  objc_msgSend(v55, "setMerchantCleanConfidenceLevel:", objc_msgSend(v57, "cleanConfidenceLevel"));
  objc_msgSend(v57, "rawCANL");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setMerchantCanl:", v75);

  -[PKPaymentTransaction clearingNetworkData](v99, "clearingNetworkData");
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  if (v76)
  {
    v77 = (void *)MEMORY[0x1E0CB36D8];
    -[PKPaymentTransaction clearingNetworkData](v99, "clearingNetworkData");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:
    v80 = v78;
    objc_msgSend(v78, "dataUsingEncoding:", 4);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "JSONObjectWithData:options:error:", v81, 0, 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v82, "objectForKeyedSubscript:", *MEMORY[0x1E0D6B048]);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        if (v83)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v83, 0, 0);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v84, 4);
            objc_msgSend(v55, "setMerchantAdditionalData:", v85);

          }
        }
        objc_msgSend(v82, "objectForKeyedSubscript:", *MEMORY[0x1E0D6B038]);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setMerchantCountryCode:", v86);

        objc_msgSend(v82, "objectForKeyedSubscript:", *MEMORY[0x1E0D6B040]);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setMerchantType:", v87);

      }
    }
    goto LABEL_43;
  }
  -[PKPaymentTransaction authNetworkData](v99, "authNetworkData");
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    v77 = (void *)MEMORY[0x1E0CB36D8];
    -[PKPaymentTransaction authNetworkData](v99, "authNetworkData");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  v82 = 0;
LABEL_43:

  objc_msgSend(v39, "setMerchantInformation:", v55);
  objc_msgSend(v39, "setBankTransactionDescriptionClean:", v100);
  -[FKInstitution institutionIdentifier](v116, "institutionIdentifier");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "setBankIdentifier:", v88);
  v125 = (void *)objc_msgSend(v124, "initForMerchantIssue:merchantIndustryCode:mapsIdentifier:merchantName:merchantRawName:merchantIndustryCategory:merchantURL:merchantFormattedAddress:transactionTime:transactionType:transactionLocation:bankTransactionInformation:", v98, v112, v110, v115, v114, v113, v28, v22, v24, v109, v106, v107, v39);

  if (v125)
  {
    -[PKPaymentTransaction issueReportIdentifier](v99, "issueReportIdentifier");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v89, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "UUIDString");
      v91 = objc_claimAutoreleasedReturnValue();

      v89 = (void *)v91;
    }
    objc_msgSend(v125, "setIsAppleCard:", 0);
    v92 = -[PKPaymentTransaction transactionSource](v99, "transactionSource");
    -[PKPaymentTransaction transactionType](v99, "transactionType");
    if ((unint64_t)(v92 - 1) > 7)
      v93 = 0;
    else
      v93 = qword_19DF179C8[v92 - 1];
    objc_msgSend(v125, "setLookupTransactionType:", v93);
    if (-[PKPaymentTransaction hasEffectiveTransactionSource](v99, "hasEffectiveTransactionSource"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v119, "adamIdentifier"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "stringValue");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "setMerchantAdamId:", v95);

    }
    objc_msgSend(v125, "setCorrelationId:", v89);
    objc_msgSend(v125, "setReportersComment:", v120);

  }
  _MergedGlobals_12(v125, 1);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "correlationId");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKReportIssueViewController _submitBankConnectTicketToMaps:withCorrelationId:](v101, "_submitBankConnectTicketToMaps:withCorrelationId:", v96, v97);

}

- (void)_submitBankConnectTicketToMaps:(id)a3 withCorrelationId:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__PKReportIssueViewController__submitBankConnectTicketToMaps_withCorrelationId___block_invoke;
  v4[3] = &unk_1E3E76740;
  v4[4] = self;
  objc_msgSend(a3, "submitWithHandler:networkActivity:", v4, 0);
}

void __80__PKReportIssueViewController__submitBankConnectTicketToMaps_withCorrelationId___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__PKReportIssueViewController__submitBankConnectTicketToMaps_withCorrelationId___block_invoke_2;
  v8[3] = &unk_1E3E61388;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __80__PKReportIssueViewController__submitBankConnectTicketToMaps_withCorrelationId___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Submitted merchant issue to maps with error: %@", (uint8_t *)&v9, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1240) = 0;
  objc_msgSend(*(id *)(a1 + 40), "_updateNavigationButtons");
  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_ERROR_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_ERROR_MESSAGE");
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_SUCCESS_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_SUCCESS_MESSAGE");
  }
  PKLocalizedPaymentString(&v7->isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_presentAlertWithTitle:message:dismissAfter:", v6, v8, 1);

}

- (void)_reportIssueToMaps
{
  unint64_t selectedMapsIssue;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  if (!self->_reportingIssue && self->_hasMapsIssueSelected)
  {
    self->_reportingIssue = 1;
    -[PKReportIssueViewController _updateNavigationButtons](self, "_updateNavigationButtons");
    selectedMapsIssue = self->_selectedMapsIssue;
    if (selectedMapsIssue > 2)
      v4 = 0;
    else
      v4 = qword_19DF17A08[selectedMapsIssue];
    -[PKReportIssueViewController _reportComments](self, "_reportComments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC19F8]), "initForMerchantIssue:transaction:account:comments:", v4, self->_transaction, self->_account, v5);
    objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "feedbackTicketForWalletRAPReport:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__PKReportIssueViewController__reportIssueToMaps__block_invoke;
    v10[3] = &unk_1E3E76768;
    v10[4] = self;
    v11 = v6;
    v9 = v6;
    objc_msgSend(v8, "submitWithHandler:networkActivity:", v10, 0);

  }
}

void __49__PKReportIssueViewController__reportIssueToMaps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PKReportIssueViewController__reportIssueToMaps__block_invoke_2;
  block[3] = &unk_1E3E61400;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __49__PKReportIssueViewController__reportIssueToMaps__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "Submitted merchant issue to maps with error: %@", buf, 0xCu);
  }

  v4 = *(_BYTE **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    v4[1240] = 0;
    objc_msgSend(*(id *)(a1 + 40), "_updateNavigationButtons");
    v5 = *(void **)(a1 + 40);
    PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_ERROR_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_ERROR_MESSAGE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_presentAlertWithTitle:message:dismissAfter:", v6, v7, 1);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "correlationId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__PKReportIssueViewController__reportIssueToMaps__block_invoke_139;
    v9[3] = &unk_1E3E62288;
    v9[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "_reprocessTransactionMerchantWithIssueReportIdentifier:completion:", v8, v9);

  }
}

void __49__PKReportIssueViewController__reportIssueToMaps__block_invoke_139(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__PKReportIssueViewController__reportIssueToMaps__block_invoke_2_140;
  v2[3] = &unk_1E3E64C10;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

void __49__PKReportIssueViewController__reportIssueToMaps__block_invoke_2_140(uint64_t a1)
{
  int v2;
  void *v3;
  __CFString *v4;
  void *v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1240) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_updateNavigationButtons");
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_SUCCESS_TITLE"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_SUCCESS_MESSAGE");
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_ERROR_TITLE"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_ERROR_MESSAGE");
  }
  PKLocalizedPaymentString(&v4->isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_presentAlertWithTitle:message:dismissAfter:", v6, v5, 1);

}

- (id)_reportComments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[PKSectionTableViewController isSectionMapped:](self, "isSectionMapped:", 5))
  {
    -[PKReportIssueViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[PKSectionTableViewController indexForSection:](self, "indexForSection:", 5));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellForRowAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7 || !objc_msgSend(v7, "length"))
    {

      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 dismissAfter:(BOOL)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  BOOL v12;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_OK_BUTTON"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__PKReportIssueViewController__presentAlertWithTitle_message_dismissAfter___block_invoke;
  v11[3] = &unk_1E3E680E8;
  v12 = a5;
  v11[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v10);

  -[PKReportIssueViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

void __75__PKReportIssueViewController__presentAlertWithTitle_message_dismissAfter___block_invoke(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankConnectPIIStringProcessor, 0);
  objc_storeStrong((id *)&self->_bankConnectInstitution, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_statementName, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_submitButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_transactionCellController, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
