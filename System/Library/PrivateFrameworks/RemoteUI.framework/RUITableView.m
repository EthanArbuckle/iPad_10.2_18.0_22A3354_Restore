@implementation RUITableView

- (id)staticValues
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIdentifier:", "sectionCount");
  objc_msgSend(v2, "setGetter:", RUIJSTable_getProperty);
  objc_msgSend(v2, "setSetter:", 0);
  objc_msgSend(v2, "setJSPropertyAttributes:", 10);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setIdentifier:", "editing");
  objc_msgSend(v3, "setGetter:", RUIJSTable_getProperty);
  objc_msgSend(v3, "setSetter:", RUIJSTable_setProperty);
  objc_msgSend(v3, "setJSPropertyAttributes:", 8);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)_enableTestMode
{
  gAnimatedTransitions = 1;
}

- (RUITableView)initWithAttributes:(id)a3 parent:(id)a4
{
  RUITableView *v4;
  NSMutableArray *v5;
  NSMutableArray *sections;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RUITableView;
  v4 = -[RUIElement initWithAttributes:parent:](&v8, sel_initWithAttributes_parent_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sections = v4->_sections;
    v4->_sections = v5;

  }
  return v4;
}

- (NSMutableArray)sections
{
  int *v2;

  if (self->_isSearching)
    v2 = &OBJC_IVAR___RUITableView__filteredSections;
  else
    v2 = &OBJC_IVAR___RUITableView__sections;
  return (NSMutableArray *)*(id *)((char *)&self->super.super.isa + *v2);
}

- (void)_registerForNotifications:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    if (self->_registeredForNotifications)
      return;
    self->_registeredForNotifications = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__textChanged_, *MEMORY[0x24BEBE868], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_automaticKeyboardDidShow_, *MEMORY[0x24BEBE448], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_automaticKeyboardDidHide_, *MEMORY[0x24BEBE440], 0);
  }
  else
  {
    if (!self->_registeredForNotifications)
      return;
    self->_registeredForNotifications = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BEBE868], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BEBE448], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x24BEBE440], 0);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[RUITableView _registerForNotifications:](self, "_registerForNotifications:", 0);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", 0);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RUITableView;
  -[RUIElement dealloc](&v3, sel_dealloc);
}

- (void)traitCollectionDidChangeFrom:(id)a3 toTraitCollection:(id)a4
{
  objc_storeStrong((id *)&self->_currentTraitCollection, a4);
}

- (BOOL)isSearchEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[RUIElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("searchEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)addSearchBarToPage:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  UISearchBar *v13;
  UISearchBar *searchBar;
  UISearchBar *v15;
  UISearchBar *v16;
  id v17;

  v17 = a3;
  if (-[RUITableView isSearchEnabled](self, "isSearchEnabled") && !self->_searchBar)
  {
    -[RUIElement attributes](self, "attributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchBarInNavigationBar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD928]), "initWithSearchResultsController:", 0);
      objc_msgSend(v7, "setObscuresBackgroundDuringPresentation:", 0);
      objc_msgSend(v7, "setAutomaticallyShowsSearchResultsController:", 0);
      -[RUIElement attributes](self, "attributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hidesSearchBarWhenScrolling"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");
      objc_msgSend(v17, "navigationItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidesSearchBarWhenScrolling:", v10);

      objc_msgSend(v17, "navigationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSearchController:", v7);

      objc_msgSend(v7, "searchBar");
      v13 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
      searchBar = self->_searchBar;
      self->_searchBar = v13;

    }
    else
    {
      v15 = (UISearchBar *)objc_alloc_init(MEMORY[0x24BEBD920]);
      v16 = self->_searchBar;
      self->_searchBar = v15;

      objc_msgSend(v17, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", self->_searchBar);
    }

    -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
  }

}

- (CGRect)searchBarRectInPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  double *v8;
  double v9;
  UISearchBar *searchBar;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v4 = a3;
  if (!self->_searchBar)
  {
    v8 = (double *)MEMORY[0x24BDBF090];
    v9 = *MEMORY[0x24BDBF090];
    goto LABEL_5;
  }
  -[RUIElement attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("searchBarInNavigationBar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = (double *)MEMORY[0x24BDBF090];
  v9 = *MEMORY[0x24BDBF090];
  if (v7)
  {
LABEL_5:
    v20 = v8[1];
    v15 = v8[2];
    v17 = v8[3];
    goto LABEL_6;
  }
  searchBar = self->_searchBar;
  objc_msgSend(v4, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  -[UISearchBar sizeThatFits:](searchBar, "sizeThatFits:", v12, v13);
  v15 = v14;
  v17 = v16;

  objc_msgSend(v4, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaInsets");
  v20 = v19;

LABEL_6:
  v21 = v9;
  v22 = v20;
  v23 = v15;
  v24 = v17;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)tableView
{
  UITableView *tableView;
  id v4;
  int64_t v5;
  UITableView *v6;
  UITableView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD9F0]);
    v5 = -[RUITableView tableViewStyle](self, "tableViewStyle");
    v6 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", v5, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v7 = self->_tableView;
    self->_tableView = v6;

    -[UITableView setPreservesSuperviewLayoutMargins:](self->_tableView, "setPreservesSuperviewLayoutMargins:", 1);
    -[UITableView setAllowsSelectionDuringEditing:](self->_tableView, "setAllowsSelectionDuringEditing:", 1);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[UITableView setCellLayoutMarginsFollowReadableWidth:](self->_tableView, "setCellLayoutMarginsFollowReadableWidth:", 1);
    -[RUIElement attributes](self, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("sectionStyle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isEqualToString:", CFSTR("compact")))
      -[UITableView setSectionHeaderHeight:](self->_tableView, "setSectionHeaderHeight:", 0.0);
    -[UITableView layoutMargins](self->_tableView, "layoutMargins");
    -[UITableView setLayoutMargins:](self->_tableView, "setLayoutMargins:");
    -[RUIElement attributes](self, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("editing"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v12)
      -[UITableView setEditing:animated:](self->_tableView, "setEditing:animated:", 1, 0);
    -[RUIElement attributes](self, "attributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("allowsMultipleSelectionDuringEditing"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setAllowsMultipleSelectionDuringEditing:](self->_tableView, "setAllowsMultipleSelectionDuringEditing:", objc_msgSend(v14, "BOOLValue"));

    if (+[RUIPlatform isAppleTV](RUIPlatform, "isAppleTV"))
      -[UITableView _setGradientMaskInsets:](self->_tableView, "_setGradientMaskInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));

    tableView = self->_tableView;
  }
  return tableView;
}

- (int64_t)tableViewStyle
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("style"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("grouped")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("plain")) & 1) != 0)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("insetGrouped")) & 1) != 0)
  {
    v5 = 2;
  }
  else
  {
    -[RUITableView objectModel](self, "objectModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "tableViewStyle");

  }
  return v5;
}

- (void)_updateSectionContentInsetForSettingsWithAnimation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;
  double *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v20;
  id v21;
  _QWORD v22[9];

  v3 = a3;
  -[RUIElement attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("style"));
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "isEqualToString:", CFSTR("settings")))
  {
    v6 = -[RUITableView _isRegularWidth](self, "_isRegularWidth");
    v7 = (double *)MEMORY[0x24BEBE770];
    if (v6)
    {
      -[RUITableView view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layoutMargins");
      v10 = v9;

      -[RUITableView view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safeAreaInsets");
      v13 = v12;

      v14 = 0.0;
      if (v13 <= 0.0)
      {
        -[RUITableView view](self, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "layoutMargins");
        v14 = v16;

      }
    }
    else
    {
      v14 = *MEMORY[0x24BEBE770];
      v10 = *MEMORY[0x24BEBE770];
    }
    -[UITableView _sectionContentInset](self->_tableView, "_sectionContentInset", v21);
    if (v10 != v18 || v14 != v17)
    {
      v20 = *v7;
      if (v3 && self->_sectionContentInsetInitialized)
      {
        -[UITableView _setSectionContentInset:](self->_tableView, "_setSectionContentInset:", v20, v10, *v7, v14);
      }
      else
      {
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __67__RUITableView__updateSectionContentInsetForSettingsWithAnimation___block_invoke;
        v22[3] = &unk_24C2982A8;
        v22[4] = self;
        *(double *)&v22[5] = v20;
        *(double *)&v22[6] = v10;
        *(double *)&v22[7] = v20;
        *(double *)&v22[8] = v14;
        objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v22);
        self->_sectionContentInsetInitialized = 1;
      }
    }
  }

}

uint64_t __67__RUITableView__updateSectionContentInsetForSettingsWithAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "_setSectionContentInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)_isRegularWidth
{
  return -[UITraitCollection horizontalSizeClass](self->_currentTraitCollection, "horizontalSizeClass") == UIUserInterfaceSizeClassRegular;
}

- (void)setAttributes:(id)a3
{
  id v4;
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
  void *v16;
  uint64_t v17;
  objc_super v18;

  v4 = a3;
  -[RUIElement attributes](self, "attributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v18.receiver = self;
    v18.super_class = (Class)RUITableView;
    -[RUIElement setAttributes:](&v18, sel_setAttributes_, v4);
    -[RUIElement attributes](self, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("scrollEnabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length") && (objc_msgSend(v7, "BOOLValue") & 1) == 0)
    {
      -[RUITableView tableView](self, "tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setScrollEnabled:", 0);

    }
    -[RUIElement attributes](self, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("backgroundColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "_remoteUI_colorWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUITableView tableView](self, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBackgroundColor:", v11);

    }
    -[RUIElement attributes](self, "attributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("separatorStyle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_14;
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("none")))
    {
      -[RUITableView tableView](self, "tableView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 0;
    }
    else
    {
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("singleLine")) & 1) == 0
        && !objc_msgSend(v14, "isEqualToString:", CFSTR("etchedLine")))
      {
        goto LABEL_14;
      }
      -[RUITableView tableView](self, "tableView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = 1;
    }
    objc_msgSend(v15, "setSeparatorStyle:", v17);

LABEL_14:
  }

}

- (void)populatePostbackDictionary:(id)a3
{
  id v4;
  NSMutableArray *v5;
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_sections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "populatePostbackDictionary:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[RUITableView populateSelectionDictionary:](self, "populateSelectionDictionary:", v4);
}

- (void)populateSelectionDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  RUITableView *v22;
  NSMutableArray *obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RUIElement identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v22 = self;
    obj = self->_sections;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (!v25)
      goto LABEL_21;
    v24 = *(_QWORD *)v32;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v26 = v8;
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v8);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v9, "rows", v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v28 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
              objc_msgSend(v15, "tableCell");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v16, "isSelected"))
              {
                objc_msgSend(v15, "tableCell");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "selectionStyle");

                if (!v18)
                  continue;
                objc_msgSend(v15, "attributes");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("value"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16)
                  objc_msgSend(v7, "addObject:", v16);
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v12);
        }

        v8 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (!v25)
      {
LABEL_21:

        v20 = (void *)objc_msgSend(v7, "copy");
        -[RUIElement identifier](v22, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, v21);

        break;
      }
    }
  }

}

- (id)subElementWithID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_sections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v13 = v10;
LABEL_13:
          v14 = v13;
          goto LABEL_14;
        }
        objc_msgSend(v10, "subElementWithID:", v4);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_13;
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_14:

  return v14;
}

- (id)subElementsWithName:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_sections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "name", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
        objc_msgSend(v11, "subElementsWithName:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v14);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_objectModelIndexPathForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = v4;
  if (self->_embeddedPickerRowIndexPath)
  {
    v6 = objc_msgSend(v4, "section");
    if (v6 == -[NSIndexPath section](self->_embeddedPickerRowIndexPath, "section"))
    {
      v7 = objc_msgSend(v5, "row");
      if (v7 > -[NSIndexPath row](self->_embeddedPickerRowIndexPath, "row"))
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v5, "row") - 1, objc_msgSend(v5, "section"));
        v8 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v8;
      }
    }
  }
  return v5;
}

- (id)objectModelRowForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;

  v4 = a3;
  if (v4)
  {
    -[RUITableView _objectModelIndexPathForIndexPath:](self, "_objectModelIndexPathForIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[RUITableView sections](self, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v5, "row");
    objc_msgSend(v7, "rows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v8 >= v10)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v7, "rows");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v5, "row"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v4;
}

- (id)indexPathForRow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  -[RUITableView sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    while (1)
    {
      -[RUITableView sections](self, "sections");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "rows");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "indexOfObject:", v4);

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        break;

      if (v6 == ++v7)
        goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v12 = 0;
  }

  return v12;
}

- (id)rowWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[RUITableView sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v6 = *(_QWORD *)v26;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v8, "rows", v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v14, "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v4);

              if ((v16 & 1) != 0)
              {
                v17 = v14;

                goto LABEL_19;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v11)
              continue;
            break;
          }
        }

        v6 = v19;
      }
      v17 = 0;
      v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (void)_clearPickers
{
  -[UIDatePicker removeFromSuperview](self->_datePicker, "removeFromSuperview");
  -[UIPickerView removeFromSuperview](self->_selectPicker, "removeFromSuperview");
  -[_UIBackdropView removeFromSuperview](self->_pickerBackdrop, "removeFromSuperview");
}

- (void)_setBottomInset:(float)a3
{
  -[UITableView contentInset](self->_tableView, "contentInset");
  -[UITableView setContentInset:](self->_tableView, "setContentInset:");
}

- (void)reloadHeadersAndFootersForSection:(id)a3
{
  void *v4;
  uint64_t v5;
  UITableView *tableView;
  void *v7;
  id v8;

  v8 = a3;
  -[RUITableView sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v8);

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog(CFSTR("Cannot find section to reload: %@"), v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBDB00], "disableAnimation");
    tableView = self->_tableView;
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView _reloadSectionHeaderFooters:withRowAnimation:](tableView, "_reloadSectionHeaderFooters:withRowAnimation:", v7, 5);

    objc_msgSend(MEMORY[0x24BEBDB00], "enableAnimation");
  }

}

- (void)insertRow:(id)a3 atIndexPath:(id)a4
{
  NSMutableArray *sections;
  id v7;
  id v8;
  void *v9;
  UITableView *tableView;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  sections = self->_sections;
  v7 = a4;
  v8 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](sections, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertRow:atIndex:", v8, objc_msgSend(v7, "row"));

  tableView = self->_tableView;
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (gAnimatedTransitions)
    v12 = 5;
  else
    v12 = 0;
  -[UITableView insertRowsAtIndexPaths:withRowAnimation:](tableView, "insertRowsAtIndexPaths:withRowAnimation:", v11, v12);

}

- (void)removeRowAtIndexPath:(id)a3
{
  NSMutableArray *sections;
  id v5;
  void *v6;
  UITableView *tableView;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  sections = self->_sections;
  v5 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](sections, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeRowAtIndex:", objc_msgSend(v5, "row"));
  tableView = self->_tableView;
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (gAnimatedTransitions)
    v9 = 5;
  else
    v9 = 0;
  -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v8, v9);

}

- (void)setEditing:(BOOL)a3
{
  -[UITableView setEditing:animated:](self->_tableView, "setEditing:animated:", a3, (gAnimatedTransitions & 1) == 0);
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  NSMutableArray *sections;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  sections = self->_sections;
  v17 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__RUITableView_viewForElementIdentifier___block_invoke;
  v9[3] = &unk_24C2982D0;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[NSMutableArray enumerateObjectsUsingBlock:](sections, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__RUITableView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "viewForElementIdentifier:", *(_QWORD *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)setHeaderViewAttributes:(id)a3
{
  id v4;
  RUIHeaderElement *v5;
  RUIHeaderElement *header;

  v4 = a3;
  v5 = -[RUIElement initWithAttributes:parent:]([RUIHeaderElement alloc], "initWithAttributes:parent:", v4, self);

  header = self->_header;
  self->_header = v5;

}

- (void)setFooterViewAttributes:(id)a3
{
  id v4;
  RUIFooterElement *v5;
  RUIFooterElement *footer;

  v4 = a3;
  v5 = -[RUIElement initWithAttributes:parent:]([RUIFooterElement alloc], "initWithAttributes:parent:", v4, self);

  footer = self->_footer;
  self->_footer = v5;

}

- (NSDictionary)headerViewAttributes
{
  return -[RUIElement attributes](self->_header, "attributes");
}

- (NSDictionary)footerViewAttributes
{
  return -[RUIElement attributes](self->_footer, "attributes");
}

- (RUIHeader)headerView
{
  RUIHeader *headerView;

  headerView = self->_headerView;
  if (!headerView)
  {
    -[RUITableView _loadHeaderView](self, "_loadHeaderView");
    headerView = self->_headerView;
  }
  return headerView;
}

- (CGSize)_tableHeaderSizeForHeader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  v4 = a3;
  -[RUITableView tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readableContentGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutFrame");
  v8 = v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "headerHeightForWidth:inView:", self->_tableView, v8);
LABEL_5:
    v10 = v9;
    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "headerHeightForWidth:inTableView:", self->_tableView, v8);
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "_wantsAutolayout"))
  {
    v10 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v13 = *(double *)(MEMORY[0x24BEBE588] + 8);
    -[RUITableView tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "readableContentGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutFrame");
    v17 = v16;

    objc_msgSend(v4, "systemLayoutSizeFittingSize:", v17, v13);
  }
  else
  {
    -[UITableView frame](self->_tableView, "frame");
    objc_msgSend(v4, "sizeThatFits:", v18, v19);
    v8 = v20;
    v10 = v21;
  }
LABEL_6:

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)titleLabel
{
  return 0;
}

- (void)_loadHeaderView
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  NSObject *v14;
  id v15;
  RUIModernHeaderView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  RUIReadableContentContainer *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  RUIHeader *headerView;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint8_t buf[8];
  _QWORD v48[5];

  v48[4] = *MEMORY[0x24BDAC8D0];
  if (self->_header || self->_subHeader || self->_headerTitle || -[RUIElement hasImage](self, "hasImage"))
  {
    -[RUITableView tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tableHeaderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
      -[RUIElement attributes](self->_header, "attributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "tableHeaderViewForAttributes:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = *MEMORY[0x24BDBF090];
        v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
        -[RUITableView _tableHeaderSizeForHeader:](self, "_tableHeaderSizeForHeader:", v7);
        objc_msgSend(v7, "setFrame:", v8, v9, v10, v11);
        -[UITableView setTableHeaderView:](self->_tableView, "setTableHeaderView:", v7);
      }
      else
      {
        -[RUITableView page](self, "page");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "showsTitlesAsHeaderViews");

        if (v13)
        {
          if (_isInternalInstall())
          {
            _RUILoggingFacility();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_209E87000, v14, OS_LOG_TYPE_DEFAULT, "Attempting modern header", buf, 2u);
            }

          }
          if (-[RUIElement hasImage](self, "hasImage"))
          {
            v15 = objc_alloc_init(MEMORY[0x24BEBD640]);
            v16 = -[RUIModernHeaderView initWithTitle:detailText:icon:]([RUIModernHeaderView alloc], "initWithTitle:detailText:icon:", self->_headerTitle, self->_subHeaderTitle, v15);

          }
          else
          {
            v16 = -[RUIModernHeaderView initWithTitle:detailText:icon:]([RUIModernHeaderView alloc], "initWithTitle:detailText:icon:", self->_headerTitle, self->_subHeaderTitle, 0);
          }
          -[RUIModernHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        }
        else
        {
          v16 = -[RUIHeaderView initWithAttributes:]([RUIHeaderView alloc], "initWithAttributes:", 0);
          -[RUIModernHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[RUIElement style](self, "style");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "subHeaderTopMargin");
          -[RUIModernHeaderView setSubHeaderTopMargin:](v16, "setSubHeaderTopMargin:");

          -[RUIElement style](self, "style");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "headerImagePadding");
          -[RUIModernHeaderView setImageLabelPadding:](v16, "setImageLabelPadding:");

          -[RUIElement style](self, "style");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "headerMargin");
          -[RUIModernHeaderView setHeaderMargin:](v16, "setHeaderMargin:");

          -[RUIElement style](self, "style");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "headerLabelTextColor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[RUIModernHeaderView setHeaderColor:](v16, "setHeaderColor:", v21);

        }
        -[RUIHeaderElement configureView:](self->_header, "configureView:", v16);
        -[RUISubHeaderElement configureView:](self->_subHeader, "configureView:", v16);
        v22 = objc_alloc_init(RUIReadableContentContainer);
        -[RUIReadableContentContainer setPreservesSuperviewLayoutMargins:](v22, "setPreservesSuperviewLayoutMargins:", 1);
        v23 = objc_loadWeakRetained((id *)&self->_objectModel);
        objc_msgSend(v23, "style");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "headerContainerSideMargin");
        v26 = v25;
        v27 = objc_loadWeakRetained((id *)&self->_objectModel);
        objc_msgSend(v27, "style");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "headerContainerSideMargin");
        -[RUIReadableContentContainer setDirectionalLayoutMargins:](v22, "setDirectionalLayoutMargins:", 0.0, v26, 0.0, v29);

        -[RUIReadableContentContainer addSubview:](v22, "addSubview:", v16);
        -[UITableView setTableHeaderView:](self->_tableView, "setTableHeaderView:", v22);
        v40 = (void *)MEMORY[0x24BDD1628];
        -[RUIReadableContentContainer topAnchor](v22, "topAnchor");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[RUIModernHeaderView topAnchor](v16, "topAnchor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "constraintEqualToAnchor:", v45);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v44;
        -[RUIReadableContentContainer bottomAnchor](v22, "bottomAnchor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[RUIModernHeaderView bottomAnchor](v16, "bottomAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "constraintEqualToAnchor:", v42);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v48[1] = v41;
        -[RUIReadableContentContainer readableContentGuide](v22, "readableContentGuide");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "leadingAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[RUIModernHeaderView leadingAnchor](v16, "leadingAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "constraintEqualToAnchor:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v48[2] = v31;
        -[RUIReadableContentContainer readableContentGuide](v22, "readableContentGuide");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "trailingAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[RUIModernHeaderView trailingAnchor](v16, "trailingAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "constraintEqualToAnchor:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v48[3] = v35;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 4);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "activateConstraints:", v36);

        headerView = self->_headerView;
        self->_headerView = (RUIHeader *)v16;

        -[RUIElement loadImage](self, "loadImage");
        v7 = 0;
      }

    }
  }
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v4 = a3;
  -[RUITableView page](self, "page");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showsTitlesAsHeaderViews");

  -[RUITableView headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "setIcon:accessibilityLabel:", v4, 0);
  else
    objc_msgSend(v7, "setIconImage:", v4);

}

- (void)setImageSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  char v7;
  id v8;

  height = a3.height;
  width = a3.width;
  -[RUITableView page](self, "page");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showsTitlesAsHeaderViews");

  if ((v7 & 1) == 0)
  {
    -[RUITableView headerView](self, "headerView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImageSize:", width, height);

  }
}

- (void)setImageAlignment:(int)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  -[RUITableView page](self, "page");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "showsTitlesAsHeaderViews");

  if ((v6 & 1) == 0)
  {
    -[RUITableView headerView](self, "headerView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImageAlignment:", v3);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  double x;
  double y;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  _QWORD v20[5];
  CGRect v21;

  -[UITableView superview](self->_tableView, "superview", a3);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableView frame](self->_tableView, "frame");
  x = v21.origin.x;
  y = v21.origin.y;
  if (CGRectIsEmpty(v21) && v19 != 0)
  {
    objc_msgSend(v19, "bounds");
    -[UITableView setFrame:](self->_tableView, "setFrame:", x, y);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  objc_msgSend(WeakRetained, "configureTableView:", self);

  -[RUITableView _loadHeaderView](self, "_loadHeaderView");
  if (self->_footer)
  {
    -[UITableView tableFooterView](self->_tableView, "tableFooterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = objc_loadWeakRetained((id *)&self->_objectModel);
      -[RUIElement attributes](self->_footer, "attributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "tableFooterViewForAttributes:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = *MEMORY[0x24BDBF090];
        v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
        -[UITableView frame](self->_tableView, "frame");
        objc_msgSend(v11, "sizeThatFits:", v14, v15);
        objc_msgSend(v11, "setFrame:", v12, v13, v16, v17);
        -[UITableView setTableFooterView:](self->_tableView, "setTableFooterView:", v11);
      }

    }
  }
  -[RUITableView _registerForNotifications:](self, "_registerForNotifications:", 1);
  v18 = objc_loadWeakRetained((id *)&self->_objectModel);
  objc_msgSend(v18, "tableViewOMDidChange:", self);

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __31__RUITableView_viewWillAppear___block_invoke;
  v20[3] = &unk_24C2973F0;
  v20[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v20);

}

uint64_t __31__RUITableView_viewWillAppear___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "beginUpdates");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "layoutIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "endUpdates");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  UITableView *tableView;
  void *v8;
  void *v9;
  _QWORD v10[5];

  -[RUITableView defaultFirstResponderRow](self, "defaultFirstResponderRow", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RUITableView defaultFirstResponderRow](self, "defaultFirstResponderRow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUITableView indexPathForRow:](self, "indexPathForRow:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_tableView, "selectRowAtIndexPath:animated:scrollPosition:", v6, 0, 0);
    -[RUITableView activateRowAtIndexPath:animated:](self, "activateRowAtIndexPath:animated:", v6, 0);
    -[RUITableView setDefaultFirstResponderRow:](self, "setDefaultFirstResponderRow:", 0);

  }
  tableView = self->_tableView;
  -[RUIElement attributes](self, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("editing"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setEditing:animated:](tableView, "setEditing:animated:", v9 != 0, 0);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __30__RUITableView_viewDidAppear___block_invoke;
  v10[3] = &unk_24C2973F0;
  v10[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v10);
  -[UITableView flashScrollIndicators](self->_tableView, "flashScrollIndicators");
}

uint64_t __30__RUITableView_viewDidAppear___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "beginUpdates");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "layoutIfNeeded");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "endUpdates");
}

- (void)viewWillDisappear:(BOOL)a3
{
  -[RUITableView _registerForNotifications:](self, "_registerForNotifications:", 0);
}

- (void)viewDidLayout
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[RUITableView tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  -[UITableView bounds](self->_tableView, "bounds");
  v8 = v7;
  if (self->_lastLayoutWidth != v8)
  {
    v9 = v6;
    if (v5 == 1)
      v10 = 20.0;
    else
      v10 = 60.0;
    -[UITableView contentInset](self->_tableView, "contentInset");
    v12 = v9 - v10 - v11;
    -[UITableView safeAreaInsets](self->_tableView, "safeAreaInsets");
    *(float *)&v13 = v12 - v13;
    self->_fullscreenCellHeight = *(float *)&v13;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[RUITableView sections](self, "sections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          objc_msgSend(v19, "rows");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v27 != v23)
                  objc_enumerationMutation(v20);
                objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "clearCachedHeight");
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v22);
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v16);
    }

    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __29__RUITableView_viewDidLayout__block_invoke;
    v25[3] = &unk_24C2973F0;
    v25[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v25);
    self->_lastLayoutWidth = v8;
  }
  -[RUITableView _updateSectionContentInsetForSettingsWithAnimation:](self, "_updateSectionContentInsetForSettingsWithAnimation:", 0);
}

void __29__RUITableView_viewDidLayout__block_invoke(uint64_t a1)
{
  double *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  float v19;
  id v20;
  CGRect v21;
  CGRect v22;

  v2 = (double *)MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v3 = *(double *)(MEMORY[0x24BDBF090] + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "tableHeaderView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "tableFooterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v7 = v4;
  if (v20)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "headerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_tableHeaderSizeForHeader:", v9);
    v7 = v10;
    v6 = v11;

  }
  v12 = *v2;
  v13 = v2[1];
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "frame");
    objc_msgSend(v5, "sizeThatFits:", v14, v15);
    v4 = v16;
    v3 = v17;
  }
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(float *)(v18 + 144) - (v6 + v3);
  *(float *)(v18 + 144) = v19;
  v21.origin.x = v12;
  v21.origin.y = v13;
  v21.size.width = v7;
  v21.size.height = v6;
  if (!CGRectIsEmpty(v21))
  {
    objc_msgSend(v20, "setFrame:", v12, v13, v7, v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "_tableHeaderHeightDidChangeToHeight:", v6);
  }
  v22.origin.x = v12;
  v22.origin.y = v13;
  v22.size.width = v4;
  v22.size.height = v3;
  if (!CGRectIsEmpty(v22))
  {
    objc_msgSend(v5, "setFrame:", v12, v13, v4, v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "_tableFooterHeightDidChangeToHeight:", v3);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "beginUpdates");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "endUpdates");

}

- (void)setSelectedRadioGroupRow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  void *v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("radioGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[RUITableView sections](self, "sections");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v19)
    {
      v18 = *(_QWORD *)v26;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(obj);
          v20 = v7;
          v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v7);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          objc_msgSend(v8, "rows");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v22;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v22 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
                objc_msgSend(v14, "attributes");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKey:", CFSTR("radioGroup"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v14 != v4 && objc_msgSend(v16, "isEqualToString:", v6))
                  objc_msgSend(v14, "setSelected:", 0);

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v11);
          }

          v7 = v20 + 1;
        }
        while (v20 + 1 != v19);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "setSelected:", 1);
  }

}

- (void)_showLeftBarButtonItemForLabel
{
  id WeakRetained;
  void *v4;
  RUIBarButtonItem *v5;
  RUIBarButtonItem *oldLeftBarButtonItemForLabel;
  void *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  objc_msgSend(WeakRetained, "displayedPages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[RUITableView _hideLeftBarButtonItemForLabel](self, "_hideLeftBarButtonItemForLabel");
  self->_showingLeftLabelNavBarButtons = 1;
  objc_msgSend(v9, "leftNavigationBarButtonItem");
  v5 = (RUIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  oldLeftBarButtonItemForLabel = self->_oldLeftBarButtonItemForLabel;
  self->_oldLeftBarButtonItemForLabel = v5;

  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_leftLabelDone_);
  objc_msgSend(v9, "setLeftNavigationBarButtonItem:barButtonItem:", v7, v8);

}

- (void)leftLabelDone:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  objc_msgSend(WeakRetained, "visiblePage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endEditing:", 0);

  -[RUITableView _hideLeftBarButtonItemForLabel](self, "_hideLeftBarButtonItemForLabel");
}

- (void)_hideLeftBarButtonItemForLabel
{
  id WeakRetained;
  void *v4;
  RUIBarButtonItem *oldLeftBarButtonItemForLabel;
  id v6;

  if (self->_showingLeftLabelNavBarButtons)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    objc_msgSend(WeakRetained, "displayedPages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setLeftNavigationBarButtonItem:", self->_oldLeftBarButtonItemForLabel);
    oldLeftBarButtonItemForLabel = self->_oldLeftBarButtonItemForLabel;
    self->_oldLeftBarButtonItemForLabel = 0;

    self->_showingLeftLabelNavBarButtons = 0;
  }
}

- (void)_showRightBarButtonItemForLabel
{
  id WeakRetained;
  void *v4;
  RUIBarButtonItem *v5;
  RUIBarButtonItem *oldRightBarButtonItemForLabel;
  void *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  objc_msgSend(WeakRetained, "displayedPages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[RUITableView _hideRightBarButtonItemForLabel](self, "_hideRightBarButtonItemForLabel");
  self->_showingRightLabelNavBarButtons = 1;
  objc_msgSend(v9, "rightNavigationBarButtonItem");
  v5 = (RUIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  oldRightBarButtonItemForLabel = self->_oldRightBarButtonItemForLabel;
  self->_oldRightBarButtonItemForLabel = v5;

  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_rightLabelDone_);
  objc_msgSend(v9, "setRightNavigationBarButtonItem:barButtonItem:", v7, v8);

}

- (void)rightLabelDone:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  objc_msgSend(WeakRetained, "visiblePage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endEditing:", 0);

  -[RUITableView _hideRightBarButtonItemForLabel](self, "_hideRightBarButtonItemForLabel");
}

- (void)_hideRightBarButtonItemForLabel
{
  id WeakRetained;
  void *v4;
  RUIBarButtonItem *oldRightBarButtonItemForLabel;
  id v6;

  if (self->_showingRightLabelNavBarButtons)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    objc_msgSend(WeakRetained, "displayedPages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setRightNavigationBarButtonItem:", self->_oldRightBarButtonItemForLabel);
    oldRightBarButtonItemForLabel = self->_oldRightBarButtonItemForLabel;
    self->_oldRightBarButtonItemForLabel = 0;

    self->_showingRightLabelNavBarButtons = 0;
  }
}

- (void)_datePickerRevert
{
  id v3;

  if (self->_oldPickerDate)
  {
    -[UIDatePicker setDate:](self->_datePicker, "setDate:");
    -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", self->_pickerRowIndexPath);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDate:", self->_oldPickerDate);

  }
}

- (void)datePickerCancel:(id)a3
{
  -[RUITableView _datePickerRevert](self, "_datePickerRevert", a3);
  -[RUITableView hidePickerViewAnimated:](self, "hidePickerViewAnimated:", (gAnimatedTransitions & 1) == 0);
}

- (void)datePickerDone:(id)a3
{
  id WeakRetained;
  id v5;

  -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", self->_pickerRowIndexPath);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  objc_msgSend(WeakRetained, "tableViewOM:elementDidChange:action:completion:", self, v5, 2, 0);

  -[RUITableView hidePickerViewAnimated:](self, "hidePickerViewAnimated:", (gAnimatedTransitions & 1) == 0);
}

- (void)_showDatePickerNavBarButtonsIfNeededForRow:(id)a3
{
  void *v4;
  void *v5;
  NSDate *v6;
  NSDate *oldPickerDate;
  id WeakRetained;
  void *v9;
  RUIBarButtonItem *v10;
  RUIBarButtonItem *oldLeftBarButtonItemForPicker;
  RUIBarButtonItem *v12;
  RUIBarButtonItem *oldRightBarButtonItemForPicker;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  objc_msgSend(a3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIDatePicker date](self->_datePicker, "date");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    oldPickerDate = self->_oldPickerDate;
    self->_oldPickerDate = v6;

    WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    objc_msgSend(WeakRetained, "displayedPages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    self->_showingPickerNavBarButtons = 1;
    objc_msgSend(v24, "leftNavigationBarButtonItem");
    v10 = (RUIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    oldLeftBarButtonItemForPicker = self->_oldLeftBarButtonItemForPicker;
    self->_oldLeftBarButtonItemForPicker = v10;

    objc_msgSend(v24, "rightNavigationBarButtonItem");
    v12 = (RUIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    oldRightBarButtonItemForPicker = self->_oldRightBarButtonItemForPicker;
    self->_oldRightBarButtonItemForPicker = v12;

    v14 = (void *)objc_opt_new();
    v15 = objc_alloc(MEMORY[0x24BEBD410]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24C29B280, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithTitle:style:target:action:", v17, 0, self, sel_datePickerCancel_);

    objc_msgSend(v24, "setLeftNavigationBarButtonItem:barButtonItem:", v14, v18);
    v19 = (void *)objc_opt_new();
    v20 = objc_alloc(MEMORY[0x24BEBD410]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_24C29B280, CFSTR("Localizable"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v20, "initWithTitle:style:target:action:", v22, 2, self, sel_datePickerDone_);

    objc_msgSend(v24, "setRightNavigationBarButtonItem:barButtonItem:", v19, v23);
  }
}

- (void)_hideDatePickerNavBarButtonsIfNeeded
{
  id WeakRetained;
  void *v4;
  RUIBarButtonItem *oldLeftBarButtonItemForPicker;
  RUIBarButtonItem *oldRightBarButtonItemForPicker;
  id v7;

  if (self->_showingPickerNavBarButtons)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    objc_msgSend(WeakRetained, "displayedPages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setLeftNavigationBarButtonItem:", self->_oldLeftBarButtonItemForPicker);
    objc_msgSend(v7, "setRightNavigationBarButtonItem:", self->_oldRightBarButtonItemForPicker);
    oldLeftBarButtonItemForPicker = self->_oldLeftBarButtonItemForPicker;
    self->_oldLeftBarButtonItemForPicker = 0;

    oldRightBarButtonItemForPicker = self->_oldRightBarButtonItemForPicker;
    self->_oldRightBarButtonItemForPicker = 0;

    self->_showingPickerNavBarButtons = 0;
  }
}

- (void)showPickerViewForRow:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  UIPickerView *selectPicker;
  UIDatePicker *datePicker;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  _UIBackdropView *v29;
  _UIBackdropView *pickerBackdrop;
  uint64_t v31;
  UIDatePicker *v32;
  _UIBackdropView *v33;
  _UIBackdropView *v34;
  UIPickerView *v35;
  UIPickerView *v36;
  NSIndexPath *v37;
  void *v38;
  void *v39;
  NSIndexPath *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  UIDatePicker *v44;
  UIDatePicker *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  NSIndexPath *v49;
  void *v50;
  void *v51;
  NSIndexPath *embeddedPickerRowIndexPath;
  uint64_t v53;
  void (**v54)(_QWORD);
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  int v65;
  int v66;
  _QWORD block[5];
  id v68;
  BOOL v69;
  _QWORD v70[4];
  void (**v71)(_QWORD);
  _QWORD v72[4];
  id v73;
  _QWORD v74[5];
  UIDatePicker *v75;
  id v76;
  double v77;
  double v78;
  double v79;
  double v80;
  _QWORD aBlock[5];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  NSIndexPath *v86;
  _BYTE v87[128];
  uint64_t v88;

  v4 = a4;
  v88 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[RUITableView _datePickerRevert](self, "_datePickerRevert");
  -[RUITableView _hideDatePickerNavBarButtonsIfNeeded](self, "_hideDatePickerNavBarButtonsIfNeeded");
  -[RUITableView _selectPickerFrame](self, "_selectPickerFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "attributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("class"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "attributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("inline"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (self->_embeddedPickerRowIndexPath)
    -[RUITableView hidePickerViewAnimated:](self, "hidePickerViewAnimated:", v4);
  -[RUITableView indexPathForRow:](self, "indexPathForRow:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_pickerRowIndexPath, v20);
  -[UITableView firstResponder](self->_tableView, "firstResponder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resignFirstResponder");

  if (v4)
    UIKeyboardOrderOutAutomatic();
  else
    UIKeyboardOrderOutAutomaticSkippingAnimation();
  if (!objc_msgSend(v16, "isEqualToString:", CFSTR("select")))
  {
    if (!objc_msgSend(v16, "isEqualToString:", CFSTR("datePicker")))
    {
      v32 = 0;
      goto LABEL_53;
    }
    v64 = v4;
    v65 = v19;
    self->_showDatePicker = 1;
    datePicker = self->_datePicker;
    v62 = v16;
    if (datePicker)
    {
      -[UIDatePicker allTargets](datePicker, "allTargets");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v83;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v83 != v27)
              objc_enumerationMutation(v24);
            -[UIDatePicker removeTarget:action:forControlEvents:](self->_datePicker, "removeTarget:action:forControlEvents:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i), 0, 0xFFFFFFFFLL);
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
        }
        while (v26);
      }
      -[UIDatePicker removeFromSuperview](self->_datePicker, "removeFromSuperview");

    }
    if (!self->_pickerBackdrop)
    {
      v29 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithFrame:style:", 2020, v8, v10, v12, v14);
      pickerBackdrop = self->_pickerBackdrop;
      self->_pickerBackdrop = v29;

    }
    objc_msgSend(v6, "dateFormatterCalendarIdentifier");
    v31 = objc_claimAutoreleasedReturnValue();
    v61 = (void *)v31;
    if (v31)
      objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", v31);
    else
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTimeZone:", v43);

    v44 = (UIDatePicker *)objc_msgSend(v6, "newConfiguredDatePicker");
    v45 = self->_datePicker;
    self->_datePicker = v44;

    -[UIDatePicker setFrame:](self->_datePicker, "setFrame:", v8, v10, v12, v14);
    v32 = self->_datePicker;
    v46 = objc_msgSend(v6, "datePickerMode");
    v47 = 1;
    if ((unint64_t)(v46 - 3) >= 2 && (unint64_t)(v46 - 4270) >= 2)
    {
      if (-[UIDatePicker datePickerStyle](self->_datePicker, "datePickerStyle", 1) != UIDatePickerStyleCompact)
      {
LABEL_38:
        -[UIDatePicker setDatePickerMode:](self->_datePicker, "setDatePickerMode:", objc_msgSend(v6, "datePickerMode"));
        if (-[UIDatePicker datePickerStyle](self->_datePicker, "datePickerStyle") == UIDatePickerStyleInline)
          v48 = 1;
        else
          v48 = v65;
        v66 = v48;
        if (v48 == 1)
        {
          -[UIDatePicker removeFromSuperview](self->_datePicker, "removeFromSuperview");
          -[_UIBackdropView removeFromSuperview](self->_pickerBackdrop, "removeFromSuperview");
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v20, "row") + 1, objc_msgSend(v20, "section"));
          v49 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[UITableView superview](self->_tableView, "superview");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addSubview:", self->_pickerBackdrop);

          -[UITableView superview](self->_tableView, "superview");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addSubview:", self->_datePicker);

          v49 = 0;
        }
        embeddedPickerRowIndexPath = self->_embeddedPickerRowIndexPath;
        self->_embeddedPickerRowIndexPath = v49;

        -[RUITableView _showDatePickerNavBarButtonsIfNeededForRow:](self, "_showDatePickerNavBarButtonsIfNeededForRow:", v6);
        v16 = v62;
        if (!v32)
          goto LABEL_53;
LABEL_45:
        v63 = v16;
        v53 = MEMORY[0x24BDAC760];
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __46__RUITableView_showPickerViewForRow_animated___block_invoke;
        aBlock[3] = &unk_24C2973F0;
        aBlock[4] = self;
        v54 = (void (**)(_QWORD))_Block_copy(aBlock);
        -[RUITableView tableView](self, "tableView");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = v53;
        v74[1] = 3221225472;
        v74[2] = __46__RUITableView_showPickerViewForRow_animated___block_invoke_2;
        v74[3] = &unk_24C2982F8;
        v74[4] = self;
        v77 = v8;
        v78 = v10;
        v79 = v12;
        v80 = v14;
        v32 = v32;
        v75 = v32;
        v56 = v55;
        v76 = v56;
        v57 = _Block_copy(v74);
        v58 = v57;
        if (v66)
        {
          v86 = self->_embeddedPickerRowIndexPath;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v86, 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "insertRowsAtIndexPaths:withRowAnimation:", v59, 100);

        }
        else
        {
          if (v64 && (!self->_datePicker || !self->_selectPicker))
          {
            -[UIDatePicker setFrame:](v32, "setFrame:", v8, v10 + v14, v12, v14);
            v60 = (void *)MEMORY[0x24BEBDB00];
            v72[0] = v53;
            v72[1] = 3221225472;
            v72[2] = __46__RUITableView_showPickerViewForRow_animated___block_invoke_3;
            v72[3] = &unk_24C297640;
            v73 = v58;
            v70[0] = v53;
            v70[1] = 3221225472;
            v70[2] = __46__RUITableView_showPickerViewForRow_animated___block_invoke_4;
            v70[3] = &unk_24C297CC0;
            v71 = v54;
            objc_msgSend(v60, "animateWithDuration:animations:completion:", v72, v70, 0.3);

            goto LABEL_52;
          }
          (*((void (**)(void *))v57 + 2))(v57);
        }
        v54[2](v54);
LABEL_52:
        block[0] = v53;
        block[1] = 3221225472;
        block[2] = __46__RUITableView_showPickerViewForRow_animated___block_invoke_5;
        block[3] = &unk_24C297F40;
        block[4] = self;
        v68 = v20;
        v69 = v64;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

        v16 = v63;
        goto LABEL_53;
      }
      v47 = 3;
    }
    -[UIDatePicker setPreferredDatePickerStyle:](self->_datePicker, "setPreferredDatePickerStyle:", v47);
    goto LABEL_38;
  }
  v64 = v4;
  self->_showSelectPicker = 1;
  selectPicker = self->_selectPicker;
  if (selectPicker)
  {
    -[UIPickerView setDelegate:](selectPicker, "setDelegate:", v6);
    -[UIPickerView reloadAllComponents](self->_selectPicker, "reloadAllComponents");
  }
  else
  {
    if (!self->_pickerBackdrop)
    {
      v33 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithFrame:style:", 2020, v8, v10, v12, v14);
      v34 = self->_pickerBackdrop;
      self->_pickerBackdrop = v33;

    }
    v35 = (UIPickerView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD800]), "initWithFrame:", v8, v10, v12, v14);
    v36 = self->_selectPicker;
    self->_selectPicker = v35;

    -[UIPickerView setAutoresizingMask:](self->_selectPicker, "setAutoresizingMask:", 10);
    -[UIPickerView setDelegate:](self->_selectPicker, "setDelegate:", v6);
    -[UIPickerView setShowsSelectionIndicator:](self->_selectPicker, "setShowsSelectionIndicator:", 1);
  }
  v32 = self->_selectPicker;
  v66 = v19;
  if (v19)
  {
    -[_UIBackdropView removeFromSuperview](self->_pickerBackdrop, "removeFromSuperview");
    v37 = (NSIndexPath *)objc_msgSend(v20, "copy");
  }
  else
  {
    -[UITableView superview](self->_tableView, "superview");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", self->_pickerBackdrop);

    -[UITableView superview](self->_tableView, "superview");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addSubview:", self->_selectPicker);

    v37 = 0;
  }
  v40 = self->_embeddedPickerRowIndexPath;
  self->_embeddedPickerRowIndexPath = v37;

  v41 = objc_msgSend(v6, "selectedRow");
  if (v41 == -1)
  {
    objc_msgSend(v6, "pickerView:didSelectRow:inComponent:", self->_selectPicker, 0, 0);
    v41 = 0;
  }
  -[UIPickerView selectRow:inColumn:animated:](self->_selectPicker, "selectRow:inColumn:animated:", v41, 0, 0);
  if (v32)
    goto LABEL_45;
LABEL_53:

}

void __46__RUITableView_showPickerViewForRow_animated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 88;
  v4 = *(void **)(v2 + 88);
  if (v4 && !*(_BYTE *)(v2 + 96) && *(_BYTE *)(v2 + 80)
    || (v3 = 320, (v4 = *(void **)(v2 + 320)) != 0) && !*(_BYTE *)(v2 + 80) && *(_BYTE *)(v2 + 96))
  {
    objc_msgSend(v4, "removeFromSuperview");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + v3);
    *(_QWORD *)(v5 + v3) = 0;

  }
}

void __46__RUITableView_showPickerViewForRow_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setAutoresizingMask:", 10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;

  objc_msgSend(*(id *)(a1 + 48), "setContentInset:", v4, v6, *(double *)(a1 + 80), v8);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "visiblePage", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessoryViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "tableViewDidUpdateContentInset:", *(_QWORD *)(a1 + 48));
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

uint64_t __46__RUITableView_showPickerViewForRow_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__RUITableView_showPickerViewForRow_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__RUITableView_showPickerViewForRow_animated___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "scrollToRowAtIndexPath:atScrollPosition:animated:", *(_QWORD *)(a1 + 40), 2, *(unsigned __int8 *)(a1 + 48));
}

- (void)hidePickerViewAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *datePicker;
  id v14;
  UITableView *tableView;
  void *v16;
  NSIndexPath *embeddedPickerRowIndexPath;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id WeakRetained;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  NSIndexPath *pickerRowIndexPath;
  void (**v39)(_QWORD);
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _QWORD aBlock[5];
  _BYTE v54[128];
  _QWORD v55[3];

  v3 = a3;
  v55[1] = *MEMORY[0x24BDAC8D0];
  -[RUITableView _selectPickerFrame](self, "_selectPickerFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  self->_showSelectPicker = 0;
  self->_showDatePicker = 0;
  datePicker = self->_datePicker;
  if (!datePicker)
    datePicker = self->_selectPicker;
  v14 = datePicker;
  if (self->_embeddedPickerRowIndexPath)
  {
    -[UITableView beginUpdates](self->_tableView, "beginUpdates");
    tableView = self->_tableView;
    v55[0] = self->_embeddedPickerRowIndexPath;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v16, 100);

    embeddedPickerRowIndexPath = self->_embeddedPickerRowIndexPath;
    self->_embeddedPickerRowIndexPath = 0;

    -[UITableView endUpdates](self->_tableView, "endUpdates");
  }
  else
  {
    v18 = MEMORY[0x24BDAC760];
    v19 = v8 + v12;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__RUITableView_hidePickerViewAnimated___block_invoke;
    aBlock[3] = &unk_24C2973F0;
    aBlock[4] = self;
    v20 = _Block_copy(aBlock);
    -[RUITableView tableView](self, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v22 = (void *)MEMORY[0x24BEBDB00];
      v46[0] = v18;
      v46[1] = 3221225472;
      v46[2] = __39__RUITableView_hidePickerViewAnimated___block_invoke_2;
      v46[3] = &unk_24C2982F8;
      v46[4] = self;
      v49 = v6;
      v50 = v19;
      v51 = v10;
      v52 = v12;
      v47 = v14;
      v48 = v21;
      v44[0] = v18;
      v44[1] = 3221225472;
      v44[2] = __39__RUITableView_hidePickerViewAnimated___block_invoke_3;
      v44[3] = &unk_24C297CC0;
      v45 = v20;
      objc_msgSend(v22, "animateWithDuration:animations:completion:", v46, v44, 0.3);

    }
    else
    {
      v39 = (void (**)(_QWORD))v20;
      -[_UIBackdropView setFrame:](self->_pickerBackdrop, "setFrame:", v6, v19, v10, v12);
      objc_msgSend(v14, "setFrame:", v6, v19, v10, v12);
      -[RUITableView tableView](self, "tableView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contentInset");
      v25 = v24;
      v27 = v26;
      v29 = v28;

      objc_msgSend(v21, "setContentInset:", v25, v27, 0.0, v29);
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
      objc_msgSend(WeakRetained, "visiblePage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "accessoryViews");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v41 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v37, "tableViewDidUpdateContentInset:", v21);
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
        }
        while (v34);
      }

      v20 = v39;
      v39[2](v39);
      v3 = 0;
    }

  }
  -[RUITableView _hideDatePickerNavBarButtonsIfNeeded](self, "_hideDatePickerNavBarButtonsIfNeeded");
  -[UITableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", self->_pickerRowIndexPath, v3);
  pickerRowIndexPath = self->_pickerRowIndexPath;
  self->_pickerRowIndexPath = 0;

}

uint64_t __39__RUITableView_hidePickerViewAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 88;
  v4 = *(void **)(v2 + 88);
  if (v4 || (v3 = 320, (v4 = *(void **)(v2 + 320)) != 0))
  {
    objc_msgSend(v4, "removeFromSuperview");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + v3);
    *(_QWORD *)(v5 + v3) = 0;

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeFromSuperview");
}

void __39__RUITableView_hidePickerViewAnimated___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 48), "contentInset");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentInset:", v3, v5, 0.0, v7);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 256));
  objc_msgSend(WeakRetained, "visiblePage", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessoryViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "tableViewDidUpdateContentInset:", *(_QWORD *)(a1 + 48));
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

uint64_t __39__RUITableView_hidePickerViewAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[RUITableView sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  NSIndexPath *embeddedPickerRowIndexPath;

  -[RUITableView sections](self, "sections", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "configured") & 1) == 0)
  {
    -[RUITableView objectModel](self, "objectModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configureSection:", v7);

    objc_msgSend(v7, "setConfigured:", 1);
  }
  objc_msgSend(v7, "rows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  embeddedPickerRowIndexPath = self->_embeddedPickerRowIndexPath;
  if (embeddedPickerRowIndexPath && -[NSIndexPath section](embeddedPickerRowIndexPath, "section") == a4)
    ++v10;

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *datePicker;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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
  id v35;
  id v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", self->_embeddedPickerRowIndexPath))
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("embeddedPickerCell"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configureAccessiblityWithTarget:", v9);
    if (!v9)
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("embeddedPickerCell"));
    v34 = v8;
    v35 = v7;
    v36 = v6;
    datePicker = self->_datePicker;
    if (!datePicker)
      datePicker = self->_selectPicker;
    v11 = datePicker;
    objc_msgSend(v9, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v11);

    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v26 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v11, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v30;
    objc_msgSend(v11, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v25;
    objc_msgSend(v11, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v14, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v15;
    objc_msgSend(v11, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v20);

    v7 = v35;
    v6 = v36;
    v8 = v34;
  }
  else
  {
    if ((objc_msgSend(v8, "configured") & 1) == 0)
    {
      -[RUITableView objectModel](self, "objectModel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "configureRow:", v8);

    }
    objc_msgSend(v8, "tableCell");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configureAccessiblityWithTarget:", v9);
    if (-[RUITableView tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, objc_msgSend(v7, "section")) == 1)objc_msgSend(v9, "setTextFieldOffset:", 0.0);
  }
  v22 = v9;

  return v22;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableCell");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v17)
    {
      objc_msgSend(v8, "attributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("labelBold"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      if (!v12)
      {
LABEL_6:

        goto LABEL_7;
      }
      objc_msgSend(v17, "ruiTextLabel");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BEBB520];
      objc_msgSend(v17, "ruiTextLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "font");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pointSize");
      objc_msgSend(v13, "boldSystemFontOfSize:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFont:", v16);

    }
    goto LABEL_6;
  }
LABEL_7:

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[RUITableView sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "hasCustomHeader") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "header");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (int64_t)tableView:(id)a3 titleAlignmentForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  int64_t v10;

  -[RUITableView sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "header");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "header");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "labelAlignment");

  }
  else
  {
    v10 = 4;
  }

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[RUITableView sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "hasCustomFooter") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "footer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "body");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  int64_t v10;

  -[RUITableView sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "footer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "footer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "labelAlignment");

  }
  else
  {
    v10 = 4;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  -[RUITableView sections](self, "sections", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "header");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "header");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadElementIfNeeded");
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "intrinsicContentSize");
    v13 = v12;

LABEL_3:
    goto LABEL_4;
  }
  if (objc_msgSend(v7, "hasCustomHeader"))
  {
    objc_msgSend(v7, "headerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "_wantsAutolayout");

    if (v16)
    {
      v13 = *MEMORY[0x24BEBE770];
      goto LABEL_4;
    }
    -[RUITableView view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "readableContentGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layoutFrame");
    v24 = v23;
    v26 = v25;

    objc_msgSend(v7, "headerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sizeThatFits:", v24, v26);
    v13 = v27;
    goto LABEL_3;
  }
  -[RUIElement style](self, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sectionSpacing");
  v19 = v18;

  if (a4 >= 1 && v19 != 0.0)
  {
    -[RUIElement style](self, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionSpacing");
    v13 = v20;
    goto LABEL_3;
  }
  objc_msgSend(v7, "headerHeight");
  if (a4 || (v13 = 31.0, v28 != -1.0))
  {
    objc_msgSend(v7, "headerHeight");
    v13 = v29;
  }
LABEL_4:

  return v13;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id location;
  _QWORD v24[4];
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  -[RUITableView sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "header");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "header");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", 0);

    objc_msgSend(v11, "loadElementIfNeeded");
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3010000000;
    v25 = 0;
    v26 = 0;
    v24[3] = &unk_209F8F105;
    objc_msgSend(v11, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "intrinsicContentSize");
    v25 = v14;
    v26 = v15;

    objc_initWeak(&location, v6);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __49__RUITableView_tableView_viewForHeaderInSection___block_invoke;
    v21[3] = &unk_24C298320;
    objc_copyWeak(&v22, &location);
    v21[4] = v24;
    objc_msgSend(v11, "setDidLayoutSubviewsHandler:", v21);
    objc_msgSend(v11, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    _Block_object_dispose(v24, 8);

  }
  else if (objc_msgSend(v8, "hasCustomHeader"))
  {
    objc_msgSend(v8, "containerizedHeaderView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "headerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      objc_msgSend(v16, "headerView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSectionIsFirst:", a4 == 0);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v16, "setTableView:", v6);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __49__RUITableView_tableView_viewForHeaderInSection___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "intrinsicContentSize");
  v7 = v6;
  v9 = v8;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(double *)(v10 + 32) != v7 || *(double *)(v10 + 40) != v9)
  {
    *(double *)(v10 + 32) = v7;
    *(double *)(v10 + 40) = v9;
    objc_msgSend(WeakRetained, "beginUpdates");
    objc_msgSend(WeakRetained, "endUpdates");
  }

}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  v6 = a3;
  -[RUITableView sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "header");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v8, "rows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(v8, "footer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v15 = 0.0;
    goto LABEL_11;
  }
LABEL_5:
  if (objc_msgSend(v8, "hasCustomFooter")
    && (objc_msgSend(v6, "readableContentGuide"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "layoutFrame"),
        v13 = v12,
        v11,
        v13 > 0.0))
  {
    v15 = *MEMORY[0x24BEBE770];
  }
  else
  {
    objc_msgSend(v8, "footerHeight");
    v15 = v14;
  }
LABEL_11:

  return v15;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[RUITableView sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "hasCustomFooter"))
  {
    objc_msgSend(v8, "containerizedFooterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v9, "setTableView:", v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CGRect)_selectPickerFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[UITableView superview](self->_tableView, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v6 + -216.0;
  v8 = 216.0;
  v9 = 0.0;
  v10 = v4;
  result.size.height = v8;
  result.size.width = v10;
  result.origin.y = v7;
  result.origin.x = v9;
  return result;
}

- (BOOL)isShowingPicker
{
  return self->_showDatePicker || self->_showSelectPicker;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "beginUpdates");
  -[RUITableView activateRowAtIndexPath:animated:](self, "activateRowAtIndexPath:animated:", v6, (gAnimatedTransitions & 1) == 0);
  -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "didBecomeSelected");
  objc_msgSend(v7, "endUpdates");

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = a3;
  objc_msgSend(v6, "beginUpdates");
  -[RUITableView tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsMultipleSelectionDuringEditing");
  -[RUITableView tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEditing");

  if (v8 && v10)
  {
    -[RUITableView objectModel](self, "objectModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableViewOMDidChange:", self);

  }
  -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "didBecomeDeselected");
  objc_msgSend(v6, "endUpdates");

}

- (void)activateRowAtIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  UITableView *tableView;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v4 = a4;
  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[UITableView beginUpdates](self->_tableView, "beginUpdates");
  -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("class"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "enabled"))
    goto LABEL_36;
  self->_showSelectPicker = 0;
  -[RUITableView sections](self, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v6, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", CFSTR("select")))
  {
    if ((-[NSIndexPath isEqual:](self->_pickerRowIndexPath, "isEqual:", v6) & 1) == 0)
      goto LABEL_16;
  }
  else
  {
    if (!objc_msgSend(v9, "isEqualToString:", CFSTR("datePicker")))
    {
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("editableText")) & 1) != 0
        || objc_msgSend(v9, "isEqualToString:", CFSTR("numberPicker")))
      {
        objc_msgSend(v7, "tableCell");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "editableTextField");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isFirstResponder");

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v7, "tableCell");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "editableTextField");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "becomeFirstResponder");

        }
        if (UIKeyboardAutomaticIsOnScreen())
          -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](self->_tableView, "scrollToRowAtIndexPath:atScrollPosition:animated:", v6, 2, v4);
      }
      else
      {
        objc_msgSend(v11, "showAllRow");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7 == v29)
        {
          objc_msgSend(v11, "tappedShowAllRowWithTable:", self->_tableView);
        }
        else
        {
          -[UITableView firstResponder](self->_tableView, "firstResponder");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "resignFirstResponder");

        }
      }
      goto LABEL_17;
    }
    if (objc_msgSend(v7, "datePickerStyle") == 2)
    {
      objc_msgSend(v7, "activateDatePicker");
      -[UITableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", v6, v4);
    }
    else
    {
      if (!-[RUITableView isShowingPicker](self, "isShowingPicker"))
      {
LABEL_16:
        -[RUITableView showPickerViewForRow:animated:](self, "showPickerViewForRow:animated:", v7, v4);
        goto LABEL_17;
      }
      -[RUITableView hidePickerViewAnimated:](self, "hidePickerViewAnimated:", 1);
    }
  }
LABEL_17:
  v47 = v11;
  if (self->_datePicker && !self->_showDatePicker || self->_selectPicker && !self->_showSelectPicker)
    -[RUITableView hidePickerViewAnimated:](self, "hidePickerViewAnimated:", v4);
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("selectPage")))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    objc_msgSend(v7, "linkedPage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_displaySupplementalPage:", v18);

    -[UITableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", v6, (gAnimatedTransitions & 1) == 0);
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("button")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("htmlButton")))
  {
    -[UITableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", v6, (gAnimatedTransitions & 1) == 0);
    v19 = objc_loadWeakRetained((id *)&self->_objectModel);
    objc_msgSend(v19, "tableViewOM:elementDidChange:action:completion:", self, v7, 2, 0);

  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("link")) & 1) != 0
         || objc_msgSend(v9, "isEqualToString:", CFSTR("htmlLink")))
  {
    -[UITableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", v6, (gAnimatedTransitions & 1) == 0);
    -[RUITableView rowDidChange:action:](self, "rowDidChange:action:", v7, 2);
  }
  else
  {
    objc_msgSend(v7, "attributes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKey:", CFSTR("radioGroup"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v32, "length"))
    {
      -[RUITableView setSelectedRadioGroupRow:](self, "setSelectedRadioGroupRow:", v7);
      -[UITableView deselectRowAtIndexPath:animated:](self->_tableView, "deselectRowAtIndexPath:animated:", v6, (gAnimatedTransitions & 1) == 0);
      -[RUITableView rowDidChange:action:](self, "rowDidChange:action:", v7, 2);
      -[RUITableView objectModel](self, "objectModel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "visiblePage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "parentPage");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v44 = v32;
        v45 = v33;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        -[RUITableView sections](self, "sections");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v49 != v38)
                objc_enumerationMutation(obj);
              v40 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(v40, "rows");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v41, "containsObject:", v7) & 1) != 0)
              {
                objc_msgSend(v40, "attributes");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "objectForKey:", CFSTR("autoGoBack"));
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                if (v43)
                {
                  objc_msgSend(v45, "back:", self);
                  goto LABEL_54;
                }
              }
              else
              {

              }
            }
            v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
          }
          while (v37);
        }
LABEL_54:

        v11 = v47;
        v32 = v44;
        v33 = v45;
      }

    }
  }
  objc_msgSend(v7, "attributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("alternateDetailLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v7, "setShowAlternateDetailLabel:", objc_msgSend(v7, "showAlternateDetailLabel") ^ 1);
    tableView = self->_tableView;
    v52 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView reloadRowsAtIndexPaths:withRowAnimation:](tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v23, 5);

  }
  -[RUITableView tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "allowsMultipleSelectionDuringEditing");
  -[RUITableView tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEditing");

  if (v25 && v27)
  {
    -[RUITableView objectModel](self, "objectModel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "tableViewOMDidChange:", self);

  }
  -[UITableView endUpdates](self->_tableView, "endUpdates");

LABEL_36:
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *datePicker;
  double v9;
  double v10;
  void *v11;
  double v12;
  float v13;
  float v14;
  float v15;

  v6 = a3;
  v7 = a4;
  if (-[NSIndexPath isEqual:](self->_embeddedPickerRowIndexPath, "isEqual:", v7))
  {
    datePicker = self->_datePicker;
    if (!datePicker)
      datePicker = self->_selectPicker;
    objc_msgSend(datePicker, "frame");
    v10 = v9;
  }
  else
  {
    -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v12 = self->_fullscreenCellHeight + self->_fullscreenCellHeight;
    objc_msgSend(v11, "rowHeightWithMax:peggedHeight:tableView:indexPath:", v6, v7, v12);
    v14 = v13;

    v15 = *MEMORY[0x24BEBE770];
    if (v14 != -1.0)
      v15 = v14;
    v10 = v15;
  }

  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  void *v4;
  char isKindOfClass;

  -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  void *v4;
  char v5;

  -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditingEnabled");

  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;

  v6 = a3;
  v7 = a4;
  -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    objc_msgSend(v8, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("deletionFunction"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = 0;
      goto LABEL_5;
    }
  }
  v12 = 1;
LABEL_5:

  return v12;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;

  v6 = a4;
  v7 = a3;
  -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RUITableView tableView:editingStyleForRowAtIndexPath:](self, "tableView:editingStyleForRowAtIndexPath:", v7, v6);

  if (v9 != 1)
    LOBYTE(v9) = objc_msgSend(v8, "indentWhileEditing");

  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id WeakRetained;
  int v8;
  void *v9;
  void *v10;
  UITableView *tableView;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a5;
  if (a4 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
    v8 = objc_msgSend(WeakRetained, "tableViewOM:deleteRowAtIndexPath:", self, v14);

    if (v8)
    {
      -[RUITableView sections](self, "sections");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v14, "section"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "removeRowAtIndex:", objc_msgSend(v14, "row"));
      tableView = self->_tableView;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (gAnimatedTransitions)
        v13 = 5;
      else
        v13 = 100;
      -[UITableView deleteRowsAtIndexPaths:withRowAnimation:](tableView, "deleteRowsAtIndexPaths:withRowAnimation:", v12, v13);

    }
  }

}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;

  v6 = a3;
  -[RUITableView sections](self, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "hasValueForDrawsTopSeparator") & 1) != 0)
    v9 = objc_msgSend(v8, "drawTopSeparator");
  else
    v9 = objc_msgSend(v6, "_drawsSeparatorAtTopOfSections");
  v10 = v9;

  return v10;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  -[RUITableView sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "rows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "detailButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v9, "detailButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUITableView performAction:forElement:completion:](self, "performAction:forElement:completion:", 2, v11, 0);

  }
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  void *v4;
  char v5;

  -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCopyable");

  return v5;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", a4, a5.x, a5.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isCopyable"))
  {
    v6 = (void *)MEMORY[0x24BEBD4F8];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __74__RUITableView_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
    v9[3] = &unk_24C298370;
    v10 = v5;
    objc_msgSend(v6, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __74__RUITableView_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BEBD388];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("COPY"), &stru_24C29B280, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("doc.on.doc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __74__RUITableView_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v18 = &unk_24C298348;
  v19 = *(id *)(a1 + 32);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v4, v5, 0, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "attributes", v15, v16, v17, v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("contextMenuTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD748];
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("contextMenuTitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "menuWithTitle:children:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "menuWithChildren:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void __74__RUITableView_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyText");
  objc_msgSend(v3, "setString:", v2);

}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  void *v7;
  void *v8;
  BOOL v9;

  -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = sel_copy_ == a4 && (objc_msgSend(v7, "isCopyable") & 1) != 0;

  return v9;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;

  if (sel_copy_ == a4)
  {
    -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", a5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v9, "copyText");
    objc_msgSend(v7, "setString:", v8);

  }
  else
  {
    _RUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[RUITableView tableView:performAction:forRowAtIndexPath:withSender:].cold.1(v6);

  }
}

- (id)indexPathForPreferredFocusedViewInTableView:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "numberOfSections") < 1 || objc_msgSend(v3, "numberOfRowsInSection:", 0) < 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;

  if (!-[RUITableView isShowingPicker](self, "isShowingPicker", a3))
  {
    -[UITableView firstResponder](self->_tableView, "firstResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resignFirstResponder");

    -[RUITableView _hideRightBarButtonItemForLabel](self, "_hideRightBarButtonItemForLabel");
  }
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(v12, "previouslyFocusedIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v12, "previouslyFocusedIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setFocused:", 0);
  }
  objc_msgSend(v12, "nextFocusedIndexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v12, "nextFocusedIndexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setFocused:", 1);
  }

}

- (void)performAction:(int)a3 forElement:(id)a4 completion:(id)a5
{
  RUIObjectModel **p_objectModel;
  id v7;
  id v8;
  id WeakRetained;

  p_objectModel = &self->_objectModel;
  v7 = a5;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_objectModel);
  objc_msgSend(WeakRetained, "activateElement:completion:", v8, v7);

}

- (void)textFieldStartedEditing:(id)a3
{
  id v4;
  char isKindOfClass;
  BOOL v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  id v24;

  v4 = a3;
  -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_tableView, "selectRowAtIndexPath:animated:scrollPosition:", 0, (gAnimatedTransitions & 1) == 0, 0);
  if (self->_showingRightLabelNavBarButtons)
    -[RUITableView _hideRightBarButtonItemForLabel](self, "_hideRightBarButtonItemForLabel");
  if (self->_showingLeftLabelNavBarButtons)
    -[RUITableView _hideLeftBarButtonItemForLabel](self, "_hideLeftBarButtonItemForLabel");
  v24 = v4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v24 == 0;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v24;
    if (!v24)
      goto LABEL_20;
    goto LABEL_13;
  }
  v7 = v24;
  if (v24)
  {
    v7 = v24;
    do
    {
      v8 = v7;
      objc_msgSend(v7, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v9 = objc_opt_isKindOfClass();
      v6 = v7 == 0;
    }
    while ((v9 & 1) == 0 && v7);
  }
  if (!v6)
  {
LABEL_13:
    -[UITableView indexPathForCell:](self->_tableView, "indexPathForCell:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "attributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("class"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("editableText")) & 1) != 0)
      {
        objc_msgSend(v12, "attributes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("changeNavButtonBarOnEdit"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("true"));

        if (v17)
        {
          objc_msgSend(v12, "attributes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("navButtonBarPosition"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("right"));

          if (v20)
          {
            -[RUITableView _showRightBarButtonItemForLabel](self, "_showRightBarButtonItemForLabel");
          }
          else
          {
            objc_msgSend(v12, "attributes");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("navButtonBarPosition"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("left"));

            if (v23)
              -[RUITableView _showLeftBarButtonItemForLabel](self, "_showLeftBarButtonItemForLabel");
          }
        }
      }
      else
      {

      }
      -[RUITableView activateRowAtIndexPath:animated:](self, "activateRowAtIndexPath:animated:", v11, (gAnimatedTransitions & 1) == 0);

    }
  }
LABEL_20:

}

- (void)_textChanged:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  objc_msgSend(WeakRetained, "tableViewOMDidChange:", self);

}

- (BOOL)webViewOM:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  RUIObjectModel **p_objectModel;
  id v8;
  id v9;
  id WeakRetained;

  p_objectModel = &self->_objectModel;
  v8 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_objectModel);
  LOBYTE(a5) = objc_msgSend(WeakRetained, "webViewOM:shouldStartLoadWithRequest:navigationType:", v9, v8, a5);

  return a5;
}

- (id)sourceURL
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  objc_msgSend(WeakRetained, "sourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_enumerateRowsUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  char v16;

  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  v5 = 0;
  v6 = 0;
  v16 = 0;
  do
  {
    -[RUITableView sections](self, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v5 >= v8)
      break;
    -[RUITableView sections](self, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "rows");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v6 < v12)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v6, v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v14, v13, &v16);

    }
    v15 = v6 + 1 >= v12;
    if (v6 + 1 < v12)
      ++v6;
    else
      v6 = 0;
    if (v15)
      ++v5;

  }
  while (!v16);

}

- (void)rowDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id WeakRetained;
  uint64_t v22;
  _QWORD v23[7];
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v4 = a3;
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("nextKeyField"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("false"));

  if ((v8 & 1) == 0)
  {
    if (v6)
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__3;
      v31 = __Block_byref_object_dispose__3;
      v32 = 0;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __33__RUITableView_rowDidEndEditing___block_invoke;
      v24[3] = &unk_24C298398;
      v25 = v6;
      v26 = &v27;
      -[RUITableView _enumerateRowsUsingBlock:](self, "_enumerateRowsUsingBlock:", v24);
      if (v28[5])
        -[RUITableView _becomeFirstResponderAtIndexPath:](self, "_becomeFirstResponderAtIndexPath:");

      _Block_object_dispose(&v27, 8);
    }
    else
    {
      -[RUITableView indexPathForRow:](self, "indexPathForRow:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "section");
      v22 = objc_msgSend(v9, "row");
      -[RUITableView sections](self, "sections");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      while (--v12 >= 0)
      {
        -[RUITableView sections](self, "sections");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "rows");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v16)
        {
          if (v10 == v12)
          {
            -[RUITableView sections](self, "sections");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectAtIndexedSubscript:", v10);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "rows");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "count") - 1;

            if (v22 == v20)
            {
              WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
              objc_msgSend(WeakRetained, "tableViewOMSubmitForm:", self);

              -[RUITableView _hideRightBarButtonItemForLabel](self, "_hideRightBarButtonItemForLabel");
              goto LABEL_13;
            }
          }
          break;
        }
      }
      -[RUITableView _hideRightBarButtonItemForLabel](self, "_hideRightBarButtonItemForLabel");
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __33__RUITableView_rowDidEndEditing___block_invoke_2;
      v23[3] = &unk_24C2983C0;
      v23[5] = v10;
      v23[6] = v22;
      v23[4] = self;
      -[RUITableView _enumerateRowsUsingBlock:](self, "_enumerateRowsUsingBlock:", v23);
LABEL_13:

    }
  }

}

void __33__RUITableView_rowDidEndEditing___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  objc_msgSend(a2, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

void __33__RUITableView_rowDidEndEditing___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "section") > *(_QWORD *)(a1 + 40)
    || objc_msgSend(v6, "section") == *(_QWORD *)(a1 + 40) && objc_msgSend(v6, "row") > *(_QWORD *)(a1 + 48))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_becomeFirstResponderAtIndexPath:", v6))
      *a4 = 1;
  }

}

- (BOOL)_becomeFirstResponderAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[RUITableView objectModelRowForIndexPath:](self, "objectModelRowForIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableCell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editableTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 1;
    -[RUITableView activateRowAtIndexPath:animated:](self, "activateRowAtIndexPath:animated:", v4, (gAnimatedTransitions & 1) == 0);
  }
  else if (objc_msgSend(v5, "supportsAutomaticSelection"))
  {
    v8 = 1;
    -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_tableView, "selectRowAtIndexPath:animated:scrollPosition:", v4, (gAnimatedTransitions & 1) == 0, 0);
    -[RUITableView tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", self->_tableView, v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)rowDidChange:(id)a3 action:(int)a4
{
  uint64_t v4;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_objectModel);
  objc_msgSend(WeakRetained, "tableViewOMDidChange:", self);

  objc_msgSend(v6, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("class"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("switch")) & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v6, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("url"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("httpMethod"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(v6, "attributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("POST"), CFSTR("httpMethod"));
      objc_msgSend(v6, "setAttributes:", v8);
LABEL_6:

    }
  }
  objc_msgSend(v6, "startActivityIndicator");
  v15 = objc_loadWeakRetained((id *)&self->_objectModel);
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    v17 = objc_loadWeakRetained((id *)&self->_objectModel);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __36__RUITableView_rowDidChange_action___block_invoke;
    v18[3] = &unk_24C2974D8;
    v19 = v6;
    objc_msgSend(v17, "tableViewOM:elementDidChange:action:completion:", self, v19, v4, v18);

  }
}

void __36__RUITableView_rowDidChange_action___block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[4];
  id v3;
  char v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __36__RUITableView_rowDidChange_action___block_invoke_2;
  v2[3] = &unk_24C2983E8;
  v4 = a2;
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

uint64_t __36__RUITableView_rowDidChange_action___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "attributes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("class"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("switch"));

    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "switchCanceled");
  }
  return objc_msgSend(*(id *)(a1 + 32), "stopActivityIndicator");
}

- (id)textFieldRow:(id)a3 changeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  RUIObjectModel **p_objectModel;
  __CFString *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  length = a4.length;
  location = a4.location;
  v9 = (__CFString *)a5;
  v10 = a3;
  objc_msgSend(v10, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("changeCharactersFunction"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "tableCell");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "ruiEditableTextField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = (__CFString *)v15;
  else
    v16 = &stru_24C29B280;
  if (v9)
    v17 = v9;
  else
    v17 = &stru_24C29B280;
  p_objectModel = &self->_objectModel;
  v19 = v9;
  WeakRetained = objc_loadWeakRetained((id *)p_objectModel);
  v21 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", location);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", length);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "arrayWithObjects:", v16, v22, v23, v17, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "invokeScriptFunction:withArguments:", v12, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (Class)tableCellClassForTableViewRow:(id)a3
{
  RUIObjectModel **p_objectModel;
  id v4;
  id WeakRetained;
  void *v6;

  p_objectModel = &self->_objectModel;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_objectModel);
  objc_msgSend(WeakRetained, "customTableCellClassForTableViewRow:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

- (id)filteredResultsWithSearchTerm:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *sections;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_sections, "count"));
  sections = self->_sections;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__RUITableView_filteredResultsWithSearchTerm___block_invoke;
  v12[3] = &unk_24C298438;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](sections, "enumerateObjectsUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __46__RUITableView_filteredResultsWithSearchTerm___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v3, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__RUITableView_filteredResultsWithSearchTerm___block_invoke_2;
  v9[3] = &unk_24C298410;
  v10 = *(id *)(a1 + 32);
  v8 = v4;
  v11 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  objc_msgSend(v8, "rows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

void __46__RUITableView_filteredResultsWithSearchTerm___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "matchesSearchTerm:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addRow:", v3);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  void *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *filteredSections;
  void *v9;
  id v10;

  objc_msgSend(a3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    self->_isSearching = 1;
    -[RUITableView filteredResultsWithSearchTerm:](self, "filteredResultsWithSearchTerm:", v10);
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    filteredSections = self->_filteredSections;
    self->_filteredSections = v7;
  }
  else
  {
    self->_isSearching = 0;
    filteredSections = self->_filteredSections;
    self->_filteredSections = 0;
  }

  -[RUITableView tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  NSMutableArray *filteredSections;
  id v5;
  id v6;

  self->_isSearching = 0;
  filteredSections = self->_filteredSections;
  self->_filteredSections = 0;
  v5 = a3;

  objc_msgSend(v5, "setText:", &stru_24C29B280);
  -[RUITableView tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (CGSize)scrollView:(id)a3 contentSizeForZoomScale:(double)a4 withProposedSize:(CGSize)a5
{
  CGFloat height;
  double width;
  CGSize *p_cachedContentSize;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  CGSize result;

  height = a5.height;
  width = a5.width;
  p_cachedContentSize = &self->_cachedContentSize;
  v9 = FASizeRoundMetrics(self->_cachedContentSize.width);
  v11 = v10;
  if (v9 != FASizeRoundMetrics(width) || v11 != v12)
  {
    -[RUIElement pageElement](self, "pageElement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "page");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNeedsLayout");

  }
  p_cachedContentSize->width = width;
  p_cachedContentSize->height = height;
  v17 = width;
  v18 = height;
  result.height = v18;
  result.width = v17;
  return result;
}

- (RUITableViewRow)defaultFirstResponderRow
{
  return self->_defaultFirstResponderRow;
}

- (void)setDefaultFirstResponderRow:(id)a3
{
  objc_storeStrong((id *)&self->_defaultFirstResponderRow, a3);
}

- (RUIObjectModel)objectModel
{
  return (RUIObjectModel *)objc_loadWeakRetained((id *)&self->_objectModel);
}

- (void)setObjectModel:(id)a3
{
  objc_storeWeak((id *)&self->_objectModel, a3);
}

- (RUIPage)page
{
  return (RUIPage *)objc_loadWeakRetained((id *)&self->_page);
}

- (void)setPage:(id)a3
{
  objc_storeWeak((id *)&self->_page, a3);
}

- (RUIHeaderElement)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (RUISubHeaderElement)subHeader
{
  return self->_subHeader;
}

- (void)setSubHeader:(id)a3
{
  objc_storeStrong((id *)&self->_subHeader, a3);
}

- (RUIFooterElement)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_storeStrong((id *)&self->_footer, a3);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitle, a3);
}

- (NSString)subHeaderTitle
{
  return self->_subHeaderTitle;
}

- (void)setSubHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_subHeaderTitle, a3);
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (UIPickerView)selectPicker
{
  return self->_selectPicker;
}

- (void)setSelectPicker:(id)a3
{
  objc_storeStrong((id *)&self->_selectPicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectPicker, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_subHeaderTitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_subHeader, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_destroyWeak((id *)&self->_page);
  objc_destroyWeak((id *)&self->_objectModel);
  objc_storeStrong((id *)&self->_filteredSections, 0);
  objc_storeStrong((id *)&self->_oldRightBarButtonItemForLabel, 0);
  objc_storeStrong((id *)&self->_oldLeftBarButtonItemForLabel, 0);
  objc_storeStrong((id *)&self->_currentTraitCollection, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_oldPickerDate, 0);
  objc_storeStrong((id *)&self->_oldRightBarButtonItemForPicker, 0);
  objc_storeStrong((id *)&self->_oldLeftBarButtonItemForPicker, 0);
  objc_storeStrong((id *)&self->_defaultFirstResponderRow, 0);
  objc_storeStrong((id *)&self->_embeddedPickerRowIndexPath, 0);
  objc_storeStrong((id *)&self->_pickerRowIndexPath, 0);
  objc_storeStrong((id *)&self->_pickerBackdrop, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

- (void)tableView:(os_log_t)log performAction:forRowAtIndexPath:withSender:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209E87000, log, OS_LOG_TYPE_ERROR, "Unrecognized action for table view", v1, 2u);
}

@end
