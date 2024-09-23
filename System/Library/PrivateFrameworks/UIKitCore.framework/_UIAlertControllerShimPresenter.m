@implementation _UIAlertControllerShimPresenter

- (void)_presentAlertControllerAnimated:(BOOL)a3 hostingScene:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  _UIAlertControllerShimPresenterWindow *window;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v8 = a5;
  -[_UIAlertControllerShimPresenter _createWindowIfNecessaryWithScene:](self, "_createWindowIfNecessaryWithScene:", a4);
  -[UIWindow makeKeyWindow](self->_window, "makeKeyWindow");
  +[_UIAlertControllerShimPresenter _cancelPendingTouchesIfAppropriateForWindow:](_UIAlertControllerShimPresenter, "_cancelPendingTouchesIfAppropriateForWindow:", self->_window);
  +[_UIAlertControllerShimPresenter _addPresenter:](_UIAlertControllerShimPresenter, "_addPresenter:", self);
  -[_UIAlertControllerShimPresenter alertController](self, "alertController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setDismissedFromShim:", 0);

  window = self->_window;
  -[_UIAlertControllerShimPresenter alertController](self, "alertController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91___UIAlertControllerShimPresenter__presentAlertControllerAnimated_hostingScene_completion___block_invoke;
  v13[3] = &unk_1E16B1BA0;
  v14 = v8;
  v12 = v8;
  -[_UIAlertControllerShimPresenterWindow presentAlertController:animated:completionBlock:](window, "presentAlertController:animated:completionBlock:", v11, v6, v13);

}

- (void)_presentAlertControllerAnimated:(BOOL)a3 completion:(id)a4
{
  -[_UIAlertControllerShimPresenter _presentAlertControllerAnimated:hostingScene:completion:](self, "_presentAlertControllerAnimated:hostingScene:completion:", a3, 0, a4);
}

- (void)_presentAlertControllerFromBarButtonItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a4;
  v8 = a5;
  objc_msgSend(a3, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  -[_UIAlertControllerShimPresenter _presentAlertControllerFromRect:inView:direction:animated:completion:](self, "_presentAlertControllerFromRect:inView:direction:animated:completion:", v9, 15, v5, v8);

}

- (void)_presentAlertControllerFromRect:(CGRect)a3 inView:(id)a4 direction:(unint64_t)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  UIViewController *v27;
  UIViewController *inPopoverViewController;
  void *v29;
  UIViewController *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void (**v34)(_QWORD);
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  void (**v40)(_QWORD);
  _QWORD aBlock[5];
  id v42;
  id v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  unint64_t v48;
  BOOL v49;

  v8 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a4;
  v16 = a7;
  objc_msgSend(v15, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIAlertControllerShimPresenter _cancelPendingTouchesIfAppropriateForWindow:](_UIAlertControllerShimPresenter, "_cancelPendingTouchesIfAppropriateForWindow:", v17);

  -[_UIAlertControllerShimPresenter alertController](self, "alertController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_setDismissedFromShim:", 0);

  +[_UIPopoverView popoverViewContainingView:](_UIPopoverView, "popoverViewContainingView:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "popoverController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
  {
    objc_msgSend(v20, "_managingSplitViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 == 0;

  }
  else
  {
    v23 = 0;
  }
  if (_UIAppUseModernRotationAndPresentationBehaviors())
  {
    objc_msgSend(v15, "_viewControllerForAncestor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "_isInContextOfPresentationControllerOfClass:effective:", objc_opt_class(), 0))
    {
      -[_UIAlertControllerShimPresenter alertController](self, "alertController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "presentViewController:animated:completion:", v25, v8, v16);

      goto LABEL_17;
    }

  }
  if (v23)
  {
    objc_msgSend(v19, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc_init(UIViewController);
    inPopoverViewController = self->_inPopoverViewController;
    self->_inPopoverViewController = v27;

    -[UIViewController view](self->_inPopoverViewController, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bounds");
    objc_msgSend(v29, "setFrame:");
    objc_msgSend(v26, "addSubview:", v29);
    v30 = self->_inPopoverViewController;
    -[_UIAlertControllerShimPresenter alertController](self, "alertController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController presentViewController:animated:completion:](v30, "presentViewController:animated:completion:", v31, v8, 0);

  }
  else if (+[_UIAlertControllerShimPresenter _shouldPresentActionSheetsFullscreen](_UIAlertControllerShimPresenter, "_shouldPresentActionSheetsFullscreen"))
  {
    -[_UIAlertControllerShimPresenter _presentAlertControllerAnimated:completion:](self, "_presentAlertControllerAnimated:completion:", v8, v16);
  }
  else
  {
    v32 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __104___UIAlertControllerShimPresenter__presentAlertControllerFromRect_inView_direction_animated_completion___block_invoke;
    aBlock[3] = &unk_1E16B1CA0;
    aBlock[4] = self;
    v44 = x;
    v45 = y;
    v46 = width;
    v47 = height;
    v33 = v15;
    v42 = v33;
    v48 = a5;
    v49 = v8;
    v43 = v16;
    v34 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (_UIAppUseModernRotationAndPresentationBehaviors()
      && (objc_msgSend(v33, "_viewControllerForAncestor"),
          v35 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v35, "transitionCoordinator"),
          v36 = (void *)objc_claimAutoreleasedReturnValue(),
          v36,
          v35,
          v36))
    {
      objc_msgSend(v33, "_viewControllerForAncestor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "transitionCoordinator");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v32;
      v39[1] = 3221225472;
      v39[2] = __104___UIAlertControllerShimPresenter__presentAlertControllerFromRect_inView_direction_animated_completion___block_invoke_2;
      v39[3] = &unk_1E16B1CC8;
      v40 = v34;
      objc_msgSend(v38, "animateAlongsideTransition:completion:", 0, v39);

    }
    else
    {
      v34[2](v34);
    }

  }
LABEL_17:

}

- (void)_dismissAlertControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  UIPopoverController *popoverController;
  void *v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD);
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  _QWORD v21[5];
  id v22;
  id v23;
  BOOL v24;
  _QWORD aBlock[5];
  id v26;

  v4 = a3;
  v6 = a4;
  -[_UIAlertControllerShimPresenter alertController](self, "alertController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setDismissedFromShim:", 1);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78___UIAlertControllerShimPresenter__dismissAlertControllerAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E16B1D18;
  aBlock[4] = self;
  v9 = v6;
  v26 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  popoverController = self->_popoverController;
  if (popoverController)
  {
    -[UIPopoverController dismissPopoverAnimated:](popoverController, "dismissPopoverAnimated:", v4);
    v10[2](v10);
  }
  else
  {
    -[_UIAlertControllerShimPresenter alertController](self, "alertController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentingViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __78___UIAlertControllerShimPresenter__dismissAlertControllerAnimated_completion___block_invoke_2;
    v21[3] = &unk_1E16B1CF0;
    v21[4] = self;
    v14 = v13;
    v22 = v14;
    v24 = v4;
    v15 = v10;
    v23 = v15;
    v16 = (void (**)(_QWORD))_Block_copy(v21);
    if (v14)
    {
      objc_msgSend(v14, "transitionCoordinator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v14, "transitionCoordinator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v8;
        v19[1] = 3221225472;
        v19[2] = __78___UIAlertControllerShimPresenter__dismissAlertControllerAnimated_completion___block_invoke_3;
        v19[3] = &unk_1E16B1CC8;
        v20 = v16;
        objc_msgSend(v18, "animateAlongsideTransition:completion:", 0, v19);

      }
      else
      {
        v16[2](v16);
      }
    }
    else
    {
      v15[2](v15);
    }

  }
}

- (id)_popoverController
{
  void *v3;
  uint64_t v4;
  UIPopoverController *v5;
  void *v6;
  UIPopoverController *v7;
  UIPopoverController *popoverController;
  UIPopoverController *v9;
  id WeakRetained;
  void *v11;

  if (!self->_popoverController)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v5 = [UIPopoverController alloc];
      -[_UIAlertControllerShimPresenter alertController](self, "alertController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[UIPopoverController initWithContentViewController:](v5, "initWithContentViewController:", v6);
      popoverController = self->_popoverController;
      self->_popoverController = v7;

      v9 = self->_popoverController;
      WeakRetained = objc_loadWeakRetained((id *)&self->_popoverDelegate);
      -[UIPopoverController setDelegate:](v9, "setDelegate:", WeakRetained);

      if (!_UIAppUseModernRotationAndPresentationBehaviors())
      {
        -[_UIAlertControllerShimPresenter alertController](self, "alertController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_setCompatibilityPopoverController:", self->_popoverController);

      }
    }
  }
  return self->_popoverController;
}

- (void)setPopoverDelegate:(id)a3
{
  UIPopoverController *popoverController;
  id v5;

  v5 = a3;
  objc_storeWeak((id *)&self->_popoverDelegate, v5);
  popoverController = self->_popoverController;
  if (popoverController)
    -[UIPopoverController setDelegate:](popoverController, "setDelegate:", v5);

}

- (UIPopoverControllerDelegate)popoverDelegate
{
  return (UIPopoverControllerDelegate *)objc_loadWeakRetained((id *)&self->_popoverDelegate);
}

- (void)_tearDownInPopoverViewController
{
  void *v3;
  UIViewController *inPopoverViewController;

  -[UIViewController view](self->_inPopoverViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  inPopoverViewController = self->_inPopoverViewController;
  self->_inPopoverViewController = 0;

}

+ (BOOL)_shouldPresentActionSheetsFullscreen
{
  void *v2;
  uint64_t v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) != 1;
}

+ (void)_cancelPendingTouchesIfAppropriateForWindow:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend((id)UIApp, "_touchesEventForWindow:", a3);
  objc_msgSend((id)UIApp, "_cancelUnfinishedTouchesForEvent:", v3);
}

- (void)_createWindowIfNecessaryWithScene:(id)a3
{
  id v4;
  _UIAlertControllerShimPresenterWindow *v5;
  _UIAlertControllerShimPresenterWindow *window;
  id v7;

  v4 = a3;
  if (!self->_window)
  {
    v7 = v4;
    if (v4)
      v5 = -[_UIAlertControllerShimPresenterWindow initWithWindowScene:]([_UIAlertControllerShimPresenterWindow alloc], "initWithWindowScene:", v4);
    else
      v5 = objc_alloc_init(_UIAlertControllerShimPresenterWindow);
    window = self->_window;
    self->_window = v5;

    v4 = v7;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UIAlertControllerShimPresenter _tearDownInPopoverViewController](self, "_tearDownInPopoverViewController");
  -[_UIAlertControllerShimPresenter alertController](self, "alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setCompatibilityPopoverController:", 0);

  +[_UIAlertControllerShimPresenter _removePresenter:](_UIAlertControllerShimPresenter, "_removePresenter:", self);
  v4.receiver = self;
  v4.super_class = (Class)_UIAlertControllerShimPresenter;
  -[_UIAlertControllerShimPresenter dealloc](&v4, sel_dealloc);
}

+ (id)_currentFullScreenAlertPresenters
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)__currentFullScreenAlertPresenters;
  if (!__currentFullScreenAlertPresenters)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = (void *)__currentFullScreenAlertPresenters;
    __currentFullScreenAlertPresenters = (uint64_t)v3;

    v2 = (void *)__currentFullScreenAlertPresenters;
  }
  return v2;
}

+ (void)_addPresenter:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_UIAlertControllerShimPresenter _currentFullScreenAlertPresenters](_UIAlertControllerShimPresenter, "_currentFullScreenAlertPresenters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setHidden:", 1);

        objc_msgSend(v9, "alertController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTextFieldsCanBecomeFirstResponder:", 0);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  objc_msgSend(v4, "removeObject:", v3);
  objc_msgSend(v4, "addObject:", v3);
  objc_msgSend(v3, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", 0);

}

+ (void)_removePresenter:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  +[_UIAlertControllerShimPresenter _currentFullScreenAlertPresenters](_UIAlertControllerShimPresenter, "_currentFullScreenAlertPresenters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v9))
    objc_msgSend(v4, "removeObject:", v9);
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  objc_msgSend(v4, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alertController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextFieldsCanBecomeFirstResponder:", 1);

}

- (_UIAlertControllerShimPresenterWindow)window
{
  return self->_window;
}

- (UIAlertController)alertController
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_alertController);
}

- (void)setAlertController:(id)a3
{
  objc_storeWeak((id *)&self->_alertController, a3);
}

- (UIAlertView)legacyAlert
{
  return self->_legacyAlert;
}

- (void)setLegacyAlert:(id)a3
{
  self->_legacyAlert = (UIAlertView *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertController);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_inPopoverViewController, 0);
  objc_destroyWeak((id *)&self->_popoverDelegate);
  objc_storeStrong((id *)&self->_popoverController, 0);
}

@end
