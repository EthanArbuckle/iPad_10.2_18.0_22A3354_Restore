@implementation SBFolderController

void __72__SBFolderController_enumerateDisplayedIconViewsWithOptions_usingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;

  v5 = a2;
  if (!*(_BYTE *)(a1 + 80)
    || ((v6 = objc_msgSend(*(id *)(a1 + 32), "coordinateForIconAtIndex:", a3), v7 = *(_QWORD *)(a1 + 56), v6 - 1 >= v7)
      ? (v8 = v6 - 1 - v7 >= *(_QWORD *)(a1 + 64))
      : (v8 = 1),
        !v8))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __50__SBFolderController_viewControllersForPageIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "customIconImageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v3;
    if (v4)
    {
      objc_msgSend(v4, "addObject:", v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    v3 = v8;
  }

}

void __72__SBFolderController_enumerateDisplayedIconViewsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  __int128 v8;
  uint64_t VisibleColumnsForIconListIndex;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  _OWORD v22[2];

  v5 = a2;
  v6 = v5;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v5, "iconColumnsForCurrentOrientation");
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v8 = *(_OWORD *)(a1 + 72);
    v22[0] = *(_OWORD *)(a1 + 56);
    v22[1] = v8;
    VisibleColumnsForIconListIndex = SBVisibleColumnRangeGetVisibleColumnsForIconListIndex((unint64_t *)v22, v7);
    v11 = v10;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__SBFolderController_enumerateDisplayedIconViewsWithOptions_usingBlock___block_invoke_2;
    v14[3] = &unk_1E8D89C90;
    v21 = *(_BYTE *)(a1 + 88);
    v15 = v6;
    v18 = VisibleColumnsForIconListIndex;
    v19 = v11;
    v12 = *(id *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v16 = v12;
    v17 = v13;
    v20 = a3;
    objc_msgSend(v15, "enumerateIconViewsUsingBlock:", v14);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  }
}

void __63__SBFolderController_firstIconViewWithOptions_iconPassingTest___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;

  v5 = a4;
  objc_msgSend(v5, "removeObserver:", self);
  objc_msgSend(v5, "customIconImageViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isDescendantOfView:", v5);
    SBLogRootController();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (!v9)
    {
      if (v11)
        -[SBFolderController iconListView:didRemoveIconView:].cold.5();

      goto LABEL_17;
    }
    if (v11)
      -[SBFolderController iconListView:didRemoveIconView:].cold.4();

    objc_msgSend(v7, "willMoveToParentViewController:", 0);
    objc_msgSend(v8, "removeFromSuperview");
    objc_msgSend(v7, "removeFromParentViewController");
    if (objc_msgSend(v7, "bs_isAppearingOrAppeared"))
    {
      SBLogRootController();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[SBFolderController iconListView:didRemoveIconView:].cold.2();

      objc_msgSend(v7, "bs_beginAppearanceTransition:animated:", 0, 0);
      SBLogRootController();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        goto LABEL_16;
    }
    else
    {
      if (objc_msgSend(v7, "_appearState") != 3)
      {
LABEL_17:
        -[SBFolderController _endTrackingIconViewWithCustomImageViewController:](self, "_endTrackingIconViewWithCustomImageViewController:", v5);

        goto LABEL_18;
      }
      SBLogRootController();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:

        objc_msgSend(v7, "bs_endAppearanceTransition");
        -[NSMutableSet removeObject:](self->_appearanceTransitioningCustomImageViewControllers, "removeObject:", v7);
        goto LABEL_17;
      }
    }
    -[SBFolderController iconListView:didRemoveIconView:].cold.1();
    goto LABEL_16;
  }
LABEL_18:

}

- (id)visiblePageViewControllers
{
  void *v3;
  void *v4;

  -[SBFolderController folderView](self, "folderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_isValidPageIndex:", self->_leadingVisiblePageIndex) & 1) == 0)
    objc_msgSend(v3, "getLeadingVisiblePageIndex:trailingVisiblePageIndex:", &self->_leadingVisiblePageIndex, &self->_trailingVisiblePageIndex);
  -[SBFolderController pageViewControllersForLeadingPageIndex:trailingPageIndex:](self, "pageViewControllersForLeadingPageIndex:trailingPageIndex:", self->_leadingVisiblePageIndex, self->_trailingVisiblePageIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pageViewControllersForLeadingPageIndex:(int64_t)a3 trailingPageIndex:(int64_t)a4
{
  void *v4;
  int64_t v5;
  int64_t v7;
  void *v8;

  if (a3 <= a4)
  {
    v5 = a3;
    v4 = 0;
    v7 = a4 + 1;
    do
    {
      -[SBFolderController viewControllersForPageIndex:](self, "viewControllersForPageIndex:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        if (!v4)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v4, "addObjectsFromArray:", v8);
      }

      ++v5;
    }
    while (v7 != v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)viewControllersForPageIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[SBFolderController folderView](self, "folderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconListViewForPageIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__10;
  v13 = __Block_byref_object_dispose__10;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SBFolderController_viewControllersForPageIndex___block_invoke;
  v8[3] = &unk_1E8D88F80;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateIconViewsUsingBlock:", v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (SBFolderController)deepestFolderController
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  -[SBFolderController innerFolderController](self, "innerFolderController");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = 0;
    do
    {
      v5 = v3;

      objc_msgSend(v5, "innerFolderController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v5;
    }
    while (v3);
  }
  else
  {
    v5 = 0;
  }
  return (SBFolderController *)v5;
}

- (SBFolderController)innerFolderController
{
  void *v2;
  id v3;

  -[SBNestingViewController nestedViewController](self, "nestedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (SBFolderController *)v3;
}

- (id)iconViewForIcon:(id)a3 location:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  unint64_t VisibleColumnsForIconListIndex;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (!-[SBFolderController isPresentingIconLocation:](self, "isPresentingIconLocation:", v9))
  {
    v18 = 0;
    goto LABEL_17;
  }
  -[SBFolderController folderView](self, "folderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v27 = 0u;
  v28 = 0u;
  if (v10)
    objc_msgSend(v10, "visibleColumnRangeExcludingAdditionalWidthKeptVisible");
  -[SBFolderController iconListViews](self, "iconListViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "count"))
  {
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  v13 = 0;
  while (1)
  {
    objc_msgSend(v12, "objectAtIndex:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "iconLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_13;
    objc_msgSend(v14, "displayedIconViewForIcon:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_13;
    v18 = v17;
    objc_msgSend(v17, "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", v9);

    if (v20)
    {
      if ((v5 & 8) == 0)
        break;
      objc_msgSend(v14, "iconColumnsForCurrentOrientation");
      v26[0] = v27;
      v26[1] = v28;
      VisibleColumnsForIconListIndex = SBVisibleColumnRangeGetVisibleColumnsForIconListIndex((unint64_t *)v26, v13);
      v23 = v22;
      v24 = objc_msgSend(v14, "coordinateForIcon:", v8);
      if (v24 - 1 >= VisibleColumnsForIconListIndex && v24 - 1 - VisibleColumnsForIconListIndex < v23)
        break;
    }

LABEL_13:
    if (++v13 >= objc_msgSend(v12, "count"))
      goto LABEL_14;
  }

LABEL_15:
LABEL_17:

  return v18;
}

- (UIView)contentView
{
  -[SBFolderController loadViewIfNeeded](self, "loadViewIfNeeded");
  return (UIView *)self->_contentView;
}

- (NSArray)iconListViews
{
  return -[SBFolderView iconListViews](self->_contentView, "iconListViews");
}

- (void)enumerateDisplayedIconViewsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t);
  void *v14;
  id v15;
  uint64_t *v16;
  _QWORD *v17;
  __int128 v18;
  __int128 v19;
  BOOL v20;
  _QWORD v21[4];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;

  v6 = a4;
  -[SBFolderController folderView](self, "folderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v26 = 0u;
  v27 = 0u;
  if (v7)
    objc_msgSend(v7, "visibleColumnRangeExcludingAdditionalWidthKeptVisible");
  v24 = 0x2020000000;
  v21[2] = 0x2020000000;
  v12 = 3221225472;
  v18 = v26;
  v22 = 0;
  v23 = &v22;
  v25 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[3] = 0;
  v11 = MEMORY[0x1E0C809B0];
  v13 = __72__SBFolderController_enumerateDisplayedIconViewsWithOptions_usingBlock___block_invoke;
  v14 = &unk_1E8D89CB8;
  v19 = v27;
  v16 = &v22;
  v17 = v21;
  v20 = (a3 & 8) != 0;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v8, "enumerateIconListViewsUsingBlock:", &v11);
  if ((a3 & 0x10) != 0 && !*((_BYTE *)v23 + 24))
  {
    -[SBFolderController innerFolderController](self, "innerFolderController", v11, v12, v13, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enumerateDisplayedIconViewsWithOptions:usingBlock:", a3, v9);

  }
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);

}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  -[SBFolderController enumerateDisplayedIconViewsWithOptions:usingBlock:](self, "enumerateDisplayedIconViewsWithOptions:usingBlock:", 16, a3);
}

- (BOOL)hasDock
{
  void *v2;
  char v3;

  -[SBFolderController folder](self, "folder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRootFolder");

  return v3;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL8 v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "addObserver:", self);
  objc_msgSend(v7, "customIconImageViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SBFolderController _updatePresentationModeForIconView:](self, "_updatePresentationModeForIconView:", v7);
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      NSLog(CFSTR("no superview!"));
    if ((objc_msgSend(v7, "isIconImageViewBorrowed") & 1) == 0)
    {
      -[SBFolderController parentViewControllerForCustomIconImageViewControllerForIconView:](self, "parentViewControllerForCustomIconImageViewControllerForIconView:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bs_addChildViewController:", v8);
      SBLogRootController();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[SBFolderController iconListView:didAddIconView:].cold.2();

      v13 = -[SBFolderController shouldViewControllersAppearVisibleForListView:](self, "shouldViewControllersAppearVisibleForListView:", v6);
      if (v13 != objc_msgSend(v8, "bs_isAppearingOrAppeared"))
      {
        SBLogRootController();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[SBFolderController iconListView:didAddIconView:].cold.1();

        objc_msgSend(v8, "bs_endAppearanceTransition:", v13);
        -[NSMutableSet removeObject:](self->_appearanceTransitioningCustomImageViewControllers, "removeObject:", v8);
      }
      objc_msgSend(v7, "setCustomIconImageViewHitTestingDisabled:", -[SBFolderController _isHitTestingDisabledOnCustomIconImageViewControllers](self, "_isHitTestingDisabledOnCustomIconImageViewControllers"));

    }
    -[SBFolderController _beginTrackingIconViewWithCustomImageViewController:](self, "_beginTrackingIconViewWithCustomImageViewController:", v7);
  }

}

- (int64_t)pageIndexForIconListModelIndex:(unint64_t)a3
{
  void *v4;
  int64_t v5;

  -[SBFolderController folderView](self, "folderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pageIndexForIconListModelIndex:", a3);

  return v5;
}

- (void)pushFolderIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[SBFolderController isOpen](self, "isOpen"))
  {
    if (v10 && -[SBFolderController shouldOpenFolderIcon:](self, "shouldOpenFolderIcon:", v10))
    {
      objc_msgSend(v10, "folder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SBFolderController controllerClassForFolder:](self, "controllerClassForFolder:", v13);
      v15 = objc_alloc_init((Class)-[objc_class configurationClass](v14, "configurationClass"));
      objc_msgSend(v15, "setFolder:", v13);
      objc_msgSend(v15, "setOriginatingIconLocation:", v11);
      -[SBFolderController configureInnerFolderControllerConfiguration:](self, "configureInnerFolderControllerConfiguration:", v15);
      v16 = (void *)objc_msgSend([v14 alloc], "initWithConfiguration:", v15);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __66__SBFolderController_pushFolderIcon_location_animated_completion___block_invoke;
      v19[3] = &unk_1E8D881C0;
      v20 = v16;
      v21 = v12;
      v17 = v16;
      -[SBNestingViewController pushNestedViewController:animated:withCompletion:](self, "pushNestedViewController:animated:withCompletion:", v17, v7, v19);

      goto LABEL_11;
    }
    SBLogIcon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SBFolderController pushFolderIcon:location:animated:completion:].cold.1();
  }
  else
  {
    SBLogIcon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SBFolderController pushFolderIcon:location:animated:completion:].cold.2();
  }

  if (v12)
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
LABEL_11:

}

- (BOOL)shouldOpenFolderIcon:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  char v9;

  v4 = a3;
  v5 = -[SBFolderController iconListModelIndexForPageIndex:](self, "iconListModelIndexForPageIndex:", -[SBFolderController currentPageIndex](self, "currentPageIndex"));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v7 = v5;
    -[SBFolderController folder](self, "folder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "listAtIndex:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = objc_msgSend(v6, "directlyContainsIcon:", v4);

  return v9;
}

- (Class)controllerClassForFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;

  v4 = a3;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = (void *)objc_msgSend(v5, "controllerClassForFolder:", v4);
  else
    v7 = (void *)objc_opt_class();
  v8 = v7;

  return v8;
}

- (void)configureInnerFolderControllerConfiguration:(id)a3
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
  -[SBFolderController listLayoutProvider](self, "listLayoutProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setListLayoutProvider:", v4);

  objc_msgSend(v11, "setOrientation:", -[SBFolderController orientation](self, "orientation"));
  objc_msgSend(v11, "setAllowedOrientations:", -[SBFolderController allowedOrientations](self, "allowedOrientations"));
  -[SBFolderController iconViewProvider](self, "iconViewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIconViewProvider:", v5);

  -[SBFolderController folderIconImageCache](self, "folderIconImageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFolderIconImageCache:", v6);

  -[SBFolderController iconImageCache](self, "iconImageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIconImageCache:", v7);

  -[SBFolderController legibilitySettings](self, "legibilitySettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLegibilitySettings:", v8);

  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v11, "setFolderDelegate:", self);
  objc_msgSend(v11, "setAddsFocusGuidesForWrapping:", -[SBFolderController addsFocusGuidesForWrapping](self, "addsFocusGuidesForWrapping"));
  objc_msgSend(v11, "setVertical:", -[SBFolderController isVertical](self, "isVertical"));
  -[SBFolderController effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOverrideIconImageAppearance:", v9);

  -[SBFolderController folderDelegate](self, "folderDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "folderController:willCreateInnerFolderControllerWithConfiguration:", self, v11);

}

- (int64_t)orientation
{
  return self->_orientation;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (unint64_t)allowedOrientations
{
  return self->_allowedOrientations;
}

- (BOOL)addsFocusGuidesForWrapping
{
  return self->_addsFocusGuidesForWrapping;
}

- (void)_configureForInnerFolderController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SBFolderController innerFolderController](self, "innerFolderController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFolderDelegate:", self);
  if (v8 && v4 != v8)
  {
    -[SBFolderController _updateStateOfAssociatedController:animated:](self, "_updateStateOfAssociatedController:animated:", v8, 0);
    objc_msgSend(v8, "folder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderController firstIconViewForIcon:](self, "firstIconViewForIcon:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFolderIconView:", v7);

  }
}

- (void)setFolderDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_folderDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_folderDelegate, obj);
    -[SBFolderController delegateDidChange](self, "delegateDidChange");
    -[SBFolderController innerFolderController](self, "innerFolderController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parentDelegateDidChange");

    v5 = obj;
  }

}

- (id)firstIconViewForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SBFolderController presentedIconLocations](self, "presentedIconLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderController firstIconViewForIcon:inLocations:](self, "firstIconViewForIcon:inLocations:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
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
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[SBFolderController iconViewForIcon:location:](self, "iconViewForIcon:location:", v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  return -[SBFolderController iconViewForIcon:location:options:](self, "iconViewForIcon:location:options:", a3, a4, 0);
}

- (void)_updateStateOfAssociatedController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "setOpen:", -[SBFolderController isOpen](self, "isOpen"));
  objc_msgSend(v6, "setEditing:animated:", -[SBFolderController isEditing](self, "isEditing"), v4);
  objc_msgSend(v6, "setContentVisibility:", -[SBFolderController contentVisibility](self, "contentVisibility"));

}

- (void)setOpen:(BOOL)a3
{
  if (self->_isOpen != a3)
  {
    self->_isOpen = a3;
    -[SBFolderController _updateAssociatedControllerStateAnimated:](self, "_updateAssociatedControllerStateAnimated:", 0);
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  if (self->_isEditing != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_isEditing = a3;
    -[SBFolderController _updateFolderRequiredTrailingEmptyListCount](self, "_updateFolderRequiredTrailingEmptyListCount");
    -[SBFolderView setEditing:animated:](self->_contentView, "setEditing:animated:", v5, v4);
    -[SBFolderController _updateAssociatedControllerStateAnimated:](self, "_updateAssociatedControllerStateAnimated:", v4);
  }
}

- (void)_updateAssociatedControllerStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[SBFolderController innerFolderController](self, "innerFolderController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[SBFolderController _updateStateOfAssociatedController:animated:](self, "_updateStateOfAssociatedController:animated:", v5, v3);
    v5 = v6;
  }

}

- (void)_addFakeStatusBarView
{
  char v3;
  void *v4;
  UIStatusBar **p_fakeStatusBar;
  void *v6;
  id v7;

  -[SBFolderController _removeFakeStatusBarAndAssertionIfExists](self, "_removeFakeStatusBarAndAssertionIfExists");
  -[SBFolderController _hideStatusBarForReason:animated:](self, "_hideStatusBarForReason:animated:", CFSTR("SBFolderControllerFakeStatusBar"), 0);
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v7, "fakeStatusBarForFolderController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  p_fakeStatusBar = &self->_fakeStatusBar;
  objc_storeStrong((id *)&self->_fakeStatusBar, v4);
  if ((v3 & 1) != 0)

  if (*p_fakeStatusBar)
  {
    -[SBFolderController _resetFakeStatusBarSettingsIfNecessary](self, "_resetFakeStatusBarSettingsIfNecessary");
    -[SBFolderController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSubview:belowSubview:", *p_fakeStatusBar, self->_backgroundView);

  }
}

- (void)_resetFakeStatusBarSettingsIfNecessary
{
  uint64_t v3;
  void *v4;
  id v5;

  if (self->_fakeStatusBar)
  {
    -[SBFolderController _resetFakeStatusBarFrameOnly](self, "_resetFakeStatusBarFrameOnly");
    -[SBFolderController folderDelegate](self, "folderDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "statusBarStyleRequestForFolderController:", self);
      v3 = objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v4 = (void *)v3;
        -[UIStatusBar setStyleRequest:](self->_fakeStatusBar, "setStyleRequest:", v3);

      }
    }
    -[UIStatusBar setOrientation:](self->_fakeStatusBar, "setOrientation:", objc_msgSend((id)*MEMORY[0x1E0DC4730], "activeInterfaceOrientation"));
    -[UIStatusBar setHidden:](self->_fakeStatusBar, "setHidden:", -[NSMutableSet count](self->_fakeStatusBarHidingReasons, "count") != 0);

  }
}

- (void)_resetFakeStatusBarFrameOnly
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIStatusBar *fakeStatusBar;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  -[SBFolderController folderDelegate](self, "folderDelegate");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v16, "statusBarEdgeInsetsForFolderController:", self);
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v4 = *MEMORY[0x1E0DC49E8];
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  fakeStatusBar = self->_fakeStatusBar;
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "statusBarFrame");
  -[UIStatusBar setFrame:](fakeStatusBar, "setFrame:", v6 + v12, v4 + v13, v14 - (v10 + v6), v15 - (v8 + v4));
  -[SBFolderController _resetFakeStatusBarMatchMoveAnimation](self, "_resetFakeStatusBarMatchMoveAnimation");

}

- (void)_resetFakeStatusBarMatchMoveAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  id v15;
  void *v16;
  double MinX;
  void *v18;
  void *v19;
  double MaxX;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v29[4] = *MEMORY[0x1E0C80C00];
  -[UIStatusBar layer](self->_fakeStatusBar, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("SBFolderControllerFakeStatusBarMatchMoveKey"));

  -[SBFolderController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIStatusBar frame](self->_fakeStatusBar, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_alloc_init(MEMORY[0x1E0CD27C0]);
  objc_msgSend(v15, "setSourceLayer:", v6);
  v16 = (void *)MEMORY[0x1E0CB3B18];
  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  MinX = CGRectGetMinX(v30);
  v31.origin.x = v8;
  v31.origin.y = v10;
  v31.size.width = v12;
  v31.size.height = v14;
  objc_msgSend(v16, "valueWithCGPoint:", MinX, CGRectGetMinY(v31));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  v19 = (void *)MEMORY[0x1E0CB3B18];
  v32.origin.x = v8;
  v32.origin.y = v10;
  v32.size.width = v12;
  v32.size.height = v14;
  MaxX = CGRectGetMaxX(v32);
  v33.origin.x = v8;
  v33.origin.y = v10;
  v33.size.width = v12;
  v33.size.height = v14;
  objc_msgSend(v19, "valueWithCGPoint:", MaxX, CGRectGetMinY(v33));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v21;
  v22 = (void *)MEMORY[0x1E0CB3B18];
  v34.origin.x = v8;
  v34.origin.y = v10;
  v34.size.width = v12;
  v34.size.height = v14;
  v23 = CGRectGetMaxX(v34);
  v35.origin.x = v8;
  v35.origin.y = v10;
  v35.size.width = v12;
  v35.size.height = v14;
  objc_msgSend(v22, "valueWithCGPoint:", v23, CGRectGetMaxY(v35));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v24;
  v25 = (void *)MEMORY[0x1E0CB3B18];
  v36.origin.x = v8;
  v36.origin.y = v10;
  v36.size.width = v12;
  v36.size.height = v14;
  v26 = CGRectGetMinX(v36);
  v37.origin.x = v8;
  v37.origin.y = v10;
  v37.size.width = v12;
  v37.size.height = v14;
  objc_msgSend(v25, "valueWithCGPoint:", v26, CGRectGetMaxY(v37));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSourcePoints:", v28);

  objc_msgSend(v15, "setDuration:", INFINITY);
  objc_msgSend(v15, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v15, "setRemovedOnCompletion:", 0);
  -[UIStatusBar addAnimation:forKey:](self->_fakeStatusBar, "addAnimation:forKey:", v15, CFSTR("SBFolderControllerFakeStatusBarMatchMoveKey"));

}

- (void)_removeFakeStatusBarAndAssertionIfExists
{
  UIStatusBar *fakeStatusBar;
  void *v4;
  void *v5;
  UIStatusBar *v6;

  -[SBFolderController _unhideStatusBarForReason:](self, "_unhideStatusBarForReason:", CFSTR("SBFolderControllerFakeStatusBar"));
  fakeStatusBar = self->_fakeStatusBar;
  if (fakeStatusBar)
  {
    -[UIStatusBar layer](fakeStatusBar, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAnimationForKey:", CFSTR("SBFolderControllerFakeStatusBarMatchMoveKey"));

    -[SBFolderController folderDelegate](self, "folderDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "folderController:willRemoveFakeStatusBar:", self, self->_fakeStatusBar);
    else
      -[UIStatusBar removeFromSuperview](self->_fakeStatusBar, "removeFromSuperview");
    v6 = self->_fakeStatusBar;
    self->_fakeStatusBar = 0;

  }
  objc_msgSend(MEMORY[0x1E0DC3BC0], "_synchronizeDrawing");
}

- (void)_unhideStatusBarForReason:(id)a3
{
  BSInvalidatable *statusBarAssertion;

  -[NSMutableSet removeObject:](self->_realStatusBarHidingReasons, "removeObject:", a3);
  if (!-[NSMutableSet count](self->_realStatusBarHidingReasons, "count"))
  {
    -[BSInvalidatable invalidate](self->_statusBarAssertion, "invalidate");
    statusBarAssertion = self->_statusBarAssertion;
    self->_statusBarAssertion = 0;

  }
}

- (void)_hideStatusBarForReason:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSMutableSet *realStatusBarHidingReasons;
  NSMutableSet *v8;
  NSMutableSet *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v4 = a4;
  v6 = a3;
  realStatusBarHidingReasons = self->_realStatusBarHidingReasons;
  v13 = v6;
  if (!realStatusBarHidingReasons)
  {
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = self->_realStatusBarHidingReasons;
    self->_realStatusBarHidingReasons = v8;

    v6 = v13;
    realStatusBarHidingReasons = self->_realStatusBarHidingReasons;
  }
  -[NSMutableSet addObject:](realStatusBarHidingReasons, "addObject:", v6);
  if (-[NSMutableSet count](self->_realStatusBarHidingReasons, "count"))
  {
    -[SBFolderController folderDelegate](self, "folderDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();
    if ((v11 & 1) != 0)
    {
      objc_msgSend(v10, "folderControllerWantsToHideStatusBar:animated:", self, v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_storeStrong((id *)&self->_statusBarAssertion, v12);
    if ((v11 & 1) != 0)

  }
}

- (void)folderView:(id)a3 currentPageIndexDidChange:(int64_t)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("SBFolderControllerCurrentPageIndexDidChangeNotification"), self);

}

- (BOOL)isScrolling
{
  return -[SBFolderView isScrolling](self->_contentView, "isScrolling");
}

- (unint64_t)iconListModelIndexForPageIndex:(int64_t)a3
{
  void *v4;
  unint64_t v5;

  -[SBFolderController folderView](self, "folderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "iconListModelIndexForPageIndex:", a3);

  return v5;
}

- (void)folderViewDidEndScrolling:(id)a3
{
  void *v4;
  void *v5;
  BSInvalidatable *iconImageViewControllerKeepStaticForAnimatedScrollAssertion;
  BSInvalidatable *v7;

  -[SBFolderController updateAppearanceStateForPageViewControllers:](self, "updateAppearanceStateForPageViewControllers:", 1);
  -[SBFolderController _invalidateAllCancelTouchesAssertions](self, "_invalidateAllCancelTouchesAssertions");
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "folderControllerDidEndScrolling:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SBFolderControllerDidEndScrollingNotification"), self, 0);

  iconImageViewControllerKeepStaticForAnimatedScrollAssertion = self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion;
  if (iconImageViewControllerKeepStaticForAnimatedScrollAssertion)
  {
    -[BSInvalidatable invalidate](iconImageViewControllerKeepStaticForAnimatedScrollAssertion, "invalidate");
    v7 = self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion;
    self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion = 0;

  }
}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  int64_t v10;

  v4 = a3;
  -[SBFolderController folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForIcon:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "folderContainingIndexPath:relativeIndexPath:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v5 && (v8 = objc_msgSend(v6, "sbListIndex"), v8 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v10 = -[SBFolderController pageIndexForIconListModelIndex:](self, "pageIndexForIconListModelIndex:", v8);
      v9 = v10 == -[SBFolderController currentPageIndex](self, "currentPageIndex");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)revealIcon:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  void (**v8)(id, BOOL);
  id v9;
  void *v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  _QWORD v14[4];
  void (**v15)(id, BOOL);

  v5 = a4;
  v8 = (void (**)(id, BOOL))a5;
  v9 = a3;
  -[SBFolderController folder](self, "folder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForIcon:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = -[SBFolderController pageIndexForIconListModelIndex:](self, "pageIndexForIconListModelIndex:", SBFolderRelativeListIndex(v11));
    v13 = -[SBFolderController currentPageIndex](self, "currentPageIndex");
    if (v12 == 0x7FFFFFFFFFFFFFFFLL || v13 == v12)
    {
      if (v8)
        v8[2](v8, v12 != 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __60__SBFolderController_revealIcon_animated_completionHandler___block_invoke;
      v14[3] = &unk_1E8D859C0;
      v15 = v8;
      -[SBFolderController setCurrentPageIndex:animated:completion:](self, "setCurrentPageIndex:animated:completion:", v12, v5, v14);

    }
  }
  else if (v8)
  {
    v8[2](v8, 0);
  }

}

- (id)folderControllerForFolder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  SBFolderController *v7;

  v4 = a3;
  -[SBFolderController folder](self, "folder");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v7 = self;
  }
  else
  {
    -[SBFolderController innerFolderController](self, "innerFolderController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "folderControllerForFolder:", v4);
    v7 = (SBFolderController *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (id)iconListViewForIconListModelIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[SBFolderController folderView](self, "folderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconListViewForIconListModelIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)currentPageIndex
{
  return -[SBFolderView currentPageIndex](self->_contentView, "currentPageIndex");
}

- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  return -[SBFolderView setCurrentPageIndex:animated:completion:](self->_contentView, "setCurrentPageIndex:animated:completion:", a3, a4, a5);
}

- (int64_t)firstIconPageIndex
{
  return -[SBFolderView firstIconPageIndex](self->_contentView, "firstIconPageIndex");
}

- (unint64_t)iconListViewIndexForPageIndex:(int64_t)a3
{
  void *v4;
  unint64_t v5;

  -[SBFolderController folderView](self, "folderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "iconListViewIndexForPageIndex:", a3);

  return v5;
}

- (id)iconListViewAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[SBFolderController folderView](self, "folderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconListViewAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)iconLocationForFolderView:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "iconLocation");
}

- (double)minimumHomeScreenScaleForFolderView:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "minimumHomeScreenScaleForFolderController:", self);
    v5 = v6;
  }

  return v5;
}

- (BOOL)folderView:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  char v8;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "folderController:canChangeCurrentPageIndexToIndex:", self, a4);
  else
    v8 = 1;

  return v8;
}

- (SBFolderControllerDelegate)folderDelegate
{
  return (SBFolderControllerDelegate *)objc_loadWeakRetained((id *)&self->_folderDelegate);
}

- (int64_t)userInterfaceLayoutDirection
{
  void *v2;
  int64_t v3;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirection");

  return v3;
}

- (void)folderViewDidScroll:(id)a3
{
  -[SBFolderController updateAppearanceStateForPageViewControllers:](self, "updateAppearanceStateForPageViewControllers:", 0);
}

uint64_t __60__SBFolderController_revealIcon_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  char v8;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "folderController:canChangeCurrentPageIndexToIndex:", self, a4);
  else
    v8 = 1;

  return v8;
}

- (void)loadView
{
  SBFolderView *v3;
  SBFolderView *contentView;
  SBFolderContainerView *v5;
  SBFolderContainerView *containerView;
  id v7;

  -[SBFolderController configuration](self, "configuration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFolderController _makeContentViewWithConfiguration:](self, "_makeContentViewWithConfiguration:", v7);
  v3 = (SBFolderView *)objc_claimAutoreleasedReturnValue();
  contentView = self->_contentView;
  self->_contentView = v3;

  -[SBFolderView setDelegate:](self->_contentView, "setDelegate:", self);
  -[SBFolderController setConfiguration:](self, "setConfiguration:", 0);
  v5 = -[SBFolderContainerView initWithFolderView:]([SBFolderContainerView alloc], "initWithFolderView:", self->_contentView);
  containerView = self->_containerView;
  self->_containerView = v5;

  -[SBFolderController setView:](self, "setView:", self->_containerView);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1328);
}

- (SBFolderControllerConfiguration)configuration
{
  return self->_configuration;
}

- (id)_makeContentViewWithConfiguration:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_contentViewClass")), "initWithConfiguration:", v3);

  return v4;
}

- (Class)iconListViewClassForFolderView:(id)a3
{
  return (Class)objc_msgSend((id)objc_opt_class(), "listViewClass");
}

+ (Class)listViewClass
{
  return (Class)objc_msgSend((id)objc_msgSend(a1, "_contentViewClass"), "defaultIconListViewClass");
}

- (id)nestingViewController:(id)a3 animationControllerForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  SBFolderController *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  SBHomeScreenIconTransitionAnimator *v15;
  void *v16;
  id v18;
  id v19;
  void *v20;
  void *v21;
  SBFolderIconZoomAnimator *v22;
  NSObject *v23;
  SBIconFadeAnimator *v24;
  void *v25;
  id v26;
  SBFolderController *v27;
  void *v28;
  double v29;
  objc_super v30;

  v6 = a6;
  v10 = (SBFolderController *)a3;
  v11 = a5;
  if (v10 == self && a4 == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;
      -[SBFolderController folderContainerView](v10, "folderContainerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "folderContainerView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setChildFolderContainerView:", v14);
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)SBFolderController;
  -[SBNestingViewController nestingViewController:animationControllerForOperation:onViewController:animated:](&v30, sel_nestingViewController_animationControllerForOperation_onViewController_animated_, v10, a4, v11, v6);
  v15 = (SBHomeScreenIconTransitionAnimator *)objc_claimAutoreleasedReturnValue();
  -[SBNestingViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15 && (objc_opt_respondsToSelector() & 1) == 0 && v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v10;
      v18 = v11;
      -[SBFolderController folderDelegate](self, "folderDelegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0.0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_27;
        objc_msgSend(v28, "folderController:iconAnimatorForOperation:onViewController:animated:initialDelay:", self, a4, v18, 1, &v29);
        v22 = (SBFolderIconZoomAnimator *)objc_claimAutoreleasedReturnValue();
LABEL_23:
        if (v22)
        {
          v15 = -[SBHomeScreenIconTransitionAnimator initWithIconAnimator:childViewController:operation:]([SBHomeScreenIconTransitionAnimator alloc], "initWithIconAnimator:childViewController:operation:", v22, v18, a4 != 1);
          -[SBHomeScreenIconTransitionAnimator setInitialDelay:](v15, "setInitialDelay:", v29);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v28, "folderController:willUseIconTransitionAnimator:forOperation:onViewController:animated:", self, v15, a4, v18, 1);

          goto LABEL_28;
        }
LABEL_27:
        v15 = 0;
LABEL_28:

        goto LABEL_6;
      }
      v19 = v18;
      objc_msgSend(v19, "folder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "icon");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21
        && +[SBScaleIconZoomAnimator validateAnimationContainer:targetIcon:](SBFolderIconZoomAnimator, "validateAnimationContainer:targetIcon:", v27, v21))
      {
        if (!UIAccessibilityIsReduceMotionEnabled())
        {
          v22 = -[SBFolderIconZoomAnimator initWithAnimationContainer:innerFolderController:folderIcon:]([SBFolderIconZoomAnimator alloc], "initWithAnimationContainer:innerFolderController:folderIcon:", v27, v19, v21);
LABEL_22:

          goto LABEL_23;
        }
      }
      else
      {
        SBLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[SBFolderController nestingViewController:animationControllerForOperation:onViewController:animated:].cold.1();

        UIAccessibilityIsReduceMotionEnabled();
      }
      v24 = [SBIconFadeAnimator alloc];
      objc_msgSend(v19, "contentView");
      v26 = v18;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[SBIconFadeAnimator initWithAnimationContainer:crossfadeView:](v24, "initWithAnimationContainer:crossfadeView:", v27, v25);

      v18 = v26;
      -[SBFolderIconZoomAnimator setFadesReferenceView:](v22, "setFadesReferenceView:", 0);
      goto LABEL_22;
    }
    v15 = 0;
  }
LABEL_6:

  return v15;
}

- (void)nestingViewController:(id)a3 willPerformOperation:(int64_t)a4 onViewController:(id)a5 withTransitionCoordinator:(id)a6
{
  SBFolderController *v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  char isKindOfClass;
  uint64_t v16;
  id v17;
  void *v18;
  SBFolderControllerBackgroundView *v19;
  void *v20;
  uint64_t v21;
  SBFolderControllerBackgroundView *backgroundView;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  id v35;
  void *v36;
  id v37;
  int64_t v38;
  objc_super v39;
  _QWORD v40[5];
  BOOL v41;
  _QWORD v42[5];
  BOOL v43;
  _QWORD v44[4];
  id v45;
  BOOL v46;
  _QWORD v47[5];
  id v48;
  id v49;
  BOOL v50;
  _QWORD v51[5];
  id v52;
  BOOL v53;
  _QWORD aBlock[5];
  id v55;

  v10 = (SBFolderController *)a3;
  v11 = a5;
  v12 = a6;
  v13 = a4 == 1;
  v14 = v11;
  if (v10 != self)
  {
    -[SBFolderControllerBackgroundView setFrozen:](self->_backgroundView, "setFrozen:", a4 == 1);
    -[SBFolderController _resetFakeStatusBarSettingsIfNecessary](self, "_resetFakeStatusBarSettingsIfNecessary");
    goto LABEL_25;
  }
  if (!-[SBFolderController doesPageContainIconListView:](v10, "doesPageContainIconListView:", -[SBFolderController currentPageIndex](v10, "currentPageIndex")))-[SBFolderController setCurrentPageIndex:animated:](v10, "setCurrentPageIndex:animated:", -[SBFolderController defaultPageIndex](v10, "defaultPageIndex"), 0);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v16 = MEMORY[0x1E0C809B0];
  v38 = a4;
  if ((isKindOfClass & 1) != 0)
  {
    v17 = v14;
    v18 = v17;
    if (a4 == 1)
    {
      if (v17)
      {
LABEL_11:
        v19 = [SBFolderControllerBackgroundView alloc];
        -[SBFolderController folderView](v10, "folderView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bounds");
        v21 = -[SBFolderControllerBackgroundView initWithFrame:](v19, "initWithFrame:");
        backgroundView = v10->_backgroundView;
        v10->_backgroundView = (SBFolderControllerBackgroundView *)v21;

        -[SBFolderControllerBackgroundView setDelegate:](v10->_backgroundView, "setDelegate:", v10);
        if (v18)
        {
          -[SBFolderController _configureForInnerFolderController:](v10, "_configureForInnerFolderController:", v18);
          -[SBFolderController folderContainerView](v10, "folderContainerView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "folderContainerView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setChildFolderContainerView:", v24);
          objc_msgSend(v23, "insertSubview:belowSubview:", v10->_backgroundView, v24);
          objc_msgSend(v23, "setBackgroundView:", v10->_backgroundView);

          -[SBFolderController _addFakeStatusBarView](v10, "_addFakeStatusBarView");
          v25 = 0;
          v16 = MEMORY[0x1E0C809B0];
LABEL_16:
          if (objc_msgSend(v12, "isAnimated"))
            -[SBFolderController setAnimating:](v10, "setAnimating:", 1);
          aBlock[0] = v16;
          aBlock[1] = 3221225472;
          aBlock[2] = __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke;
          aBlock[3] = &unk_1E8D853D8;
          aBlock[4] = v10;
          v26 = v18;
          v55 = v26;
          v51[0] = v16;
          v51[1] = 3221225472;
          v51[2] = __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2;
          v51[3] = &unk_1E8D89BA0;
          v53 = v13;
          v51[4] = v10;
          v52 = _Block_copy(aBlock);
          v47[0] = v16;
          v47[1] = 3221225472;
          v47[2] = __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_3;
          v47[3] = &unk_1E8D89BC8;
          v47[4] = v10;
          v50 = v13;
          v37 = v26;
          v48 = v37;
          v35 = v25;
          v49 = v35;
          v27 = v52;
          objc_msgSend(v12, "animateAlongsideTransition:completion:", v51, v47);

          v28 = v13;
          goto LABEL_21;
        }
        v25 = 0;
        v16 = MEMORY[0x1E0C809B0];
        goto LABEL_20;
      }
LABEL_10:
      v18 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    if (a4 == 1)
      goto LABEL_10;
    v18 = 0;
  }
  -[SBFolderController innerFolderController](v10, "innerFolderController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[SBFolderController _configureForInnerFolderController:](v10, "_configureForInnerFolderController:", 0);
    goto LABEL_16;
  }
LABEL_20:
  v35 = v25;
  v44[0] = v16;
  v44[1] = 3221225472;
  v44[2] = __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_4;
  v44[3] = &unk_1E8D89BF0;
  v46 = v13;
  v45 = v14;
  objc_msgSend(v12, "animateAlongsideTransition:completion:", 0, v44);

  v37 = 0;
  v28 = v13;
LABEL_21:
  v29 = v16;
  -[SBFolderController folderView](v10, "folderView", v35);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v12, "isAnimated");
  objc_msgSend(v12, "transitionAnimationFactory");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "settings");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "willTransitionAnimated:withSettings:", v31, v33);

  a4 = v38;
  if (v38 == 1)
    v34 = 0.0;
  else
    v34 = 1.0;
  -[SBFolderControllerBackgroundView setExpanding:](v10->_backgroundView, "setExpanding:", v38 == 1);
  -[SBFolderController fadeContentForMagnificationFraction:](v10, "fadeContentForMagnificationFraction:", v34);
  v42[0] = v29;
  v42[1] = 3221225472;
  v42[2] = __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_5;
  v42[3] = &unk_1E8D89BF0;
  v43 = v28;
  v42[4] = v10;
  v40[0] = v29;
  v40[1] = 3221225472;
  v40[2] = __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_7;
  v40[3] = &unk_1E8D89BF0;
  v41 = v28;
  v40[4] = v10;
  objc_msgSend(v12, "animateAlongsideTransition:completion:", v42, v40);

LABEL_25:
  v39.receiver = self;
  v39.super_class = (Class)SBFolderController;
  -[SBNestingViewController nestingViewController:willPerformOperation:onViewController:withTransitionCoordinator:](&v39, sel_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator_, v10, a4, v14, v12);

}

- (void)_invalidateAllCancelTouchesAssertions
{
  NSMapTable *v3;
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
  v3 = self->_iconViewCustomImageViewControllerTouchCancellationAssertions;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        -[NSMapTable objectForKey:](self->_iconViewCustomImageViewControllerTouchCancellationAssertions, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "invalidate");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMapTable removeAllObjects](self->_iconViewCustomImageViewControllerTouchCancellationAssertions, "removeAllObjects");
  -[SBFolderController _enableTouchesOnAllCustomIconImageViewControllers](self, "_enableTouchesOnAllCustomIconImageViewControllers");
}

- (void)_enableTouchesOnAllCustomIconImageViewControllers
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v2 = self->_iconViewsWithCustomImageViewControllers;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setCustomIconImageViewHitTestingDisabled:", 0, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)folderControllerDidOpen:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "folderControllerDidOpen:", v5);

}

- (void)fadeContentForMagnificationFraction:(double)a3
{
  id v4;

  -[SBFolderController folderView](self, "folderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fadeContentForMagnificationFraction:", a3);

}

uint64_t __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  uint64_t result;
  char v6;
  void *v7;

  v3 = objc_msgSend(a2, "isCancelled");
  if (v3)
  {
    if (*(_BYTE *)(a1 + 56))
      v4 = 0;
    else
      v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_configureForInnerFolderController:", v4);
  }
  result = objc_msgSend(*(id *)(a1 + 32), "setAnimating:", 0);
  if (*(_BYTE *)(a1 + 56))
    v6 = v3;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_compactFolder");
  if (v3 != (*(_BYTE *)(a1 + 56) == 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "folderContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setChildFolderContainerView:", 0);

    objc_msgSend(*(id *)(a1 + 32), "_removeFakeStatusBar");
    objc_msgSend(*(id *)(a1 + 32), "removeAssertionsFromInnerFolderController:", *(_QWORD *)(a1 + 48));
    return objc_msgSend(*(id *)(a1 + 48), "setFolderDelegate:", 0);
  }
  return result;
}

void __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  if (((objc_msgSend(v3, "isCancelled") ^ (*(_BYTE *)(a1 + 40) != 0)) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "removeFromSuperview");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 1040);
    *(_QWORD *)(v4 + 1040) = 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "folderView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isAnimated");

  objc_msgSend(v7, "didTransitionAnimated:", v6);
}

uint64_t __86__SBFolderController_viewWillTransitionToSize_forOperation_withTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "isCancelled") ^ (*(_BYTE *)(a1 + 48) != 0);
  objc_msgSend(*(id *)(a1 + 32), "folderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isAnimated");

  objc_msgSend(v5, "didTransitionAnimated:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setAnimating:", 0);
  if ((v4 & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "folderControllerDidOpen:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setAllIconElementsButLabelHidden:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  v8 = objc_msgSend(*(id *)(a1 + 32), "isEditing");
  v9 = *(void **)(a1 + 40);
  if (v8)
    objc_msgSend(v9, "scrollToFirstGapAnimated:", 1);
  else
    objc_msgSend(v9, "scrollToTopOfFirstPageAnimated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "folderControllerDidClose:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)setAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 forOperation:(int64_t)a4 withTransitionCoordinator:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  BOOL IsReduceMotionEnabled;
  void *v12;
  double v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  objc_super v21;
  _QWORD v22[5];
  id v23;
  BOOL v24;
  _QWORD v25[4];
  id v26;
  SBFolderController *v27;
  BOOL v28;
  BOOL v29;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  -[SBFolderController folderIconView](self, "folderIconView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  -[SBFolderController setOpen:](self, "setOpen:", a4 == 1);
  if (objc_msgSend(v9, "isAnimated"))
    -[SBFolderController setAnimating:](self, "setAnimating:", 1);
  -[SBFolderController folderView](self, "folderView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    -[SBFolderController setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", objc_msgSend(v10, "visibleMiniIconListIndex"), 0);
    if (!IsReduceMotionEnabled)
      objc_msgSend(v10, "setAllIconElementsButLabelHidden:", 1);
    -[SBFolderController folderControllerWillOpen:](self, "folderControllerWillOpen:", self);
    v13 = 1.0;
  }
  else
  {
    v14 = objc_msgSend(v12, "iconListViewIndexForPageIndex:", -[SBFolderController currentPageIndex](self, "currentPageIndex"));
    if (self->_isEditing)
      objc_msgSend(v10, "scrollToGapOrTopIfFullOfPage:animated:", v14, 0);
    else
      objc_msgSend(v10, "scrollToTopOfPage:animated:", v14, 0);
    -[SBFolderController folderControllerWillClose:](self, "folderControllerWillClose:", self);
    v13 = 0.0;
  }
  v15 = !IsReduceMotionEnabled;
  v16 = objc_msgSend(v9, "isAnimated");
  objc_msgSend(v9, "transitionAnimationFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "settings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "willTransitionAnimated:withSettings:", v16, v18);

  -[SBFolderController fadeContentForMinificationFraction:](self, "fadeContentForMinificationFraction:", v13);
  v19 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __86__SBFolderController_viewWillTransitionToSize_forOperation_withTransitionCoordinator___block_invoke;
  v25[3] = &unk_1E8D89C18;
  v28 = v15;
  v29 = a4 == 1;
  v26 = v10;
  v27 = self;
  v22[0] = v19;
  v22[1] = 3221225472;
  v22[2] = __86__SBFolderController_viewWillTransitionToSize_forOperation_withTransitionCoordinator___block_invoke_3;
  v22[3] = &unk_1E8D89C40;
  v24 = a4 == 1;
  v22[4] = self;
  v23 = v26;
  v20 = v26;
  objc_msgSend(v9, "animateAlongsideTransition:completion:", v25, v22);
  v21.receiver = self;
  v21.super_class = (Class)SBFolderController;
  -[SBNestingViewController viewWillTransitionToSize:forOperation:withTransitionCoordinator:](&v21, sel_viewWillTransitionToSize_forOperation_withTransitionCoordinator_, a4, v9, width, height);

}

void __86__SBFolderController_viewWillTransitionToSize_forOperation_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  int v4;
  _BOOL4 v5;
  double v6;
  char v7;
  void *v8;
  int v9;
  double v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  _BOOL8 v21;
  void *v22;
  id v23;
  _QWORD v24[6];

  v23 = a2;
  v3 = objc_msgSend(v23, "isCancelled");
  v4 = v3;
  if (!*(_BYTE *)(a1 + 48))
  {
    v5 = *(_BYTE *)(a1 + 49) != 0;
    if (v3)
      v5 = *(_BYTE *)(a1 + 49) == 0;
    v6 = 1.0;
    if (v5)
      v6 = 0.0;
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v6);
  }
  v7 = objc_msgSend(v23, "isInteractive");
  v8 = v23;
  if ((v7 & 1) == 0)
  {
    v9 = (*(_BYTE *)(a1 + 49) == 0) ^ v4;
    if (v9)
      v10 = 1.0;
    else
      v10 = 0.0;
    v11 = objc_msgSend(v23, "transitionWasRestarted");
    if (!objc_msgSend(v23, "isAnimated"))
    {
      objc_msgSend(*(id *)(a1 + 40), "fadeContentForMinificationFraction:", v10);
      v8 = v23;
      if (((v4 | v11) & 1) == 0)
        goto LABEL_28;
      goto LABEL_21;
    }
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "iconAnimationSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v9 & 1) != 0)
      objc_msgSend(v13, "folderCloseSettings");
    else
      objc_msgSend(v13, "folderOpenSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0D01908];
    objc_msgSend(v14, "innerFolderFadeSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "BSAnimationSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "factoryWithSettings:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setAllowsAdditiveAnimations:", 1);
    v19 = v4 | v11;
    if (v19)
      v20 = 614;
    else
      v20 = 610;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __86__SBFolderController_viewWillTransitionToSize_forOperation_withTransitionCoordinator___block_invoke_2;
    v24[3] = &unk_1E8D84C78;
    v24[4] = *(_QWORD *)(a1 + 40);
    *(double *)&v24[5] = v10;
    objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:additionalDelay:options:actions:", v18, v20, v24, 0.0);

    v8 = v23;
    if (v19)
    {
LABEL_21:
      if (v4)
        v21 = *(_BYTE *)(a1 + 49) == 0;
      else
        v21 = *(_BYTE *)(a1 + 49) != 0;
      objc_msgSend(*(id *)(a1 + 40), "setOpen:", v21);
      v22 = *(void **)(a1 + 40);
      if (v9)
        objc_msgSend(v22, "folderControllerWillClose:", v22);
      else
        objc_msgSend(v22, "folderControllerWillOpen:", v22);
      v8 = v23;
    }
  }
LABEL_28:

}

- (void)fadeContentForMinificationFraction:(double)a3
{
  id v4;

  -[SBFolderController folderView](self, "folderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fadeContentForMinificationFraction:", a3);

}

void __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_5(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  _BOOL8 v19;
  id v20;
  _QWORD v21[6];

  v20 = a2;
  v3 = objc_msgSend(v20, "isInteractive");
  v4 = v20;
  if ((v3 & 1) == 0)
  {
    v5 = objc_msgSend(v20, "isCancelled");
    v6 = objc_msgSend(v20, "transitionWasRestarted");
    v7 = (*(_BYTE *)(a1 + 40) != 0) ^ v5;
    if (v7)
      v8 = 1.0;
    else
      v8 = 0.0;
    if (objc_msgSend(v20, "isAnimated"))
    {
      +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "iconAnimationSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v7 & 1) != 0)
        objc_msgSend(v10, "folderOpenSettings");
      else
        objc_msgSend(v10, "folderCloseSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D01908];
      objc_msgSend(v11, "outerFolderFadeSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "BSAnimationSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "factoryWithSettings:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setAllowsAdditiveAnimations:", 1);
      if (v5 | v6)
        v16 = 614;
      else
        v16 = 610;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_6;
      v21[3] = &unk_1E8D84C78;
      v21[4] = *(_QWORD *)(a1 + 32);
      *(double *)&v21[5] = v8;
      objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:additionalDelay:options:actions:", v15, v16, v21, 0.0);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "fadeContentForMagnificationFraction:", v8);
    }
    v17 = *(id *)(*(_QWORD *)(a1 + 32) + 1040);
    v18 = v17;
    if (v5)
    {
      objc_msgSend(v17, "setTransitionCancelled:", 1);
      v19 = *(_BYTE *)(a1 + 40) == 0;
    }
    else
    {
      objc_msgSend(v17, "setTransitionCancelled:", 0);
      v19 = *(_BYTE *)(a1 + 40) != 0;
    }
    objc_msgSend(v18, "setEffectActive:", v19);

    v4 = v20;
  }

}

void __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isInteractive") & 1) == 0)
  {
    if (objc_msgSend(v5, "isCancelled"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_fadeHomescreenAndDockIfNecessaryForFolderOpen:", *(_BYTE *)(a1 + 48) == 0);
      v3 = *(_QWORD *)(a1 + 40);
      v4 = *(_BYTE *)(a1 + 48) == 0;
    }
    else
    {
      objc_msgSend(v5, "transitionWasRestarted");
      objc_msgSend(*(id *)(a1 + 32), "_fadeHomescreenAndDockIfNecessaryForFolderOpen:", *(unsigned __int8 *)(a1 + 48));
      v3 = *(_QWORD *)(a1 + 40);
      v4 = *(unsigned __int8 *)(a1 + 48);
    }
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
  }

}

void __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  id v4;

  v3 = a2 ^ 1u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "bs_setHitTestingDisabled:", v3);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_setHitTestingDisabled:", v3);

}

- (void)folderControllerWillOpen:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBFolderController *v9;

  v9 = (SBFolderController *)a3;
  -[SBFolderController _updateFolderRequiredTrailingEmptyListCount](v9, "_updateFolderRequiredTrailingEmptyListCount");
  -[SBFolderController folderView](v9, "folderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareToOpen");

  -[SBFolderController innerFolderController](self, "innerFolderController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SBFolderController folderView](self, "folderView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSuppressesEditingStateForListViews:", 1);

  }
  -[SBFolderController updateContentViewOcclusion](self, "updateContentViewOcclusion");
  if (v9 == self)
  {
    -[SBFolderController folder](v9, "folder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isCancelable"))
    {
      -[SBFolderController setWasFolderCancelable:](v9, "setWasFolderCancelable:", 1);
      objc_msgSend(v7, "setCancelable:", 0);
    }

  }
  else
  {
    -[SBFolderController addAssertionsFromInnerFolderController:](self, "addAssertionsFromInnerFolderController:", v9);
  }
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "folderControllerWillOpen:", v9);

}

- (void)_updateFolderRequiredTrailingEmptyListCount
{
  id v3;

  -[SBFolderController folder](self, "folder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequiredTrailingEmptyListCount:", -[SBFolderController isEditing](self, "isEditing"));

}

- (void)setFolderIconView:(id)a3
{
  SBIconView *v5;
  SBIconView *v6;

  v5 = (SBIconView *)a3;
  if (self->_folderIconView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_folderIconView, a3);
    v5 = v6;
    if (v6)
    {
      -[SBFolderController setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", -[SBFolderController pageIndexForIconListViewIndex:](self, "pageIndexForIconListViewIndex:", -[SBIconView visibleMiniIconListIndex](v6, "visibleMiniIconListIndex")), 0);
      v5 = v6;
    }
  }

}

- (int64_t)pageIndexForIconListViewIndex:(unint64_t)a3
{
  void *v4;
  int64_t v5;

  -[SBFolderController folderView](self, "folderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pageIndexForIconListViewIndex:", a3);

  return v5;
}

- (void)noteUserIsInteractingWithIcons
{
  -[SBFolderView noteUserIsInteractingWithIcons](self->_contentView, "noteUserIsInteractingWithIcons");
}

- (SBFolderController)initWithConfiguration:(id)a3
{
  id v4;
  SBFolderController *v5;
  uint64_t v6;
  SBFolderControllerConfiguration *configuration;
  uint64_t v8;
  SBIconListLayoutProvider *listLayoutProvider;
  void *v10;
  uint64_t v11;
  NSString *originatingIconLocation;
  void *v13;
  uint64_t v14;
  SBFolderControllerAnimationContext *animationContext;
  void *v16;
  uint64_t v17;
  _UILegibilitySettings *legibilitySettings;
  uint64_t v19;
  UIView *headerView;
  uint64_t v21;
  SBFolderIconImageCache *folderIconImageCache;
  uint64_t v23;
  SBHIconImageCache *iconImageCache;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SBFolderController;
  v5 = -[SBNestingViewController initWithNibName:bundle:](&v29, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (SBFolderControllerConfiguration *)v6;

    objc_msgSend(v4, "listLayoutProvider");
    v8 = objc_claimAutoreleasedReturnValue();
    listLayoutProvider = v5->_listLayoutProvider;
    v5->_listLayoutProvider = (SBIconListLayoutProvider *)v8;

    v5->_orientation = objc_msgSend(v4, "orientation");
    v5->_allowedOrientations = objc_msgSend(v4, "allowedOrientations");
    objc_msgSend(v4, "originatingIconLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    originatingIconLocation = v5->_originatingIconLocation;
    v5->_originatingIconLocation = (NSString *)v11;

    objc_msgSend(v4, "iconViewProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_iconViewProvider, v13);

    objc_msgSend(v4, "animationContext");
    v14 = objc_claimAutoreleasedReturnValue();
    animationContext = v5->_animationContext;
    v5->_animationContext = (SBFolderControllerAnimationContext *)v14;

    objc_msgSend(v4, "folderDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_folderDelegate, v16);

    objc_msgSend(v4, "legibilitySettings");
    v17 = objc_claimAutoreleasedReturnValue();
    legibilitySettings = v5->_legibilitySettings;
    v5->_legibilitySettings = (_UILegibilitySettings *)v17;

    objc_msgSend(v4, "headerView");
    v19 = objc_claimAutoreleasedReturnValue();
    headerView = v5->_headerView;
    v5->_headerView = (UIView *)v19;

    objc_msgSend(v4, "folderIconImageCache");
    v21 = objc_claimAutoreleasedReturnValue();
    folderIconImageCache = v5->_folderIconImageCache;
    v5->_folderIconImageCache = (SBFolderIconImageCache *)v21;

    objc_msgSend(v4, "iconImageCache");
    v23 = objc_claimAutoreleasedReturnValue();
    iconImageCache = v5->_iconImageCache;
    v5->_iconImageCache = (SBHIconImageCache *)v23;

    v5->_addsFocusGuidesForWrapping = objc_msgSend(v4, "addsFocusGuidesForWrapping");
    v5->_contentVisibility = 0;
    objc_msgSend(v4, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNestingViewController setDelegate:](v5, "setDelegate:", v25);

    objc_msgSend(v4, "folder");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderController setFolder:](v5, "setFolder:", v26);
    -[SBFolderController setCurrentPageIndex:animated:](v5, "setCurrentPageIndex:animated:", -[SBFolderController defaultPageIndex](v5, "defaultPageIndex"), 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v5, sel_iconViewWillPresentContextMenu_, CFSTR("SBIconViewWillPresentContextMenuNotification"), 0);
    objc_msgSend(v27, "addObserver:selector:name:object:", v5, sel_iconViewDidDismissContextMenu_, CFSTR("SBIconViewDidDismissContextMenuNotification"), 0);

  }
  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFolderController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  id v13;

  -[SBFolderController succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderController folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("folder"));

  -[SBFolderController folderView](self, "folderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("folderView"));

  -[SBFolderController originatingIconLocation](self, "originatingIconLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("SBIconLocationNone"));

  if ((v10 & 1) == 0)
  {
    -[SBFolderController originatingIconLocation](self, "originatingIconLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v4, "appendObject:withName:", v11, CFSTR("originatingIconLocation"));

  }
  v13 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_pageViewControllerAppearStateOverrideAssertions, CFSTR("pageViewControllerAppearStateOverrideAssertions"), 1);
  return v4;
}

- (NSString)originatingIconLocation
{
  return self->_originatingIconLocation;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFolderController;
  -[SBFolderController viewDidLoad](&v4, sel_viewDidLoad);
  -[SBFolderController _resetIconLists](self, "_resetIconLists");
  -[SBFolderController folderView](self, "folderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:animated:", -[SBFolderController isEditing](self, "isEditing"), 0);
  objc_msgSend(v3, "setContentVisibility:", -[SBFolderController effectiveContentVisibility](self, "effectiveContentVisibility"));
  -[SBFolderController setCurrentPageIndex:animated:](self, "setCurrentPageIndex:animated:", -[SBFolderController defaultPageIndex](self, "defaultPageIndex"), 0);
  -[SBFolderController updateAppearanceStateForPageViewControllers:](self, "updateAppearanceStateForPageViewControllers:", 1);

}

- (BOOL)setCurrentPageIndex:(int64_t)a3 animated:(BOOL)a4
{
  return -[SBFolderController setCurrentPageIndex:animated:completion:](self, "setCurrentPageIndex:animated:completion:", a3, a4, 0);
}

- (int64_t)defaultPageIndex
{
  return -[SBFolderView defaultPageIndex](self->_contentView, "defaultPageIndex");
}

- (void)setFolder:(id)a3
{
  SBFolder *v5;
  SBFolder **p_folder;
  SBFolder *folder;
  id v8;
  SBFolder *v9;

  v5 = (SBFolder *)a3;
  p_folder = &self->_folder;
  folder = self->_folder;
  if (folder != v5)
  {
    v9 = v5;
    -[SBFolder removeFolderObserver:](folder, "removeFolderObserver:", self);
    objc_storeStrong((id *)&self->_folder, a3);
    if (v9)
    {
      if (!-[SBFolder listCount](*p_folder, "listCount"))
        v8 = -[SBFolder addEmptyList](*p_folder, "addEmptyList");
      -[SBFolder addFolderObserver:](*p_folder, "addFolderObserver:", self);
    }
    -[SBFolderView setFolder:](self->_contentView, "setFolder:", *p_folder);
    v5 = v9;
  }

}

- (SBIconView)folderIconView
{
  return self->_folderIconView;
}

- (void)addAssertionsFromInnerFolderController:(id)a3
{
  id v4;
  NSHashTable *v5;
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
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_layoutHidingAssertions;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "addAssertionFromChild:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_fadeHomescreenAndDockIfNecessaryForFolderOpen:(BOOL)a3
{
  _BOOL4 v3;
  double v5;

  v3 = a3;
  if (-[SBFolderController _homescreenAndDockShouldFade](self, "_homescreenAndDockShouldFade"))
  {
    v5 = 1.0;
    if (v3)
      v5 = 0.0;
    -[SBFolderController _setHomescreenAndDockAlpha:](self, "_setHomescreenAndDockAlpha:", v5);
  }
}

- (NSString)description
{
  return (NSString *)-[SBFolderController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  if (-[SBFolderController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared"))
    NSLog(CFSTR("This view has already disappeared!"));
  v19.receiver = self;
  v19.super_class = (Class)SBFolderController;
  -[SBNestingViewController viewDidAppear:](&v19, sel_viewDidAppear_, v3);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBFolderController _viewControllersToNotifyForViewObscuration](self, "_viewControllersToNotifyForViewObscuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v16;
    *(_QWORD *)&v7 = 138543362;
    v14 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "bs_endAppearanceTransition:", 1, v14);
        SBLogRootController();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v14;
          v21 = v13;
          _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "viewDidAppear:%{public}@", buf, 0xCu);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    }
    while (v8);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  if (-[SBFolderController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared"))
    NSLog(CFSTR("This view has already disappeared!"));
  v19.receiver = self;
  v19.super_class = (Class)SBFolderController;
  -[SBNestingViewController viewWillAppear:](&v19, sel_viewWillAppear_, v3);
  -[SBFolderController _invalidateAllCancelTouchesAssertions](self, "_invalidateAllCancelTouchesAssertions");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBFolderController _viewControllersToNotifyForViewObscuration](self, "_viewControllersToNotifyForViewObscuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v16;
    *(_QWORD *)&v7 = 138543362;
    v14 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "bs_beginAppearanceTransition:animated:", 1, v3, v14);
        SBLogRootController();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v14;
          v21 = v13;
          _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "viewWillAppear:%{public}@", buf, 0xCu);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    }
    while (v8);
  }

}

- (BOOL)isDisplayingIconView:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBFolderController folderView](self, "folderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isDescendantOfView:", v5);

  return v6;
}

- (void)prepareToLaunchTappedIcon:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (-[SBFolderController isDisplayingIcon:](self, "isDisplayingIcon:", v6))
  {
    v7[2](v7);
  }
  else
  {
    SBLogIcon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 1024;
      v13 = -[SBFolderController isScrolling](self, "isScrolling");
      _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_DEFAULT, "Need to scroll to show tapped icon '%@' (already scrolling: %{BOOL}u)", (uint8_t *)&v10, 0x12u);

    }
    -[SBFolderController setCurrentPageIndexToListDirectlyContainingIcon:animated:completion:](self, "setCurrentPageIndexToListDirectlyContainingIcon:animated:completion:", v6, 1, v7);
  }

}

- (void)folderViewWillBeginScrolling:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSMutableSet *appearanceTransitioningCustomImageViewControllers;
  NSMutableSet *v15;
  NSMutableSet *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSHashTable *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  uint64_t v48;
  CGPoint v49;
  CGRect v50;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "folderControllerWillBeginScrolling:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("SBFolderControllerWillBeginScrollingNotification"), self, 0);

  if (!-[SBFolderController isOverridingPageViewControllerAppearanceStateToRemainDisappeared](self, "isOverridingPageViewControllerAppearanceStateToRemainDisappeared"))
  {
    -[SBFolderController viewControllersForPageIndex:](self, "viewControllersForPageIndex:", -[SBFolderController currentPageIndex](self, "currentPageIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v41;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
          SBLogRootController();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            v46 = v12;
            _os_log_debug_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_DEBUG, "Beginning appearance transition of %p to NO (folderViewWillBeginScrolling)", buf, 0xCu);
          }

          objc_msgSend(v12, "beginAppearanceTransition:animated:", 0, 0);
          appearanceTransitioningCustomImageViewControllers = self->_appearanceTransitioningCustomImageViewControllers;
          if (!appearanceTransitioningCustomImageViewControllers)
          {
            v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
            v16 = self->_appearanceTransitioningCustomImageViewControllers;
            self->_appearanceTransitioningCustomImageViewControllers = v15;

            appearanceTransitioningCustomImageViewControllers = self->_appearanceTransitioningCustomImageViewControllers;
          }
          -[NSMutableSet addObject:](appearanceTransitioningCustomImageViewControllers, "addObject:", v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v9);
    }

  }
  objc_msgSend(v4, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "panGestureRecognizer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "locationInView:", v18);
    v21 = v20;
    v23 = v22;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v24 = self->_iconViewsWithCustomImageViewControllers;
    v25 = -[NSHashTable countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v37 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "customIconImageViewController");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "view");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "superview");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "convertPoint:fromView:", v18, v21, v23);
          v33 = v32;
          v35 = v34;

          objc_msgSend(v30, "frame");
          v49.x = v33;
          v49.y = v35;
          if (CGRectContainsPoint(v50, v49))
            -[SBFolderController _cancelTouchesForCustomIconImageViewController:](self, "_cancelTouchesForCustomIconImageViewController:", v29);

        }
        v26 = -[NSHashTable countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v26);
    }

  }
  -[SBFolderController _disableTouchesOnAllCustomIconImageViewControllers](self, "_disableTouchesOnAllCustomIconImageViewControllers");

}

- (NSArray)_viewControllersToNotifyForViewObscuration
{
  void *v3;

  if (-[SBFolderController isOverridingPageViewControllerAppearanceStateToRemainDisappeared](self, "isOverridingPageViewControllerAppearanceStateToRemainDisappeared"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[SBFolderController visiblePageViewControllers](self, "visiblePageViewControllers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v3;
}

- (void)updateAppearanceStateForPageViewControllers:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  NSMutableSet *appearanceTransitioningCustomImageViewControllers;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSMutableSet *v32;
  NSMutableSet *v33;
  NSMutableSet *v34;
  NSMutableSet *v35;
  uint64_t v36;
  void *v37;
  NSMutableSet *v38;
  NSMutableSet *obj;
  __int128 v40;
  __int128 v41;
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
  int64_t v52;
  objc_class *v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v3 = a3;
  v59 = *MEMORY[0x1E0C80C00];
  -[SBFolderController folderView](self, "folderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0;
  v53 = 0;
  objc_msgSend(v5, "getLeadingVisiblePageIndex:trailingVisiblePageIndex:", &v53, &v52);
  v6 = 1096;
  if (v53 != (objc_class *)self->_leadingVisiblePageIndex
    || (v52 == self->_trailingVisiblePageIndex ? (v7 = !v3) : (v7 = 0), !v7))
  {
    if (!-[SBFolderController isOverridingPageViewControllerAppearanceStateToRemainDisappeared](self, "isOverridingPageViewControllerAppearanceStateToRemainDisappeared"))
    {
      v37 = v5;
      -[SBFolderController visiblePageViewControllers](self, "visiblePageViewControllers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolderController pageViewControllersForLeadingPageIndex:trailingPageIndex:](self, "pageViewControllersForLeadingPageIndex:trailingPageIndex:", v53, v52);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 1096;
      if (v3)
        appearanceTransitioningCustomImageViewControllers = self->_appearanceTransitioningCustomImageViewControllers;
      else
        appearanceTransitioningCustomImageViewControllers = 0;
      v38 = appearanceTransitioningCustomImageViewControllers;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v49 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            if ((objc_msgSend(v9, "containsObject:", v16, v36) & 1) == 0)
            {
              SBLogRootController();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                v57 = v16;
                _os_log_debug_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_DEBUG, "Ending appearance transition of %p to NO (updateAppearanceStateForPageViewControllers)", buf, 0xCu);
              }

              objc_msgSend(v16, "bs_endAppearanceTransition:", 0);
              -[NSMutableSet removeObject:](self->_appearanceTransitioningCustomImageViewControllers, "removeObject:", v16);
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
        }
        while (v13);
      }

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      obj = v38;
      v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v45;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v45 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
            if ((objc_msgSend(v9, "containsObject:", v22, v36) & 1) == 0
              && (objc_msgSend(v11, "containsObject:", v22) & 1) == 0)
            {
              SBLogRootController();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                v57 = v22;
                _os_log_debug_impl(&dword_1CFEF3000, v23, OS_LOG_TYPE_DEBUG, "Ending appearance transition of %p to NO (updateAppearanceStateForPageViewControllers)", buf, 0xCu);
              }

              objc_msgSend(v22, "bs_endAppearanceTransition:", 0);
            }
          }
          v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
        }
        while (v19);
      }

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v24 = v9;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v41;
        do
        {
          for (k = 0; k != v26; ++k)
          {
            if (*(_QWORD *)v41 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
            if (v3)
            {
              SBLogRootController();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                v57 = v29;
                _os_log_debug_impl(&dword_1CFEF3000, v30, OS_LOG_TYPE_DEBUG, "Ending appearance transition of %p to YES (updateAppearanceStateForPageViewControllers)", buf, 0xCu);
              }

              objc_msgSend(v29, "bs_endAppearanceTransition:", 1);
              -[NSMutableSet removeObject:](self->_appearanceTransitioningCustomImageViewControllers, "removeObject:", v29);
            }
            else if ((objc_msgSend(v11, "containsObject:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k)) & 1) == 0)
            {
              SBLogRootController();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                v57 = v29;
                _os_log_debug_impl(&dword_1CFEF3000, v31, OS_LOG_TYPE_DEBUG, "Beginning appearance transition of %p to YES (updateAppearanceStateForPageViewControllers)", buf, 0xCu);
              }

              objc_msgSend(v29, "bs_beginAppearanceTransition:animated:", 1, 0);
              v32 = self->_appearanceTransitioningCustomImageViewControllers;
              if (!v32)
              {
                v33 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
                v34 = self->_appearanceTransitioningCustomImageViewControllers;
                self->_appearanceTransitioningCustomImageViewControllers = v33;

                v32 = self->_appearanceTransitioningCustomImageViewControllers;
              }
              -[NSMutableSet addObject:](v32, "addObject:", v29, v36);
            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
        }
        while (v26);
      }

      if (v3)
      {
        v35 = self->_appearanceTransitioningCustomImageViewControllers;
        self->_appearanceTransitioningCustomImageViewControllers = 0;

      }
      v6 = v36;
      v5 = v37;
    }
    *(Class *)((char *)&self->super.super.super.super.isa + v6) = v53;
    self->_trailingVisiblePageIndex = v52;
  }

}

- (BOOL)isOverridingPageViewControllerAppearanceStateToRemainDisappeared
{
  return -[NSHashTable count](self->_pageViewControllerAppearStateOverrideAssertions, "count") != 0;
}

- (void)_disableTouchesOnAllCustomIconImageViewControllers
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v2 = self->_iconViewsWithCustomImageViewControllers;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setCustomIconImageViewHitTestingDisabled:", 1, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)firstIconViewForIcon:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SBFolderController presentedIconLocations](self, "presentedIconLocations", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        -[SBFolderController iconViewForIcon:location:options:](self, "iconViewForIcon:location:options:", v6, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), a4);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  uint8_t buf[4];
  _BOOL4 v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if (-[SBFolderController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"))
    NSLog(CFSTR("This view has already disappeared!"));
  v19.receiver = self;
  v19.super_class = (Class)SBFolderController;
  -[SBNestingViewController viewWillDisappear:](&v19, sel_viewWillDisappear_, v3);
  -[SBFolderController _cancelTouchesForAllCustomIconImageViewControllers](self, "_cancelTouchesForAllCustomIconImageViewControllers");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBFolderController _viewControllersToNotifyForViewObscuration](self, "_viewControllersToNotifyForViewObscuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v16;
    *(_QWORD *)&v7 = 67109378;
    v14 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "bs_beginAppearanceTransition:animated:", 0, v3, v14);
        SBLogRootController();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v14;
          v21 = v3;
          v22 = 2114;
          v23 = v13;
          _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "viewWillDisappear:%{public:BOOL}d %{public}@", buf, 0x12u);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
    }
    while (v8);
  }

}

- (void)_cancelTouchesForAllCustomIconImageViewControllers
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_iconViewCustomImageViewControllerTouchCancellationAssertions;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[SBFolderController _cancelTouchesForCustomIconImageViewController:](self, "_cancelTouchesForCustomIconImageViewController:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  uint8_t buf[4];
  _BOOL4 v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if (-[SBFolderController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"))
    NSLog(CFSTR("This view has already disappeared!"));
  v19.receiver = self;
  v19.super_class = (Class)SBFolderController;
  -[SBNestingViewController viewDidDisappear:](&v19, sel_viewDidDisappear_, v3);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBFolderController _viewControllersToNotifyForViewObscuration](self, "_viewControllersToNotifyForViewObscuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v16;
    *(_QWORD *)&v7 = 67109378;
    v14 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "bs_endAppearanceTransition:", 0, v14);
        SBLogRootController();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v14;
          v21 = v3;
          v22 = 2114;
          v23 = v13;
          _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "viewDidDisappear:%{public:BOOL}d %{public}@", buf, 0x12u);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
    }
    while (v8);
  }

}

- (NSSet)presentedIconLocations
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[SBFolderController iconLocation](self, "iconLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)iconLocation
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;

  -[SBFolderController iconListViews](self, "iconListViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "iconLocation");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("SBIconLocationNone");
  }
  v5 = v4;

  return v5;
}

- (void)updateContentViewOcclusion
{
  id v3;

  -[SBFolderController folderView](self, "folderView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentVisibility:", -[SBFolderController effectiveContentVisibility](self, "effectiveContentVisibility"));

}

- (unint64_t)effectiveContentVisibility
{
  void *v3;
  _BOOL8 v4;

  -[SBFolderController innerFolderController](self, "innerFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return -[SBFolderController effectiveContentVisibilityFolderHasInnerFolder:](self, "effectiveContentVisibilityFolderHasInnerFolder:", v4);
}

- (unint64_t)effectiveContentVisibilityFolderHasInnerFolder:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t result;

  v3 = a3;
  result = -[SBFolderController contentVisibility](self, "contentVisibility");
  if (v3)
    return 1;
  return result;
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (void)setContentVisibility:(unint64_t)a3
{
  void *v5;

  if (self->_contentVisibility != a3)
  {
    self->_contentVisibility = a3;
    -[SBFolderController innerFolderController](self, "innerFolderController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentVisibility:", a3);

    -[SBFolderController updateContentViewOcclusion](self, "updateContentViewOcclusion");
  }
}

- (void)_compactFolder
{
  id v2;

  -[SBFolderController folder](self, "folder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compactLists");

}

- (void)_resetIconLists
{
  id v3;

  -[SBFolderView resetIconListViews](self->_contentView, "resetIconListViews");
  -[SBFolderController innerFolderController](self, "innerFolderController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_resetIconLists");

}

- (void)folderView:(id)a3 didAddIconListView:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  objc_msgSend(v5, "addLayoutObserver:", self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SBFolderController_folderView_didAddIconListView___block_invoke;
  v7[3] = &unk_1E8D87FA0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "enumerateIconViewsUsingBlock:", v7);

}

- (SBIconListModel)currentIconListModel
{
  void *v2;
  void *v3;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentIconListModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconListModel *)v3;
}

- (BOOL)suspendsWallpaperAnimationWhileOpen
{
  return 1;
}

- (NSMutableDictionary)extraAssertions
{
  return self->_extraAssertions;
}

- (void)setExtraAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_extraAssertions, a3);
}

- (BOOL)doesPageContainIconListView:(int64_t)a3
{
  void *v4;

  -[SBFolderController folderView](self, "folderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "doesPageContainIconListView:", a3);

  return a3;
}

- (id)firstIconViewWithOptions:(unint64_t)a3 iconPassingTest:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__SBFolderController_firstIconViewWithOptions_iconPassingTest___block_invoke;
  v10[3] = &unk_1E8D86D60;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  -[SBFolderController enumerateDisplayedIconViewsWithOptions:usingBlock:](self, "enumerateDisplayedIconViewsWithOptions:usingBlock:", a3, v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (double)minimumHomeScreenScaleForFolderControllerBackgroundView:(id)a3
{
  double result;

  -[SBFolderController minimumHomeScreenScaleForFolderController:](self, "minimumHomeScreenScaleForFolderController:", self);
  return result;
}

- (double)minimumHomeScreenScaleForFolderController:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "minimumHomeScreenScaleForFolderController:", self);
    v5 = v6;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBIconViewWillPresentContextMenuNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBIconViewDidDismissContextMenuNotification"), 0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBFolderController extraAssertions](self, "extraAssertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        SBLogRootController();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v10;
          _os_log_fault_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_FAULT, "Invalidating assertion:%@ in SBFolderController dealloc, because it was not invalidated and/or removed earlier", buf, 0xCu);
        }

        objc_msgSend(v10, "invalidate");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)SBFolderController;
  -[SBFolderController dealloc](&v12, sel_dealloc);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_self();
}

- (void)delegateDidChange
{
  id v2;

  -[SBFolderController folderViewIfLoaded](self, "folderViewIfLoaded");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAccessibilityTintColors");

}

- (void)parentDelegateDidChange
{
  void *v3;
  id v4;

  -[SBFolderController innerFolderController](self, "innerFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentDelegateDidChange");

  -[SBFolderController folderViewIfLoaded](self, "folderViewIfLoaded");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateAccessibilityTintColors");

}

- (void)_invalidate
{
  -[SBFolderController setFolder:](self, "setFolder:", 0);
}

- (id)keyCommands
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBFolderController;
  -[SBFolderController keyCommands](&v8, sel_keyCommands);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBFolderController isEditing](self, "isEditing"))
  {
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel__handleEndEditingKeyCommand_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_nonRepeatableKeyCommand");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v3, "arrayByAddingObject:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
    }
    else
    {
      v9[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v3;
}

void __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  if (((objc_msgSend(a2, "isCancelled") ^ (*(_BYTE *)(a1 + 40) != 0)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

  }
}

uint64_t __108__SBFolderController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fadeContentForMagnificationFraction:", *(double *)(a1 + 40));
}

uint64_t __86__SBFolderController_viewWillTransitionToSize_forOperation_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fadeContentForMinificationFraction:", *(double *)(a1 + 40));
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (SBFolderView)folderViewIfLoaded
{
  return self->_contentView;
}

- (void)setListLayoutProvider:(id)a3
{
  -[SBFolderController setListLayoutProvider:animated:](self, "setListLayoutProvider:animated:", a3, 0);
}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SBIconListLayoutProvider *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v7 = (SBIconListLayoutProvider *)a3;
  if (self->_listLayoutProvider != v7)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[SBFolderController presentedIconLocations](self, "presentedIconLocations", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          SBHIconListLayoutProviderListGridSizeMatchesListLayoutProvider(self->_listLayoutProvider, v7, *(void **)(*((_QWORD *)&v15 + 1) + 8 * i), 1);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    objc_storeStrong((id *)&self->_listLayoutProvider, a3);
    -[SBFolderController folderView](self, "folderView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setListLayoutProvider:animated:", v7, v4);

  }
}

- (void)setOrientation:(int64_t)a3
{
  int64_t orientation;

  orientation = self->_orientation;
  if (orientation != a3)
  {
    if (SBFInterfaceOrientationMaskContainsInterfaceOrientation())
    {
      self->_orientation = a3;
      -[SBFolderController orientationDidChange:](self, "orientationDidChange:", orientation);
    }
  }
}

- (BOOL)isScrollDragging
{
  void *v2;
  char v3;

  -[SBFolderView scrollView](self->_contentView, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDragging");

  return v3;
}

- (BOOL)isScrollDecelerating
{
  void *v2;
  char v3;

  -[SBFolderView scrollView](self->_contentView, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDecelerating");

  return v3;
}

- (BOOL)isScrollTracking
{
  void *v2;
  char v3;

  -[SBFolderView scrollView](self->_contentView, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTracking");

  return v3;
}

- (double)currentScrollingOffset
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;

  return v5;
}

- (void)_handleEndEditingKeyCommand:(id)a3
{
  id v4;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "folderControllerShouldEndEditing:", self);

}

- (void)beginEditingTitle
{
  void *v2;
  id v3;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_titleTextField");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "showingEditUI"))
  {
    objc_msgSend(v3, "becomeFirstResponder");
    objc_msgSend(v3, "selectAll:", 0);
  }

}

- (void)setCurrentPageIndex:(int64_t)a3
{
  -[SBFolderController setCurrentPageIndex:animated:completion:](self, "setCurrentPageIndex:animated:completion:", a3, 0, 0);
}

- (void)setCurrentPageIndexToListDirectlyContainingIcon:(id)a3 animated:(BOOL)a4
{
  -[SBFolderController setCurrentPageIndexToListDirectlyContainingIcon:animated:completion:](self, "setCurrentPageIndexToListDirectlyContainingIcon:animated:completion:", a3, a4, 0);
}

- (void)setCurrentPageIndexToListDirectlyContainingIcon:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  uint64_t v21;
  SBFolderController *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (!v8 || -[SBFolderController isDisplayingIcon:](self, "isDisplayingIcon:", v8))
  {
    if (v9)
      v9[2](v9);
    goto LABEL_28;
  }
  -[SBFolderController folder](self, "folder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v10, "listsContainingIcon:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v22 = self;
      v15 = *(_QWORD *)v24;
      v16 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v18, "directlyContainsIcon:", v8, v22))
          {
            v19 = objc_msgSend(v11, "indexOfList:", v18);
            if (v19 < v16 || v16 == 0x7FFFFFFFFFFFFFFFLL)
              v16 = v19;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);

      v21 = 0x7FFFFFFFFFFFFFFFLL;
      v6 = v6;
      self = v22;
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        v21 = -[SBFolderController pageIndexForIconListModelIndex:](v22, "pageIndexForIconListModelIndex:", v16);
      goto LABEL_23;
    }

  }
  v21 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_23:
  if (-[SBFolderController _isValidPageIndex:](self, "_isValidPageIndex:", v21))
  {
    -[SBFolderController setCurrentPageIndex:animated:completion:](self, "setCurrentPageIndex:animated:completion:", v21, v6, v9);
  }
  else if (v9)
  {
    v9[2](v9);
  }

LABEL_28:
}

- (void)scrollUsingDecelerationAnimationToDefaultPageWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  -[SBFolderController scrollUsingDecelerationAnimationToPageIndex:withCompletionHandler:](self, "scrollUsingDecelerationAnimationToPageIndex:withCompletionHandler:", -[SBFolderController defaultPageIndex](self, "defaultPageIndex"), v4);

}

- (void)scrollUsingDecelerationAnimationToPageIndex:(int64_t)a3 withCompletionHandler:(id)a4
{
  -[SBFolderView scrollUsingDecelerationAnimationToPageIndex:withCompletionHandler:](self->_contentView, "scrollUsingDecelerationAnimationToPageIndex:withCompletionHandler:", a3, a4);
}

- (int64_t)minimumPageIndex
{
  return -[SBFolderView minimumPageIndex](self->_contentView, "minimumPageIndex");
}

- (int64_t)maximumPageIndex
{
  return -[SBFolderView maximumPageIndex](self->_contentView, "maximumPageIndex");
}

- (int64_t)lastIconPageIndex
{
  return -[SBFolderView lastIconPageIndex](self->_contentView, "lastIconPageIndex");
}

- (int64_t)nearestIconPageIndex
{
  return -[SBFolderView nearestIconPageIndex](self->_contentView, "nearestIconPageIndex");
}

- (SBFolderController)outerFolderController
{
  void *v2;
  id v3;

  -[SBNestingViewController parentNestingViewController](self, "parentNestingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (SBFolderController *)v3;
}

- (unint64_t)iconListViewCount
{
  return -[SBFolderView iconListViewCount](self->_contentView, "iconListViewCount");
}

- (SBIconListView)currentIconListView
{
  void *v2;
  void *v3;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentIconListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconListView *)v3;
}

- (id)iconListViewAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  -[SBFolderController folderView](self, "folderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconListViewAtPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)iconListViewForTouch:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBFolderController folderView](self, "folderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconListViewForTouch:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)iconListViewForDrag:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBFolderController folderView](self, "folderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconListViewForDrag:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)iconListViewIndexForIconListModelIndex:(unint64_t)a3
{
  void *v4;
  unint64_t v5;

  -[SBFolderController folderView](self, "folderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "iconListViewIndexForIconListModelIndex:", a3);

  return v5;
}

- (BOOL)_isValidPageIndex:(int64_t)a3
{
  void *v4;

  -[SBFolderController folderView](self, "folderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "_isValidPageIndex:", a3);

  return a3;
}

- (NSArray)visibleIconListViews
{
  void *v2;
  void *v3;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleIconListViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)_closeFolder
{
  id v3;

  -[SBFolderController folderView](self, "folderView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFolderController folderViewShouldClose:withPinchGesture:](self, "folderViewShouldClose:withPinchGesture:", v3, 0);

}

- (id)beginOverridingPageViewControllerAppearanceStateToRemainDisappearedForReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _SBFolderControllerPageViewControllerAppearStateOverrideAssertion *v7;
  NSHashTable *pageViewControllerAppearStateOverrideAssertions;
  NSHashTable *v9;
  NSHashTable *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogRootController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "Begin overriding page view controller appearance state for reason: %{public}@", buf, 0xCu);
  }

  -[SBFolderController _viewControllersToNotifyForViewObscuration](self, "_viewControllersToNotifyForViewObscuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_SBFolderControllerPageViewControllerAppearStateOverrideAssertion initWithFolderController:reason:]([_SBFolderControllerPageViewControllerAppearStateOverrideAssertion alloc], "initWithFolderController:reason:", self, v4);
  pageViewControllerAppearStateOverrideAssertions = self->_pageViewControllerAppearStateOverrideAssertions;
  if (!pageViewControllerAppearStateOverrideAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v10 = self->_pageViewControllerAppearStateOverrideAssertions;
    self->_pageViewControllerAppearStateOverrideAssertions = v9;

    pageViewControllerAppearStateOverrideAssertions = self->_pageViewControllerAppearStateOverrideAssertions;
  }
  -[NSHashTable addObject:](pageViewControllerAppearStateOverrideAssertions, "addObject:", v7);
  if (-[SBFolderController isOverridingPageViewControllerAppearanceStateToRemainDisappeared](self, "isOverridingPageViewControllerAppearanceStateToRemainDisappeared"))
  {
    v20 = v6;
    v21 = v4;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v16, "bs_isAppearingOrAppeared"))
          {
            SBLogRootController();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              v28 = v16;
              _os_log_debug_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_DEBUG, "Beginning appearance transition of %p to NO (beginOverridingPageViewControllerAppearanceStateToRemainDisappearedForReason)", buf, 0xCu);
            }

            objc_msgSend(v16, "beginAppearanceTransition:animated:", 0, 0);
            SBLogRootController();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              v28 = v16;
              _os_log_debug_impl(&dword_1CFEF3000, v18, OS_LOG_TYPE_DEBUG, "Ending appearance transition of %p to NO (beginOverridingPageViewControllerAppearanceStateToRemainDisappearedForReason)", buf, 0xCu);
            }

            objc_msgSend(v16, "endAppearanceTransition");
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    v6 = v20;
    v4 = v21;
  }

  return v7;
}

- (void)_removePageViewControllerAppearStateOverrideAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSHashTable *pageViewControllerAppearStateOverrideAssertions;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogRootController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "End overriding page view controller appearance state for reason: %{public}@", buf, 0xCu);

  }
  -[NSHashTable removeObject:](self->_pageViewControllerAppearStateOverrideAssertions, "removeObject:", v4);
  if (!-[SBFolderController isOverridingPageViewControllerAppearanceStateToRemainDisappeared](self, "isOverridingPageViewControllerAppearanceStateToRemainDisappeared"))
  {
    pageViewControllerAppearStateOverrideAssertions = self->_pageViewControllerAppearStateOverrideAssertions;
    self->_pageViewControllerAppearStateOverrideAssertions = 0;

    if (-[SBFolderController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"))
    {
      -[SBFolderController _viewControllersToNotifyForViewObscuration](self, "_viewControllersToNotifyForViewObscuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v13, "bs_isDisappearingOrDisappeared"))
            {
              SBLogRootController();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                v22 = v13;
                _os_log_debug_impl(&dword_1CFEF3000, v14, OS_LOG_TYPE_DEBUG, "Beginning appearance transition of %p to YES (_removePageViewControllerAppearStateOverrideAssertion)", buf, 0xCu);
              }

              objc_msgSend(v13, "beginAppearanceTransition:animated:", 1, 0);
              SBLogRootController();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                v22 = v13;
                _os_log_debug_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEBUG, "Ending appearance transition of %p to YES (_removePageViewControllerAppearStateOverrideAssertion)", buf, 0xCu);
              }

              objc_msgSend(v13, "endAppearanceTransition");
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

    }
  }

}

- (id)keepIconImageViewControllersSnapshotsOfType:(unint64_t)a3 inAllPagesExcluding:(id)a4 forReason:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *v11;
  uint64_t v12;
  void **v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  SBLogRootController();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543618;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "Begin keeping icon image view controllers static in all pages excluding: %{public}@ for reason: %{public}@", (uint8_t *)&v18, 0x16u);
  }

  v11 = -[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion initWithFolderController:snapshotType:pageIndexesToExclude:reason:]([_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion alloc], "initWithFolderController:snapshotType:pageIndexesToExclude:reason:", self, a3, v8, v9);
  if (a3 == 1)
  {
    v12 = 1128;
  }
  else
  {
    if (a3)
      goto LABEL_10;
    v12 = 1120;
  }
  v13 = (void **)((char *)&self->super.super.super.super.isa + v12);
  v14 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *v13;
    *v13 = (void *)v15;

    v14 = *v13;
  }
  objc_msgSend(v14, "addObject:", v11);
LABEL_10:
  -[SBFolderController _updatePresentationModeForIconViews](self, "_updatePresentationModeForIconViews");

  return v11;
}

- (void)_removeIconImageViewControllerKeepStaticAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogRootController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "End keeping icon image view controllers static for reason: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  v7 = objc_msgSend(v4, "snapshotType");
  if (!v7)
  {
    v8 = &OBJC_IVAR___SBFolderController__iconImageViewControllerKeepSnapshotTypeDefaultAssertions;
    goto LABEL_7;
  }
  if (v7 == 1)
  {
    v8 = &OBJC_IVAR___SBFolderController__iconImageViewControllerKeepSnapshotTypeLowResolutionAssertions;
LABEL_7:
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v8), "removeObject:", v4);
  }
  -[SBFolderController _updatePresentationModeForIconViews](self, "_updatePresentationModeForIconViews");

}

- (unint64_t)iconImageViewControllerPresentationModeForIconView:(id)a3
{
  id v4;
  void *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSHashTable *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  unint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSHashTable count](self->_iconImageViewControllerKeepSnapshotTypeDefaultAssertions, "count")
    || -[NSHashTable count](self->_iconImageViewControllerKeepSnapshotTypeLowResolutionAssertions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v6 = self->_iconImageViewControllerKeepSnapshotTypeDefaultAssertions;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v36 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "pageIndexesToExclude");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addIndexes:", v11);

        }
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v8);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v12 = self->_iconImageViewControllerKeepSnapshotTypeLowResolutionAssertions;
    v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "pageIndexesToExclude", (_QWORD)v31);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v5, "addIndexes:", v17);

        }
        v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v14);
    }

    v18 = 1;
  }
  else
  {
    v18 = 0;
    v5 = 0;
  }
  -[SBFolderController folder](self, "folder", (_QWORD)v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "indexPathForIcon:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[SBFolderController pageIndexForIconListModelIndex:](self, "pageIndexForIconListModelIndex:", objc_msgSend(v21, "sbListIndex"));
  if (v18
    && (v23 = v22, -[SBFolderController _isValidPageIndex:](self, "_isValidPageIndex:", v22))
    && (objc_msgSend(v5, "containsIndex:", v23) & 1) == 0)
  {
    if (-[NSHashTable count](self->_iconImageViewControllerKeepSnapshotTypeDefaultAssertions, "count"))
      v24 = 1;
    else
      v24 = 2;
  }
  else
  {
    v24 = 0;
  }
  -[SBFolderController iconLocation](self, "iconLocation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupIconHierarchy"), v25);
  v28 = SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupIconHierarchy"), v26);
  if (v27 & (v28 ^ 1) | SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupWidgetConfiguration"), v26))v29 = 0;
  else
    v29 = v24;

  return v29;
}

- (void)_updatePresentationModeForIconViews
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_iconViewsWithCustomImageViewControllers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[SBFolderController _updatePresentationModeForIconView:](self, "_updatePresentationModeForIconView:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updatePresentationModeForIconView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "customIconImageViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setPresentationMode:", -[SBFolderController iconImageViewControllerPresentationModeForIconView:](self, "iconImageViewControllerPresentationModeForIconView:", v5));

}

- (void)_beginTrackingIconViewWithCustomImageViewController:(id)a3
{
  id v4;
  NSHashTable *iconViewsWithCustomImageViewControllers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  iconViewsWithCustomImageViewControllers = self->_iconViewsWithCustomImageViewControllers;
  v8 = v4;
  if (!iconViewsWithCustomImageViewControllers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_iconViewsWithCustomImageViewControllers;
    self->_iconViewsWithCustomImageViewControllers = v6;

    v4 = v8;
    iconViewsWithCustomImageViewControllers = self->_iconViewsWithCustomImageViewControllers;
  }
  -[NSHashTable addObject:](iconViewsWithCustomImageViewControllers, "addObject:", v4);

}

- (void)_endTrackingIconViewWithCustomImageViewController:(id)a3
{
  -[NSHashTable removeObject:](self->_iconViewsWithCustomImageViewControllers, "removeObject:", a3);
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  if (-[SBFolderController isPresentingIconLocation:](self, "isPresentingIconLocation:", a4))
  {
    -[SBFolderController currentIconListView](self, "currentIconListView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "directlyContainsIcon:", v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (-[SBFolderController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14))
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  if (-[SBFolderController isPresentingIconLocation:](self, "isPresentingIconLocation:", v7)
    && -[SBFolderController isDisplayingIconView:](self, "isDisplayingIconView:", v6))
  {
    objc_msgSend(v6, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[SBFolderController presentedIconLocations](self, "presentedIconLocations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "minusSet:", v6);
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderController firstIconViewForIcon:inLocations:](self, "firstIconViewForIcon:inLocations:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SBIconListView)dockListView
{
  return 0;
}

- (id)beginModifyingDockOffscreenFractionForReason:(id)a3
{
  return 0;
}

- (void)setScrollingDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[SBFolderController folderView](self, "folderView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setScrollingDisabled:forReason:", v4, v6);

}

- (void)cancelScrolling
{
  void *v3;
  id v4;

  -[SBFolderController folderView](self, "folderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelScrolling");

  -[SBFolderController innerFolderController](self, "innerFolderController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelScrolling");

}

- (id)disableAutoScrollForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBFolderController folderView](self, "folderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disableAutoScrollForReason:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)userInterfaceLayoutDirectionHandling
{
  void *v2;
  unint64_t v3;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirectionHandling");

  return v3;
}

- (BOOL)isVertical
{
  void *v2;
  char v3;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVertical");

  return v3;
}

- (void)setIconImageCache:(id)a3
{
  void *v5;
  SBHIconImageCache *v6;

  v6 = (SBHIconImageCache *)a3;
  if (self->_iconImageCache != v6)
  {
    objc_storeStrong((id *)&self->_iconImageCache, a3);
    -[SBFolderController folderView](self, "folderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIconImageCache:", v6);

  }
}

- (void)setFolderIconImageCache:(id)a3
{
  void *v5;
  SBFolderIconImageCache *v6;

  v6 = (SBFolderIconImageCache *)a3;
  if (self->_folderIconImageCache != v6)
  {
    objc_storeStrong((id *)&self->_folderIconImageCache, a3);
    -[SBFolderController folderView](self, "folderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFolderIconImageCache:", v6);

  }
}

- (void)minimumHomeScreenScaleDidChange
{
  id v2;

  -[SBFolderController folderView](self, "folderView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumHomeScreenScaleDidChange");

}

- (id)_dragDelegate
{
  id v3;
  void *v4;

  -[SBFolderController folderDelegate](self, "folderDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "draggingDelegateForFolderController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_setHomescreenAndDockAlpha:(double)a3
{
  id v4;

  -[SBFolderController folderViewIfLoaded](self, "folderViewIfLoaded");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (void)_updateHomescreenAndDockFade
{
  uint64_t v3;
  id v4;

  if (-[SBFolderController _homescreenAndDockShouldFade](self, "_homescreenAndDockShouldFade"))
  {
    -[SBNestingViewController nestedViewController](self, "nestedViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = objc_msgSend(v4, "isOpen");
    else
      v3 = 0;
    -[SBFolderController _fadeHomescreenAndDockIfNecessaryForFolderOpen:](self, "_fadeHomescreenAndDockIfNecessaryForFolderOpen:", v3);

  }
  else
  {
    -[SBFolderController _setHomescreenAndDockAlpha:](self, "_setHomescreenAndDockAlpha:", 1.0);
  }
}

- (void)_hideFakeStatusBarForReason:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSMutableSet *fakeStatusBarHidingReasons;
  NSMutableSet *v8;
  NSMutableSet *v9;
  id v10;

  v4 = a4;
  v6 = a3;
  fakeStatusBarHidingReasons = self->_fakeStatusBarHidingReasons;
  v10 = v6;
  if (!fakeStatusBarHidingReasons)
  {
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = self->_fakeStatusBarHidingReasons;
    self->_fakeStatusBarHidingReasons = v8;

    v6 = v10;
    fakeStatusBarHidingReasons = self->_fakeStatusBarHidingReasons;
  }
  -[NSMutableSet addObject:](fakeStatusBarHidingReasons, "addObject:", v6);
  if (-[NSMutableSet count](self->_fakeStatusBarHidingReasons, "count"))
    -[UIStatusBar setHidden:animated:](self->_fakeStatusBar, "setHidden:animated:", 1, v4);

}

- (void)_unhideFakeStatusBarForReason:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[NSMutableSet removeObject:](self->_fakeStatusBarHidingReasons, "removeObject:", a3);
  if (!-[NSMutableSet count](self->_fakeStatusBarHidingReasons, "count"))
    -[UIStatusBar setHidden:animated:](self->_fakeStatusBar, "setHidden:animated:", 0, v4);
}

- (SBIconListPageControl)pageControl
{
  void *v2;
  void *v3;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconListPageControl *)v3;
}

- (BOOL)isPageControlHidden
{
  void *v2;
  char v3;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPageControlHidden");

  return v3;
}

- (void)setPageControlHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBFolderController folderView](self, "folderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPageControlHidden:", v3);

}

- (double)pageControlAlpha
{
  void *v2;
  double v3;
  double v4;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pageControlAlpha");
  v4 = v3;

  return v4;
}

- (void)setPageControlAlpha:(double)a3
{
  id v4;

  -[SBFolderController folderView](self, "folderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPageControlAlpha:", a3);

}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  void *v2;
  void *v3;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridSizeClassDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHIconGridSizeClassDomain *)v3;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  void *v2;
  void *v3;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overrideIconImageAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHIconImageAppearance *)v3;
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFolderController folderView](self, "folderView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverrideIconImageAppearance:", v4);

}

- (SBHIconImageAppearance)effectiveIconImageAppearance
{
  void *v3;
  void *v4;
  void *v5;

  -[SBFolderController overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageAppearanceFromTraitCollection:overrideIconImageAppearance:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHIconImageAppearance *)v5;
}

+ (NSString)iconLocation
{
  return (NSString *)CFSTR("SBIconLocationNone");
}

- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SBFolderController folderView](self, "folderView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIconListsWithAnimationType:forceRelayout:", a3, v4);

}

- (BOOL)shouldViewControllersAppearVisibleForListView:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  int64_t v11;
  int64_t v12;

  v4 = a3;
  if ((-[SBFolderController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[SBFolderView iconListViews](self->_contentView, "iconListViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v4);

    v8 = -[SBFolderController pageIndexForIconListViewIndex:](self, "pageIndexForIconListViewIndex:", v7);
    v11 = 0;
    v12 = 0;
    -[SBFolderView getLeadingVisiblePageIndex:trailingVisiblePageIndex:](self->_contentView, "getLeadingVisiblePageIndex:trailingVisiblePageIndex:", &v12, &v11);
    v5 = v8 >= v12 && v8 <= v11;
  }

  return v5;
}

- (BOOL)_allowUserInteraction
{
  if (-[SBFolderController isScrolling](self, "isScrolling"))
    return 0;
  else
    return !-[SBFolderController isRotating](self, "isRotating");
}

- (BOOL)closesAfterDragExits
{
  return 1;
}

- (BOOL)canAcceptFolderIconDrags
{
  return 0;
}

- (BOOL)disablesScrollingWhileIconDragIsDropping
{
  return 1;
}

- (void)_cancelCloseFolderTimer
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_DEBUG, "[SBFolderController] _cancelCloseFolderTimer was called", v1, 2u);
}

- (void)_closeFolderTimerFired
{
  void *v3;
  void *v4;
  id v5;

  -[SBFolderController _cancelCloseFolderTimer](self, "_cancelCloseFolderTimer");
  -[SBFolderController folder](self, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBFolderController _dragDelegate](self, "_dragDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SBFolderController currentIconListView](self, "currentIconListView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "folderController:draggedIconShouldDropFromListView:", self, v4);

    }
  }
}

- (void)_setCloseFolderTimerIfNecessary
{
  NSTimer *v3;
  NSTimer *closeFolderTimer;

  if (!self->_closeFolderTimer
    && (self->_grabbedIconHasEverEnteredFolderView
     || !-[SBFolderController dragEnteredWhileAnimating](self, "dragEnteredWhileAnimating")))
  {
    if (-[SBFolderController closesAfterDragExits](self, "closesAfterDragExits"))
    {
      if (!-[NSMutableSet count](self->_draggingEnteredIconListViews, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__closeFolderTimerFired, 0, 0, 0.25);
        v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
        closeFolderTimer = self->_closeFolderTimer;
        self->_closeFolderTimer = v3;

      }
    }
  }
}

- (void)noteIconDrag:(id)a3 didEnterIconListView:(id)a4
{
  id v6;
  NSMutableSet *draggingEnteredIconListViews;
  NSMutableSet *v8;
  NSMutableSet *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id v14;
  CGPoint v15;
  CGRect v16;

  v14 = a3;
  v6 = a4;
  draggingEnteredIconListViews = self->_draggingEnteredIconListViews;
  if (!draggingEnteredIconListViews)
  {
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = self->_draggingEnteredIconListViews;
    self->_draggingEnteredIconListViews = v8;

    draggingEnteredIconListViews = self->_draggingEnteredIconListViews;
  }
  -[NSMutableSet addObject:](draggingEnteredIconListViews, "addObject:", v6);
  objc_msgSend(v14, "locationInView:", v6);
  v11 = v10;
  v13 = v12;
  objc_msgSend(v6, "bounds");
  v15.x = v11;
  v15.y = v13;
  if (CGRectContainsPoint(v16, v15))
  {
    -[SBFolderController noteUserIsInteractingWithIcons](self, "noteUserIsInteractingWithIcons");
    -[SBFolderController _cancelAllInteractionTimers](self, "_cancelAllInteractionTimers");
    -[SBFolderController _updateAssociatedControllerStateAnimated:](self, "_updateAssociatedControllerStateAnimated:", 0);
    self->_grabbedIconHasEverEnteredFolderView = 1;
  }
  -[SBFolderController setDragEnteredWhileAnimating:](self, "setDragEnteredWhileAnimating:", -[SBFolderController isAnimating](self, "isAnimating"));

}

- (void)noteIconDrag:(id)a3 didChangeInIconListView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  CGPoint v14;
  CGRect v15;

  v13 = a3;
  v6 = a4;
  -[SBFolderController innerFolderController](self, "innerFolderController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SBFolderController innerFolderController](self, "innerFolderController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "noteIconDrag:didChangeInIconListView:", v13, v6);

  }
  else
  {
    if (!-[SBFolderController _allowUserInteraction](self, "_allowUserInteraction"))
      -[SBFolderController _cancelAllInteractionTimers](self, "_cancelAllInteractionTimers");
    if (-[NSMutableSet containsObject:](self->_draggingEnteredIconListViews, "containsObject:", v6))
    {
      objc_msgSend(v13, "locationInView:", v6);
      v10 = v9;
      v12 = v11;
      objc_msgSend(v6, "bounds");
      v14.x = v10;
      v14.y = v12;
      if (CGRectContainsPoint(v15, v14))
      {
        self->_grabbedIconHasEverEnteredFolderView = 1;
      }
      else
      {
        -[NSMutableSet removeObject:](self->_draggingEnteredIconListViews, "removeObject:", v6);
        -[SBFolderController _setCloseFolderTimerIfNecessary](self, "_setCloseFolderTimerIfNecessary");
      }
    }
  }

}

- (void)noteIconDrag:(id)a3 didExitIconListView:(id)a4
{
  id v5;

  v5 = a4;
  if (-[NSMutableSet containsObject:](self->_draggingEnteredIconListViews, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_draggingEnteredIconListViews, "removeObject:", v5);
    -[SBFolderController noteUserIsInteractingWithIcons](self, "noteUserIsInteractingWithIcons");
    -[SBFolderController _setCloseFolderTimerIfNecessary](self, "_setCloseFolderTimerIfNecessary");
    -[SBFolderController _updateAssociatedControllerStateAnimated:](self, "_updateAssociatedControllerStateAnimated:", 0);
  }

}

- (void)noteIconDragDidEnd:(id)a3
{
  void *v4;
  NSMutableSet *draggingEnteredIconListViews;

  -[SBFolderController _cancelAllInteractionTimers](self, "_cancelAllInteractionTimers", a3);
  if (!-[SBFolderController isEditing](self, "isEditing"))
  {
    -[SBFolderController folder](self, "folder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "compactLists");

  }
  self->_grabbedIconHasEverEnteredFolderView = 0;
  draggingEnteredIconListViews = self->_draggingEnteredIconListViews;
  self->_draggingEnteredIconListViews = 0;

}

- (void)unscatterAnimated:(BOOL)a3 afterDelay:(double)a4 withCompletion:(id)a5
{
  _BOOL4 v6;
  id v8;
  SBIconAnimator *v9;
  SBIconAnimator *iconAnimator;
  SBIconAnimator *v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v8 = a5;
  -[SBFolderController _clearIconAnimator](self, "_clearIconAnimator");
  if (v6)
  {
    v9 = -[SBFolderController _newAnimatorForZoomUp:](self, "_newAnimatorForZoomUp:", 0);
    iconAnimator = self->_iconAnimator;
    self->_iconAnimator = v9;

    -[SBIconAnimator prepare](self->_iconAnimator, "prepare");
    -[SBIconAnimator setFraction:](self->_iconAnimator, "setFraction:", 1.0);
    v11 = self->_iconAnimator;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__SBFolderController_unscatterAnimated_afterDelay_withCompletion___block_invoke;
    v12[3] = &unk_1E8D881C0;
    v12[4] = self;
    v13 = v8;
    -[SBIconAnimator animateToFraction:afterDelay:withCompletion:](v11, "animateToFraction:afterDelay:withCompletion:", v12, 0.0, a4);

  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }

}

uint64_t __66__SBFolderController_unscatterAnimated_afterDelay_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_clearIconAnimator");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)_clearIconAnimator
{
  SBIconAnimator *iconAnimator;

  -[SBIconAnimator cleanup](self->_iconAnimator, "cleanup");
  iconAnimator = self->_iconAnimator;
  self->_iconAnimator = 0;

}

- (id)_newAnimatorForZoomUp:(BOOL)a3
{
  SBIconFadeAnimator *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v5 = -[SBIconAnimator initWithAnimationContainer:]([SBIconFadeAnimator alloc], "initWithAnimationContainer:", self);
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iconAnimationSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reducedMotionSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconAnimator setSettings:](v5, "setSettings:", v8);

  }
  else
  {
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconAnimationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      objc_msgSend(v6, "centerLaunchSettings");
    else
      objc_msgSend(v6, "unlockSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SBCenterIconZoomAnimator initWithFolderController:]([SBCenterIconZoomAnimator alloc], "initWithFolderController:", self);
    -[SBIconAnimator setSettings:](v5, "setSettings:", v7);
  }

  return v5;
}

- (unint64_t)_depth
{
  void *v2;
  unint64_t v3;

  -[SBFolderController outerFolderController](self, "outerFolderController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_depth") + 1;

  return v3;
}

- (BOOL)_listIndexIsVisible:(unint64_t)a3
{
  return -[SBFolderController currentPageIndex](self, "currentPageIndex") == a3;
}

- (BOOL)_iconAppearsOnCurrentPage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[SBFolderController folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForIcon:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6
    && objc_msgSend(v6, "length") == 2
    && -[SBFolderController _listIndexIsVisible:](self, "_listIndexIsVisible:", SBFolderRelativeListIndex(v6));

  return v7;
}

uint64_t __66__SBFolderController_pushFolderIcon_location_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setOverrideIconImageAppearance:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)popFolderAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void (**v7)(id, _QWORD);

  v4 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[SBFolderController innerFolderController](self, "innerFolderController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SBNestingViewController popNestedViewControllerAnimated:withCompletion:](self, "popNestedViewControllerAnimated:withCompletion:", v4, v7);
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }

}

- (BOOL)restoreExpandedPathIdentifiers:(id)a3
{
  void *v4;
  void *v5;
  SBFolderController *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  objc_class *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  uint64_t v20;
  BOOL v21;
  id v23;
  id v24;
  id obj;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  -[SBFolderController folder](self, "folder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedComponentsForUniqueIdentifierPath:", v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = self;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  v8 = v6;
  if (v7)
  {
    v9 = *(_QWORD *)v32;
    v8 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v11 == v4)
            continue;
          v12 = v11;
          v13 = -[SBFolderController controllerClassForFolder:](v6, "controllerClassForFolder:", v4);
          v14 = objc_alloc_init((Class)-[objc_class configurationClass](v13, "configurationClass"));
          objc_msgSend(v14, "setOriginatingIconLocation:", CFSTR("SBIconLocationRoot"));
          -[SBFolderController configureInnerFolderControllerConfiguration:](v6, "configureInnerFolderControllerConfiguration:", v14);
          objc_msgSend(v14, "setFolder:", v12);
          v15 = objc_msgSend([v13 alloc], "initWithConfiguration:", v14);
          objc_msgSend(v24, "addObject:", v15);
          -[SBFolderController iconLocation](v6, "iconLocation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setOriginatingIconLocation:", v16);

        }
        else
        {
          objc_opt_self();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
            continue;
          v14 = v11;
          objc_msgSend(v8, "folder");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "indexOfList:", v14);

          if (v20 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v8, "setCurrentPageIndex:", v20);
          v15 = (uint64_t)v8;
        }

        v8 = (void *)v15;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v7);
  }

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = -1;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __53__SBFolderController_restoreExpandedPathIdentifiers___block_invoke;
  v26[3] = &unk_1E8D89C68;
  v26[4] = &v27;
  -[SBNestingViewController setNestedViewControllers:withCompletion:](v6, "setNestedViewControllers:withCompletion:", v24, v26);
  v21 = *((_DWORD *)v28 + 6) == 1;
  _Block_object_dispose(&v27, 8);

  return v21;
}

uint64_t __53__SBFolderController_restoreExpandedPathIdentifiers___block_invoke(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (NSIndexPath)currentIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SBFolderController innerFolderController](self, "innerFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "currentIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderController folder](self, "folder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "folder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathForNodeIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_indexPathByAddingPrefix:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", -[SBFolderController currentPageIndex](self, "currentPageIndex"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSIndexPath *)v9;
}

- (void)_cancelTouchesForCustomIconImageViewController:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSMapTable *iconViewCustomImageViewControllerTouchCancellationAssertions;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  -[NSMapTable objectForKey:](self->_iconViewCustomImageViewControllerTouchCancellationAssertions, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "cancelTouchesForCurrentEventInHostedContent");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      iconViewCustomImageViewControllerTouchCancellationAssertions = self->_iconViewCustomImageViewControllerTouchCancellationAssertions;
      if (!iconViewCustomImageViewControllerTouchCancellationAssertions)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        v9 = self->_iconViewCustomImageViewControllerTouchCancellationAssertions;
        self->_iconViewCustomImageViewControllerTouchCancellationAssertions = v8;

        iconViewCustomImageViewControllerTouchCancellationAssertions = self->_iconViewCustomImageViewControllerTouchCancellationAssertions;
      }
      -[NSMapTable setObject:forKey:](iconViewCustomImageViewControllerTouchCancellationAssertions, "setObject:forKey:", v6, v10);

    }
  }

}

- (id)cancelTouchesForAllCustomIconImageViewControllersForReason:(id)a3
{
  id v4;
  SBHCompoundAssertion *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SBHCompoundAssertion initWithReason:]([SBHCompoundAssertion alloc], "initWithReason:", v4);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_iconViewsWithCustomImageViewControllers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "customIconImageViewController", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "cancelTouchesForCurrentEventInHostedContent");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            -[SBHCompoundAssertion addAssertion:](v5, "addAssertion:", v12);

          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_canAnyIconViewBeVisiblySettled
{
  return !-[SBFolderController isScrolling](self, "isScrolling")
      && -[SBFolderController contentVisibility](self, "contentVisibility") != 2;
}

- (id)matchMoveSourceViewForIconView:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupDock"), v4);

  if (v5)
    -[SBFolderController dockListView](self, "dockListView");
  else
    -[SBFolderController currentIconListView](self, "currentIconListView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIWindow)animationWindow
{
  void *v2;
  void *v3;

  -[SBFolderController animationContext](self, "animationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animationWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindow *)v3;
}

- (UIView)fallbackIconContainerView
{
  void *v2;
  void *v3;

  -[SBFolderController animationContext](self, "animationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fallbackIconContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (SBHIconModel)iconModel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBFolderController folder](self, "folder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (SBHIconModel *)v5;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
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
  v7 = (void (**)(id, void *))a4;
  -[SBFolderController presentedIconLocations](self, "presentedIconLocations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        -[SBFolderController iconViewForIcon:location:](self, "iconViewForIcon:location:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          v7[2](v7, v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (id)borrowScalingView
{
  void *v2;
  void *v3;

  -[SBFolderController folderView](self, "folderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "borrowScalingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)returnScalingView
{
  id v2;

  -[SBFolderController folderView](self, "folderView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "returnScalingView");

}

- (void)prepareForAnimation:(id)a3 withTargetIcon:(id)a4
{
  -[SBFolderController setCurrentPageIndexToListDirectlyContainingIcon:animated:](self, "setCurrentPageIndexToListDirectlyContainingIcon:animated:", a4, 0);
}

- (void)setContentAlpha:(double)a3
{
  id v4;

  -[SBFolderController folderView](self, "folderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentAlpha:", a3);

}

- (UIEdgeInsets)statusBarInsetsForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_7;
  }
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0)
  {
LABEL_7:
    v19.receiver = self;
    v19.super_class = (Class)SBFolderController;
    -[SBNestingViewController sizeForChildContentContainer:withParentContainerSize:](&v19, sel_sizeForChildContentContainer_withParentContainerSize_, v7, width, height);
    v12 = v15;
    v14 = v16;
    goto LABEL_8;
  }
  objc_msgSend(v7, "viewIfLoaded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

LABEL_8:
  v17 = v12;
  v18 = v14;
  result.height = v18;
  result.width = v17;
  return result;
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
  int64_t v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[6];
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;
  CGSize v30;

  height = a3.height;
  width = a3.width;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBFolderController;
  -[SBFolderController viewWillTransitionToSize:withTransitionCoordinator:](&v20, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_msgSend(v7, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "_fromWindowOrientation");
  v11 = objc_msgSend(v9, "_toWindowOrientation");
  -[SBFolderController allowedOrientations](self, "allowedOrientations");
  v12 = -[SBFolderController orientation](self, "orientation");
  if (SBFInterfaceOrientationMaskContainsInterfaceOrientation() && v12 != v11)
  {
    SBLogIcon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30.width = width;
      v30.height = height;
      NSStringFromCGSize(v30);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v15;
      v23 = 2114;
      v24 = v16;
      v25 = 2048;
      v26 = v10;
      v27 = 2048;
      v28 = v11;
      _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_INFO, "%{public}@ will transition to size %{public}@, %li to %li orientation", buf, 0x2Au);

    }
    -[SBFolderController setRotating:](self, "setRotating:", 1);
    -[SBFolderController folderView](self, "folderView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "transitionToSize:withTransitionCoordinator:", v7, width, height);
    -[SBFolderController _resetFakeStatusBarFrameOnly](self, "_resetFakeStatusBarFrameOnly");
    v18[4] = self;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __73__SBFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v19[3] = &unk_1E8D87778;
    v19[4] = self;
    v19[5] = v11;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __73__SBFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v18[3] = &unk_1E8D85400;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v19, v18);

  }
}

uint64_t __73__SBFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
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
  double v11;

  objc_msgSend(*(id *)(a1 + 32), "setOrientation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  if (v8 >= v10)
    v11 = v8;
  else
    v11 = v10;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setFrame:", v4, v6, v11, v11);
  return objc_msgSend(*(id *)(a1 + 32), "_resetFakeStatusBarFrameOnly");
}

uint64_t __73__SBFolderController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[130];
  objc_msgSend(v2, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  return objc_msgSend(*(id *)(a1 + 32), "setRotating:", 0);
}

- (void)folderController:(id)a3 draggedIconShouldDropFromListView:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "folderController:draggedIconShouldDropFromListView:", v8, v6);

}

- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "folderControllerShouldClose:withPinchGesture:", self, v5))
    -[SBFolderController popFolderAnimated:completion:](self, "popFolderAnimated:completion:", 1, 0);

  return 0;
}

- (void)folderControllerShouldBeginEditing:(id)a3 withHaptic:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "folderControllerShouldBeginEditing:withHaptic:", self, v4);

}

- (void)folderControllerShouldEndEditing:(id)a3
{
  id v4;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "folderControllerShouldEndEditing:", self);

}

- (void)folderControllerWillBeginScrolling:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "folderControllerWillBeginScrolling:", v4);

}

- (void)folderControllerDidEndScrolling:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "folderControllerDidEndScrolling:", v4);

}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;

  v7 = a4;
  v8 = a5;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(v9, "folderController:iconListView:canHandleIconDropSession:", self, v7, v8);
  else
    v10 = 1;

  return v10;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "folderController:iconListView:iconDropSessionDidEnter:", self, v9, v7);

}

- (id)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v9, "folderController:iconListView:iconDropSessionDidUpdate:", self, v7, v8),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 0);
  }

  return v10;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "folderController:iconListView:iconDropSessionDidExit:", self, v9, v7);

}

- (void)folderController:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "folderController:iconListView:performIconDrop:", self, v9, v7);

}

- (id)folderController:(id)a3 iconListView:(id)a4 iconViewForDroppingIconDragItem:(id)a5 proposedIconView:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "folderController:iconListView:iconViewForDroppingIconDragItem:proposedIconView:", v10, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (void)folderController:(id)a3 iconListView:(id)a4 willUseIconView:(id)a5 forDroppingIconDragItem:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "folderController:iconListView:willUseIconView:forDroppingIconDragItem:", v14, v10, v11, v12);

}

- (id)folderController:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v14, "folderController:iconListView:previewForDroppingIconDragItem:proposedPreview:", v10, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v9 = a5;
  v10 = a6;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "folderController:iconListView:iconDragItem:willAnimateDropWithAnimator:", self, v12, v9, v10);

}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = objc_msgSend(v12, "folderController:iconListView:shouldAllowSpringLoadedInteractionForIconDropSession:onIconView:", self, v9, v10, v11);
  else
    v13 = 0;

  return v13;
}

- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "folderController:iconListView:springLoadedInteractionForIconDragDidCompleteOnIconView:", self, v9, v7);

}

- (id)folderController:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "folderController:iconListView:customSpringAnimationBehaviorForDroppingItem:", self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (UIEdgeInsets)contentOverlayInsetsFromParentIfAvailableForFolderController:(id)a3
{
  void *v4;
  double v5;
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
  UIEdgeInsets result;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOverlayInsetsFromParentIfAvailableForFolderController:", self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)folderController:(id)a3 accessibilityTintColorForScreenRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "folderController:accessibilityTintColorForScreenRect:", self, x, y, width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)folderController:(id)a3 willCreateInnerFolderControllerWithConfiguration:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "folderController:willCreateInnerFolderControllerWithConfiguration:", v8, v6);

}

- (void)folderControllerWillClose:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SBFolderController folderView](self, "folderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuppressesEditingStateForListViews:", 0);

  -[SBFolderController folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isRootFolder"))
  {
    -[SBFolderController folderView](self, "folderView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentVisibility:", -[SBFolderController effectiveContentVisibilityFolderHasInnerFolder:](self, "effectiveContentVisibilityFolderHasInnerFolder:", 0));

  }
  else
  {
    -[SBFolderController updateContentViewOcclusion](self, "updateContentViewOcclusion");
  }
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "folderControllerWillClose:", v8);

}

- (void)folderControllerDidClose:(id)a3
{
  void *v4;
  void *v5;
  SBFolderController *v6;

  v6 = (SBFolderController *)a3;
  -[SBFolderController folder](v6, "folder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isRootFolder") & 1) == 0)
    objc_msgSend(v4, "setRequiredTrailingEmptyListCount:", 0);
  if (v6 == self)
  {
    if (-[SBFolderController wasFolderCancelable](v6, "wasFolderCancelable"))
      objc_msgSend(v4, "setCancelable:", 1);
  }
  else
  {
    -[SBFolderController removeAssertionsFromInnerFolderController:](self, "removeAssertionsFromInnerFolderController:", v6);
  }
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "folderControllerDidClose:", v6);

}

- (id)folderControllerWantsToHideStatusBar:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "folderControllerWantsToHideStatusBar:animated:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)fakeStatusBarForFolderController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "fakeStatusBarForFolderController:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)folderController:(id)a3 willRemoveFakeStatusBar:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "folderController:willRemoveFakeStatusBar:", self, v6);

}

- (id)statusBarStyleRequestForFolderController:(id)a3
{
  void *v4;
  void *v5;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "statusBarStyleRequestForFolderController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (UIEdgeInsets)statusBarEdgeInsetsForFolderController:(id)a3
{
  void *v4;
  double v5;
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
  UIEdgeInsets result;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "statusBarEdgeInsetsForFolderController:", self);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x1E0DC49E8];
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)folderController:(id)a3 iconAnimatorForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6 initialDelay:(double *)a7
{
  _BOOL8 v8;
  id v11;
  void *v12;
  void *v13;

  v8 = a6;
  v11 = a5;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "folderController:iconAnimatorForOperation:onViewController:animated:initialDelay:", self, a4, v11, v8, a7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)folderController:(id)a3 willUseIconTransitionAnimator:(id)a4 forOperation:(int64_t)a5 onViewController:(id)a6 animated:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  void *v12;
  id v13;

  v7 = a7;
  v13 = a4;
  v11 = a6;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "folderController:willUseIconTransitionAnimator:forOperation:onViewController:animated:", self, v13, a5, v11, v7);

}

- (id)nestingViewController:(id)a3 sourceViewForPresentingViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "folder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "icon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFolderController firstIconViewForIcon:](self, "firstIconViewForIcon:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBFolderController;
    -[SBNestingViewController nestingViewController:sourceViewForPresentingViewController:](&v14, sel_nestingViewController_sourceViewForPresentingViewController_, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)folderView:(id)a3 willAnimateScrollToPageIndex:(int64_t)a4
{
  BSInvalidatable *iconImageViewControllerKeepStaticForAnimatedScrollAssertion;
  BSInvalidatable *v7;
  void *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  id v11;

  v11 = a3;
  iconImageViewControllerKeepStaticForAnimatedScrollAssertion = self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion;
  if (iconImageViewControllerKeepStaticForAnimatedScrollAssertion)
  {
    -[BSInvalidatable invalidate](iconImageViewControllerKeepStaticForAnimatedScrollAssertion, "invalidate");
    v7 = self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion;
    self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addIndex:", objc_msgSend(v11, "currentPageIndex"));
  -[SBFolderController keepIconImageViewControllersSnapshotsOfType:inAllPagesExcluding:forReason:](self, "keepIconImageViewControllersSnapshotsOfType:inAllPagesExcluding:forReason:", 1, v8, CFSTR("AnimatedScroll"));
  v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  -[BSInvalidatable invalidate](self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion, "invalidate");
  v10 = self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion;
  self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion = v9;

}

- (void)folderViewShouldClose:(id)a3 withPinchGesture:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if (!-[SBFolderController isRotating](self, "isRotating"))
  {
    -[SBFolderController folderDelegate](self, "folderDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "folderControllerShouldClose:withPinchGesture:", self, v6);

  }
}

- (void)folderViewShouldBeginEditing:(id)a3
{
  id v4;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "folderControllerShouldBeginEditing:withHaptic:", self, 0);

}

- (void)folderViewShouldEndEditing:(id)a3
{
  id v4;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "folderControllerShouldEndEditing:", self);

}

- (BOOL)folderView:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;

  v7 = a4;
  v8 = a5;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(v9, "folderController:iconListView:canHandleIconDropSession:", self, v7, v8);
  else
    v10 = 1;

  return v10;
}

- (void)folderView:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "folderController:iconListView:iconDropSessionDidEnter:", self, v9, v7);
  -[SBFolderController noteIconDrag:didEnterIconListView:](self, "noteIconDrag:didEnterIconListView:", v7, v9);
  objc_msgSend(v9, "addDragObserver:forDropSession:", self, v7);

}

- (id)folderView:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v9, "folderController:iconListView:iconDropSessionDidUpdate:", self, v7, v8),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 0);
  }
  -[SBFolderController noteIconDrag:didChangeInIconListView:](self, "noteIconDrag:didChangeInIconListView:", v8, v7);
  if (objc_msgSend(v7, "iconsNeedLayout"))
    -[SBFolderController layoutIconListsWithAnimationType:forceRelayout:](self, "layoutIconListsWithAnimationType:forceRelayout:", 0, 1);

  return v10;
}

- (void)folderView:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[SBFolderController noteIconDrag:didExitIconListView:](self, "noteIconDrag:didExitIconListView:", v7, v9);
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "folderController:iconListView:iconDropSessionDidExit:", self, v9, v7);

}

- (void)folderView:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "folderController:iconListView:performIconDrop:", self, v9, v7);

}

- (id)folderView:(id)a3 iconListView:(id)a4 iconViewForDroppingIconDragItem:(id)a5 proposedIconView:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "folderController:iconListView:iconViewForDroppingIconDragItem:proposedIconView:", self, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (void)folderView:(id)a3 iconListView:(id)a4 willUseIconView:(id)a5 forDroppingIconDragItem:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v9 = a5;
  v10 = a6;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "folderController:iconListView:willUseIconView:forDroppingIconDragItem:", self, v12, v9, v10);

}

- (id)folderView:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "folderController:iconListView:previewForDroppingIconDragItem:proposedPreview:", self, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (void)folderView:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "folderController:iconListView:iconDragItem:willAnimateDropWithAnimator:", self, v11, v12, v13);
  if (-[SBFolderController disablesScrollingWhileIconDragIsDropping](self, "disablesScrollingWhileIconDragIsDropping"))
  {
    objc_msgSend(v10, "_setScrollingDisabled:forReason:", 1, CFSTR("SBFolderController-IconDropping"));
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __87__SBFolderController_folderView_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke;
    v15[3] = &unk_1E8D863E0;
    v16 = v10;
    objc_msgSend(v13, "addCompletion:", v15);

  }
}

uint64_t __87__SBFolderController_folderView_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setScrollingDisabled:forReason:", 0, CFSTR("SBFolderController-IconDropping"));
}

- (BOOL)folderView:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = objc_msgSend(v12, "folderController:iconListView:shouldAllowSpringLoadedInteractionForIconDropSession:onIconView:", self, v9, v10, v11);
  else
    v13 = 0;

  return v13;
}

- (void)folderView:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "folderController:iconListView:springLoadedInteractionForIconDragDidCompleteOnIconView:", self, v9, v7);

}

- (id)folderView:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  -[SBFolderController _dragDelegate](self, "_dragDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "folderController:iconListView:customSpringAnimationBehaviorForDroppingItem:", self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (UIEdgeInsets)contentOverlayInsetsFromParentIfAvailableForFolderView:(id)a3
{
  void *v4;
  double v5;
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
  UIEdgeInsets result;

  -[SBFolderController folderDelegate](self, "folderDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOverlayInsetsFromParentIfAvailableForFolderController:", self);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)folderView:(id)a3 accessibilityTintColorForRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toCoordinateSpace:", v12, x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "folderController:accessibilityTintColorForScreenRect:", self, v14, v16, v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)folderViewDidChangeOrientation:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[SBFolderController isRotating](self, "isRotating"))
    -[SBFolderController setOrientation:](self, "setOrientation:", objc_msgSend(v4, "orientation"));

}

uint64_t __52__SBFolderController_folderView_didAddIconListView___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "iconListView:didAddIconView:", *(_QWORD *)(a1 + 40), a2);
}

- (void)folderView:(id)a3 didRemoveIconListView:(id)a4
{
  objc_msgSend(a4, "removeLayoutObserver:", self);
}

- (void)iconListView:(id)a3 iconDropSessionDidEnd:(id)a4
{
  -[SBFolderController noteIconDragDidEnd:](self, "noteIconDragDidEnd:", a4);
}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "customIconImageViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    SBLogRootController();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SBFolderController iconView:didChangeCustomImageViewController:].cold.2();

    -[SBFolderController bs_removeChildViewController:](self, "bs_removeChildViewController:", v7);
    -[SBFolderController _endTrackingIconViewWithCustomImageViewController:](self, "_endTrackingIconViewWithCustomImageViewController:", v6);
  }
  if (v8)
  {
    if ((objc_msgSend(v6, "isIconImageViewBorrowed") & 1) == 0)
    {
      objc_msgSend(v6, "setCustomIconImageViewHitTestingDisabled:", -[SBFolderController _isHitTestingDisabledOnCustomIconImageViewControllers](self, "_isHitTestingDisabledOnCustomIconImageViewControllers"));
      SBLogRootController();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[SBFolderController iconView:didChangeCustomImageViewController:].cold.1();

      objc_msgSend(v8, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "superview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        NSLog(CFSTR("no superview!"));
      -[SBFolderController parentViewControllerForCustomIconImageViewControllerForIconView:](self, "parentViewControllerForCustomIconImageViewControllerForIconView:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bs_addChildViewController:", v8);

    }
    -[SBFolderController _beginTrackingIconViewWithCustomImageViewController:](self, "_beginTrackingIconViewWithCustomImageViewController:", v6);
  }

}

- (void)iconViewWillPresentContextMenu:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBFolderController isDisplayingIconView:](self, "isDisplayingIconView:", v7);
  v5 = v7;
  if (v4)
  {
    objc_msgSend(v7, "customIconImageViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[SBFolderController _cancelTouchesForCustomIconImageViewController:](self, "_cancelTouchesForCustomIconImageViewController:", v6);

    v5 = v7;
  }

}

- (void)iconViewDidDismissContextMenu:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SBFolderController isDisplayingIconView:](self, "isDisplayingIconView:"))
    -[SBFolderController _invalidateAllCancelTouchesAssertions](self, "_invalidateAllCancelTouchesAssertions");

}

- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  -[SBFolderController innerFolderController](self, "innerFolderController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14), "isEqual:", v9, (_QWORD)v15))
          -[SBFolderController popFolderAnimated:completion:](self, "popFolderAnimated:completion:", 0, 0);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  -[SBFolderController innerFolderController](self, "innerFolderController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "folder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v6, "isEqual:", v8);
  if ((_DWORD)v7)
    -[SBFolderController popFolderAnimated:completion:](self, "popFolderAnimated:completion:", 0, 0);

}

- (BOOL)isPresentingIconLocation:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBFolderController iconLocation](self, "iconLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[SBFolderController innerFolderController](self, "innerFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "folderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v6 = (void **)v10;
  }
  else
  {
    -[SBFolderController folderView](self, "folderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
    v6 = &v9;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)beginHidingIconsFromLayout:(id)a3 reason:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSHashTable *layoutHidingAssertions;
  NSHashTable *v18;
  NSHashTable *v19;

  v8 = a4;
  v9 = a3;
  -[SBFolderController folderView](self, "folderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginHidingIconsFromLayout:reason:options:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  v13 = v11;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  -[SBFolderController innerFolderController](self, "innerFolderController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v15, "addAssertionFromChild:", v16);
  layoutHidingAssertions = self->_layoutHidingAssertions;
  if (!layoutHidingAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v19 = self->_layoutHidingAssertions;
    self->_layoutHidingAssertions = v18;

    layoutHidingAssertions = self->_layoutHidingAssertions;
  }
  -[NSHashTable addObject:](layoutHidingAssertions, "addObject:", v15);

  return v15;
}

- (void)removeAssertionsFromInnerFolderController:(id)a3
{
  id v4;
  NSHashTable *v5;
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
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_layoutHidingAssertions;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "removeAndInvalidateAssertionsForChild:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings **p_legibilitySettings;
  void *v6;
  id v7;

  p_legibilitySettings = &self->_legibilitySettings;
  v7 = a3;
  if ((-[_UILegibilitySettings isEqual:](*p_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBFolderView setLegibilitySettings:](self->_contentView, "setLegibilitySettings:", *p_legibilitySettings);
    -[SBFolderController innerFolderController](self, "innerFolderController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLegibilitySettings:", *p_legibilitySettings);

  }
}

- (id)accessibilityTintColorForScreenRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBFolderController folderDelegate](self, "folderDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "folderController:accessibilityTintColorForScreenRect:", self, x, y, width, height);
  else
    -[SBFolderController defaultAccessibilityTintColor](self, "defaultAccessibilityTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFolderController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (id)context
{
  return self->_context;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (void)setOriginatingIconLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1280);
}

- (UIColor)defaultAccessibilityTintColor
{
  return self->_defaultAccessibilityTintColor;
}

- (void)setDefaultAccessibilityTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAccessibilityTintColor, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BSInvalidatable)statusBarAssertion
{
  return self->_statusBarAssertion;
}

- (void)setStatusBarAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarAssertion, a3);
}

- (UIStatusBar)fakeStatusBar
{
  return self->_fakeStatusBar;
}

- (void)setFakeStatusBar:(id)a3
{
  objc_storeStrong((id *)&self->_fakeStatusBar, a3);
}

- (BOOL)wasFolderCancelable
{
  return self->_wasFolderCancelable;
}

- (void)setWasFolderCancelable:(BOOL)a3
{
  self->_wasFolderCancelable = a3;
}

- (BOOL)dragEnteredWhileAnimating
{
  return self->_dragEnteredWhileAnimating;
}

- (void)setDragEnteredWhileAnimating:(BOOL)a3
{
  self->_dragEnteredWhileAnimating = a3;
}

- (SBFolderControllerAnimationContext)animationContext
{
  return self->_animationContext;
}

- (void)setAnimationContext:(id)a3
{
  objc_storeStrong((id *)&self->_animationContext, a3);
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_animationContext, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_fakeStatusBar, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_defaultAccessibilityTintColor, 0);
  objc_storeStrong((id *)&self->_originatingIconLocation, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_extraAssertions, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_folderIconView, 0);
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_destroyWeak((id *)&self->_folderDelegate);
  objc_storeStrong((id *)&self->_layoutHidingAssertions, 0);
  objc_storeStrong((id *)&self->_appearanceTransitioningCustomImageViewControllers, 0);
  objc_storeStrong((id *)&self->_iconViewCustomImageViewControllerTouchCancellationAssertions, 0);
  objc_storeStrong((id *)&self->_iconViewsWithCustomImageViewControllers, 0);
  objc_storeStrong((id *)&self->_iconImageViewControllerKeepStaticForAnimatedScrollAssertion, 0);
  objc_storeStrong((id *)&self->_iconImageViewControllerKeepSnapshotTypeLowResolutionAssertions, 0);
  objc_storeStrong((id *)&self->_iconImageViewControllerKeepSnapshotTypeDefaultAssertions, 0);
  objc_storeStrong((id *)&self->_pageViewControllerAppearStateOverrideAssertions, 0);
  objc_storeStrong((id *)&self->_realStatusBarHidingReasons, 0);
  objc_storeStrong((id *)&self->_fakeStatusBarHidingReasons, 0);
  objc_storeStrong((id *)&self->_draggingEnteredIconListViews, 0);
  objc_storeStrong((id *)&self->_iconAnimator, 0);
  objc_storeStrong((id *)&self->_closeFolderTimer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (void)nestingViewController:animationControllerForOperation:onViewController:animated:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1CFEF3000, v0, OS_LOG_TYPE_ERROR, "Forcing cross-fade animation for folder transition for icon: %@", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)pushFolderIcon:location:animated:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_3_3(&dword_1CFEF3000, v0, v1, "%s Folder icon %@ cannot be opened because it does not exist on the current page.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)pushFolderIcon:location:animated:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_3_3(&dword_1CFEF3000, v0, v1, "%s Unable to open folder icon %@ because we aren't actually open!", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)iconListView:didAddIconView:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_1CFEF3000, v1, OS_LOG_TYPE_DEBUG, "Ending appearance transition of %p to %{BOOL}u (didAddIconView)", v2, 0x12u);
  OUTLINED_FUNCTION_3();
}

- (void)iconListView:didAddIconView:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "Adding %p as a child of folder controller (didAddIconView)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)iconListView:didRemoveIconView:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "Ending appearance transition of %p to NO (didRemoveIconView)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)iconListView:didRemoveIconView:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "Beginning appearance transition of %p to NO (didRemoveIconView)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)iconListView:didRemoveIconView:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "Removing %p as a child of folder controller (didRemoveIconView)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)iconListView:didRemoveIconView:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "Not removing %p as a child of folder controller because it's in another view already (didRemoveIconView)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)iconView:didChangeCustomImageViewController:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "Adding %p as a child of folder controller (oldCustomImageViewController)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)iconView:didChangeCustomImageViewController:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1CFEF3000, v0, v1, "Removing %p as a child of folder controller (oldCustomImageViewController)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
