@implementation _UIViewMaskViewWrapper

- (UIView)maskView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_maskView);
}

- (void)setMaskView:(id)a3
{
  objc_storeWeak((id *)&self->_maskView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_maskView);
}

@end
