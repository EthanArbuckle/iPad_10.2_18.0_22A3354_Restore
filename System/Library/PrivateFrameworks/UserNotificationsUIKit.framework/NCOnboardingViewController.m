@implementation NCOnboardingViewController

- (NCOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 contentLayout:(int64_t)a5
{
  NCOnboardingViewController *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCOnboardingViewController;
  result = -[NCOnboardingViewController initWithTitle:detailText:icon:contentLayout:](&v6, sel_initWithTitle_detailText_icon_contentLayout_, a3, a4, 0, a5);
  if (result)
    result->_nextButtonEnabled = 1;
  return result;
}

- (void)viewDidLoad
{
  OBTrayButton *v3;
  OBTrayButton *nextButton;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCOnboardingViewController;
  -[OBBaseWelcomeController viewDidLoad](&v6, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v3 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
  nextButton = self->_nextButton;
  self->_nextButton = v3;

  -[OBTrayButton setEnabled:](self->_nextButton, "setEnabled:", self->_nextButtonEnabled);
  -[OBTrayButton setTitle:forState:](self->_nextButton, "setTitle:forState:", self->_nextButtonText, 0);
  -[OBTrayButton addTarget:action:forControlEvents:](self->_nextButton, "addTarget:action:forControlEvents:", self, sel__nextButtonPressed_, 64);
  -[NCOnboardingViewController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addButton:", self->_nextButton);

}

- (void)setNextButtonText:(id)a3
{
  NSString **p_nextButtonText;
  id v6;

  p_nextButtonText = &self->_nextButtonText;
  v6 = a3;
  if (!-[NSString isEqualToString:](*p_nextButtonText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_nextButtonText, a3);
    -[OBTrayButton setTitle:forState:](self->_nextButton, "setTitle:forState:", *p_nextButtonText, 0);
  }

}

- (void)setNextButtonEnabled:(BOOL)a3
{
  if (self->_nextButtonEnabled != a3)
  {
    self->_nextButtonEnabled = a3;
    -[OBTrayButton setEnabled:](self->_nextButton, "setEnabled:");
  }
}

- (void)_nextButtonPressed:(id)a3
{
  id v4;

  -[NCOnboardingViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "onboardingViewControllerNextButtonTapped:", self);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NCOnboardingViewControllerDelegate)delegate
{
  return (NCOnboardingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)nextButtonText
{
  return self->_nextButtonText;
}

- (BOOL)nextButtonEnabled
{
  return self->_nextButtonEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButtonText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nextButton, 0);
}

@end
