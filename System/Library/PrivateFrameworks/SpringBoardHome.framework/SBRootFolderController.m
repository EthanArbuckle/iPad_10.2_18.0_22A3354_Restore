@implementation SBRootFolderController

uint64_t __76__SBRootFolderController_enumerateDisplayedIconViewsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__SBRootFolderController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isPageManagementUIVisible
{
  void *v2;
  char v3;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPageManagementUIVisible");

  return v3;
}

- (BOOL)isAnySearchVisible
{
  return !-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState")
      && SBRootFolderPageStateIsSearch(-[SBRootFolderController pageState](self, "pageState"));
}

- (BOOL)isPullDownSearchVisible
{
  BOOL v3;
  void *v4;
  void *v5;

  v3 = !-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState")
    && -[SBRootFolderController pageState](self, "pageState") == 1;
  -[SBRootFolderController searchPresenter](self, "searchPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "presentationState"))
    v3 = 0;

  return v3;
}

- (BOOL)isTransitioningPageState
{
  void *v2;
  BOOL v3;

  -[SBRootFolderController currentTransitionHandle](self, "currentTransitionHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (_SBRootFolderPageTransitionHandle)currentTransitionHandle
{
  return self->_currentTransitionHandle;
}

- (int64_t)pageState
{
  return self->_pageState;
}

- (SBHSearchPresenting)searchPresenter
{
  return self->_searchPresenter;
}

- (id)viewControllersForPageIndex:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (-[SBRootFolderController leadingCustomViewPageIndex](self, "leadingCustomViewPageIndex") == a3)
  {
    -[SBRootFolderController leadingCustomViewController](self, "leadingCustomViewController");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[SBRootFolderController trailingCustomViewPageIndex](self, "trailingCustomViewPageIndex") != a3)
    {
      v6 = 0;
      goto LABEL_8;
    }
    -[SBRootFolderController trailingCustomViewController](self, "trailingCustomViewController");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  if (v5)
  {
    v16[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_8:
  v7 = 0;
LABEL_9:
  v15.receiver = self;
  v15.super_class = (Class)SBRootFolderController;
  -[SBFolderController viewControllersForPageIndex:](&v15, sel_viewControllersForPageIndex_, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v12 = v11;

    v7 = v12;
    goto LABEL_17;
  }
  if (v8)
  {
    v11 = v8;
    goto LABEL_16;
  }
LABEL_17:
  v13 = v7;

  return v13;
}

- (int64_t)leadingCustomViewPageIndex
{
  void *v2;
  int64_t v3;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "leadingCustomViewPageIndex");

  return v3;
}

- (int64_t)trailingCustomViewPageIndex
{
  void *v2;
  int64_t v3;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "trailingCustomViewPageIndex");

  return v3;
}

- (id)iconViewForIcon:(id)a3 location:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  -[SBRootFolderController dockListView](self, "dockListView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11
    || !objc_msgSend(v9, "isEqualToString:", v11)
    || -[SBRootFolderController isDockExternal](self, "isDockExternal")
    || (a5 & 8) != 0 && !-[SBRootFolderController isDockVisible](self, "isDockVisible")
    || (objc_msgSend(v10, "displayedIconViewForIcon:", v8), (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBRootFolderController;
    -[SBFolderController iconViewForIcon:location:options:](&v14, sel_iconViewForIcon_location_options_, v8, v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "iconLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0
    || -[SBFolderController hasDock](self, "hasDock")
    && !-[SBRootFolderController isDockExternal](self, "isDockExternal")
    && (-[SBRootFolderController dockListView](self, "dockListView"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "iconLocation"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", v4),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[SBFolderController iconListViews](self, "iconListViews", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "iconLocation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v4, "isEqualToString:", v14);

          if ((v15 & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_16;
          }
        }
        v7 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_16:

  }
  return v7;
}

+ (id)iconLocation
{
  return CFSTR("SBIconLocationRoot");
}

- (id)dockListView
{
  void *v2;
  void *v3;
  void *v4;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockListView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isDockExternal
{
  void *v2;
  char v3;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDockExternal");

  return v3;
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderController;
  -[SBFolderController enumerateDisplayedIconViewsUsingBlock:](&v9, sel_enumerateDisplayedIconViewsUsingBlock_, v4);
  -[SBRootFolderController dockListView](self, "dockListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SBRootFolderController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
  v7[3] = &unk_1E8D852B8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateIconViewsUsingBlock:", v7);

}

- (void)enumerateDisplayedIconViewsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBRootFolderController;
  -[SBFolderController enumerateDisplayedIconViewsWithOptions:usingBlock:](&v11, sel_enumerateDisplayedIconViewsWithOptions_usingBlock_, a3, v6);
  -[SBRootFolderController dockListView](self, "dockListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__SBRootFolderController_enumerateDisplayedIconViewsWithOptions_usingBlock___block_invoke;
  v9[3] = &unk_1E8D852B8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateIconViewsUsingBlock:", v9);

}

- (BOOL)shouldOpenFolderIcon:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderController;
  if (-[SBFolderController shouldOpenFolderIcon:](&v9, sel_shouldOpenFolderIcon_, v4))
  {
    v5 = 1;
  }
  else
  {
    -[SBFolderController folder](self, "folder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "directlyContainsIcon:", v4);

  }
  return v5;
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  -[SBRootFolderController dockListView](self, "dockListView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || !objc_msgSend(v7, "isEqualToString:", v9)
    || -[SBRootFolderController isDockExternal](self, "isDockExternal")
    || (objc_msgSend(v8, "displayedIconViewForIcon:", v6), (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRootFolderController;
    -[SBFolderController iconViewForIcon:location:](&v12, sel_iconViewForIcon_location_, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)folderViewDidEndScrolling:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderController;
  -[SBFolderController folderViewDidEndScrolling:](&v9, sel_folderViewDidEndScrolling_, v4);
  if (-[SBRootFolderController isTransitioningBetweenPageStateVerticalGroups](self, "isTransitioningBetweenPageStateVerticalGroups"))
  {
    objc_msgSend(v4, "currentScrollOffset");
    -[SBRootFolderController pageStateTransitionSnapshotForScrollOffset:](self, "pageStateTransitionSnapshotForScrollOffset:");
    v5 = -[SBRootFolderController destinationPageState](self, "destinationPageState") == 0;
    -[SBRootFolderController implicitScrollTransition](self, "implicitScrollTransition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endTransitionSuccessfully:", v5);
    -[SBRootFolderController setImplicitScrollTransition:](self, "setImplicitScrollTransition:", 0);

  }
  v7 = objc_msgSend(v4, "isOnLeadingCustomPage");
  -[SBRootFolderController searchGesture](self, "searchGesture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDisabled:forReason:", v7, CFSTR("SBRootFolderShowingLeadingCustomViewReason"));

  if (-[SBFolderController isEditing](self, "isEditing"))
    -[SBRootFolderController updateExtraButtonVisibilityAnimated:](self, "updateExtraButtonVisibilityAnimated:", 1);

}

- (BOOL)isTransitioningBetweenPageStateVerticalGroups
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState");
  if (v3)
  {
    v4 = -[SBRootFolderController pageState](self, "pageState");
    v5 = -[SBRootFolderController destinationPageState](self, "destinationPageState");
    v6 = SBRootFolderPageStateVerticalGroupForRootFolderPageState(v4);
    LOBYTE(v3) = v6 != SBRootFolderPageStateVerticalGroupForRootFolderPageState(v5);
  }
  return v3;
}

- (void)folderView:(id)a3 currentPageIndexDidChange:(int64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBRootFolderController;
  -[SBFolderController folderView:currentPageIndexDidChange:](&v13, sel_folderView_currentPageIndexDidChange_, v6, a4);
  v7 = v6;
  v8 = objc_msgSend(v7, "isOnLeadingCustomPage");
  objc_msgSend(v7, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isScrollAnimating");

  -[SBRootFolderController searchGesture](self, "searchGesture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBRootFolderController isPullDownSearchVisibleOrTransitioning](self, "isPullDownSearchVisibleOrTransitioning"))
    objc_msgSend(v11, "resetAnimated:", v10);
  if (((-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState") | v10) & 1) == 0
    && !-[SBFolderController isScrolling](self, "isScrolling")
    && (_DWORD)v8 != -[SBRootFolderController isLeadingCustomViewVisible](self, "isLeadingCustomViewVisible"))
  {
    if ((_DWORD)v8)
      v12 = 2;
    else
      v12 = 0;
    -[SBRootFolderController performPageStateTransitionToState:reason:animated:completionHandler:](self, "performPageStateTransitionToState:reason:animated:completionHandler:", v12, CFSTR("page index changed"), 0, 0);
  }
  objc_msgSend(v11, "setDisabled:forReason:", v8, CFSTR("SBRootFolderShowingLeadingCustomViewReason"));

}

- (SBSearchGesture)searchGesture
{
  return self->_searchGesture;
}

- (BOOL)isPullDownSearchVisibleOrTransitioning
{
  return -[SBRootFolderController isPullDownSearchVisible](self, "isPullDownSearchVisible")
      || -[SBRootFolderController isPullDownSearchTransitioning](self, "isPullDownSearchTransitioning");
}

- (BOOL)isPullDownSearchTransitioning
{
  int64_t v3;

  LODWORD(v3) = -[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState");
  if ((_DWORD)v3)
  {
    v3 = -[SBRootFolderController pageState](self, "pageState");
    if (v3 != 1)
      LOBYTE(v3) = -[SBRootFolderController destinationPageState](self, "destinationPageState") == 1;
  }
  return v3;
}

- (void)bringWidgetIntroductionPopoverToFront
{
  id v3;

  if (-[SBRootFolderController isDisplayingWidgetIntroductionOnPage:](self, "isDisplayingWidgetIntroductionOnPage:", -[SBFolderController firstIconPageIndex](self, "firstIconPageIndex")))
  {
    -[SBFolderController currentIconListView](self, "currentIconListView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bringWidgetIntroductionPopoverToFront");

  }
}

- (BOOL)isDisplayingWidgetIntroductionOnPage:(int64_t)a3
{
  unint64_t v4;
  void *v6;
  char v7;

  v4 = -[SBFolderController iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[SBFolderController iconListViewAtIndex:](self, "iconListViewAtIndex:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDisplayingWidgetIntroduction");

  return v7;
}

- (double)dockHeight
{
  void *v2;
  double v3;
  double v4;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dockHeight");
  v4 = v3;

  return v4;
}

- (void)folderViewWillUpdatePageDuringScrolling:(id)a3
{
  id v4;
  void *v5;
  uint64_t (*v6)(void);
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBRootFolderController;
  v4 = a3;
  -[SBFolderController folderViewWillUpdatePageDuringScrolling:](&v8, sel_folderViewWillUpdatePageDuringScrolling_, v4);
  objc_msgSend(v4, "scrollView", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBFolderController userInterfaceLayoutDirection](self, "userInterfaceLayoutDirection"))
    v6 = MEMORY[0x1E0D012E8];
  else
    v6 = MEMORY[0x1E0D01308];
  v7 = -[SBRootFolderController updateStateTransitionsDuringScrollingScrollView:pageBounceComparator:](self, "updateStateTransitionsDuringScrollingScrollView:pageBounceComparator:", v5, v6);

}

- (id)updateStateTransitionsDuringScrollingScrollView:(id)a3 pageBounceComparator:(void *)a4
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;

  -[SBRootFolderController rootFolderView](self, "rootFolderView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollOffsetForPageIndexCalculation");
  v8 = v7;
  -[SBRootFolderController pageStateTransitionSnapshotForScrollOffset:](self, "pageStateTransitionSnapshotForScrollOffset:");
  if (-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState")
    && -[SBRootFolderController destinationPageState](self, "destinationPageState"))
  {
    -[SBRootFolderController implicitScrollTransition](self, "implicitScrollTransition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endTransitionSuccessfully:", -[SBRootFolderController destinationPageState](self, "destinationPageState") == 0);

  }
  if (-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState"))
  {
    -[SBRootFolderController implicitScrollTransition](self, "implicitScrollTransition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTransitionProgress:", 0.0);

    v11 = 0;
  }
  else
  {
    -[SBRootFolderController beginPageStateTransitionToState:reason:animated:interactive:](self, "beginPageStateTransitionToState:reason:animated:interactive:", 0, CFSTR("implicit scroll"), 1, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTransitionProgress:", 0.0);
    -[SBRootFolderController setImplicitScrollTransition:](self, "setImplicitScrollTransition:", v11);
  }
  -[SBRootFolderController leadingCustomViewController](self, "leadingCustomViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_msgSend(v6, "leadingCustomViewPageScrollOffset");
    v15 = ((uint64_t (*)(uint64_t, double, double))a4)(v13, v8, v14);
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v6, "setLeadingCustomViewBouncing:", v15);

  return v11;
}

- (SBRootFolderPageStateTransitionSnapshot)pageStateTransitionSnapshotForScrollOffset:(SEL)a3
{
  void *v7;
  uint64_t v8;
  size_t v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v23;
  SBRootFolderPageStateTransitionSnapshot *result;
  _QWORD v25[22];

  v25[20] = *MEMORY[0x1E0C80C00];
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pageCount");
  v9 = objc_msgSend(v7, "extraPageCountDuringScrolling") + v8;
  v10 = -[SBFolderController userInterfaceLayoutDirection](self, "userInterfaceLayoutDirection");
  objc_msgSend(v7, "_pageWidthOrHeight");
  v12 = v11;
  objc_msgSend(v7, "_pageSpacing");
  v14 = v13;
  v15 = -[SBRootFolderController pageState](self, "pageState");
  if (v9 > 0x13)
  {
    v17 = malloc_type_calloc(v9, 8uLL, 0x100004000313F17uLL);
    bzero(v17, 8 * v9);
    v16 = v17;
  }
  else
  {
    if (!v9)
    {
      v17 = 0;
      v16 = v25;
      goto LABEL_12;
    }
    v16 = v25;
    bzero(v25, 8 * v9);
    v17 = 0;
  }
  -[SBRootFolderController leadingCustomViewController](self, "leadingCustomViewController");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    v20 = -[SBRootFolderController isLeadingCustomViewPageHidden](self, "isLeadingCustomViewPageHidden");

    if (!v20)
      *v16 = 2;
  }
  if (v9 >= 2)
  {
    -[SBRootFolderController trailingCustomViewController](self, "trailingCustomViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      v16[v9 - 1] = 4;
  }
LABEL_12:
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0.0;
  v22 = (void *)objc_opt_class();
  v23 = objc_msgSend(v7, "userInterfaceLayoutDirectionAwareScrollingDirection");
  if (v22)
  {
    objc_msgSend(v22, "pageStateTransitionSnapshotForScrollOffset:pageWidth:pageSpacing:pages:pageCount:userInterfaceLayoutDirection:currentPageState:scrollingDirection:", v16, v9, v10, v15, v23, a4, v12, v14);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0.0;
  }
  free(v17);

  return result;
}

- (SBHRootFolderCustomViewPresenting)leadingCustomViewController
{
  return self->_leadingCustomViewController;
}

- (SBHRootFolderCustomViewPresenting)trailingCustomViewController
{
  return self->_trailingCustomViewController;
}

- (void)folderViewDidScroll:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderController;
  -[SBFolderController folderViewDidScroll:](&v5, sel_folderViewDidScroll_, a3);
  -[SBRootFolderController implicitScrollTransition](self, "implicitScrollTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && !-[SBFolderController isScrolling](self, "isScrolling")
    && -[SBRootFolderController isTransitioningBetweenPageStateVerticalGroups](self, "isTransitioningBetweenPageStateVerticalGroups"))
  {
    objc_msgSend(v4, "endTransitionSuccessfully:", 1);
    -[SBRootFolderController setImplicitScrollTransition:](self, "setImplicitScrollTransition:", 0);
  }

}

- (SBRootFolderPageTransition)implicitScrollTransition
{
  return self->_implicitScrollTransition;
}

- (NSSet)nonDockPresentedIconLocations
{
  void *v2;
  void *v3;
  void *v4;

  -[SBRootFolderController presentedIconLocations](self, "presentedIconLocations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "dockIconLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", v4);

  return (NSSet *)v3;
}

+ (NSString)dockIconLocation
{
  return (NSString *)objc_msgSend((id)objc_msgSend(a1, "_contentViewClass"), "dockIconLocation");
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (void)transitionWillBegin:(id)a3
{
  SBViewControllerTransitionContext *v4;
  NSObject *v5;
  void *v6;
  SBFramewiseInteractiveTransitionAnimator *v7;
  void *v8;
  SBPercentPassthroughInteractiveTransition *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  SBFramewiseInteractiveTransitionAnimator *currentTransitionAnimator;
  SBFramewiseInteractiveTransitionAnimator *v18;
  SBPercentPassthroughInteractiveTransition *currentTransitionInteractor;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t v27[16];
  objc_super v28;

  v4 = (SBViewControllerTransitionContext *)a3;
  v28.receiver = self;
  v28.super_class = (Class)SBRootFolderController;
  -[SBNestingViewController transitionWillBegin:](&v28, sel_transitionWillBegin_, v4);
  if (self->_currentTransitionContext == v4)
  {
    objc_opt_class();
    -[SBViewControllerTransitionContext animator](v4, "animator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SBFSafeCast();
    v7 = (SBFramewiseInteractiveTransitionAnimator *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    -[SBViewControllerTransitionContext interactor](v4, "interactor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SBFSafeCast();
    v9 = (SBPercentPassthroughInteractiveTransition *)objc_claimAutoreleasedReturnValue();

    v10 = -[SBFramewiseInteractiveTransitionAnimator isPresenting](v7, "isPresenting");
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBViewControllerTransitionContext userInfo](v4, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SBFSafeCast();
    v5 = objc_claimAutoreleasedReturnValue();

    v13 = -[NSObject sourcePageState](v5, "sourcePageState");
    v14 = -[NSObject destinationPageState](v5, "destinationPageState");
    v15 = (_QWORD *)MEMORY[0x1E0DC55C8];
    if (!(_DWORD)v10)
      v15 = (_QWORD *)MEMORY[0x1E0DC55B8];
    -[SBViewControllerTransitionContext viewControllerForKey:](v4, "viewControllerForKey:", *v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    currentTransitionAnimator = self->_currentTransitionAnimator;
    self->_currentTransitionAnimator = v7;
    v18 = v7;

    currentTransitionInteractor = self->_currentTransitionInteractor;
    self->_currentTransitionInteractor = v9;

    v20 = -[SBViewControllerTransitionContext isAnimated](v4, "isAnimated");
    objc_msgSend(v16, "beginAppearanceTransition:animated:", v10, v20);
    if (v14 == 1)
      v21 = SBHIsSpotlightFloatingWindowEnabled();
    else
      v21 = 0;
    -[SBRootFolderController viewControllerForPageState:](self, "viewControllerForPageState:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22 && v22 != v16 && (v21 & 1) == 0)
      objc_msgSend(v22, "beginAppearanceTransition:animated:", 0, v20);
    -[SBRootFolderController viewControllerForPageState:](self, "viewControllerForPageState:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24 && v24 != v16)
      objc_msgSend(v24, "beginAppearanceTransition:animated:", 1, v20);

  }
  else
  {
    SBLogSpotlight();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "transitionContext is the same so not doing anything", v27, 2u);
    }
  }

  -[SBRootFolderController accessoryViewControllerDelegate](self, "accessoryViewControllerDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rootFolderController:transitionWillBegin:", self, v4);

}

- (void)transitionDidFinish:(id)a3
{
  SBViewControllerTransitionContext *v4;
  SBViewControllerTransitionContext *currentTransitionContext;
  SBFramewiseInteractiveTransitionAnimator *currentTransitionAnimator;
  SBPercentPassthroughInteractiveTransition *currentTransitionInteractor;
  void *v8;
  objc_super v9;

  v4 = (SBViewControllerTransitionContext *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderController;
  -[SBNestingViewController transitionDidFinish:](&v9, sel_transitionDidFinish_, v4);
  if (self->_currentTransitionContext == v4)
  {
    -[SBViewControllerTransitionContext setDelegate:](v4, "setDelegate:", 0);
    -[SBFramewiseInteractiveTransitionAnimator setDelegate:](self->_currentTransitionAnimator, "setDelegate:", 0);
    currentTransitionContext = self->_currentTransitionContext;
    self->_currentTransitionContext = 0;

    currentTransitionAnimator = self->_currentTransitionAnimator;
    self->_currentTransitionAnimator = 0;

    currentTransitionInteractor = self->_currentTransitionInteractor;
    self->_currentTransitionInteractor = 0;

  }
  -[SBRootFolderController accessoryViewControllerDelegate](self, "accessoryViewControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootFolderController:transitionDidFinish:", self, v4);

}

- (void)transitionWillFinish:(id)a3
{
  SBViewControllerTransitionContext *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  char v24;
  void *v25;
  objc_super v26;

  v4 = (SBViewControllerTransitionContext *)a3;
  v26.receiver = self;
  v26.super_class = (Class)SBRootFolderController;
  -[SBNestingViewController transitionWillFinish:](&v26, sel_transitionWillFinish_, v4);
  if (self->_currentTransitionContext == v4)
  {
    -[SBViewControllerTransitionContext userInfo](v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;

    if (!v8)
      goto LABEL_31;
    objc_opt_class();
    -[SBViewControllerTransitionContext animator](v4, "animator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SBFSafeCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v8, "destinationPageState");
    v12 = objc_msgSend(v8, "sourcePageState");
    v13 = -[SBViewControllerTransitionContext transitionWasCancelled](v4, "transitionWasCancelled");
    v14 = objc_msgSend(v10, "isPresenting");
    v15 = (_QWORD *)MEMORY[0x1E0DC55C8];
    if (!v14)
      v15 = (_QWORD *)MEMORY[0x1E0DC55B8];
    -[SBViewControllerTransitionContext viewControllerForKey:](v4, "viewControllerForKey:", *v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderController viewControllerForPageState:](self, "viewControllerForPageState:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderController viewControllerForPageState:](self, "viewControllerForPageState:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v16, "cancelBeginAppearanceTransition");
      if (v17 && v17 != v16)
        objc_msgSend(v17, "cancelBeginAppearanceTransition");
      if (v18 && v18 != v16)
        objc_msgSend(v18, "cancelBeginAppearanceTransition");
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    if (v11 == 2)
    {
      -[SBFolderController folderDelegate](self, "folderDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v19, "contentOverlayInsetsFromParentIfAvailableForFolderController:", self);
      }
      else
      {
        v20 = *MEMORY[0x1E0DC49E8];
        v21 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
        v22 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
        v23 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      }
      -[SBRootFolderController _setContentOverlayInsets:](self, "_setContentOverlayInsets:", v20, v21, v22, v23);
      objc_msgSend(v16, "_updateContentOverlayInsetsFromParentIfNecessary");

      objc_msgSend(v16, "endAppearanceTransition");
    }
    else
    {
      objc_msgSend(v16, "endAppearanceTransition");
      if (v11 == 1)
      {
        v24 = SBHIsSpotlightFloatingWindowEnabled();
        goto LABEL_23;
      }
    }
    v24 = 0;
LABEL_23:
    if (v17 && v17 != v16 && (v24 & 1) == 0)
      objc_msgSend(v17, "endAppearanceTransition");
    if (v18 && v18 != v16)
      objc_msgSend(v18, "endAppearanceTransition");
    goto LABEL_30;
  }
LABEL_32:
  -[SBRootFolderController accessoryViewControllerDelegate](self, "accessoryViewControllerDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rootFolderController:transitionWillFinish:", self, v4);

}

- (SBRootFolderControllerAccessoryViewControllerDelegate)accessoryViewControllerDelegate
{
  return (SBRootFolderControllerAccessoryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_accessoryViewControllerDelegate);
}

- (void)rootFolderViewDidChangeSuppressesEditingStateForListViews:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "rootFolderController:setSuppressesEditingStateForExternalDockListViews:", self, objc_msgSend(v5, "suppressesEditingStateForListViews"));

}

- (void)folderView:(id)a3 currentPageIndexWillChange:(int64_t)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderController;
  -[SBFolderController folderView:currentPageIndexWillChange:](&v6, sel_folderView_currentPageIndexWillChange_, a3, a4);
  if (-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState"))
  {
    if (!-[SBRootFolderController isTransitioningBetweenPageStateVerticalGroups](self, "isTransitioningBetweenPageStateVerticalGroups"))
    {
      -[SBRootFolderController currentTransitionHandle](self, "currentTransitionHandle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endTransitionSuccessfully:", 0);

    }
  }
}

- (BOOL)isLeadingCustomViewSearchVisibleOrTransitioning
{
  return -[SBRootFolderController isLeadingCustomViewSearchVisible](self, "isLeadingCustomViewSearchVisible")
      || -[SBRootFolderController isLeadingCustomViewSearchTransitioning](self, "isLeadingCustomViewSearchTransitioning");
}

- (BOOL)isLeadingCustomViewSearchTransitioning
{
  _BOOL4 v3;

  v3 = -[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState");
  if (v3)
    LOBYTE(v3) = -[SBRootFolderController pageState](self, "pageState") == 3
              || -[SBRootFolderController destinationPageState](self, "destinationPageState") == 3;
  return v3;
}

- (id)firstIconViewForIcon:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  if ((a4 & 1) != 0
    && -[SBRootFolderController isAnySearchVisibleOrTransitioning](self, "isAnySearchVisibleOrTransitioning"))
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBRootFolderController;
    -[SBFolderController firstIconViewForIcon:options:](&v9, sel_firstIconViewForIcon_options_, v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  SBRootFolderController *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBRootFolderController;
  -[SBFolderController viewDidDisappear:](&v12, sel_viewDidDisappear_, a3);
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBRootFolderController isLeadingCustomViewSearchVisible](self, "isLeadingCustomViewSearchVisible"))
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __43__SBRootFolderController_viewDidDisappear___block_invoke;
    v9 = &unk_1E8D84EF0;
    v10 = v4;
    v11 = self;
    -[SBRootFolderController dismissSpotlightAnimated:completionHandler:](self, "dismissSpotlightAnimated:completionHandler:", 0, &v6);

  }
  else if (-[SBRootFolderController isAnySearchVisibleOrTransitioning](self, "isAnySearchVisibleOrTransitioning"))
  {
    -[SBRootFolderController dismissSpotlightAnimated:completionHandler:](self, "dismissSpotlightAnimated:completionHandler:", 0, 0);
  }
  objc_msgSend(v4, "updateIconListIndexAndVisibility:", 1, v6, v7, v8, v9);
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "rootFolderControllerViewDidDisappear:", self);

}

- (BOOL)isLeadingCustomViewVisibleOrTransitionDestination
{
  int64_t v3;

  if (-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState"))
    v3 = -[SBRootFolderController destinationPageState](self, "destinationPageState");
  else
    v3 = -[SBRootFolderController pageState](self, "pageState");
  return v3 == 2;
}

- (BOOL)isLeadingCustomViewSearchVisible
{
  return !-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState")
      && -[SBRootFolderController pageState](self, "pageState") == 3;
}

- (BOOL)isDisplayingIconView:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  BOOL v7;

  v4 = a4;
  v6 = a3;
  v7 = ((v4 & 1) == 0
     || !-[SBRootFolderController isAnySearchVisibleOrTransitioning](self, "isAnySearchVisibleOrTransitioning"))
    && -[SBFolderController isDisplayingIconView:](self, "isDisplayingIconView:", v6);

  return v7;
}

- (BOOL)isAnySearchTransitioning
{
  _BOOL4 v3;

  v3 = -[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState");
  if (v3)
    LOBYTE(v3) = SBRootFolderPageStateIsSearch(-[SBRootFolderController pageState](self, "pageState"))
              || SBRootFolderPageStateIsSearch(-[SBRootFolderController destinationPageState](self, "destinationPageState"));
  return v3;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderController;
  if (-[SBFolderController isDisplayingIcon:](&v9, sel_isDisplayingIcon_, v4))
    goto LABEL_4;
  -[SBRootFolderController dockListView](self, "dockListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "containsIcon:", v4))
  {

    goto LABEL_6;
  }
  v6 = -[SBRootFolderController isDockVisible](self, "isDockVisible");

  if (!v6)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
LABEL_4:
  v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)isDockVisible
{
  void *v2;
  char v3;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDockVisible");

  return v3;
}

- (id)_viewControllersToNotifyForViewObscuration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBRootFolderController;
  -[SBFolderController _viewControllersToNotifyForViewObscuration](&v10, sel__viewControllersToNotifyForViewObscuration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (SBRootFolderPageStateIsSearch(-[SBRootFolderController pageState](self, "pageState"))
    && !-[SBFolderController isOverridingPageViewControllerAppearanceStateToRemainDisappeared](self, "isOverridingPageViewControllerAppearanceStateToRemainDisappeared"))
  {
    -[SBRootFolderController pullDownSearchViewController](self, "pullDownSearchViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "addObject:", v5);

  }
  -[SBRootFolderController searchPresenter](self, "searchPresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPresenting");

  if (v7)
  {
    -[SBRootFolderController searchPresentableViewController](self, "searchPresentableViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v4, "addObject:", v8);

  }
  return v4;
}

- (BOOL)isAnySearchVisibleOrTransitioning
{
  return -[SBRootFolderController isAnySearchVisible](self, "isAnySearchVisible")
      || -[SBRootFolderController isAnySearchTransitioning](self, "isAnySearchTransitioning");
}

- (NSSet)presentedIconLocations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend((id)objc_opt_class(), "iconLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBRootFolderController dockListView](self, "dockListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBFolderController hasDock](self, "hasDock")
    && !-[SBRootFolderController isDockExternal](self, "isDockExternal")
    && v7)
  {
    objc_msgSend(v5, "addObject:", v7);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBFolderController iconListViews](self, "iconListViews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "iconLocation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return (NSSet *)v5;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[SBFolderController folder](self, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderController dockListView](self, "dockListView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && objc_msgSend(v7, "isEqualToString:", v10)
    && !-[SBRootFolderController isDockExternal](self, "isDockExternal"))
  {
    objc_msgSend(v8, "dock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "directlyContainsIcon:", v6);
LABEL_11:

    goto LABEL_12;
  }
  v11 = -[SBFolderController iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:", -[SBFolderController currentPageIndex](self, "currentPageIndex"));
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SBFolderController iconListViewAtIndex:](self, "iconListViewAtIndex:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "iconLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v15))
      v12 = objc_msgSend(v14, "directlyContainsIcon:", v6);
    else
      v12 = 0;

    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (SBRootFolderController)initWithConfiguration:(id)a3
{
  id v4;
  SBRootFolderController *v5;
  SBRootFolderController *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  id v10;
  uint64_t v11;
  SBHSearchPresenting *searchPresenter;
  uint64_t v13;
  SBHSearchPresentable *searchPresentableViewController;
  uint64_t v15;
  UIViewController *pullDownSearchViewController;
  SBSearchGesture *v17;
  void *v18;
  uint64_t v19;
  SBSearchGesture *searchGesture;
  uint64_t v21;
  SBHRootFolderCustomViewPresenting *leadingCustomViewController;
  uint64_t v23;
  SBHRootFolderCustomViewPresenting *trailingCustomViewController;
  SBHomeScreenDefaults *v25;
  SBHomeScreenDefaults *homeScreenDefaults;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SBRootFolderController;
  v5 = -[SBFolderController initWithConfiguration:](&v28, sel_initWithConfiguration_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_pageState = -1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__reduceTransparencyChanged, *MEMORY[0x1E0DC45B8], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v10 = v4;
      v6->_showsDoneButtonWhileEditing = objc_msgSend(v10, "showsDoneButtonWhileEditing");
      v6->_showsAddWidgetButtonWhileEditingAllowedOrientations = objc_msgSend(v10, "showsAddWidgetButtonWhileEditingAllowedOrientations");
      objc_msgSend(v10, "searchPresenter");
      v11 = objc_claimAutoreleasedReturnValue();
      searchPresenter = v6->_searchPresenter;
      v6->_searchPresenter = (SBHSearchPresenting *)v11;

      objc_msgSend(v10, "searchPresentableViewController");
      v13 = objc_claimAutoreleasedReturnValue();
      searchPresentableViewController = v6->_searchPresentableViewController;
      v6->_searchPresentableViewController = (SBHSearchPresentable *)v13;

      if (!v6->_searchPresenter)
      {
        objc_msgSend(v10, "pullDownSearchViewController");
        v15 = objc_claimAutoreleasedReturnValue();
        pullDownSearchViewController = v6->_pullDownSearchViewController;
        v6->_pullDownSearchViewController = (UIViewController *)v15;

      }
      if (v6->_searchPresentableViewController)
      {
        -[SBRootFolderController addChildViewController:](v6, "addChildViewController:");
        -[SBHSearchPresentable didMoveToParentViewController:](v6->_searchPresentableViewController, "didMoveToParentViewController:", v6);
      }
      if (v6->_pullDownSearchViewController)
      {
        -[SBRootFolderController addChildViewController:](v6, "addChildViewController:");
        -[UIViewController didMoveToParentViewController:](v6->_pullDownSearchViewController, "didMoveToParentViewController:", v6);
      }
      v17 = [SBSearchGesture alloc];
      objc_msgSend(v10, "searchPresenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SBSearchGesture initWithSearchPresenter:](v17, "initWithSearchPresenter:", v18);
      searchGesture = v6->_searchGesture;
      v6->_searchGesture = (SBSearchGesture *)v19;

      -[SBSearchGesture addObserver:](v6->_searchGesture, "addObserver:", v6);
      objc_msgSend(v10, "leadingCustomViewController");
      v21 = objc_claimAutoreleasedReturnValue();
      leadingCustomViewController = v6->_leadingCustomViewController;
      v6->_leadingCustomViewController = (SBHRootFolderCustomViewPresenting *)v21;

      if (v6->_leadingCustomViewController)
      {
        -[SBRootFolderController addChildViewController:](v6, "addChildViewController:");
        -[SBHRootFolderCustomViewPresenting didMoveToParentViewController:](v6->_leadingCustomViewController, "didMoveToParentViewController:", v6);
      }
      objc_msgSend(v10, "trailingCustomViewController");
      v23 = objc_claimAutoreleasedReturnValue();
      trailingCustomViewController = v6->_trailingCustomViewController;
      v6->_trailingCustomViewController = (SBHRootFolderCustomViewPresenting *)v23;

      if (v6->_trailingCustomViewController)
      {
        -[SBRootFolderController addChildViewController:](v6, "addChildViewController:");
        -[SBHRootFolderCustomViewPresenting didMoveToParentViewController:](v6->_trailingCustomViewController, "didMoveToParentViewController:", v6);
        if (SBHIsHomeButtonDevice())
          -[SBHRootFolderCustomViewPresenting setAdditionalSafeAreaInsets:](v6->_trailingCustomViewController, "setAdditionalSafeAreaInsets:", 20.0, 0.0, 0.0, 0.0);
      }
      v25 = (SBHomeScreenDefaults *)objc_alloc_init(MEMORY[0x1E0DA9F98]);
      homeScreenDefaults = v6->_homeScreenDefaults;
      v6->_homeScreenDefaults = v25;

    }
    -[SBFolderController setOpen:](v6, "setOpen:", 1);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC45B8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBRootFolderController;
  -[SBFolderController dealloc](&v4, sel_dealloc);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_self();
}

- (void)folderController:(id)a3 didBeginEditingTitle:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "folderController:didBeginEditingTitle:", self, v6);

}

- (void)folderController:(id)a3 didEndEditingTitle:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "folderController:didEndEditingTitle:", self, v6);

}

- (void)viewDidLoad
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBRootFolderController;
  -[SBFolderController viewDidLoad](&v7, sel_viewDidLoad);
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBRootFolderController pageState](self, "pageState") == -1)
  {
    v4 = -[SBFolderController currentPageIndex](self, "currentPageIndex");
    if (v4 == -[SBRootFolderController leadingCustomViewPageIndex](self, "leadingCustomViewPageIndex"))
    {
      -[SBRootFolderController setPageState:](self, "setPageState:", 2);
      -[SBRootFolderController _leadingCustomViewVisibilityProgress](self, "_leadingCustomViewVisibilityProgress");
      objc_msgSend(v3, "setLeadingCustomViewVisibilityProgress:");
    }
    else if (v4 == -[SBRootFolderController trailingCustomViewPageIndex](self, "trailingCustomViewPageIndex"))
    {
      -[SBRootFolderController setPageState:](self, "setPageState:", 4);
      -[SBRootFolderController _trailingCustomViewVisibilityProgress](self, "_trailingCustomViewVisibilityProgress");
      objc_msgSend(v3, "setTrailingCustomViewVisibilityProgress:");
    }
    else
    {
      -[SBRootFolderController setPageState:](self, "setPageState:", 0);
    }
  }
  -[SBRootFolderController trailingCustomViewController](self, "trailingCustomViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "trailingCustomSearchDimmingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSearchDimmingView:", v6);

  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderController;
  -[SBRootFolderController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[SBRootFolderController _updateAddWidgetSheetIconCache](self, "_updateAddWidgetSheetIconCache");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderController;
  -[SBFolderController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "rootFolderControllerViewWillAppear:", self);

}

uint64_t __43__SBRootFolderController_viewDidDisappear___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentPageIndex:animated:", objc_msgSend(*(id *)(a1 + 40), "defaultPageIndex"), 0);
  return objc_msgSend(*(id *)(a1 + 32), "updateIconListIndexAndVisibility:", 1);
}

- (void)viewWillTransitionToSize:(CGSize)a3 forOperation:(int64_t)a4 withTransitionCoordinator:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderController;
  -[SBFolderController viewWillTransitionToSize:forOperation:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_forOperation_withTransitionCoordinator_, a4, a5, a3.width, a3.height);
}

- (id)_makeContentViewWithConfiguration:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBRootFolderController;
  -[SBFolderController _makeContentViewWithConfiguration:](&v7, sel__makeContentViewWithConfiguration_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderController searchGesture](self, "searchGesture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchGesture:", v5);

  return v4;
}

- (BOOL)closesAfterDragExits
{
  return 0;
}

- (BOOL)canAcceptFolderIconDrags
{
  return 1;
}

- (BOOL)disablesScrollingWhileIconDragIsDropping
{
  return 0;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL4 v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v7 = -[SBFolderController isEditing](self, "isEditing");
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderController;
  -[SBFolderController setEditing:animated:](&v9, sel_setEditing_animated_, v5, v4);
  if (v7 != v5)
  {
    -[SBRootFolderController updateExtraButtonVisibilityAnimated:](self, "updateExtraButtonVisibilityAnimated:", v4);
    -[SBRootFolderController _addWidgetSheetConfigurationManager](self, "_addWidgetSheetConfigurationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v8, "fetchGalleryContentForHomeScreenEditingWithGridSize:addWidgetSheetViewController:", -[SBRootFolderController _currentHomeScreenEditingGridSize](self, "_currentHomeScreenEditingGridSize"), self->_addSheetViewController);
    }
    else
    {
      -[SBRootFolderController _internalDismissWidgetAddSheet:clearAddSheetViewController:notifyObservers:](self, "_internalDismissWidgetAddSheet:clearAddSheetViewController:notifyObservers:", v4, 1, 1);
      objc_msgSend(v8, "setEditingSuggestedWidgetItems:", 0);
    }

  }
}

- (void)_updateFolderRequiredTrailingEmptyListCount
{
  _BOOL4 v3;
  int64_t v4;
  int64_t v5;
  objc_super v6;

  v3 = -[SBFolderController isEditing](self, "isEditing");
  v4 = -[SBFolderController currentPageIndex](self, "currentPageIndex");
  v5 = -[SBRootFolderController trailingCustomViewPageIndex](self, "trailingCustomViewPageIndex");
  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderController;
  -[SBFolderController _updateFolderRequiredTrailingEmptyListCount](&v6, sel__updateFolderRequiredTrailingEmptyListCount);
  if (v3 && v4 == v5)
    -[SBFolderController setCurrentPageIndex:](self, "setCurrentPageIndex:", -[SBRootFolderController trailingCustomViewPageIndex](self, "trailingCustomViewPageIndex"));
}

- (void)_refreshGalleryContentForHomeScreenEditingIfNecessary
{
  id v3;

  if (-[SBFolderController isEditing](self, "isEditing"))
  {
    -[SBRootFolderController _addWidgetSheetConfigurationManager](self, "_addWidgetSheetConfigurationManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEditingSuggestedWidgetItems:", 0);
    objc_msgSend(v3, "fetchGalleryContentForHomeScreenEditingWithGridSize:addWidgetSheetViewController:", -[SBRootFolderController _currentHomeScreenEditingGridSize](self, "_currentHomeScreenEditingGridSize"), self->_addSheetViewController);

  }
}

- (unint64_t)_defaultEditingSuggestedWidgetItemsFamilyMask
{
  if (-[SBRootFolderController _addWidgetSheetStyle](self, "_addWidgetSheetStyle") == 1)
    return 30;
  else
    return 14;
}

- (unint64_t)_currentHomeScreenEditingGridSize
{
  uint64_t v3;

  if (-[SBRootFolderController _addWidgetSheetStyle](self, "_addWidgetSheetStyle") != 1)
    return 0;
  if (-[SBFolderController isRotating](self, "isRotating"))
    v3 = -[SBRootFolderController _rotatingToInterfaceOrientation](self, "_rotatingToInterfaceOrientation");
  else
    v3 = -[SBFolderController orientation](self, "orientation");
  if ((unint64_t)(v3 - 3) >= 2)
    return 2;
  else
    return 3;
}

- (unint64_t)_stackConfigurationGridSize
{
  return 2 * (-[SBRootFolderController _addWidgetSheetStyle](self, "_addWidgetSheetStyle") == 1);
}

- (void)setSuppressesExtraEditingButtons:(BOOL)a3
{
  if (self->_suppressesExtraEditingButtons != a3)
  {
    self->_suppressesExtraEditingButtons = a3;
    -[SBRootFolderController updateExtraButtonVisibilityAnimated:](self, "updateExtraButtonVisibilityAnimated:", 0);
  }
}

- (id)showDoneButtonForReason:(id)a3
{
  id v4;
  SBRootFolderControllerShowDoneButtonAssertion *v5;
  NSHashTable *showDoneButtonAssertions;
  NSHashTable *v7;
  NSHashTable *v8;

  v4 = a3;
  v5 = -[SBRootFolderControllerShowDoneButtonAssertion initWithFolderController:reason:]([SBRootFolderControllerShowDoneButtonAssertion alloc], "initWithFolderController:reason:", self, v4);

  showDoneButtonAssertions = self->_showDoneButtonAssertions;
  if (!showDoneButtonAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_showDoneButtonAssertions;
    self->_showDoneButtonAssertions = v7;

    showDoneButtonAssertions = self->_showDoneButtonAssertions;
  }
  -[NSHashTable addObject:](showDoneButtonAssertions, "addObject:", v5);
  -[SBRootFolderController updateExtraButtonVisibilityAnimated:](self, "updateExtraButtonVisibilityAnimated:", 1);
  return v5;
}

- (void)_removeShowDoneButtonAssertion:(id)a3
{
  -[NSHashTable removeObject:](self->_showDoneButtonAssertions, "removeObject:", a3);
  -[SBRootFolderController updateExtraButtonVisibilityAnimated:](self, "updateExtraButtonVisibilityAnimated:", 1);
}

- (void)updateExtraButtonVisibilityAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v10;
  _BOOL4 suppressesExtraEditingButtons;
  _BOOL8 v12;
  _BOOL8 v13;
  NSUInteger v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  int v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v3 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBFolderController orientation](self, "orientation");
  v8 = -[SBRootFolderController showsDoneButtonWhileEditing](self, "showsDoneButtonWhileEditing");
  -[SBRootFolderController showsAddWidgetButtonWhileEditingAllowedOrientations](self, "showsAddWidgetButtonWhileEditingAllowedOrientations");
  v9 = SBFInterfaceOrientationMaskContainsInterfaceOrientation();
  v10 = -[SBFolderController isEditing](self, "isEditing");
  v21 = v9;
  if (v10 && v8)
  {
    suppressesExtraEditingButtons = self->_suppressesExtraEditingButtons;
    v12 = !self->_suppressesExtraEditingButtons;
    if ((v9 & 1) != 0)
    {
LABEL_4:
      LODWORD(v22) = 1;
LABEL_5:
      v13 = !suppressesExtraEditingButtons;
      HIDWORD(v22) = 1;
      goto LABEL_9;
    }
LABEL_8:
    v22 = 1;
    v13 = 0;
LABEL_9:
    if (!-[SBRootFolderController isLeadingCustomViewVisibleOrTransitionDestination](self, "isLeadingCustomViewVisibleOrTransitionDestination"))goto LABEL_20;
    if (v12)
    {
      v12 = -[SBRootFolderController _leadingCustomViewShouldShowDoneButtonWhenEditing](self, "_leadingCustomViewShouldShowDoneButtonWhenEditing");
      if (!v13)
        goto LABEL_19;
    }
    else if (!v13)
    {
      v13 = v12;
      goto LABEL_20;
    }
    v13 = -[SBRootFolderController _leadingCustomViewShouldShowAddWidgetButtonWhenEditing](self, "_leadingCustomViewShouldShowAddWidgetButtonWhenEditing");
    goto LABEL_20;
  }
  v14 = -[NSHashTable count](self->_showDoneButtonAssertions, "count");
  v15 = v10 & v9;
  if (v14)
  {
    suppressesExtraEditingButtons = self->_suppressesExtraEditingButtons;
    v12 = !self->_suppressesExtraEditingButtons;
    if ((v15 & 1) != 0)
      goto LABEL_4;
    goto LABEL_8;
  }
  if (v15)
  {
    v12 = 0;
    LODWORD(v22) = 0;
    suppressesExtraEditingButtons = self->_suppressesExtraEditingButtons;
    goto LABEL_5;
  }
  -[SBRootFolderController isLeadingCustomViewVisibleOrTransitionDestination](self, "isLeadingCustomViewVisibleOrTransitionDestination");
  v22 = 0;
  v12 = 0;
LABEL_19:
  v13 = 0;
LABEL_20:
  if (-[SBRootFolderController isTrailingCustomViewVisibleOrTransitionDestination](self, "isTrailingCustomViewVisibleOrTransitionDestination"))
  {
    if (v12)
      v12 = -[SBRootFolderController _trailingCustomViewShouldShowDoneButtonWhenEditing](self, "_trailingCustomViewShouldShowDoneButtonWhenEditing");
    if (v13)
      v13 = -[SBRootFolderController _trailingCustomViewShouldShowAddWidgetButtonWhenEditing](self, "_trailingCustomViewShouldShowAddWidgetButtonWhenEditing");
  }
  SBLogRootController();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v17 = v3;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SBHStringFromUIInterfaceOrientation(v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = self->_suppressesExtraEditingButtons;
    *(_DWORD *)buf = 138414082;
    v24 = v18;
    v25 = 1024;
    v26 = v12;
    v27 = 1024;
    v28 = v13;
    v29 = 2114;
    v30 = v19;
    v31 = 1024;
    v32 = v8;
    v33 = 1024;
    v34 = v21;
    v35 = 1024;
    v36 = v20;
    v37 = 1024;
    v38 = v10;
    _os_log_impl(&dword_1CFEF3000, v16, OS_LOG_TYPE_DEFAULT, "(%@) Updating extra button visibility: reallyShowDoneButton='%{BOOL}u', reallyShowAddButton='%{BOOL}u' — orientation='%{public}@', needsEditingDoneButton='%{BOOL}u', needsEditingAddWidgetButton='%{BOOL}u', suppressesExtraEditingButtons='%{BOOL}u', editing='%{BOOL}u'", buf, 0x3Au);

    v3 = v17;
  }

  objc_msgSend(v6, "setShowsDoneButton:animated:", v12, v12 & v3);
  objc_msgSend(v6, "setShowsAddWidgetButton:animated:", v13, v13 & v3);
  if ((v22 | HIDWORD(v22)) == 1)
  {
    -[SBFolderController _hideStatusBarForReason:animated:](self, "_hideStatusBarForReason:animated:", CFSTR("SBRootFolderEditingReason"), 0);
    -[SBFolderController _hideFakeStatusBarForReason:animated:](self, "_hideFakeStatusBarForReason:animated:", CFSTR("SBRootFolderEditingReason"), 0);
  }
  else
  {
    -[SBFolderController _unhideStatusBarForReason:](self, "_unhideStatusBarForReason:", CFSTR("SBRootFolderEditingReason"));
    -[SBFolderController _unhideFakeStatusBarForReason:animated:](self, "_unhideFakeStatusBarForReason:animated:", CFSTR("SBRootFolderEditingReason"), 0);
  }

}

- (BOOL)_leadingCustomViewShouldShowDoneButtonWhenEditing
{
  void *v2;
  char v3;

  -[SBRootFolderController leadingCustomViewController](self, "leadingCustomViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "shouldShowDoneButtonWhenEditing");
  else
    v3 = 0;

  return v3;
}

- (BOOL)_trailingCustomViewShouldShowDoneButtonWhenEditing
{
  void *v2;
  char v3;

  -[SBRootFolderController trailingCustomViewController](self, "trailingCustomViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "shouldShowDoneButtonWhenEditing");
  else
    v3 = 1;

  return v3;
}

- (BOOL)_leadingCustomViewShouldShowAddWidgetButtonWhenEditing
{
  void *v2;
  char v3;

  -[SBRootFolderController leadingCustomViewController](self, "leadingCustomViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "shouldShowAddWidgetButtonWhenEditing");
  else
    v3 = 0;

  return v3;
}

- (BOOL)_trailingCustomViewShouldShowAddWidgetButtonWhenEditing
{
  void *v2;
  char v3;

  -[SBRootFolderController trailingCustomViewController](self, "trailingCustomViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "shouldShowAddWidgetButtonWhenEditing");
  else
    v3 = 1;

  return v3;
}

- (void)setLegibilitySettings:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBRootFolderController;
  v4 = a3;
  -[SBFolderController setLegibilitySettings:](&v5, sel_setLegibilitySettings_, v4);
  -[SBHRootFolderCustomViewPresenting setLegibilitySettings:](self->_leadingCustomViewController, "setLegibilitySettings:", v4, v5.receiver, v5.super_class);
  -[SBHRootFolderCustomViewPresenting setLegibilitySettings:](self->_trailingCustomViewController, "setLegibilitySettings:", v4);

}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = (void (**)(id, void *))a4;
  v10.receiver = self;
  v10.super_class = (Class)SBRootFolderController;
  v7 = a3;
  -[SBFolderController enumerateDisplayedIconViewsForIcon:usingBlock:](&v10, sel_enumerateDisplayedIconViewsForIcon_usingBlock_, v7, v6);
  -[SBRootFolderController dockListView](self, "dockListView", v10.receiver, v10.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconViewForIcon:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v6[2](v6, v9);

}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  -[SBFolderController listLayoutProvider](self, "listLayoutProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SBRootFolderController;
  -[SBFolderController setListLayoutProvider:animated:](&v10, sel_setListLayoutProvider_animated_, v6, v4);
  -[SBFolderController listLayoutProvider](self, "listLayoutProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    -[SBRootFolderController rootFolderView](self, "rootFolderView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setListLayoutProvider:animated:", v6, v4);

  }
}

- (id)parentViewControllerForCustomIconImageViewControllerForIconView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (!-[SBRootFolderController isPageManagementUIVisible](self, "isPageManagementUIVisible")
    || -[SBRootFolderController isPageManagementUITransitioningOutOfVisible](self, "isPageManagementUITransitioningOutOfVisible"))
  {
    goto LABEL_7;
  }
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specialLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_7:
    v9.receiver = self;
    v9.super_class = (Class)SBRootFolderController;
    -[SBFolderController parentViewControllerForCustomIconImageViewControllerForIconView:](&v9, sel_parentViewControllerForCustomIconImageViewControllerForIconView_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v6, "parentViewControllerForCustomIconImageViewControllerForIconView:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_7;
LABEL_8:

  return v7;
}

- (unint64_t)_depth
{
  return 0;
}

- (void)setFolderDelegate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolderController;
  -[SBFolderController folderDelegate](&v9, sel_folderDelegate);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBRootFolderController;
    -[SBFolderController setFolderDelegate:](&v8, sel_setFolderDelegate_, v4);
    -[SBRootFolderController viewIfLoaded](self, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[SBRootFolderController _updateAddWidgetSheetIconCache](self, "_updateAddWidgetSheetIconCache");
  }

}

- (void)_updateAddWidgetSheetIconCache
{
  void *v3;
  void *v4;
  SBHMutableIconGridSizeClassSet *v5;
  void *v6;
  SBHMutableIconGridSizeClassSet *v7;
  void *v8;
  SBHMutableIconGridSizeClassSet *v9;
  void *v10;
  void *v11;
  id v12;
  SBHMutableIconGridSizeClassSet *v13;

  -[SBFolderController folderDelegate](self, "folderDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "appIconImageCacheForRootFolderController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = [SBHMutableIconGridSizeClassSet alloc];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("SBHIconGridSizeClassSmall"), CFSTR("SBHIconGridSizeClassMedium"), CFSTR("SBHIconGridSizeClassLarge"), CFSTR("SBHIconGridSizeClassNewsLargeTall"), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:](v5, "initWithGridSizeClasses:", v6);

      if (-[SBRootFolderController _addWidgetSheetStyle](self, "_addWidgetSheetStyle") == 1)
        -[SBHMutableIconGridSizeClassSet addGridSizeClass:](v7, "addGridSizeClass:", CFSTR("SBHIconGridSizeClassExtraLarge"));
      v13 = v7;
      -[SBRootFolderController applicationWidgetCollectionsForEditingViewController:withAllowedSizeClasses:allowingNonStackableItems:](self, "applicationWidgetCollectionsForEditingViewController:withAllowedSizeClasses:allowingNonStackableItems:", 0, &v13, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;

      -[SBFolderController effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "purgeAllCachedImages");
      objc_msgSend(v8, "bs_mapNoNulls:", &__block_literal_global_2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v4, "cacheImagesForIcons:imageAppearance:options:completionHandler:", v11, v10, 0, 0);

    }
  }

}

uint64_t __56__SBRootFolderController__updateAddWidgetSheetIconCache__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "icon");
}

- (NSArray)folderControllers
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderController innerFolderController](self, "innerFolderController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(v3, "addObject:", v5);
      objc_msgSend(v5, "innerFolderController");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (void)setPullDownSearchViewController:(id)a3
{
  UIViewController *v5;
  UIViewController *pullDownSearchViewController;
  UIViewController *v7;
  UIViewController *v8;

  v5 = (UIViewController *)a3;
  pullDownSearchViewController = self->_pullDownSearchViewController;
  if (pullDownSearchViewController != v5)
  {
    v8 = v5;
    -[UIViewController removeFromParentViewController](pullDownSearchViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_pullDownSearchViewController, a3);
    v7 = v8;
    if (v8)
    {
      -[SBRootFolderController addChildViewController:](self, "addChildViewController:", v8);
      v7 = v8;
    }
    -[UIViewController didMoveToParentViewController:](v7, "didMoveToParentViewController:", self);
    v5 = v8;
  }

}

- (void)setLeadingCustomViewController:(id)a3
{
  SBHRootFolderCustomViewPresenting *v5;
  SBHRootFolderCustomViewPresenting *leadingCustomViewController;
  SBHRootFolderCustomViewPresenting *v7;
  SBHRootFolderCustomViewPresenting *v8;

  v5 = (SBHRootFolderCustomViewPresenting *)a3;
  leadingCustomViewController = self->_leadingCustomViewController;
  if (leadingCustomViewController != v5)
  {
    v8 = v5;
    -[SBHRootFolderCustomViewPresenting removeFromParentViewController](leadingCustomViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_leadingCustomViewController, a3);
    v7 = v8;
    if (v8)
    {
      -[SBRootFolderController addChildViewController:](self, "addChildViewController:", v8);
      v7 = v8;
    }
    -[SBHRootFolderCustomViewPresenting didMoveToParentViewController:](v7, "didMoveToParentViewController:", self);
    v5 = v8;
  }

}

- (double)spotlightFirstIconRowOffset
{
  void *v2;
  double v3;
  double v4;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_spotlightFirstIconRowOffset");
  v4 = v3;

  return v4;
}

- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4
{
  return -[SBFolderController setCurrentPageIndex:animated:completion:](self, "setCurrentPageIndex:animated:completion:", a3, a4, 0);
}

- (void)setIdleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdleText:", v4);

}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  -[SBRootFolderController dockListView](self, "dockListView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && objc_msgSend(v7, "isEqualToString:", v9)
    && !-[SBRootFolderController isDockExternal](self, "isDockExternal"))
  {
    v13 = objc_msgSend(v8, "isDisplayingIconView:", v6);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "iconLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if (v11)
    {
      -[SBFolderController currentIconListView](self, "currentIconListView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isDisplayingIconView:", v6);

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)beginModifyingDockOffscreenFractionForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginModifyingDockOffscreenFractionForReason:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)dockEdge
{
  void *v2;
  unint64_t v3;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dockEdge");

  return v3;
}

- (void)setDockEdge:(unint64_t)a3
{
  id v4;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDockEdge:", a3);

}

- (BOOL)_listIndexIsVisible:(unint64_t)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBRootFolderController;
  v5 = 1;
  if (!-[SBFolderController _listIndexIsVisible:](&v12, sel__listIndexIsVisible_) && a3 != 10000)
  {
    if (-[SBRootFolderController isLeadingCustomViewVisible](self, "isLeadingCustomViewVisible"))
    {
      -[SBRootFolderController leadingCustomViewController](self, "leadingCustomViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "iconListViewQueryable");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "sb_indexPathWithListIndex:", a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFolderController folder](self, "folder");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "iconListViewForListAtIndexPath:inFolder:", v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v10 != 0;

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (BOOL)suspendsWallpaperAnimationWhileOpen
{
  return 0;
}

- (void)rootFolderViewWantsWidgetEditingViewControllerPresented:(id)a3
{
  -[SBRootFolderController presentWidgetEditingViewControllerFromViewController:](self, "presentWidgetEditingViewControllerFromViewController:", self);
}

- (id)_addWidgetSheetConfigurationManager
{
  void *v3;
  void *v4;

  -[SBFolderController folderDelegate](self, "folderDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "addWidgetSheetConfigurationManagerForRootFolderController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWidgetDragHandlerDelegate:", self);
    objc_msgSend(v4, "setAddWidgetSheetLocation:", 0);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)_addWidgetSheetStyle
{
  void *v3;
  unint64_t v4;

  -[SBFolderController folderDelegate](self, "folderDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "addWidgetSheetStyleForRootFolderController:", self);
  else
    v4 = 0;

  return v4;
}

- (void)rootFolderViewWantsIconTintViewControllerPresented:(id)a3
{
  id v4;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "rootFolderControllerWantsIconTintViewControllerPresented:", self);

}

- (void)presentWidgetEditingViewControllerFromViewController:(id)a3
{
  SBHMutableIconGridSizeClassSet *v4;
  void *v5;
  SBHMutableIconGridSizeClassSet *v6;
  id v7;

  v7 = a3;
  v4 = [SBHMutableIconGridSizeClassSet alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("SBHIconGridSizeClassSmall"), CFSTR("SBHIconGridSizeClassMedium"), CFSTR("SBHIconGridSizeClassLarge"), CFSTR("SBHIconGridSizeClassNewsLargeTall"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:](v4, "initWithGridSizeClasses:", v5);

  if (-[SBRootFolderController _addWidgetSheetStyle](self, "_addWidgetSheetStyle") == 1)
    -[SBHMutableIconGridSizeClassSet addGridSizeClass:](v6, "addGridSizeClass:", CFSTR("SBHIconGridSizeClassExtraLarge"));
  -[SBRootFolderController presentWidgetEditingViewControllerFromViewController:withAllowedSizeClasses:allowingNonStackableItems:](self, "presentWidgetEditingViewControllerFromViewController:withAllowedSizeClasses:allowingNonStackableItems:", v7, v6, 1);

}

- (void)updatePresentedWidgetEditingViewController
{
  void *v3;
  void *v4;
  id v5;

  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "addWidgetSheetConfigurationManagerForRootFolderController:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderController addSheetViewController](self, "addSheetViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updatePresentedWidgetEditingViewController:", v4);

  }
}

- (void)dismissWidgetEditingViewControllerIfPresentedAnimated:(BOOL)a3
{
  -[SBRootFolderController _internalDismissWidgetAddSheet:clearAddSheetViewController:notifyObservers:](self, "_internalDismissWidgetAddSheet:clearAddSheetViewController:notifyObservers:", a3, 0, 1);
}

- (id)applicationWidgetCollectionsForEditingViewController:(id)a3 withAllowedSizeClasses:(id *)a4 allowingNonStackableItems:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  -[SBRootFolderController _addWidgetSheetConfigurationManager](self, "_addWidgetSheetConfigurationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationWidgetCollectionsForEditingViewController:withAllowedSizeClasses:allowingNonStackableItems:", v8, a4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)presentWidgetEditingViewControllerFromViewController:(id)a3 withAllowedSizeClasses:(id)a4 allowingNonStackableItems:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  SBHPadAddSheetViewController *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  SBHPadAddSheetViewController *v42;
  NSObject *v43;
  NSObject *v44;
  SBHPadAddSheetViewController *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[5];
  SBHPadAddSheetViewController *v54;
  _QWORD v55[4];
  SBHPadAddSheetViewController *v56;
  id v57;
  uint8_t buf[4];
  uint64_t v59;
  uint64_t v60;

  v5 = a5;
  v60 = *MEMORY[0x1E0C80C00];
  v57 = a4;
  v8 = a4;
  v9 = a3;
  -[SBRootFolderController applicationWidgetCollectionsForEditingViewController:withAllowedSizeClasses:allowingNonStackableItems:](self, "applicationWidgetCollectionsForEditingViewController:withAllowedSizeClasses:allowingNonStackableItems:", v9, &v57, v5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v57;

  -[SBFolderController listLayoutProvider](self, "listLayoutProvider");
  v12 = objc_claimAutoreleasedReturnValue();
  -[SBFolderController gridSizeClassDomain](self, "gridSizeClassDomain");
  v51 = v11;
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "chsWidgetFamilyMaskInDomain:");
  -[SBFolderController iconViewProvider](self, "iconViewProvider");
  v14 = objc_claimAutoreleasedReturnValue();
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appIconImageCacheForRootFolderController:", self);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = -[SBRootFolderController _addWidgetSheetStyle](self, "_addWidgetSheetStyle");
  v48 = (void *)v14;
  if (v17 == 1)
  {
    v18 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:]([SBHPadAddSheetViewController alloc], "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", v12, v14, v13, v5, v16, 1);
  }
  else
  {
    v18 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:]([SBHAddWidgetSheetViewController alloc], "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", v12, v14, v13, v5, v16, v17);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "rootFolderController:prepareAddSheetViewController:", self, v18);

  }
  -[SBRootFolderController _addWidgetSheetConfigurationManager](self, "_addWidgetSheetConfigurationManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHPadAddSheetViewController setAllowsFakeWidgets:](v18, "setAllowsFakeWidgets:", objc_msgSend(v19, "allowsFakeWidgets"));
  -[SBHPadAddSheetViewController setPresenter:](v18, "setPresenter:", v9);
  v20 = objc_msgSend(v9, "presenterType");

  if (v20 == 2)
  {
    v21 = -[SBRootFolderController _stackConfigurationGridSize](self, "_stackConfigurationGridSize");
    objc_msgSend(v19, "stackConfigurationSuggestedWidgetItems");
  }
  else
  {
    v21 = -[SBRootFolderController _currentHomeScreenEditingGridSize](self, "_currentHomeScreenEditingGridSize");
    objc_msgSend(v19, "editingSuggestedWidgetItems");
  }
  v22 = objc_claimAutoreleasedReturnValue();
  -[SBHPadAddSheetViewController setGalleryLayoutSize:](v18, "setGalleryLayoutSize:", v21);
  -[SBHPadAddSheetViewController setSuggestedItems:forGalleryLayoutSize:](v18, "setSuggestedItems:forGalleryLayoutSize:", v22, v21);
  -[SBHPadAddSheetViewController setAddWidgetSheetLocation:](v18, "setAddWidgetSheetLocation:", objc_msgSend(v19, "addWidgetSheetLocation"));
  -[SBRootFolderController setAddSheetViewController:](self, "setAddSheetViewController:", v18);
  SBLogWidgets();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v10;
    _os_log_impl(&dword_1CFEF3000, v23, OS_LOG_TYPE_DEFAULT, "Presenting add widget sheet with applicationWidgetCollections: %@", buf, 0xCu);
  }

  -[SBHPadAddSheetViewController setApplicationWidgetCollections:](v18, "setApplicationWidgetCollections:", v10);
  -[SBHAddWidgetSheetViewControllerBase setDelegate:](v18, "setDelegate:", self);
  -[SBHPadAddSheetViewController setModalPresentationStyle:](v18, "setModalPresentationStyle:", 2);
  -[SBRootFolderController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25;
  v28 = v27;

  if (v17 == 1)
  {
    -[SBHPadAddSheetViewController preferredInsetsForSheetPresentationInInterfaceOrientation:](v18, "preferredInsetsForSheetPresentationInInterfaceOrientation:", -[SBFolderController orientation](self, "orientation"));
    -[SBHPadAddSheetViewController setPreferredContentSize:](v18, "setPreferredContentSize:", v26 - (v29 + v30), v28 - (v31 + v32));
  }
  -[SBHPadAddSheetViewController sheetPresentationController](v18, "sheetPresentationController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_setShouldDismissWhenTappedOutside:", 1);
  v52 = (void *)v10;
  v50 = (void *)v12;
  v46 = (void *)v22;
  if (v17 == 1)
  {
    objc_msgSend(v33, "setPrefersGrabberVisible:", 1);
    -[SBRootFolderController _additionalMinimumOffsetForSheetPresentation](self, "_additionalMinimumOffsetForSheetPresentation");
    objc_msgSend(v33, "_setAdditionalMinimumTopInset:");
    objc_msgSend(v33, "setPreferredCornerRadius:", SBHAddWidgetSheetPreferredSheetCornerRadiusForStyle(1));
    objc_msgSend(v33, "setPrefersEdgeAttachedInCompactHeight:", 1);
    objc_msgSend(v33, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", 1);
    objc_msgSend(v33, "traitOverrides");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setHorizontalSizeClass:", 2);

  }
  else
  {
    -[SBFolderController currentIconListView](self, "currentIconListView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSourceView:", v35);

    objc_msgSend(v33, "setPrefersGrabberVisible:", 1);
    -[SBRootFolderController _additionalMinimumOffsetForSheetPresentation](self, "_additionalMinimumOffsetForSheetPresentation");
    objc_msgSend(v33, "_setAdditionalMinimumTopInset:");
    objc_msgSend(v33, "setPreferredCornerRadius:", SBHAddWidgetSheetPreferredSheetCornerRadiusForStyle(v17));
  }
  v47 = (void *)v16;
  -[SBRootFolderController traitCollection](self, "traitCollection");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForTrait:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[SBHPadAddSheetViewController traitOverrides](v18, "traitOverrides");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forTrait:", v38, v40);

  }
  v41 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __128__SBRootFolderController_presentWidgetEditingViewControllerFromViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke;
  v55[3] = &unk_1E8D85300;
  v42 = v18;
  v56 = v42;
  -[SBRootFolderController enumerateWidgetAddSheetObserversUsingBlock:](self, "enumerateWidgetAddSheetObserversUsingBlock:", v55);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v15, "rootFolderController:willPresentAddSheetViewController:", self, v42);
  v43 = _os_activity_create(&dword_1CFEF3000, "Add Widget Sheet", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v43, &self->_widgetAddSheetActivityState);

  SBLogTelemetrySignposts();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v44))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v44, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_ADD_SHEET_PRESENT", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
  }

  v53[0] = v41;
  v53[1] = 3221225472;
  v53[2] = __128__SBRootFolderController_presentWidgetEditingViewControllerFromViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke_104;
  v53[3] = &unk_1E8D84EF0;
  v53[4] = self;
  v54 = v42;
  v45 = v42;
  -[SBRootFolderController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v45, 1, v53);

}

uint64_t __128__SBRootFolderController_presentWidgetEditingViewControllerFromViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 1);
}

void __128__SBRootFolderController_presentWidgetEditingViewControllerFromViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke_104(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint8_t v3[8];
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __128__SBRootFolderController_presentWidgetEditingViewControllerFromViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke_2;
  v4[3] = &unk_1E8D85300;
  v1 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateWidgetAddSheetObserversUsingBlock:", v4);
  SBLogWidgets();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v3 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_ADD_SHEET_PRESENT", " isAnimation=YES ", v3, 2u);
  }

}

uint64_t __128__SBRootFolderController_presentWidgetEditingViewControllerFromViewController_withAllowedSizeClasses_allowingNonStackableItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 2);
}

- (unint64_t)snapshotTypeForIconImageViewControllersUnderWidgetAddSheet
{
  return 0;
}

- (BOOL)_internalDismissWidgetAddSheet:(BOOL)a3 clearAddSheetViewController:(BOOL)a4 notifyObservers:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL8 v7;
  SBHMainAddSheetViewControlling *v9;
  SBHMainAddSheetViewControlling *v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v15[5];
  SBHMainAddSheetViewControlling *v16;
  BOOL v17;
  BOOL v18;
  uint8_t buf[8];
  _QWORD v20[4];
  SBHMainAddSheetViewControlling *v21;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9 = self->_addSheetViewController;
  if (!v9)
  {
LABEL_5:
    v11 = 0;
    goto LABEL_11;
  }
  -[SBRootFolderController presentedViewController](self, "presentedViewController");
  v10 = (SBHMainAddSheetViewControlling *)objc_claimAutoreleasedReturnValue();

  if (v10 != v9)
  {
    if (v6)
      -[SBRootFolderController setAddSheetViewController:](self, "setAddSheetViewController:", 0);
    goto LABEL_5;
  }
  v12 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __101__SBRootFolderController__internalDismissWidgetAddSheet_clearAddSheetViewController_notifyObservers___block_invoke;
    v20[3] = &unk_1E8D85300;
    v21 = v9;
    -[SBRootFolderController enumerateWidgetAddSheetObserversUsingBlock:](self, "enumerateWidgetAddSheetObserversUsingBlock:", v20);

  }
  SBLogTelemetrySignposts();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_ADD_SHEET_DISMISS", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
  }

  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __101__SBRootFolderController__internalDismissWidgetAddSheet_clearAddSheetViewController_notifyObservers___block_invoke_105;
  v15[3] = &unk_1E8D85328;
  v17 = v6;
  v15[4] = self;
  v18 = v5;
  v16 = v9;
  -[SBNestingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v7, v15);

  v11 = 1;
LABEL_11:

  return v11;
}

uint64_t __101__SBRootFolderController__internalDismissWidgetAddSheet_clearAddSheetViewController_notifyObservers___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 3);
}

void __101__SBRootFolderController__internalDismissWidgetAddSheet_clearAddSheetViewController_notifyObservers___block_invoke_105(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[8];
  _QWORD v5[4];
  id v6;

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "setAddSheetViewController:", 0);
  if (*(_BYTE *)(a1 + 49))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __101__SBRootFolderController__internalDismissWidgetAddSheet_clearAddSheetViewController_notifyObservers___block_invoke_2;
    v5[3] = &unk_1E8D85300;
    v2 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v2, "enumerateWidgetAddSheetObserversUsingBlock:", v5);

  }
  os_activity_scope_leave((os_activity_scope_state_t)(*(_QWORD *)(a1 + 32) + 1400));
  SBLogWidgets();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_WIDGET_ADD_SHEET_DISMISS", " isAnimation=YES ", v4, 2u);
  }

}

uint64_t __101__SBRootFolderController__internalDismissWidgetAddSheet_clearAddSheetViewController_notifyObservers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
}

- (BOOL)dismissWidgetAddSheetIfPresentedAndClearAnimated:(BOOL)a3
{
  return -[SBRootFolderController _internalDismissWidgetAddSheet:clearAddSheetViewController:notifyObservers:](self, "_internalDismissWidgetAddSheet:clearAddSheetViewController:notifyObservers:", a3, 1, 1);
}

- (void)scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[SBRootFolderController isTrailingCustomViewVisibleOrTransitionDestination](self, "isTrailingCustomViewVisibleOrTransitionDestination"))
  {
    -[SBFolderController scrollUsingDecelerationAnimationToPageIndex:withCompletionHandler:](self, "scrollUsingDecelerationAnimationToPageIndex:withCompletionHandler:", -[SBFolderController lastIconPageIndex](self, "lastIconPageIndex"), v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBRootFolderController;
    -[SBFolderController scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:](&v5, sel_scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler_, v4);
  }

}

- (double)_additionalMinimumOffsetForSheetPresentation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  -[SBFolderController listLayoutProvider](self, "listLayoutProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutInsetsForOrientation:", -[SBFolderController orientation](self, "orientation"));
  v6 = v5;
  SBHIconListLayoutIconImageInfoForGridSizeClass(v4, CFSTR("SBHIconGridSizeClassDefault"));
  v8 = v6 + v7 * 0.5;
  -[SBRootFolderController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _UISheetMinimumTopInset();
  v11 = v10;

  return v8 - v11;
}

- (id)widgetIconForGalleryItem:(id)a3 sizeClass:(int64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  v11 = objc_opt_class();
  v12 = v8;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  if (v10)
  {
    -[SBRootFolderController widgetIconForDescriptor:sizeClass:](self, "widgetIconForDescriptor:sizeClass:", v10, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v14)
  {
    objc_msgSend(v14, "descriptorsForSizeClass:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderController widgetIconForDescriptors:sizeClass:](self, "widgetIconForDescriptors:sizeClass:", v16, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4
{
  id v6;
  void *v7;
  SBWidgetIcon *v8;
  void *v9;

  v6 = a3;
  -[SBFolderController gridSizeClassDomain](self, "gridSizeClassDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBWidgetIcon initWithCHSWidgetDescriptor:inDomain:]([SBWidgetIcon alloc], "initWithCHSWidgetDescriptor:inDomain:", v6, v7);

  objc_msgSend(v7, "iconGridSizeClassForCHSWidgetFamily:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIcon setGridSizeClass:](v8, "setGridSizeClass:", v9);

  return v8;
}

- (id)widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4
{
  id v6;
  void *v7;
  SBWidgetIcon *v8;
  void *v9;

  v6 = a3;
  -[SBFolderController gridSizeClassDomain](self, "gridSizeClassDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBWidgetIcon initWithCHSWidgetDescriptors:inDomain:]([SBWidgetIcon alloc], "initWithCHSWidgetDescriptors:inDomain:", v6, v7);

  objc_msgSend(v7, "iconGridSizeClassForCHSWidgetFamily:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIcon setGridSizeClass:](v8, "setGridSizeClass:", v9);

  return v8;
}

- (void)didBeginDraggingWidgetIcon:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void (**v12)(void *, const __CFString *);
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (-[SBRootFolderController _addWidgetSheetStyle](self, "_addWidgetSheetStyle", a3) == 1)
  {
    -[SBRootFolderController addSheetViewController](self, "addSheetViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sheetPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3C78], "customDetentWithIdentifier:resolver:", CFSTR("AddWidgetSheetDodge"), &__block_literal_global_115);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDetents:", v7);

    objc_msgSend(v5, "setLargestUndimmedDetentIdentifier:", CFSTR("AddWidgetSheetDodge"));
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__SBRootFolderController_didBeginDraggingWidgetIcon___block_invoke_2;
    v15[3] = &unk_1E8D84C50;
    v10 = v4;
    v16 = v10;
    objc_msgSend(v8, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v15, &__block_literal_global_119, 0.6, 0.0, 1.0, 0.0);
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __53__SBRootFolderController_didBeginDraggingWidgetIcon___block_invoke_4;
    v13[3] = &unk_1E8D853B0;
    v14 = v10;
    v11 = v10;
    v12 = (void (**)(void *, const __CFString *))_Block_copy(v13);
    v12[2](v12, CFSTR("SBRootFolderControllerKeepRootStaticAssertion"));
    v12[2](v12, CFSTR("SBRootFolderControllerKeepStackStaticAssertion"));

  }
  else
  {
    -[SBRootFolderController _internalDismissWidgetAddSheet:clearAddSheetViewController:notifyObservers:](self, "_internalDismissWidgetAddSheet:clearAddSheetViewController:notifyObservers:", 1, 0, 0);
  }
}

double __53__SBRootFolderController_didBeginDraggingWidgetIcon___block_invoke()
{
  return 150.0;
}

void __53__SBRootFolderController_didBeginDraggingWidgetIcon___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __53__SBRootFolderController_didBeginDraggingWidgetIcon___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "invalidate");
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
}

- (void)didEndDraggingWidgetIcon:(id)a3
{
  unint64_t v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD v7[5];
  id v8;

  v4 = -[SBRootFolderController _addWidgetSheetStyle](self, "_addWidgetSheetStyle", a3);
  -[SBRootFolderController addSheetViewController](self, "addSheetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_appearState") && v4 == 1)
  {
    v6 = dispatch_time(0, 600000000);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__SBRootFolderController_didEndDraggingWidgetIcon___block_invoke;
    v7[3] = &unk_1E8D84EF0;
    v7[4] = self;
    v8 = v5;
    dispatch_after(v6, MEMORY[0x1E0C80D38], v7);

  }
}

void __51__SBRootFolderController_didEndDraggingWidgetIcon___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "addSheetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sheetPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3C78], "largeDetent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDetents:", v5);

  objc_msgSend(v3, "setLargestUndimmedDetentIdentifier:", 0);
  v6 = MEMORY[0x1E0C809B0];
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__SBRootFolderController_didEndDraggingWidgetIcon___block_invoke_2;
  v13[3] = &unk_1E8D84C50;
  v14 = *(id *)(a1 + 40);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __51__SBRootFolderController_didEndDraggingWidgetIcon___block_invoke_3;
  v10[3] = &unk_1E8D853D8;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v9;
  objc_msgSend(v7, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v13, v10, 0.6, 0.0, 1.0, 0.0);

}

void __51__SBRootFolderController_didEndDraggingWidgetIcon___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

void __51__SBRootFolderController_didEndDraggingWidgetIcon___block_invoke_3(uint64_t a1)
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
  id v12;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("SBRootFolderControllerKeepRootStaticAssertion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "keepIconImageViewControllersSnapshotsOfType:inAllPagesExcluding:forReason:", objc_msgSend(*(id *)(a1 + 40), "snapshotTypeForIconImageViewControllersUnderWidgetAddSheet"), 0, CFSTR("Add Sheet view controller after dragging end"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "userInfo");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("SBRootFolderControllerKeepRootStaticAssertion"));

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "stackConfigurationViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v12 = v7;
      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("SBRootFolderControllerKeepStackStaticAssertion"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v12;
      if (!v9)
      {
        objc_msgSend(v12, "keepIconImageViewControllersStaticForReason:", CFSTR("Add Sheet view controller after dragging end"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 32), "userInfo");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("SBRootFolderControllerKeepStackStaticAssertion"));

        }
        v7 = v12;
      }
    }

  }
}

- (void)stackConfigurationViewControllerWillAppear:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = objc_opt_class();
  v10 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v10;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  -[SBRootFolderController stackConfigurationViewController](self, "stackConfigurationViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v7)
  {
    -[SBRootFolderController setStackConfigurationViewController:](self, "setStackConfigurationViewController:", v7);
    -[SBRootFolderController _addWidgetSheetConfigurationManager](self, "_addWidgetSheetConfigurationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchGalleryContentForStackConfigurationViewController:addWidgetSheetViewController:", v7, self->_addSheetViewController);

  }
  -[SBRootFolderController _handleWidgetSheetViewControllerWillAppear:](self, "_handleWidgetSheetViewControllerWillAppear:", v10);

}

- (void)stackConfigurationViewControllerDidAppear:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBRootFolderController _handleWidgetSheetViewControllerDidAppear:](self, "_handleWidgetSheetViewControllerDidAppear:");
  -[SBFolderController keepIconImageViewControllersSnapshotsOfType:inAllPagesExcluding:forReason:](self, "keepIconImageViewControllersSnapshotsOfType:inAllPagesExcluding:forReason:", 1, 0, CFSTR("Stack Configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("SBRootFolderControllerKeepRootStaticAssertion"));

  }
}

- (void)stackConfigurationViewControllerDidDisappear:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = objc_opt_class();
  v10 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v10;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  -[SBRootFolderController stackConfigurationViewController](self, "stackConfigurationViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[SBRootFolderController setStackConfigurationViewController:](self, "setStackConfigurationViewController:", 0);
    -[SBRootFolderController _addWidgetSheetConfigurationManager](self, "_addWidgetSheetConfigurationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStackConfigurationSuggestedWidgetItems:", 0);

  }
  -[SBRootFolderController _handleWidgetSheetViewControllerDidDisappear:](self, "_handleWidgetSheetViewControllerDidDisappear:", v10);

}

- (void)stackConfigurationInteraction:(id)a3 requestsPresentAddWidgetSheetFromPresenter:(id)a4
{
  id v6;
  void *v7;
  SBHIconGridSizeClassSet *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeClass");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = -[SBHIconGridSizeClassSet initWithGridSizeClass:]([SBHIconGridSizeClassSet alloc], "initWithGridSizeClass:", v9);
  -[SBRootFolderController presentWidgetEditingViewControllerFromViewController:withAllowedSizeClasses:allowingNonStackableItems:](self, "presentWidgetEditingViewControllerFromViewController:withAllowedSizeClasses:allowingNonStackableItems:", v6, v8, 0);

}

- (id)stackConfigurationInteraction:(id)a3 draggedIconForIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "rootFolderController:draggedIconForStackConfigurationInteractionForIdentifier:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)stackConfigurationInteraction:(id)a3 isConsumingDropSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "rootFolderController:noteDragItemWasConsumedExternallyForDropSession:", self, v5);
  -[SBFolderController iconModel](self, "iconModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "items", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "sbh_appDragLocalContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uniqueIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeIconForIdentifier:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)stackConfigurationInteraction:(id)a3 noteDidRemoveSuggestedWidgetIcon:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "rootFolderController:noteDidRemoveSuggestedWidgetIcon:", self, v6);

}

- (void)stackConfigurationInteractionWillAnimateWidgetInsertion:(id)a3
{
  id v4;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "rootFolderControllerWillAnimateWidgetInsertionForStackConfigurationInteraction:", self);

}

- (id)stackConfigurationInteraction:(id)a3 dragPreviewForIconView:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "rootFolderController:dragPreviewForIconView:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)windowForIconDragPreviewsForStackConfigurationInteraction:(id)a3 forWindowScene:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "windowForStackConfigurationIconDragPreviewsForRootFolderController:forWindowScene:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)stackConfigurationInteraction:(id)a3 promoteSuggestedWidget:(id)a4 withinStack:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "rootFolderController:promoteSuggestedWidget:withinStack:", self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)stackConfigurationInteraction:(id)a3 allowsRemovalOfIconDataSource:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "rootFolderController:allowsRemovalOfIconDataSourceWithinStack:", self, v5);
  else
    v7 = 1;

  return v7;
}

- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__SBRootFolderController_addWidgetSheetViewController_didSelectWidgetIconView___block_invoke;
  aBlock[3] = &unk_1E8D84C50;
  aBlock[4] = self;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v7, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "presenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderController folderDelegate](self, "folderDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "rootFolderController:handleInsertionForWidgetIcon:withReferenceIconView:fromPresenter:dismissViewControllerHandler:", self, v9, v7, v10, v8);
    else
      v8[2](v8);

  }
  else
  {
    v8[2](v8);
  }

}

uint64_t __79__SBRootFolderController_addWidgetSheetViewController_didSelectWidgetIconView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalDismissWidgetAddSheet:clearAddSheetViewController:notifyObservers:", 1, 0, 0);
}

- (void)addWidgetSheetViewControllerDidCancel:(id)a3
{
  -[SBNestingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)addWidgetSheetViewControllerWillAppear:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBRootFolderController _handleWidgetSheetViewControllerWillAppear:](self, "_handleWidgetSheetViewControllerWillAppear:");
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "rootFolderController:willPresentWidgetEditingViewController:", self, v5);

}

- (void)addWidgetSheetViewControllerDidAppear:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[SBRootFolderController _handleWidgetSheetViewControllerDidAppear:](self, "_handleWidgetSheetViewControllerDidAppear:");
  -[SBFolderController keepIconImageViewControllersSnapshotsOfType:inAllPagesExcluding:forReason:](self, "keepIconImageViewControllersSnapshotsOfType:inAllPagesExcluding:forReason:", -[SBRootFolderController snapshotTypeForIconImageViewControllersUnderWidgetAddSheet](self, "snapshotTypeForIconImageViewControllersUnderWidgetAddSheet"), 0, CFSTR("Add Widget Sheet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v11, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("SBRootFolderControllerKeepRootStaticAssertion"));

  }
  -[SBRootFolderController stackConfigurationViewController](self, "stackConfigurationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "keepIconImageViewControllersStaticForReason:", CFSTR("Add Widget Sheet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v11, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("SBRootFolderControllerKeepStackStaticAssertion"));

    }
  }
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "rootFolderController:didPresentWidgetEditingViewController:", self, v11);

}

- (void)addWidgetSheetViewControllerWillDisappear:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBRootFolderController _handleWidgetSheetViewControllerWillDisappear:](self, "_handleWidgetSheetViewControllerWillDisappear:");
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "rootFolderController:willDismissWidgetEditingViewController:", self, v5);

}

- (void)addWidgetSheetViewControllerDidDisappear:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBRootFolderController _handleWidgetSheetViewControllerDidDisappear:](self, "_handleWidgetSheetViewControllerDidDisappear:");
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "rootFolderController:didDismissWidgetEditingViewController:", self, v5);

}

- (void)_handleWidgetSheetViewControllerWillAppear:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSuppressesEditingStateForListView:", 1);
  -[SBRootFolderController _updateStatusBarHiddenForWidgetSheetViewController:visible:](self, "_updateStatusBarHiddenForWidgetSheetViewController:visible:", v4, 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v4, "hidesPresenterTitledButtons"))
      v6 = 0.0;
    else
      v6 = 0.3;
  }
  else
  {
    v6 = 0.3;
  }
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__SBRootFolderController__handleWidgetSheetViewControllerWillAppear___block_invoke;
  v9[3] = &unk_1E8D84C50;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "animateWithDuration:animations:completion:", v9, 0, v6);

}

uint64_t __69__SBRootFolderController__handleWidgetSheetViewControllerWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTitledButtonsAlpha:", 0.0);
}

- (void)_handleWidgetSheetViewControllerWillDisappear:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void (**v10)(void *, const __CFString *);
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(v4, "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSuppressesEditingStateForListView:", 0);
  -[SBRootFolderController _updateStatusBarHiddenForWidgetSheetViewController:visible:](self, "_updateStatusBarHiddenForWidgetSheetViewController:visible:", v4, 0);
  v6 = MEMORY[0x1E0C809B0];
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__SBRootFolderController__handleWidgetSheetViewControllerWillDisappear___block_invoke;
  v13[3] = &unk_1E8D84C50;
  v14 = v5;
  v8 = v5;
  objc_msgSend(v7, "animateWithDuration:animations:completion:", v13, 0, 0.3);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __72__SBRootFolderController__handleWidgetSheetViewControllerWillDisappear___block_invoke_2;
  v11[3] = &unk_1E8D853B0;
  v12 = v4;
  v9 = v4;
  v10 = (void (**)(void *, const __CFString *))_Block_copy(v11);
  v10[2](v10, CFSTR("SBRootFolderControllerKeepRootStaticAssertion"));
  v10[2](v10, CFSTR("SBRootFolderControllerKeepStackStaticAssertion"));

}

uint64_t __72__SBRootFolderController__handleWidgetSheetViewControllerWillDisappear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTitledButtonsAlpha:", 1.0);
}

void __72__SBRootFolderController__handleWidgetSheetViewControllerWillDisappear___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "invalidate");
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
}

- (void)_handleWidgetSheetViewControllerDidDisappear:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "presenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateExtraButtonVisibilityAnimated:", 1);
  -[SBRootFolderController _updateStatusBarHiddenForWidgetSheetViewController:visible:](self, "_updateStatusBarHiddenForWidgetSheetViewController:visible:", v4, 0);

}

- (void)_updateStatusBarHiddenForWidgetSheetViewController:(id)a3 visible:(BOOL)a4
{
  _BOOL4 v4;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  v6 = objc_opt_respondsToSelector();
  v7 = v10;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v10, "nonEditingStatusBarHidingReason");
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v8)
    {
      v9 = (void *)v8;
      if (v4)
      {
        -[SBFolderController _hideStatusBarForReason:animated:](self, "_hideStatusBarForReason:animated:", v8, 1);
        -[SBFolderController _hideFakeStatusBarForReason:animated:](self, "_hideFakeStatusBarForReason:animated:", v9, 1);
      }
      else
      {
        -[SBFolderController _unhideStatusBarForReason:](self, "_unhideStatusBarForReason:", v8);
        -[SBFolderController _unhideFakeStatusBarForReason:animated:](self, "_unhideFakeStatusBarForReason:animated:", v9, 1);
      }

      v7 = v10;
    }
  }

}

- (BOOL)canShowWidgetIntroduction
{
  int64_t v3;
  int64_t v4;
  _BOOL4 v5;
  NSObject *v6;
  int v8;
  _BOOL8 v9;
  __int16 v10;
  _BOOL8 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[SBFolderController currentPageIndex](self, "currentPageIndex");
  v4 = -[SBFolderController firstIconPageIndex](self, "firstIconPageIndex");
  v5 = -[SBRootFolderController isDisplayingWidgetIntroductionOnPage:](self, "isDisplayingWidgetIntroductionOnPage:", v3);
  SBLogWidgetDiscoverabilityMigration();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218240;
    v9 = v3 == v4;
    v10 = 2048;
    v11 = v5;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "Root folder can show widget discoverability= %ld, is showing = %ld", (uint8_t *)&v8, 0x16u);
  }

  return v3 == v4 && !v5;
}

- (BOOL)iconListViewsContainWidget
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
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
  -[SBFolderController iconListViews](self, "iconListViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "containsWidget") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)iconListViewContainsWidget:(unint64_t)a3
{
  void *v3;
  char v4;

  -[SBFolderController iconListViewAtIndex:](self, "iconListViewAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsWidget");

  return v4;
}

- (void)updatePronouncedContainerViewVisibilityIfPossible:(BOOL)a3 vertical:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  int64_t v7;
  unint64_t v8;
  BOOL v9;
  NSObject *v10;
  int64_t v11;
  NSObject *v12;
  int v13;
  _BOOL8 v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = -[SBFolderController currentPageIndex](self, "currentPageIndex");
  v8 = -[SBFolderController iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
    if (!v5)
      goto LABEL_8;
  }
  else
  {
    v9 = -[SBRootFolderController iconListViewContainsWidget:](self, "iconListViewContainsWidget:", v8);
    if (!v5)
    {
LABEL_8:
      v11 = -[SBFolderController firstIconPageIndex](self, "firstIconPageIndex");
      -[SBFolderController iconListViewAtIndex:](self, "iconListViewAtIndex:", -[SBFolderController iconListViewIndexForPageIndex:](self, "iconListViewIndexForPageIndex:", v11));
      v10 = objc_claimAutoreleasedReturnValue();
      SBLogWidgetDiscoverabilityMigration();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 134218496;
        v14 = v5;
        v15 = 2048;
        v16 = v7;
        v17 = 2048;
        v18 = v11;
        _os_log_impl(&dword_1CFEF3000, v12, OS_LOG_TYPE_DEFAULT, "Should add pronounced container: toVisible(%ld), currentPageIndex(%ld), firstIconPageIndex(%ld)", (uint8_t *)&v13, 0x20u);
      }

      if (v7 == v11 && v5)
      {
        -[NSObject layoutIconsNow](v10, "layoutIconsNow");
        -[NSObject addPronouncedContainerViewWithDelegate:vertical:](v10, "addPronouncedContainerViewWithDelegate:vertical:", self, v4);
      }
      else
      {
        -[NSObject removePronouncedContainerView](v10, "removePronouncedContainerView");
      }
      goto LABEL_14;
    }
  }
  if (v9)
    goto LABEL_8;
  SBLogWidgetDiscoverabilityMigration();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "No need to update pronounced container", (uint8_t *)&v13, 2u);
  }
LABEL_14:

}

- (void)acceptWidgetIntroduction
{
  id v3;

  -[SBRootFolderController updatePronouncedContainerViewVisibilityIfPossible:vertical:](self, "updatePronouncedContainerViewVisibilityIfPossible:vertical:", 0, 0);
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "rootFolderControllerDidAcceptWidgetIntroduction:", self);

}

- (void)rejectWidgetIntroduction
{
  id v3;

  -[SBFolderController folderDelegate](self, "folderDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v3, "rootFolderControllerDidSetPrototypeSettingEditAsUndo:", self))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "rootFolderControllerDidUndoWidgetIntroduction:", self);
  }
  else
  {
    -[SBRootFolderController updatePronouncedContainerViewVisibilityIfPossible:vertical:](self, "updatePronouncedContainerViewVisibilityIfPossible:vertical:", 0, 0);
    objc_msgSend(v3, "folderControllerShouldBeginEditing:withHaptic:", self, 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "rootFolderControllerDidEditWidgetIntroduction:", self);
  }

}

- (id)viewControllerForPageState:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if ((a3 | 2) == 3)
  {
    -[SBRootFolderController searchPresentableViewController](self, "searchPresentableViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      -[SBRootFolderController pullDownSearchViewController](self, "pullDownSearchViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)viewControllerForTransitioningFromPageState:(int64_t)a3 toPageState:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if ((unint64_t)(a4 - 1) < 4)
    goto LABEL_4;
  if (!a4)
  {
LABEL_5:
    -[SBRootFolderController viewControllerForPageState:](self, "viewControllerForPageState:", a3, v4, v5);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4 == -1)
  {
LABEL_4:
    a3 = a4;
    goto LABEL_5;
  }
  return 0;
}

- (void)addPageStateObserver:(id)a3
{
  id v4;
  NSHashTable *pageStateObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  pageStateObservers = self->_pageStateObservers;
  v8 = v4;
  if (!pageStateObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_pageStateObservers;
    self->_pageStateObservers = v6;

    v4 = v8;
    pageStateObservers = self->_pageStateObservers;
  }
  -[NSHashTable addObject:](pageStateObservers, "addObject:", v4);

}

- (void)removePageStateObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_pageStateObservers, "removeObject:", a3);
}

- (void)enumeratePageStateObserversUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
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
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSHashTable allObjects](self->_pageStateObservers, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)addWidgetAddSheetObserver:(id)a3
{
  id v4;
  NSMapTable *v5;
  NSMapTable *widgetAddSheetObservers;
  void *v7;
  NSMapTable *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (!self->_widgetAddSheetObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    widgetAddSheetObservers = self->_widgetAddSheetObservers;
    self->_widgetAddSheetObservers = v5;

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_widgetAddSheetObservers;
  v9 = (void *)objc_msgSend(v4, "copy");
  v10 = _Block_copy(v9);
  -[NSMapTable setObject:forKey:](v8, "setObject:forKey:", v10, v7);

  return v7;
}

- (void)removeWidgetAddSheetObserverForHandle:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_widgetAddSheetObservers, "removeObjectForKey:", a3);
}

- (void)enumerateWidgetAddSheetObserversUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
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
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable objectEnumerator](self->_widgetAddSheetObservers, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)allowsAutoscrollToLeadingCustomView
{
  void *v2;
  char v3;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsAutoscrollToLeadingCustomView");

  return v3;
}

- (void)setAllowsAutoscrollToLeadingCustomView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsAutoscrollToLeadingCustomView:", v3);

}

- (UIView)searchableLeadingCustomWrapperView
{
  void *v2;
  void *v3;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingCustomViewWrapperView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIView)searchBackdropView
{
  void *v2;
  void *v3;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchBackdropView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (SBFParallaxSettings)parallaxSettings
{
  void *v2;
  void *v3;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parallaxSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBFParallaxSettings *)v3;
}

- (void)setParallaxDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setParallaxDisabled:forReason:", v4, v6);

}

- (BOOL)isPageManagementUITransitioningOutOfVisible
{
  void *v2;
  char v3;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPageManagementUITransitioningOutOfVisible");

  return v3;
}

- (void)enterPageManagementUIWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterPageManagementUIWithCompletionHandler:", v4);

}

- (void)exitPageManagementUIWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exitPageManagementUIWithCompletionHandler:", v4);

}

- (void)setOccludedByOverlay:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOccludedByOverlay:", v3);

}

- (BOOL)isOccludedByOverlay
{
  void *v2;
  char v3;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOccludedByOverlay");

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[7];
  _QWORD v13[5];
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)SBRootFolderController;
  v7 = a4;
  -[SBFolderController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_msgSend(v7, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "_toWindowOrientation");
  v11 = objc_msgSend(v9, "_fromWindowOrientation");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__SBRootFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_1E8D85400;
  v13[4] = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__SBRootFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &unk_1E8D85428;
  v12[4] = self;
  *(double *)&v12[5] = width;
  *(double *)&v12[6] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v13, v12);

  if ((unint64_t)(v10 - 1) < 2 != (unint64_t)(v11 - 1) < 2)
    -[SBRootFolderController _refreshGalleryContentForHomeScreenEditingIfNecessary](self, "_refreshGalleryContentForHomeScreenEditingIfNecessary");

}

uint64_t __77__SBRootFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isEditing"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addSheetViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && objc_msgSend(v3, "presenterType") != 2)
      objc_msgSend(v2, "setGalleryLayoutSize:", objc_msgSend(*(id *)(a1 + 32), "_currentHomeScreenEditingGridSize"));
    objc_msgSend(v2, "sheetPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrefersGrabberVisible:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_additionalMinimumOffsetForSheetPresentation");
    objc_msgSend(v5, "_setAdditionalMinimumTopInset:");

  }
  return objc_msgSend(*(id *)(a1 + 32), "updateExtraButtonVisibilityAnimated:", 1);
}

void __77__SBRootFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "searchGesture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateForRotation");

  objc_msgSend(*(id *)(a1 + 32), "folderDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "rootFolderController:viewDidTransitionToSize:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (void)folderView:(id)a3 willAnimateScrollToPageIndex:(int64_t)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderController;
  -[SBFolderController folderView:willAnimateScrollToPageIndex:](&v6, sel_folderView_willAnimateScrollToPageIndex_, a3, a4);
  if (!-[SBRootFolderController isTransitioningBetweenPageStateVerticalGroups](self, "isTransitioningBetweenPageStateVerticalGroups"))
  {
    if (-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState"))
    {
      -[SBRootFolderController currentTransitionHandle](self, "currentTransitionHandle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endTransitionSuccessfully:", 0);

    }
  }
}

- (void)folderView:(id)a3 didBeginEditingTitle:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "folderController:didBeginEditingTitle:", self, v6);

}

- (void)folderView:(id)a3 didEndEditingTitle:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "folderController:didEndEditingTitle:", self, v6);

}

- (void)rootFolderView:(id)a3 wantsToAdjustLeadingCustomContentForEdgeBounceForScrollOffset:(CGPoint)a4
{
  double y;
  double x;
  id v7;

  y = a4.y;
  x = a4.x;
  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "rootFolderController:wantsToAdjustLeadingCustomContentForEdgeBounceForScrollOffset:", self, x, y);

}

- (double)distanceToTopOfSpotlightIconsForRootFolderView:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "distanceToTopOfSpotlightIconsForRootFolderController:", self);
    v5 = v6;
  }

  return v5;
}

- (double)maxExternalDockHeightForRootFolderView:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "maxExternalDockHeightForRootFolderController:", self);
    v5 = v6;
  }

  return v5;
}

- (double)externalDockHeightForRootFolderView:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "externalDockHeightForRootFolderController:", self);
    v5 = v6;
  }

  return v5;
}

- (double)preferredExternalDockVerticalMarginForRootFolderView:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "preferredExternalDockVerticalMarginForRootFolderController:", self);
    v5 = v6;
  }

  return v5;
}

- (id)backgroundViewForDockForRootFolderView:(id)a3
{
  void *v4;
  void *v5;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "backgroundViewForDockForRootFolderController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)backgroundViewForEditingDoneButtonForRootFolderView:(id)a3
{
  void *v4;
  void *v5;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "backgroundViewForEditingDoneButtonForRootFolderController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)rootFolderView:(id)a3 didOverscrollOnFirstPageByAmount:(double)a4
{
  id v6;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "rootFolderController:didOverscrollOnFirstPageByAmount:", self, a4);

}

- (void)rootFolderView:(id)a3 didEndOverscrollOnFirstPageWithVelocity:(double)a4 translation:(double)a5
{
  id v8;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "rootFolderController:didEndOverscrollOnFirstPageWithVelocity:translation:", self, a4, a5);

}

- (void)rootFolderView:(id)a3 didOverscrollOnLastPageByAmount:(double)a4
{
  id v6;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "rootFolderController:didOverscrollOnLastPageByAmount:", self, a4);

}

- (void)rootFolderView:(id)a3 didEndOverscrollOnLastPageWithVelocity:(double)a4 translation:(double)a5
{
  id v8;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "rootFolderController:didEndOverscrollOnLastPageWithVelocity:translation:", self, a4, a5);

}

- (void)rootFolderViewWantsToEndEditing:(id)a3
{
  id v4;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "folderControllerShouldEndEditing:", self);

}

- (void)rootFolderViewWantsSearchPresented:(id)a3
{
  -[SBRootFolderController setPresentationSource:](self, "setPresentationSource:", 8);
  -[SBRootFolderController presentSpotlightAnimated:completionHandler:](self, "presentSpotlightAnimated:completionHandler:", 1, 0);
  -[SBRootFolderController setPresentationSource:](self, "setPresentationSource:", 0);
}

- (void)rootFolderView:(id)a3 willPresentPageManagementWithLayoutManager:(id)a4 animator:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0CB36B8];
  v13 = a3;
  objc_msgSend(v12, "indexSetWithIndex:", objc_msgSend(v13, "currentPageIndex"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderController keepIconImageViewControllersSnapshotsOfType:inAllPagesExcluding:forReason:](self, "keepIconImageViewControllersSnapshotsOfType:inAllPagesExcluding:forReason:", 1, v14, CFSTR("SBKeepIconImageViewControllersStaticForPageManagementUIVisibleReason"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("SBKeepIconImageViewControllersStaticForPageManagementUIVisibleReason"));
  -[SBRootFolderController setSuppressesExtraEditingButtons:](self, "setSuppressesExtraEditingButtons:", 0);
  objc_msgSend(v13, "folder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBRootFolderController setHiddenListCountWhenPageManagementPresented:](self, "setHiddenListCountWhenPageManagementPresented:", objc_msgSend(v16, "hiddenListCount"));
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v17, "rootFolderController:willPresentPageManagementWithLayoutManager:animator:context:", self, v18, v10, v11);

}

- (void)rootFolderView:(id)a3 willDismissPageManagementUsingAnimator:(id)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(a3, "currentPageIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderController keepIconImageViewControllersSnapshotsOfType:inAllPagesExcluding:forReason:](self, "keepIconImageViewControllersSnapshotsOfType:inAllPagesExcluding:forReason:", 1, v9, CFSTR("SBKeepIconImageViewControllersStaticForPageManagementUIVisibleReason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("SBKeepIconImageViewControllersStaticForPageManagementUIDismissalReason"));
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "rootFolderController:willDismissPageManagementUsingAnimator:context:", self, v12, v8);

}

- (void)rootFolderView:(id)a3 didDismissPageManagementWithLayoutManager:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
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
  id v26;
  id v27;

  v27 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("SBKeepIconImageViewControllersStaticForPageManagementUIVisibleReason"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("SBKeepIconImageViewControllersStaticForPageManagementUIVisibleReason"));
  objc_msgSend(v9, "objectForKey:", CFSTR("SBKeepIconImageViewControllersStaticForPageManagementUIDismissalReason"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "invalidate");
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("SBKeepIconImageViewControllersStaticForPageManagementUIDismissalReason"));
  -[SBRootFolderController homeScreenDefaults](self, "homeScreenDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "pagesHaveEverBeenHidden") & 1) == 0)
  {
    objc_msgSend(v27, "folder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hiddenListCount");
    if (v14 > -[SBRootFolderController hiddenListCountWhenPageManagementPresented](self, "hiddenListCountWhenPageManagementPresented"))
    {
      objc_msgSend(v12, "setPagesHaveEverBeenHidden:", 1);
      v25 = (void *)MEMORY[0x1E0DC3450];
      SBHBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PAGE_HIDING_ALERT_TITLE"), &stru_1E8D8E958);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      SBHBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PAGE_HIDING_ALERT_BODY"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v26 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "alertControllerWithTitle:message:preferredStyle:", v16, v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0DC3448];
      SBHBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "addAction:", v23);
      -[SBRootFolderController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);

      v8 = v26;
    }

  }
  -[SBFolderController folderDelegate](self, "folderDelegate", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v24, "rootFolderController:didDismissPageManagementWithLayoutManager:context:", self, v8, v9);

}

- (id)iconLocationForListsWithNonDefaultSizedIconsForRootFolderView:(id)a3
{
  void *v4;
  void *v5;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "iconLocationForListsWithNonDefaultSizedIconsForRootFolderController:", self);
  else
    objc_msgSend((id)objc_opt_class(), "iconLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_presentPageManagement:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterPageManagementUIWithCompletionHandler:", v4);

}

- (void)_dismissPageManagementIfPresented:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exitPageManagementUIWithCompletionHandler:", v4);

}

- (void)performPageStateTransitionToState:(int64_t)a3 reason:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  void (**v10)(_QWORD);
  int64_t v11;
  void *v12;
  SBRootFolderController *v13;
  uint64_t v14;
  int64_t v15;
  id v16;

  v7 = a5;
  v16 = a4;
  v10 = (void (**)(_QWORD))a6;
  if (-[SBRootFolderController canTransitionPageStateToState:](self, "canTransitionPageStateToState:", a3))
  {
    v11 = -[SBRootFolderController pageState](self, "pageState");
    if (-[SBRootFolderController isAnySearchTransitioning](self, "isAnySearchTransitioning") && (!a3 || !v11))
      v11 = -[SBRootFolderController destinationPageState](self, "destinationPageState");
    switch(a3)
    {
      case -1:
        break;
      case 0:
        if (v11 != 1)
        {
          v15 = -[SBFolderController firstIconPageIndex](self, "firstIconPageIndex");
          goto LABEL_20;
        }
        -[SBRootFolderController searchGesture](self, "searchGesture");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "resetAnimated:", v7);
LABEL_10:

        break;
      case 1:
        -[SBRootFolderController searchGesture](self, "searchGesture");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "revealAnimated:", v7);
        goto LABEL_10;
      case 2:
        if (v11 == 3)
        {
          v13 = self;
          v14 = 2;
LABEL_16:
          -[SBRootFolderController performDefaultPageStateTransitionToState:reason:animated:completionHandler:](v13, "performDefaultPageStateTransitionToState:reason:animated:completionHandler:", v14, v16, v7, v10);
        }
        else
        {
          v15 = -[SBRootFolderController leadingCustomViewPageIndex](self, "leadingCustomViewPageIndex");
LABEL_20:
          -[SBFolderController setCurrentPageIndex:animated:completion:](self, "setCurrentPageIndex:animated:completion:", v15, v7, v10);
        }
        goto LABEL_21;
      case 3:
        v13 = self;
        v14 = 3;
        goto LABEL_16;
      case 4:
        v15 = -[SBRootFolderController trailingCustomViewPageIndex](self, "trailingCustomViewPageIndex");
        goto LABEL_20;
      default:
        goto LABEL_21;
    }
  }
  if (v10)
    v10[2](v10);
LABEL_21:

}

- (void)performDefaultPageStateTransitionToState:(int64_t)a3 reason:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD);
  id v15;
  id v16;
  void (**v17)(void *, _QWORD);
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD aBlock[4];
  id v24;

  v6 = a5;
  v10 = a6;
  -[SBRootFolderController beginPageStateTransitionToState:reason:animated:interactive:](self, "beginPageStateTransitionToState:reason:animated:interactive:", a3, a4, v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__SBRootFolderController_performDefaultPageStateTransitionToState_reason_animated_completionHandler___block_invoke;
  aBlock[3] = &unk_1E8D84C50;
  v13 = v11;
  v24 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __101__SBRootFolderController_performDefaultPageStateTransitionToState_reason_animated_completionHandler___block_invoke_2;
  v20[3] = &unk_1E8D85450;
  v15 = v13;
  v21 = v15;
  v16 = v10;
  v22 = v16;
  v17 = (void (**)(void *, _QWORD))_Block_copy(v20);
  if (v6)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:curve:animations:", 0, v14, 0.3);
    objc_msgSend(v18, "addCompletion:", v17);
    -[SBFolderController folderDelegate](self, "folderDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v19, "rootFolderController:willUsePropertyAnimator:toTransitionToState:", self, v18, a3);
    objc_msgSend(v18, "startAnimation");

  }
  else
  {
    v14[2](v14);
    v17[2](v17, 0);
  }

}

uint64_t __101__SBRootFolderController_performDefaultPageStateTransitionToState_reason_animated_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTransitionProgress:", 1.0);
}

uint64_t __101__SBRootFolderController_performDefaultPageStateTransitionToState_reason_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "endTransitionSuccessfully:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentSpotlightAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(void);
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(void);

  v4 = a3;
  v10 = (void (**)(void))a4;
  if (!-[SBRootFolderController isAnySearchVisibleOrTransitioning](self, "isAnySearchVisibleOrTransitioning")
    && !-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState")
    && !-[SBFolderController isScrolling](self, "isScrolling"))
  {
    -[SBRootFolderController searchPresenter](self, "searchPresenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "presentSearchAnimated:", v4);
      if (v10)
        v10[2]();
    }
    else
    {
      if (-[SBRootFolderController isOnLeadingCustomPage](self, "isOnLeadingCustomPage"))
        v9 = 3;
      else
        v9 = 1;
      -[SBRootFolderController performPageStateTransitionToState:reason:animated:completionHandler:](self, "performPageStateTransitionToState:reason:animated:completionHandler:", v9, CFSTR("present spotlight"), v4, v10);
    }

    goto LABEL_6;
  }
  v6 = v10;
  if (v10)
  {
    ((void (*)(void (**)(void)))v10[2])(v10);
LABEL_6:
    v6 = v10;
  }

}

- (void)dismissSpotlightAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void (**v8)(void);
  uint64_t v9;
  void (**v10)(void);

  v4 = a3;
  v10 = (void (**)(void))a4;
  if (-[SBRootFolderController isPullDownSearchVisibleOrTransitioningToVisible](self, "isPullDownSearchVisibleOrTransitioningToVisible"))
  {
    -[SBRootFolderController searchPresenter](self, "searchPresenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "dismissSearchAnimated:", v4);
      if (v10)
        v10[2]();
    }
    else
    {
      if (-[SBRootFolderController isOnLeadingCustomPage](self, "isOnLeadingCustomPage"))
        v9 = 2;
      else
        v9 = 0;
      -[SBRootFolderController performPageStateTransitionToState:reason:animated:completionHandler:](self, "performPageStateTransitionToState:reason:animated:completionHandler:", v9, CFSTR("dismiss spotlight"), v4, v10);
    }

    goto LABEL_12;
  }
  v8 = v10;
  if (v10)
  {
    ((void (*)(void (**)(void)))v10[2])(v10);
LABEL_12:
    v8 = v10;
  }

}

+ (BOOL)pageStateTransitionPrefersUsingScrollingDirection
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) != 1;
}

+ (SBRootFolderPageStateTransitionSnapshot)pageStateTransitionSnapshotForScrollOffset:(SEL)a3 pageWidth:(double)a4 pageSpacing:(double)a5 pages:(double)a6 pageCount:(const int64_t *)a7 userInterfaceLayoutDirection:(unint64_t)a8 currentPageState:(int64_t)a9 scrollingDirection:(int64_t)a10
{
  SBRootFolderPageStateTransitionSnapshot *result;
  int64_t v17;
  SBRootFolderPageStateTransitionSnapshot *v18;
  int64_t v19;
  double v20;
  uint64_t v21;
  double v22;

  v22 = 0.0;
  result = +[SBFolderView _pageOffsetForOffset:behavior:pageWidth:pageSpacing:pageCount:userInterfaceLayoutDirection:fractionOfDistanceThroughPage:](SBFolderView, "_pageOffsetForOffset:behavior:pageWidth:pageSpacing:pageCount:userInterfaceLayoutDirection:fractionOfDistanceThroughPage:", 0, a8, a9, &v22, a4, a5, a6);
  v17 = a7[(_QWORD)result];
  retstr->var2 = 0.0;
  *(_OWORD *)&retstr->var0 = xmmword_1D01908D0;
  if (v22 <= 0.0)
  {
    v21 = SBRootFolderPageStateVerticalGroupForRootFolderPageState(a10);
    result = (SBRootFolderPageStateTransitionSnapshot *)SBRootFolderPageStateVerticalGroupContainsRootFolderPageState(v21, v17);
    if ((_DWORD)result)
      v17 = a10;
    goto LABEL_8;
  }
  v18 = result;
  if ((unint64_t)result >= a8 - 1)
  {
LABEL_8:
    retstr->var0 = v17;
    v19 = -1;
    goto LABEL_12;
  }
  result = (SBRootFolderPageStateTransitionSnapshot *)+[SBRootFolderController pageStateTransitionPrefersUsingScrollingDirection](SBRootFolderController, "pageStateTransitionPrefersUsingScrollingDirection", v22);
  if (!(_DWORD)result)
  {
    result = (SBRootFolderPageStateTransitionSnapshot *)SBRootFolderPageStateVerticalGroupMatches(v17, a10);
    if (!(_DWORD)result)
      goto LABEL_5;
LABEL_10:
    v19 = a7[(_QWORD)v18 + 1];
    retstr->var0 = v17;
    retstr->var1 = v19;
    v20 = v22;
    goto LABEL_11;
  }
  if (a11 == 2)
    goto LABEL_10;
LABEL_5:
  retstr->var1 = v17;
  v19 = v17;
  v17 = a7[(_QWORD)v18 + 1];
  retstr->var0 = v17;
  v20 = 1.0 - v22;
LABEL_11:
  retstr->var2 = v20;
LABEL_12:
  if (v17 == v19)
  {
    retstr->var1 = -1;
    retstr->var2 = 0.0;
  }
  return result;
}

- (void)_checkForImproperScrollOffsetForPageState
{
  int64_t v3;
  int64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  int64_t v8;
  id v9;

  if (!-[SBFolderController isScrolling](self, "isScrolling"))
  {
    -[SBRootFolderController rootFolderView](self, "rootFolderView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[SBRootFolderController pageState](self, "pageState");
    v4 = -[SBFolderController currentPageIndex](self, "currentPageIndex");
    objc_msgSend(v9, "leadingCustomViewPageScrollOffset");
    v6 = v5;
    if (SBRootFolderPageStateIsOnLeadingCustomPage(v3))
    {
      v7 = (uint64_t)v6;
      if (v4 != (uint64_t)v6)
        goto LABEL_10;
    }
    if (SBRootFolderPageStateIsOnIconPage(v3))
    {
      if (v4 < -[SBFolderController firstIconPageIndex](self, "firstIconPageIndex"))
      {
        v8 = -[SBFolderController firstIconPageIndex](self, "firstIconPageIndex");
LABEL_9:
        v7 = v8;
LABEL_10:
        -[SBRootFolderController setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", v7, 1);
LABEL_12:

        return;
      }
      if (v4 > -[SBFolderController lastIconPageIndex](self, "lastIconPageIndex"))
      {
        v8 = -[SBFolderController lastIconPageIndex](self, "lastIconPageIndex");
        goto LABEL_9;
      }
    }
    objc_msgSend(v9, "resetContentOffsetToCurrentPageAnimated:", 1);
    goto LABEL_12;
  }
}

- (double)visibilityProgressTowardPageStateMatchingTest:(id)a3
{
  uint64_t (**v4)(id, int64_t);
  int v5;
  int64_t v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;

  v4 = (uint64_t (**)(id, int64_t))a3;
  v5 = v4[2](v4, -[SBRootFolderController pageState](self, "pageState"));
  if (-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState"))
  {
    v6 = -[SBRootFolderController destinationPageState](self, "destinationPageState");
    -[SBRootFolderController pageTransitionProgress](self, "pageTransitionProgress");
    v8 = v7;
    v9 = v4[2](v4, v6);
    if ((v5 & v9) != 0)
      v10 = 1.0;
    else
      v10 = v8;
    v11 = 1.0 - v8;
    if (!v5)
      v11 = 0.0;
    v12 = (v9 & 1) == 0;
  }
  else
  {
    v12 = v5 == 0;
    v11 = 0.0;
    v10 = 1.0;
  }
  if (v12)
    v13 = v11;
  else
    v13 = v10;

  return v13;
}

- (BOOL)isPullDownSearchVisibleOrTransitioningToVisible
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;
  BOOL v7;

  -[SBRootFolderController searchPresenter](self, "searchPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isPresenting");
  }
  else
  {
    v6 = -[SBRootFolderController isPullDownSearchVisible](self, "isPullDownSearchVisible");
    if (-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState"))
      v7 = -[SBRootFolderController destinationPageState](self, "destinationPageState") == 1;
    else
      v7 = 0;
    v5 = v6 || v7;
  }

  return v5;
}

- (double)_anySearchVisibilityProgress
{
  double result;

  -[SBRootFolderController visibilityProgressTowardPageStateMatchingTest:](self, "visibilityProgressTowardPageStateMatchingTest:", &__block_literal_global_257);
  return result;
}

BOOL __54__SBRootFolderController__anySearchVisibilityProgress__block_invoke(uint64_t a1, uint64_t a2)
{
  return SBRootFolderPageStateIsSearch(a2);
}

- (BOOL)isOnLeadingCustomPage
{
  BOOL v3;
  _BOOL4 v4;

  v3 = -[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState");
  v4 = SBRootFolderPageStateIsOnLeadingCustomPage(-[SBRootFolderController pageState](self, "pageState"));
  if (!v3 || !v4)
    return !v3 && v4;
  else
    return SBRootFolderPageStateIsOnLeadingCustomPage(-[SBRootFolderController destinationPageState](self, "destinationPageState"));
}

- (BOOL)isLeadingCustomViewVisible
{
  return !-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState")
      && -[SBRootFolderController pageState](self, "pageState") == 2;
}

- (BOOL)isLeadingCustomViewOrLeadingCustomViewSearchVisible
{
  return !-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState")
      && SBRootFolderPageStateIsOnLeadingCustomPage(-[SBRootFolderController pageState](self, "pageState"));
}

- (void)setLeadingCustomViewPageHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[SBRootFolderController isLeadingCustomViewPageHidden](self, "isLeadingCustomViewPageHidden") != a3)
  {
    -[SBRootFolderController leadingCustomViewController](self, "leadingCustomViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (v3)
      {
        objc_msgSend(v6, "willMoveToParentViewController:", 0);
        -[SBRootFolderController removeChildViewController:](self, "removeChildViewController:", v6);
      }
      else
      {
        -[SBRootFolderController addChildViewController:](self, "addChildViewController:", v6);
        objc_msgSend(v6, "didMoveToParentViewController:", self);
      }
    }
    -[SBRootFolderController rootFolderView](self, "rootFolderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLeadingCustomViewPageHidden:", v3);

  }
}

- (BOOL)isLeadingCustomViewPageHidden
{
  void *v2;
  char v3;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLeadingCustomViewPageHidden");

  return v3;
}

- (BOOL)isLeadingCustomViewTransitioning
{
  _BOOL4 v3;

  v3 = -[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState");
  if (v3)
    LOBYTE(v3) = -[SBRootFolderController pageState](self, "pageState") == 2
              || -[SBRootFolderController destinationPageState](self, "destinationPageState") == 2;
  return v3;
}

- (BOOL)isTransitioningBetweenIconAndLeadingCustomView
{
  _BOOL4 v3;
  int64_t v4;
  int64_t v5;

  v3 = -[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState");
  if (v3)
  {
    v4 = -[SBRootFolderController pageState](self, "pageState");
    v5 = -[SBRootFolderController destinationPageState](self, "destinationPageState");
    LOBYTE(v3) = !v4 && v5 == 2 || v4 == 2 && v5 == 0;
  }
  return v3;
}

- (BOOL)isTransitioningBetweenIconPageAndLeadingCustomPage
{
  _BOOL4 v3;
  int64_t v4;
  int64_t v5;

  v3 = -[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState");
  if (v3)
  {
    v4 = -[SBRootFolderController pageState](self, "pageState");
    v5 = -[SBRootFolderController destinationPageState](self, "destinationPageState");
    LOBYTE(v3) = SBRootFolderPageStateIsOnIconPage(v4) && SBRootFolderPageStateIsOnLeadingCustomPage(v5)
              || SBRootFolderPageStateIsOnLeadingCustomPage(v4) && SBRootFolderPageStateIsOnIconPage(v5);
  }
  return v3;
}

- (double)_leadingCustomViewVisibilityProgress
{
  double result;

  -[SBRootFolderController visibilityProgressTowardPageStateMatchingTest:](self, "visibilityProgressTowardPageStateMatchingTest:", &__block_literal_global_258);
  return result;
}

BOOL __62__SBRootFolderController__leadingCustomViewVisibilityProgress__block_invoke(uint64_t a1, uint64_t a2)
{
  return SBRootFolderPageStateIsOnLeadingCustomPage(a2);
}

- (double)_trailingCustomViewVisibilityProgress
{
  double result;

  -[SBRootFolderController visibilityProgressTowardPageStateMatchingTest:](self, "visibilityProgressTowardPageStateMatchingTest:", &__block_literal_global_259);
  return result;
}

BOOL __63__SBRootFolderController__trailingCustomViewVisibilityProgress__block_invoke(uint64_t a1, uint64_t a2)
{
  return SBRootFolderPageStateIsOnTrailingCustomPage(a2);
}

- (BOOL)isTransitioningBetweenIconAndTrailingCustomView
{
  _BOOL4 v3;
  int64_t v4;
  int64_t v5;

  v3 = -[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState");
  if (v3)
  {
    v4 = -[SBRootFolderController pageState](self, "pageState");
    v5 = -[SBRootFolderController destinationPageState](self, "destinationPageState");
    LOBYTE(v3) = !v4 && v5 == 4 || v4 == 4 && v5 == 0;
  }
  return v3;
}

- (BOOL)isTransitioningBetweenIconPageAndTrailingCustomPage
{
  _BOOL4 v3;
  int64_t v4;
  int64_t v5;

  v3 = -[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState");
  if (v3)
  {
    v4 = -[SBRootFolderController pageState](self, "pageState");
    v5 = -[SBRootFolderController destinationPageState](self, "destinationPageState");
    LOBYTE(v3) = SBRootFolderPageStateIsOnIconPage(v4) && SBRootFolderPageStateIsOnTrailingCustomPage(v5)
              || SBRootFolderPageStateIsOnTrailingCustomPage(v4) && SBRootFolderPageStateIsOnIconPage(v5);
  }
  return v3;
}

- (BOOL)isTrailingCustomViewVisibleOrTransitionDestination
{
  int64_t v3;

  if (-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState"))
    v3 = -[SBRootFolderController destinationPageState](self, "destinationPageState");
  else
    v3 = -[SBRootFolderController pageState](self, "pageState");
  return v3 == 4;
}

- (BOOL)isTrailingCustomViewTransitioning
{
  _BOOL4 v3;

  v3 = -[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState");
  if (v3)
    LOBYTE(v3) = -[SBRootFolderController pageState](self, "pageState") == 4
              || -[SBRootFolderController destinationPageState](self, "destinationPageState") == 4;
  return v3;
}

- (BOOL)isTransitioningBetweenHorizontalPageStates
{
  _BOOL4 v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState");
  if (v3)
  {
    v4 = -[SBRootFolderController pageState](self, "pageState");
    v5 = -[SBRootFolderController destinationPageState](self, "destinationPageState");
    LOBYTE(v3) = SBRootFolderPageStateIsOnHorizontalScrollingPlane(v4)
              && SBRootFolderPageStateIsOnHorizontalScrollingPlane(v5);
  }
  return v3;
}

- (int64_t)destinationPageState
{
  if (-[_SBRootFolderPageTransitionHandle isValid](self->_currentTransitionHandle, "isValid"))
    return -[_SBRootFolderPageTransitionHandle destinationPageState](self->_currentTransitionHandle, "destinationPageState");
  else
    return -1;
}

- (double)pageTransitionProgress
{
  double result;

  if (!-[_SBRootFolderPageTransitionHandle isValid](self->_currentTransitionHandle, "isValid"))
    return 0.0;
  -[_SBRootFolderPageTransitionHandle pageTransitionProgress](self->_currentTransitionHandle, "pageTransitionProgress");
  return result;
}

- (id)beginPageStateTransitionToState:(int64_t)a3 reason:(id)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  NSObject *v11;
  SBRootFolderController *v12;
  uint64_t v13;
  _SBRootFolderPageTransitionHandle *v14;
  NSObject *v15;
  void *v17;
  void *v18;
  _QWORD v19[6];
  BOOL v20;
  BOOL v21;
  uint8_t buf[4];
  SBRootFolderController *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  _BYTE v27[10];
  id v28;
  uint64_t v29;

  v6 = a6;
  v7 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  SBLogRootController();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    SBStringForRootFolderPageState(a3);
    v12 = (SBRootFolderController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v23 = v12;
    v24 = 2114;
    v25 = v10;
    v26 = 1024;
    *(_DWORD *)v27 = v7;
    *(_WORD *)&v27[4] = 1024;
    *(_DWORD *)&v27[6] = v6;
    _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "Begin page state transition to state \"%{public}@\", reason: %{public}@, animated: %{BOOL}u, interactive: %{BOOL}u", buf, 0x22u);

  }
  v13 = -[SBRootFolderController pageState](self, "pageState");
  if (-[SBRootFolderController canTransitionPageStateToState:](self, "canTransitionPageStateToState:", a3))
  {
    v14 = -[_SBRootFolderPageTransitionHandle initWithFolderController:destinationPageState:reason:]([_SBRootFolderPageTransitionHandle alloc], "initWithFolderController:destinationPageState:reason:", self, a3, v10);
    -[SBRootFolderController setCurrentTransitionHandle:](self, "setCurrentTransitionHandle:", v14);
    -[SBRootFolderController willBeginTransitionToState:animated:interactive:](self, "willBeginTransitionToState:animated:interactive:", a3, v7, v6);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __86__SBRootFolderController_beginPageStateTransitionToState_reason_animated_interactive___block_invoke;
    v19[3] = &unk_1E8D854D8;
    v19[4] = self;
    v19[5] = a3;
    v20 = v7;
    v21 = v6;
    -[SBRootFolderController enumeratePageStateObserversUsingBlock:](self, "enumeratePageStateObserversUsingBlock:", v19);
  }
  else
  {
    SBLogRootController();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      SBStringForRootFolderPageState(v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      SBStringForRootFolderPageState(a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v23 = self;
      v24 = 2114;
      v25 = v17;
      v26 = 2114;
      *(_QWORD *)v27 = v18;
      *(_WORD *)&v27[8] = 2114;
      v28 = v10;
      _os_log_error_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_ERROR, "Invalid state transition for %@: %{public}@ -> %{public}@, reason: %{public}@", buf, 0x2Au);

    }
    v14 = 0;
  }

  return v14;
}

uint64_t __86__SBRootFolderController_beginPageStateTransitionToState_reason_animated_interactive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rootFolderPageStateProvider:willBeginTransitionToState:animated:interactive:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
}

- (BOOL)canTransitionPageStateToState:(int64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = -[SBRootFolderController pageState](self, "pageState");
  if (-[SBRootFolderController isAnySearchTransitioning](self, "isAnySearchTransitioning") && (!a3 || !v5))
    v5 = -[SBRootFolderController destinationPageState](self, "destinationPageState");
  if (v5 > 4)
  {
    v7 = 0;
  }
  else if (((1 << v5) & 0x15) != 0)
  {
    v6 = SBRootFolderPageStateVerticalGroupForRootFolderPageState(v5);
    v7 = SBRootFolderPageStateVerticalGroupContainsRootFolderPageState(v6, a3)
      || SBRootFolderPageStateIsOnHorizontalScrollingPlane(a3);
  }
  else
  {
    v8 = SBRootFolderPageStateVerticalGroupForRootFolderPageState(v5);
    v9 = SBRootFolderPageStateVerticalGroupContainsRootFolderPageState(v8, a3);
    v10 = (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0 || v9;
    if (a3 == 4)
      v7 = 1;
    else
      v7 = v10;
  }
  v11 = v5 != a3 && v7;
  if (SBRootFolderPageStateIsOnLeadingCustomPage(a3))
  {
    -[SBRootFolderController leadingCustomViewController](self, "leadingCustomViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      v11 = 0;
  }
  if (SBRootFolderPageStateIsSearch(a3))
  {
    -[SBRootFolderController pullDownSearchViewController](self, "pullDownSearchViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

    }
    else
    {
      -[SBRootFolderController searchPresenter](self, "searchPresenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        v11 = 0;
    }
  }
  if (SBRootFolderPageStateIsOnTrailingCustomPage(a3))
  {
    -[SBRootFolderController trailingCustomViewController](self, "trailingCustomViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      return 0;
  }
  return v11;
}

- (void)willBeginTransitionToState:(int64_t)a3 animated:(BOOL)a4 interactive:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  _BOOL4 v9;
  int v10;
  _BOOL4 v11;
  int v12;
  _BOOL4 IsSearch;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  SBViewControllerTransitionContext *currentTransitionContext;
  _BOOL4 v27;
  void *v28;
  SBViewControllerTransitionContext *v29;
  _BOOL4 v30;
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
  SBRootFolderControllerTransitionInfo *v41;
  void *v42;
  SBViewControllerTransitionContext *v43;
  SBViewControllerTransitionContext *v44;
  _BOOL4 v45;
  int v46;
  int v47;
  _BOOL4 v48;
  id v49;

  v5 = a5;
  v48 = a4;
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[SBRootFolderController pageState](self, "pageState");
  v9 = SBRootFolderPageStateIsOnLeadingCustomPage(v8);
  v10 = v9 ^ SBRootFolderPageStateIsOnLeadingCustomPage(a3);
  v11 = SBRootFolderPageStateIsOnTrailingCustomPage(v8);
  v45 = SBRootFolderPageStateIsOnTrailingCustomPage(a3);
  v12 = v11 ^ v45;
  IsSearch = SBRootFolderPageStateIsSearch(v8);
  v14 = SBRootFolderPageStateIsSearch(a3);
  v46 = v10;
  if (v10 == 1)
  {
    -[SBRootFolderController leadingCustomViewController](self, "leadingCustomViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNeedsLayout");
    objc_msgSend(v16, "layoutIfNeeded");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "setContentVisibility:", 0);

  }
  v47 = v12;
  if (v12)
  {
    -[SBRootFolderController trailingCustomViewController](self, "trailingCustomViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNeedsLayout");
    objc_msgSend(v18, "layoutIfNeeded");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v17, "setContentVisibility:", 0);

  }
  -[SBRootFolderController _anySearchVisibilityProgress](self, "_anySearchVisibilityProgress");
  v20 = v19;
  -[SBRootFolderController _leadingCustomViewVisibilityProgress](self, "_leadingCustomViewVisibilityProgress");
  v22 = v21;
  -[SBRootFolderController _trailingCustomViewVisibilityProgress](self, "_trailingCustomViewVisibilityProgress");
  v24 = v23;
  objc_msgSend(v49, "setPullDownSearchVisibilityProgress:", v20);
  objc_msgSend(v49, "setLeadingCustomViewVisibilityProgress:", v22);
  objc_msgSend(v49, "setTrailingCustomViewVisibilityProgress:", v24);
  if (-[SBViewControllerTransitionContext isTransitioning](self->_currentTransitionContext, "isTransitioning")
    && !-[SBViewControllerTransitionContext isCancelled](self->_currentTransitionContext, "isCancelled"))
  {
    v25 = -[SBViewControllerTransitionContext isInteractive](self->_currentTransitionContext, "isInteractive");
    currentTransitionContext = self->_currentTransitionContext;
    if (v25)
      -[SBViewControllerTransitionContext cancelInteractiveTransition](currentTransitionContext, "cancelInteractiveTransition");
    else
      -[SBViewControllerTransitionContext cancelTransition](currentTransitionContext, "cancelTransition");
  }
  v27 = IsSearch ^ v14;
  -[SBRootFolderController accessoryViewControllerDelegate](self, "accessoryViewControllerDelegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rootFolderController:transitionContextForTransitioningToState:animated:interactive:", self, a3, v48, v5);
  v29 = (SBViewControllerTransitionContext *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = v27;
    objc_msgSend(v49, "setShiftsPullDownSearchForVisibility:", 0);
  }
  else
  {
    -[SBRootFolderController defaultTransitionForTransitioningFromPageState:toPageState:animated:interactive:](self, "defaultTransitionForTransitioningFromPageState:toPageState:animated:interactive:", v8, a3, v48, v5);
    v29 = (SBViewControllerTransitionContext *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setShiftsPullDownSearchForVisibility:", v46 ^ 1u);
    if (v27)
    {
      -[SBRootFolderController searchPresentableViewController](self, "searchPresentableViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
        objc_msgSend(v49, "searchBackdropView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (a3 == 1 || v8 == 1)
          objc_msgSend(v32, "prepareForTransitionToBlurred:", v14);

      }
    }
    v30 = v27;
    if (v47)
    {
      objc_msgSend(v49, "trailingCustomBackdropView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "prepareForTransitionToBlurred:", v45);

    }
  }
  -[SBViewControllerTransitionContext setDelegate:](v29, "setDelegate:", self);
  v35 = (void *)MEMORY[0x1E0CB3940];
  SBStringForRootFolderPageState(v8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  SBStringForRootFolderPageState(a3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithFormat:", CFSTR("PageStateTransition %@ -> %@"), v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderController cancelTouchesForAllCustomIconImageViewControllersForReason:](self, "cancelTouchesForAllCustomIconImageViewControllersForReason:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBRootFolderController currentTransitionHandle](self, "currentTransitionHandle");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setCustomIconImageViewControllerCancelTouchesAssertion:", v39);

  v41 = objc_alloc_init(SBRootFolderControllerTransitionInfo);
  -[SBRootFolderControllerTransitionInfo setSourcePageState:](v41, "setSourcePageState:", v8);
  -[SBRootFolderControllerTransitionInfo setDestinationPageState:](v41, "setDestinationPageState:", a3);
  -[SBViewControllerTransitionContext setUserInfo:](v29, "setUserInfo:", v41);
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v42, "rootFolderController:willUseTransitionContext:toTransitionToState:", self, v29, a3);
  if (v30)
    objc_msgSend(v49, "setSearchHidden:", 0);
  v43 = self->_currentTransitionContext;
  self->_currentTransitionContext = v29;
  v44 = v29;

  -[SBViewControllerTransitionContext startTransition](v44, "startTransition");
}

- (void)didContinueTransitionToState:(int64_t)a3 progress:(double)a4
{
  void *v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void (**v15)(void *, uint64_t, void *);
  void *v16;
  void *v17;
  uint64_t isKindOfClass;
  void *v19;
  _QWORD aBlock[7];

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBRootFolderController pageState](self, "pageState");
  -[SBRootFolderController _anySearchVisibilityProgress](self, "_anySearchVisibilityProgress");
  v10 = v9;
  -[SBRootFolderController _leadingCustomViewVisibilityProgress](self, "_leadingCustomViewVisibilityProgress");
  v12 = v11;
  -[SBRootFolderController _trailingCustomViewVisibilityProgress](self, "_trailingCustomViewVisibilityProgress");
  v14 = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__SBRootFolderController_didContinueTransitionToState_progress___block_invoke;
  aBlock[3] = &__block_descriptor_56_e33_v24__0q8__SBSearchBackdropView_16l;
  aBlock[4] = v8;
  aBlock[5] = a3;
  *(double *)&aBlock[6] = a4;
  v15 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
  -[SBRootFolderController searchPresentableViewController](self, "searchPresentableViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_5;
    objc_msgSend(v7, "searchBackdropView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 1, v16);
  }

LABEL_5:
  objc_msgSend(v7, "trailingCustomBackdropView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2](v15, 4, v19);

  objc_msgSend(v7, "setPullDownSearchVisibilityProgress:", v10);
  objc_msgSend(v7, "setLeadingCustomViewVisibilityProgress:", v12);
  objc_msgSend(v7, "setTrailingCustomViewVisibilityProgress:", v14);
  if (-[SBViewControllerTransitionContext isInteractive](self->_currentTransitionContext, "isInteractive"))
    -[SBViewControllerTransitionContext updateInteractiveTransition:](self->_currentTransitionContext, "updateInteractiveTransition:", a4);

}

void __64__SBRootFolderController_didContinueTransitionToState_progress___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  if (*(_QWORD *)(a1 + 32) == a2 || *(_QWORD *)(a1 + 40) == a2)
  {
    v6 = v5;
    objc_msgSend(v5, "setTransitionProgress:", *(double *)(a1 + 48));
    v5 = v6;
  }

}

- (void)willEndTransitionToState:(int64_t)a3 successfully:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  int64_t v8;
  void (**v9)(void *, uint64_t, void *);
  void *v10;
  void *v11;
  uint64_t isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  SBViewControllerTransitionContext *currentTransitionContext;
  _QWORD aBlock[6];
  BOOL v19;

  v4 = a4;
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBRootFolderController pageState](self, "pageState");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__SBRootFolderController_willEndTransitionToState_successfully___block_invoke;
  aBlock[3] = &__block_descriptor_49_e33_v24__0q8__SBSearchBackdropView_16l;
  aBlock[4] = v8;
  aBlock[5] = a3;
  v19 = v4;
  v9 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
  -[SBRootFolderController searchPresentableViewController](self, "searchPresentableViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_4;
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "searchBackdropView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 1, v10);
LABEL_4:

  }
  objc_msgSend(v7, "trailingCustomBackdropView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, 4, v13);

  if (-[SBViewControllerTransitionContext isTransitioning](self->_currentTransitionContext, "isTransitioning")
    && !-[SBViewControllerTransitionContext isCancelled](self->_currentTransitionContext, "isCancelled"))
  {
    v16 = -[SBViewControllerTransitionContext isInteractive](self->_currentTransitionContext, "isInteractive");
    currentTransitionContext = self->_currentTransitionContext;
    if (v16)
    {
      if (v4)
        -[SBViewControllerTransitionContext finishInteractiveTransition](currentTransitionContext, "finishInteractiveTransition");
      else
        -[SBViewControllerTransitionContext cancelInteractiveTransition](currentTransitionContext, "cancelInteractiveTransition");
    }
    else if (v4)
    {
      if (!-[SBViewControllerTransitionContext isAnimated](currentTransitionContext, "isAnimated"))
        -[SBViewControllerTransitionContext completeTransition:](self->_currentTransitionContext, "completeTransition:", 1);
    }
    else
    {
      -[SBViewControllerTransitionContext cancelTransition](currentTransitionContext, "cancelTransition");
    }
  }
  -[SBRootFolderController currentTransitionHandle](self, "currentTransitionHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "customIconImageViewControllerCancelTouchesAssertion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidate");

  objc_msgSend(v14, "setCustomIconImageViewControllerCancelTouchesAssertion:", 0);
}

void __64__SBRootFolderController_willEndTransitionToState_successfully___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  double v6;
  id v7;

  v5 = a3;
  if (*(_QWORD *)(a1 + 32) == a2 || *(_QWORD *)(a1 + 40) == a2)
  {
    v6 = 1.0;
    if (!*(_BYTE *)(a1 + 48))
      v6 = 0.0;
    v7 = v5;
    objc_msgSend(v5, "setTransitionProgress:", v6);
    objc_msgSend(v7, "completeIncrementalTransitionSuccessfully:", *(unsigned __int8 *)(a1 + 48));
    objc_msgSend(v7, "completeTransitionSuccessfully:", *(unsigned __int8 *)(a1 + 48));
    v5 = v7;
  }

}

- (void)didEndTransitionFromState:(int64_t)a3 toState:(int64_t)a4 successfully:(BOOL)a5
{
  _BOOL4 v5;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a5;
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderController _checkForImproperScrollOffsetForPageState](self, "_checkForImproperScrollOffsetForPageState");
  objc_msgSend(v18, "setNeedsLayout");
  if (a3 == 1 && a4 != 1 && v5)
  {
    -[SBRootFolderController searchGesture](self, "searchGesture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resetAnimated:", 0);

  }
  if (!v5)
    a4 = a3;
  objc_msgSend(v18, "setSearchHidden:", !SBRootFolderPageStateIsSearch(a4));
  -[SBRootFolderController _anySearchVisibilityProgress](self, "_anySearchVisibilityProgress");
  v11 = v10;
  -[SBRootFolderController _leadingCustomViewVisibilityProgress](self, "_leadingCustomViewVisibilityProgress");
  v13 = v12;
  -[SBRootFolderController _trailingCustomViewVisibilityProgress](self, "_trailingCustomViewVisibilityProgress");
  v15 = v14;
  objc_msgSend(v18, "setPullDownSearchVisibilityProgress:", v11);
  objc_msgSend(v18, "setLeadingCustomViewVisibilityProgress:", v13);
  objc_msgSend(v18, "setTrailingCustomViewVisibilityProgress:", v15);
  if (a4 == 2)
    goto LABEL_11;
  -[SBRootFolderController leadingCustomViewController](self, "leadingCustomViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "setContentVisibility:", 2);

  if (a4 != 4)
  {
LABEL_11:
    -[SBRootFolderController trailingCustomViewController](self, "trailingCustomViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v17, "setContentVisibility:", 2);

  }
}

- (void)pageTransitionHandle:(id)a3 updateCurrentPageStateTransitionToProgress:(double)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  _QWORD v17[7];
  uint8_t buf[4];
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBRootFolderController currentTransitionHandle](self, "currentTransitionHandle");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  SBLogRootController();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = a4;
      _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_DEFAULT, "Update page state transition to progress %f", buf, 0xCu);
    }

    v16 = -[SBRootFolderController destinationPageState](self, "destinationPageState");
    -[SBRootFolderController didContinueTransitionToState:progress:](self, "didContinueTransitionToState:progress:", v16, a4);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __90__SBRootFolderController_pageTransitionHandle_updateCurrentPageStateTransitionToProgress___block_invoke;
    v17[3] = &unk_1E8D85540;
    v17[4] = self;
    v17[5] = v16;
    *(double *)&v17[6] = a4;
    -[SBRootFolderController enumeratePageStateObserversUsingBlock:](self, "enumeratePageStateObserversUsingBlock:", v17);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBRootFolderController pageTransitionHandle:updateCurrentPageStateTransitionToProgress:].cold.1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

  }
}

uint64_t __90__SBRootFolderController_pageTransitionHandle_updateCurrentPageStateTransitionToProgress___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rootFolderPageStateProvider:didContinueTransitionToState:progress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)pageTransitionHandle:(id)a3 endPageStateTransitionSuccessfully:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[7];
  BOOL v21;
  _QWORD v22[6];
  BOOL v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBRootFolderController currentTransitionHandle](self, "currentTransitionHandle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {
    v15 = -[SBRootFolderController destinationPageState](self, "destinationPageState");
    v16 = -[SBRootFolderController pageState](self, "pageState");
    SBLogRootController();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      SBStringForRootFolderPageState(v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      v26 = 1024;
      v27 = v4;
      _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_DEFAULT, "End page state transition to state \"%{public}@\" successfully: %{BOOL}u", buf, 0x12u);

    }
    -[SBRootFolderController willEndTransitionToState:successfully:](self, "willEndTransitionToState:successfully:", v15, v4);
    v19 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __82__SBRootFolderController_pageTransitionHandle_endPageStateTransitionSuccessfully___block_invoke;
    v22[3] = &unk_1E8D85568;
    v22[4] = self;
    v22[5] = v15;
    v23 = v4;
    -[SBRootFolderController enumeratePageStateObserversUsingBlock:](self, "enumeratePageStateObserversUsingBlock:", v22);
    if (v4)
      -[SBRootFolderController setPageState:](self, "setPageState:", v15);
    objc_msgSend(v6, "setValid:", 0);
    -[SBRootFolderController setCurrentTransitionHandle:](self, "setCurrentTransitionHandle:", 0);
    -[SBRootFolderController didEndTransitionFromState:toState:successfully:](self, "didEndTransitionFromState:toState:successfully:", v16, v15, v4);
    v20[0] = v19;
    v20[1] = 3221225472;
    v20[2] = __82__SBRootFolderController_pageTransitionHandle_endPageStateTransitionSuccessfully___block_invoke_2;
    v20[3] = &unk_1E8D85590;
    v20[4] = self;
    v20[5] = v16;
    v20[6] = v15;
    v21 = v4;
    -[SBRootFolderController enumeratePageStateObserversUsingBlock:](self, "enumeratePageStateObserversUsingBlock:", v20);
  }
  else
  {
    SBLogRootController();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBRootFolderController pageTransitionHandle:endPageStateTransitionSuccessfully:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  }
}

uint64_t __82__SBRootFolderController_pageTransitionHandle_endPageStateTransitionSuccessfully___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rootFolderPageStateProvider:willEndTransitionToState:successfully:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __82__SBRootFolderController_pageTransitionHandle_endPageStateTransitionSuccessfully___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rootFolderPageStateProvider:didEndTransitionFromState:toState:successfully:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (void)searchGesture:(id)a3 startedShowing:(BOOL)a4
{
  _BOOL8 v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  v6 = a3;
  if (-[SBRootFolderController canTransitionPageStateToState:](self, "canTransitionPageStateToState:", v5))
  {
    -[SBRootFolderController beginPageStateTransitionToState:reason:animated:interactive:](self, "beginPageStateTransitionToState:reason:animated:interactive:", v5, CFSTR("search gesture started"), 1, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolderController setSearchGestureTransition:](self, "setSearchGestureTransition:", v7);

  }
  -[SBFolderController currentIconListView](self, "currentIconListView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v14);
  v9 = v8;
  v11 = v10;

  objc_msgSend(v14, "iconAtPoint:index:", 0, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayedIconViewForIcon:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    -[SBRootFolderController _cancelTouchesForSearchGestureOnIconView:](self, "_cancelTouchesForSearchGestureOnIconView:", v13);

}

- (void)searchGesture:(id)a3 changedPercentComplete:(double)a4
{
  int64_t v6;
  double v7;
  id v8;

  -[SBRootFolderController searchGestureTransition](self, "searchGestureTransition", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v6 = -[SBRootFolderController destinationPageState](self, "destinationPageState");
    v7 = 1.0 - a4;
    if (v6 == 1)
      v7 = a4;
    objc_msgSend(v8, "setTransitionProgress:", v7);
  }

}

- (void)searchGesture:(id)a3 completedShowing:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[SBRootFolderController searchGestureTransition](self, "searchGestureTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "endTransitionSuccessfully:", (-[SBRootFolderController destinationPageState](self, "destinationPageState") != 1) ^ v4);
    -[SBRootFolderController setSearchGestureTransition:](self, "setSearchGestureTransition:", 0);
  }
  else
  {
    objc_msgSend(v7, "resetAnimated:", 0);
  }
  -[SBRootFolderController _invalidateSearchGestureIconViewTouchCancellationAssertion](self, "_invalidateSearchGestureIconViewTouchCancellationAssertion");

}

- (void)searchGesture:(id)a3 resetAnimated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  double v7;

  v4 = a4;
  if (!-[SBRootFolderController isTransitioningPageState](self, "isTransitioningPageState", a3))
  {
    if (-[SBRootFolderController pageState](self, "pageState") == 1
      && -[SBRootFolderController canTransitionPageStateToState:](self, "canTransitionPageStateToState:", 0))
    {
      -[SBRootFolderController beginPageStateTransitionToState:reason:animated:interactive:](self, "beginPageStateTransitionToState:reason:animated:interactive:", 0, CFSTR("search gesture reset"), v4, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBRootFolderController setSearchGestureTransition:](self, "setSearchGestureTransition:", v6);

    }
    if (!-[SBRootFolderController isLeadingCustomViewVisible](self, "isLeadingCustomViewVisible"))
    {
      -[SBRootFolderController _leadingCustomViewVisibilityProgress](self, "_leadingCustomViewVisibilityProgress");
      if (v7 > 0.0)
        -[SBRootFolderController setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", -[SBFolderController firstIconPageIndex](self, "firstIconPageIndex"), v4);
    }
  }
}

- (void)_cancelTouchesForSearchGestureOnIconView:(id)a3
{
  id v4;
  BSInvalidatable *v5;
  BSInvalidatable *searchGestureIconViewTouchCancellationAssertion;
  id v7;

  v4 = a3;
  -[SBRootFolderController _invalidateSearchGestureIconViewTouchCancellationAssertion](self, "_invalidateSearchGestureIconViewTouchCancellationAssertion");
  objc_msgSend(v4, "customIconImageViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "cancelTouchesForCurrentEventInHostedContent");
    v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    searchGestureIconViewTouchCancellationAssertion = self->_searchGestureIconViewTouchCancellationAssertion;
    self->_searchGestureIconViewTouchCancellationAssertion = v5;

  }
}

- (void)_invalidateSearchGestureIconViewTouchCancellationAssertion
{
  BSInvalidatable *searchGestureIconViewTouchCancellationAssertion;
  BSInvalidatable *v4;

  searchGestureIconViewTouchCancellationAssertion = self->_searchGestureIconViewTouchCancellationAssertion;
  if (searchGestureIconViewTouchCancellationAssertion)
  {
    -[BSInvalidatable invalidate](searchGestureIconViewTouchCancellationAssertion, "invalidate");
    v4 = self->_searchGestureIconViewTouchCancellationAssertion;
    self->_searchGestureIconViewTouchCancellationAssertion = 0;

  }
}

- (void)transitionWillReverse:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBRootFolderController;
  v4 = a3;
  -[SBNestingViewController transitionWillReverse:](&v6, sel_transitionWillReverse_, v4);
  -[SBRootFolderController accessoryViewControllerDelegate](self, "accessoryViewControllerDelegate", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootFolderController:transitionWillReverse:", self, v4);

}

- (id)defaultTransitionForTransitioningFromPageState:(int64_t)a3 toPageState:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SBRootFolderControllerDefaultTransitionContext *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;

  v6 = a6;
  v7 = a5;
  -[SBRootFolderController viewControllerForTransitioningFromPageState:toPageState:](self, "viewControllerForTransitioningFromPageState:toPageState:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v14 = 0;
    goto LABEL_17;
  }
  if (a4)
  {
    -[SBRootFolderController animationControllerForPresentedController:presentingController:sourceController:](self, "animationControllerForPresentedController:presentingController:sourceController:", v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (v11 && v6 && v7)
    {
      -[SBRootFolderController interactionControllerForPresentation:](self, "interactionControllerForPresentation:", v11);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v12 = (void *)v13;
    }
  }
  else
  {
    -[SBRootFolderController animationControllerForDismissedController:](self, "animationControllerForDismissedController:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (v11 && v6 && v7)
    {
      -[SBRootFolderController interactionControllerForDismissal:](self, "interactionControllerForDismissal:", v11);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  v14 = objc_alloc_init(SBRootFolderControllerDefaultTransitionContext);
  -[SBViewControllerTransitionContext setDelegate:](v14, "setDelegate:", self);
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBViewControllerTransitionContext setContainerView:](v14, "setContainerView:", v15);

  -[SBViewControllerTransitionContext setAnimator:](v14, "setAnimator:", v11);
  -[SBViewControllerTransitionContext setInteractor:](v14, "setInteractor:", v12);
  -[SBViewControllerTransitionContext setWantsAnimation:](v14, "setWantsAnimation:", v7);
  v16 = (_QWORD *)MEMORY[0x1E0DC55B8];
  if (a4)
  {
    v16 = (_QWORD *)MEMORY[0x1E0DC55C8];
    v17 = (_QWORD *)MEMORY[0x1E0DC55D0];
  }
  else
  {
    v17 = (_QWORD *)MEMORY[0x1E0DC55C0];
  }
  -[SBViewControllerTransitionContext setViewController:forKey:](v14, "setViewController:forKey:", v10, *v16);
  objc_msgSend(v10, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBViewControllerTransitionContext setView:forKey:](v14, "setView:forKey:", v18, *v17);

LABEL_17:
  return v14;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  SBFramewiseInteractiveTransitionAnimator *v6;

  v6 = objc_alloc_init(SBFramewiseInteractiveTransitionAnimator);
  -[SBFramewiseInteractiveTransitionAnimator setDelegate:](v6, "setDelegate:", self);
  -[SBFramewiseInteractiveTransitionAnimator setPresenting:](v6, "setPresenting:", 1);
  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  SBFramewiseInteractiveTransitionAnimator *v4;

  v4 = objc_alloc_init(SBFramewiseInteractiveTransitionAnimator);
  -[SBFramewiseInteractiveTransitionAnimator setDelegate:](v4, "setDelegate:", self);
  -[SBFramewiseInteractiveTransitionAnimator setPresenting:](v4, "setPresenting:", 0);
  return v4;
}

- (id)interactionControllerForPresentation:(id)a3
{
  return objc_alloc_init(SBPercentPassthroughInteractiveTransition);
}

- (id)interactionControllerForDismissal:(id)a3
{
  return objc_alloc_init(SBPercentPassthroughInteractiveTransition);
}

- (id)dockIconListView
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[SBRootFolderController isDockExternal](self, "isDockExternal"))
  {
    -[SBFolderController folderDelegate](self, "folderDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "externalDockIconListViewForRootFolderController:", self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBRootFolderController;
    -[SBFolderController dockIconListView](&v6, sel_dockIconListView);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBRootFolderController;
  -[SBFolderController descriptionBuilderWithMultilinePrefix:](&v12, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBRootFolderController isDockExternal](self, "isDockExternal"), CFSTR("isDockExternal"));
  v6 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBRootFolderController dockEdge](self, "dockEdge"), CFSTR("dockEdge"));
  SBStringForRootFolderPageState(-[SBRootFolderController pageState](self, "pageState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("pageState"));

  -[SBRootFolderController currentTransitionHandle](self, "currentTransitionHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v9, CFSTR("currentPageStateTransition"), 1);

  return v4;
}

- (unint64_t)presenterType
{
  void *v3;
  unint64_t v4;

  -[SBFolderController folderDelegate](self, "folderDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "widgetSheetPresenterTypeForRootFolderController:", self);
  else
    v4 = 0;

  return v4;
}

- (BOOL)isDisplayingEditingButtons
{
  void *v3;
  char v4;
  void *v5;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "showsDoneButton") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[SBRootFolderController rootFolderView](self, "rootFolderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "showsAddWidgetButton");

  }
  return v4;
}

- (void)setSuppressesEditingStateForListView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuppressesEditingStateForListViews:", v3);

}

- (double)titledButtonsAlpha
{
  void *v2;
  double v3;
  double v4;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titledButtonsAlpha");
  v4 = v3;

  return v4;
}

- (void)setTitledButtonsAlpha:(double)a3
{
  id v4;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitledButtonsAlpha:", a3);

}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  BOOL v10;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = ((v5 & 1) == 0
      || !-[SBRootFolderController isAnySearchVisibleOrTransitioning](self, "isAnySearchVisibleOrTransitioning"))
     && -[SBRootFolderController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v8, v9);

  return v10;
}

- (BOOL)isDisplayingIcon:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  BOOL v7;

  v4 = a4;
  v6 = a3;
  v7 = ((v4 & 1) == 0
     || !-[SBRootFolderController isAnySearchVisibleOrTransitioning](self, "isAnySearchVisibleOrTransitioning"))
    && -[SBRootFolderController isDisplayingIcon:](self, "isDisplayingIcon:", v6);

  return v7;
}

- (void)_doPageManagementEducation
{
  id v2;

  -[SBRootFolderController rootFolderView](self, "rootFolderView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_doPageManagementEducation");

}

- (void)setPageState:(int64_t)a3
{
  self->_pageState = a3;
}

- (BOOL)showsDoneButtonWhileEditing
{
  return self->_showsDoneButtonWhileEditing;
}

- (unint64_t)showsAddWidgetButtonWhileEditingAllowedOrientations
{
  return self->_showsAddWidgetButtonWhileEditingAllowedOrientations;
}

- (BOOL)suppressesExtraEditingButtons
{
  return self->_suppressesExtraEditingButtons;
}

- (SBHMainAddSheetViewControlling)addSheetViewController
{
  return self->_addSheetViewController;
}

- (void)setAddSheetViewController:(id)a3
{
  objc_storeStrong((id *)&self->_addSheetViewController, a3);
}

- (UIViewController)pullDownSearchViewController
{
  return self->_pullDownSearchViewController;
}

- (void)setSearchGesture:(id)a3
{
  objc_storeStrong((id *)&self->_searchGesture, a3);
}

- (void)setAccessoryViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryViewControllerDelegate, a3);
}

- (unint64_t)presentationSource
{
  return self->_presentationSource;
}

- (void)setPresentationSource:(unint64_t)a3
{
  self->_presentationSource = a3;
}

- (void)setTodayViewPageHidden:(BOOL)a3
{
  self->_todayViewPageHidden = a3;
}

- (BOOL)managesStatusBarWidth
{
  return self->_managesStatusBarWidth;
}

- (void)setManagesStatusBarWidth:(BOOL)a3
{
  self->_managesStatusBarWidth = a3;
}

- (BSInvalidatable)searchGestureIconViewTouchCancellationAssertion
{
  return self->_searchGestureIconViewTouchCancellationAssertion;
}

- (void)setSearchGestureIconViewTouchCancellationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_searchGestureIconViewTouchCancellationAssertion, a3);
}

- (void)setCurrentTransitionHandle:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransitionHandle, a3);
}

- (SBRootFolderPageTransition)searchGestureTransition
{
  return self->_searchGestureTransition;
}

- (void)setSearchGestureTransition:(id)a3
{
  objc_storeStrong((id *)&self->_searchGestureTransition, a3);
}

- (void)setImplicitScrollTransition:(id)a3
{
  objc_storeStrong((id *)&self->_implicitScrollTransition, a3);
}

- (SBHRecentsDocumentExtensionProvider)recentsDocumentExtensionProvider
{
  return self->_recentsDocumentExtensionProvider;
}

- (void)setRecentsDocumentExtensionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_recentsDocumentExtensionProvider, a3);
}

- (SBHomeScreenDefaults)homeScreenDefaults
{
  return self->_homeScreenDefaults;
}

- (SBHStackConfigurationViewController)stackConfigurationViewController
{
  return (SBHStackConfigurationViewController *)objc_loadWeakRetained((id *)&self->_stackConfigurationViewController);
}

- (void)setStackConfigurationViewController:(id)a3
{
  objc_storeWeak((id *)&self->_stackConfigurationViewController, a3);
}

- (SBHSearchPresentable)searchPresentableViewController
{
  return self->_searchPresentableViewController;
}

- (unint64_t)hiddenListCountWhenPageManagementPresented
{
  return self->_hiddenListCountWhenPageManagementPresented;
}

- (void)setHiddenListCountWhenPageManagementPresented:(unint64_t)a3
{
  self->_hiddenListCountWhenPageManagementPresented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchPresentableViewController, 0);
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_destroyWeak((id *)&self->_stackConfigurationViewController);
  objc_storeStrong((id *)&self->_homeScreenDefaults, 0);
  objc_storeStrong((id *)&self->_recentsDocumentExtensionProvider, 0);
  objc_storeStrong((id *)&self->_implicitScrollTransition, 0);
  objc_storeStrong((id *)&self->_searchGestureTransition, 0);
  objc_storeStrong((id *)&self->_currentTransitionHandle, 0);
  objc_storeStrong((id *)&self->_searchGestureIconViewTouchCancellationAssertion, 0);
  objc_destroyWeak((id *)&self->_accessoryViewControllerDelegate);
  objc_storeStrong((id *)&self->_searchGesture, 0);
  objc_storeStrong((id *)&self->_trailingCustomViewController, 0);
  objc_storeStrong((id *)&self->_leadingCustomViewController, 0);
  objc_storeStrong((id *)&self->_pullDownSearchViewController, 0);
  objc_storeStrong((id *)&self->_addSheetViewController, 0);
  objc_storeStrong((id *)&self->_showDoneButtonAssertions, 0);
  objc_storeStrong((id *)&self->_widgetAddSheetObservers, 0);
  objc_storeStrong((id *)&self->_pageStateObservers, 0);
  objc_storeStrong((id *)&self->_currentTransitionInteractor, 0);
  objc_storeStrong((id *)&self->_currentTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_currentTransitionContext, 0);
}

- (void)pageTransitionHandle:(uint64_t)a3 updateCurrentPageStateTransitionToProgress:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, a2, a3, "Trying to update a transition without the current transition handle: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)pageTransitionHandle:(uint64_t)a3 endPageStateTransitionSuccessfully:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, a2, a3, "Trying to end a transition without the current transition handle: %{public}@", a5, a6, a7, a8, 2u);
}

@end
