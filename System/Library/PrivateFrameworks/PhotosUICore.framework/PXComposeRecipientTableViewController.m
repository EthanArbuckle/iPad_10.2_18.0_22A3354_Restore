@implementation PXComposeRecipientTableViewController

- (PXComposeRecipientTableViewController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+iOS.m"), 74, CFSTR("%s is not available as initializer"), "-[PXComposeRecipientTableViewController init]");

  abort();
}

- (PXComposeRecipientTableViewController)initWithStyle:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+iOS.m"), 78, CFSTR("%s is not available as initializer"), "-[PXComposeRecipientTableViewController initWithStyle:]");

  abort();
}

- (PXComposeRecipientTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+iOS.m"), 82, CFSTR("%s is not available as initializer"), "-[PXComposeRecipientTableViewController initWithNibName:bundle:]");

  abort();
}

- (PXComposeRecipientTableViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+iOS.m"), 86, CFSTR("%s is not available as initializer"), "-[PXComposeRecipientTableViewController initWithCoder:]");

  abort();
}

- (PXComposeRecipientTableViewController)initWithViewModel:(id)a3
{
  id v5;
  PXComposeRecipientTableViewController *v6;
  PXComposeRecipientTableViewController *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+iOS.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  }
  v10.receiver = self;
  v10.super_class = (Class)PXComposeRecipientTableViewController;
  v6 = -[PXComposeRecipientTableViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    -[PXComposeRecipientTableViewController configureWithViewModel:](v6, "configureWithViewModel:", v5);

  return v7;
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v5 = (id)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v5, "setDataSource:", self);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXComposeRecipientTableViewCellReuseIdentifier"));
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PXComposeRecipientAddRecipientTableViewCellReuseIdentifier"));
  -[PXComposeRecipientTableViewController setView:](self, "setView:", v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  -[PXComposeRecipientTableViewController _updateHeaderHeight](self, "_updateHeaderHeight");
  -[PXComposeRecipientTableViewController _updateFooterHeight](self, "_updateFooterHeight");
  -[PXComposeRecipientTableViewController _updateRowHeight](self, "_updateRowHeight");
  -[PXComposeRecipientTableViewController updateTableViewHeight](self, "updateTableViewHeight");

}

- (void)_handleAddRecipient:(id)a3
{
  PXPhotoRecipientViewController *v4;
  void *v5;
  void *v6;
  PXPhotoRecipientViewController *addPeopleRecipientViewController;
  PXPhotoRecipientViewController *v8;
  void *v9;
  id v10;

  v4 = objc_alloc_init(PXPhotoRecipientViewController);
  PXLocalizedStringFromTable(CFSTR("PXPhotoRecipientAddLabelTitle"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoRecipientViewController setToLabel:](v4, "setToLabel:", v5);

  PXLocalizedStringFromTable(CFSTR("PXComposeRecipientAddPeople"), CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoRecipientViewController setTitle:](v4, "setTitle:", v6);

  -[PXPhotoRecipientViewController setDelegate:](v4, "setDelegate:", self);
  addPeopleRecipientViewController = self->_addPeopleRecipientViewController;
  self->_addPeopleRecipientViewController = v4;
  v8 = v4;

  -[PXComposeRecipientTableViewController delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[PXComposeRecipientTableViewController contactViewControllerToPresentForRecipientViewController:](PXComposeRecipientTableViewController, "contactViewControllerToPresentForRecipientViewController:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "presentViewController:animated:forComposeRecipientTableViewController:", v9, 1, self);
}

- (void)viewWillLayoutSubviews
{
  BOOL v3;
  _BOOL4 v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXComposeRecipientTableViewController;
  -[PXComposeRecipientTableViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  v3 = -[PXComposeRecipientTableViewController _updateHeaderHeight](self, "_updateHeaderHeight");
  v4 = -[PXComposeRecipientTableViewController _updateFooterHeight](self, "_updateFooterHeight");
  if (v3 || v4)
  {
    -[PXComposeRecipientTableViewController updateTableViewHeight](self, "updateTableViewHeight");
    -[PXComposeRecipientTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadData");

  }
}

- (BOOL)_updateRowHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  PXScaledValueForTextStyleWithSymbolicTraits();
  v4 = v3;
  PXScaledValueForTextStyleWithSymbolicTraits();
  v6 = v5;
  PXScaledValueForTextStyleWithSymbolicTraits();
  v8 = ceil(v4 + v6 + v7);
  -[PXComposeRecipientTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowHeight");
  v11 = v10;
  if (v10 != v8)
    objc_msgSend(v9, "setRowHeight:", v8);

  return v11 != v8;
}

- (BOOL)_updateHeaderHeight
{
  void *v3;
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
  double v14;
  double v15;
  double v16;

  if (_updateHeaderHeight_onceToken != -1)
    dispatch_once(&_updateHeaderHeight_onceToken, &__block_literal_global_99666);
  -[PXComposeRecipientTableViewModel headerTitle](self->_viewModel, "headerTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_updateHeaderHeight_measuringLabel, "setText:", v3);

  PXCappedFontWithTextStyle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_updateHeaderHeight_measuringLabel, "setFont:", v4);

  -[PXComposeRecipientTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "bounds");
  v11 = v10 - (v7 + v9);
  objc_msgSend(v5, "separatorInset");
  objc_msgSend((id)_updateHeaderHeight_measuringLabel, "sizeThatFits:", v11 + v12 * -2.0, 0.0);
  v14 = v13 + 36.0;
  -[PXComposeRecipientTableViewController headerHeight](self, "headerHeight");
  v16 = v15;
  if (v15 != v14)
    -[PXComposeRecipientTableViewController setHeaderHeight:](self, "setHeaderHeight:", v14);

  return v16 != v14;
}

- (id)_footerView
{
  UITableViewHeaderFooterView *footerView;
  UITableViewHeaderFooterView *v4;
  UITableViewHeaderFooterView *v5;

  footerView = self->_footerView;
  if (!footerView)
  {
    v4 = (UITableViewHeaderFooterView *)objc_alloc_init(MEMORY[0x1E0DC3D78]);
    v5 = self->_footerView;
    self->_footerView = v4;

    footerView = self->_footerView;
  }
  return footerView;
}

- (BOOL)_updateFooterHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;

  -[PXComposeRecipientTableViewController _footerView](self, "_footerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PXComposeRecipientTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    objc_msgSend(v3, "setFrame:", 0.0, 0.0);

  }
  -[PXComposeRecipientTableViewModel footerTitle](self->_viewModel, "footerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ConfigureFooterView(v3, v6);

  v7 = v3;
  objc_msgSend(v7, "frame");
  v8 = 0.0;
  if (v9 > 0.0)
  {
    objc_msgSend(v7, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      objc_msgSend(v7, "layoutIfNeeded");
      objc_msgSend(v10, "bounds");
      objc_msgSend(v10, "sizeThatFits:", v13, 1.79769313e308);
      v8 = v14 + 16.0;
    }

  }
  -[PXComposeRecipientTableViewController footerHeight](self, "footerHeight");
  v16 = v15;
  if (v15 != v8)
    -[PXComposeRecipientTableViewController setFooterHeight:](self, "setFooterHeight:", v8);

  return v16 != v8;
}

- (id)_tableView:(id)a3 participantCellForRowAtIndexPath:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;

  v7 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PXComposeRecipientTableViewCellReuseIdentifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+iOS.m"), 242, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[tableView dequeueReusableCellWithIdentifier:PXComposeRecipientTableViewCellReuseIdentifier forIndexPath:indexPath]"), v18);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+iOS.m"), 242, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[tableView dequeueReusableCellWithIdentifier:PXComposeRecipientTableViewCellReuseIdentifier forIndexPath:indexPath]"), v18, v20);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v8, "cellModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientTableViewModel composeRecipientDataSourceManager](self->_viewModel, "composeRecipientDataSourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "composeRecipients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "item");

  objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXComposeRecipientTableViewController configureCellModel:withComposeRecipient:](self, "configureCellModel:withComposeRecipient:", v9, v14);
  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  -[PXComposeRecipientTableViewModel composeRecipientDataSourceManager](self->_viewModel, "composeRecipientDataSourceManager", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "composeRecipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = v8 + -[PXComposeRecipientTableViewModel canAddRecipients](self->_viewModel, "canAddRecipients");
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  PXComposeRecipientTableViewModel *viewModel;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  viewModel = self->_viewModel;
  v7 = a4;
  v8 = a3;
  -[PXComposeRecipientTableViewModel composeRecipientDataSourceManager](viewModel, "composeRecipientDataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "composeRecipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (objc_msgSend(v7, "item") >= v12)
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("PXComposeRecipientAddRecipientTableViewCellReuseIdentifier"), v7);
  else
    -[PXComposeRecipientTableViewController _tableView:participantCellForRowAtIndexPath:](self, "_tableView:participantCellForRowAtIndexPath:", v8, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PXComposeRecipientTableViewModel useGroupedBackgroundColor](self->_viewModel, "useGroupedBackgroundColor"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

  }
  return v13;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[PXComposeRecipientTableViewModel headerTitle](self->_viewModel, "headerTitle", a3, a4);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  -[PXComposeRecipientTableViewController _footerView](self, "_footerView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientTableViewModel footerTitle](self->_viewModel, "footerTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ConfigureFooterView(v5, v6);

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  PXComposeRecipientSelectionManager *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  SEL v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  PXComposeRecipientTableViewController *v55;
  SEL v56;
  _QWORD v57[4];
  id v58;
  PXComposeRecipientTableViewController *v59;
  SEL v60;
  _QWORD v61[5];
  _QWORD v62[4];
  char v63;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "item");
  -[PXComposeRecipientTableViewModel composeRecipientDataSourceManager](self->_viewModel, "composeRecipientDataSourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "composeRecipients");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 >= objc_msgSend(v12, "count"))
  {
    -[PXComposeRecipientTableViewController _handleAddRecipient:](self, "_handleAddRecipient:", 0);
  }
  else
  {
    v50 = a2;
    objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recipient");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "personSuggestion");
    v15 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)v15;
    v52 = (void *)v14;
    if (v14)
    {
      v16 = self->_selectionManager;
      -[PXComposeRecipientSelectionManager selectionSnapshot](v16, "selectionSnapshot");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "selectedComposeRecipients");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "containsObject:", v13) ^ 1;

      -[PXComposeRecipientSelectionManager setSelectedState:atIndex:](v16, "setSelectedState:atIndex:", v19, v9);
      objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "cellModel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v62[3] = &__block_descriptor_33_e51_v16__0___PXComposeRecipientMutableTableCellModel__8l;
      v63 = v19;
      objc_msgSend(v21, "performChanges:", v62);

    }
    else
    {
      v22 = (void *)v15;
      v49 = v13;
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", v50, self, CFSTR("PXComposeRecipientTableViewController+iOS.m"), 329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personSuggestion"));

      }
      objc_storeStrong((id *)&self->_personSuggestionForBootstrapping, v22);
      objc_storeStrong((id *)&self->_indexPathForBootstrapping, a4);
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0DC3448];
      PXLocalizedStringFromTable(CFSTR("PXComposeRecipientActionSheetCancelTitle"), CFSTR("PhotosUICore"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = MEMORY[0x1E0C809B0];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
      v61[3] = &unk_1E5144530;
      v61[4] = self;
      objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 1, v61);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAction:", v26);

      v27 = (void *)MEMORY[0x1E0DC3448];
      PXLocalizedStringFromTable(CFSTR("PXComposeRecipientActionSheetCreateNewContactTitle"), CFSTR("PhotosUICore"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v25;
      v57[1] = 3221225472;
      v57[2] = __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
      v57[3] = &unk_1E5136EC8;
      v29 = v22;
      v58 = v29;
      v59 = self;
      v60 = v50;
      objc_msgSend(v27, "actionWithTitle:style:handler:", v28, 0, v57);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAction:", v30);

      v31 = (void *)MEMORY[0x1E0DC3448];
      PXLocalizedStringFromTable(CFSTR("PXComposeRecipientActionSheetAddToExistingContactTitle"), CFSTR("PhotosUICore"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
      v53[3] = &unk_1E5136EC8;
      v54 = v29;
      v55 = self;
      v56 = v50;
      objc_msgSend(v31, "actionWithTitle:style:handler:", v32, 0, v53);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAction:", v33);

      objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v34)
      {
        objc_msgSend(v34, "popoverSourceView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = 0;
      }
      v13 = v49;
      objc_msgSend(v17, "popoverPresentationController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setSourceView:", v36);

      objc_msgSend(v36, "bounds");
      v39 = v38;
      v41 = v40;
      v43 = v42;
      v45 = v44;
      objc_msgSend(v17, "popoverPresentationController");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setSourceRect:", v39, v41, v43, v45);

      -[PXComposeRecipientTableViewController delegate](self, "delegate");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "presentViewController:animated:forComposeRecipientTableViewController:", v17, 1, self);

    }
  }
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v8, 1);

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return -[PXComposeRecipientTableViewModel canDeleteRecipients](self->_viewModel, "canDeleteRecipients", a3, a4);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  PXComposeRecipientTableViewModel *viewModel;
  id v6;
  uint64_t v7;
  id v8;

  if (a4 == 1)
  {
    viewModel = self->_viewModel;
    v6 = a5;
    -[PXComposeRecipientTableViewModel composeRecipientDataSourceManager](viewModel, "composeRecipientDataSourceManager");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "item");

    objc_msgSend(v8, "deleteComposeRecipientAtIndex:", v7);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;
  void *v12;
  id v13;

  v6 = a4;
  v8 = a3;
  if ((void *)PXComposeRecipientTableViewModelObservationContext != a5)
    goto LABEL_9;
  v13 = v8;
  if ((v6 & 0x20) != 0)
  {
    v9 = -[PXComposeRecipientTableViewController _updateHeaderHeight](self, "_updateHeaderHeight");
    if ((v6 & 0x40) != 0)
      goto LABEL_4;
  }
  else
  {
    v9 = 0;
    if ((v6 & 0x40) != 0)
    {
LABEL_4:
      v10 = -[PXComposeRecipientTableViewController _updateFooterHeight](self, "_updateFooterHeight");
      goto LABEL_7;
    }
  }
  v10 = 0;
LABEL_7:
  v11 = v9 || v10;
  v8 = v13;
  if (v11 == 1)
  {
    -[PXComposeRecipientTableViewController updateTableViewHeight](self, "updateTableViewHeight");
    -[PXComposeRecipientTableViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadData");

    v8 = v13;
  }
LABEL_9:

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  BOOL v4;
  BOOL v5;
  _BOOL4 v6;
  id v7;

  v4 = -[PXComposeRecipientTableViewController _updateHeaderHeight](self, "_updateHeaderHeight", a3);
  v5 = -[PXComposeRecipientTableViewController _updateFooterHeight](self, "_updateFooterHeight");
  v6 = -[PXComposeRecipientTableViewController _updateRowHeight](self, "_updateRowHeight");
  if (v4 || v5 || v6)
  {
    -[PXComposeRecipientTableViewController updateTableViewHeight](self, "updateTableViewHeight");
    -[PXComposeRecipientTableViewController tableView](self, "tableView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

  }
}

- (void)photoRecipientViewController:(id)a3 didCompleteWithRecipients:(id)a4
{
  PXPhotoRecipientViewController *v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  PXPersonSuggestion *v12;
  void *v13;
  PXComposeRecipient *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  PXComposeRecipientTableViewController *v24;
  uint8_t buf[4];
  PXPersonSuggestion *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = (PXPhotoRecipientViewController *)a3;
  v8 = a4;
  if (!objc_msgSend(v8, "count"))
    goto LABEL_16;
  if (self->_bootstrapRecipientViewController == v7)
  {
    if (objc_msgSend(v8, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+iOS.m"), 453, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recipients.count == 1"));

    }
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_personSuggestionForBootstrapping;
    objc_msgSend(v11, "contact");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13 != 0;
    if (v13)
    {
      if (!+[PXPeopleUtilities isGreenTeaAndContactsAccessDenied](PXPeopleUtilities, "isGreenTeaAndContactsAccessDenied"))
      {
        -[PXComposeRecipientTableViewController bootstrapPersonSuggestion:withContact:](self, "bootstrapPersonSuggestion:withContact:", v12, v13);
        goto LABEL_14;
      }
      v14 = -[PXComposeRecipient initWithPersonSuggestion:contact:]([PXComposeRecipient alloc], "initWithPersonSuggestion:contact:", v12, v13);
      -[PXComposeRecipientTableViewModel composeRecipientDataSourceManager](self->_viewModel, "composeRecipientDataSourceManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "replaceComposeRecipientAtIndex:withNewComposeRecipient:", -[NSIndexPath row](self->_indexPathForBootstrapping, "row"), v14);
      -[PXComposeRecipientTableViewController tableView](self, "tableView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "reloadData");

    }
    else
    {
      PLSharingGetLog();
      v14 = (PXComposeRecipient *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v26 = v12;
        v27 = 2112;
        v28 = v11;
        _os_log_impl(&dword_1A6789000, &v14->super, OS_LOG_TYPE_ERROR, "Failed to bootstrap Person Suggestion %@ with recipient %@ because of no associated contact", buf, 0x16u);
      }
    }

LABEL_14:
    goto LABEL_15;
  }
  if (self->_addPeopleRecipientViewController != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+iOS.m"), 475, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXComposeRecipientTableViewModel composeRecipientDataSourceManager](self->_viewModel, "composeRecipientDataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addRecipients:", v8);

  v10 = 1;
LABEL_15:
  -[PXComposeRecipientTableViewModel composeRecipientDataSourceManager](self->_viewModel, "composeRecipientDataSourceManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __96__PXComposeRecipientTableViewController_photoRecipientViewController_didCompleteWithRecipients___block_invoke;
  v22[3] = &unk_1E5125CF0;
  v23 = v18;
  v24 = self;
  v19 = v18;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v22);

  if (v10)
LABEL_16:
    -[PXComposeRecipientTableViewController _dismissRecipientViewController:](self, "_dismissRecipientViewController:", v7);

}

- (void)_dismissRecipientViewController:(id)a3
{
  PXPhotoRecipientViewController *v5;
  _QWORD *p_indexPathForBootstrapping;
  NSIndexPath *indexPathForBootstrapping;
  void *v8;
  PXPersonSuggestion *personSuggestionForBootstrapping;
  void *v10;
  PXPhotoRecipientViewController *v11;

  v5 = (PXPhotoRecipientViewController *)a3;
  v11 = v5;
  if (self->_bootstrapRecipientViewController == v5)
  {
    self->_bootstrapRecipientViewController = 0;

    personSuggestionForBootstrapping = self->_personSuggestionForBootstrapping;
    self->_personSuggestionForBootstrapping = 0;

    p_indexPathForBootstrapping = &self->_indexPathForBootstrapping;
    indexPathForBootstrapping = self->_indexPathForBootstrapping;
  }
  else
  {
    p_indexPathForBootstrapping = &self->_addPeopleRecipientViewController;
    indexPathForBootstrapping = (NSIndexPath *)v5;
    if (self->_addPeopleRecipientViewController != v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+iOS.m"), 503, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  *p_indexPathForBootstrapping = 0;

  -[PXComposeRecipientTableViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dismissPresentedViewControllerAnimated:forComposeRecipientTableViewController:", 1, self);

}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v5;

  -[PXComposeRecipientTableViewController _contactViewController:didSelectContact:](self, "_contactViewController:didSelectContact:", a3, a4);
  -[PXComposeRecipientTableViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissPresentedViewControllerAnimated:forComposeRecipientTableViewController:", 1, self);

}

- (void)_contactViewController:(id)a3 didSelectContact:(id)a4
{
  PXPersonSuggestion *v5;
  PXComposeRecipient *v6;
  void *v7;
  void *v8;
  PXPersonSuggestion *personSuggestionForBootstrapping;
  NSIndexPath *indexPathForBootstrapping;
  id v11;

  v11 = a4;
  if (v11)
  {
    v5 = self->_personSuggestionForBootstrapping;
    if (+[PXPeopleUtilities isGreenTeaAndContactsAccessDenied](PXPeopleUtilities, "isGreenTeaAndContactsAccessDenied"))
    {
      v6 = -[PXComposeRecipient initWithPersonSuggestion:contact:]([PXComposeRecipient alloc], "initWithPersonSuggestion:contact:", v5, v11);
      -[PXComposeRecipientTableViewModel composeRecipientDataSourceManager](self->_viewModel, "composeRecipientDataSourceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "replaceComposeRecipientAtIndex:withNewComposeRecipient:", -[NSIndexPath row](self->_indexPathForBootstrapping, "row"), v6);
      -[PXComposeRecipientTableViewController tableView](self, "tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadData");

    }
    else
    {
      -[PXComposeRecipientTableViewController bootstrapPersonSuggestion:withContact:](self, "bootstrapPersonSuggestion:withContact:", v5, v11);
    }

  }
  personSuggestionForBootstrapping = self->_personSuggestionForBootstrapping;
  self->_personSuggestionForBootstrapping = 0;

  indexPathForBootstrapping = self->_indexPathForBootstrapping;
  self->_indexPathForBootstrapping = 0;

}

- (PXComposeRecipientTableViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (PXComposeRecipientTableViewControllerDelegate)delegate
{
  return (PXComposeRecipientTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)tableViewHeight
{
  return self->_tableViewHeight;
}

- (void)setTableViewHeight:(double)a3
{
  self->_tableViewHeight = a3;
}

- (PXComposeRecipientSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void)setSelectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_selectionManager, a3);
}

- (PXComposeRecipientValidationManager)validationManager
{
  return self->_validationManager;
}

- (void)setValidationManager:(id)a3
{
  objc_storeStrong((id *)&self->_validationManager, a3);
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (double)footerHeight
{
  return self->_footerHeight;
}

- (void)setFooterHeight:(double)a3
{
  self->_footerHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationManager, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_addPeopleRecipientViewController, 0);
  objc_storeStrong((id *)&self->_indexPathForBootstrapping, 0);
  objc_storeStrong((id *)&self->_personSuggestionForBootstrapping, 0);
  objc_storeStrong((id *)&self->_bootstrapRecipientViewController, 0);
}

uint64_t __96__PXComposeRecipientTableViewController_photoRecipientViewController_didCompleteWithRecipients___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "indexOfComposeRecipientForRecipient:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1080), "setSelectedState:atIndex:", 1, result);
  return result;
}

uint64_t __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setChecked:", *(unsigned __int8 *)(a1 + 32));
}

void __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1024);
  *(_QWORD *)(v2 + 1024) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1032);
  *(_QWORD *)(v4 + 1032) = 0;

}

void __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(*(id *)(a1 + 32), "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactWithDisplayName:emailOrPhoneNumber:", v3, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForNewContact:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 1) <= 1)
    objc_msgSend(v4, "setDisplayMode:", 1);
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v4);
  objc_msgSend(v5, "setModalPresentationStyle:", 2);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:forComposeRecipientTableViewController:", v5, 1, *(_QWORD *)(a1 + 40));

}

void __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  PXPhotoRecipientViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PXPhotoRecipientViewController *obj;

  v2 = [PXPhotoRecipientViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  obj = -[PXPhotoRecipientViewController initWithInitialLocalizedNameToQuery:](v2, "initWithInitialLocalizedNameToQuery:", v3);

  -[PXPhotoRecipientViewController setDelegate:](obj, "setDelegate:", *(_QWORD *)(a1 + 40));
  PXLocalizedStringFromTable(CFSTR("PXPhotoRecipientAddLabelTitle"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoRecipientViewController setToLabel:](obj, "setToLabel:", v4);

  -[PXPhotoRecipientViewController setMaxRecipients:](obj, "setMaxRecipients:", 1);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1016), obj);
  objc_msgSend(*(id *)(a1 + 32), "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    PXLocalizedStringFromTable(CFSTR("PXComposeRecipientPickerBootstrapWithLocalizedNamePrompt"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "localizedName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringWithValidatedFormat(v7, CFSTR("%@"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXComposeRecipientPickerBootstrapPrompt"), CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PXPhotoRecipientViewController setTitle:](obj, "setTitle:", v8, v11);
  +[PXComposeRecipientTableViewController contactViewControllerToPresentForRecipientViewController:](PXComposeRecipientTableViewController, "contactViewControllerToPresentForRecipientViewController:", obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:forComposeRecipientTableViewController:", v9, 1, *(_QWORD *)(a1 + 40));

}

uint64_t __60__PXComposeRecipientTableViewController__updateHeaderHeight__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  v1 = (void *)_updateHeaderHeight_measuringLabel;
  _updateHeaderHeight_measuringLabel = (uint64_t)v0;

  return objc_msgSend((id)_updateHeaderHeight_measuringLabel, "setNumberOfLines:", 0);
}

+ (id)contactViewControllerToPresentForRecipientViewController:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[PXPeopleUtilities isGreenTeaAndContactsAccessDenied](PXPeopleUtilities, "isGreenTeaAndContactsAccessDenied"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C974B0]);
    objc_msgSend(v4, "setMode:", 1);
    objc_msgSend(v4, "setDelegate:", v3);
    v5 = *MEMORY[0x1E0C966A8];
    v11[0] = *MEMORY[0x1E0C967C0];
    v11[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisplayedPropertyKeys:", v6);
    objc_msgSend(v4, "setAllowsEditing:", 1);
    PXLocalizedStringFromTable(CFSTR("PXComposeRecipientPickerBootstrapPrompt"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrompt:", v7);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(emailAddresses.@count == 1 AND phoneNumbers.@count == 0) OR (emailAddresses.@count == 0 AND phoneNumbers.@count == 1)"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicateForSelectionOfContact:", v8);
    objc_msgSend(v3, "setContactPickerViewController:", v4);
    objc_msgSend(v3, "setContactPickerPresentedExternally:", 1);

    return v4;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v3);

    objc_msgSend(v10, "setModalPresentationStyle:", 2);
    return v10;
  }
}

- (void)configureWithViewModel:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PXComposeRecipientSelectionManager *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  PXComposeRecipientValidationManager *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+Internal.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  }
  -[PXComposeRecipientTableViewController setViewModel:](self, "setViewModel:", v5);
  objc_msgSend(v5, "registerChangeObserver:context:", self, PXComposeRecipientTableViewModelObservationContext);
  objc_msgSend(v5, "composeRecipientDataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addRecipients:", v7);

  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXComposeRecipientSelectionManager initWithDataSource:]([PXComposeRecipientSelectionManager alloc], "initWithDataSource:", v8);
  -[PXComposeRecipientSelectionManager selectAll](v9, "selectAll");
  -[PXComposeRecipientSelectionManager setDelegate:](v9, "setDelegate:", self);
  -[PXComposeRecipientTableViewController setSelectionManager:](self, "setSelectionManager:", v9);
  -[PXComposeRecipientSelectionManager selectionSnapshot](v9, "selectionSnapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedComposeRecipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__PXComposeRecipientTableViewController_Internal__configureWithViewModel___block_invoke;
  v16[3] = &unk_1E512E3F0;
  v17 = v10;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  objc_msgSend(v5, "performChanges:", v16);
  v14 = -[PXComposeRecipientValidationManager initWithDataSource:]([PXComposeRecipientValidationManager alloc], "initWithDataSource:", v8);
  -[PXComposeRecipientValidationManager setDelegate:](v14, "setDelegate:", self);
  -[PXComposeRecipientTableViewController setValidationManager:](self, "setValidationManager:", v14);

}

- (BOOL)isValidAddressForComposeRecipient:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[PXComposeRecipientTableViewController validationManager](self, "validationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "validationTypeForComposeRecipient:", v4);

  return v6 == 1;
}

- (id)cellModelAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathForItem:inSection:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)configureCellModel:(id)a3 withComposeRecipient:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  void *v22;
  void *v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD *v51;
  uint64_t *v52;
  BOOL v53;
  char v54;
  _QWORD v55[4];
  id v56;
  uint64_t *v57;
  _QWORD *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[5];
  id v69;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v45 = v7;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+Internal.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cellModel"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+Internal.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composeRecipient"));

LABEL_3:
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__150561;
  v68[4] = __Block_byref_object_dispose__150562;
  v69 = 0;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = -1;
  objc_msgSend(v9, "recipient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientTableViewController viewModel](self, "viewModel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personSuggestion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "localizedName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXComposeRecipientTableViewController traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayScale");
    v15 = v14;

    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 1;
    objc_msgSend(v43, "peopleSuggestionsMediaProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXComposeRecipientTableCellModel imageDiameter](PXComposeRecipientTableCellModel, "imageDiameter");
    v18 = v17;
    +[PXComposeRecipientTableCellModel imageDiameter](PXComposeRecipientTableCellModel, "imageDiameter");
    v20 = v19;
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __91__PXComposeRecipientTableViewController_Internal__configureCellModel_withComposeRecipient___block_invoke;
    v55[3] = &unk_1E512E440;
    v57 = &v60;
    v58 = v68;
    v59 = &v64;
    v56 = v45;
    v21 = objc_msgSend(v16, "requestImageForPersonSuggestion:targetSize:displayScale:cropFactor:cornerStyle:resultHandler:", v12, 0, 0, v55, v18, v20, v15);
    v65[3] = v21;
    *((_BYTE *)v61 + 24) = 0;

    _Block_object_dispose(&v60, 8);
    v42 = 0;
  }
  else
  {
    objc_msgSend(v10, "contact");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
  }
  objc_msgSend(v10, "suggestedTransport");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "address");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "length"))
    v24 = -[PXComposeRecipientTableViewController isValidAddressForComposeRecipient:](self, "isValidAddressForComposeRecipient:", v9);
  else
    v24 = 0;
  objc_msgSend(v10, "localizedName");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  v27 = v44;
  if (v25)
    v27 = (void *)v25;
  v28 = v27;

  if (v28 && objc_msgSend(v28, "length")
    || (PXLocalizedStringFromTable(CFSTR("PXComposeRecipientTableViewMissingLocalizedNameMessage"), CFSTR("PhotosUICore")), v29 = objc_claimAutoreleasedReturnValue(), v28, (v28 = (id)v29) != 0))
  {
    v28 = v28;
    v30 = v23;
    v31 = v30;
    if (v28 == v30)
    {

    }
    else
    {
      v32 = objc_msgSend(v28, "isEqualToString:", v30);

      if (!v32)
        goto LABEL_19;
    }

    v28 = 0;
  }
LABEL_19:
  -[PXComposeRecipientTableViewController selectionManager](self, "selectionManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "selectionSnapshot");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "selectedComposeRecipients");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = objc_msgSend(v35, "containsObject:", v9);

  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __91__PXComposeRecipientTableViewController_Internal__configureCellModel_withComposeRecipient___block_invoke_4;
  v46[3] = &unk_1E512E468;
  v51 = v68;
  v52 = &v64;
  v36 = v28;
  v47 = v36;
  v37 = v23;
  v48 = v37;
  v53 = v24;
  v54 = (char)v33;
  v38 = v43;
  v49 = v38;
  v39 = v42;
  v50 = v39;
  objc_msgSend(v45, "performChanges:", v46);

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(v68, 8);

}

- (void)bootstrapPersonSuggestion:(id)a3 withContact:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
LABEL_3:
      v17 = 0;
      v10 = v7;
      v11 = v9;
      goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+Internal.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personSuggestion"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXComposeRecipientTableViewController+Internal.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

  v17 = 0;
  v10 = v7;
  v11 = 0;
LABEL_4:
  v12 = PXBootstrapPersonSuggestionWithContact(v10, v11, (uint64_t)&v17);
  v13 = v17;
  if ((v12 & 1) == 0)
  {
    PLSharingGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v7;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Failed to bootstrap Person Suggestion %@ with Contact %@ because of error: %@", buf, 0x20u);
    }

  }
}

- (void)updateTableViewHeight
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;

  -[PXComposeRecipientTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXComposeRecipientTableViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v3, 0);

  -[PXComposeRecipientTableViewController headerHeight](self, "headerHeight");
  v6 = v5;
  -[PXComposeRecipientTableViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowHeight");
  v9 = v6 + fmax(v8, 0.0) * (double)v4;
  -[PXComposeRecipientTableViewController footerHeight](self, "footerHeight");
  v11 = v10 + v9;

  -[PXComposeRecipientTableViewController tableViewHeight](self, "tableViewHeight");
  if (v12 != v11)
  {
    -[PXComposeRecipientTableViewController setTableViewHeight:](self, "setTableViewHeight:", v11);
    -[PXComposeRecipientTableViewController delegate](self, "delegate");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      v16 = (void *)v13;
      v15 = objc_opt_respondsToSelector();
      v14 = v16;
      if ((v15 & 1) != 0)
      {
        objc_msgSend(v16, "composeRecipientTableViewControllerDidChangeHeight:", self);
        v14 = v16;
      }
    }

  }
}

- (void)composeRecipientSelectionManager:(id)a3 didUpdateSelectionSnapshotWithChangeDetails:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PXComposeRecipientTableViewController *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  objc_msgSend(a3, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedComposeRecipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientTableViewController viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __128__PXComposeRecipientTableViewController_Internal__composeRecipientSelectionManager_didUpdateSelectionSnapshotWithChangeDetails___block_invoke;
  v18[3] = &unk_1E512E3F0;
  v19 = v5;
  v9 = v6;
  v20 = v9;
  v10 = v5;
  objc_msgSend(v7, "performChanges:", v18);
  objc_msgSend(v7, "composeRecipientDataSourceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "composeRecipients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __128__PXComposeRecipientTableViewController_Internal__composeRecipientSelectionManager_didUpdateSelectionSnapshotWithChangeDetails___block_invoke_2;
  v15[3] = &unk_1E512E4B0;
  v16 = v9;
  v17 = self;
  v14 = v9;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

}

- (void)composeRecipientDataSourceManager:(id)a3 didUpdateDataSourceWithChangeDetails:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a3, "dataSource");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientTableViewController selectionManager](self, "selectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataSource:changeDetails:", v10, v6);

  -[PXComposeRecipientTableViewController validationManager](self, "validationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDataSource:changeDetails:", v10, v6);

  -[PXComposeRecipientTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

  -[PXComposeRecipientTableViewController updateTableViewHeight](self, "updateTableViewHeight");
}

- (void)composeRecipientValidationManager:(id)a3 didUpdateValidationWithChangedIndexes:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __123__PXComposeRecipientTableViewController_Internal__composeRecipientValidationManager_didUpdateValidationWithChangedIndexes___block_invoke;
  v4[3] = &unk_1E5148928;
  v4[4] = self;
  objc_msgSend(a4, "enumerateIndexesUsingBlock:", v4);
}

void __123__PXComposeRecipientTableViewController_Internal__composeRecipientValidationManager_didUpdateValidationWithChangedIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  char v11;

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "composeRecipientDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "composeRecipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(*(id *)(a1 + 32), "isValidAddressForComposeRecipient:", v8);
  objc_msgSend(*(id *)(a1 + 32), "cellModelAtIndex:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __123__PXComposeRecipientTableViewController_Internal__composeRecipientValidationManager_didUpdateValidationWithChangedIndexes___block_invoke_2;
  v10[3] = &__block_descriptor_33_e51_v16__0___PXComposeRecipientMutableTableCellModel__8l;
  v11 = (char)v7;
  objc_msgSend(v9, "performChanges:", v10);

}

uint64_t __123__PXComposeRecipientTableViewController_Internal__composeRecipientValidationManager_didUpdateValidationWithChangedIndexes___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsValidAddress:", *(unsigned __int8 *)(a1 + 32));
}

void __128__PXComposeRecipientTableViewController_Internal__composeRecipientSelectionManager_didUpdateSelectionSnapshotWithChangeDetails___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "selectedRecipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecipients:", v4);

  objc_msgSend(v5, "setComposeRecipients:", *(_QWORD *)(a1 + 40));
}

void __128__PXComposeRecipientTableViewController_Internal__composeRecipientSelectionManager_didUpdateSelectionSnapshotWithChangeDetails___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  void *v6;
  _QWORD v7[4];
  char v8;

  v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  objc_msgSend(*(id *)(a1 + 40), "cellModelAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __128__PXComposeRecipientTableViewController_Internal__composeRecipientSelectionManager_didUpdateSelectionSnapshotWithChangeDetails___block_invoke_3;
  v7[3] = &__block_descriptor_33_e51_v16__0___PXComposeRecipientMutableTableCellModel__8l;
  v8 = v5;
  objc_msgSend(v6, "performChanges:", v7);

}

uint64_t __128__PXComposeRecipientTableViewController_Internal__composeRecipientSelectionManager_didUpdateSelectionSnapshotWithChangeDetails___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setChecked:", *(unsigned __int8 *)(a1 + 32));
}

void __91__PXComposeRecipientTableViewController_Internal__configureCellModel_withComposeRecipient___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a2;
  v5 = v4;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    v6 = v4;
    v7 = *(id *)(a1 + 32);
    px_dispatch_on_main_queue();

  }
}

void __91__PXComposeRecipientTableViewController_Internal__configureCellModel_withComposeRecipient___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v4 = a2;
  objc_msgSend(v4, "setImage:", v3);
  objc_msgSend(v4, "setImageRequestID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  objc_msgSend(v4, "setName:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setAddress:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setIsValidAddress:", *(unsigned __int8 *)(a1 + 80));
  objc_msgSend(v4, "setChecked:", *(unsigned __int8 *)(a1 + 81));
  objc_msgSend(v4, "setShowsCheckbox:", objc_msgSend(*(id *)(a1 + 48), "canSelectRecipients"));
  objc_msgSend(v4, "setContact:", *(_QWORD *)(a1 + 56));

}

void __91__PXComposeRecipientTableViewController_Internal__configureCellModel_withComposeRecipient___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v2 == objc_msgSend(*(id *)(a1 + 40), "imageRequestID"))
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __91__PXComposeRecipientTableViewController_Internal__configureCellModel_withComposeRecipient___block_invoke_3;
      v4[3] = &unk_1E512E418;
      v3 = *(void **)(a1 + 40);
      v5 = *(id *)(a1 + 32);
      objc_msgSend(v3, "performChanges:", v4);

    }
  }
}

uint64_t __91__PXComposeRecipientTableViewController_Internal__configureCellModel_withComposeRecipient___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImage:", *(_QWORD *)(a1 + 32));
}

void __74__PXComposeRecipientTableViewController_Internal__configureWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v9 = a2;
  objc_msgSend(v3, "selectedRecipients");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = MEMORY[0x1E0C9AA60];
  if (v4)
    v7 = v4;
  else
    v7 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v9, "setRecipients:", v7);

  if (*(_QWORD *)(a1 + 40))
    v8 = *(_QWORD *)(a1 + 40);
  else
    v8 = v6;
  objc_msgSend(v9, "setComposeRecipients:", v8);

}

@end
