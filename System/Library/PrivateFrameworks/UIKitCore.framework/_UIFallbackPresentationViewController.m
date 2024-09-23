@implementation _UIFallbackPresentationViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor clearColor](UIColor, "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIFallbackPresentationViewController;
  -[UIViewController viewDidLoad](&v5, sel_viewDidLoad);
}

- (void)_presentViewController:(id)a3 sendingView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  _UIFallbackPresentationWindow *v14;
  _UIFallbackPresentationWindow *presentationWindow;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(_QWORD *);
  void *v29;
  _UIFallbackPresentationViewController *v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[5];
  _UIFallbackPresentationViewController *v34;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  VisibleViewController(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = UIKeyboardAutomaticIsOnScreen();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "setEnableRotation:", 1);
  objc_msgSend(v9, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "windowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[UIApplicationRotationFollowingWindow initWithWindowScene:]([_UIFallbackPresentationWindow alloc], "initWithWindowScene:", v13);
  presentationWindow = self->_presentationWindow;
  self->_presentationWindow = v14;

  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "windowLevel");
  v18 = v17 + 1.0;

  v19 = 100.0;
  if (v18 >= 100.0)
    v19 = v18;
  -[UIWindow setWindowLevel:](self->_presentationWindow, "setWindowLevel:", v19);
  -[UIViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self->_presentationWindow, "bounds");
  objc_msgSend(v20, "setFrame:");
  +[UIColor clearColor](UIColor, "clearColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v21);

  -[UIWindow setRootViewController:](self->_presentationWindow, "setRootViewController:", self);
  -[UIView addSubview:](self->_presentationWindow, "addSubview:", v20);
  -[UIWindow makeKeyAndVisible](self->_presentationWindow, "makeKeyAndVisible");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "dismissCompletionHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  -[_UIFallbackPresentationViewController setHasDismissCompletionHandler:](self, "setHasDismissCompletionHandler:", objc_opt_respondsToSelector() & 1);
  if (-[_UIFallbackPresentationViewController hasDismissCompletionHandler](self, "hasDismissCompletionHandler"))
  {
    v25 = v8;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__55;
    v33[4] = __Block_byref_object_dispose__55;
    v34 = self;
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __85___UIFallbackPresentationViewController__presentViewController_sendingView_animated___block_invoke;
    v29 = &unk_1E16C13C0;
    v30 = v34;
    v32 = v33;
    v31 = v22;
    objc_msgSend(v10, "setDismissCompletionHandler:", &v26);

    _Block_object_dispose(v33, 8);
  }
  if (v11)
  {
    -[_UIFallbackPresentationViewController _preserveInputViewsAnimated:](self, "_preserveInputViewsAnimated:", v5);
    -[UIWindow windowScene](self->_presentationWindow, "windowScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "keyboardSceneDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "forceOrderOutAutomaticExceptAccessoryView");

  }
  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, v5, 0, v25, v26, v27, v28, v29, v30);

}

- (void)_dismissViewControllerWithTransition:(int)a3 from:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  id v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  if (!-[_UIFallbackPresentationViewController hasDismissCompletionHandler](self, "hasDismissCompletionHandler"))
    -[_UIFallbackPresentationViewController _restoreInputViewsAnimated:](self, "_restoreInputViewsAnimated:", 1);
  v13[1] = 3221225472;
  v13[2] = __94___UIFallbackPresentationViewController__dismissViewControllerWithTransition_from_completion___block_invoke;
  v13[3] = &unk_1E16B1D18;
  v14 = v8;
  v15 = v9;
  v12.receiver = self;
  v12.super_class = (Class)_UIFallbackPresentationViewController;
  v13[0] = MEMORY[0x1E0C809B0];
  v10 = v9;
  v11 = v8;
  -[UIViewController _dismissViewControllerWithTransition:from:completion:](&v12, sel__dismissViewControllerWithTransition_from_completion_, v6, v11, v13);

}

- (void)_preserveInputViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[_UIFallbackPresentationViewController setHasPreservedKeyboardInputViews:](self, "setHasPreservedKeyboardInputViews:", 1);
  -[UIWindow windowScene](self->_presentationWindow, "windowScene");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_preserveInputViewsWithId:animated:", v6, v3);

}

- (void)_restoreInputViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  if (-[_UIFallbackPresentationViewController hasPreservedKeyboardInputViews](self, "hasPreservedKeyboardInputViews"))
  {
    -[UIWindow windowScene](self->_presentationWindow, "windowScene");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyboardSceneDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_restoreInputViewsWithId:animated:", v6, v3);

  }
}

- (void)_preparePresentationControllerForPresenting:(id)a3
{
  id v4;
  uint64_t (**presentationPreparationBlock)(void);
  int v6;
  id v7;
  id v8;

  v4 = a3;
  presentationPreparationBlock = (uint64_t (**)(void))self->_presentationPreparationBlock;
  if (presentationPreparationBlock)
  {
    v8 = v4;
    v6 = presentationPreparationBlock[2]();
    v4 = v8;
    if (v6)
    {
      v7 = self->_presentationPreparationBlock;
      self->_presentationPreparationBlock = 0;

      v4 = v8;
    }
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIWindow)rotationDecider
{
  return self->_rotationDecider;
}

- (void)setRotationDecider:(id)a3
{
  objc_storeStrong((id *)&self->_rotationDecider, a3);
}

- (id)presentationPreparationBlock
{
  return self->_presentationPreparationBlock;
}

- (void)setPresentationPreparationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (BOOL)hasPreservedKeyboardInputViews
{
  return self->_hasPreservedKeyboardInputViews;
}

- (void)setHasPreservedKeyboardInputViews:(BOOL)a3
{
  self->_hasPreservedKeyboardInputViews = a3;
}

- (BOOL)hasDismissCompletionHandler
{
  return self->_hasDismissCompletionHandler;
}

- (void)setHasDismissCompletionHandler:(BOOL)a3
{
  self->_hasDismissCompletionHandler = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationPreparationBlock, 0);
  objc_storeStrong((id *)&self->_rotationDecider, 0);
  objc_storeStrong((id *)&self->_presentationWindow, 0);
}

@end
