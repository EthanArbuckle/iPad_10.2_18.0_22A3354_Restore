@implementation SBHHomeScreenUsageMonitor

- (void)noteIconManagerRootFolderControllerViewDidDisappear
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogHomeScreenUsageMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "Root folder controller view did disappear", v4, 2u);
  }

  -[SBHHomeScreenUsageMonitor updateVisibilityReasons](self, "updateVisibilityReasons");
}

- (void)rootFolderControllerCurrentPageIndexDidChange:(id)a3
{
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBFolderController isScrolling](self->_rootFolderController, "isScrolling");
  SBLogHomeScreenUsageMonitor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_INFO, "root folder controller current page index did change (scrolling: %{BOOL}u)", (uint8_t *)v7, 8u);
  }

  if (v5)
    -[SBHHomeScreenUsageMonitor setCurrentPageIndexDidChangeWhileScrolling:](self, "setCurrentPageIndexDidChangeWhileScrolling:", 1);
  else
    -[SBHHomeScreenUsageMonitor noteCurrentPageIndexChanged:](self, "noteCurrentPageIndexChanged:", -[SBHHomeScreenUsageMonitor listModelIndexForRootFolderController:](self, "listModelIndexForRootFolderController:", v4));

}

- (void)rootFolderControllerDidEndScrolling:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  SBLogHomeScreenUsageMonitor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "root folder controller did end scrolling", v7, 2u);
  }

  if (-[SBHHomeScreenUsageMonitor currentPageIndexDidChangeWhileScrolling](self, "currentPageIndexDidChangeWhileScrolling"))
  {
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHHomeScreenUsageMonitor noteCurrentPageIndexChanged:](self, "noteCurrentPageIndexChanged:", -[SBHHomeScreenUsageMonitor listModelIndexForRootFolderController:](self, "listModelIndexForRootFolderController:", v6));
    -[SBHHomeScreenUsageMonitor setCurrentPageIndexDidChangeWhileScrolling:](self, "setCurrentPageIndexDidChangeWhileScrolling:", 0);

  }
}

- (void)setCurrentPageIndexDidChangeWhileScrolling:(BOOL)a3
{
  self->_currentPageIndexDidChangeWhileScrolling = a3;
}

- (void)noteCurrentPageIndexChanged:(unint64_t)a3
{
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "homeScreenUsageAggregator:didNoteCurrentPageIndexChanged:", self, a3, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[SBHHomeScreenUsageMonitor updateVisibleWidgetIcons](self, "updateVisibleWidgetIcons");
}

- (unint64_t)listModelIndexForRootFolderController:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "iconListModelIndexForPageIndex:", objc_msgSend(v3, "currentPageIndex"));

  return v4;
}

- (BOOL)currentPageIndexDidChangeWhileScrolling
{
  return self->_currentPageIndexDidChangeWhileScrolling;
}

- (void)noteIconManagerContentOccludedChanged
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogHomeScreenUsageMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "Icon manager content occluded changed", v4, 2u);
  }

  -[SBHHomeScreenUsageMonitor updateVisibilityReasons](self, "updateVisibilityReasons");
}

- (void)updateVisibilityReasons
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  -[SBHHomeScreenUsageMonitor iconManager](self, "iconManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "contentVisibility")
    || (objc_msgSend(v7, "isOverlayTodayViewVisible") & 1) != 0
    || objc_msgSend(v7, "isMainDisplayLibraryViewVisible"))
  {
    v3 = v7;
    v4 = 2;
  }
  else
  {
    v3 = v7;
    v4 = 0;
  }
  objc_msgSend(v3, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_appearState") == 0;

  -[SBHHomeScreenUsageMonitor setHomeScreenDisappearanceReasons:](self, "setHomeScreenDisappearanceReasons:", v4 | v6);
}

- (void)setHomeScreenDisappearanceReasons:(unint64_t)a3
{
  NSObject *v5;
  unint64_t homeScreenDisappearanceReasons;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogHomeScreenUsageMonitor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = a3;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "Set widget disappearance reasons: %lx", (uint8_t *)&v7, 0xCu);
  }

  homeScreenDisappearanceReasons = self->_homeScreenDisappearanceReasons;
  if (homeScreenDisappearanceReasons != a3)
  {
    self->_homeScreenDisappearanceReasons = a3;
    if ((a3 == 0) == (homeScreenDisappearanceReasons != 0))
      -[SBHHomeScreenUsageMonitor notifyForEveryHomeScreenWidgetVisibility](self, "notifyForEveryHomeScreenWidgetVisibility");
  }
}

- (SBHIconManager)iconManager
{
  return (SBHIconManager *)objc_loadWeakRetained((id *)&self->_iconManager);
}

- (void)notifyForEveryHomeScreenWidgetVisibility
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableSet *obj;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint8_t v29[128];
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = -[SBHHomeScreenUsageMonitor isContentVisible](self, "isContentVisible");
  SBLogHomeScreenUsageMonitor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (v3)
      v5 = CFSTR("visible");
    else
      v5 = CFSTR("gone");
    v6 = -[NSMutableSet count](self->_visibleHomeScreenWidgetIcons, "count");
    *(_DWORD *)buf = 138543618;
    v31 = v5;
    v32 = 2048;
    v33 = v6;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_INFO, "notifying that all home screen widgets are %{public}@: (%lu widgets)", buf, 0x16u);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_visibleHomeScreenWidgetIcons;
  v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(obj);
        v19 = v7;
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
        objc_msgSend(v8, "activeDataSource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = self->_observers;
        v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                if (v3)
                  objc_msgSend(v15, "homeScreenUsageAggregator:didNoteDataSourceDidAppear:forWidgetIcon:", self, v9, v8);
                else
                  objc_msgSend(v15, "homeScreenUsageAggregator:didNoteDataSourceDidDisappear:forWidgetIcon:", self, v9, v8);
              }
            }
            v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v12);
        }

        v7 = v19 + 1;
      }
      while (v19 + 1 != v18);
      v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v18);
  }

}

void __53__SBHHomeScreenUsageMonitor_updateVisibleWidgetIcons__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isWidgetIcon"))
  {
    objc_msgSend(v3, "addObserver:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

- (void)updateVisibleWidgetIcons
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  id v6;
  NSObject *v7;
  NSMutableSet *visibleHomeScreenWidgetIcons;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSHashTable *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSHashTable *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSMutableSet *obj;
  id obja;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  id v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint8_t v63[128];
  uint8_t buf[4];
  NSMutableSet *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  _BOOL4 v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  -[SBHHomeScreenUsageMonitor rootFolderController](self, "rootFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentIconListModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBHHomeScreenUsageMonitor isContentVisible](self, "isContentVisible");
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __53__SBHHomeScreenUsageMonitor_updateVisibleWidgetIcons__block_invoke;
  v58[3] = &unk_1E8D89418;
  v58[4] = self;
  v41 = v6;
  v59 = v41;
  objc_msgSend(v4, "enumerateIconsUsingBlock:", v58);
  SBLogHomeScreenUsageMonitor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    visibleHomeScreenWidgetIcons = self->_visibleHomeScreenWidgetIcons;
    *(_DWORD *)buf = 138412802;
    v65 = visibleHomeScreenWidgetIcons;
    v66 = 2112;
    v67 = v41;
    v68 = 1024;
    v69 = v5;
    _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_INFO, "update visible widget icons. old set: %@, new set: %@ (content visible: %{BOOL}u)", buf, 0x1Cu);
  }

  if (v5)
  {
    v33 = v4;
    v34 = v3;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = self->_visibleHomeScreenWidgetIcons;
    v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v55;
      v35 = *(_QWORD *)v55;
      do
      {
        v12 = 0;
        v37 = v10;
        do
        {
          if (*(_QWORD *)v55 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v12);
          if ((objc_msgSend(v41, "containsObject:", v13, v33, v34) & 1) == 0)
          {
            objc_msgSend(v13, "activeDataSource");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = 0u;
            v51 = 0u;
            v52 = 0u;
            v53 = 0u;
            v15 = self->_observers;
            v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v51;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v51 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    objc_msgSend(v20, "homeScreenUsageAggregator:didNoteDataSourceDidDisappear:forWidgetIcon:", self, v14, v13);
                }
                v17 = -[NSHashTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
              }
              while (v17);
            }

            v11 = v35;
            v10 = v37;
          }
          ++v12;
        }
        while (v12 != v10);
        v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
      }
      while (v10);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obja = v41;
    v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v47;
      v36 = *(_QWORD *)v47;
      do
      {
        v24 = 0;
        v38 = v22;
        do
        {
          if (*(_QWORD *)v47 != v23)
            objc_enumerationMutation(obja);
          v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v24);
          if ((-[NSMutableSet containsObject:](self->_visibleHomeScreenWidgetIcons, "containsObject:", v25, v33, v34) & 1) == 0)
          {
            objc_msgSend(v25, "activeDataSource");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = 0u;
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            v27 = self->_observers;
            v28 = -[NSHashTable countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v43;
              do
              {
                for (j = 0; j != v29; ++j)
                {
                  if (*(_QWORD *)v43 != v30)
                    objc_enumerationMutation(v27);
                  v32 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    objc_msgSend(v32, "homeScreenUsageAggregator:didNoteDataSourceDidAppear:forWidgetIcon:", self, v26, v25);
                }
                v29 = -[NSHashTable countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
              }
              while (v29);
            }

            v23 = v36;
            v22 = v38;
          }
          ++v24;
        }
        while (v24 != v22);
        v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
      }
      while (v22);
    }

    v4 = v33;
    v3 = v34;
  }
  -[NSMutableSet setSet:](self->_visibleHomeScreenWidgetIcons, "setSet:", v41, v33, v34);

}

- (BOOL)isContentVisible
{
  return -[SBHHomeScreenUsageMonitor homeScreenDisappearanceReasons](self, "homeScreenDisappearanceReasons") == 0;
}

- (unint64_t)homeScreenDisappearanceReasons
{
  return self->_homeScreenDisappearanceReasons;
}

- (SBFolderController)rootFolderController
{
  return self->_rootFolderController;
}

- (SBHHomeScreenUsageMonitor)initWithIconManager:(id)a3
{
  id v4;
  SBHHomeScreenUsageMonitor *v5;
  SBHHomeScreenUsageMonitor *v6;
  void *v7;
  NSMutableSet *v8;
  NSMutableSet *visibleHomeScreenWidgetIcons;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHHomeScreenUsageMonitor;
  v5 = -[SBHHomeScreenUsageMonitor init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconManager, v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_iconManagerDidChangeIconModel_, CFSTR("SBHIconManagerIconModelDidChange"), v4);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_iconManagerDidChangeRootViewController_, CFSTR("SBHIconManagerRootViewControllerDidChange"), v4);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_iconManagerEditingDidChange_, CFSTR("SBHIconManagerEditingStateChanged"), v4);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    visibleHomeScreenWidgetIcons = v6->_visibleHomeScreenWidgetIcons;
    v6->_visibleHomeScreenWidgetIcons = v8;

    v6->_homeScreenDisappearanceReasons = 1;
    -[SBHHomeScreenUsageMonitor resetIconModel](v6, "resetIconModel");
    -[SBHHomeScreenUsageMonitor resetRootFolderController](v6, "resetRootFolderController");

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBHHomeScreenUsageMonitor;
  -[SBHHomeScreenUsageMonitor dealloc](&v4, sel_dealloc);
}

- (void)resetIconModel
{
  void *v3;
  id v4;

  -[SBHHomeScreenUsageMonitor iconManager](self, "iconManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHHomeScreenUsageMonitor setIconModel:](self, "setIconModel:", v3);

}

- (void)setIconModel:(id)a3
{
  SBHIconModel *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  SBHIconModel *iconModel;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint8_t v32[128];
  uint8_t buf[4];
  SBHIconModel *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (SBHIconModel *)a3;
  SBLogHomeScreenUsageMonitor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v5;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_INFO, "Set icon model: %@", buf, 0xCu);
  }

  if (self->_iconModel != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (self->_iconModel)
    {
      objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("SBIconModelDidLayoutIconStateNotification"));
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      iconModel = self->_iconModel;
      objc_opt_self();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconModel iconsOfClass:](iconModel, "iconsOfClass:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v28 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "removeObserver:", self);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v13);
      }

    }
    objc_storeStrong((id *)&self->_iconModel, a3);
    -[SBHHomeScreenUsageMonitor updateVisibleWidgetIcons](self, "updateVisibleWidgetIcons");
    if (v5)
    {
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_iconModelDidLayOut_, CFSTR("SBIconModelDidLayoutIconStateNotification"), v5);
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_opt_self();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconModel iconsOfClass:](v5, "iconsOfClass:", v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v24 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "addObserver:", self);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v19);
      }

    }
  }
  -[SBHIconModel rootFolder](v5, "rootFolder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHHomeScreenUsageMonitor setRootFolder:](self, "setRootFolder:", v22);

}

- (void)setRootFolder:(id)a3
{
  SBRootFolder *v5;
  NSObject *v6;
  SBRootFolder *rootFolder;
  int v8;
  SBRootFolder *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (SBRootFolder *)a3;
  SBLogHomeScreenUsageMonitor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_INFO, "Set root folder: %@", (uint8_t *)&v8, 0xCu);
  }

  rootFolder = self->_rootFolder;
  if (rootFolder != v5)
  {
    -[SBFolder removeFolderObserver:](rootFolder, "removeFolderObserver:", self);
    objc_storeStrong((id *)&self->_rootFolder, a3);
    -[SBFolder addFolderObserver:](self->_rootFolder, "addFolderObserver:", self);
  }

}

- (void)resetRootFolderController
{
  void *v3;
  id v4;

  -[SBHHomeScreenUsageMonitor iconManager](self, "iconManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHHomeScreenUsageMonitor setRootFolderController:](self, "setRootFolderController:", v3);

}

- (void)setRootFolderController:(id)a3
{
  SBFolderController *v5;
  NSObject *v6;
  void *v7;
  int v8;
  SBFolderController *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (SBFolderController *)a3;
  SBLogHomeScreenUsageMonitor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_INFO, "Set root folder controller: %@", (uint8_t *)&v8, 0xCu);
  }

  if (self->_rootFolderController != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("SBFolderControllerCurrentPageIndexDidChangeNotification"), self->_rootFolderController);
    objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("SBFolderControllerDidEndScrollingNotification"), self->_rootFolderController);
    objc_storeStrong((id *)&self->_rootFolderController, a3);
    -[SBHHomeScreenUsageMonitor updateVisibleWidgetIcons](self, "updateVisibleWidgetIcons");
    if (v5)
    {
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_rootFolderControllerCurrentPageIndexDidChange_, CFSTR("SBFolderControllerCurrentPageIndexDidChangeNotification"), v5);
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_rootFolderControllerDidEndScrolling_, CFSTR("SBFolderControllerDidEndScrollingNotification"), v5);
    }

  }
}

- (void)noteIconManagerListLayoutProviderChanged
{
  NSObject *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  SBLogHomeScreenUsageMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "Icon manager list layout provider changed", buf, 2u);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_observers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "homeScreenUsageAggregatorDidNoteListLayoutProviderChanged:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (void)noteIconManagerRootFolderControllerViewWillAppear
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogHomeScreenUsageMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "Root folder controller view will appear", v4, 2u);
  }

  -[SBHHomeScreenUsageMonitor updateVisibilityReasons](self, "updateVisibilityReasons");
  -[SBHHomeScreenUsageMonitor notifyRootFolderControllerViewWillAppear](self, "notifyRootFolderControllerViewWillAppear");
}

- (void)notifyRootFolderControllerViewWillAppear
{
  void *v3;
  unint64_t v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SBHHomeScreenUsageMonitor rootFolderController](self, "rootFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBHHomeScreenUsageMonitor listModelIndexForRootFolderController:](self, "listModelIndexForRootFolderController:", v3);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "homeScreenUsageAggregator:didNoteRootControllerWillAppearWithPageIndex:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)noteIconManagerCoverSheetTodayViewDidAppear
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogHomeScreenUsageMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "Cover sheet today view did appear", v4, 2u);
  }

  -[SBHHomeScreenUsageMonitor notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:](self, "notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:", 1);
}

- (void)noteIconManagerCoverSheetTodayViewDidDisappear
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogHomeScreenUsageMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "Cover sheet today view did disappear", v4, 2u);
  }

  -[SBHHomeScreenUsageMonitor notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:](self, "notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:", 1);
}

- (void)noteIconManagerOverlayTodayViewDidAppear
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogHomeScreenUsageMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "Overlay today view did appear", v4, 2u);
  }

  -[SBHHomeScreenUsageMonitor updateVisibilityReasons](self, "updateVisibilityReasons");
  -[SBHHomeScreenUsageMonitor notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:](self, "notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:", 0);
}

- (void)noteIconManagerOverlayTodayViewDidDisappear
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogHomeScreenUsageMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "Overlay today view did disappear", v4, 2u);
  }

  -[SBHHomeScreenUsageMonitor updateVisibilityReasons](self, "updateVisibilityReasons");
  -[SBHHomeScreenUsageMonitor notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:](self, "notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:", 0);
}

- (void)noteIconManagerTodayViewAtLocation:(int64_t)a3 didScrollToRevealIcons:(id)a4
{
  id v6;
  NSObject *v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[16];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogHomeScreenUsageMonitor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_INFO, "Overlay today view did scroll to reveal icons", buf, 2u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_observers;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "homeScreenUsageAggregator:didNoteTodayViewAtLocation:scrolledWithIconVisibility:", self, a3, v6, (_QWORD)v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

}

- (void)noteWidgetDiscoverabilityStarted
{
  NSObject *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  SBLogHomeScreenUsageMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "Widget discoverability started", buf, 2u);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_observers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "homeScreenUsageAggregatorDidStartDiscoveringWidgets:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (void)noteWidgetDiscoverabilityDidAcceptSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogHomeScreenUsageMonitor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "Widget discoverability suggestions accepted", buf, 2u);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_observers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "homeScreenUsageAggregator:widgetDiscoverabilityDidAcceptSuggestion:", self, v4, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

}

- (void)noteWidgetDiscoverabilityDidRejectSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogHomeScreenUsageMonitor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "Widget discoverability suggestions rejected", buf, 2u);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_observers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "homeScreenUsageAggregator:widgetDiscoverabilityDidRejectSuggestion:", self, v4, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

}

- (void)noteWidgetDiscoverabilityDidEnterEditingMode
{
  NSObject *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  SBLogHomeScreenUsageMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "Widget discoverability entering editing mode", buf, 2u);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_observers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "homeScreenUsageAggregatorWidgetDiscoverabilityDidEnterEditingMode:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (void)noteAddWidgetSheetWillPresent
{
  NSObject *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  SBLogHomeScreenUsageMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "Add Widget sheet will present", buf, 2u);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_observers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "homeScreenUsageAggregatorAddWidgetSheetWillPresent:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (void)iconManagerDidChangeIconModel:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  SBLogHomeScreenUsageMonitor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_INFO, "icon manager did change icon model", v5, 2u);
  }

  -[SBHHomeScreenUsageMonitor resetIconModel](self, "resetIconModel");
}

- (void)iconManagerDidChangeRootViewController:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  SBLogHomeScreenUsageMonitor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_INFO, "icon manager did change root view controller", v5, 2u);
  }

  -[SBHHomeScreenUsageMonitor resetRootFolderController](self, "resetRootFolderController");
}

- (void)iconManagerEditingDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  SBLogHomeScreenUsageMonitor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_INFO, "icon manager editing did change", v6, 2u);
  }

  if (-[SBHHomeScreenUsageMonitor delayedLayoutDidChangeNotification](self, "delayedLayoutDidChangeNotification"))
  {
    -[SBHHomeScreenUsageMonitor setDelayedLayoutDidChangeNotification:](self, "setDelayedLayoutDidChangeNotification:", 0);
    -[SBHHomeScreenUsageMonitor noteLayoutChanged](self, "noteLayoutChanged");
  }
  -[SBHHomeScreenUsageMonitor iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEditing"))
    -[SBHHomeScreenUsageMonitor noteEditingModeEntered](self, "noteEditingModeEntered");

}

- (void)iconModelDidLayOut:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  SBLogHomeScreenUsageMonitor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "icon model did lay out", v8, 2u);
  }

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "rootFolder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHHomeScreenUsageMonitor setRootFolder:](self, "setRootFolder:", v7);

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)noteLayoutChanged
{
  void *v3;
  int v4;
  NSObject *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SBHHomeScreenUsageMonitor iconManager](self, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditing");

  if (v4)
  {
    -[SBHHomeScreenUsageMonitor setDelayedLayoutDidChangeNotification:](self, "setDelayedLayoutDidChangeNotification:", 1);
  }
  else
  {
    SBLogHomeScreenUsageMonitor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "notifying for home screen layout change", buf, 2u);
    }

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_observers;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "homeScreenUsageAggregatorDidNoteHomeScreenLayoutChanged:", self, (_QWORD)v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)noteEditingModeEntered
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "homeScreenUsageAggregatorDidNoteEditingModeEntered:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)noteWidgetIconAdded:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "addObserver:", self);
  objc_msgSend(v4, "activeDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBHHomeScreenUsageMonitor isContentVisible](self, "isContentVisible");
  -[SBHHomeScreenUsageMonitor iconManager](self, "iconManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDisplayingIcon:", v4);

  if (v7)
    -[NSMutableSet addObject:](self->_visibleHomeScreenWidgetIcons, "addObject:", v4);
  SBLogHomeScreenUsageMonitor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v22 = v4;
    v23 = 1024;
    v24 = v7;
    v25 = 1024;
    v26 = v5;
    _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_INFO, "notifying for added widget icon %@ (icon visible: %{BOOL}u, content visible: %{BOOL}u)", buf, 0x18u);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_observers;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "homeScreenUsageAggregator:didNoteWidgetIconAdded:", self, v4);
        if ((v5 & v7) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "homeScreenUsageAggregator:didNoteDataSourceDidAppear:forWidgetIcon:", self, v15, v4);
      }
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (void)noteWidgetIconRemoved:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  NSObject *v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "removeObserver:", self);
  objc_msgSend(v4, "activeDataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBHHomeScreenUsageMonitor isContentVisible](self, "isContentVisible");
  v6 = -[NSMutableSet containsObject:](self->_visibleHomeScreenWidgetIcons, "containsObject:", v4);
  -[NSMutableSet removeObject:](self->_visibleHomeScreenWidgetIcons, "removeObject:", v4);
  SBLogHomeScreenUsageMonitor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v21 = v4;
    v22 = 1024;
    v23 = v6;
    v24 = 1024;
    v25 = v5;
    _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_INFO, "notifying for removed widget icon %@ (icon visible: %{BOOL}u, content visible: %{BOOL}u)", buf, 0x18u);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_observers;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "homeScreenUsageAggregator:didNoteWidgetIconRemoved:", self, v4);
        if ((v5 & v6) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "homeScreenUsageAggregator:didNoteDataSourceDidDisappear:forWidgetIcon:", self, v14, v4);
      }
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)noteWidgetIconStack:(id)a3 changedActiveWidget:(id)a4
{
  id v6;
  _BOOL4 v7;
  int v8;
  id WeakRetained;
  int v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  NSUInteger v16;
  SBHHomeScreenUsageMonitor *v17;
  NSHashTable *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  int v41;
  __int16 v42;
  NSUInteger v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = a4;
  objc_msgSend(v6, "activeDataSource");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBHHomeScreenUsageMonitor isContentVisible](self, "isContentVisible");
  v28 = v6;
  v8 = v7 & -[NSMutableSet containsObject:](self->_visibleHomeScreenWidgetIcons, "containsObject:", v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
  v24 = WeakRetained;
  if ((objc_msgSend(WeakRetained, "isOverlayCoverSheetTodayViewVisible") & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(WeakRetained, "isOverlayTodayViewVisible", WeakRetained);
  -[SBHHomeScreenUsageMonitor rootFolder](self, "rootFolder", v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "todayList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "directlyContainsIcon:", v28);

  v14 = v8 | v10 & v13;
  SBLogHomeScreenUsageMonitor();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = -[NSHashTable count](self->_observers, "count");
    *(_DWORD *)buf = 138413314;
    v35 = v28;
    v36 = 1024;
    v37 = v8 | v10 & v13;
    v38 = 1024;
    v39 = v7;
    v40 = 1024;
    v41 = v10;
    v42 = 2048;
    v43 = v16;
    _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEFAULT, "notifying for widget icon active data source change %@ (icon visible: %{BOOL}u, content visible: %{BOOL}u, today view visible: %{BOOL}u, number of observers: %ld)", buf, 0x28u);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = self;
  v18 = self->_observers;
  v19 = -[NSHashTable countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v23, "homeScreenUsageAggregator:didNoteWidgetIconStackChangedActiveWidget:", v17, v28);
        if (v14)
        {
          if (v27 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v23, "homeScreenUsageAggregator:didNoteDataSourceDidDisappear:forWidgetIcon:", v17, v27, v28);
          if (v26 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v23, "homeScreenUsageAggregator:didNoteDataSourceDidAppear:forWidgetIcon:", v17, v26, v28);
        }
      }
      v20 = -[NSHashTable countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v20);
  }

}

- (void)noteUserAddedWidgetIconStackSuggestion:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "homeScreenUsageAggregator:didNoteUserAddedWidgetIconStackSuggestion:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)noteUserDislikedWidgetIconStackSuggestion:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "homeScreenUsageAggregator:didNoteUserDislikedWidgetIconStackSuggestion:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)noteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "homeScreenUsageAggregator:didNoteUserDislikedSiriSuggestionOnWidgetIconStackSuggestion:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)noteUserTappedWidgetIcon:(id)a3 withURL:(id)a4
{
  id v6;
  id v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_observers;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "homeScreenUsageAggregator:didNoteUserTappedWidgetIcon:withURL:", self, v6, v7, (_QWORD)v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)notifyForEveryTodayViewWidgetVisibilityOnCoverSheet:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  int v8;
  char *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  _QWORD v14[6];
  char v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  -[SBHHomeScreenUsageMonitor iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    v7 = objc_msgSend(v5, "isOverlayCoverSheetTodayViewVisible");
  else
    v7 = objc_msgSend(v5, "isOverlayTodayViewVisible");
  v8 = v7;
  v9 = sel_homeScreenUsageAggregator_didNoteDataSourceDidAppear_forWidgetIcon_;
  -[SBHHomeScreenUsageMonitor rootFolder](self, "rootFolder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "todayList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogHomeScreenUsageMonitor();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if (v8)
      v13 = CFSTR("visible");
    else
      v13 = CFSTR("gone");
    *(_DWORD *)buf = 138543618;
    v17 = v13;
    v18 = 2048;
    v19 = objc_msgSend(v11, "numberOfIcons");
    _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_INFO, "notifying that all today view widgets are %{public}@ (%lu widgets)", buf, 0x16u);
  }
  if (!v8)
    v9 = sel_homeScreenUsageAggregator_didNoteDataSourceDidDisappear_forWidgetIcon_;

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__SBHHomeScreenUsageMonitor_notifyForEveryTodayViewWidgetVisibilityOnCoverSheet___block_invoke;
  v14[3] = &unk_1E8D8C3E8;
  v14[4] = self;
  v14[5] = v9;
  v15 = v8;
  objc_msgSend(v11, "enumerateIconsUsingBlock:", v14);

}

void __81__SBHHomeScreenUsageMonitor_notifyForEveryTodayViewWidgetVisibilityOnCoverSheet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isWidgetIcon"))
  {
    v4 = v3;
    objc_msgSend(v4, "activeDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v12 = *(_QWORD *)(a1 + 32);
            if (*(_BYTE *)(a1 + 48))
              objc_msgSend(v11, "homeScreenUsageAggregator:didNoteDataSourceDidAppear:forWidgetIcon:", v12, v5, v4);
            else
              objc_msgSend(v11, "homeScreenUsageAggregator:didNoteDataSourceDidDisappear:forWidgetIcon:", v12, v5, v4, (_QWORD)v13);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v13, "isWidgetIcon"))
          -[SBHHomeScreenUsageMonitor noteWidgetIconAdded:](self, "noteWidgetIconAdded:", v13);
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
        if (objc_msgSend(v19, "isWidgetIcon", (_QWORD)v20))
          -[SBHHomeScreenUsageMonitor noteWidgetIconRemoved:](self, "noteWidgetIconRemoved:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v16);
  }

  -[SBHHomeScreenUsageMonitor noteLayoutChanged](self, "noteLayoutChanged");
}

- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v7;
  id v8;

  v8 = a4;
  v7 = a5;
  if (objc_msgSend(v7, "isWidgetIcon"))
    -[SBHHomeScreenUsageMonitor noteWidgetIconAdded:](self, "noteWidgetIconAdded:", v7);
  if (objc_msgSend(v8, "isWidgetIcon"))
    -[SBHHomeScreenUsageMonitor noteWidgetIconRemoved:](self, "noteWidgetIconRemoved:", v8);
  -[SBHHomeScreenUsageMonitor noteLayoutChanged](self, "noteLayoutChanged");

}

- (void)leafIcon:(id)a3 didChangeActiveDataSource:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "isWidgetIcon"))
    -[SBHHomeScreenUsageMonitor noteWidgetIconStack:changedActiveWidget:](self, "noteWidgetIconStack:changedActiveWidget:", v7, v6);

}

- (void)leafIcon:(id)a3 didAddIconDataSource:(id)a4
{
  if (objc_msgSend(a3, "isWidgetIcon"))
    -[SBHHomeScreenUsageMonitor noteLayoutChanged](self, "noteLayoutChanged");
}

- (void)leafIcon:(id)a3 didRemoveIconDataSource:(id)a4
{
  if (objc_msgSend(a3, "isWidgetIcon"))
    -[SBHHomeScreenUsageMonitor noteLayoutChanged](self, "noteLayoutChanged");
}

- (NSString)description
{
  return (NSString *)-[SBHHomeScreenUsageMonitor descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHHomeScreenUsageMonitor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBHHomeScreenUsageMonitor isContentVisible](self, "isContentVisible"), CFSTR("isContentVisible"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_visibleHomeScreenWidgetIcons, CFSTR("visibleWidgetIcons"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHHomeScreenUsageMonitor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (SBRootFolder)rootFolder
{
  return self->_rootFolder;
}

- (BOOL)delayedLayoutDidChangeNotification
{
  return self->_delayedLayoutDidChangeNotification;
}

- (void)setDelayedLayoutDidChangeNotification:(BOOL)a3
{
  self->_delayedLayoutDidChangeNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootFolderController, 0);
  objc_storeStrong((id *)&self->_rootFolder, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_destroyWeak((id *)&self->_iconManager);
  objc_storeStrong((id *)&self->_visibleHomeScreenWidgetIcons, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
