@implementation TUIOBWelcomeScreenViewModel

- (TUIOBWelcomeScreenViewModel)init
{
  TUIOBWelcomeScreenViewModel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIOBWelcomeScreenViewModel;
  result = -[TUIWelcomeSplashScreenModel init](&v3, sel_init);
  if (result)
    result->_contentViewLayout = 2;
  return result;
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
