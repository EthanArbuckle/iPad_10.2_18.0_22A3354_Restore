@implementation UIKBResizingKeyplanePanGestureRecognizer

- (BOOL)_willScrollY
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;
  objc_super v8;

  -[UIKBResizingKeyplanePanGestureRecognizer resizingDelegate](self, "resizingDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanGestureRecognizer translationInView:](self, "translationInView:", v4);
  if (objc_msgSend(v3, "shouldStartResizeForTranslationY:", v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKBResizingKeyplanePanGestureRecognizer;
    v6 = -[UIPanGestureRecognizer _willScrollY](&v8, sel__willScrollY);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIKBResizingKeyplanePanGestureRecognizerDelegate)resizingDelegate
{
  return (UIKBResizingKeyplanePanGestureRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_resizingDelegate);
}

- (void)setResizingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resizingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resizingDelegate);
}

@end
