@implementation _UIDatePickerContainerViewController

- (id)keyCommands
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputEscape"), 0, sel__didReceiveEscapeKey_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_UIDatePickerOverlayPresentation)presentation
{
  void *v2;
  void *v3;

  -[UIViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIDatePickerOverlayPresentation *)v3;
}

- (_UIDatePickerContainerViewController)initWithPresentation:(id)a3
{
  id v4;
  _UIDatePickerContainerViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIDatePickerContainerViewController;
  v5 = -[UIViewController init](&v10, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setPresentation:", v4);
    objc_msgSend(v6, "passthroughInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v5);

    -[UIViewController setView:](v5, "setView:", v6);
    -[UIViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel_keyboardFrameWillChange_, CFSTR("UIKeyboardWillChangeFrameNotification"), 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIKeyboardWillChangeFrameNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIDatePickerContainerViewController;
  -[UIViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)_defersToPresentingViewControllerForSupportedInterfaceOrientations
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_didReceiveEscapeKey:(id)a3
{
  id v3;

  -[_UIDatePickerContainerViewController presentation](self, "presentation", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissPresentationAnimated:", 1);

}

- (void)keyboardFrameWillChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  void *v19;
  _QWORD v20[8];
  _QWORD v21[4];
  _QWORD v22[3];
  uint64_t v23;
  _QWORD v24[4];
  __int128 v25;
  __int128 v26;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UIKeyboardAnimationDurationUserInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x4010000000;
  v24[3] = &unk_18685B0AF;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("UIKeyboardFrameEndUserInfoKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "CGRectValue");
  *(_QWORD *)&v25 = v11;
  *((_QWORD *)&v25 + 1) = v12;
  *(_QWORD *)&v26 = v13;
  *((_QWORD *)&v26 + 1) = v14;

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  objc_msgSend(v4, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("UIKeyboardAnimationCurveUserInfoKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "integerValue");

  v23 = v17;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = fmax(v8, 0.25);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __64___UIDatePickerContainerViewController_keyboardFrameWillChange___block_invoke;
  v20[3] = &unk_1E16E94E8;
  v20[4] = self;
  v20[5] = v24;
  v20[6] = v21;
  v20[7] = v22;
  v18 = (void (**)(_QWORD))_Block_copy(v20);
  -[_UIDatePickerContainerViewController presentation](self, "presentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v19, "defersAutomaticKeyboardAvoidanceAdjustments");

  if ((_DWORD)v16)
    -[_UIDatePickerContainerViewController setPendingKeyboardAdjustment:](self, "setPendingKeyboardAdjustment:", v18);
  else
    v18[2](v18);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

}

- (void)didChangeKeyboardAvoidanceAdjustmentDeferral
{
  void *v3;
  void (**v4)(void);

  -[_UIDatePickerContainerViewController pendingKeyboardAdjustment](self, "pendingKeyboardAdjustment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIDatePickerContainerViewController pendingKeyboardAdjustment](self, "pendingKeyboardAdjustment");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[_UIDatePickerContainerViewController setPendingKeyboardAdjustment:](self, "setPendingKeyboardAdjustment:", 0);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerContainerViewController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[_UIDatePickerContainerViewController presentation](self, "presentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissPresentationAnimated:", 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _UIDatePickerContainerViewController *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIDatePickerContainerViewController;
  -[UIViewController viewDidDisappear:](&v8, sel_viewDidDisappear_);
  if (-[UIViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    -[_UIDatePickerContainerViewController presentation](self, "presentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerViewController");
    v6 = (_UIDatePickerContainerViewController *)objc_claimAutoreleasedReturnValue();

    if (v6 == self)
    {
      -[_UIDatePickerContainerViewController presentation](self, "presentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dismissPresentationAnimated:", v3);

    }
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIDatePickerContainerViewController;
  v6 = a3;
  -[UIViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v14, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, a4);
  v7 = objc_msgSend(v6, "horizontalSizeClass", v14.receiver, v14.super_class);
  -[UIViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "horizontalSizeClass");

  v10 = objc_msgSend(v6, "verticalSizeClass");
  -[UIViewController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "verticalSizeClass");

  if (!-[UIViewController isBeingPresented](self, "isBeingPresented") && (v7 != v9 || v10 != v12))
  {
    -[_UIDatePickerContainerViewController presentation](self, "presentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dismissPresentationAnimated:", 0);

  }
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  void *v3;

  -[_UIDatePickerContainerViewController presentation](self, "presentation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissPresentationAnimated:", 1);

  return 1;
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  y = a4.y;
  x = a4.x;
  v8 = a5;
  -[UIViewController presentedViewController](self, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    -[UIViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController _window](self, "_window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertPoint:fromView:", v11, x, y);
    v14 = v13;
    v16 = v15;

    objc_msgSend(v11, "setLastHitTestWasPassedThrough:", 0);
    -[UIViewController _window](self, "_window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "hitTest:withEvent:", v8, v14, v16);

    v10 = objc_msgSend(v11, "lastHitTestWasPassedThrough");
  }

  return v10;
}

- (id)pendingKeyboardAdjustment
{
  return self->_pendingKeyboardAdjustment;
}

- (void)setPendingKeyboardAdjustment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (double)keyboardAdjustmentOffset
{
  return self->_keyboardAdjustmentOffset;
}

- (void)setKeyboardAdjustmentOffset:(double)a3
{
  self->_keyboardAdjustmentOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingKeyboardAdjustment, 0);
}

@end
