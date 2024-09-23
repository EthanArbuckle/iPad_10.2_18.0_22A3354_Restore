@implementation THBookView

- (THBookView)initWithFrame:(CGRect)a3 expandedLayout:(BOOL)a4
{
  THBookView *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THBookView;
  result = -[THBookView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->mExpandedLayout = a4;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  UIVisualEffectView *effectView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THBookView;
  -[THBookView setBackgroundColor:](&v6, "setBackgroundColor:");
  effectView = self->_effectView;
  if (a3)
  {
    if (effectView)
    {
      -[UIVisualEffectView removeFromSuperview](effectView, "removeFromSuperview");

      self->_effectView = 0;
    }
  }
  else if (!effectView)
  {
    self->_effectView = (UIVisualEffectView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", +[_UIBlurThroughEffect _blurThroughWithStyle:](_UIBlurThroughEffect, "_blurThroughWithStyle:", 1));
    -[THBookView bounds](self, "bounds");
    -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:");
    -[UIVisualEffectView setAutoresizingMask:](self->_effectView, "setAutoresizingMask:", 18);
    -[THBookView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_effectView, 0);
  }
}

- (void)insertSubviewAtBack:(id)a3
{
  if (self->_effectView)
    -[THBookView insertSubview:above:](self, "insertSubview:above:", a3);
  else
    -[THBookView insertSubview:atIndex:](self, "insertSubview:atIndex:", a3);
}

- (void)dealloc
{
  objc_super v3;

  -[THBookView setBookDelegate:](self, "setBookDelegate:", 0);

  self->_effectView = 0;
  v3.receiver = self;
  v3.super_class = (Class)THBookView;
  -[THBookView dealloc](&v3, "dealloc");
}

- (void)didMoveToWindow
{
  id v3;
  id v4;

  v3 = -[THBookView window](self, "window");
  if (v3)
  {
    v4 = +[TSKKeyboardMonitor sharedKeyboardMonitor](TSKKeyboardMonitor, "sharedKeyboardMonitor");
    if (!objc_msgSend(v4, "rootWindow"))
      objc_msgSend(v4, "setRootWindow:", v3);
  }
  -[THBookViewDelegate bookView:didMoveToWindow:](-[THBookView bookDelegate](self, "bookDelegate"), "bookView:didMoveToWindow:", self, v3);
}

- (THBookViewDelegate)bookDelegate
{
  return self->_bookDelegate;
}

- (void)setBookDelegate:(id)a3
{
  self->_bookDelegate = (THBookViewDelegate *)a3;
}

@end
