@implementation _UIStickerPickerViewController

- (void)setDismissCompletionHandler:(id)a3
{
  id v4;

  v4 = _Block_copy(a3);
  objc_setAssociatedObject(self, &kDismissCompletionHandlerKey, v4, (void *)3);

}

- (id)dismissCompletionHandler
{
  return objc_getAssociatedObject(self, &kDismissCompletionHandlerKey);
}

- (_UIStickerPickerViewController)init
{
  _UIStickerPickerViewController *v2;
  _UIStickerPickerViewController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStickerPickerViewController;
  v2 = -[UIViewController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 4);
    -[UIViewController setTransitioningDelegate:](v3, "setTransitioningDelegate:", v3);
    -[UIViewController presentationController](v3, "presentationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", v3);

  }
  return v3;
}

- (void)loadView
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIStickerPickerViewController;
  -[UIViewController loadView](&v8, sel_loadView);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42___UIStickerPickerViewController_loadView__block_invoke;
  v5[3] = &unk_1E16E2CE0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v4 = +[_UIStickerPickerServiceRemoteViewController requestCardViewControllerWithConnectionHandler:](_UIStickerPickerServiceRemoteViewController, "requestCardViewControllerWithConnectionHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

+ (id)requestCardViewControllerWithConnectionHandler:(id)a3
{
  return +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](_UIRemoteViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("AppCardViewController"), CFSTR("com.apple.iMessageAppsViewService"), a3);
}

- (void)setSourceRect:(CGRect)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  self->_sourceRect = a3;
  -[_UIStickerPickerViewController card](self, "card");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[_UIStickerPickerViewController card](self, "card");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[_UIStickerPickerViewController _updatePopoverWindowLocation](self, "_updatePopoverWindowLocation");
  }
}

- (CGRect)_sourceRectInWindowCoordinates
{
  void *v3;
  double v4;
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
  CGRect result;

  -[_UIStickerPickerViewController sourceView](self, "sourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStickerPickerViewController sourceRect](self, "sourceRect");
  objc_msgSend(v3, "convertRect:toView:", 0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_updatePopoverWindowLocation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v8;

  -[UIViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v4 != 1)
  {
    -[_UIStickerPickerViewController _viewServiceProxy](self, "_viewServiceProxy");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIStickerPickerViewController _sourceRectInWindowCoordinates](self, "_sourceRectInWindowCoordinates");
    objc_msgSend(v8, "updatePopoverWindowLocation:completion:", &__block_literal_global_503);

  }
}

- (void)_remoteViewDidLoad:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;

  v4 = a3;
  objc_msgSend(v4, "willMoveToParentViewController:", self);
  -[UIViewController addChildViewController:](self, "addChildViewController:", v4);
  objc_msgSend(v4, "setDelegate:", self);
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  objc_msgSend(v4, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAutoresizingMask:", 18);

  -[UIViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v17);

  objc_msgSend(v4, "didMoveToParentViewController:", self);
  -[_UIStickerPickerViewController setCard:](self, "setCard:", v4);

  -[UIViewController traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "horizontalSizeClass");

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceIdiom");

  if ((v21 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v19 != 1)
  {
    -[_UIStickerPickerViewController _viewServiceProxy](self, "_viewServiceProxy");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIStickerPickerViewController _sourceRectInWindowCoordinates](self, "_sourceRectInWindowCoordinates");
    objc_msgSend(v22, "presentPopoverAtWindowLocation:completion:", &__block_literal_global_28_2);

  }
}

- (void)addStickerWithRepresentations:(id)a3 previewView:(id)a4 originatingView:(id)a5
{
  -[_UIStickerPickerViewController addStickerWithRepresentations:previewView:originatingView:completion:](self, "addStickerWithRepresentations:previewView:originatingView:completion:", a3, a4, a5, &__block_literal_global_30_5);
}

- (BOOL)supportsReturningStickerIdentifiersDuringAdditionV2
{
  return objc_msgSend(getCKBrowserViewControllerClass(), "instancesRespondToSelector:", sel__addStickerToStoreWithRepresentations_sourceRect_completion_);
}

- (BOOL)supportsReturningStickerIdentifiersDuringAddition
{
  return objc_msgSend(getCKBrowserViewControllerClass(), "instancesRespondToSelector:", sel__addStickerToStoreWithRepresentations_completionWithStickerIDs_);
}

- (void)addStickerWithRepresentations:(id)a3 previewView:(id)a4 originatingView:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  -[_UIStickerPickerViewController card](self, "card");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "frame");
  objc_msgSend(v13, "convertRect:toView:", 0);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v13, "window");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "convertRect:fromWindow:", v25, v18, v20, v22, v24);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  if (-[_UIStickerPickerViewController supportsReturningStickerIdentifiersDuringAdditionV2](self, "supportsReturningStickerIdentifiersDuringAdditionV2"))
  {
    _stickersLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_DEFAULT, "Calling out to the stickers view service to add the sticker to the store with stickerIDs", buf, 2u);
    }

    -[_UIStickerPickerViewController _viewServiceProxy](self, "_viewServiceProxy");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke;
    v50[3] = &unk_1E16E2D08;
    v51 = v12;
    objc_msgSend(v35, "addStickerToStoreWithRepresentations:sourceRect:completion:", v10, v50, v27, v29, v31, v33);

    v36 = v51;
  }
  else
  {
    objc_msgSend(v11, "setFrame:", v27, v29, v31, v33);
    -[_UIStickerPickerViewController card](self, "card");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "view");
    v38 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v38, "addSubview:", v11);

    LOBYTE(v38) = -[_UIStickerPickerViewController supportsReturningStickerIdentifiersDuringAddition](self, "supportsReturningStickerIdentifiersDuringAddition");
    _stickersLog();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
    if ((v38 & 1) != 0)
    {
      if (v40)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_DEFAULT, "Calling out to the stickers view service to add the sticker to the store with stickerIDs", buf, 2u);
      }

      -[_UIStickerPickerViewController _viewServiceProxy](self, "_viewServiceProxy");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_35;
      v46[3] = &unk_1E16E2D58;
      v46[4] = self;
      v47 = v10;
      v48 = v11;
      v49 = v12;
      objc_msgSend(v41, "addStickerToStoreWithRepresentations:completionWithStickerIDs:", v47, v46);

      v36 = v47;
    }
    else
    {
      if (v40)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_DEFAULT, "Using older addStickerToStoreWithRepresentations:completionHandler SPI", buf, 2u);
      }

      -[_UIStickerPickerViewController _viewServiceProxy](self, "_viewServiceProxy");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_37;
      v43[3] = &unk_1E16E2DA8;
      v43[4] = self;
      v44 = v10;
      v45 = v11;
      objc_msgSend(v42, "addStickerToStoreWithRepresentations:completionHandler:", v44, v43);

      v36 = v44;
    }
  }

}

- (void)animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (-[_UIStickerPickerViewController supportsReturningStickerIdentifiersDuringAddition](self, "supportsReturningStickerIdentifiersDuringAddition"))
  {
    -[_UIStickerPickerViewController _viewServiceProxy](self, "_viewServiceProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "animatedStickerCreationProgressChanged:progress:", v7, a4);

  }
}

- (void)_addStickerWithRepresentations:(id)a3 previewView:(id)a4 animatingTo:(CGRect)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  CGFloat MidX;
  CGFloat MidY;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  _QWORD block[5];
  id v35;
  _QWORD v36[4];
  NSObject *v37;
  _QWORD v38[4];
  id v39;
  CGAffineTransform v40;
  _QWORD v41[4];
  NSObject *v42;
  _QWORD v43[4];
  id v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  _QWORD v47[4];
  NSObject *v48;
  _QWORD v49[4];
  id v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  _QWORD v53[4];
  NSObject *v54;
  _QWORD v55[4];
  id v56;
  CGFloat v57;
  CGFloat v58;
  CGRect v59;
  CGRect v60;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  v11 = dispatch_group_create();
  -[_UIStickerPickerViewController card](self, "card");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  MidX = CGRectGetMidX(v59);
  v60.origin.x = x;
  v60.origin.y = y;
  v60.size.width = width;
  v60.size.height = height;
  MidY = CGRectGetMidY(v60);
  objc_msgSend(v10, "bounds");
  v17 = v16;
  objc_msgSend(v10, "bounds");
  v19 = v18;
  objc_msgSend(v10, "bounds");
  if (v17 > v19)
    v22 = height / v21;
  else
    v22 = width / v20;
  dispatch_group_enter(v11);
  v23 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke;
  v55[3] = &unk_1E16B4E70;
  v24 = v10;
  v56 = v24;
  v57 = MidX;
  v58 = MidY;
  v53[0] = v23;
  v53[1] = 3221225472;
  v53[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_3;
  v53[3] = &unk_1E16B3FD8;
  v25 = v11;
  v54 = v25;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v55, v53, 1.0, 0.0, 1.0, 0.0);
  memset(&v52, 0, sizeof(v52));
  CGAffineTransformMakeScale(&v52, v22 * 1.4, v22 * 1.4);
  dispatch_group_enter(v25);
  v49[0] = v23;
  v49[1] = 3221225472;
  v49[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_4;
  v49[3] = &unk_1E16BF720;
  v26 = v24;
  v50 = v26;
  v51 = v52;
  v47[0] = v23;
  v47[1] = 3221225472;
  v47[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_6;
  v47[3] = &unk_1E16B3FD8;
  v27 = v25;
  v48 = v27;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v49, v47, 0.7, 0.0, 1.0, 0.0);
  CGAffineTransformMakeScale(&v46, v22 * 0.8, v22 * 0.8);
  v52 = v46;
  dispatch_group_enter(v27);
  v43[0] = v23;
  v43[1] = 3221225472;
  v43[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_7;
  v43[3] = &unk_1E16BF720;
  v28 = v26;
  v44 = v28;
  v45 = v52;
  v41[0] = v23;
  v41[1] = 3221225472;
  v41[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_9;
  v41[3] = &unk_1E16B3FD8;
  v29 = v27;
  v42 = v29;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v43, v41, 0.8, 0.3, 1.0, 0.0);
  CGAffineTransformMakeScale(&v46, v22, v22);
  v52 = v46;
  dispatch_group_enter(v29);
  v38[0] = v23;
  v38[1] = 3221225472;
  v38[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_10;
  v38[3] = &unk_1E16BF720;
  v30 = v28;
  v39 = v30;
  v40 = v52;
  v36[0] = v23;
  v36[1] = 3221225472;
  v36[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_12;
  v36[3] = &unk_1E16B3FD8;
  v37 = v29;
  v31 = v29;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v38, v36, 0.8, 0.6, 0.8, 0.0);
  block[0] = v23;
  block[1] = 3221225472;
  block[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_13;
  block[3] = &unk_1E16B1B50;
  block[4] = self;
  v35 = v30;
  v32 = v30;
  dispatch_group_notify(v31, MEMORY[0x1E0C80D38], block);

}

- (void)_insertStickerFromItemProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id location;

  v4 = a3;
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v5);

  -[_UIStickerPickerViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_UIStickerPickerViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65___UIStickerPickerViewController__insertStickerFromItemProvider___block_invoke;
    v9[3] = &unk_1E16E2DD0;
    v9[4] = self;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "insertStickerFromItemProvider:completionHandler:", v4, v9);

    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&location);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _stickersLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Unexpected dismissal", v5, 2u);
  }

  -[_UIStickerPickerViewController dismissCard](self, "dismissCard");
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  UIStickerPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[UIPresentationController initWithPresentedViewController:presentingViewController:]([UIStickerPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _stickersLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_error_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Stickers view service did terminate with error: %@", (uint8_t *)&v6, 0xCu);
  }

  -[_UIStickerPickerViewController dismissCard](self, "dismissCard");
}

- (void)stickerPickerCardDidLoad
{
  void *v3;
  char v4;
  id v5;

  -[_UIStickerPickerViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_UIStickerPickerViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stickerPickerViewControllerDidLoad");

  }
}

- (void)dismissCardAnimated:(BOOL)a3
{
  -[_UIStickerPickerViewController dismissCardAnimated:completion:](self, "dismissCardAnimated:completion:", a3, &__block_literal_global_48_0);
}

- (void)dismissCardAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  _QWORD v8[5];
  void (**v9)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v4)
  {
    -[_UIStickerPickerViewController _viewServiceProxy](self, "_viewServiceProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65___UIStickerPickerViewController_dismissCardAnimated_completion___block_invoke;
    v8[3] = &unk_1E16B1D18;
    v8[4] = self;
    v9 = v6;
    objc_msgSend(v7, "animateCardHiddenWithCompletion:", v8);

  }
  else
  {
    -[_UIStickerPickerViewController dismissCard](self, "dismissCard");
    v6[2](v6);
  }

}

- (void)dismissCard
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  if (-[UIViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    _stickersLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring call to dismissCard. Card is already being dismissed.", buf, 2u);
    }

  }
  else
  {
    -[UIViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45___UIStickerPickerViewController_dismissCard__block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 0, v5);

  }
}

- (void)stageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 externalURI:(id)a6 accessibilityLabel:(id)a7 metadata:(id)a8
{
  id v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  id v19;

  v19 = a4;
  v10 = a8;
  -[_UIStickerPickerViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = -[_UIStickerPickerViewController isLaunchedFromKeyboard](self, "isLaunchedFromKeyboard");
    -[UIViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "screen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    _UIStickerItemProviderWithMetadata(0, v19, 0, v13, v10, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIStickerPickerViewController _insertStickerFromItemProvider:](self, "_insertStickerFromItemProvider:", v18);
  }

}

- (void)stageSticker:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  +[UITextInputPayloadController sharedInstance](UITextInputPayloadController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsStickerTapbackPayload");

  if (v5)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSticker:", v20);

    -[_UIStickerPickerViewController dismissCardAnimated:](self, "dismissCardAnimated:", 1);
  }
  else
  {
    -[_UIStickerPickerViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = -[_UIStickerPickerViewController isLaunchedFromKeyboard](self, "isLaunchedFromKeyboard");
      objc_msgSend(v20, "externalURI");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "representations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bakedInRep");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "screen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scale");
      v17 = v16;
      objc_msgSend(v20, "metadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _UIStickerItemProviderWithMetadata(v10, v11, v12, v9, v18, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIStickerPickerViewController _insertStickerFromItemProvider:](self, "_insertStickerFromItemProvider:", v19);
    }
  }

}

- (void)remoteHandlesRecentsStickerDonationWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void (**v9)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v9 = v4;
    -[_UIStickerPickerViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[_UIStickerPickerViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "remoteHandlesRecentsStickerDonation");

    }
    else
    {
      v8 = 1;
    }
    v9[2](v9, v8);
    v4 = v9;
  }

}

- (id)_viewServiceProxy
{
  void *v2;
  void *v3;

  -[_UIStickerPickerViewController card](self, "card");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceViewControllerProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_UIStickerPickerViewControllerDelegate)delegate
{
  return (_UIStickerPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)sourceView
{
  return (UIView *)objc_getProperty(self, a2, 984, 1);
}

- (void)setSourceView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isLaunchedFromKeyboard
{
  return self->_isLaunchedFromKeyboard;
}

- (void)setIsLaunchedFromKeyboard:(BOOL)a3
{
  self->_isLaunchedFromKeyboard = a3;
}

- (_UIStickerPickerServiceRemoteViewController)card
{
  return self->_card;
}

- (void)setCard:(id)a3
{
  objc_storeStrong((id *)&self->_card, a3);
}

- (BOOL)keyWindowChangedDuringInsert
{
  return self->_keyWindowChangedDuringInsert;
}

- (void)setKeyWindowChangedDuringInsert:(BOOL)a3
{
  self->_keyWindowChangedDuringInsert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_card, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
