@implementation SBPosterEditingTransientOverlayViewController

- (SBPosterEditingTransientOverlayViewController)initWithEditingRequest:(id)a3
{
  id v5;
  SBPosterEditingTransientOverlayViewController *v6;
  SBPosterEditingTransientOverlayViewController *v7;
  id v8;
  void *v9;
  uint64_t v10;
  PRUISModalRemoteViewController *remoteViewController;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBPosterEditingTransientOverlayViewController;
  v6 = -[SBPosterEditingTransientOverlayViewController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_editingRequest, a3);
    v8 = objc_alloc(MEMORY[0x1E0D7F840]);
    objc_msgSend(v5, "entryPoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithEntryPoint:", v9);
    remoteViewController = v7->_remoteViewController;
    v7->_remoteViewController = (PRUISModalRemoteViewController *)v10;

    -[PRUISModalRemoteViewController setDelegate:](v7->_remoteViewController, "setDelegate:", v7);
    v7->_synthesizeDelegateCallbacksFromAppearanceTransitions = 1;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBPosterEditingTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPosterEditingTransientOverlayViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_remoteViewController, v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPosterEditingTransientOverlayViewController;
  -[SBPosterEditingTransientOverlayViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (self->_synthesizeDelegateCallbacksFromAppearanceTransitions)
  {
    objc_msgSend(MEMORY[0x1E0D7F838], "cancel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPosterEditingTransientOverlayViewController _notifyDelegateOfWillDismissWithResponse:](self, "_notifyDelegateOfWillDismissWithResponse:", v4);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPosterEditingTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (self->_synthesizeDelegateCallbacksFromAppearanceTransitions)
  {
    objc_msgSend(MEMORY[0x1E0D7F838], "cancel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPosterEditingTransientOverlayViewController _notifyDelegateOfDidDismissWithResponse:](self, "_notifyDelegateOfDidDismissWithResponse:", v4);

  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)SBPosterEditingTransientOverlayViewController;
  v5 = a3;
  -[SBTransientOverlayViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v5, v4);
  objc_msgSend(v5, "setClipsToBounds:", 0, v6.receiver, v6.super_class);

}

- (BOOL)shouldUseSceneBasedKeyboardFocus
{
  return 1;
}

- (id)keyboardFocusTarget
{
  void *v3;
  SBKeyboardFocusTarget *v4;
  SBKeyboardFocusTarget *keyboardFocusTarget;

  if (!self->_keyboardFocusTarget && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PRUISModalRemoteViewController scene](self->_remoteViewController, "scene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      +[SBKeyboardFocusTarget targetForFBScene:](SBKeyboardFocusTarget, "targetForFBScene:", v3);
      v4 = (SBKeyboardFocusTarget *)objc_claimAutoreleasedReturnValue();
      keyboardFocusTarget = self->_keyboardFocusTarget;
      self->_keyboardFocusTarget = v4;

    }
  }
  return self->_keyboardFocusTarget;
}

- (void)sendRequestDismissalAction
{
  -[PRUISModalRemoteViewController sendRequestDismissalAction](self->_remoteViewController, "sendRequestDismissalAction");
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3)
    a3->var6 = 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return 1;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return 1;
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return 1;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return 1;
}

- (BOOL)handleHomeButtonPress
{
  -[SBPosterEditingTransientOverlayViewController sendRequestDismissalAction](self, "sendRequestDismissalAction");
  return 1;
}

- (void)modalRemoteViewController:(id)a3 willDismissWithResponse:(id)a4
{
  -[SBPosterEditingTransientOverlayViewController _notifyDelegateOfWillDismissWithResponse:](self, "_notifyDelegateOfWillDismissWithResponse:", a4);
}

- (void)modalRemoteViewController:(id)a3 didDismissWithResponse:(id)a4
{
  -[SBPosterEditingTransientOverlayViewController _notifyDelegateOfDidDismissWithResponse:](self, "_notifyDelegateOfDidDismissWithResponse:", a4);
}

- (void)_notifyDelegateOfWillDismissWithResponse:(id)a3
{
  id v4;
  id v5;

  if ((*((_BYTE *)self + 1408) & 1) == 0)
  {
    *((_BYTE *)self + 1408) |= 1u;
    v4 = a3;
    -[SBPosterEditingTransientOverlayViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "posterEditingTransientOverlayViewController:willDismissWithResponse:", self, v4);

  }
}

- (void)_notifyDelegateOfDidDismissWithResponse:(id)a3
{
  id v4;
  id v5;

  if ((*((_BYTE *)self + 1408) & 2) == 0)
  {
    *((_BYTE *)self + 1408) |= 2u;
    v4 = a3;
    -[SBPosterEditingTransientOverlayViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "posterEditingTransientOverlayViewController:didDismissWithResponse:", self, v4);

  }
}

- (SBPosterEditingTransientOverlayViewControllerDelegate)delegate
{
  return (SBPosterEditingTransientOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PRUISExternallyHostedPosterEditingRequest)editingRequest
{
  return self->_editingRequest;
}

- (BOOL)synthesizeDelegateCallbacksFromAppearanceTransitions
{
  return self->_synthesizeDelegateCallbacksFromAppearanceTransitions;
}

- (void)setSynthesizeDelegateCallbacksFromAppearanceTransitions:(BOOL)a3
{
  self->_synthesizeDelegateCallbacksFromAppearanceTransitions = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyboardFocusTarget, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_editingRequest, 0);
}

@end
