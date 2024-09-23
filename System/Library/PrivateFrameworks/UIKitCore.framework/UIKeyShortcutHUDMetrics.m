@implementation UIKeyShortcutHUDMetrics

- (_UIKeyShortcutHUDShortcutCell)selfSizingShortcutCell
{
  _UIKeyShortcutHUDShortcutCell *selfSizingShortcutCell;
  void *v5;
  _UIKeyShortcutHUDShortcutCell *v6;
  double v7;
  _UIKeyShortcutHUDShortcutCell *v8;
  _UIKeyShortcutHUDShortcutCell *v9;
  void *v10;
  void *v12;

  selfSizingShortcutCell = self->_selfSizingShortcutCell;
  if (!selfSizingShortcutCell)
  {
    -[UIKeyShortcutHUDMetrics selfSizingPlayground](self, "selfSizingPlayground");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyShortcutHUDMetrics.m"), 126, CFSTR("Fatal: attempted to create the self-sizing shortcut cell in the HUD metrics without a self-sizing playground!"));

    }
    v6 = [_UIKeyShortcutHUDShortcutCell alloc];
    -[UIKeyShortcutHUDMetrics menuCellHeight](self, "menuCellHeight");
    v8 = -[_UIKeyShortcutHUDShortcutCell initWithFrame:](v6, "initWithFrame:", 0.0, 0.0, 0.0, v7);
    v9 = self->_selfSizingShortcutCell;
    self->_selfSizingShortcutCell = v8;

    -[UIKeyShortcutHUDMetrics selfSizingPlayground](self, "selfSizingPlayground");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_selfSizingShortcutCell);

    selfSizingShortcutCell = self->_selfSizingShortcutCell;
  }
  return selfSizingShortcutCell;
}

- (_UIKeyShortcutHUDToolbarSearchCell)selfSizingSearchCell
{
  _UIKeyShortcutHUDToolbarSearchCell *selfSizingSearchCell;
  void *v5;
  _UIKeyShortcutHUDToolbarSearchCell *v6;
  double v7;
  _UIKeyShortcutHUDToolbarSearchCell *v8;
  _UIKeyShortcutHUDToolbarSearchCell *v9;
  void *v10;
  void *v12;

  selfSizingSearchCell = self->_selfSizingSearchCell;
  if (!selfSizingSearchCell)
  {
    -[UIKeyShortcutHUDMetrics selfSizingPlayground](self, "selfSizingPlayground");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyShortcutHUDMetrics.m"), 136, CFSTR("Fatal: attempted to create the self-sizing search cell in the HUD metrics without a self-sizing playground!"));

    }
    v6 = [_UIKeyShortcutHUDToolbarSearchCell alloc];
    -[UIKeyShortcutHUDMetrics menuCellHeight](self, "menuCellHeight");
    v8 = -[_UIKeyShortcutHUDToolbarSearchCell initWithFrame:](v6, "initWithFrame:", 0.0, 0.0, 0.0, v7);
    v9 = self->_selfSizingSearchCell;
    self->_selfSizingSearchCell = v8;

    -[UIKeyShortcutHUDMetrics selfSizingPlayground](self, "selfSizingPlayground");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_selfSizingSearchCell);

    selfSizingSearchCell = self->_selfSizingSearchCell;
  }
  return selfSizingSearchCell;
}

- (_UIKeyShortcutHUDToolbarCategoryCell)selfSizingToolbarCategoryCell
{
  _UIKeyShortcutHUDToolbarCategoryCell *selfSizingToolbarCategoryCell;
  void *v5;
  _UIKeyShortcutHUDToolbarCategoryCell *v6;
  double v7;
  _UIKeyShortcutHUDToolbarCategoryCell *v8;
  _UIKeyShortcutHUDToolbarCategoryCell *v9;
  void *v10;
  void *v12;

  selfSizingToolbarCategoryCell = self->_selfSizingToolbarCategoryCell;
  if (!selfSizingToolbarCategoryCell)
  {
    -[UIKeyShortcutHUDMetrics selfSizingPlayground](self, "selfSizingPlayground");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyShortcutHUDMetrics.m"), 146, CFSTR("Fatal: attempted to create the self-sizing toolbar category cell in the HUD metrics without a self-sizing playground!"));

    }
    v6 = [_UIKeyShortcutHUDToolbarCategoryCell alloc];
    -[UIKeyShortcutHUDMetrics menuCellHeight](self, "menuCellHeight");
    v8 = -[_UIKeyShortcutHUDCell initWithFrame:](v6, "initWithFrame:", 0.0, 0.0, 0.0, v7);
    v9 = self->_selfSizingToolbarCategoryCell;
    self->_selfSizingToolbarCategoryCell = v8;

    -[UIKeyShortcutHUDMetrics selfSizingPlayground](self, "selfSizingPlayground");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_selfSizingToolbarCategoryCell);

    selfSizingToolbarCategoryCell = self->_selfSizingToolbarCategoryCell;
  }
  return selfSizingToolbarCategoryCell;
}

- (void)setBaseMenu:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_baseMenu);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_baseMenu, obj);
    -[UIKeyShortcutHUDMetrics _updateBaseMenuMetrics](self, "_updateBaseMenuMetrics");
    v5 = obj;
  }

}

- (void)setDisplayedMenu:(id)a3 searching:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[UIKeyShortcutHUDMetrics _setDisplayedMenu:searching:combinedShortcutAndAlternateColumnWidths:](self, "_setDisplayedMenu:searching:combinedShortcutAndAlternateColumnWidths:", v6, v4, -[UIKeyShortcutHUDMetrics isHUDShrunkToFitHorizontally](self, "isHUDShrunkToFitHorizontally"));

}

- (void)_setDisplayedMenu:(id)a3 searching:(BOOL)a4 combinedShortcutAndAlternateColumnWidths:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _UIKeyShortcutHUDMenu *v9;
  _UIKeyShortcutHUDMenu *v10;

  v5 = a5;
  v6 = a4;
  v9 = (_UIKeyShortcutHUDMenu *)a3;
  if (self->_displayedMenu != v9 || self->_searching != v6 || self->_combinedShortcutAndAlternateColumnWidths != v5)
  {
    v10 = v9;
    objc_storeStrong((id *)&self->_displayedMenu, a3);
    self->_searching = v6;
    self->_combinedShortcutAndAlternateColumnWidths = v5;
    -[UIKeyShortcutHUDMetrics _updateDisplayedMenuMetrics](self, "_updateDisplayedMenuMetrics");
    v9 = v10;
  }

}

- (void)computeOneTimeMetrics
{
  _UIKeyShortcutHUDClientTraits **p_clientTraits;
  id WeakRetained;
  id v5;
  id v6;

  p_clientTraits = &self->_clientTraits;
  WeakRetained = objc_loadWeakRetained((id *)&self->_clientTraits);
  if ((objc_msgSend(WeakRetained, "hasArabicHardwareKeyboard") & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_clientTraits);
    self->_shouldMirrorShortcutInputs = objc_msgSend(v5, "layoutDirection") == 1;

  }
  else
  {
    self->_shouldMirrorShortcutInputs = 0;
  }

  self->_shouldDisplayEscShortcutAlternative = 1;
  v6 = objc_loadWeakRetained((id *)p_clientTraits);
  self->_shouldDisplayGlobeModiferAsGlobeSymbol = objc_msgSend(v6, "globeKeyLabelHasGlobeSymbol");

}

- (void)_updateBaseMenuMetrics
{
  void *v4;
  NSMapTable *v5;
  NSMapTable *shortcutCellMetricsMap;
  NSMapTable *v7;
  NSMapTable *shortcutCellIndexPathsMap;
  _UIKeyShortcutHUDMenu **p_baseMenu;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  unint64_t v29;
  id v30;
  void *v31;
  unint64_t v32;
  double v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  double numCellsPerColumn;
  void *v41;
  NSObject *v42;
  unint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  unint64_t v57;
  unint64_t v58;
  NSObject *v59;
  unint64_t v60;
  double v61;
  float v62;
  float v63;
  unint64_t v64;
  id v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  double widestToolbarCategoryCellWidth;
  double v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t v91[128];
  uint8_t buf[4];
  unint64_t v93;
  __int16 v94;
  double v95;
  __int16 v96;
  double v97;
  __int16 v98;
  double v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  -[UIKeyShortcutHUDMetrics selfSizingPlayground](self, "selfSizingPlayground");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyShortcutHUDMetrics.m"), 202, CFSTR("Fatal: attempted to compute base menu metrics for the HUD without a self-sizing playground!"));

  }
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  shortcutCellMetricsMap = self->_shortcutCellMetricsMap;
  self->_shortcutCellMetricsMap = v5;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  shortcutCellIndexPathsMap = self->_shortcutCellIndexPathsMap;
  self->_shortcutCellIndexPathsMap = v7;

  p_baseMenu = &self->_baseMenu;
  WeakRetained = objc_loadWeakRetained((id *)&self->_baseMenu);
  objc_msgSend(WeakRetained, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    do
    {
      v14 = objc_loadWeakRetained((id *)p_baseMenu);
      objc_msgSend(v14, "children");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "children");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        v19 = 0;
        do
        {
          objc_msgSend(v16, "children");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v19, v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyShortcutHUDMetrics _computeAndStoreCellMetricsForShortcut:indexPath:](self, "_computeAndStoreCellMetricsForShortcut:indexPath:", v21, v22);
          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          objc_msgSend(v21, "shortcutAlternates");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v88;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v88 != v26)
                  objc_enumerationMutation(v23);
                -[UIKeyShortcutHUDMetrics _computeAndStoreCellMetricsForShortcut:indexPath:](self, "_computeAndStoreCellMetricsForShortcut:indexPath:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i), v22);
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
            }
            while (v25);
          }

          ++v19;
          objc_msgSend(v16, "children");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "count");

        }
        while (v19 < v29);
      }

      ++v13;
      p_baseMenu = &self->_baseMenu;
      v30 = objc_loadWeakRetained((id *)&self->_baseMenu);
      objc_msgSend(v30, "children");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

    }
    while (v13 < v32);
  }
  self->_numCellsPerColumn = 0;
  v33 = COERCE_DOUBLE(-[UIKeyShortcutHUDMetrics contentSizeAdjustedMaxNumberOfCellsPerColumn](self, "contentSizeAdjustedMaxNumberOfCellsPerColumn"));
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v34 = objc_loadWeakRetained((id *)p_baseMenu);
  objc_msgSend(v34, "children");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v84;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v84 != v38)
          objc_enumerationMutation(v35);
        numCellsPerColumn = (double)self->_numCellsPerColumn;
        objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * j), "children");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        self->_numCellsPerColumn = (unint64_t)fmax(numCellsPerColumn, fmin((double)(unint64_t)objc_msgSend(v41, "count"), (double)*(unint64_t *)&v33));

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
    }
    while (v37);
  }

  _UIKeyShortcutHUDLog();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = self->_numCellsPerColumn;
    *(_DWORD *)buf = 134349312;
    v93 = v43;
    v94 = 2050;
    v95 = v33;
    _os_log_impl(&dword_185066000, v42, OS_LOG_TYPE_DEFAULT, "HUD metrics: computed numCellsPerColumn = %{public}lu before accounting for available vertical space, with max possible cells = %{public}lu", buf, 0x16u);
  }

  -[UIKeyShortcutHUDMetrics availableVerticalSpace](self, "availableVerticalSpace");
  v45 = v44;
  -[UIKeyShortcutHUDMetrics _toolbarDistanceFromBottomOfWindow](self, "_toolbarDistanceFromBottomOfWindow");
  v47 = v45 - v46;
  -[UIKeyShortcutHUDMetrics _toolbarHeight](self, "_toolbarHeight");
  v49 = v47 - v48;
  -[UIKeyShortcutHUDMetrics standardMenuToolbarSpacing](self, "standardMenuToolbarSpacing");
  v51 = v49 - v50;
  -[UIKeyShortcutHUDMetrics minimumScreenEdgeDistance](self, "minimumScreenEdgeDistance");
  v53 = v51 - v52;
  -[UIKeyShortcutHUDMetrics standardMenuPanelHeight](self, "standardMenuPanelHeight");
  v55 = v54;
  if (v54 > v53)
  {
    -[UIKeyShortcutHUDMetrics menuCellHeight](self, "menuCellHeight");
    v57 = vcvtpd_u64_f64((v55 - v53) / v56);
    v58 = self->_numCellsPerColumn;
    if (v58 - 1 < v57)
      v57 = v58 - 1;
    self->_numCellsPerColumn = v58 - v57;
  }
  _UIKeyShortcutHUDLog();
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    v60 = self->_numCellsPerColumn;
    -[UIKeyShortcutHUDMetrics availableVerticalSpace](self, "availableVerticalSpace");
    *(float *)&v61 = v61;
    v62 = v53;
    *(_DWORD *)buf = 134349824;
    v93 = v60;
    v63 = v55;
    v94 = 2050;
    v95 = *(float *)&v61;
    v96 = 2050;
    v97 = v62;
    v98 = 2050;
    v99 = v63;
    _os_log_impl(&dword_185066000, v59, OS_LOG_TYPE_DEFAULT, "HUD metrics: computed numCellsPerColumn = %{public}lu after accounting for available vertical space; availableSpac"
      "e = %{public}.2f, availableMenuPanelVerticalSpace = %{public}.2f, idealMenuHeight = %{public}.2f",
      buf,
      0x2Au);
  }

  v64 = self->_numCellsPerColumn;
  if (v64 <= 1)
    v64 = 1;
  self->_numCellsPerColumn = v64;
  v65 = objc_loadWeakRetained((id *)p_baseMenu);
  -[UIKeyShortcutHUDMetrics _setDisplayedMenu:searching:combinedShortcutAndAlternateColumnWidths:](self, "_setDisplayedMenu:searching:combinedShortcutAndAlternateColumnWidths:", v65, 0, 1);

  self->_computedHUDWidthForBaseMenu = self->_displayedMenuContentWidth;
  -[UIKeyShortcutHUDMetrics selfSizingSearchCell](self, "selfSizingSearchCell");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "layoutIfNeeded");
  objc_msgSend(v66, "systemLayoutSizeFittingSize:", 0.0, 0.0);
  self->_searchButtonWidth = v67;
  -[UIKeyShortcutHUDMetrics toolbarContentInset](self, "toolbarContentInset");
  self->_searchButtonWidth = v68 + self->_searchButtonWidth;
  self->_widestToolbarCategoryCellWidth = 0.0;
  -[UIKeyShortcutHUDMetrics selfSizingToolbarCategoryCell](self, "selfSizingToolbarCategoryCell");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v70 = objc_loadWeakRetained((id *)p_baseMenu);
  objc_msgSend(v70, "children");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v80;
    do
    {
      for (k = 0; k != v73; ++k)
      {
        if (*(_QWORD *)v80 != v74)
          objc_enumerationMutation(v71);
        objc_msgSend(v69, "configureForMetricsCalculationsWithCategory:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * k));
        objc_msgSend(v69, "layoutIfNeeded");
        widestToolbarCategoryCellWidth = self->_widestToolbarCategoryCellWidth;
        objc_msgSend(v69, "systemLayoutSizeFittingSize:", 0.0, 0.0);
        if (widestToolbarCategoryCellWidth >= v77)
          v77 = widestToolbarCategoryCellWidth;
        self->_widestToolbarCategoryCellWidth = v77;
      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
    }
    while (v73);
  }

}

- (void)_computeAndStoreCellMetricsForShortcut:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  -[UIKeyShortcutHUDMetrics selfSizingShortcutCell](self, "selfSizingShortcutCell");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shortcutInputAccessoryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shortcutInputView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "configureWithShortcut:", v7);
  objc_msgSend(v16, "layoutIfNeeded");
  objc_msgSend(v16, "systemLayoutSizeFittingSize:", 0.0, 0.0);
  v11 = v10;
  objc_msgSend(v9, "modifiersLabelWidth");
  v13 = v12;
  objc_msgSend(v9, "inputLabelWidth");
  +[_UIKeyShortcutHUDShortcutCellMetrics metricsWithCellWidth:modifiersWidth:inputWidth:](_UIKeyShortcutHUDShortcutCellMetrics, "metricsWithCellWidth:modifiersWidth:inputWidth:", v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](self->_shortcutCellMetricsMap, "setObject:forKey:", v15, v7);
  -[NSMapTable setObject:forKey:](self->_shortcutCellIndexPathsMap, "setObject:forKey:", v6, v7);

}

- (void)_updateDisplayedMenuMetrics
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *displayedMenuColumnMetrics;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *displayedMenuCategoryOffsets;
  _UIKeyShortcutHUDShortcutColumnMetrics *displayedSearchColumnMetrics;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[_UIKeyShortcutHUDMenu children](self->_displayedMenu, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  displayedMenuColumnMetrics = self->_displayedMenuColumnMetrics;
  self->_displayedMenuColumnMetrics = v5;

  v7 = (void *)MEMORY[0x1E0C99DE8];
  -[_UIKeyShortcutHUDMenu children](self->_displayedMenu, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  displayedMenuCategoryOffsets = self->_displayedMenuCategoryOffsets;
  self->_displayedMenuCategoryOffsets = v9;

  self->_displayedMenuContentWidth = 0.0;
  displayedSearchColumnMetrics = self->_displayedSearchColumnMetrics;
  self->_displayedSearchColumnMetrics = 0;

  self->_searchModePreferredMenuPanelHeight = 0.0;
  if (self->_searching)
    -[UIKeyShortcutHUDMetrics _updateDisplayedSearchMenuMetrics](self, "_updateDisplayedSearchMenuMetrics");
  else
    -[UIKeyShortcutHUDMetrics _updateDisplayedStandardMenuMetrics](self, "_updateDisplayedStandardMenuMetrics");
}

- (void)_updateDisplayedStandardMenuMetrics
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSMutableArray *displayedMenuColumnMetrics;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  double v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  BOOL v68;
  void *v69;
  uint64_t v70;
  unint64_t v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  NSMutableArray *displayedMenuCategoryOffsets;
  void *v80;
  void *v81;
  unint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  uint64_t v89;
  uint64_t v90;
  id obj;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  unint64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  _BYTE v116[128];
  void *v117;
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  -[_UIKeyShortcutHUDMenu children](self->_displayedMenu, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v118, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v112;
    v89 = *(_QWORD *)v112;
    do
    {
      v6 = 0;
      v90 = v4;
      do
      {
        if (*(_QWORD *)v112 != v5)
          objc_enumerationMutation(obj);
        v92 = v6;
        v7 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v6);
        if (objc_msgSend(v7, "isEmpty"))
        {
          -[UIKeyShortcutHUDMetrics emptyColumnWidth](self, "emptyColumnWidth");
          +[_UIKeyShortcutHUDShortcutColumnMetrics metricsWithColumnWidth:modifiersWidth:inputWidth:](_UIKeyShortcutHUDShortcutColumnMetrics, "metricsWithColumnWidth:modifiersWidth:inputWidth:");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          displayedMenuColumnMetrics = self->_displayedMenuColumnMetrics;
          v117 = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](displayedMenuColumnMetrics, "addObject:", v10);

        }
        else
        {
          objc_msgSend(v7, "children");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count") - 1;
          v95 = v12 / -[UIKeyShortcutHUDMetrics numCellsPerColumn](self, "numCellsPerColumn");

          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v95 + 1);
          v13 = objc_claimAutoreleasedReturnValue();
          v8 = (void *)v13;
          if (v95 != -1)
          {
            v14 = 0;
            v97 = 1;
            v101 = v7;
            v93 = (void *)v13;
            do
            {
              v15 = -[UIKeyShortcutHUDMetrics numCellsPerColumn](self, "numCellsPerColumn") * v14;
              v16 = -[UIKeyShortcutHUDMetrics numCellsPerColumn](self, "numCellsPerColumn");
              v96 = v14 + 1;
              v17 = 0.0;
              v18 = 0.0;
              v19 = 0.0;
              if (v15 < v16 * (v14 + 1))
              {
                v94 = v14;
                v102 = v16 * v97;
                v20 = v15;
                v21 = 0.0;
                do
                {
                  objc_msgSend(v7, "children");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "count");

                  if (v20 >= v23)
                    break;
                  objc_msgSend(v7, "children");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "objectAtIndexedSubscript:", v20);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                  -[NSMapTable objectForKey:](self->_shortcutCellMetricsMap, "objectForKey:", v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "modifiersWidth");
                  if (v17 < v27)
                    v17 = v27;
                  objc_msgSend(v26, "inputWidth");
                  if (v18 < v28)
                    v18 = v28;
                  if (self->_combinedShortcutAndAlternateColumnWidths)
                  {
                    objc_msgSend(v25, "baseShortcutForAlternate");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSMapTable objectForKey:](self->_shortcutCellMetricsMap, "objectForKey:", v29);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "modifiersWidth");
                    if (v19 < v31)
                      v19 = v31;
                    v98 = v30;
                    objc_msgSend(v30, "inputWidth");
                    if (v21 < v32)
                      v21 = v32;
                    v107 = 0u;
                    v108 = 0u;
                    v109 = 0u;
                    v110 = 0u;
                    v99 = v29;
                    objc_msgSend(v29, "shortcutAlternates");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v107, v116, 16);
                    if (v34)
                    {
                      v35 = v34;
                      v36 = *(_QWORD *)v108;
                      do
                      {
                        for (i = 0; i != v35; ++i)
                        {
                          if (*(_QWORD *)v108 != v36)
                            objc_enumerationMutation(v33);
                          -[NSMapTable objectForKey:](self->_shortcutCellMetricsMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i));
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v38, "modifiersWidth");
                          if (v19 < v39)
                            v19 = v39;
                          objc_msgSend(v38, "inputWidth");
                          if (v21 < v40)
                            v21 = v40;

                        }
                        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v107, v116, 16);
                      }
                      while (v35);
                    }

                    v7 = v101;
                  }

                  ++v20;
                }
                while (v20 != v102);
                if (self->_combinedShortcutAndAlternateColumnWidths)
                  v41 = v21 + v19;
                else
                  v41 = v18 + v17;
                v19 = 0.0;
                do
                {
                  objc_msgSend(v7, "children");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend(v42, "count");

                  if (v15 >= v43)
                    break;
                  objc_msgSend(v7, "children");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "objectAtIndexedSubscript:", v15);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();

                  -[NSMapTable objectForKey:](self->_shortcutCellMetricsMap, "objectForKey:", v45);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = v46;
                  if (self->_combinedShortcutAndAlternateColumnWidths)
                  {
                    v100 = v46;
                    objc_msgSend(v45, "baseShortcutForAlternate");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSMapTable objectForKey:](self->_shortcutCellMetricsMap, "objectForKey:", v48);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "cellWidth");
                    v51 = v50;
                    -[UIKeyShortcutHUDMetrics _shortcutWidthAdjustmentForMetrics:shortcutWidth:](self, "_shortcutWidthAdjustmentForMetrics:shortcutWidth:", v49, v41);
                    v53 = v51 + v52;
                    v103 = 0u;
                    v104 = 0u;
                    v105 = 0u;
                    v106 = 0u;
                    objc_msgSend(v48, "shortcutAlternates");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
                    if (v55)
                    {
                      v56 = v55;
                      v57 = *(_QWORD *)v104;
                      do
                      {
                        for (j = 0; j != v56; ++j)
                        {
                          if (*(_QWORD *)v104 != v57)
                            objc_enumerationMutation(v54);
                          -[NSMapTable objectForKey:](self->_shortcutCellMetricsMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * j));
                          v59 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v59, "cellWidth");
                          v61 = v60;
                          -[UIKeyShortcutHUDMetrics _shortcutWidthAdjustmentForMetrics:shortcutWidth:](self, "_shortcutWidthAdjustmentForMetrics:shortcutWidth:", v59, v41);
                          v63 = v61 + v62;
                          if (v53 < v63)
                            v53 = v63;

                        }
                        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
                      }
                      while (v56);
                    }

                    v47 = v100;
                    v7 = v101;
                  }
                  else
                  {
                    objc_msgSend(v46, "cellWidth");
                    v65 = v64;
                    -[UIKeyShortcutHUDMetrics _shortcutWidthAdjustmentForMetrics:shortcutWidth:](self, "_shortcutWidthAdjustmentForMetrics:shortcutWidth:", v47, v41);
                    v53 = v65 + v66;
                  }
                  if (v19 < v53)
                    v19 = v53;

                  ++v15;
                }
                while (v15 != v102);
                v8 = v93;
                v14 = v94;
              }
              +[_UIKeyShortcutHUDShortcutColumnMetrics metricsWithColumnWidth:modifiersWidth:inputWidth:](_UIKeyShortcutHUDShortcutColumnMetrics, "metricsWithColumnWidth:modifiersWidth:inputWidth:", v19, v17, v18);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v67);

              ++v97;
              v68 = v14 == v95;
              v14 = v96;
            }
            while (!v68);
          }
          -[NSMutableArray addObject:](self->_displayedMenuColumnMetrics, "addObject:", v8);
          v5 = v89;
          v4 = v90;
        }

        v6 = v92 + 1;
      }
      while (v92 + 1 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v118, 16);
    }
    while (v4);
  }

  -[_UIKeyShortcutHUDMenu children](self->_displayedMenu, "children");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "count");

  if (v70)
  {
    v71 = 0;
    do
    {
      if (v71)
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_displayedMenuCategoryOffsets, "objectAtIndexedSubscript:", v71 - 1);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "doubleValue");
        v74 = v73;

        -[UIKeyShortcutHUDMetrics _computedWidthForCategoryAtIndex:](self, "_computedWidthForCategoryAtIndex:", v71 - 1);
        v76 = v74 + v75;
        -[UIKeyShortcutHUDMetrics menuColumnSpacing](self, "menuColumnSpacing");
        v78 = v76 + v77;
      }
      else
      {
        -[UIKeyShortcutHUDMetrics menuHorizontalContentInset](self, "menuHorizontalContentInset");
      }
      displayedMenuCategoryOffsets = self->_displayedMenuCategoryOffsets;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v78);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](displayedMenuCategoryOffsets, "addObject:", v80);

      ++v71;
      -[_UIKeyShortcutHUDMenu children](self->_displayedMenu, "children");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v81, "count");

    }
    while (v71 < v82);
  }
  if (!-[_UIKeyShortcutHUDMenu isEmpty](self->_displayedMenu, "isEmpty"))
  {
    -[_UIKeyShortcutHUDMenu children](self->_displayedMenu, "children");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v83, "count") - 1;

    -[NSMutableArray objectAtIndexedSubscript:](self->_displayedMenuCategoryOffsets, "objectAtIndexedSubscript:", v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "doubleValue");
    self->_displayedMenuContentWidth = v86;

    -[UIKeyShortcutHUDMetrics _computedWidthForCategoryAtIndex:](self, "_computedWidthForCategoryAtIndex:", v84);
    self->_displayedMenuContentWidth = v87 + self->_displayedMenuContentWidth;
    -[UIKeyShortcutHUDMetrics menuHorizontalContentInset](self, "menuHorizontalContentInset");
    self->_displayedMenuContentWidth = v88 + self->_displayedMenuContentWidth;
  }
}

- (double)_shortcutWidthAdjustmentForMetrics:(id)a3 shortcutWidth:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v6 = a3;
  v7 = 0.0;
  if (-[UIKeyShortcutHUDMetrics shouldAlignShortcutModifiersAndInputInColumn](self, "shouldAlignShortcutModifiersAndInputInColumn"))
  {
    objc_msgSend(v6, "modifiersWidth");
    v9 = v8;
    objc_msgSend(v6, "inputWidth");
    v7 = a4 - (v9 + v10);
  }

  return v7;
}

- (void)_updateDisplayedSearchMenuMetrics
{
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _UIKeyShortcutHUDShortcutColumnMetrics *v38;
  _UIKeyShortcutHUDShortcutColumnMetrics *displayedSearchColumnMetrics;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t n;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  if (-[UIKeyShortcutHUDMetrics shouldAlignShortcutModifiersAndInputInColumn](self, "shouldAlignShortcutModifiersAndInputInColumn"))
  {
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    -[_UIKeyShortcutHUDMenu children](self->_displayedMenu, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v70 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v68 = 0u;
          objc_msgSend(v11, "children");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v66;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v66 != v15)
                  objc_enumerationMutation(v12);
                -[NSMapTable objectForKey:](self->_shortcutCellMetricsMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "modifiersWidth");
                if (v5 < v18)
                  v5 = v18;
                objc_msgSend(v17, "inputWidth");
                if (v4 < v19)
                  v4 = v19;

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
            }
            while (v14);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
      }
      while (v8);
    }

  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[_UIKeyShortcutHUDMenu children](self->_displayedMenu, "children");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v62;
    v3 = 0.0;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v62 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * k);
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        objc_msgSend(v25, "children");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v58;
          do
          {
            for (m = 0; m != v28; ++m)
            {
              if (*(_QWORD *)v58 != v29)
                objc_enumerationMutation(v26);
              -[NSMapTable objectForKey:](self->_shortcutCellMetricsMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * m));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = 0.0;
              if (-[UIKeyShortcutHUDMetrics shouldAlignShortcutModifiersAndInputInColumn](self, "shouldAlignShortcutModifiersAndInputInColumn"))
              {
                objc_msgSend(v31, "modifiersWidth");
                v34 = v33;
                objc_msgSend(v31, "inputWidth");
                v32 = v4 + v5 - (v34 + v35);
              }
              objc_msgSend(v31, "cellWidth");
              v37 = v32 + v36;
              if (v3 < v37)
                v3 = v37;

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
          }
          while (v28);
        }

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    }
    while (v22);
  }

  +[_UIKeyShortcutHUDShortcutColumnMetrics metricsWithColumnWidth:modifiersWidth:inputWidth:](_UIKeyShortcutHUDShortcutColumnMetrics, "metricsWithColumnWidth:modifiersWidth:inputWidth:", v3, v5, v4);
  v38 = (_UIKeyShortcutHUDShortcutColumnMetrics *)objc_claimAutoreleasedReturnValue();
  displayedSearchColumnMetrics = self->_displayedSearchColumnMetrics;
  self->_displayedSearchColumnMetrics = v38;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[_UIKeyShortcutHUDMenu children](self->_displayedMenu, "children", 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
  if (v41)
  {
    v42 = v41;
    v43 = 0;
    v44 = *(_QWORD *)v54;
    do
    {
      for (n = 0; n != v42; ++n)
      {
        if (*(_QWORD *)v54 != v44)
          objc_enumerationMutation(v40);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * n), "children");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v43 += objc_msgSend(v46, "count") + 1;

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
    }
    while (v42);
    v47 = (double)v43;
  }
  else
  {
    v47 = 0.0;
  }

  -[UIKeyShortcutHUDMetrics menuCellHeight](self, "menuCellHeight");
  v49 = v47 * v48;
  -[UIKeyShortcutHUDMetrics searchModeMenuTopContentInset](self, "searchModeMenuTopContentInset");
  v51 = v49 + v50;
  -[UIKeyShortcutHUDMetrics searchModeMenuBottomContentInset](self, "searchModeMenuBottomContentInset");
  self->_searchModePreferredMenuPanelHeight = v51 + v52;
}

- (double)_computedWidthForCategoryAtIndex:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray objectAtIndexedSubscript:](self->_displayedMenuColumnMetrics, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[UIKeyShortcutHUDMetrics minShortcutCellWidth](self, "minShortcutCellWidth");
        v12 = v11;
        objc_msgSend(v10, "columnWidth");
        v14 = v13;
        -[UIKeyShortcutHUDMetrics maxShortcutCellWidth](self, "maxShortcutCellWidth");
        v8 = v8 + fmax(v12, fmin(v14, v15));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }
  -[UIKeyShortcutHUDMetrics menuColumnSpacing](self, "menuColumnSpacing");
  v17 = v16;
  v18 = objc_msgSend(v4, "count");

  return v8 + v17 * (double)(unint64_t)(v18 - 1);
}

+ (UIKeyShortcutHUDMetrics)currentMetrics
{
  return (UIKeyShortcutHUDMetrics *)objc_loadWeakRetained(&_currentMetrics);
}

+ (void)setCurrentMetrics:(id)a3
{
  id WeakRetained;
  void *v4;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained(&_currentMetrics);

  v4 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak(&_currentMetrics, obj);
    v4 = obj;
  }

}

- (double)contentSizeScaledMetric:(double)a3
{
  double result;

  if (qword_1ECD7E888 != -1)
    dispatch_once(&qword_1ECD7E888, &__block_literal_global_295);
  objc_msgSend((id)_MergedGlobals_1098, "scaledValueForValue:", a3);
  return result;
}

void __51__UIKeyShortcutHUDMetrics_contentSizeScaledMetric___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1098;
  _MergedGlobals_1098 = v0;

}

- (BOOL)isHUDShrunkToFitHorizontally
{
  double v3;
  double v4;
  double v5;

  -[UIKeyShortcutHUDMetrics standardHUDWidth](self, "standardHUDWidth");
  v4 = v3;
  -[UIKeyShortcutHUDMetrics computedHUDWidthForBaseMenu](self, "computedHUDWidthForBaseMenu");
  return v4 == v5;
}

- (unint64_t)contentSizeAdjustedMaxNumberOfCellsPerColumn
{
  void *v3;
  NSString *v4;
  uint64_t v5;
  unint64_t v6;

  -[UIKeyShortcutHUDMetrics traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryCompareToCategory(CFSTR("UICTContentSizeCategoryAccessibilityL"), v4) == NSOrderedAscending)
  {
    v5 = -3;
  }
  else if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    v5 = -2;
  }
  else if (UIContentSizeCategoryCompareToCategory(CFSTR("UICTContentSizeCategoryL"), v4) == NSOrderedAscending)
  {
    v5 = -1;
  }
  else
  {
    v5 = 0;
  }
  v6 = (unint64_t)fmax(fmin((double)(-[UIKeyShortcutHUDMetrics maxNumberOfCellsPerColumn](self, "maxNumberOfCellsPerColumn")+ v5), (double)-[UIKeyShortcutHUDMetrics maxNumberOfCellsPerColumn](self, "maxNumberOfCellsPerColumn")), 2.0);

  return v6;
}

- (unint64_t)baseNumberOfVisibleColumns
{
  return 3;
}

- (unint64_t)maxNumberOfCellsPerColumn
{
  return 6;
}

- (double)standardHUDWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  -[UIKeyShortcutHUDMetrics minShortcutCellWidth](self, "minShortcutCellWidth");
  v4 = v3 * (double)-[UIKeyShortcutHUDMetrics baseNumberOfVisibleColumns](self, "baseNumberOfVisibleColumns");
  -[UIKeyShortcutHUDMetrics menuColumnSpacing](self, "menuColumnSpacing");
  v6 = v4 + v5 * (double)(-[UIKeyShortcutHUDMetrics baseNumberOfVisibleColumns](self, "baseNumberOfVisibleColumns") - 1);
  -[UIKeyShortcutHUDMetrics menuHorizontalContentInset](self, "menuHorizontalContentInset");
  v8 = v7 + v7 + v6;
  -[UIKeyShortcutHUDMetrics computedHUDWidthForBaseMenu](self, "computedHUDWidthForBaseMenu");
  if (v8 < result)
    return v8;
  return result;
}

- (double)searchModeStandardHUDWidth
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 327.0);
  return result;
}

- (double)standardMenuToolbarSpacing
{
  return 20.0;
}

- (double)minimumScreenEdgeDistance
{
  return 15.0;
}

- (double)minimumBottomScreenEdgeDistance
{
  return 12.0;
}

- (UIVisualEffect)platterVisualEffect
{
  return (UIVisualEffect *)+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", -[UIKeyShortcutHUDMetrics hudBlurStyle](self, "hudBlurStyle"));
}

- (double)platterZPosition
{
  return 0.0;
}

- (NSDictionary)platterSeparatedOptions
{
  return 0;
}

- (double)menuPlatterCornerRadius
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 12.0);
  return result;
}

- (double)toolbarPlatterCornerRadius
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 12.0);
  return result;
}

- (double)standardPlatterStrokeWidth
{
  double v2;

  -[UITraitCollection displayScale](self->_traitCollection, "displayScale");
  return 1.0 / v2;
}

- (double)platterShadowRadius
{
  return 15.0;
}

- (double)platterShadowOpacity
{
  return 0.2;
}

- (double)standardMenuPanelHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[UIKeyShortcutHUDMetrics menuCellHeight](self, "menuCellHeight");
  v4 = v3;
  -[UIKeyShortcutHUDMetrics menuCellHeight](self, "menuCellHeight");
  v6 = v4 + v5 * (double)-[UIKeyShortcutHUDMetrics numCellsPerColumn](self, "numCellsPerColumn");
  -[UIKeyShortcutHUDMetrics menuTopContentInset](self, "menuTopContentInset");
  v8 = v7 + v6;
  -[UIKeyShortcutHUDMetrics menuBottomContentInset](self, "menuBottomContentInset");
  return v9 + v8;
}

- (double)searchModeMaximumMenuPanelHeight
{
  double v2;
  double result;

  -[UIKeyShortcutHUDMetrics availableVerticalSpace](self, "availableVerticalSpace");
  result = v2 * 0.75;
  if (result > 520.0)
    return 520.0;
  return result;
}

- (double)searchModePreferredMenuPanelWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[UIKeyShortcutHUDMetrics menuHorizontalContentInset](self, "menuHorizontalContentInset");
  v4 = v3;
  -[UIKeyShortcutHUDMetrics searchModeStandardHUDWidth](self, "searchModeStandardHUDWidth");
  v6 = v5 - v4;
  -[_UIKeyShortcutHUDShortcutColumnMetrics columnWidth](self->_displayedSearchColumnMetrics, "columnWidth");
  v8 = v7;
  -[UIKeyShortcutHUDMetrics maxShortcutCellWidth](self, "maxShortcutCellWidth");
  return v4 + fmax(v6, fmin(v8, v9));
}

- (double)hiddenMenuPanelHeight
{
  return 1.0;
}

- (unint64_t)menuPanelCornerMask
{
  return 15;
}

- (double)standardToolbarContentHeight
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 51.0);
  return result;
}

- (BOOL)shouldExtendToolbarThroughSafeArea
{
  return 0;
}

- (unint64_t)toolbarPanelCornerMask
{
  return 15;
}

- (double)_toolbarContentToWindowBottomEdgeSpacing
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[UIKeyShortcutHUDMetrics minimumBottomScreenEdgeDistance](self, "minimumBottomScreenEdgeDistance");
  v4 = v3;
  -[UIKeyShortcutHUDMetrics selfSizingPlayground](self, "selfSizingPlayground");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = fmax(v4, v7);

  return v8;
}

- (double)_toolbarDistanceFromBottomOfWindow
{
  double result;

  if (-[UIKeyShortcutHUDMetrics shouldExtendToolbarThroughSafeArea](self, "shouldExtendToolbarThroughSafeArea"))
    return 0.0;
  -[UIKeyShortcutHUDMetrics _toolbarContentToWindowBottomEdgeSpacing](self, "_toolbarContentToWindowBottomEdgeSpacing");
  return result;
}

- (double)_toolbarHeight
{
  double v3;
  double v4;
  double v5;

  -[UIKeyShortcutHUDMetrics standardToolbarContentHeight](self, "standardToolbarContentHeight");
  v4 = v3;
  if (-[UIKeyShortcutHUDMetrics shouldExtendToolbarThroughSafeArea](self, "shouldExtendToolbarThroughSafeArea"))
  {
    -[UIKeyShortcutHUDMetrics _toolbarContentToWindowBottomEdgeSpacing](self, "_toolbarContentToWindowBottomEdgeSpacing");
    return v4 + v5;
  }
  return v4;
}

- (unint64_t)maxNumberOfCellsInSearchResults
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[UIKeyShortcutHUDMetrics searchModeMaximumMenuPanelHeight](self, "searchModeMaximumMenuPanelHeight");
  v4 = v3;
  -[UIKeyShortcutHUDMetrics searchModeMenuTopContentInset](self, "searchModeMenuTopContentInset");
  v6 = v5;
  -[UIKeyShortcutHUDMetrics searchModeMenuBottomContentInset](self, "searchModeMenuBottomContentInset");
  v8 = v4 - (v6 + v7);
  -[UIKeyShortcutHUDMetrics menuCellHeight](self, "menuCellHeight");
  return (unint64_t)(v8 / v9);
}

- (BOOL)shouldAlignShortcutModifiersAndInputInColumn
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_clientTraits);
  v3 = objc_msgSend(WeakRetained, "layoutDirection") == 1;

  return v3;
}

- (double)standardMenuPadding
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 20.0);
  return result;
}

- (double)menuHorizontalContentInset
{
  double v3;
  double v4;
  double v5;

  -[UIKeyShortcutHUDMetrics standardMenuPadding](self, "standardMenuPadding");
  v4 = v3;
  -[UIKeyShortcutHUDMetrics menuCellHorizontalContentMargin](self, "menuCellHorizontalContentMargin");
  return v4 - v5;
}

- (double)menuTopContentInset
{
  double v3;
  double v4;
  double v5;

  -[UIKeyShortcutHUDMetrics menuBaseVerticalContentInset](self, "menuBaseVerticalContentInset");
  v4 = v3;
  -[UIKeyShortcutHUDMetrics categoryHeaderVerticalTextAdjustment](self, "categoryHeaderVerticalTextAdjustment");
  return v4 - v5;
}

- (double)searchModeMenuBaseVerticalContentInset
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 12.0);
  return result;
}

- (double)searchModeMenuTopContentInset
{
  double v3;
  double v4;
  double v5;

  -[UIKeyShortcutHUDMetrics searchModeMenuBaseVerticalContentInset](self, "searchModeMenuBaseVerticalContentInset");
  v4 = v3;
  -[UIKeyShortcutHUDMetrics categoryHeaderVerticalTextAdjustment](self, "categoryHeaderVerticalTextAdjustment");
  return v4 - v5;
}

- (double)menuColumnSpacing
{
  double v3;
  double v4;
  double v5;

  -[UIKeyShortcutHUDMetrics standardMenuPadding](self, "standardMenuPadding");
  v4 = v3;
  -[UIKeyShortcutHUDMetrics menuCellHorizontalContentMargin](self, "menuCellHorizontalContentMargin");
  return v4 - (v5 + v5);
}

- (double)toolbarContentInset
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 4.0);
  return result;
}

- (BOOL)toolbarStylesCategoriesAsPageControl
{
  return 0;
}

- (double)separatorWidth
{
  return 1.0;
}

- (UIColor)menuSeparatorColor
{
  return +[UIColor separatorColor](UIColor, "separatorColor");
}

- (UIVisualEffect)menuSeparatorVisualEffect
{
  void *v2;
  void *v3;

  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", -[UIKeyShortcutHUDMetrics hudBlurStyle](self, "hudBlurStyle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v2, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIVisualEffect *)v3;
}

- (double)toolbarSeparatorVerticalMargin
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 13.0);
  return result;
}

- (UIColor)toolbarSeparatorColor
{
  return +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
}

- (UIVisualEffect)toolbarSeparatorVisualEffect
{
  return 0;
}

- (unint64_t)categoryIndexAtHorizontalOffset:(double)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  v5 = -[NSMutableArray count](self->_displayedMenuCategoryOffsets, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      v8 = (v7 + v6) >> 1;
      -[NSMutableArray objectAtIndexedSubscript:](self->_displayedMenuCategoryOffsets, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      if (v11 <= a3)
      {
        if (v8 == -[NSMutableArray count](self->_displayedMenuCategoryOffsets, "count") - 1)
          return v8;
        -[NSMutableArray objectAtIndexedSubscript:](self->_displayedMenuCategoryOffsets, "objectAtIndexedSubscript:", v8 + 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        v7 = (v7 + v6) >> 1;
        if (v14 > a3)
          return v8;
      }
      else
      {
        v6 = (v7 + v6) >> 1;
        v8 = v7;
      }
      if (v6 == v7)
        return v8;
    }
  }
  return 0;
}

- (double)horizontalOffsetForCategoryAtIndex:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->_displayedMenuCategoryOffsets, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)menuCellHorizontalContentMargin
{
  return 10.0;
}

- (double)minShortcutNameKeyCombinationSpacing
{
  return 25.0;
}

- (double)standardShortcutInputReservedWidth
{
  return 20.0;
}

- (double)standardShortcutModifierInputMinimumSpacing
{
  return 3.0;
}

- (double)shortcutTitleToSubtitleVerticalPadding
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", -1.5);
  return result;
}

- (double)cellFlashDuration
{
  return 0.1;
}

- (double)menuCellCornerRadius
{
  double v3;
  double v4;
  double v5;

  -[UIKeyShortcutHUDMetrics menuPlatterCornerRadius](self, "menuPlatterCornerRadius");
  v4 = v3;
  -[UIKeyShortcutHUDMetrics menuHorizontalContentInset](self, "menuHorizontalContentInset");
  return v4 - v5;
}

- (double)toolbarCellCornerRadius
{
  double v3;
  double v4;
  double v5;

  -[UIKeyShortcutHUDMetrics toolbarPlatterCornerRadius](self, "toolbarPlatterCornerRadius");
  v4 = v3;
  -[UIKeyShortcutHUDMetrics toolbarContentInset](self, "toolbarContentInset");
  return v4 - v5;
}

- (double)categoryHeaderVerticalTextAdjustment
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 5.0);
  return result;
}

- (int64_t)hudBlurStyle
{
  return 8;
}

- (UIColor)platterStrokeColor
{
  return +[UIColor systemFillColor](UIColor, "systemFillColor");
}

- (UIColor)standardHUDTextColor
{
  if (qword_1ECD7E898 != -1)
    dispatch_once(&qword_1ECD7E898, &__block_literal_global_24_3);
  return (UIColor *)(id)qword_1ECD7E890;
}

void __47__UIKeyShortcutHUDMetrics_standardHUDTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_26_3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7E890;
  qword_1ECD7E890 = v0;

}

id __47__UIKeyShortcutHUDMetrics_standardHUDTextColor__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = objc_msgSend(a2, "accessibilityContrast");
  +[UIColor labelColor](UIColor, "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2 == 1)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "colorWithAlphaComponent:", 0.85);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (UIColor)shortcutSubtitleTextColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (UIColor)searchHUDTextColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (UIFont)standardHUDFont
{
  if (qword_1ECD7E8A8 != -1)
    dispatch_once(&qword_1ECD7E8A8, &__block_literal_global_27_2);
  return (UIFont *)(id)qword_1ECD7E8A0;
}

void __42__UIKeyShortcutHUDMetrics_standardHUDFont__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7E8A0;
  qword_1ECD7E8A0 = v0;

}

- (UIFont)shortcutSubtitleFont
{
  if (qword_1ECD7E8B8 != -1)
    dispatch_once(&qword_1ECD7E8B8, &__block_literal_global_29_2);
  return (UIFont *)(id)qword_1ECD7E8B0;
}

void __47__UIKeyShortcutHUDMetrics_shortcutSubtitleFont__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption2"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7E8B0;
  qword_1ECD7E8B0 = v0;

}

- (UIFont)categoryHeaderFont
{
  if (qword_1ECD7E8C8 != -1)
    dispatch_once(&qword_1ECD7E8C8, &__block_literal_global_30_2);
  return (UIFont *)(id)qword_1ECD7E8C0;
}

void __45__UIKeyShortcutHUDMetrics_categoryHeaderFont__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedTitle2"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7E8C0;
  qword_1ECD7E8C0 = v0;

}

- (UIFont)keyShortcutInputCharacterFont
{
  if (qword_1ECD7E8D8 != -1)
    dispatch_once(&qword_1ECD7E8D8, &__block_literal_global_31_4);
  return (UIFont *)(id)qword_1ECD7E8D0;
}

void __56__UIKeyShortcutHUDMetrics_keyShortcutInputCharacterFont__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:", CFSTR("UICTFontTextStyleBody"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)off_1E167DBE8;
  v6[0] = &unk_1E1A936C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontDescriptorByAddingAttributes:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v2, 0.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ECD7E8D0;
  qword_1ECD7E8D0 = v3;

}

- (UIFont)cancelButtonFont
{
  if (qword_1ECD7E8E8 != -1)
    dispatch_once(&qword_1ECD7E8E8, &__block_literal_global_36_2);
  return (UIFont *)(id)qword_1ECD7E8E0;
}

void __43__UIKeyShortcutHUDMetrics_cancelButtonFont__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7E8E0;
  qword_1ECD7E8E0 = v0;

}

- (UIFont)toolbarCategoryVisibleFont
{
  if (qword_1ECD7E8F8 != -1)
    dispatch_once(&qword_1ECD7E8F8, &__block_literal_global_37_1);
  return (UIFont *)(id)qword_1ECD7E8F0;
}

void __53__UIKeyShortcutHUDMetrics_toolbarCategoryVisibleFont__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleEmphasizedBody"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7E8F0;
  qword_1ECD7E8F0 = v0;

}

- (double)minShortcutCellWidth
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 250.0);
  return result;
}

- (double)maxShortcutCellWidth
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 500.0);
  return result;
}

- (double)menuCellHeight
{
  double result;

  -[UIKeyShortcutHUDMetrics contentSizeScaledMetric:](self, "contentSizeScaledMetric:", 45.0);
  return result;
}

- (double)cellWidthForShortcut:(id)a3
{
  double result;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  if (self->_searching)
  {
    -[UIKeyShortcutHUDMetrics minShortcutCellWidth](self, "minShortcutCellWidth", a3);
  }
  else
  {
    -[NSMapTable objectForKey:](self->_shortcutCellIndexPathsMap, "objectForKey:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "item");
    v7 = v6 / -[UIKeyShortcutHUDMetrics numCellsPerColumn](self, "numCellsPerColumn");
    -[NSMutableArray objectAtIndexedSubscript:](self->_displayedMenuColumnMetrics, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "columnWidth");
    v11 = v10;

    -[UIKeyShortcutHUDMetrics minShortcutCellWidth](self, "minShortcutCellWidth");
    v13 = v12;
    -[UIKeyShortcutHUDMetrics maxShortcutCellWidth](self, "maxShortcutCellWidth");
    v15 = fmax(v13, fmin(v11, v14));

    return v15;
  }
  return result;
}

- (double)modifiersWidthForShortcut:(id)a3
{
  double result;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  if (self->_searching)
  {
    -[_UIKeyShortcutHUDShortcutColumnMetrics modifiersWidth](self->_displayedSearchColumnMetrics, "modifiersWidth", a3);
  }
  else
  {
    -[NSMapTable objectForKey:](self->_shortcutCellIndexPathsMap, "objectForKey:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "item");
    v7 = v6 / -[UIKeyShortcutHUDMetrics numCellsPerColumn](self, "numCellsPerColumn");
    -[NSMutableArray objectAtIndexedSubscript:](self->_displayedMenuColumnMetrics, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modifiersWidth");
    v11 = v10;

    return v11;
  }
  return result;
}

- (double)inputWidthForShortcut:(id)a3
{
  double result;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  if (self->_searching)
  {
    -[_UIKeyShortcutHUDShortcutColumnMetrics inputWidth](self->_displayedSearchColumnMetrics, "inputWidth", a3);
  }
  else
  {
    -[NSMapTable objectForKey:](self->_shortcutCellIndexPathsMap, "objectForKey:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "item");
    v7 = v6 / -[UIKeyShortcutHUDMetrics numCellsPerColumn](self, "numCellsPerColumn");
    -[NSMutableArray objectAtIndexedSubscript:](self->_displayedMenuColumnMetrics, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inputWidth");
    v11 = v10;

    return v11;
  }
  return result;
}

- (double)headerWidthForCategory:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEmpty"))
  {
    -[UIKeyShortcutHUDMetrics emptyColumnWidth](self, "emptyColumnWidth");
    v6 = v5;
  }
  else
  {
    objc_msgSend(v4, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyShortcutHUDMetrics cellWidthForShortcut:](self, "cellWidthForShortcut:", v8);
    v6 = v9;

  }
  return v6;
}

- (unint64_t)numCellsPerColumn
{
  return self->_numCellsPerColumn;
}

- (double)searchModePreferredMenuPanelHeight
{
  return self->_searchModePreferredMenuPanelHeight;
}

- (double)displayedMenuContentWidth
{
  return self->_displayedMenuContentWidth;
}

- (BOOL)shouldMirrorShortcutInputs
{
  return self->_shouldMirrorShortcutInputs;
}

- (BOOL)shouldDisplayEscShortcutAlternative
{
  return self->_shouldDisplayEscShortcutAlternative;
}

- (BOOL)shouldDisplayGlobeModiferAsGlobeSymbol
{
  return self->_shouldDisplayGlobeModiferAsGlobeSymbol;
}

- (double)searchButtonWidth
{
  return self->_searchButtonWidth;
}

- (double)widestToolbarCategoryCellWidth
{
  return self->_widestToolbarCategoryCellWidth;
}

- (NSMapTable)shortcutCellMetricsMap
{
  return self->_shortcutCellMetricsMap;
}

- (void)setShortcutCellMetricsMap:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutCellMetricsMap, a3);
}

- (NSMapTable)shortcutCellIndexPathsMap
{
  return self->_shortcutCellIndexPathsMap;
}

- (void)setShortcutCellIndexPathsMap:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutCellIndexPathsMap, a3);
}

- (double)computedHUDWidthForBaseMenu
{
  return self->_computedHUDWidthForBaseMenu;
}

- (void)setComputedHUDWidthForBaseMenu:(double)a3
{
  self->_computedHUDWidthForBaseMenu = a3;
}

- (_UIKeyShortcutHUDMenu)displayedMenu
{
  return self->_displayedMenu;
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (BOOL)areShortcutAndAlternateColumnWidthsCombined
{
  return self->_combinedShortcutAndAlternateColumnWidths;
}

- (NSMutableArray)displayedMenuColumnMetrics
{
  return self->_displayedMenuColumnMetrics;
}

- (void)setDisplayedMenuColumnMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_displayedMenuColumnMetrics, a3);
}

- (NSMutableArray)displayedMenuCategoryOffsets
{
  return self->_displayedMenuCategoryOffsets;
}

- (void)setDisplayedMenuCategoryOffsets:(id)a3
{
  objc_storeStrong((id *)&self->_displayedMenuCategoryOffsets, a3);
}

- (_UIKeyShortcutHUDShortcutColumnMetrics)displayedSearchColumnMetrics
{
  return self->_displayedSearchColumnMetrics;
}

- (void)setDisplayedSearchColumnMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_displayedSearchColumnMetrics, a3);
}

- (_UIKeyShortcutHUDMenu)baseMenu
{
  return (_UIKeyShortcutHUDMenu *)objc_loadWeakRetained((id *)&self->_baseMenu);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (_UIKeyShortcutHUDClientTraits)clientTraits
{
  return (_UIKeyShortcutHUDClientTraits *)objc_loadWeakRetained((id *)&self->_clientTraits);
}

- (void)setClientTraits:(id)a3
{
  objc_storeWeak((id *)&self->_clientTraits, a3);
}

- (double)availableVerticalSpace
{
  return self->_availableVerticalSpace;
}

- (void)setAvailableVerticalSpace:(double)a3
{
  self->_availableVerticalSpace = a3;
}

- (UIView)selfSizingPlayground
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_selfSizingPlayground);
}

- (void)setSelfSizingPlayground:(id)a3
{
  objc_storeWeak((id *)&self->_selfSizingPlayground, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selfSizingPlayground);
  objc_destroyWeak((id *)&self->_clientTraits);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_destroyWeak((id *)&self->_baseMenu);
  objc_storeStrong((id *)&self->_displayedSearchColumnMetrics, 0);
  objc_storeStrong((id *)&self->_displayedMenuCategoryOffsets, 0);
  objc_storeStrong((id *)&self->_displayedMenuColumnMetrics, 0);
  objc_storeStrong((id *)&self->_displayedMenu, 0);
  objc_storeStrong((id *)&self->_shortcutCellIndexPathsMap, 0);
  objc_storeStrong((id *)&self->_shortcutCellMetricsMap, 0);
  objc_storeStrong((id *)&self->_selfSizingToolbarCategoryCell, 0);
  objc_storeStrong((id *)&self->_selfSizingSearchCell, 0);
  objc_storeStrong((id *)&self->_selfSizingShortcutCell, 0);
}

@end
