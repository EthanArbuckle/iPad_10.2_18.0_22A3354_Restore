@implementation TUIOBMissingAppleIDViewModel

- (TUIOBMissingAppleIDViewModel)initWithFlow:(unint64_t)a3
{
  TUIOBMissingAppleIDViewModel *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIOBMissingAppleIDViewModel;
  result = -[TUIMissingAppleIDModel initWithFlow:](&v4, sel_initWithFlow_, a3);
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
