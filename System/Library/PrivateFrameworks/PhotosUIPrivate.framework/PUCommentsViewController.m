@implementation PUCommentsViewController

- (PUCommentsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCommentsViewController.m"), 45, CFSTR("%s is not available as initializer"), "-[PUCommentsViewController initWithNibName:bundle:]");

  abort();
}

- (PUCommentsViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCommentsViewController.m"), 49, CFSTR("%s is not available as initializer"), "-[PUCommentsViewController initWithCoder:]");

  abort();
}

- (PUCommentsViewController)initWithAssetViewModel:(id)a3
{
  id v5;
  PUCommentsViewController *v6;
  PUCommentsViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUCommentsViewController;
  v6 = -[PUCommentsViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    -[PUCommentsViewController px_enableExtendedTraitCollection](v6, "px_enableExtendedTraitCollection");
    -[PUCommentsViewController px_extendedTraitCollection](v7, "px_extendedTraitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerChangeObserver:context:", v7, PUExtendedTraitCollectionObservationContext);

    objc_storeStrong((id *)&v7->_assetViewModel, a3);
    -[PUAssetViewModel registerChangeObserver:](v7->_assetViewModel, "registerChangeObserver:", v7);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v4;
  id v5;
  UITableView *v6;
  UITableView *tableView;
  void *v8;
  void *v9;
  PUCommentsTableDataController *v10;
  PUCommentsTableDataController *tableDataController;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUCommentsViewController;
  -[PUCommentsViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[PUCommentsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0DC3D48]);
  objc_msgSend(v4, "bounds");
  v6 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", 0);
  tableView = self->__tableView;
  self->__tableView = v6;

  -[UITableView setBackgroundView:](self->__tableView, "setBackgroundView:", 0);
  -[UITableView setBackgroundColor:](self->__tableView, "setBackgroundColor:", 0);
  -[UITableView setClipsToBounds:](self->__tableView, "setClipsToBounds:", 1);
  -[UITableView setSeparatorStyle:](self->__tableView, "setSeparatorStyle:", 0);
  -[UITableView _setAutomaticContentOffsetAdjustmentEnabled:](self->__tableView, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
  -[UITableView setContentInsetAdjustmentBehavior:](self->__tableView, "setContentInsetAdjustmentBehavior:", 2);
  -[UITableView _setIndicatorInsetAdjustmentBehavior:](self->__tableView, "_setIndicatorInsetAdjustmentBehavior:", 1);
  -[UITableView setAutoresizingMask:](self->__tableView, "setAutoresizingMask:", 18);
  objc_msgSend(v4, "addSubview:", self->__tableView);
  -[PUCommentsViewController assetViewModel](self, "assetViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCommentsViewController.m"), 80, CFSTR("Comments can only be displayed for PHAsset"));

  }
  v10 = -[PUCommentsTableDataController initWithTableView:]([PUCommentsTableDataController alloc], "initWithTableView:", self->__tableView);
  tableDataController = self->__tableDataController;
  self->__tableDataController = v10;

  -[PUCommentsTableDataController setAsset:](self->__tableDataController, "setAsset:", v9);
  -[PUCommentsTableDataController setDelegate:](self->__tableDataController, "setDelegate:", self);
  -[PUCommentsViewController _updateTableDataController](self, "_updateTableDataController");
  -[PUCommentsViewController parentViewController](self, "parentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeDidChangeForChildContentContainer:", self);

  -[PUCommentsViewController _setNeedsUpdateTableViewScrollPosition:](self, "_setNeedsUpdateTableViewScrollPosition:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCommentsViewController;
  -[PUCommentsViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PUCommentsViewController _setNeedsUpdateTableViewScrollPosition:](self, "_setNeedsUpdateTableViewScrollPosition:", 1);
}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  CGSize result;

  if (-[PUCommentsViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PUCommentsViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCommentsViewController contentBoundsInCoordinateSpace:](self, "contentBoundsInCoordinateSpace:", v3);
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v5 = *MEMORY[0x1E0C9D820];
    *(double *)&v7 = 100.0;
  }
  v8 = v5;
  v9 = *(double *)&v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_updateTableDataController
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[PUCommentsViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "layoutSizeClass") == 2;

  -[PUCommentsViewController assetViewModel](self, "assetViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInEditMode");

  -[PUCommentsViewController _tableDataController](self, "_tableDataController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldUseCompactCommentSeparators:", v4);
  objc_msgSend(v7, "setEditing:", v6);

}

- (void)commentsTableDataController:(id)a3 didChangeEditing:(BOOL)a4
{
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  -[PUCommentsViewController assetViewModel](self, "assetViewModel", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__PUCommentsViewController_commentsTableDataController_didChangeEditing___block_invoke;
  v7[3] = &unk_1E58AAD68;
  v9 = a4;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "performChanges:", v7);

}

- (void)commentsTableDataController:(id)a3 tableViewDidScroll:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if ((objc_msgSend(v6, "isDragging") & 1) != 0 || objc_msgSend(v6, "isDecelerating"))
  {
    -[PUCommentsViewController accessoryContentViewControllerDelegate](self, "accessoryContentViewControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryContentViewControllerContentBoundsDidChange:", self);

  }
}

- (void)commentsTableDataController:(id)a3 presentViewController:(id)a4
{
  -[PUCommentsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (void)setContentInsets:(UIEdgeInsets)a3 changeReason:(int64_t)a4
{
  double right;
  double bottom;
  double left;
  double top;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (a3.left != self->_contentInsets.left
    || a3.top != self->_contentInsets.top
    || a3.right != self->_contentInsets.right
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    -[PUCommentsViewController _tableView](self, "_tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentInset:", top, left, bottom, right);
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v14 = (void *)MEMORY[0x1E0DC3F10];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __58__PUCommentsViewController_setContentInsets_changeReason___block_invoke;
      v18[3] = &unk_1E58ABD10;
      v19 = v13;
      objc_msgSend(v14, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 0, v18, 0, 0.0, 0.0);
      -[PUCommentsViewController accessoryContentViewControllerDelegate](self, "accessoryContentViewControllerDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "accessoryContentViewControllerContentBoundsDidChange:", self);

    }
    else
    {
      v16 = -[PUCommentsViewController _needsUpdateTableViewScrollPosition](self, "_needsUpdateTableViewScrollPosition");
      if (a4 == 1 || v16)
      {
        -[PUCommentsViewController _setNeedsUpdateTableViewScrollPosition:](self, "_setNeedsUpdateTableViewScrollPosition:", 0);
        objc_msgSend(v13, "setContentOffset:", 0.0, -top);
        -[PUCommentsViewController accessoryContentViewControllerDelegate](self, "accessoryContentViewControllerDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "accessoryContentViewControllerContentBoundsDidChange:", self);

      }
    }

  }
}

- (BOOL)contentAreaContainsPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGPoint v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PUCommentsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v7, x, y);
  v18 = v17;
  v20 = v19;

  v23.origin.x = v10;
  v23.origin.y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  v22.x = v18;
  v22.y = v20;
  LOBYTE(v7) = CGRectContainsPoint(v23, v22);

  return (char)v7;
}

- (CGRect)contentBoundsInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  v4 = a3;
  -[PUCommentsViewController _tableView](self, "_tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "contentOffset");
  v11 = v7 - v10;
  v13 = v9 - v12;
  objc_msgSend(v5, "contentSize");
  objc_msgSend(v5, "convertRect:toCoordinateSpace:", v4, v11, v13, v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v24 = round(*(double *)&PUMainScreenScale_screenScale * v21) / *(double *)&PUMainScreenScale_screenScale;
  v25 = round(*(double *)&PUMainScreenScale_screenScale * v23) / *(double *)&PUMainScreenScale_screenScale;

  v26 = v17;
  v27 = v19;
  v28 = v24;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGSize)minimumContentSize
{
  double v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  -[PUCommentsViewController _tableDataController](self, "_tableDataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minimumHeight");
  v5 = v4;

  v6 = v2;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "isInEditModeChanged", a3))
    -[PUCommentsViewController _updateTableDataController](self, "_updateTableDataController");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PUExtendedTraitCollectionObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCommentsViewController.m"), 209, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 2) != 0)
  {
    v11 = v9;
    -[PUCommentsViewController _updateTableDataController](self, "_updateTableDataController");
    v9 = v11;
  }

}

- (PUAccessoryContentViewControllerDelegate)accessoryContentViewControllerDelegate
{
  return (PUAccessoryContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_accessoryContentViewControllerDelegate);
}

- (void)setAccessoryContentViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryContentViewControllerDelegate, a3);
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (UITableView)_tableView
{
  return self->__tableView;
}

- (PUCommentsTableDataController)_tableDataController
{
  return self->__tableDataController;
}

- (BOOL)_needsUpdateTableViewScrollPosition
{
  return self->__needsUpdateTableViewScrollPosition;
}

- (void)_setNeedsUpdateTableViewScrollPosition:(BOOL)a3
{
  self->__needsUpdateTableViewScrollPosition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tableDataController, 0);
  objc_storeStrong((id *)&self->__tableView, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_destroyWeak((id *)&self->_accessoryContentViewControllerDelegate);
}

uint64_t __58__PUCommentsViewController_setContentInsets_changeReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_scrollToEdge:animated:", 3, 0);
}

uint64_t __73__PUCommentsViewController_commentsTableDataController_didChangeEditing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEditStyle:changeReason:");
}

+ (BOOL)canShowCommentsForAsset:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "isCloudSharedAsset");
  else
    v4 = 0;

  return v4;
}

@end
