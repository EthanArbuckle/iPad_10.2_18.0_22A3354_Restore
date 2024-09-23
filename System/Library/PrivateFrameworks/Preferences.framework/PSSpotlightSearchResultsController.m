@implementation PSSpotlightSearchResultsController

- (PSSpotlightSearchResultsController)init
{
  PSSpotlightSearchResultsController *v2;
  uint64_t v3;
  NSMutableDictionary *iconViewMap;
  uint64_t v5;
  NSMutableArray *reusableIconViews;
  void *v7;
  void *v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PSSpotlightSearchResultsController;
  v2 = -[PSSpotlightSearchResultsController init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    iconViewMap = v2->_iconViewMap;
    v2->_iconViewMap = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    reusableIconViews = v2->_reusableIconViews;
    v2->_reusableIconViews = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_deviceOrientation = objc_msgSend(v7, "orientation");

    -[PSSpotlightSearchResultsController view](v2, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "directionalLayoutMargins");
    v2->originalInset = v9;

  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PSSpotlightSearchResultsController;
  -[PSSpotlightSearchResultsController viewDidLoad](&v14, sel_viewDidLoad);
  v3 = (void *)objc_opt_new();
  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTableFooterView:", v3);

  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyboardDismissMode:", 1);

  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  +[PSListController appearance](PSListController, "appearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "usesDarkTheme");

  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = 2;
  else
    v11 = 0;
  if (v8)
    v12 = 2;
  else
    v12 = 1;
  objc_msgSend(v9, "setIndicatorStyle:", v11);

  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_accessibilitySetInterfaceStyleIntent:", v12);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PSSpotlightSearchResultsController tableData](self, "tableData", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (NSMutableArray)tableData
{
  return self->_tableData;
}

- (void)setResults:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_results, a3);
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v28 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v12, "attributeSet", v28);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "theme");
          v14 = objc_claimAutoreleasedReturnValue();

          if (v14)
            v15 = (__CFString *)v14;
          else
            v15 = &stru_1E4A69238;
          objc_msgSend(v6, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v15);

          }
          objc_msgSend(v6, "objectForKeyedSubscript:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v9);
    }

    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PSSpotlightSearchResultsController setTableData:](self, "setTableData:", v19);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v6, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j), v28);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSSpotlightSearchResultsController tableData](self, "tableData");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v22);
    }

    -[PSSpotlightSearchResultsController tableData](self, "tableData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __49__PSSpotlightSearchResultsController_setResults___block_invoke;
    v29[3] = &unk_1E4A68A10;
    v29[4] = self;
    objc_msgSend(v27, "sortUsingComparator:", v29);

    v5 = v28;
  }

}

uint64_t __49__PSSpotlightSearchResultsController_setResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "theme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "attributeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "theme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "searchResultsController:sortCategory1:sortCategory2:", *(_QWORD *)(a1 + 32), v8, v11);

  return v13;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v7 = (void *)MEMORY[0x1E0CEA508];
  v8 = a4;
  objc_msgSend(v7, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orientation");

  v10.receiver = self;
  v10.super_class = (Class)PSSpotlightSearchResultsController;
  -[PSSpotlightSearchResultsController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[PSSpotlightSearchResultsController tableData](self, "tableData", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
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

  v6 = a3;
  -[PSSpotlightSearchResultsController _itemForIndexPath:](self, "_itemForIndexPath:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  objc_msgSend(v8, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    v10 = (void *)objc_msgSend(objc_alloc((Class)v8), "initWithStyle:reuseIdentifier:", 3, v9);
  objc_msgSend(v7, "attributeSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  objc_msgSend(v7, "attributeSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detailTextLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  objc_msgSend(v10, "setShouldIndentSeparator:", 1);
  objc_msgSend(v10, "setShouldIndentContent:", 0);

  return v10;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[PSSpotlightSearchResultsController _itemForIndexPath:](self, "_itemForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v7, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSSpotlightSearchResultsController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "searchResultsController:didSelectURL:", self, v11);

  }
  objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v6, 0);

}

- (id)_itemForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PSSpotlightSearchResultsController tableData](self, "tableData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PSSpotlightSearchResultsController tableData](self, "tableData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)iconWidth
{
  if (iconWidth_onceToken != -1)
    dispatch_once(&iconWidth_onceToken, &__block_literal_global_36);
  return *(double *)&iconWidth_iconWidth;
}

double __47__PSSpotlightSearchResultsController_iconWidth__block_invoke()
{
  double v0;
  double result;
  id v2;

  PSBlankIconImage();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  *(double *)&iconWidth_iconWidth = v0 + 15.0;

  return result;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PSSpotlightSearchResultsController;
  -[PSSpotlightSearchResultsController viewDidLayoutSubviews](&v12, sel_viewDidLayoutSubviews);
  -[PSSpotlightSearchResultsController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "directionalLayoutMargins");
  v5 = v4;
  -[PSSpotlightSearchResultsController iconWidth](self, "iconWidth");
  v7 = v5 + v6;

  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "separatorInset");
  v10 = v9;

  if (v10 != v7)
  {
    -[PSSpotlightSearchResultsController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSeparatorInset:", 0.0, v7, 0.0, 0.0);

  }
}

- (void)_removeIconViewForSection:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_iconViewMap, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableArray addObject:](self->_reusableIconViews, "addObject:", v4);
    objc_msgSend(v4, "removeFromSuperview");
    -[NSMutableDictionary removeObjectForKey:](self->_iconViewMap, "removeObjectForKey:", v5);
  }

}

- (void)_updateIconViews:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  double MaxY;
  uint64_t v56;
  double v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t k;
  id v79;
  id obj;
  double v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;
  CGRect v106;
  CGRect v107;

  v105 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[NSMutableDictionary allKeys](self->_iconViewMap, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v98;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v98 != v7)
            objc_enumerationMutation(v4);
          -[PSSpotlightSearchResultsController _removeIconViewForSection:](self, "_removeIconViewForSection:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
      }
      while (v6);
    }

  }
  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentOffset");
  v11 = v10;
  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "adjustedContentInset");
  v14 = v13;

  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "indexPathsForVisibleRows");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v16, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v94;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v94 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * j), "section"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
    }
    while (v20);
  }
  v79 = v18;

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v24 = v17;
  obj = v24;
  v84 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
  if (v84)
  {
    v82 = v11 + v14;
    v83 = *(_QWORD *)v90;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v90 != v83)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v25);
        v27 = objc_msgSend(v26, "unsignedIntegerValue", v79);
        -[PSSpotlightSearchResultsController view](self, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "directionalLayoutMargins");
        v30 = v29;

        -[PSSpotlightSearchResultsController iconWidth](self, "iconWidth");
        v32 = v31;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_iconViewMap, "objectForKeyedSubscript:", v26);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpotlightSearchResultsController tableView](self, "tableView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v27);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "rectForRowAtIndexPath:", v35);
        v37 = v36;
        v39 = v38;
        v41 = v40;

        if (v33)
          goto LABEL_23;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v27);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpotlightSearchResultsController _itemForIndexPath:](self, "_itemForIndexPath:", v63);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        -[PSSpotlightSearchResultsController delegate](self, "delegate");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "attributeSet");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "theme");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "searchResultsController:iconForCategory:", self, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v67)
          goto LABEL_31;
        if (-[NSMutableArray count](self->_reusableIconViews, "count"))
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_reusableIconViews, "objectAtIndexedSubscript:", 0);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray removeObjectAtIndex:](self->_reusableIconViews, "removeObjectAtIndex:", 0);
        }
        else
        {
          v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v37, v39, v32, v41);
          objc_msgSend(v68, "setContentMode:", 4);
        }
        objc_msgSend(v68, "setImage:", v67);
        -[PSSpotlightSearchResultsController tableView](self, "tableView");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addSubview:", v68);

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_iconViewMap, "setObject:forKeyedSubscript:", v68, v26);
        v33 = v68;
        if (v68)
        {
LABEL_23:
          -[PSSpotlightSearchResultsController tableView](self, "tableView");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "rectForSection:", v27);
          v44 = v43;
          v46 = v45;
          v48 = v47;
          v50 = v49;

          objc_msgSend(v33, "frame");
          v52 = v51;
          v54 = v53;
          v106.origin.x = v44;
          v106.origin.y = v46;
          v106.size.width = v48;
          v106.size.height = v50;
          MaxY = CGRectGetMaxY(v106);
          v107.origin.x = v30;
          v107.origin.y = v52;
          v107.size.width = v54;
          v107.size.height = v41;
          v56 = (uint64_t)(MaxY - CGRectGetHeight(v107));
          v57 = v82;
          if (v82 < v46)
            v57 = v46;
          if (v56 >= (uint64_t)v57)
            v58 = (uint64_t)v57;
          else
            v58 = v56;
          objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "userInterfaceLayoutDirection");

          if (v60 == 1)
          {
            -[PSSpotlightSearchResultsController tableView](self, "tableView");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "frame");
            v30 = v62 - (v30 + v54);

          }
          objc_msgSend(v33, "setFrame:", v30, (double)v58, v54, v41);
LABEL_31:

        }
        ++v25;
      }
      while (v84 != v25);
      v24 = obj;
      v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
      v84 = v70;
    }
    while (v70);
  }

  v71 = v79;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_iconViewMap);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allObjects");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "removeObjectsForKeys:", v73);

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v74 = v72;
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
    if (v75)
    {
      v76 = v75;
      v77 = *(_QWORD *)v86;
      do
      {
        for (k = 0; k != v76; ++k)
        {
          if (*(_QWORD *)v86 != v77)
            objc_enumerationMutation(v74);
          -[PSSpotlightSearchResultsController _removeIconViewForSection:](self, "_removeIconViewForSection:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * k), v79);
        }
        v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
      }
      while (v76);
    }

    v24 = obj;
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  -[PSSpotlightSearchResultsController _updateIconViews:](self, "_updateIconViews:", 0);
}

- (void)tableViewDidFinishReload:(id)a3
{
  -[PSSpotlightSearchResultsController _updateIconViews:](self, "_updateIconViews:", 1);
}

- (void)searchQueryStarted
{
  -[PSSpotlightSearchResultsController setResults:](self, "setResults:", 0);
}

- (void)searchQueryFoundItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PSSpotlightSearchResultsController results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSSpotlightSearchResultsController setResults:](self, "setResults:", v6);
  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (void)searchQueryCompleted
{
  id v2;

  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)selectPreviousSearchResult
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForSelectedRow");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v13;
  if (v13)
  {
    v5 = objc_msgSend(v13, "section");
    v6 = objc_msgSend(v13, "row");
    v7 = v6 - 1;
    if (v6 >= 1)
    {
      v8 = (void *)MEMORY[0x1E0CB36B0];
LABEL_6:
      objc_msgSend(v8, "indexPathForRow:inSection:", v7, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpotlightSearchResultsController _selectIndexPath:](self, "_selectIndexPath:", v12);

      v4 = v13;
      goto LABEL_7;
    }
    v9 = v5-- < 1;
    v4 = v13;
    if (!v9)
    {
      -[PSSpotlightSearchResultsController tableView](self, "tableView", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "numberOfRowsInSection:", v5) - 1;

      v8 = (void *)MEMORY[0x1E0CB36B0];
      v7 = v11;
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)selectNextSearchResult
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForSelectedRow");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v9 = (void *)MEMORY[0x1E0CB36B0];
    v8 = 0;
    v10 = 0;
    goto LABEL_7;
  }
  v4 = objc_msgSend(v14, "section");
  v5 = objc_msgSend(v14, "row");
  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfRowsInSection:", v4) - 1;

  if (v5 < v7)
  {
    v8 = v5 + 1;
    v9 = (void *)MEMORY[0x1E0CB36B0];
    v10 = v4;
LABEL_7:
    objc_msgSend(v9, "indexPathForRow:inSection:", v8, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpotlightSearchResultsController _selectIndexPath:](self, "_selectIndexPath:", v13);

    goto LABEL_8;
  }
  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "numberOfSections") - 1;

  if (v4 < v12)
  {
    v10 = v4 + 1;
    v9 = (void *)MEMORY[0x1E0CB36B0];
    v8 = 0;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_selectIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForVisibleRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "compare:", v14);

  if (v7 == 1)
  {
    -[PSSpotlightSearchResultsController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v14;
    v11 = 1;
  }
  else
  {
    objc_msgSend(v5, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "compare:", v14);

    -[PSSpotlightSearchResultsController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v14;
    if (v13 == -1)
      v11 = 3;
    else
      v11 = 0;
  }
  objc_msgSend(v8, "selectRowAtIndexPath:animated:scrollPosition:", v10, 1, v11);

}

- (void)showSelectedSearchResult
{
  void *v3;
  void *v4;
  id v5;

  -[PSSpotlightSearchResultsController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForSelectedRow");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PSSpotlightSearchResultsController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpotlightSearchResultsController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", v4, v5);

    -[PSSpotlightSearchResultsController _selectIndexPath:](self, "_selectIndexPath:", v5);
  }

}

- (NSArray)results
{
  return self->_results;
}

- (PSSpotlightSearchResultsControllerDelegate)delegate
{
  return (PSSpotlightSearchResultsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setTableData:(id)a3
{
  objc_storeStrong((id *)&self->_tableData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_reusableIconViews, 0);
  objc_storeStrong((id *)&self->_iconViewMap, 0);
}

@end
