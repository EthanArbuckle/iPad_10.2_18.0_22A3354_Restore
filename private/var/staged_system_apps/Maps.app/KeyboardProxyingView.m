@implementation KeyboardProxyingView

- (KeyboardProxyingView)initWithFrame:(CGRect)a3
{
  KeyboardProxyingView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)KeyboardProxyingView;
  result = -[KeyboardProxyingView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_shouldAppearFocused = 1;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_shouldAppearFocused)
  {
    self->_shouldAppearFocused = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardProxyingView delegate](self, "delegate"));
    objc_msgSend(v3, "keyboardProxyingView:didUpdateFocusState:", self, 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)KeyboardProxyingView;
  -[KeyboardProxyingView dealloc](&v4, "dealloc");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 10.0;
  v3 = 10.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)focusEffect
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  KeyboardProxyingView *v5;
  _BOOL4 v6;
  id v7;

  v5 = (KeyboardProxyingView *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "nextFocusedItem"));
  v6 = v5 == self;

  if (self->_shouldAppearFocused != v6)
  {
    self->_shouldAppearFocused = v6;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[KeyboardProxyingView delegate](self, "delegate"));
    objc_msgSend(v7, "keyboardProxyingView:didUpdateFocusState:", self, v5 == self);

  }
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  KeyboardProxyingView *v5;
  unsigned __int8 v6;
  BOOL v7;

  v4 = a3;
  v5 = (KeyboardProxyingView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "previouslyFocusedItem"));
  if (v5 != self)
  {

LABEL_5:
    v7 = 1;
    goto LABEL_6;
  }
  v6 = -[KeyboardProxyingView isHeadingDirectional:](self, "isHeadingDirectional:", objc_msgSend(v4, "focusHeading"));

  if ((v6 & 1) == 0)
    goto LABEL_5;
  v7 = 0;
LABEL_6:

  return v7;
}

- (BOOL)isHeadingDirectional:(unint64_t)a3
{
  return (a3 & 0xF) != 0;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)KeyboardProxyingView;
  v6 = a4;
  v7 = a3;
  -[KeyboardProxyingView pressesBegan:withEvent:](&v9, "pressesBegan:withEvent:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KeyboardProxyingView delegate](self, "delegate", v9.receiver, v9.super_class));
  objc_msgSend(v8, "keyboardProxyingView:pressesBegan:withEvent:", self, v7, v6);

}

- (KeyboardProxyingViewDelegate)delegate
{
  return (KeyboardProxyingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldAppearFocused
{
  return self->_shouldAppearFocused;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
