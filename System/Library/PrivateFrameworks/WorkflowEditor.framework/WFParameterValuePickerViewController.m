@implementation WFParameterValuePickerViewController

- (WFParameterValuePickerViewController)initWithParameter:(id)a3 widgetFamily:(int64_t)a4 allowsVariables:(BOOL)a5 initialCollection:(id)a6 currentState:(id)a7 delegate:(id)a8
{
  _BOOL4 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  WFParameterValuePickerViewController *v20;
  WFParameterValuePickerViewController *v21;
  uint64_t v22;
  NSSet *allowedVariableTypes;
  id v24;
  uint64_t v25;
  WFDebouncer *inputDebouncer;
  uint64_t v27;
  NSMutableDictionary *cachedResults;
  uint64_t v29;
  NSMutableDictionary *cachedPrompts;
  uint64_t v31;
  void *v32;
  int v33;
  id v34;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  WFParameterValuePickerViewController *v59;
  objc_super v61;

  v11 = a5;
  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (objc_msgSend(v15, "wf_usesGroupTableViewStyle"))
    v19 = 2;
  else
    v19 = 0;
  v61.receiver = self;
  v61.super_class = (Class)WFParameterValuePickerViewController;
  v20 = -[WFParameterValuePickerViewController initWithStyle:](&v61, sel_initWithStyle_, v19);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_parameter, a3);
    v21->_widgetFamily = a4;
    if (v11)
    {
      objc_msgSend(v15, "supportedVariableTypes");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = objc_opt_new();
    }
    allowedVariableTypes = v21->_allowedVariableTypes;
    v21->_allowedVariableTypes = (NSSet *)v22;

    objc_storeWeak((id *)&v21->_delegate, v18);
    v24 = objc_alloc(MEMORY[0x24BEC3C60]);
    v25 = objc_msgSend(v24, "initWithDelay:queue:", MEMORY[0x24BDAC9B8], 0.200000003);
    inputDebouncer = v21->_inputDebouncer;
    v21->_inputDebouncer = (WFDebouncer *)v25;

    -[WFDebouncer addTarget:action:](v21->_inputDebouncer, "addTarget:action:", v21, sel_updateSearchResultsFromCurrentUserInput);
    objc_storeStrong((id *)&v21->_defaultResults, a6);
    objc_storeStrong((id *)&v21->_currentState, a7);
    v27 = objc_opt_new();
    cachedResults = v21->_cachedResults;
    v21->_cachedResults = (NSMutableDictionary *)v27;

    v29 = objc_opt_new();
    cachedPrompts = v21->_cachedPrompts;
    v21->_cachedPrompts = (NSMutableDictionary *)v29;

    if (objc_msgSend(v15, "isRangedSizeArray"))
      v31 = objc_msgSend(v15, "arrayMaxCountForWidgetFamily:", a4);
    else
      v31 = 0x7FFFFFFFFFFFFFFFLL;
    v21->_maximumSelectableItemsCount = v31;
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "wf_isWidgetConfigurationExtensionBundle");

    if (v33)
    {
      v34 = objc_alloc_init(MEMORY[0x24BEBD920]);
      -[WFParameterValuePickerViewController setSearchBar:](v21, "setSearchBar:", v34);

      -[WFParameterValuePickerViewController searchBar](v21, "searchBar");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sizeToFit");

      -[WFParameterValuePickerViewController searchBar](v21, "searchBar");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setDelegate:", v21);
    }
    else
    {
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD928]), "initWithSearchResultsController:", 0);
      -[WFParameterValuePickerViewController setSearchController:](v21, "setSearchController:", v37);

      -[WFParameterValuePickerViewController searchController](v21, "searchController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObscuresBackgroundDuringPresentation:", 0);

      -[WFParameterValuePickerViewController searchController](v21, "searchController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setHidesNavigationBarDuringPresentation:", 0);

      -[WFParameterValuePickerViewController searchController](v21, "searchController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setAutomaticallyShowsCancelButton:", 0);

      -[WFParameterValuePickerViewController searchController](v21, "searchController");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setSearchResultsUpdater:", v21);

      -[WFParameterValuePickerViewController searchController](v21, "searchController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "searchBar");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParameterValuePickerViewController setSearchBar:](v21, "setSearchBar:", v42);

    }
    -[WFParameterValuePickerViewController searchBar](v21, "searchBar");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setShowsCancelButton:", 0);

    -[WFParameterValuePickerViewController searchBar](v21, "searchBar");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setSearchBarStyle:", 2);

    -[WFParameterValuePickerViewController searchBar](v21, "searchBar");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAutocorrectionType:", 1);

    -[WFParameterValuePickerViewController searchBar](v21, "searchBar");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setSearchBarStyle:", 2);

    WFLocalizedString(CFSTR("Search"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerViewController searchBar](v21, "searchBar");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setPlaceholder:", v47);

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v48) = objc_msgSend(v49, "wf_isWidgetConfigurationExtensionBundle");

    if ((_DWORD)v48)
    {
      -[WFParameterValuePickerViewController searchBar](v21, "searchBar");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParameterValuePickerViewController navigationItem](v21, "navigationItem");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setTitleView:", v50);

      -[WFParameterValuePickerViewController parameter](v21, "parameter");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "localizedLabel");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParameterValuePickerViewController setTitle:](v21, "setTitle:", v53);

    }
    else
    {
      -[WFParameterValuePickerViewController searchController](v21, "searchController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParameterValuePickerViewController navigationItem](v21, "navigationItem");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setSearchController:", v54);

      WFLocalizedString(CFSTR("Choose"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParameterValuePickerViewController setTitle:](v21, "setTitle:", v52);
    }

    -[WFParameterValuePickerViewController navigationItem](v21, "navigationItem");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setHidesSearchBarWhenScrolling:", 0);

    -[WFParameterValuePickerViewController parameter](v21, "parameter");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "wf_displayLocalizedPrompt");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerViewController setDefaultPrompt:](v21, "setDefaultPrompt:", v58);

    v21->_showsPrompt = 1;
    v21->_showsCancelButton = 1;
    -[WFParameterValuePickerViewController performSearchWithUserInput:](v21, "performSearchWithUserInput:", 0);
    objc_msgSend(v15, "addEventObserver:", v21);
    v59 = v21;
  }

  return v21;
}

- (void)setNoOptionAvailableTitle:(id)a3
{
  NSString *v4;
  NSString *noOptionAvailableTitle;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  noOptionAvailableTitle = self->_noOptionAvailableTitle;
  self->_noOptionAvailableTitle = v4;

  if (-[WFParameterValuePickerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[WFParameterValuePickerViewController dataSource](self, "dataSource");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "itemsCount");
    if (v6)
    {
      v7 = 0;
    }
    else
    {
      -[WFParameterValuePickerViewController errorMessageView](self, "errorMessageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[WFParameterValuePickerViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundView:", v7);

    if (!v6)
  }
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  self->_allowsMultipleSelection = a3;
  if (-[WFParameterValuePickerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[WFParameterValuePickerViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsMultipleSelection:", v3);

    -[WFParameterValuePickerViewController reloadNavigationBarButtonItems](self, "reloadNavigationBarButtonItems");
  }
}

- (void)setRemoveItemButtonTitle:(id)a3
{
  NSString *v4;
  NSString *removeItemButtonTitle;
  UIBarButtonItem *removeItemBarButtonItem;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  removeItemButtonTitle = self->_removeItemButtonTitle;
  self->_removeItemButtonTitle = v4;

  removeItemBarButtonItem = self->_removeItemBarButtonItem;
  self->_removeItemBarButtonItem = 0;

  if (-[WFParameterValuePickerViewController isViewLoaded](self, "isViewLoaded"))
    -[WFParameterValuePickerViewController reloadNavigationBarButtonItems](self, "reloadNavigationBarButtonItems");
}

- (void)setVariableProvider:(id)a3
{
  WFVariableProvider **p_variableProvider;
  id v5;
  id v6;

  p_variableProvider = &self->_variableProvider;
  v5 = a3;
  objc_storeWeak((id *)p_variableProvider, v5);
  -[WFParameterValuePickerViewController dataSource](self, "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVariableProvider:", v5);

}

- (void)setVariableUIDelegate:(id)a3
{
  WFVariableUIDelegate **p_variableUIDelegate;
  id v5;
  id v6;

  p_variableUIDelegate = &self->_variableUIDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_variableUIDelegate, v5);
  -[WFParameterValuePickerViewController dataSource](self, "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVariableUIDelegate:", v5);

}

- (UIBarButtonItem)doneBarButtonItem
{
  UIBarButtonItem *doneBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  doneBarButtonItem = self->_doneBarButtonItem;
  if (!doneBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_finishPickingValue);
    v5 = self->_doneBarButtonItem;
    self->_doneBarButtonItem = v4;

    doneBarButtonItem = self->_doneBarButtonItem;
  }
  return doneBarButtonItem;
}

- (UIBarButtonItem)removeItemBarButtonItem
{
  void *v3;
  id v4;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *removeItemBarButtonItem;

  if (!self->_removeItemBarButtonItem)
  {
    -[WFParameterValuePickerViewController removeItemButtonTitle](self, "removeItemButtonTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = objc_alloc(MEMORY[0x24BEBD410]);
      -[WFParameterValuePickerViewController removeItemButtonTitle](self, "removeItemButtonTitle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 0, self, sel_requestRemovingItem);
      removeItemBarButtonItem = self->_removeItemBarButtonItem;
      self->_removeItemBarButtonItem = v6;

    }
  }
  return self->_removeItemBarButtonItem;
}

- (UIBarButtonItem)cancelBarButtonItem
{
  UIBarButtonItem *cancelBarButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  cancelBarButtonItem = self->_cancelBarButtonItem;
  if (!cancelBarButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelPickingValue);
    v5 = self->_cancelBarButtonItem;
    self->_cancelBarButtonItem = v4;

    cancelBarButtonItem = self->_cancelBarButtonItem;
  }
  return cancelBarButtonItem;
}

- (BOOL)showsPrompt
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEC1758]);

  return (v5 & 1) == 0 && self->_showsPrompt;
}

- (void)setShowsPrompt:(BOOL)a3
{
  if (self->_showsPrompt != a3)
  {
    self->_showsPrompt = a3;
    if (-[WFParameterValuePickerViewController isViewLoaded](self, "isViewLoaded"))
      -[WFParameterValuePickerViewController reloadNavigationBarButtonItems](self, "reloadNavigationBarButtonItems");
  }
}

- (void)setShowsCancelButton:(BOOL)a3
{
  if (self->_showsCancelButton != a3)
  {
    self->_showsCancelButton = a3;
    if (-[WFParameterValuePickerViewController isViewLoaded](self, "isViewLoaded"))
      -[WFParameterValuePickerViewController reloadNavigationBarButtonItems](self, "reloadNavigationBarButtonItems");
  }
}

- (void)setDefaultPrompt:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *defaultPrompt;
  NSString *v10;

  v4 = a3;
  v5 = self->_defaultPrompt;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      if (v7)
        goto LABEL_10;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    defaultPrompt = self->_defaultPrompt;
    self->_defaultPrompt = v8;

    if (-[WFParameterValuePickerViewController isViewLoaded](self, "isViewLoaded"))
      -[WFParameterValuePickerViewController reloadChoosingPrompt](self, "reloadChoosingPrompt");
  }
LABEL_10:

}

- (void)setCustomPrompt:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *customPrompt;
  NSString *v10;

  v4 = a3;
  v5 = self->_customPrompt;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      if (v7)
        goto LABEL_10;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    customPrompt = self->_customPrompt;
    self->_customPrompt = v8;

    if (-[WFParameterValuePickerViewController isViewLoaded](self, "isViewLoaded"))
      -[WFParameterValuePickerViewController reloadChoosingPrompt](self, "reloadChoosingPrompt");
  }
LABEL_10:

}

- (void)loadView
{
  UILabel *v3;
  UILabel *errorTitleLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *errorMessageLabel;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
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
  objc_super v43;
  _QWORD v44[3];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)WFParameterValuePickerViewController;
  -[WFParameterValuePickerViewController loadView](&v43, sel_loadView);
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  errorTitleLabel = self->_errorTitleLabel;
  self->_errorTitleLabel = v3;

  -[WFParameterValuePickerViewController errorTitleLabel](self, "errorTitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerViewController errorTitleLabel](self, "errorTitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  -[WFParameterValuePickerViewController errorTitleLabel](self, "errorTitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerViewController errorTitleLabel](self, "errorTitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v9);

  -[WFParameterValuePickerViewController errorTitleLabel](self, "errorTitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextAlignment:", 1);

  -[WFParameterValuePickerViewController errorTitleLabel](self, "errorTitleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  v13 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  errorMessageLabel = self->_errorMessageLabel;
  self->_errorMessageLabel = v13;

  -[WFParameterValuePickerViewController errorMessageLabel](self, "errorMessageLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerViewController errorMessageLabel](self, "errorMessageLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  -[WFParameterValuePickerViewController errorMessageLabel](self, "errorMessageLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAdjustsFontForContentSizeCategory:", 1);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerViewController errorMessageLabel](self, "errorMessageLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextColor:", v19);

  -[WFParameterValuePickerViewController errorMessageLabel](self, "errorMessageLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextAlignment:", 1);

  -[WFParameterValuePickerViewController errorMessageLabel](self, "errorMessageLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNumberOfLines:", 0);

  v23 = objc_alloc(MEMORY[0x24BEBD978]);
  -[WFParameterValuePickerViewController errorTitleLabel](self, "errorTitleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v24;
  -[WFParameterValuePickerViewController errorMessageLabel](self, "errorMessageLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v23, "initWithArrangedSubviews:", v26);

  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v27, "setAxis:", 1);
  objc_msgSend(v27, "setSpacing:", 3.0);
  v28 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v28, "setPreservesSuperviewLayoutMargins:", 1);
  objc_msgSend(v28, "addSubview:", v27);
  v38 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v27, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "readableContentGuide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v39;
  objc_msgSend(v27, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "readableContentGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v30;
  objc_msgSend(v27, "centerYAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "readableContentGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "centerYAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "activateConstraints:", v35);

  -[WFParameterValuePickerViewController setErrorMessageView:](self, "setErrorMessageView:", v28);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  WFParameterValuePickerDataSource *v11;
  void *v12;
  void *v13;
  WFParameterValuePickerDataSource *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id (*v29)(uint64_t, void *, void *, void *);
  void *v30;
  id v31;
  id location;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)WFParameterValuePickerViewController;
  -[WFParameterValuePickerViewController viewDidLoad](&v33, sel_viewDidLoad);
  -[WFParameterValuePickerViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ParameterStateCell"));

  -[WFParameterValuePickerViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ParameterVariableCell"));

  -[WFParameterValuePickerViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(), CFSTR("WFParameterValuePickerSectionHeaderView"));

  v6 = -[WFParameterValuePickerViewController allowsMultipleSelection](self, "allowsMultipleSelection");
  -[WFParameterValuePickerViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsMultipleSelection:", v6);

  -[WFParameterValuePickerViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEstimatedRowHeight:", 44.0);

  v9 = *MEMORY[0x24BEBE770];
  -[WFParameterValuePickerViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRowHeight:", v9);

  objc_initWeak(&location, self);
  v11 = [WFParameterValuePickerDataSource alloc];
  -[WFParameterValuePickerViewController parameter](self, "parameter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __51__WFParameterValuePickerViewController_viewDidLoad__block_invoke;
  v30 = &unk_24EE25070;
  objc_copyWeak(&v31, &location);
  v14 = -[WFParameterValuePickerDataSource initWithParameter:tableView:cellProvider:](v11, "initWithParameter:tableView:cellProvider:", v12, v13, &v27);
  -[WFParameterValuePickerViewController setDataSource:](self, "setDataSource:", v14, v27, v28, v29, v30);

  -[WFParameterValuePickerViewController variableProvider](self, "variableProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerViewController dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setVariableProvider:", v15);

  -[WFParameterValuePickerViewController variableUIDelegate](self, "variableUIDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerViewController dataSource](self, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setVariableUIDelegate:", v17);

  -[WFParameterValuePickerViewController allowedVariableTypes](self, "allowedVariableTypes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerViewController dataSource](self, "dataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAllowedVariableTypes:", v19);

  -[WFParameterValuePickerViewController dataSource](self, "dataSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDefaultRowAnimation:", 0);

  -[WFParameterValuePickerViewController defaultResults](self, "defaultResults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[WFParameterValuePickerViewController dataSource](self, "dataSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerViewController defaultResults](self, "defaultResults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "applyCollection:animatingDifferences:filterVariableTitle:", v24, 0, 0);

    -[WFParameterValuePickerViewController displayNoOptionsAvailableMessageIfNeeded](self, "displayNoOptionsAvailableMessageIfNeeded");
    -[WFParameterValuePickerViewController setCustomPrompt:](self, "setCustomPrompt:", 0);
  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  -[WFParameterValuePickerViewController tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTableFooterView:", v25);

  -[WFParameterValuePickerViewController reloadNavigationBarButtonItems](self, "reloadNavigationBarButtonItems");
  -[WFParameterValuePickerViewController reloadChoosingPrompt](self, "reloadChoosingPrompt");
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)WFParameterValuePickerViewController;
  -[WFParameterValuePickerViewController viewWillAppear:](&v23, sel_viewWillAppear_, a3);
  if (!-[WFParameterValuePickerViewController hasScrolledToSelectedItem](self, "hasScrolledToSelectedItem"))
  {
    -[WFParameterValuePickerViewController setHasScrolledToSelectedItem:](self, "setHasScrolledToSelectedItem:", 1);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[WFParameterValuePickerViewController dataSource](self, "dataSource", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        v12 = 0;
        v13 = v9;
        v14 = v10;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v6);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
          -[WFParameterValuePickerViewController dataSource](self, "dataSource");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "indexPathForItemIdentifier:", v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          -[WFParameterValuePickerViewController dataSource](self, "dataSource");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "parameterStateAtIndexPath:", v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[WFParameterValuePickerViewController currentSelectedValuesContainsState:](self, "currentSelectedValuesContainsState:", v9))
          {
            -[WFParameterValuePickerViewController tableView](self, "tableView");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "scrollToRowAtIndexPath:atScrollPosition:animated:", v10, 2, 0);

            goto LABEL_12;
          }
          ++v12;
          v13 = v9;
          v14 = v10;
        }
        while (v8 != v12);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v8)
          continue;
        break;
      }
LABEL_12:

    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFParameterValuePickerViewController;
  v4 = a3;
  -[WFParameterValuePickerViewController traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  -[WFParameterValuePickerViewController traitCollection](self, "traitCollection", v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[WFParameterValuePickerViewController traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceStyle");
    if (v9 == 1)
      v10 = 2;
    else
      v10 = v9 == 2;
    -[WFParameterValuePickerViewController searchBar](self, "searchBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setKeyboardAppearance:", v10);

  }
}

- (void)configureCell:(id)a3 forState:(id)a4
{
  id v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  id v11;

  v6 = a4;
  v11 = a3;
  -[WFParameterValuePickerViewController parameter](self, "parameter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setParameter:", v7);

  objc_msgSend(v11, "setState:", v6);
  v8 = -[WFParameterValuePickerViewController currentSelectedValuesContainsState:](self, "currentSelectedValuesContainsState:", v6);

  objc_msgSend(v11, "setContainedInState:", v8);
  -[WFParameterValuePickerViewController parameter](self, "parameter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "wf_usesTogglesForSelection"))
    v10 = 0;
  else
    v10 = 3;
  objc_msgSend(v11, "setSelectionStyle:", v10);

  objc_msgSend(v11, "setParentViewController:", self);
  objc_msgSend(v11, "setDelegate:", self);

}

- (void)configureCell:(id)a3 forVariable:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "icon");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "updateWithName:icon:", v7, v8);
      v9 = v6;
LABEL_6:

      goto LABEL_8;
    }
  }

  if (objc_msgSend(v6, "isEqual:", *MEMORY[0x24BEC4750]))
  {
    WFLocalizedString(CFSTR("Select Variable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x24BEC1610]);
    objc_msgSend(MEMORY[0x24BEC14D0], "clearBackground");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "initWithSymbolName:background:", CFSTR("wand.and.stars"), v8);
    objc_msgSend(v13, "updateWithName:icon:", v7, v11);

    v9 = 0;
    goto LABEL_6;
  }
  v9 = 0;
LABEL_8:
  if (-[WFParameterValuePickerViewController currentSelectedValueIsVariable:](self, "currentSelectedValueIsVariable:", v6))
  {
    v12 = 3;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v13, "setAccessoryType:", v12);

}

- (void)reloadNavigationBarButtonItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[WFParameterValuePickerViewController allowsMultipleSelection](self, "allowsMultipleSelection"))
  {
    -[WFParameterValuePickerViewController doneBarButtonItem](self, "doneBarButtonItem");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[WFParameterValuePickerViewController showsCancelButton](self, "showsCancelButton"))
    {
      v7 = 0;
      goto LABEL_7;
    }
    -[WFParameterValuePickerViewController cancelBarButtonItem](self, "cancelBarButtonItem");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)v3;
LABEL_7:
  -[WFParameterValuePickerViewController removeItemBarButtonItem](self, "removeItemBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v7);

  -[WFParameterValuePickerViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v4);

}

- (void)reloadChoosingPrompt
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (-[WFParameterValuePickerViewController showsPrompt](self, "showsPrompt"))
  {
    -[WFParameterValuePickerViewController customPrompt](self, "customPrompt");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      -[WFParameterValuePickerViewController defaultPrompt](self, "defaultPrompt");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v5;

  }
  else
  {
    v7 = 0;
  }
  -[WFParameterValuePickerViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrompt:", v7);

}

- (id)extractIntentsExecutionErrorFromError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDD1398];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_7;
  objc_msgSend(v4, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEC4440]))
  {
    objc_msgSend(v4, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDDA3C0]);

    if ((v10 & 1) != 0)
      goto LABEL_5;
LABEL_7:
    v14 = v4;
    goto LABEL_10;
  }

LABEL_5:
  objc_msgSend(v4, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[WFParameterValuePickerViewController extractIntentsExecutionErrorFromError:](self, "extractIntentsExecutionErrorFromError:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v4;
  }
  v14 = v13;

LABEL_10:
  return v14;
}

- (void)displayError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  if (a3)
  {
    -[WFParameterValuePickerViewController extractIntentsExecutionErrorFromError:](self, "extractIntentsExecutionErrorFromError:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerViewController errorTitleLabel](self, "errorTitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    objc_msgSend(v4, "localizedFailureReason");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerViewController errorMessageLabel](self, "errorMessageLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    -[WFParameterValuePickerViewController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __53__WFParameterValuePickerViewController_displayError___block_invoke;
    v10[3] = &unk_24EE25C70;
    v10[4] = self;
    objc_msgSend(v9, "applyEmptyCollectionAnimatingDifferences:completion:", 1, v10);

  }
}

- (void)displayNoOptionsAvailableMessageIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[WFParameterValuePickerViewController errorTitleLabel](self, "errorTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[WFParameterValuePickerViewController noOptionAvailableTitle](self, "noOptionAvailableTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerViewController errorMessageLabel](self, "errorMessageLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[WFParameterValuePickerViewController dataSource](self, "dataSource");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "itemsCount");
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    -[WFParameterValuePickerViewController errorMessageView](self, "errorMessageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WFParameterValuePickerViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundView:", v7);

  if (!v6)
}

- (BOOL)currentSelectedValuesContainsState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  -[WFParameterValuePickerViewController currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_6:
    -[WFParameterValuePickerViewController currentState](self, "currentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "stateIsEquivalent:", v4);

    goto LABEL_7;
  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(v5, "parameterStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__WFParameterValuePickerViewController_currentSelectedValuesContainsState___block_invoke;
  v10[3] = &unk_24EE25098;
  v12 = &v13;
  v11 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  v7 = *((_BYTE *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);
LABEL_7:

  return v7;
}

- (BOOL)currentSelectedValueIsVariable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  -[WFParameterValuePickerViewController currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "variable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v4, "isEqual:", *MEMORY[0x24BEC4750]);
    }
    else
    {
      objc_msgSend(v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v4;
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
      }
      else
      {
        v10 = 0;
      }
      v11 = v10;

      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v8, "isEqualToString:", v12);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)validateCurrentStateWithCollection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t (**v10)(void *, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  char v20;
  _QWORD aBlock[4];
  id v22;

  v4 = a3;
  -[WFParameterValuePickerViewController currentState](self, "currentState");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[WFParameterValuePickerViewController parameter](self, "parameter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "wf_shouldValidateCurrentStateOnCollectionChanged") & 1) != 0)
    {
      -[WFParameterValuePickerViewController currentState](self, "currentState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "variable");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __75__WFParameterValuePickerViewController_validateCurrentStateWithCollection___block_invoke;
        aBlock[3] = &unk_24EE250E8;
        v22 = v4;
        v10 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
        -[WFParameterValuePickerViewController currentState](self, "currentState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v11, "parameterStates");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "if_objectsPassingTest:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "parameterStates");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", v13);

          if ((v15 & 1) == 0)
          {
            -[WFParameterValuePickerViewController parameter](self, "parameter");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (objc_class *)objc_msgSend(v16, "multipleStateClass");

            if (objc_msgSend(v13, "count"))
            {
              v18 = (void *)objc_msgSend([v17 alloc], "initWithParameterStates:", v13);
              -[WFParameterValuePickerViewController setCurrentState:](self, "setCurrentState:", v18);

            }
            else
            {
              -[WFParameterValuePickerViewController setCurrentState:](self, "setCurrentState:", 0);
            }
          }

        }
        else
        {

          -[WFParameterValuePickerViewController currentState](self, "currentState");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v10[2](v10, v19);

          if ((v20 & 1) == 0)
            -[WFParameterValuePickerViewController setCurrentState:](self, "setCurrentState:", 0);
        }

      }
    }
    else
    {

    }
  }

}

- (void)reloadDisplayingValuesWithCollection:(id)a3 searchTerm:(id)a4 validateCurrentState:(BOOL)a5 animatingDifferences:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  id v19;

  v6 = a6;
  v7 = a5;
  v19 = a3;
  v10 = a4;
  if (objc_msgSend(v10, "length"))
  {
    -[WFParameterValuePickerViewController cachedResults](self, "cachedResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v10);

    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[WFParameterValuePickerViewController setDefaultResults:](self, "setDefaultResults:", v19);
  if (v7)
LABEL_3:
    -[WFParameterValuePickerViewController validateCurrentStateWithCollection:](self, "validateCurrentStateWithCollection:", v19);
LABEL_4:
  -[WFParameterValuePickerViewController searchBar](self, "searchBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v13, "length"))
  {

    v13 = 0;
  }
  v14 = v13;
  v15 = v10;
  v16 = v15;
  if (v14 == v15)
  {

  }
  else
  {
    if (!v15 || !v14)
    {

      goto LABEL_17;
    }
    v17 = objc_msgSend(v14, "isEqualToString:", v15);

    if (!v17)
      goto LABEL_17;
  }
  if (-[WFParameterValuePickerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[WFParameterValuePickerViewController dataSource](self, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "applyCollection:animatingDifferences:filterVariableTitle:", v19, v6, v16);

    -[WFParameterValuePickerViewController displayNoOptionsAvailableMessageIfNeeded](self, "displayNoOptionsAvailableMessageIfNeeded");
  }
LABEL_17:

}

- (void)performSearchWithUserInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *);
  void *v23;
  WFParameterValuePickerViewController *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  BOOL v29;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[WFParameterValuePickerViewController cachedResults](self, "cachedResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFParameterValuePickerViewController cachedPrompts](self, "cachedPrompts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 1;
    if (v6)
    {
LABEL_3:
      -[WFParameterValuePickerViewController reloadDisplayingValuesWithCollection:searchTerm:validateCurrentState:animatingDifferences:](self, "reloadDisplayingValuesWithCollection:searchTerm:validateCurrentState:animatingDifferences:", v6, v4, 1, 1);
      -[WFParameterValuePickerViewController setCustomPrompt:](self, "setCustomPrompt:", v8);
      goto LABEL_12;
    }
  }
  else
  {
    -[WFParameterValuePickerViewController defaultResults](self, "defaultResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerViewController defaultPrompt](self, "defaultPrompt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6 != 0;
    if (v6)
      goto LABEL_3;
  }
  if (v4
    && (-[WFParameterValuePickerViewController parameter](self, "parameter"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "wf_supportsSearch"),
        v10,
        !v11))
  {
    -[WFParameterValuePickerViewController defaultResults](self, "defaultResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      v16 = objc_alloc(MEMORY[0x24BDD9ED0]);
      v15 = (id)objc_msgSend(v16, "initWithItems:", MEMORY[0x24BDBD1A8]);
    }
    v17 = v15;

    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __67__WFParameterValuePickerViewController_performSearchWithUserInput___block_invoke_3;
    v23 = &unk_24EE25138;
    v24 = self;
    v18 = v4;
    v25 = v18;
    objc_msgSend(v17, "wf_filteredCollectionUsingBlock:", &v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerViewController reloadDisplayingValuesWithCollection:searchTerm:validateCurrentState:animatingDifferences:](self, "reloadDisplayingValuesWithCollection:searchTerm:validateCurrentState:animatingDifferences:", v19, v18, 0, v9, v20, v21, v22, v23, v24);

  }
  else
  {
    objc_initWeak(&location, self);
    -[WFParameterValuePickerViewController parameter](self, "parameter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __67__WFParameterValuePickerViewController_performSearchWithUserInput___block_invoke;
    v26[3] = &unk_24EE25110;
    objc_copyWeak(&v28, &location);
    v27 = v4;
    v29 = v9;
    objc_msgSend(v12, "wf_loadStatesWithSearchTerm:completionHandler:", v27, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
LABEL_12:

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "isActive"))
  {
    -[WFParameterValuePickerViewController inputDebouncer](self, "inputDebouncer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "poke");

  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v4;

  -[WFParameterValuePickerViewController inputDebouncer](self, "inputDebouncer", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "poke");

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v3;

  -[WFParameterValuePickerViewController searchBar](self, "searchBar", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)updateSearchResultsFromCurrentUserInput
{
  void *v3;
  id v4;
  id v5;
  id v6;

  -[WFParameterValuePickerViewController searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v4 = v5;
  }
  else
  {

    v4 = 0;
  }
  v6 = v4;
  -[WFParameterValuePickerViewController performSearchWithUserInput:](self, "performSearchWithUserInput:", v4);

}

- (void)finishPickingValue
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[WFParameterValuePickerViewController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", 0);

  -[WFParameterValuePickerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFParameterValuePickerViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerViewController currentState](self, "currentState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parameterValuePickerViewController:didFinishWithParameterState:", self, v6);

  }
}

- (void)cancelPickingValue
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  -[WFParameterValuePickerViewController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", 0);

  -[WFParameterValuePickerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFParameterValuePickerViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parameterValuePickerViewControllerDidCancel:", self);

  }
}

- (void)requestRemovingItem
{
  void *v3;
  char v4;
  id v5;

  if (-[WFParameterValuePickerViewController allowsMultipleSelection](self, "allowsMultipleSelection"))
  {
    -[WFParameterValuePickerViewController setCurrentState:](self, "setCurrentState:", 0);
    -[WFParameterValuePickerViewController resetVisibleCellsSelection](self, "resetVisibleCellsSelection");
  }
  else
  {
    -[WFParameterValuePickerViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[WFParameterValuePickerViewController delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parameterValuePickerViewControllerDidRequestRemovingItem:", self);

    }
  }
}

- (void)resetVisibleCellsSelection
{
  void *v2;
  id v3;

  -[WFParameterValuePickerViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_3536);

}

- (void)toggleCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, void *, uint64_t, _BYTE *);
  void *v38;
  id v39;
  _QWORD v40[5];
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  v13 = v12;

  -[WFParameterValuePickerViewController dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "parameterStateAtIndexPath:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "variable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", *MEMORY[0x24BEC4750]);

  if (!v17)
  {
    if (!-[WFParameterValuePickerViewController allowsMultipleSelection](self, "allowsMultipleSelection")
      || (-[WFParameterValuePickerViewController parameter](self, "parameter"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v19, "multipleStateClass"),
          isKindOfClass = objc_opt_isKindOfClass(),
          v19,
          (isKindOfClass & 1) != 0))
    {
      -[WFParameterValuePickerViewController setCurrentState:](self, "setCurrentState:", v15);
      -[WFParameterValuePickerViewController finishPickingValue](self, "finishPickingValue");
      goto LABEL_26;
    }
    -[WFParameterValuePickerViewController currentState](self, "currentState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFParameterValuePickerViewController currentState](self, "currentState");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "variable");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        v24 = -[WFParameterValuePickerViewController currentSelectedValuesContainsState:](self, "currentSelectedValuesContainsState:", v15);
        -[WFParameterValuePickerViewController currentState](self, "currentState");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v25;
        if (v24)
        {
          objc_msgSend(v25, "parameterStates");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = MEMORY[0x24BDAC760];
          v36 = 3221225472;
          v37 = __63__WFParameterValuePickerViewController_toggleCell_atIndexPath___block_invoke_3;
          v38 = &unk_24EE250C0;
          v39 = v15;
          v27 = objc_msgSend(v26, "indexOfObjectPassingTest:", &v35);

          if (v27 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v18, "stateByRemovingValueAtIndex:", v27, v35, v36, v37, v38);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFParameterValuePickerViewController setCurrentState:](self, "setCurrentState:", v28);

            objc_msgSend(v10, "setContainedInState:", 0);
            objc_msgSend(v13, "setAccessoryType:", 0);
          }

          goto LABEL_11;
        }
        objc_msgSend(v25, "stateByAppendingValue:", v15);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFParameterValuePickerViewController setCurrentState:](self, "setCurrentState:", v34);

LABEL_25:
        objc_msgSend(v10, "setContainedInState:", 1);
        objc_msgSend(v13, "setAccessoryType:", 3);
        goto LABEL_26;
      }
    }
    else
    {

    }
    -[WFParameterValuePickerViewController currentState](self, "currentState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "variable");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      -[WFParameterValuePickerViewController resetVisibleCellsSelection](self, "resetVisibleCellsSelection");
    v31 = objc_alloc(MEMORY[0x24BEC3EE0]);
    v41[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithParameterStates:", v32);
    -[WFParameterValuePickerViewController setCurrentState:](self, "setCurrentState:", v33);

    goto LABEL_25;
  }
  -[WFParameterValuePickerViewController presentingViewController](self, "presentingViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __63__WFParameterValuePickerViewController_toggleCell_atIndexPath___block_invoke;
  v40[3] = &unk_24EE25C70;
  v40[4] = self;
  objc_msgSend(v18, "dismissViewControllerAnimated:completion:", 1, v40);
LABEL_11:

LABEL_26:
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;

  v5 = a4;
  if (-[WFParameterValuePickerViewController maximumSelectableItemsCount](self, "maximumSelectableItemsCount") < 2
    || -[WFParameterValuePickerViewController maximumSelectableItemsCount](self, "maximumSelectableItemsCount") == 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_3;
  }
  -[WFParameterValuePickerViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parameterStateAtIndexPath:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFParameterValuePickerViewController currentSelectedValuesContainsState:](self, "currentSelectedValuesContainsState:", v9))
  {
    v6 = v5;
LABEL_15:

    goto LABEL_4;
  }
  -[WFParameterValuePickerViewController currentState](self, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  objc_msgSend(v12, "parameterStates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  v15 = -[WFParameterValuePickerViewController maximumSelectableItemsCount](self, "maximumSelectableItemsCount");

  if (v14 >= v15)
  {
    v6 = 0;
    goto LABEL_15;
  }

LABEL_3:
  v6 = v5;
LABEL_4:

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[WFParameterValuePickerViewController parameter](self, "parameter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "wf_usesTogglesForSelection");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, 1);
    objc_msgSend(v10, "cellForRowAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerViewController toggleCell:atIndexPath:](self, "toggleCell:atIndexPath:", v9, v6);

  }
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  -[WFParameterValuePickerViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sectionsCount") - 1;

  if (v8 <= a4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "wf_isWidgetConfigurationExtensionBundle");
  }
  else
  {
    -[WFParameterValuePickerViewController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tableView:titleForHeaderInSection:", v6, a4 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "length") == 0;
  }

  return v11;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;

  v6 = a3;
  -[WFParameterValuePickerViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView:titleForHeaderInSection:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = 22.0;
  else
    v9 = 0.0;

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[WFParameterValuePickerViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView:titleForHeaderInSection:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("WFParameterValuePickerSectionHeaderView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultContentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v8);
    objc_msgSend(v9, "setContentConfiguration:", v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v8;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    v13 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v15 = v14;

  -[WFParameterValuePickerViewController dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "parameterStateAtIndexPath:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[WFParameterValuePickerViewController currentSelectedValuesContainsState:](self, "currentSelectedValuesContainsState:", v17);
  if (v18)
    v19 = 3;
  else
    v19 = 0;
  objc_msgSend(v12, "setContainedInState:", v18);
  objc_msgSend(v15, "setAccessoryType:", v19);

}

- (void)parameterAttributesDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __69__WFParameterValuePickerViewController_parameterAttributesDidChange___block_invoke;
  v3[3] = &unk_24EE251A0;
  v3[4] = self;
  objc_msgSend(a3, "wf_reloadFromAttributesDidChangeWithCompletionHandler:", v3);
}

- (void)parameterValuePickerTableViewCell:(id)a3 didToggleSelection:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[WFParameterValuePickerViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForCell:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[WFParameterValuePickerViewController toggleCell:atIndexPath:](self, "toggleCell:atIndexPath:", v5, v7);
}

- (BOOL)accessibilityPerformEscape
{
  -[WFParameterValuePickerViewController cancelPickingValue](self, "cancelPickingValue");
  return 1;
}

- (WFParameterValuePickable)parameter
{
  return self->_parameter;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (WFVariableSubstitutableParameterState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (WFParameterValuePickerViewControllerDelegate)delegate
{
  return (WFParameterValuePickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (WFVariableProvider)variableProvider
{
  return (WFVariableProvider *)objc_loadWeakRetained((id *)&self->_variableProvider);
}

- (WFVariableUIDelegate)variableUIDelegate
{
  return (WFVariableUIDelegate *)objc_loadWeakRetained((id *)&self->_variableUIDelegate);
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowsMultipleSelection;
}

- (NSString)noOptionAvailableTitle
{
  return self->_noOptionAvailableTitle;
}

- (NSString)removeItemButtonTitle
{
  return self->_removeItemButtonTitle;
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (NSMutableDictionary)cachedResults
{
  return self->_cachedResults;
}

- (void)setCachedResults:(id)a3
{
  objc_storeStrong((id *)&self->_cachedResults, a3);
}

- (NSMutableDictionary)cachedPrompts
{
  return self->_cachedPrompts;
}

- (void)setCachedPrompts:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPrompts, a3);
}

- (INObjectCollection)defaultResults
{
  return self->_defaultResults;
}

- (void)setDefaultResults:(id)a3
{
  objc_storeStrong((id *)&self->_defaultResults, a3);
}

- (NSString)defaultPrompt
{
  return self->_defaultPrompt;
}

- (NSString)customPrompt
{
  return self->_customPrompt;
}

- (WFParameterValuePickerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (WFDebouncer)inputDebouncer
{
  return self->_inputDebouncer;
}

- (void)setInputDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_inputDebouncer, a3);
}

- (NSSet)allowedVariableTypes
{
  return self->_allowedVariableTypes;
}

- (void)setAllowedVariableTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (int64_t)maximumSelectableItemsCount
{
  return self->_maximumSelectableItemsCount;
}

- (void)setMaximumSelectableItemsCount:(int64_t)a3
{
  self->_maximumSelectableItemsCount = a3;
}

- (UIView)errorMessageView
{
  return self->_errorMessageView;
}

- (void)setErrorMessageView:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessageView, a3);
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
}

- (UILabel)errorTitleLabel
{
  return self->_errorTitleLabel;
}

- (void)setErrorTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorTitleLabel, a3);
}

- (UILabel)errorMessageLabel
{
  return self->_errorMessageLabel;
}

- (void)setErrorMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessageLabel, a3);
}

- (BOOL)hasScrolledToSelectedItem
{
  return self->_hasScrolledToSelectedItem;
}

- (void)setHasScrolledToSelectedItem:(BOOL)a3
{
  self->_hasScrolledToSelectedItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessageLabel, 0);
  objc_storeStrong((id *)&self->_errorTitleLabel, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_errorMessageView, 0);
  objc_storeStrong((id *)&self->_allowedVariableTypes, 0);
  objc_storeStrong((id *)&self->_inputDebouncer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_customPrompt, 0);
  objc_storeStrong((id *)&self->_defaultPrompt, 0);
  objc_storeStrong((id *)&self->_defaultResults, 0);
  objc_storeStrong((id *)&self->_cachedPrompts, 0);
  objc_storeStrong((id *)&self->_cachedResults, 0);
  objc_storeStrong((id *)&self->_removeItemButtonTitle, 0);
  objc_storeStrong((id *)&self->_noOptionAvailableTitle, 0);
  objc_destroyWeak((id *)&self->_variableUIDelegate);
  objc_destroyWeak((id *)&self->_variableProvider);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_removeItemBarButtonItem, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
}

void __69__WFParameterValuePickerViewController_parameterAttributesDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__WFParameterValuePickerViewController_parameterAttributesDidChange___block_invoke_2;
  v6[3] = &unk_24EE252E0;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __69__WFParameterValuePickerViewController_parameterAttributesDidChange___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    return objc_msgSend(*(id *)(result + 40), "reloadDisplayingValuesWithCollection:searchTerm:validateCurrentState:animatingDifferences:", v1, 0, 1, 1);
  return result;
}

void __63__WFParameterValuePickerViewController_toggleCell_atIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "allowedVariableTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *MEMORY[0x24BEC4778]);

  objc_msgSend(*(id *)(a1 + 32), "variableUIDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "variableProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__WFParameterValuePickerViewController_toggleCell_atIndexPath___block_invoke_2;
  v6[3] = &unk_24EE25238;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "showActionOutputPickerAllowingShortcutInput:variableProvider:completionHandler:", v3, v5, v6);

}

uint64_t __63__WFParameterValuePickerViewController_toggleCell_atIndexPath___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "stateIsEquivalent:", *(_QWORD *)(a1 + 32));
  *a4 = result;
  return result;
}

void __63__WFParameterValuePickerViewController_toggleCell_atIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8 = v3;
  if (v3)
  {
    objc_msgSend(v4, "parameter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_msgSend(v5, "stateClass");

    v7 = (void *)objc_msgSend([v6 alloc], "initWithVariable:", v8);
    objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", v7);
    objc_msgSend(*(id *)(a1 + 32), "finishPickingValue");

  }
  else
  {
    objc_msgSend(v4, "cancelPickingValue");
  }

}

void __66__WFParameterValuePickerViewController_resetVisibleCellsSelection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v7;
    else
      v2 = 0;
    v3 = v2;

    v4 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v3, "setContainedInState:", 0);
  objc_msgSend(v6, "setAccessoryType:", 0);

}

void __67__WFParameterValuePickerViewController_performSearchWithUserInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (v9)
  {
    objc_msgSend(WeakRetained, "displayError:", v9);
  }
  else
  {
    if (v7)
    {
      v12 = v7;
    }
    else
    {
      v13 = objc_alloc(MEMORY[0x24BDD9ED0]);
      v12 = (id)objc_msgSend(v13, "initWithItems:", MEMORY[0x24BDBD1A8]);
    }
    v14 = v12;
    objc_msgSend(v11, "reloadDisplayingValuesWithCollection:searchTerm:validateCurrentState:animatingDifferences:", v12, *(_QWORD *)(a1 + 32), 1, *(unsigned __int8 *)(a1 + 48));

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__WFParameterValuePickerViewController_performSearchWithUserInput___block_invoke_2;
  block[3] = &unk_24EE25290;
  block[4] = v11;
  v17 = v8;
  v18 = *(id *)(a1 + 32);
  v15 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __67__WFParameterValuePickerViewController_performSearchWithUserInput___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "parameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wf_pickerLocalizedTitleForState:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "localizedStandardContainsString:", *(_QWORD *)(a1 + 40));
  return v7;
}

void __67__WFParameterValuePickerViewController_performSearchWithUserInput___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setCustomPrompt:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultPrompt");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  v7 = v4;
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v5, "cachedPrompts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(v5, "setDefaultPrompt:", v4);
  }

}

BOOL __75__WFParameterValuePickerViewController_validateCurrentStateWithCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _BOOL8 v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__WFParameterValuePickerViewController_validateCurrentStateWithCollection___block_invoke_2;
  v8[3] = &unk_24EE250C0;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v8) != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

uint64_t __75__WFParameterValuePickerViewController_validateCurrentStateWithCollection___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "stateIsEquivalent:", a2);
  *a4 = result;
  return result;
}

uint64_t __75__WFParameterValuePickerViewController_currentSelectedValuesContainsState___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "stateIsEquivalent:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void __53__WFParameterValuePickerViewController_displayError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "errorMessageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundView:", v3);

}

id __51__WFParameterValuePickerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  id v17;
  void *v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "value");
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ParameterStateCell"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "numberOfSections") == 2)
    {
      objc_msgSend(WeakRetained, "tableView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "numberOfRowsInSection:", objc_msgSend(v8, "section"));
      v16 = v15 == objc_msgSend(v8, "row") + 1;

    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(WeakRetained, "configureCell:forState:", v12, v9);
  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ParameterVariableCell"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "configureCell:forVariable:", v12, v9);
    v16 = 0;
  }
  v17 = v12;
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v17, "setDisablesSeparatorIconInset:", v16);
    v18 = v17;
  }
  else
  {

    v18 = 0;
  }

  return v17;
}

@end
