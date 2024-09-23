@implementation UIAccessibilityPresentingViewController

- (UIAccessibilityPresentingViewController)init
{
  UIAccessibilityPresentingViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityPresentingViewController;
  v2 = -[UIAccessibilityPresentingViewController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__voiceOverStatusChanged, *MEMORY[0x1E0CEB1A0], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB1A0], 0);
  -[UIAccessibilityPresentingViewController _cleanUpPresentationWindow](self, "_cleanUpPresentationWindow");

  v4.receiver = self;
  v4.super_class = (Class)UIAccessibilityPresentingViewController;
  -[UIAccessibilityPresentingViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[UIAccessibilityPresentingViewController setView:](self, "setView:", v4);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  UIWindow *v13;
  UIWindow *presentationWindow;
  void *v15;
  objc_super v16;

  v5 = a4;
  v8 = (objc_class *)MEMORY[0x1E0CEAC18];
  v9 = a5;
  v10 = a3;
  v11 = [v8 alloc];
  -[UIAccessibilityPresentingViewController _screen](self, "_screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v13 = (UIWindow *)objc_msgSend(v11, "initWithFrame:");
  presentationWindow = self->_presentationWindow;
  self->_presentationWindow = v13;

  -[UIWindow setWindowLevel:](self->_presentationWindow, "setWindowLevel:", *MEMORY[0x1E0CEB248]);
  -[UIAccessibilityPresentingViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow bounds](self->_presentationWindow, "bounds");
  objc_msgSend(v15, "setFrame:");
  -[UIWindow setRootViewController:](self->_presentationWindow, "setRootViewController:", self);
  -[UIWindow addSubview:](self->_presentationWindow, "addSubview:", v15);
  -[UIWindow makeKeyAndVisible](self->_presentationWindow, "makeKeyAndVisible");
  v16.receiver = self;
  v16.super_class = (Class)UIAccessibilityPresentingViewController;
  -[UIAccessibilityPresentingViewController presentViewController:animated:completion:](&v16, sel_presentViewController_animated_completion_, v10, v5, v9);

}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  objc_super v9;
  _QWORD aBlock[5];
  id v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__UIAccessibilityPresentingViewController_dismissViewControllerWithTransition_completion___block_invoke;
  aBlock[3] = &unk_1E3DFFC80;
  aBlock[4] = self;
  v11 = v6;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  v9.receiver = self;
  v9.super_class = (Class)UIAccessibilityPresentingViewController;
  -[UIAccessibilityPresentingViewController dismissViewControllerWithTransition:completion:](&v9, sel_dismissViewControllerWithTransition_completion_, v4, v8);

}

uint64_t __90__UIAccessibilityPresentingViewController_dismissViewControllerWithTransition_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpPresentationWindow");
}

- (void)_cleanUpPresentationWindow
{
  UIWindow *presentationWindow;

  -[UIWindow setHidden:](self->_presentationWindow, "setHidden:", 1);
  presentationWindow = self->_presentationWindow;
  self->_presentationWindow = 0;

}

- (void)_voiceOverStatusChanged
{
  void *v3;

  if (!UIAccessibilityIsVoiceOverRunning())
  {
    -[UIAccessibilityPresentingViewController presentedViewController](self, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      -[UIAccessibilityPresentingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationWindow, 0);
}

@end
