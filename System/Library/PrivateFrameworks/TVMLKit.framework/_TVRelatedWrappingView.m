@implementation _TVRelatedWrappingView

- (UIView)relatedView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_relatedView);
}

- (void)setRelatedView:(id)a3
{
  objc_storeWeak((id *)&self->_relatedView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_relatedView);
}

@end
