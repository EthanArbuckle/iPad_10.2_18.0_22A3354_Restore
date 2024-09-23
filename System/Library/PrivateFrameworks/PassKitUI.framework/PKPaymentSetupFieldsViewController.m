@implementation PKPaymentSetupFieldsViewController

- (PKPaymentSetupFieldsViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6
{
  id v11;
  id v12;
  id v13;
  PKPaymentSetupFieldsViewController *v14;
  PKPaymentSetupFieldsViewController *v15;
  id v16;
  uint64_t v17;
  NSMapTable *fieldIdentifierToCellMap;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentSetupFieldsViewController;
  v14 = -[PKPaymentSetupTableViewController initWithContext:](&v24, sel_initWithContext_, a4);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_webService, a3);
    objc_storeWeak((id *)&v15->_setupDelegate, v12);
    v16 = v13;
    if (!v13)
      v16 = objc_alloc_init(MEMORY[0x1E0D67300]);
    objc_storeStrong((id *)&v15->_fieldsModel, v16);
    if (!v13)

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    fieldIdentifierToCellMap = v15->_fieldIdentifierToCellMap;
    v15->_fieldIdentifierToCellMap = (NSMapTable *)v17;

    v15->_navigationEnabled = 1;
    v15->_rightBarButtonItemsEnabled = 0;
    v15->_cellsAreEnabled = 1;
    v19 = objc_alloc(MEMORY[0x1E0DC34F0]);
    PKLocalizedPaymentString(CFSTR("NEXT"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithTitle:style:target:action:", v20, 2, v15, sel__handleNextButtonTapped_);

    objc_msgSend(v21, "setEnabled:", v15->_rightBarButtonItemsEnabled);
    objc_msgSend(v21, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D98]);
    if (v21)
    {
      v25[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    objc_storeStrong((id *)&v15->_rightBarButtonItems, v22);
    if (v21)

    v15->_validationErrorCode = 0;
  }

  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  PKPaymentSetupFieldsModel *fieldsModel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSetupFieldsViewController;
  -[PKPaymentSetupFieldsViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[PKPaymentSetupFieldsModel visiblePaymentSetupFields](self->_fieldsModel, "visiblePaymentSetupFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    fieldsModel = self->_fieldsModel;
    -[PKPaymentSetupFieldsViewController defaultFields](self, "defaultFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldsModel updateWithPaymentSetupFields:](fieldsModel, "updateWithPaymentSetupFields:", v6);

  }
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E70]);

  -[PKPaymentSetupFieldsViewController headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTableHeaderView:", v8);

  -[PKPaymentSetupFieldsViewController footerView](self, "footerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTableFooterView:", v10);

  -[PKPaymentSetupFieldsViewController _updateNavigationItemAnimated:](self, "_updateNavigationItemAnimated:", 0);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSectionHeaderHeight:", 12.0);

}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupFieldsViewController;
  -[PKPaymentSetupTableViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[PKPaymentSetupFieldsViewController noteFieldIdentifiersChangedAndUpdateHeaders](self, "noteFieldIdentifiersChangedAndUpdateHeaders");
  -[PKPaymentSetupFieldsViewController _setRightBarButtonItemsEnabled:](self, "_setRightBarButtonItemsEnabled:", -[PKPaymentSetupFieldsViewController isComplete](self, "isComplete"));
  if (-[PKPaymentSetupFieldsViewController shouldAppearWithFirstEmptyFieldAsFirstResponder](self, "shouldAppearWithFirstEmptyFieldAsFirstResponder"))
  {
    -[PKPaymentSetupFieldsViewController firstEmptyField](self, "firstEmptyField");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject window](v4, "window");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[PKPaymentSetupFieldsViewController firstEmptyCell](self, "firstEmptyCell");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "becomeFirstResponder");

      if ((v8 & 1) != 0)
        return;
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        -[PKPaymentSetupFieldsViewController firstEmptyCell](self, "firstEmptyCell");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v9;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "-[%@ becomeFirstResponder]; failed.", buf, 0xCu);

      }
    }

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupFieldsViewController;
  -[PKPaymentSetupTableViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  if (-[PKPaymentSetupFieldsViewController shouldAppearWithFirstEmptyFieldAsFirstResponder](self, "shouldAppearWithFirstEmptyFieldAsFirstResponder"))
  {
    -[PKPaymentSetupFieldsViewController firstEmptyField](self, "firstEmptyField");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject window](v4, "window");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[PKPaymentSetupFieldsViewController firstEmptyCell](self, "firstEmptyCell");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "becomeFirstResponder");

      if ((v8 & 1) != 0)
        return;
      PKLogFacilityTypeGetObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        -[PKPaymentSetupFieldsViewController firstEmptyCell](self, "firstEmptyCell");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v9;
        _os_log_impl(&dword_19D178000, v4, OS_LOG_TYPE_DEFAULT, "-[%@ becomeFirstResponder]; failed.", buf, 0xCu);

      }
    }

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentSetupFieldsViewController;
  -[PKPaymentSetupTableViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  -[PKPaymentSetupFieldCell resignFirstResponder](self->_activeEditingCell, "resignFirstResponder");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupFieldsViewController;
  -[PKPaymentSetupFieldsViewController viewDidLayoutSubviews](&v9, sel_viewDidLayoutSubviews);
  -[PKPaymentSetupFieldsViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "_tableHeaderHeightDidChangeToHeight:", CGRectGetHeight(v10));

  -[PKPaymentSetupFieldsViewController footerView](self, "footerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeToFit");

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController footerView](self, "footerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "_tableFooterHeightDidChangeToHeight:", CGRectGetHeight(v11));

}

- (BOOL)shouldAppearWithFirstEmptyFieldAsFirstResponder
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  BOOL v18;

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;

  -[PKPaymentSetupFieldsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v7;
  v9 = PKUIGetMinScreenType();
  v10 = (double *)((char *)&unk_19DF16D20 + 8 * v9);
  if (v9 >= 0x12)
    v10 = (double *)(MEMORY[0x1E0C9D820] + 8);
  v11 = *v10;
  objc_msgSend(MEMORY[0x1E0DC3938], "defaultSizeForInterfaceOrientation:", 1);
  v13 = v12;
  -[PKPaymentSetupFieldsViewController firstEmptySetupField](self, "firstEmptySetupField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isOptional");

  -[PKPaymentSetupTableViewController footerAttributedText](self, "footerAttributedText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  v18 = 0;
  if ((v15 & 1) == 0 && !v17 && v8 + v5 + v13 < v11)
    v18 = !self->_showingActivitySpinner;

  return v18;
}

- (id)headerView
{
  PKTableHeaderView *headerView;
  PKTableHeaderView *v4;
  PKTableHeaderView *v5;
  PKTableHeaderView *v6;
  void *v7;
  uint64_t v8;
  PKTableHeaderView *v9;
  uint64_t IsSetupAssistant;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = [PKTableHeaderView alloc];
    v5 = -[PKTableHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_headerView;
    self->_headerView = v5;

    -[PKTableHeaderView setTopPadding:](self->_headerView, "setTopPadding:", 20.0);
    -[PKTableHeaderView setBottomPadding:](self->_headerView, "setBottomPadding:", 16.0);
    -[PKPaymentSetupFieldsViewController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    v9 = self->_headerView;
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[PKPaymentSetupTableViewController context](self, "context");
      IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
    }
    else
    {
      IsSetupAssistant = 0;
    }
    -[PKTableHeaderView setStyle:](v9, "setStyle:", IsSetupAssistant);
    -[PKTableHeaderView setShouldReserveSubtitleHeight:](self->_headerView, "setShouldReserveSubtitleHeight:", 1);
    -[PKPaymentSetupFieldsViewController reloadHeaderView](self, "reloadHeaderView");
    headerView = self->_headerView;
  }
  return headerView;
}

- (void)reloadHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKTableHeaderView *headerView;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;

  -[PKTableHeaderView titleLabel](self->_headerView, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController defaultHeaderViewTitle](self, "defaultHeaderViewTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  -[PKTableHeaderView subtitleLabel](self->_headerView, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController defaultHeaderViewSubTitle](self, "defaultHeaderViewSubTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  headerView = self->_headerView;
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  -[PKTableHeaderView sizeThatFits:](headerView, "sizeThatFits:", CGRectGetWidth(v13), 3.40282347e38);
  v10 = v9;
  v12 = v11;

  -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v10, v12);
}

- (id)footerView
{
  return 0;
}

- (BOOL)isComplete
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  int v14;
  int v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PKPaymentSetupFieldsViewController visibleFieldIdentifiers](self, "visibleFieldIdentifiers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[PKPaymentSetupFieldsViewController fieldForIdentifier:](self, "fieldForIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentSetupFieldsViewController readonlyFieldIdentifiers](self, "readonlyFieldIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v9);

        LODWORD(v11) = objc_msgSend(v10, "isOptional");
        v13 = objc_msgSend(v10, "submissionStringMeetsAllRequirements");
        v14 = objc_msgSend(v10, "submissionStringMeetsValidationRegex");
        if ((_DWORD)v11)
          v15 = v14;
        else
          v15 = v13;
        v16 = v15 & v7;
        if ((v12 & 1) == 0)
          v7 = v16;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7 & 1;
}

- (void)_updateErrorFooterIfNeeded
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PKPaymentSetupFieldsViewController visibleFieldIdentifiers](self, "visibleFieldIdentifiers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[PKPaymentSetupFieldsViewController cellForIdentifier:](self, "cellForIdentifier:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isShowingError"))
        {
          -[PKPaymentSetupFieldsViewController fieldForIdentifier:](self, "fieldForIdentifier:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "textFieldObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v4 = objc_msgSend(v10, "codeOnError");
          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  if (self->_validationErrorCode != v4 && !self->_sectionIdentifiers)
  {
    self->_validationErrorCode = v4;
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_reloadSectionHeaderFooters:withRowAnimation:", v12, 5);

  }
}

- (void)setSectionIdentifiers:(id)a3
{
  NSMapTable *v5;
  NSMapTable *fieldIdentifierToFooterViewMap;
  void *v7;
  id v8;

  v8 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sectionIdentifiers, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    fieldIdentifierToFooterViewMap = self->_fieldIdentifierToFooterViewMap;
    self->_fieldIdentifierToFooterViewMap = v5;

    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

  }
}

- (id)displayedFooterField
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (-[PKPaymentSetupFieldsViewController shouldDisplayFooterField](self, "shouldDisplayFooterField"))
  {
    -[PKPaymentSetupFieldsModel footerPaymentSetupField](self->_fieldsModel, "footerPaymentSetupField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    if (v4 && self->_validationErrorCode)
    {
      -[PKPaymentSetupFieldsViewController _footerTextForValidationError](self, "_footerTextForValidationError");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = objc_alloc(MEMORY[0x1E0CB3498]);
        v11 = *MEMORY[0x1E0DC1140];
        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v8);

        objc_msgSend(v4, "setBody:", v9);
      }

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_footerTextForValidationError
{
  unint64_t v2;

  v2 = self->_validationErrorCode - 60043;
  if (v2 > 0xA || ((0x683u >> (LOBYTE(self->_validationErrorCode) + 117)) & 1) == 0)
    return 0;
  PKLocalizedPeerPaymentString(&off_1E3E71AD0[v2]->isa);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  NSArray *sectionIdentifiers;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  sectionIdentifiers = self->_sectionIdentifiers;
  if (!sectionIdentifiers)
    return *MEMORY[0x1E0DC53D8];
  -[NSArray objectAtIndexedSubscript:](sectionIdentifiers, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentSetupFieldsViewController footerViewForIdentifier:](self, "footerViewForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  NSArray *sectionIdentifiers;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  sectionIdentifiers = self->_sectionIdentifiers;
  if (sectionIdentifiers)
  {
    -[NSArray objectAtIndexedSubscript:](sectionIdentifiers, "objectAtIndexedSubscript:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentSetupFieldsViewController footerViewForIdentifier:](self, "footerViewForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentSetupFieldsViewController displayedFooterField](self, "displayedFooterField", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && -[PKPaymentSetupFieldsViewController shouldDisplayFooterFieldInline:](self, "shouldDisplayFooterFieldInline:", v7))
    {
      -[PKPaymentSetupFieldsViewController footerHyperlinkView](self, "footerHyperlinkView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "body");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAttributedText:", v9);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  NSArray *sectionIdentifiers;

  sectionIdentifiers = self->_sectionIdentifiers;
  if (sectionIdentifiers)
    return -[NSArray count](sectionIdentifiers, "count", a3);
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  if (self->_sectionIdentifiers)
    -[NSArray objectAtIndexedSubscript:](self->_sectionIdentifiers, "objectAtIndexedSubscript:", a4);
  else
    -[PKPaymentSetupFieldsViewController visibleFieldIdentifiers](self, "visibleFieldIdentifiers", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;

  -[PKPaymentSetupFieldsViewController identifierForIndexPath:](self, "identifierForIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController cellForIdentifier:](self, "cellForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);
  -[PKPaymentSetupFieldsViewController readonlyFieldIdentifiers](self, "readonlyFieldIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if (self->_cellsAreEnabled)
    objc_msgSend(v6, "setEnabled:", v8 ^ 1u);

  return v6;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGRect v20;

  v6 = a3;
  -[PKPaymentSetupFieldsViewController identifierForIndexPath:](self, "identifierForIndexPath:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController cellForIdentifier:](self, "cellForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  objc_msgSend(v8, "heightForWidth:", CGRectGetWidth(v20));
  v18 = v17;

  return v18;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  v8 = a4;
  v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentSetupFieldsViewController;
  -[PKPaymentSetupTableViewController tableView:willDisplayCell:forRowAtIndexPath:](&v23, sel_tableView_willDisplayCell_forRowAtIndexPath_, a3, v8, v9);
  -[PKPaymentSetupFieldsViewController visibleFieldIdentifiersForSection:](self, "visibleFieldIdentifiersForSection:", objc_msgSend(v9, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 18.0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  -[PKPaymentSetupFieldsModel minimumRequiredWidthForFieldIdentifiers:withFont:](self->_fieldsModel, "minimumRequiredWidthForFieldIdentifiers:withFont:", v10, v15);
  PKFloatCeilToPixel();
  objc_msgSend(v8, "setMinimumTextLabelWidth:");
  objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "row"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController fieldForIdentifier:](self, "fieldForIdentifier:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v9, "row") + 1;
  if (v18 >= objc_msgSend(v10, "count"))
  {
    v21 = objc_msgSend(v17, "isFieldTypeLabel") ^ 1;
LABEL_12:
    v22 = v21;
    goto LABEL_13;
  }
  objc_msgSend(v10, "objectAtIndexedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[PKPaymentSetupFieldsViewController fieldForIdentifier:](self, "fieldForIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  if ((objc_msgSend(v17, "isFieldTypeLabel") & 1) != 0)
  {
    if (!v20)
    {
      v21 = 0;
      v22 = 0;
      goto LABEL_13;
    }
    v21 = objc_msgSend(v20, "isFieldTypeLabel") ^ 1;

    goto LABEL_12;
  }
  if (v20)
  {
    v22 = objc_msgSend(v20, "isFieldTypeLabel");

    v21 = 1;
  }
  else
  {
    v21 = 1;
    v22 = 1;
  }
LABEL_13:
  objc_msgSend(v8, "setShouldDrawSeperator:", v21);
  objc_msgSend(v8, "setShouldDrawFullWidthSeperator:", v22);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldsViewController;
  v5 = a4;
  v6 = a3;
  -[PKPaymentSetupTableViewController tableView:didSelectRowAtIndexPath:](&v8, sel_tableView_didSelectRowAtIndexPath_, v6, v5);
  objc_msgSend(v6, "cellForRowAtIndexPath:", v5, v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "becomeFirstResponder");
}

- (BOOL)fieldCellEditableTextFieldShouldBeginEditing:(id)a3
{
  id v4;
  _QWORD block[5];

  v4 = a3;
  if (!self->_hasScrolledToShowFields)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__PKPaymentSetupFieldsViewController_fieldCellEditableTextFieldShouldBeginEditing___block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    self->_hasScrolledToShowFields = 1;
  }
  PKPaymentSetupApplyContextAppearance(-[PKPaymentSetupTableViewController context](self, "context"), v4);

  return 1;
}

void __83__PKPaymentSetupFieldsViewController_fieldCellEditableTextFieldShouldBeginEditing___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollToRowAtIndexPath:atScrollPosition:animated:", v1, 2, 1);

}

- (void)fieldCellEditableTextFieldDidBeginEditing:(id)a3
{
  PKPaymentSetupFieldCell *v4;
  PKPaymentSetupFieldCell *activeEditingCell;

  v4 = (PKPaymentSetupFieldCell *)a3;
  if (-[PKPaymentSetupFieldCell usesCustomInputView](v4, "usesCustomInputView"))
    -[PKPaymentSetupFieldsViewController fieldCellEditableTextFieldValueDidChange:](self, "fieldCellEditableTextFieldValueDidChange:", v4);
  activeEditingCell = self->_activeEditingCell;
  self->_activeEditingCell = v4;

}

- (void)fieldCellEditableTextFieldDidEndEditing:(id)a3
{
  PKPaymentSetupFieldCell *activeEditingCell;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "usesCustomInputView"))
    -[PKPaymentSetupFieldsViewController fieldCellEditableTextFieldValueDidChange:](self, "fieldCellEditableTextFieldValueDidChange:", v5);
  -[PKPaymentSetupFieldsViewController _updateErrorFooterIfNeeded](self, "_updateErrorFooterIfNeeded");
  activeEditingCell = self->_activeEditingCell;
  self->_activeEditingCell = 0;

}

- (void)fieldCellEditableTextFieldValueDidChange:(id)a3
{
  -[PKPaymentSetupFieldsViewController _setRightBarButtonItemsEnabled:](self, "_setRightBarButtonItemsEnabled:", -[PKPaymentSetupFieldsViewController isComplete](self, "isComplete", a3));
  -[PKPaymentSetupFieldsViewController _updateErrorFooterIfNeeded](self, "_updateErrorFooterIfNeeded");
}

- (BOOL)fieldCellEditableTextFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasText");

  if (v6)
  {
    objc_msgSend(v4, "paymentSetupField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldsViewController nextResponderCellForCurrentIdentifier:](self, "nextResponderCellForCurrentIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "becomeFirstResponder");
    }
    else if (-[PKPaymentSetupFieldsViewController isComplete](self, "isComplete"))
    {
      -[PKPaymentSetupFieldsViewController handleNextButtonTapped:](self, "handleNextButtonTapped:", self);
    }

  }
  return 0;
}

- (BOOL)fieldCellEditableTextFieldShouldClear:(id)a3
{
  return 1;
}

- (void)fieldCellDidTapButton:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "paymentSetupField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFieldTypeLabel");

  if (v5)
  {
    objc_msgSend(v8, "paymentSetupField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "labelFieldObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentSetupFieldsViewController _fieldLabelDidTapButton:](self, "_fieldLabelDidTapButton:", v7);
  }

}

- (BOOL)fieldCell:(id)a3 supportsKeyboardAccessory:(unint64_t)a4
{
  return 0;
}

- (void)_fieldLabelDidTapButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PKNavigationController *v11;
  void *v12;
  PKPaymentMoreInformationViewController *v13;

  v4 = a3;
  v13 = -[PKPaymentMoreInformationViewController initWithContext:]([PKPaymentMoreInformationViewController alloc], "initWithContext:", -[PKPaymentSetupTableViewController context](self, "context"));
  objc_msgSend(v4, "detailTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMoreInformationViewController setDetailTitle:](v13, "setDetailTitle:", v5);

  objc_msgSend(v4, "detailSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMoreInformationViewController setDetailSubtitle:](v13, "setDetailSubtitle:", v6);

  objc_msgSend(v4, "detailBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMoreInformationViewController setDetailBody:](v13, "setDetailBody:", v7);

  objc_msgSend(v4, "businessChatIntentName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMoreInformationViewController setBusinessChatIntentName:](v13, "setBusinessChatIntentName:", v8);

  objc_msgSend(v4, "businessChatButtonTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMoreInformationViewController setBusinessChatButtonTitle:](v13, "setBusinessChatButtonTitle:", v9);

  objc_msgSend(v4, "businessChatIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentMoreInformationViewController setBusinessChatIdentifier:](v13, "setBusinessChatIdentifier:", v10);
  v11 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v13);
  -[PKPaymentSetupFieldsViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentModalViewController:withPaymentSetupContext:", v11, -[PKPaymentSetupTableViewController context](self, "context"));

}

- (void)_handleNextButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (self->_rightBarButtonItemsEnabled)
  {
    v4 = a3;
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeAreaInsets");
    objc_msgSend(v5, "setContentOffset:animated:", 1, 0.0, -v7);

    -[PKPaymentSetupFieldsViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserInteractionEnabled:", 0);

    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstResponder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resignFirstResponder");

    -[PKPaymentSetupFieldsViewController handleNextButtonTapped:](self, "handleNextButtonTapped:", v4);
    -[PKPaymentSetupFieldsViewController navigationController](self, "navigationController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUserInteractionEnabled:", 1);

  }
}

- (void)handleNextButtonTapped:(id)a3
{
  -[PKPaymentSetupFieldsViewController _triggerNextActionLoop:](self, "_triggerNextActionLoop:", 1);
}

- (void)triggerNextActionLoop
{
  -[PKPaymentSetupFieldsViewController _triggerNextActionLoop:](self, "_triggerNextActionLoop:", 0);
}

- (void)_triggerNextActionLoop:(BOOL)a3
{
  if (!self->_performingNextActionLoop)
  {
    self->_performingNextActionLoop = 1;
    -[PKPaymentSetupFieldsViewController _continueNextActionLoop:](self, "_continueNextActionLoop:", a3);
  }
}

- (void)_continueNextActionLoop:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id currentNextActionBlock;
  _QWORD v10[5];
  id v11;
  _QWORD aBlock[4];
  id v13;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke;
  aBlock[3] = &unk_1E3E65F18;
  objc_copyWeak(&v13, &location);
  v6 = _Block_copy(aBlock);
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = _Block_copy(v7);
  currentNextActionBlock = self->_currentNextActionBlock;
  self->_currentNextActionBlock = v8;

  if (v3)
  {
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke_4;
    v10[3] = &unk_1E3E61850;
    v10[4] = self;
    v11 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
  else
  {
    -[PKPaymentSetupFieldsViewController handleNextActionWithCompletion:](self, "handleNextActionWithCompletion:", v7);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke_2;
  block[3] = &unk_1E3E67148;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke_2(uint64_t a1)
{
  id *v2;
  _BYTE *WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  char v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1185] = *(_BYTE *)(a1 + 48);
    if (*(_QWORD *)(a1 + 32))
    {
      if (!*(_BYTE *)(a1 + 48) && objc_msgSend(WeakRetained, "isShowingActivitySpinner"))
        objc_msgSend(v4, "hideActivitySpinner");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(unsigned __int8 *)(a1 + 48);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke_3;
      v7[3] = &unk_1E3E61C08;
      objc_copyWeak(&v8, v2);
      v9 = *(_BYTE *)(a1 + 48);
      objc_msgSend(v4, "handleNextActionError:shouldContinue:withCompletion:", v5, v6, v7);
      objc_destroyWeak(&v8);
    }
    else if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(WeakRetained, "_continueNextActionLoop:", 1);
    }
    else if (objc_msgSend(WeakRetained, "isShowingActivitySpinner"))
    {
      objc_msgSend(v4, "hideActivitySpinner");
    }
  }

}

void __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *(_BYTE *)(a1 + 40))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_continueNextActionLoop:", 1);
    WeakRetained = v3;
  }

}

uint64_t __62__PKPaymentSetupFieldsViewController__continueNextActionLoop___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNextActionWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)showActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4
{
  -[PKPaymentSetupFieldsViewController _setTableViewHeaderActivityIndicatorActive:title:subtitle:animated:](self, "_setTableViewHeaderActivityIndicatorActive:title:subtitle:animated:", 1, a3, a4, 1);
}

- (void)hideActivitySpinner
{
  id v3;

  -[PKPaymentSetupFieldsViewController defaultHeaderViewSubTitle](self, "defaultHeaderViewSubTitle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController hideActivitySpinnerWithTitle:subtitle:animated:](self, "hideActivitySpinnerWithTitle:subtitle:animated:", 0, v3, 1);

}

- (void)hideActivitySpinnerWithTitle:(id)a3 subtitle:(id)a4 animated:(BOOL)a5
{
  -[PKPaymentSetupFieldsViewController _setTableViewHeaderActivityIndicatorActive:title:subtitle:animated:](self, "_setTableViewHeaderActivityIndicatorActive:title:subtitle:animated:", 0, a3, a4, a5);
}

- (void)_setTableViewHeaderActivityIndicatorActive:(BOOL)a3 title:(id)a4 subtitle:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  _BOOL8 v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a6;
  v8 = a3;
  self->_showingActivitySpinner = a3;
  v10 = !a3;
  v11 = a5;
  v12 = a4;
  -[PKPaymentSetupFieldsViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserInteractionEnabled:", v10);

  -[PKPaymentSetupFieldsViewController _setNavigationBarEnabled:animated:](self, "_setNavigationBarEnabled:animated:", v10, v6);
  -[PKPaymentSetupFieldsViewController headerView](self, "headerView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activityIndicator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v10)
  {
    objc_msgSend(v14, "stopAnimating");
  }
  else if ((objc_msgSend(v14, "isAnimating") & 1) == 0)
  {
    objc_msgSend(v15, "startAnimating");
  }
  -[PKPaymentSetupFieldsViewController setHeaderViewTitle:subtitle:](self, "setHeaderViewTitle:subtitle:", v12, v11);
  -[PKPaymentSetupFieldsViewController footerView](self, "footerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setButtonsEnabled:", v10);

  -[PKPaymentSetupFieldsViewController _setIdleTimerDisabled:title:subtitle:](self, "_setIdleTimerDisabled:title:subtitle:", v8, v12, v11);
}

- (void)setHeaderViewTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;

  v17 = a3;
  v6 = a4;
  -[PKPaymentSetupFieldsViewController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t)v17;
  if (!v17)
  {
    -[PKPaymentSetupFieldsViewController defaultHeaderViewTitle](self, "defaultHeaderViewTitle");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (id)v8;
  objc_msgSend(v7, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v18);

  if (v6)
  {
    objc_msgSend(v7, "subtitleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v6);

  }
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v13 = v12;
  objc_msgSend(v11, "bounds");
  objc_msgSend(v7, "sizeThatFits:", v14, 1.79769313e308);
  if (v15 > v13)
  {
    v16 = v15;
    objc_msgSend(v11, "_rectForTableHeaderView");
    objc_msgSend(v7, "setFrame:");
    objc_msgSend(v11, "_tableHeaderHeightDidChangeToHeight:", v16);
  }
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)_setIdleTimerDisabled:(BOOL)a3 title:(id)a4 subtitle:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v6 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  PKLogFacilityTypeGetObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("enabled");
    v12 = 138413058;
    if (v6)
      v10 = CFSTR("disabled");
    v13 = v10;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = CFSTR("PaymentCardVerification");
    _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Payment Setup has %@ the Idle Timer. (For: %@ - %@) - %@.", (uint8_t *)&v12, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setIdleTimerDisabled:forReason:", v6, CFSTR("PaymentCardVerification"));

}

- (void)showCheckmarkAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[PKPaymentSetupFieldsViewController headerView](self, "headerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "checkmarkLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRevealed:animated:", 1, v3);

  objc_msgSend(v5, "setNeedsLayout");
}

- (void)endUserInteraction
{
  void *v3;
  id v4;

  -[PKPaymentSetupFieldsViewController _setNavigationBarEnabled:animated:](self, "_setNavigationBarEnabled:animated:", 0, 0);
  -[PKPaymentSetupFieldsViewController _destroyNavigationBarButtonItemsAnimated:](self, "_destroyNavigationBarButtonItemsAnimated:", 0);
  -[PKPaymentSetupFieldsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  -[PKPaymentSetupFieldsViewController footerView](self, "footerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setButtonsEnabled:", 0);

}

- (void)setHidesBackButton:(BOOL)a3 animated:(BOOL)a4
{
  self->_hidesBackButton = a3;
  -[PKPaymentSetupFieldsViewController _updateNavigationItemAnimated:](self, "_updateNavigationItemAnimated:", a4);
}

- (void)_setNavigationBarEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  if (self->_navigationEnabled != a3)
  {
    v4 = a4;
    self->_navigationEnabled = a3;
    -[PKPaymentSetupFieldsViewController navigationController](self, "navigationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", self->_navigationEnabled);

    objc_msgSend(v8, "interactivePopGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", self->_navigationEnabled);

    -[PKPaymentSetupFieldsViewController _updateNavigationItemAnimated:](self, "_updateNavigationItemAnimated:", v4);
  }
}

- (void)_setRightBarButtonItemsEnabled:(BOOL)a3
{
  if (self->_rightBarButtonItemsEnabled != a3)
  {
    self->_rightBarButtonItemsEnabled = a3;
    -[PKPaymentSetupFieldsViewController _updateRightBarButtonState](self, "_updateRightBarButtonState");
  }
}

- (void)_setLeftBarButtonItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *v6;
  NSArray *leftBarButtonItems;

  v4 = a4;
  v6 = (NSArray *)objc_msgSend(a3, "copy");
  leftBarButtonItems = self->_leftBarButtonItems;
  self->_leftBarButtonItems = v6;

  -[PKPaymentSetupFieldsViewController _updateNavigationItemAnimated:](self, "_updateNavigationItemAnimated:", v4);
}

- (void)_setRightBarButtonItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSArray *v6;
  NSArray *rightBarButtonItems;

  v4 = a4;
  v6 = (NSArray *)objc_msgSend(a3, "copy");
  rightBarButtonItems = self->_rightBarButtonItems;
  self->_rightBarButtonItems = v6;

  -[PKPaymentSetupFieldsViewController _updateNavigationItemAnimated:](self, "_updateNavigationItemAnimated:", v4);
}

- (void)_destroyNavigationBarButtonItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *leftBarButtonItems;
  _BOOL4 v6;
  NSArray *rightBarButtonItems;

  v3 = a3;
  leftBarButtonItems = self->_leftBarButtonItems;
  if (leftBarButtonItems)
    v6 = 1;
  else
    v6 = self->_rightBarButtonItems != 0;
  self->_leftBarButtonItems = 0;

  rightBarButtonItems = self->_rightBarButtonItems;
  self->_rightBarButtonItems = 0;

  self->_rightBarButtonItemsEnabled = 0;
  if (v6)
    -[PKPaymentSetupFieldsViewController _updateNavigationItemAnimated:](self, "_updateNavigationItemAnimated:", v3);
}

- (void)_updateNavigationItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL4 navigationEnabled;
  int v7;
  NSArray *leftBarButtonItems;
  NSArray *v9;
  void *v10;
  char v11;
  NSArray *rightBarButtonItems;
  NSArray *v13;
  void *v14;
  char v15;
  id v16;

  v3 = a3;
  -[PKPaymentSetupFieldsViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v5;
  if (self->_hidesBackButton)
  {
    objc_msgSend(v5, "setHidesBackButton:animated:", 1, v3);
  }
  else
  {
    navigationEnabled = self->_navigationEnabled;
    v7 = !self->_navigationEnabled;
    if (objc_msgSend(v5, "hidesBackButton") != v7)
      objc_msgSend(v16, "setHidesBackButton:animated:", !navigationEnabled, v3);
  }
  if (self->_navigationEnabled)
    leftBarButtonItems = self->_leftBarButtonItems;
  else
    leftBarButtonItems = 0;
  v9 = leftBarButtonItems;
  objc_msgSend(v16, "leftBarButtonItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = PKEqualObjects();

  if ((v11 & 1) == 0)
    objc_msgSend(v16, "setLeftBarButtonItems:animated:", v9, v3);
  if (self->_navigationEnabled)
    rightBarButtonItems = self->_rightBarButtonItems;
  else
    rightBarButtonItems = 0;
  v13 = rightBarButtonItems;

  objc_msgSend(v16, "rightBarButtonItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = PKEqualObjects();

  if ((v15 & 1) == 0)
    objc_msgSend(v16, "setRightBarButtonItems:animated:", v13, v3);
  -[PKPaymentSetupFieldsViewController _updateRightBarButtonState](self, "_updateRightBarButtonState");

}

- (void)_updateRightBarButtonState
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_rightBarButtonItems;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setEnabled:", self->_rightBarButtonItemsEnabled, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)defaultFields
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)visibleFieldIdentifiersForSection:(unint64_t)a3
{
  NSArray *sectionIdentifiers;
  void *v6;

  sectionIdentifiers = self->_sectionIdentifiers;
  if (sectionIdentifiers && -[NSArray count](sectionIdentifiers, "count") > a3)
  {
    -[NSArray objectAtIndexedSubscript:](self->_sectionIdentifiers, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentSetupFieldsViewController visibleFieldIdentifiers](self, "visibleFieldIdentifiers", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)visibleFieldIdentifiers
{
  void *v2;
  void *v3;

  -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleSetupFieldIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)readonlyFieldIdentifiers
{
  void *v2;
  void *v3;

  -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readonlySetupFieldIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)noteFieldIdentifiersChangedAndUpdateHeaders
{
  -[PKPaymentSetupFieldsViewController _noteFieldIdentifiersChangedUpdateHeaders:](self, "_noteFieldIdentifiersChangedUpdateHeaders:", 1);
}

- (void)noteFieldIdentifiersChanged
{
  -[PKPaymentSetupFieldsViewController _noteFieldIdentifiersChangedUpdateHeaders:](self, "_noteFieldIdentifiersChangedUpdateHeaders:", 0);
}

- (BOOL)shouldDisplayFooterField
{
  return 1;
}

- (void)_noteFieldIdentifiersChangedUpdateHeaders:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v15;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[PKPaymentSetupFieldsViewController firstResponderCell](self, "firstResponderCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setCanResignFirstResponder:", 0);
  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

  if (v3)
    -[PKPaymentSetupFieldsViewController reloadHeaderView](self, "reloadHeaderView");
  if (v6)
  {
    v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PKPaymentSetupFieldsViewController__noteFieldIdentifiersChangedUpdateHeaders___block_invoke;
    block[3] = &unk_1E3E612E8;
    v15 = v6;
    v9 = (void *)MEMORY[0x1E0C80D38];
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);

  }
  -[PKPaymentSetupFieldsViewController displayedFooterField](self, "displayedFooterField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && !-[PKPaymentSetupFieldsViewController shouldDisplayFooterFieldInline:](self, "shouldDisplayFooterFieldInline:", v10))
  {
    objc_msgSend(v10, "body");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupTableViewController setFooterAttributedText:](self, "setFooterAttributedText:", v11);

  }
  else
  {
    -[PKPaymentSetupTableViewController setFooterAttributedText:](self, "setFooterAttributedText:", 0);
  }
  -[PKPaymentSetupFieldsViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rightBarButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEnabled:", -[PKPaymentSetupFieldsViewController isComplete](self, "isComplete"));

}

uint64_t __80__PKPaymentSetupFieldsViewController__noteFieldIdentifiersChangedUpdateHeaders___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCanResignFirstResponder:", 1);
}

- (BOOL)shouldDisplayFooterFieldInline:(id)a3
{
  return !self->_sectionIdentifiers && objc_msgSend(a3, "position") == 2;
}

- (id)footerHyperlinkView
{
  PKFooterHyperlinkView *footerHyperlinkView;
  PKFooterHyperlinkView *v4;
  PKFooterHyperlinkView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  footerHyperlinkView = self->_footerHyperlinkView;
  if (!footerHyperlinkView)
  {
    v4 = objc_alloc_init(PKFooterHyperlinkView);
    v5 = self->_footerHyperlinkView;
    self->_footerHyperlinkView = v4;

    PKGenericOnboardingPresenter(self, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKPaymentSetupTableViewController context](self, "context");
    -[PKPaymentSetupFieldsViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKOpenURLModallyHyperlinkAction(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKGenericHyperlinkAction(v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKFooterHyperlinkView setAction:](self->_footerHyperlinkView, "setAction:", v10);

    footerHyperlinkView = self->_footerHyperlinkView;
  }
  return footerHyperlinkView;
}

- (id)footerViewForIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t i;
  uint64_t v26;
  PKPaymentSetupFieldFooterView *v27;
  double v28;
  double v29;
  double v30;
  id v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_fieldIdentifierToFooterViewMap, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController fieldsModel](self, "fieldsModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "footerFieldForIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = 1;
  else
    v8 = v7 == 0;
  if (!v8)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;

    -[PKPaymentSetupTableViewController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_sectionContentInset");
    v16 = v15;
    v18 = v17;

    v19 = v13 - v16 - v18;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v33 = v7;
    v20 = v7;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v35;
      v24 = 0.0;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(v20);
          v26 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          v27 = objc_alloc_init(PKPaymentSetupFieldFooterView);
          -[PKPaymentSetupFieldFooterView setField:](v27, "setField:", v26);
          -[PKPaymentSetupFieldFooterView setDelegate:](v27, "setDelegate:", self);
          -[PKPaymentSetupFieldFooterView sizeThatFits:](v27, "sizeThatFits:", v19, 1.79769313e308);
          v29 = v28;
          -[PKPaymentSetupFieldFooterView setFrame:](v27, "setFrame:", v11, v24, v30, v28);
          v24 = v24 + v29;
          objc_msgSend(v5, "addSubview:", v27);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v22);
    }
    else
    {
      v24 = 0.0;
    }

    objc_msgSend(v5, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v19, v24);
    -[NSMapTable setObject:forKey:](self->_fieldIdentifierToFooterViewMap, "setObject:forKey:", v5, v4);
    v7 = v33;
  }
  v31 = v5;

  return v31;
}

- (id)identifierForIndexPath:(id)a3
{
  NSArray *sectionIdentifiers;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  sectionIdentifiers = self->_sectionIdentifiers;
  v5 = a3;
  v6 = v5;
  if (sectionIdentifiers)
    -[NSArray objectAtIndexedSubscript:](sectionIdentifiers, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  else
    -[PKPaymentSetupFieldsViewController visibleFieldIdentifiers](self, "visibleFieldIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setCellsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (((!self->_cellsAreEnabled ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[PKPaymentSetupFieldsViewController allCells](self, "allCells");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setUserInteractionEnabled:", v3);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
    self->_cellsAreEnabled = v3;

  }
}

- (id)fieldForIdentifier:(id)a3
{
  return (id)-[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self->_fieldsModel, "paymentSetupFieldWithIdentifier:", a3);
}

- (id)cellForIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_fieldIdentifierToCellMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController fieldForIdentifier:](self, "fieldForIdentifier:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (!v8)
  {
    +[PKPaymentSetupFieldCell paymentSetupFieldCellForField:fromTableView:](PKPaymentSetupFieldCell, "paymentSetupFieldCellForField:fromTableView:", v6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSMapTable setObject:forKey:](self->_fieldIdentifierToCellMap, "setObject:forKey:", v5, v4);
      objc_msgSend(v5, "setEnabled:", self->_cellsAreEnabled);
    }
  }
  objc_msgSend(v5, "setPaymentSetupField:", v7);

  return v5;
}

- (id)nextResponderCellForCurrentIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[PKPaymentSetupFieldsViewController visibleFieldIdentifiers](self, "visibleFieldIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController readonlyFieldIdentifiers](self, "readonlyFieldIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_arrayByRemovingObjectsInArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "indexOfObject:", v4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL || (v9 = v8 + 1, v9 >= objc_msgSend(v7, "count")))
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldsViewController cellForIdentifier:](self, "cellForIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)firstEmptyCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPaymentSetupFieldsViewController firstEmptySetupField](self, "firstEmptySetupField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldsViewController cellForIdentifier:](self, "cellForIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)firstEmptySetupField
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
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
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PKPaymentSetupFieldsViewController visibleFieldIdentifiers](self, "visibleFieldIdentifiers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self->_fieldsModel, "paymentSetupFieldWithIdentifier:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isFieldTypeLabel") & 1) == 0)
        {
          objc_msgSend(v9, "submissionString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "length"))
          {

          }
          else
          {
            -[PKPaymentSetupFieldsViewController readonlyFieldIdentifiers](self, "readonlyFieldIdentifiers");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "containsObject:", v8);

            if (!v12)
              goto LABEL_13;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (id)firstResponderCell
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PKPaymentSetupFieldsViewController visibleFieldIdentifiers](self, "visibleFieldIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController readonlyFieldIdentifiers](self, "readonlyFieldIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_arrayByRemovingObjectsInArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      -[PKPaymentSetupFieldsViewController cellForIdentifier:](self, "cellForIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isFirstResponder") & 1) != 0)
        break;
      objc_msgSend(v11, "editableTextField");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isFirstResponder");

      if ((v13 & 1) != 0)
        break;

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v11 = 0;
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)allCells
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable objectEnumerator](self->_fieldIdentifierToCellMap, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)firstEmptyField
{
  void *v2;
  void *v3;

  -[PKPaymentSetupFieldsViewController firstEmptyCell](self, "firstEmptyCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEmpty
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = !-[PKPaymentSetupFieldsViewController isComplete](self, "isComplete");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PKPaymentSetupFieldsViewController visibleFieldIdentifiers](self, "visibleFieldIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self->_fieldsModel, "paymentSetupFieldWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isFieldTypeLabel") & 1) == 0)
        {
          objc_msgSend(v9, "submissionString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "length") == 0;

          LOBYTE(v3) = v11 & v3;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3 & 1;
}

- (void)resetCellStyling
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PKPaymentSetupFieldsViewController allCells](self, "allCells", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "resetTextFieldStyling");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)defaultHeaderViewTitle
{
  return 0;
}

- (id)defaultHeaderViewSubTitle
{
  return 0;
}

- (id)_contextSpecificStringForAggDKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%ld"), v5, -[PKPaymentSetupTableViewController context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)logAnalyticsContextSpecificCheckpointForKey:(id)a3
{
  id v3;

  -[PKPaymentSetupFieldsViewController _contextSpecificStringForAggDKey:](self, "_contextSpecificStringForAggDKey:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1A1AE3A74](v3, 0);

}

- (void)logAnalyticsCheckpointForKey:(id)a3
{
  JUMPOUT(0x1A1AE3A74);
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
  objc_storeStrong((id *)&self->_webService, a3);
}

- (PKPaymentSetupFieldsModel)fieldsModel
{
  return self->_fieldsModel;
}

- (void)setFieldsModel:(id)a3
{
  objc_storeStrong((id *)&self->_fieldsModel, a3);
}

- (NSArray)sectionIdentifiers
{
  return self->_sectionIdentifiers;
}

- (BOOL)isShowingActivitySpinner
{
  return self->_showingActivitySpinner;
}

- (BOOL)isPerformingNextActionLoop
{
  return self->_performingNextActionLoop;
}

- (BOOL)isProvisioningPaymentAccount
{
  return self->_provisioningPaymentAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_activeEditingCell, 0);
  objc_storeStrong((id *)&self->_rightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_leftBarButtonItems, 0);
  objc_storeStrong(&self->_currentNextActionBlock, 0);
  objc_storeStrong((id *)&self->_footerHyperlinkView, 0);
  objc_storeStrong((id *)&self->_fieldIdentifierToFooterViewMap, 0);
  objc_storeStrong((id *)&self->_fieldIdentifierToCellMap, 0);
  objc_storeStrong((id *)&self->_fieldsModel, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
