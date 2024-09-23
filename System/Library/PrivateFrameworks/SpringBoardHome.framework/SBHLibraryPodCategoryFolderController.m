@implementation SBHLibraryPodCategoryFolderController

+ (id)iconLocation
{
  return CFSTR("SBIconLocationAppLibraryCategoryPodExpanded");
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (id)contentScrollView
{
  void *v2;
  void *v3;

  -[SBHLibraryPodFolderController podFolderView](self, "podFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "podScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHLibraryPodCategoryFolderController;
  -[SBHLibraryPodFolderController viewDidLoad](&v9, sel_viewDidLoad);
  -[SBFolderController folder](self, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryPodCategoryFolderController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(v4, "_setLargeTitleTwoLineMode:", 1);
  -[SBHLibraryPodFolderController podFolderView](self, "podFolderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushNavigationItem:animated:", v4, 0);

  objc_msgSend(v6, "setCentersContentIfPossible:", 1);
  -[SBHLibraryPodCategoryFolderController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 18);

}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHLibraryPodCategoryFolderController;
  -[SBHLibraryPodFolderController iconListView:didRemoveIconView:](&v8, sel_iconListView_didRemoveIconView_, a3, a4);
  -[SBFolderController folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "icons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

  }
  else
  {
    v7 = -[SBHLibraryPodCategoryFolderController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");

    if (!v7)
      return;
    -[SBHLibraryPodFolderController podFolderControllerDelegate](self, "podFolderControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryPodFolderControllerRequestsDismissal:", self);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryPodCategoryFolderController;
  -[SBHLibraryPodFolderController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  SBLogTelemetrySignposts();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_EXPAND_POD", " enableTelemetry=YES ", v4, 2u);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryPodCategoryFolderController;
  -[SBFolderController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  SBLogTelemetrySignposts();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_EXPAND_POD", " enableTelemetry=YES ", v5, 2u);
  }

  -[SBHLibraryPodCategoryFolderController _logCategoryVisibilityChangedTo:](self, "_logCategoryVisibilityChangedTo:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryPodCategoryFolderController;
  -[SBFolderController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  SBLogTelemetrySignposts();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_COLLAPSE_POD", " enableTelemetry=YES ", v5, 2u);
  }

  -[SBHLibraryPodFolderController dismissDisplayedContextMenu](self, "dismissDisplayedContextMenu");
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryPodCategoryFolderController;
  -[SBFolderController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  SBLogTelemetrySignposts();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_COLLAPSE_POD", " enableTelemetry=YES ", v5, 2u);
  }

  -[SBHLibraryPodCategoryFolderController _logCategoryVisibilityChangedTo:](self, "_logCategoryVisibilityChangedTo:", 0);
}

- (void)_logCategoryVisibilityChangedTo:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a3;
  -[SBFolderController folder](self, "folder");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isLibraryCategoryFolder"))
  {
    -[SBHLibraryPodFolderController loggingClient](self, "loggingClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "libraryCategoryIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "predictionCategoryID");
    v8 = objc_msgSend(v6, "predictionCategoryIndex");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v5, "logCategoryExpansionWithDate:categoryID:categoryIndex:", v9, v7, v8);
    else
      objc_msgSend(v5, "logCategoryExitWithDate:categoryID:categoryIndex:", v9, v7, v8);

  }
}

- (void)handleTapGesture:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[SBHLibraryPodFolderController tapToDismissRecognizer](self, "tapToDismissRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    if (objc_msgSend(v4, "state") == 3)
    {
      -[SBHLibraryPodFolderController _nestingViewControllerForPushing](self, "_nestingViewControllerForPushing");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "popNestedViewControllerAnimated:withCompletion:", 1, 0);

    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)SBHLibraryPodCategoryFolderController;
      -[SBHLibraryPodFolderController handleTapGesture:](&v7, sel_handleTapGesture_, v4);
    }
  }

}

- (id)currentIconListView
{
  void *v2;
  void *v3;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentIconListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
