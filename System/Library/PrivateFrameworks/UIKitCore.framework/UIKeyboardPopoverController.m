@implementation UIKeyboardPopoverController

- (UIKeyboardPopoverController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardPopoverController;
  return -[UIViewController initWithNibName:bundle:](&v3, sel_initWithNibName_bundle_, 0, 0);
}

- (BOOL)isPresented
{
  void *v3;
  _BOOL4 v4;

  -[UIViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = !-[UIViewController isBeingDismissed](self, "isBeingDismissed");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardPopoverController;
  -[UIViewController viewDidLoad](&v5, sel_viewDidLoad);
  +[UIColor clearColor](UIColor, "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[UIKeyboardPopoverController _setupContentView](self, "_setupContentView");
}

- (BOOL)handleHardwareKeyboardEvent:(id)a3
{
  return 0;
}

- (int64_t)overrideUserInterfaceStyle
{
  return 0;
}

- (BOOL)wantsDimmingView
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setContentView:(id)a3
{
  void *v4;

  objc_storeStrong((id *)&self->_contentView, a3);
  -[UIViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[UIKeyboardPopoverController _setupContentView](self, "_setupContentView");
}

- (void)_setupContentView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  if (self->_contentView)
  {
    -[UIViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addSubview:", self->_contentView);

    -[UIView setNeedsLayout](self->_contentView, "setNeedsLayout");
    v16 = (void *)MEMORY[0x1E0D156E0];
    -[UIView topAnchor](self->_contentView, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "safeAreaLayoutGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v21;
    -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "safeAreaLayoutGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v15;
    -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeAreaLayoutGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v7;
    -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeAreaLayoutGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v13);

  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
