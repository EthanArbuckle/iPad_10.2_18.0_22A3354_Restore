@implementation ACM2SVCodeVerificationViewController

- (ACM2SVCodeVerificationViewController)initWithDelegate:(id)a3
{
  ACM2SVCodeVerificationViewController *v4;
  ACM2SVCodeVerificationViewController *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ACM2SVCodeVerificationViewController;
  v4 = -[ACM2SVCodeVerificationViewController init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    -[ACM2SVCodeVerificationViewController setDelegate:](v4, "setDelegate:", a3);
    -[ACM2SVCodeVerificationViewController setPasscodeLength:](v5, "setPasscodeLength:", 4);
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = *MEMORY[0x24BDF7510];
    v8 = objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __57__ACM2SVCodeVerificationViewController_initWithDelegate___block_invoke;
    v10[3] = &unk_24FCE53E0;
    v10[4] = v5;
    -[ACM2SVCodeVerificationViewController setApplicationActivationObserver:](v5, "setApplicationActivationObserver:", objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v7, 0, v8, v10));
  }
  return v5;
}

uint64_t __57__ACM2SVCodeVerificationViewController_initWithDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (void)dealloc
{
  objc_super v3;

  -[ACM2SVCodeVerificationViewController setContentView:](self, "setContentView:", 0);
  -[ACM2SVCodeVerificationViewController setDigitPanel:](self, "setDigitPanel:", 0);
  -[ACM2SVCodeVerificationViewController setVerificationCodeTextField:](self, "setVerificationCodeTextField:", 0);
  -[ACM2SVCodeVerificationViewController setPromptLabel:](self, "setPromptLabel:", 0);
  -[ACM2SVCodeVerificationViewController setSendAnotherCodeButton:](self, "setSendAnotherCodeButton:", 0);
  -[ACM2SVCodeVerificationViewController setDigitViews:](self, "setDigitViews:", 0);
  -[ACM2SVCodeVerificationViewController setTextColor:](self, "setTextColor:", 0);
  -[ACM2SVCodeVerificationViewController setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[ACM2SVCodeVerificationViewController setCompletionBlock:](self, "setCompletionBlock:", 0);
  -[ACM2SVCodeVerificationViewController setDigitPanelWidthConstraint:](self, "setDigitPanelWidthConstraint:", 0);
  -[UINavigationController setDelegate:](-[ACM2SVCodeVerificationViewController navigationController](self, "navigationController"), "setDelegate:", 0);
  -[ACM2SVCodeVerificationViewController setNavigationController:](self, "setNavigationController:", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", -[ACM2SVCodeVerificationViewController applicationActivationObserver](self, "applicationActivationObserver"));
  -[ACM2SVCodeVerificationViewController setApplicationActivationObserver:](self, "setApplicationActivationObserver:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACM2SVCodeVerificationViewController;
  -[ACM2SVCodeVerificationViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)canResendTheCode
{
  return -[UIButton isHidden](-[ACM2SVCodeVerificationViewController sendAnotherCodeButton](self, "sendAnotherCodeButton"), "isHidden") ^ 1;
}

- (void)setCanResendTheCode:(BOOL)a3
{
  -[UIButton setHidden:](-[ACM2SVCodeVerificationViewController sendAnotherCodeButton](self, "sendAnotherCodeButton"), "setHidden:", !a3);
}

- (void)setPasscodeLength:(unint64_t)a3
{
  if (self->_passcodeLength != a3)
  {
    self->_passcodeLength = a3;
    -[ACM2SVCodeVerificationViewController buildDigitViews](self, "buildDigitViews");
  }
}

- (void)presentWithParentViewController:(id)a3 completion:(id)a4
{
  if (-[ACM2SVCodeVerificationViewController completionBlock](self, "completionBlock"))
  {
    if (a4)
      (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
  else
  {
    -[ACM2SVCodeVerificationViewController setCompletionBlock:](self, "setCompletionBlock:", a4);
    -[ACM2SVCodeVerificationViewController setNavigationController:](self, "setNavigationController:", objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", self));
    -[UINavigationController setDelegate:](-[ACM2SVCodeVerificationViewController navigationController](self, "navigationController"), "setDelegate:", self);
    -[UINavigationBar setTranslucent:](-[UINavigationController navigationBar](-[ACM2SVCodeVerificationViewController navigationController](self, "navigationController"), "navigationBar"), "setTranslucent:", 0);
    objc_msgSend(a3, "presentViewController:animated:completion:", -[ACM2SVCodeVerificationViewController navigationController](self, "navigationController"), 1, 0);
  }
}

- (void)hideAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v5;

  v5 = a3;
  -[ACM2SVCodeVerificationViewController setCompletionBlock:](self, "setCompletionBlock:", 0);
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController presentingViewController](self, "presentingViewController"), "dismissViewControllerAnimated:completion:", v5, a4);
}

- (void)loadView
{
  _BOOL4 v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  double *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ACM2SVCodeVerificationViewController;
  -[ACM2SVCodeVerificationViewController loadView](&v14, sel_loadView);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 0;
  -[ACM2SVCodeVerificationViewController setTitle:](self, "setTitle:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Verification Code")));
  -[ACM2SVCodeVerificationViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController navigationItem](self, "navigationItem"), "setLeftBarButtonItem:", (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelAction_));
  v4 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v4, "setBackgroundColor:", -[ACM2SVCodeVerificationViewController backgroundColor](self, "backgroundColor"));
  -[ACM2SVCodeVerificationViewController setContentView:](self, "setContentView:", v4);
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addSubview:", v4);
  v5 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v5, "setText:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Enter verification code")));
  objc_msgSend(v5, "setTextAlignment:", 1);
  v6 = (void *)MEMORY[0x24BDF6A70];
  v7 = 17.0;
  if (v3)
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize", 17.0);
  objc_msgSend(v5, "setFont:", objc_msgSend(v6, "boldSystemFontOfSize:", v7));
  objc_msgSend(v5, "setTextColor:", -[ACM2SVCodeVerificationViewController textColor](self, "textColor"));
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);
  -[ACM2SVCodeVerificationViewController setPromptLabel:](self, "setPromptLabel:", v5);
  objc_msgSend(v4, "addSubview:", v5);
  v8 = (double *)MEMORY[0x24BDD0D50];
  v9 = (void *)objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", floor(*MEMORY[0x24BDD0D50]) > 993.0);
  if (floor(*v8) <= 993.0)
  {
    objc_msgSend(v9, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.09, 0.52, 1.0, 1.0), 0);
    objc_msgSend(v9, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.5, 1.0), 1);
  }
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_sendAnotherCode_, 64);
  objc_msgSend(v9, "setTitle:forState:", +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", CFSTR("Send a new code")), 0);
  objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  objc_msgSend((id)objc_msgSend(v9, "titleLabel"), "setTextAlignment:", 1);
  v10 = (void *)MEMORY[0x24BDF6A70];
  v11 = 17.0;
  if (v3)
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize", 17.0);
  objc_msgSend((id)objc_msgSend(v9, "titleLabel"), "setFont:", objc_msgSend(v10, "systemFontOfSize:", v11));
  -[ACM2SVCodeVerificationViewController setSendAnotherCodeButton:](self, "setSendAnotherCodeButton:", v9);
  objc_msgSend(v4, "addSubview:", v9);
  v12 = objc_alloc_init(MEMORY[0x24BDF6EA8]);
  objc_msgSend(v12, "setHidden:", 1);
  objc_msgSend(v12, "setBorderStyle:", 0);
  objc_msgSend(v12, "setSecureTextEntry:", 1);
  objc_msgSend(v12, "setKeyboardType:", 4);
  objc_msgSend(v12, "setKeyboardAppearance:", -[ACM2SVCodeVerificationViewController keyboardAppearance](self, "keyboardAppearance"));
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_verificationCodeDidChange_, 0x20000);
  -[ACM2SVCodeVerificationViewController setVerificationCodeTextField:](self, "setVerificationCodeTextField:", v12);
  objc_msgSend(v4, "addSubview:", v12);
  v13 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  -[ACM2SVCodeVerificationViewController setDigitPanel:](self, "setDigitPanel:", v13);
  objc_msgSend(v4, "addSubview:", v13);
  -[ACM2SVCodeVerificationViewController buildDigitViews](self, "buildDigitViews");
  -[ACM2SVCodeVerificationViewController buildConstraints](self, "buildConstraints");
}

- (void)buildDigitViews
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;
  double MaxX;
  ACM2SVDigitCodeView *v7;
  double v8;
  ACM2SVDigitCodeView *v9;
  CGRect v10;

  if (-[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"))
  {
    v3 = -[NSArray count](-[ACM2SVCodeVerificationViewController digitViews](self, "digitViews"), "count");
    if (v3 != -[ACM2SVCodeVerificationViewController passcodeLength](self, "passcodeLength"))
    {
      -[NSArray makeObjectsPerformSelector:](-[ACM2SVCodeVerificationViewController digitViews](self, "digitViews"), "makeObjectsPerformSelector:", sel_removeFromSuperview);
      v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      if (-[ACM2SVCodeVerificationViewController passcodeLength](self, "passcodeLength"))
      {
        v5 = 0;
        MaxX = 0.0;
        do
        {
          v7 = [ACM2SVDigitCodeView alloc];
          if ((unint64_t)(-[ACM2SVCodeVerificationViewController interfaceOrientation](self, "interfaceOrientation")- 1) >= 2)v8 = 30.0;
          else
            v8 = 40.0;
          v9 = -[ACM2SVDigitCodeView initWithFrame:](v7, "initWithFrame:", MaxX, 0.0, 30.0, v8);
          -[ACM2SVDigitCodeView setBackgroundColor:](v9, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
          -[ACM2SVDigitCodeView setFillType:](v9, "setFillType:", 0);
          -[ACM2SVDigitCodeView setFillColor:](v9, "setFillColor:", -[ACM2SVCodeVerificationViewController textColor](self, "textColor"));
          -[UIView addSubview:](-[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), "addSubview:", v9);
          objc_msgSend(v4, "addObject:", v9);
          -[ACM2SVDigitCodeView frame](v9, "frame");
          MaxX = CGRectGetMaxX(v10);
          ++v5;
        }
        while (v5 < -[ACM2SVCodeVerificationViewController passcodeLength](self, "passcodeLength"));
      }
      if (-[ACM2SVCodeVerificationViewController digitPanelWidthConstraint](self, "digitPanelWidthConstraint"))
        -[NSLayoutConstraint setConstant:](-[ACM2SVCodeVerificationViewController digitPanelWidthConstraint](self, "digitPanelWidthConstraint"), "setConstant:", (double)(30 * -[ACM2SVCodeVerificationViewController passcodeLength](self, "passcodeLength")));
      -[ACM2SVCodeVerificationViewController setDigitViews:](self, "setDigitViews:", (id)objc_msgSend(v4, "copy"));
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACM2SVCodeVerificationViewController;
  -[ACM2SVCodeVerificationViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[ACM2SVCodeVerificationViewController reset](self, "reset");
}

- (float)navigationBarHeight
{
  uint64_t *v2;

  v2 = &kACMNavigationBarHeightPortrait;
  if (floor(*MEMORY[0x24BDD0D50]) <= 993.0)
    v2 = &kACMNavigationBarHeightLegacyOS;
  return *(double *)v2;
}

- (void)buildConstraints
{
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](-[ACM2SVCodeVerificationViewController contentView](self, "contentView"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](-[ACM2SVCodeVerificationViewController promptLabel](self, "promptLabel"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](-[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](-[ACM2SVCodeVerificationViewController sendAnotherCodeButton](self, "sendAnotherCodeButton"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](-[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ACM2SVCodeVerificationViewController buildHorizontalConstraints](self, "buildHorizontalConstraints");
  -[ACM2SVCodeVerificationViewController buildVerticalConstraints](self, "buildVerticalConstraints");
}

- (void)buildHorizontalConstraints
{
  double v3;

  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController contentView](self, "contentView"), 7, 0, -[ACM2SVCodeVerificationViewController view](self, "view"), 7, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController contentView](self, "contentView"), 1, 0, -[ACM2SVCodeVerificationViewController view](self, "view"), 1, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController promptLabel](self, "promptLabel"), 9, 0, -[ACM2SVCodeVerificationViewController contentView](self, "contentView"), 9, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController promptLabel](self, "promptLabel"), 7, 0, -[ACM2SVCodeVerificationViewController contentView](self, "contentView"), 7, 1.0, 0.0));
  v3 = (double)(30 * -[ACM2SVCodeVerificationViewController passcodeLength](self, "passcodeLength"));
  -[ACM2SVCodeVerificationViewController setDigitPanelWidthConstraint:](self, "setDigitPanelWidthConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), 7, 0, 0, 7, 0.0, v3));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", -[ACM2SVCodeVerificationViewController digitPanelWidthConstraint](self, "digitPanelWidthConstraint"));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), 9, 0, -[ACM2SVCodeVerificationViewController contentView](self, "contentView"), 9, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField"), 7, 0, -[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), 7, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField"), 9, 0, -[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), 9, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController sendAnotherCodeButton](self, "sendAnotherCodeButton"), 9, 0, -[ACM2SVCodeVerificationViewController contentView](self, "contentView"), 9, 1.0, 0.0));
}

- (void)buildVerticalConstraints
{
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController contentView](self, "contentView"), 3, 0, -[ACM2SVCodeVerificationViewController view](self, "view"), 3, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController contentView](self, "contentView"), 4, 0, -[ACM2SVCodeVerificationViewController view](self, "view"), 4, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController promptLabel](self, "promptLabel"), 3, 0, -[ACM2SVCodeVerificationViewController contentView](self, "contentView"), 3, 1.0, 40.0));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), 3, 0, -[ACM2SVCodeVerificationViewController promptLabel](self, "promptLabel"), 4, 1.0, 25.0));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), 8, 0, 0, 8, 0.0, 40.0));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField"), 8, 0, -[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), 8, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField"), 10, 0, -[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), 10, 1.0, 0.0));
  objc_msgSend((id)-[ACM2SVCodeVerificationViewController view](self, "view"), "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACM2SVCodeVerificationViewController sendAnotherCodeButton](self, "sendAnotherCodeButton"), 3, 0, -[ACM2SVCodeVerificationViewController digitPanel](self, "digitPanel"), 4, 1.0, 20.0));
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (void)reset
{
  -[UITextField setText:](-[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField"), "setText:", &stru_24FCE58F0);
  -[ACM2SVCodeVerificationViewController disableControls:](self, "disableControls:", 0);
  -[ACM2SVCodeVerificationViewController verificationCodeDidChange:](self, "verificationCodeDidChange:", -[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField"));
}

- (void)disableControls:(BOOL)a3
{
  _BOOL8 v5;

  v5 = !a3;
  -[UITextField setEnabled:](-[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField"), "setEnabled:", v5);
  -[UIButton setEnabled:](-[ACM2SVCodeVerificationViewController sendAnotherCodeButton](self, "sendAnotherCodeButton"), "setEnabled:", v5);
  objc_msgSend((id)objc_msgSend((id)-[ACM2SVCodeVerificationViewController navigationItem](self, "navigationItem"), "leftBarButtonItem"), "setEnabled:", v5);
  if (!a3)
    -[ACM2SVCodeVerificationViewController focus](self, "focus");
}

- (void)focus
{
  -[UITextField becomeFirstResponder](-[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField"), "becomeFirstResponder");
}

- (void)verificationCodeDidChange:(id)a3
{
  unint64_t v4;
  NSString *v5;
  uint64_t v6;
  NSArray *v7;
  _QWORD v8[5];

  v4 = -[NSString length](-[UITextField text](-[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField", a3), "text"), "length");
  if (v4 > -[ACM2SVCodeVerificationViewController passcodeLength](self, "passcodeLength"))
    -[UITextField setText:](-[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField"), "setText:", -[NSString substringToIndex:](-[UITextField text](-[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField"), "text"), "substringToIndex:", -[ACM2SVCodeVerificationViewController passcodeLength](self, "passcodeLength")));
  v5 = -[UITextField text](-[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField"), "text");
  v6 = -[NSString length](v5, "length");
  v7 = -[ACM2SVCodeVerificationViewController digitViews](self, "digitViews");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__ACM2SVCodeVerificationViewController_verificationCodeDidChange___block_invoke;
  v8[3] = &__block_descriptor_40_e36_v32__0__ACM2SVDigitCodeView_8Q16_B24l;
  v8[4] = v6;
  -[NSArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v8);
  if (v6 == -[ACM2SVCodeVerificationViewController passcodeLength](self, "passcodeLength"))
    -[ACM2SVCodeVerificationViewController verifyCode:](self, "verifyCode:", v5);
}

uint64_t __66__ACM2SVCodeVerificationViewController_verificationCodeDidChange___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v3;
  BOOL v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = v3 != 0;
  v5 = v3 - 1;
  v6 = v4;
  if (v5 >= a3)
    v7 = v6;
  else
    v7 = 0;
  return objc_msgSend(a2, "setFillType:", v7);
}

- (void)sendAnotherCode:(id)a3
{
  -[ACM2SVCodeVerificationViewController disableControls:](self, "disableControls:", 1);
  -[ACM2SVCodeVerificationViewControllerDelegate codeVerificationViewControllerNeedsResendCode:](-[ACM2SVCodeVerificationViewController delegate](self, "delegate"), "codeVerificationViewControllerNeedsResendCode:", self);
}

- (void)verifyCode:(id)a3
{
  void (**v5)(id, id);

  -[ACM2SVCodeVerificationViewController disableControls:](self, "disableControls:", 1);
  if (-[ACM2SVCodeVerificationViewController completionBlock](self, "completionBlock"))
  {
    v5 = -[ACM2SVCodeVerificationViewController completionBlock](self, "completionBlock");
    v5[2](v5, a3);
  }
}

- (void)cancelAction:(id)a3
{
  void (**v4)(id, _QWORD);

  if (-[ACM2SVCodeVerificationViewController completionBlock](self, "completionBlock", a3))
  {
    v4 = -[ACM2SVCodeVerificationViewController completionBlock](self, "completionBlock");
    v4[2](v4, 0);
    -[ACM2SVCodeVerificationViewController setCompletionBlock:](self, "setCompletionBlock:", 0);
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return -[ACM2SVCodeVerificationViewController verificationCodeTextField](self, "verificationCodeTextField", a3, a4.location, a4.length) != a3|| objc_msgSend(a5, "rangeOfCharacterFromSet:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet"), "invertedSet")) == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (ACM2SVCodeVerificationViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACM2SVCodeVerificationViewControllerDelegate *)a3;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 984);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 992);
}

- (int64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->_keyboardAppearance = a3;
}

- (int64_t)suggestedStatusBarStyle
{
  return self->_suggestedStatusBarStyle;
}

- (void)setSuggestedStatusBarStyle:(int64_t)a3
{
  self->_suggestedStatusBarStyle = a3;
}

- (unint64_t)passcodeLength
{
  return self->_passcodeLength;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1024);
}

- (UIView)digitPanel
{
  return self->_digitPanel;
}

- (void)setDigitPanel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1032);
}

- (UITextField)verificationCodeTextField
{
  return self->_verificationCodeTextField;
}

- (void)setVerificationCodeTextField:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1040);
}

- (UILabel)promptLabel
{
  return self->_promptLabel;
}

- (void)setPromptLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1048);
}

- (UIButton)sendAnotherCodeButton
{
  return self->_sendAnotherCodeButton;
}

- (void)setSendAnotherCodeButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1056);
}

- (NSArray)digitViews
{
  return self->_digitViews;
}

- (void)setDigitViews:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1064);
}

- (NSLayoutConstraint)digitPanelWidthConstraint
{
  return self->_digitPanelWidthConstraint;
}

- (void)setDigitPanelWidthConstraint:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1072);
}

- (id)applicationActivationObserver
{
  return self->_applicationActivationObserver;
}

- (void)setApplicationActivationObserver:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1080);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1088);
}

@end
