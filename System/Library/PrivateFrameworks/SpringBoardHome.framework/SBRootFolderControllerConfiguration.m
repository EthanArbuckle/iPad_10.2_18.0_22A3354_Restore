@implementation SBRootFolderControllerConfiguration

- (SBRootFolderControllerConfiguration)initWithConfiguration:(id)a3
{
  id v4;
  SBRootFolderControllerConfiguration *v5;
  void *v6;
  char isKindOfClass;
  id v8;
  uint64_t v9;
  UIViewController *pullDownSearchViewController;
  uint64_t v11;
  SBHSearchPresenting *searchPresenter;
  uint64_t v13;
  SBHSearchPresentable *searchPresentableViewController;
  uint64_t v15;
  SBHLegibility *scrollAccessoryAuxiliaryView;
  uint64_t v17;
  UIView *scrollAccessoryBackgroundView;
  uint64_t v19;
  SBHRootFolderCustomViewPresenting *leadingCustomViewController;
  uint64_t v21;
  SBHRootFolderCustomViewPresenting *trailingCustomViewController;
  uint64_t v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBRootFolderControllerConfiguration;
  v5 = -[SBFolderControllerConfiguration initWithConfiguration:](&v25, sel_initWithConfiguration_, v4);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = v4;
      v5->_forSnapshot = objc_msgSend(v8, "isForSnapshot");
      v5->_dockExternal = objc_msgSend(v8, "isDockExternal");
      v5->_showsDoneButtonWhileEditing = objc_msgSend(v8, "showsDoneButtonWhileEditing");
      v5->_showsAddWidgetButtonWhileEditingAllowedOrientations = objc_msgSend(v8, "showsAddWidgetButtonWhileEditingAllowedOrientations");
      objc_msgSend(v8, "pullDownSearchViewController");
      v9 = objc_claimAutoreleasedReturnValue();
      pullDownSearchViewController = v5->_pullDownSearchViewController;
      v5->_pullDownSearchViewController = (UIViewController *)v9;

      objc_msgSend(v8, "searchPresenter");
      v11 = objc_claimAutoreleasedReturnValue();
      searchPresenter = v5->_searchPresenter;
      v5->_searchPresenter = (SBHSearchPresenting *)v11;

      objc_msgSend(v8, "searchPresentableViewController");
      v13 = objc_claimAutoreleasedReturnValue();
      searchPresentableViewController = v5->_searchPresentableViewController;
      v5->_searchPresentableViewController = (SBHSearchPresentable *)v13;

      objc_msgSend(v8, "scrollAccessoryAuxiliaryView");
      v15 = objc_claimAutoreleasedReturnValue();
      scrollAccessoryAuxiliaryView = v5->_scrollAccessoryAuxiliaryView;
      v5->_scrollAccessoryAuxiliaryView = (SBHLegibility *)v15;

      objc_msgSend(v8, "scrollAccessoryBackgroundView");
      v17 = objc_claimAutoreleasedReturnValue();
      scrollAccessoryBackgroundView = v5->_scrollAccessoryBackgroundView;
      v5->_scrollAccessoryBackgroundView = (UIView *)v17;

      objc_msgSend(v8, "leadingCustomViewController");
      v19 = objc_claimAutoreleasedReturnValue();
      leadingCustomViewController = v5->_leadingCustomViewController;
      v5->_leadingCustomViewController = (SBHRootFolderCustomViewPresenting *)v19;

      objc_msgSend(v8, "trailingCustomViewController");
      v21 = objc_claimAutoreleasedReturnValue();
      trailingCustomViewController = v5->_trailingCustomViewController;
      v5->_trailingCustomViewController = (SBHRootFolderCustomViewPresenting *)v21;

      v5->_ignoresOverscrollOnFirstPageOrientations = objc_msgSend(v8, "ignoresOverscrollOnFirstPageOrientations");
      v5->_ignoresOverscrollOnLastPageOrientations = objc_msgSend(v8, "ignoresOverscrollOnLastPageOrientations");
      v23 = objc_msgSend(v8, "folderPageManagementAllowedOrientations");

      v5->_folderPageManagementAllowedOrientations = v23;
    }
  }

  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SBRootFolderControllerConfiguration;
  -[SBFolderControllerConfiguration descriptionBuilderWithMultilinePrefix:](&v27, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBRootFolderControllerConfiguration isForSnapshot](self, "isForSnapshot"), CFSTR("isForSnapshot"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBRootFolderControllerConfiguration isDockExternal](self, "isDockExternal"), CFSTR("isDockExternal"));
  v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBRootFolderControllerConfiguration showsDoneButtonWhileEditing](self, "showsDoneButtonWhileEditing"), CFSTR("showsDoneButtonWhileEditing"));
  v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBRootFolderControllerConfiguration showsAddWidgetButtonWhileEditingAllowedOrientations](self, "showsAddWidgetButtonWhileEditingAllowedOrientations"), CFSTR("showsAddWidgetButtonWhileEditingAllowedOrientations"));
  -[SBRootFolderControllerConfiguration pullDownSearchViewController](self, "pullDownSearchViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("pullDownSearchViewController"));

  -[SBRootFolderControllerConfiguration searchPresenter](self, "searchPresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v4, "appendObject:withName:", v11, CFSTR("searchPresenter"));

  -[SBRootFolderControllerConfiguration searchPresentableViewController](self, "searchPresentableViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v4, "appendObject:withName:", v13, CFSTR("searchPresentableViewController"));

  -[SBRootFolderControllerConfiguration scrollAccessoryAuxiliaryView](self, "scrollAccessoryAuxiliaryView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v4, "appendObject:withName:", v15, CFSTR("scrollAccessoryAuxiliaryView"));

  -[SBRootFolderControllerConfiguration scrollAccessoryBackgroundView](self, "scrollAccessoryBackgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v4, "appendObject:withName:", v17, CFSTR("scrollAccessoryBackgroundView"));

  -[SBRootFolderControllerConfiguration leadingCustomViewController](self, "leadingCustomViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v4, "appendObject:withName:", v19, CFSTR("leadingCustomViewController"));

  -[SBRootFolderControllerConfiguration trailingCustomViewController](self, "trailingCustomViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v4, "appendObject:withName:", v21, CFSTR("trailingCustomViewController"));

  v23 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:format:", -[SBRootFolderControllerConfiguration ignoresOverscrollOnFirstPageOrientations](self, "ignoresOverscrollOnFirstPageOrientations"), CFSTR("ignoresOverscrollOnFirstPageOrientations"), 1);
  v24 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:format:", -[SBRootFolderControllerConfiguration ignoresOverscrollOnLastPageOrientations](self, "ignoresOverscrollOnLastPageOrientations"), CFSTR("ignoresOverscrollOnLastPageOrientations"), 1);
  v25 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:format:", -[SBRootFolderControllerConfiguration folderPageManagementAllowedOrientations](self, "folderPageManagementAllowedOrientations"), CFSTR("folderPageManagementAllowedOrientations"), 1);
  return v4;
}

- (BOOL)isForSnapshot
{
  return self->_forSnapshot;
}

- (void)setForSnapshot:(BOOL)a3
{
  self->_forSnapshot = a3;
}

- (BOOL)isDockExternal
{
  return self->_dockExternal;
}

- (void)setDockExternal:(BOOL)a3
{
  self->_dockExternal = a3;
}

- (BOOL)showsDoneButtonWhileEditing
{
  return self->_showsDoneButtonWhileEditing;
}

- (void)setShowsDoneButtonWhileEditing:(BOOL)a3
{
  self->_showsDoneButtonWhileEditing = a3;
}

- (unint64_t)showsAddWidgetButtonWhileEditingAllowedOrientations
{
  return self->_showsAddWidgetButtonWhileEditingAllowedOrientations;
}

- (void)setShowsAddWidgetButtonWhileEditingAllowedOrientations:(unint64_t)a3
{
  self->_showsAddWidgetButtonWhileEditingAllowedOrientations = a3;
}

- (BOOL)showsIconTintButtonWhileEditing
{
  return self->_showsIconTintButtonWhileEditing;
}

- (void)setShowsIconTintButtonWhileEditing:(BOOL)a3
{
  self->_showsIconTintButtonWhileEditing = a3;
}

- (BOOL)showsIconSizeToggleButtonWhileEditing
{
  return self->_showsIconSizeToggleButtonWhileEditing;
}

- (void)setShowsIconSizeToggleButtonWhileEditing:(BOOL)a3
{
  self->_showsIconSizeToggleButtonWhileEditing = a3;
}

- (UIViewController)pullDownSearchViewController
{
  return self->_pullDownSearchViewController;
}

- (void)setPullDownSearchViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pullDownSearchViewController, a3);
}

- (SBHSearchPresenting)searchPresenter
{
  return self->_searchPresenter;
}

- (void)setSearchPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_searchPresenter, a3);
}

- (SBHSearchPresentable)searchPresentableViewController
{
  return self->_searchPresentableViewController;
}

- (void)setSearchPresentableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_searchPresentableViewController, a3);
}

- (SBHLegibility)scrollAccessoryAuxiliaryView
{
  return self->_scrollAccessoryAuxiliaryView;
}

- (void)setScrollAccessoryAuxiliaryView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollAccessoryAuxiliaryView, a3);
}

- (UIView)scrollAccessoryBackgroundView
{
  return self->_scrollAccessoryBackgroundView;
}

- (void)setScrollAccessoryBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollAccessoryBackgroundView, a3);
}

- (SBHRootFolderCustomViewPresenting)leadingCustomViewController
{
  return self->_leadingCustomViewController;
}

- (void)setLeadingCustomViewController:(id)a3
{
  objc_storeStrong((id *)&self->_leadingCustomViewController, a3);
}

- (SBHRootFolderCustomViewPresenting)trailingCustomViewController
{
  return self->_trailingCustomViewController;
}

- (void)setTrailingCustomViewController:(id)a3
{
  objc_storeStrong((id *)&self->_trailingCustomViewController, a3);
}

- (unint64_t)ignoresOverscrollOnFirstPageOrientations
{
  return self->_ignoresOverscrollOnFirstPageOrientations;
}

- (void)setIgnoresOverscrollOnFirstPageOrientations:(unint64_t)a3
{
  self->_ignoresOverscrollOnFirstPageOrientations = a3;
}

- (unint64_t)ignoresOverscrollOnLastPageOrientations
{
  return self->_ignoresOverscrollOnLastPageOrientations;
}

- (void)setIgnoresOverscrollOnLastPageOrientations:(unint64_t)a3
{
  self->_ignoresOverscrollOnLastPageOrientations = a3;
}

- (unint64_t)folderPageManagementAllowedOrientations
{
  return self->_folderPageManagementAllowedOrientations;
}

- (void)setFolderPageManagementAllowedOrientations:(unint64_t)a3
{
  self->_folderPageManagementAllowedOrientations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingCustomViewController, 0);
  objc_storeStrong((id *)&self->_leadingCustomViewController, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryBackgroundView, 0);
  objc_storeStrong((id *)&self->_scrollAccessoryAuxiliaryView, 0);
  objc_storeStrong((id *)&self->_searchPresentableViewController, 0);
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_storeStrong((id *)&self->_pullDownSearchViewController, 0);
}

@end
