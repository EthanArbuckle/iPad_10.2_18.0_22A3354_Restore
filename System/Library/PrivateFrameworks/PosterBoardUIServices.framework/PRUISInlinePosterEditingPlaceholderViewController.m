@implementation PRUISInlinePosterEditingPlaceholderViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRUISInlinePosterEditingPlaceholderViewController;
  -[PRUISInlinePosterEditingPlaceholderViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__dismissRecognizerTapped_);
  -[PRUISInlinePosterEditingPlaceholderViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

}

- (void)_dismissRecognizerTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "placeholderViewController:requestsDismissalWithAnimation:", self, 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRUISInlinePosterEditingPlaceholderViewController;
  -[PRUISInlinePosterEditingPlaceholderViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[PRUISInlinePosterEditingPlaceholderViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRUISInlinePosterEditingPlaceholderViewController _updateBackgroundColorForWindow:](self, "_updateBackgroundColorForWindow:", v5);

}

- (void)viewWillMoveToWindow:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRUISInlinePosterEditingPlaceholderViewController;
  v4 = a3;
  -[PRUISInlinePosterEditingPlaceholderViewController viewWillMoveToWindow:](&v5, sel_viewWillMoveToWindow_, v4);
  -[PRUISInlinePosterEditingPlaceholderViewController _updateBackgroundColorForWindow:](self, "_updateBackgroundColorForWindow:", v4, v5.receiver, v5.super_class);

}

- (void)_updateBackgroundColorForWindow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isExternal");

  -[PRUISInlinePosterEditingPlaceholderViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11 = v8;
    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorWithAlphaComponent:", 0.5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v10);

    v8 = v11;
  }

}

- (PRUISInlinePosterEditingPlaceholderViewControllerDelegate)delegate
{
  return (PRUISInlinePosterEditingPlaceholderViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
