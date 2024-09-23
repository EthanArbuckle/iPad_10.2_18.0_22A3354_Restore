@implementation UIAccessibilityElementWeakDelegateContainer

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
}

@end
