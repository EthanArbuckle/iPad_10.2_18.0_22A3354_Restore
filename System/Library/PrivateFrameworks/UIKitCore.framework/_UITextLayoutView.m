@implementation _UITextLayoutView

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void)layoutSubviews
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "_layoutText");

}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

@end
