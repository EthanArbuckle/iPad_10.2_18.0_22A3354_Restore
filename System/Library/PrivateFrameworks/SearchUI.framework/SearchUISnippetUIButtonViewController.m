@implementation SearchUISnippetUIButtonViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SearchUIButtonItemViewController)buttonViewController
{
  return (SearchUIButtonItemViewController *)objc_getProperty(self, a2, 968, 1);
}

- (void)setButtonViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 968);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonViewController, 0);
}

@end
