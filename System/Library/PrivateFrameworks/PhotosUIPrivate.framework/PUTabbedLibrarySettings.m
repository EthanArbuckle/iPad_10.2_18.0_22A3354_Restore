@implementation PUTabbedLibrarySettings

+ (PUTabbedLibrarySettings)sharedInstance
{
  if (sharedInstance_onceToken_91667 != -1)
    dispatch_once(&sharedInstance_onceToken_91667, &__block_literal_global_91668);
  return (PUTabbedLibrarySettings *)(id)sharedInstance_sharedInstance_91669;
}

- (BOOL)enableSharedTab
{
  return self->_enableSharedTab;
}

- (BOOL)enableSearchTab
{
  return self->_enableSearchTab;
}

- (BOOL)enablePrototypeTab
{
  return self->_enablePrototypeTab;
}

- (BOOL)enableForYouTab
{
  return self->_enableForYouTab;
}

- (BOOL)enableConsolidatedAlbumsTab
{
  return self->_enableConsolidatedAlbumsTab;
}

- (BOOL)enableBlankTab
{
  return self->_enableBlankTab;
}

- (BOOL)enableAlbumsTab
{
  return self->_enableAlbumsTab;
}

- (BOOL)isSidebarEnabled
{
  int64_t v2;
  void *v3;
  BOOL v4;

  v2 = -[PUTabbedLibrarySettings sidebarEnabledMode](self, "sidebarEnabledMode");
  if (v2 == 1)
    return 1;
  if (v2)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  return v4;
}

- (int64_t)sidebarEnabledMode
{
  return self->_sidebarEnabledMode;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUTabbedLibrarySettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PUTabbedLibrarySettings setEnableSharedTab:](self, "setEnableSharedTab:", 0);
  -[PUTabbedLibrarySettings setEnableForYouTab:](self, "setEnableForYouTab:", 1);
  -[PUTabbedLibrarySettings setEnableAlbumsTab:](self, "setEnableAlbumsTab:", 0);
  -[PUTabbedLibrarySettings setEnableSearchTab:](self, "setEnableSearchTab:", 1);
  -[PUTabbedLibrarySettings setEnableConsolidatedAlbumsTab:](self, "setEnableConsolidatedAlbumsTab:", 1);
  -[PUTabbedLibrarySettings setSidebarEnabledMode:](self, "setSidebarEnabledMode:", 0);
  -[PUTabbedLibrarySettings setSidebarAnimateSelectionUpdates:](self, "setSidebarAnimateSelectionUpdates:", 1);
  -[PUTabbedLibrarySettings setSidebarScrollSelectedItemToCenter:](self, "setSidebarScrollSelectedItemToCenter:", 1);
  -[PUTabbedLibrarySettings setSidebarOnlyScrollOffscreenItemOnScreen:](self, "setSidebarOnlyScrollOffscreenItemOnScreen:", 1);
  -[PUTabbedLibrarySettings setSidebarAnimateDataSourceUpdates:](self, "setSidebarAnimateDataSourceUpdates:", 1);
  -[PUTabbedLibrarySettings setSidebarUseMacStructure:](self, "setSidebarUseMacStructure:", 0);
  -[PUTabbedLibrarySettings setSidebarEditAutoExpandToEditableItem:](self, "setSidebarEditAutoExpandToEditableItem:", 1);
  -[PUTabbedLibrarySettings setSidebarHideNavBackButtonForSelectedItem:](self, "setSidebarHideNavBackButtonForSelectedItem:", 1);
  -[PUTabbedLibrarySettings setSidebarLaunchLoadMode:](self, "setSidebarLaunchLoadMode:", 3);
  -[PUTabbedLibrarySettings setSidebarLaunchAnimateLoad:](self, "setSidebarLaunchAnimateLoad:", 1);
  -[PUTabbedLibrarySettings setSidebarSymbolImagesOnly:](self, "setSidebarSymbolImagesOnly:", 0);
  -[PUTabbedLibrarySettings setSidebarSimulateNonIncrementalChanges:](self, "setSidebarSimulateNonIncrementalChanges:", 0);
  -[PUTabbedLibrarySettings setSidebarPauseChangeProcessingWhenHidden:](self, "setSidebarPauseChangeProcessingWhenHidden:", 1);
  -[PUTabbedLibrarySettings setSidebarPausedChangeDetailsBufferLength:](self, "setSidebarPausedChangeDetailsBufferLength:", 5);
}

- (void)setSidebarUseMacStructure:(BOOL)a3
{
  self->_sidebarUseMacStructure = a3;
}

- (void)setSidebarSymbolImagesOnly:(BOOL)a3
{
  self->_sidebarSymbolImagesOnly = a3;
}

- (void)setSidebarSimulateNonIncrementalChanges:(BOOL)a3
{
  self->_sidebarSimulateNonIncrementalChanges = a3;
}

- (void)setSidebarScrollSelectedItemToCenter:(BOOL)a3
{
  self->_sidebarScrollSelectedItemToCenter = a3;
}

- (void)setSidebarPausedChangeDetailsBufferLength:(int64_t)a3
{
  self->_sidebarPausedChangeDetailsBufferLength = a3;
}

- (void)setSidebarPauseChangeProcessingWhenHidden:(BOOL)a3
{
  self->_sidebarPauseChangeProcessingWhenHidden = a3;
}

- (void)setSidebarOnlyScrollOffscreenItemOnScreen:(BOOL)a3
{
  self->_sidebarOnlyScrollOffscreenItemOnScreen = a3;
}

- (void)setSidebarLaunchLoadMode:(int64_t)a3
{
  self->_sidebarLaunchLoadMode = a3;
}

- (void)setSidebarLaunchAnimateLoad:(BOOL)a3
{
  self->_sidebarLaunchAnimateLoad = a3;
}

- (void)setSidebarHideNavBackButtonForSelectedItem:(BOOL)a3
{
  self->_sidebarHideNavBackButtonForSelectedItem = a3;
}

- (void)setSidebarEnabledMode:(int64_t)a3
{
  self->_sidebarEnabledMode = a3;
}

- (void)setSidebarEditAutoExpandToEditableItem:(BOOL)a3
{
  self->_sidebarEditAutoExpandToEditableItem = a3;
}

- (void)setSidebarAnimateSelectionUpdates:(BOOL)a3
{
  self->_sidebarAnimateSelectionUpdates = a3;
}

- (void)setSidebarAnimateDataSourceUpdates:(BOOL)a3
{
  self->_sidebarAnimateDataSourceUpdates = a3;
}

- (void)setEnableSharedTab:(BOOL)a3
{
  self->_enableSharedTab = a3;
}

- (void)setEnableSearchTab:(BOOL)a3
{
  self->_enableSearchTab = a3;
}

- (void)setEnableForYouTab:(BOOL)a3
{
  self->_enableForYouTab = a3;
}

- (void)setEnableConsolidatedAlbumsTab:(BOOL)a3
{
  self->_enableConsolidatedAlbumsTab = a3;
}

- (void)setEnableAlbumsTab:(BOOL)a3
{
  self->_enableAlbumsTab = a3;
}

void __41__PUTabbedLibrarySettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabbedLibrarySettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_91669;
  sharedInstance_sharedInstance_91669 = v0;

}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (id)allTabs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUTabbedLibrarySettings enableSharedTab](self, "enableSharedTab"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUTabbedLibrarySettings enableAlbumsTab](self, "enableAlbumsTab", v3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUTabbedLibrarySettings enableForYouTab](self, "enableForYouTab"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUTabbedLibrarySettings enableSearchTab](self, "enableSearchTab"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUTabbedLibrarySettings enableConsolidatedAlbumsTab](self, "enableConsolidatedAlbumsTab"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)countOfEnabledTabs
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PUTabbedLibrarySettings allTabs](self, "allTabs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXReduce();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

- (void)setEnablePrototypeTab:(BOOL)a3
{
  self->_enablePrototypeTab = a3;
}

- (void)setEnableBlankTab:(BOOL)a3
{
  self->_enableBlankTab = a3;
}

- (BOOL)sidebarAnimateSelectionUpdates
{
  return self->_sidebarAnimateSelectionUpdates;
}

- (BOOL)sidebarScrollSelectedItemToCenter
{
  return self->_sidebarScrollSelectedItemToCenter;
}

- (BOOL)sidebarOnlyScrollOffscreenItemOnScreen
{
  return self->_sidebarOnlyScrollOffscreenItemOnScreen;
}

- (BOOL)sidebarAnimateDataSourceUpdates
{
  return self->_sidebarAnimateDataSourceUpdates;
}

- (BOOL)sidebarUseMacStructure
{
  return self->_sidebarUseMacStructure;
}

- (BOOL)sidebarEditAutoExpandToEditableItem
{
  return self->_sidebarEditAutoExpandToEditableItem;
}

- (BOOL)sidebarHideNavBackButtonForSelectedItem
{
  return self->_sidebarHideNavBackButtonForSelectedItem;
}

- (int64_t)sidebarLaunchLoadMode
{
  return self->_sidebarLaunchLoadMode;
}

- (BOOL)sidebarLaunchAnimateLoad
{
  return self->_sidebarLaunchAnimateLoad;
}

- (BOOL)sidebarSymbolImagesOnly
{
  return self->_sidebarSymbolImagesOnly;
}

- (BOOL)sidebarSimulateNonIncrementalChanges
{
  return self->_sidebarSimulateNonIncrementalChanges;
}

- (BOOL)sidebarPauseChangeProcessingWhenHidden
{
  return self->_sidebarPauseChangeProcessingWhenHidden;
}

- (int64_t)sidebarPausedChangeDetailsBufferLength
{
  return self->_sidebarPausedChangeDetailsBufferLength;
}

uint64_t __45__PUTabbedLibrarySettings_countOfEnabledTabs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  unsigned int v6;

  v4 = a2;
  v5 = objc_msgSend(a3, "integerValue");
  v6 = objc_msgSend(v4, "BOOLValue");

  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5 + v6);
}

+ (id)transientProperties
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___PUTabbedLibrarySettings;
  objc_msgSendSuper2(&v5, sel_transientProperties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("sidebarEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)settingsControllerModule
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
  void *v14;
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
  void *v27;
  void *v28;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
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
  void *v59;
  void *v60;
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
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  _QWORD v102[3];
  _QWORD v103[2];
  _QWORD v104[14];
  _QWORD v105[9];

  v105[7] = *MEMORY[0x1E0C80C00];
  v100 = (void *)MEMORY[0x1E0D83078];
  v2 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enablePrototypeTab);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:valueKeyPath:", CFSTR("Prototype"), v98);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "valueValidator:", &__block_literal_global_130);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = v94;
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableForYouTab);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("For You Tab"), v92);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "valueValidator:", &__block_literal_global_130);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v105[1] = v88;
  v4 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableSearchTab);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Search Tab"), v86);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "valueValidator:", &__block_literal_global_130);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v105[2] = v82;
  v5 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableConsolidatedAlbumsTab);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("Consolidated Albums Tab"), v80);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "valueValidator:", &__block_literal_global_130);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v105[3] = v76;
  v6 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableBlankTab);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Blank Tab"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueValidator:", &__block_literal_global_130);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v105[4] = v9;
  v10 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableSharedTab);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:valueKeyPath:", CFSTR("Shared Tab"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueValidator:", &__block_literal_global_130);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v105[5] = v13;
  v14 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_enableAlbumsTab);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:valueKeyPath:", CFSTR("Albums Tab"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueValidator:", &__block_literal_global_130);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v105[6] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "sectionWithRows:title:", v18, CFSTR("Tabs (Max: 5)"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sidebarEnabled == YES"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Sidebar Mode"), CFSTR("sidebarEnabledMode"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "possibleValues:titles:", &unk_1E59BA960, &unk_1E59BA978);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = v97;
  v20 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_sidebarAnimateSelectionUpdates);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:valueKeyPath:", CFSTR("Animate sidebar selection updates"), v95);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "condition:", v19);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v104[1] = v91;
  v21 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_sidebarScrollSelectedItemToCenter);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:valueKeyPath:", CFSTR("Scroll selected item to center"), v89);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "condition:", v19);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v104[2] = v85;
  v22 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_sidebarOnlyScrollOffscreenItemOnScreen);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:valueKeyPath:", CFSTR("Only scroll offscreen items onto screen"), v83);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB3528];
  v103[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sidebarScrollSelectedItemToCenter == YES"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v81;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 2);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "andPredicateWithSubpredicates:", v77);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "condition:", v75);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v104[3] = v74;
  v24 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_sidebarAnimateDataSourceUpdates);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:valueKeyPath:", CFSTR("Animate data source updates"), v73);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "condition:", v19);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v104[4] = v69;
  v25 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_sidebarUseMacStructure);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rowWithTitle:valueKeyPath:", CFSTR("Use macOS structure"), v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "condition:", v19);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v104[5] = v66;
  v26 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_sidebarEditAutoExpandToEditableItem);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rowWithTitle:valueKeyPath:", CFSTR("Edit reveals editable item"), v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "condition:", v19);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v104[6] = v63;
  v27 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_sidebarHideNavBackButtonForSelectedItem);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rowWithTitle:valueKeyPath:", CFSTR("Hide Nav Back button for selected item"), v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "condition:", v19);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v104[7] = v60;
  v28 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_sidebarLaunchLoadMode);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rowWithTitle:valueKeyPath:", CFSTR("Photos App Sidebar Launch: Load Mode"), v59);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "possibleValues:titles:", &unk_1E59BA990, &unk_1E59BA9A8);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "condition:", v19);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v104[8] = v56;
  v29 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_sidebarLaunchAnimateLoad);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:valueKeyPath:", CFSTR("Sidebar Launch: Animate update"), v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "condition:", v19);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v104[9] = v53;
  v30 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_sidebarSymbolImagesOnly);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rowWithTitle:valueKeyPath:", CFSTR("Sidebar symbol images only"), v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "condition:", v19);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v104[10] = v50;
  v31 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_sidebarSimulateNonIncrementalChanges);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "rowWithTitle:valueKeyPath:", CFSTR("Simulate Non-Incremental Changes"), v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "condition:", v19);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v104[11] = v32;
  v33 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_sidebarPauseChangeProcessingWhenHidden);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "rowWithTitle:valueKeyPath:", CFSTR("Pause Changes When hidden"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "condition:", v19);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v104[12] = v36;
  v37 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_sidebarPausedChangeDetailsBufferLength);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rowWithTitle:valueKeyPath:", CFSTR("Paused Change Details Buffer"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "minValue:maxValue:", 0.0, 20.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "condition:", v19);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v104[13] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v104, 14);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "sectionWithRows:title:", v42, CFSTR("Sidebar"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x1E0D83078];
  v102[0] = v101;
  v102[1] = v72;
  v102[2] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "moduleWithTitle:contents:", CFSTR("Tab Settings"), v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

id __55__PUTabbedLibrarySettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  id v8;
  void *v9;

  v4 = a2;
  v5 = objc_msgSend(a3, "countOfEnabledTabs");
  v6 = objc_msgSend(v4, "BOOLValue");
  v7 = v5 - 1;
  if (v6)
    v7 = v5 + 1;
  if ((unint64_t)(v7 - 6) >= 0xFFFFFFFFFFFFFFFBLL)
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6 ^ 1u);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

@end
