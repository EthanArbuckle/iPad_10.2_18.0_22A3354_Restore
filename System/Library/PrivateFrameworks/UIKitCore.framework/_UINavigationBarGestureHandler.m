@implementation _UINavigationBarGestureHandler

- (_UINavigationBarGestureHandler)initWithNavigationBar:(id)a3
{
  id v4;
  _UINavigationBarGestureHandler *v5;
  _UINavigationBarGestureHandler *v6;
  UISwipeGestureRecognizer *v7;
  UISwipeGestureRecognizer *popSwipeGestureRecognizer;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UINavigationBarGestureHandler;
  v5 = -[_UINavigationBarGestureHandler init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_navigationBar, v4);
    v7 = -[UISwipeGestureRecognizer initWithTarget:action:]([UISwipeGestureRecognizer alloc], "initWithTarget:action:", v6, sel__handlePopSwipe_);
    popSwipeGestureRecognizer = v6->_popSwipeGestureRecognizer;
    v6->_popSwipeGestureRecognizer = v7;

    -[UIGestureRecognizer setDelegate:](v6->_popSwipeGestureRecognizer, "setDelegate:", v6);
    objc_msgSend(v4, "addGestureRecognizer:", v6->_popSwipeGestureRecognizer);
  }

  return v6;
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  _UINavigationBarGestureHandler *v4;
  _UINavigationBarGestureHandlerDelegate **p_delegate;
  id v6;
  id WeakRetained;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (self->_popSwipeGestureRecognizer != a3)
    return 1;
  v4 = self;
  p_delegate = &self->_delegate;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_loadWeakRetained((id *)&v4->_navigationBar);
  objc_msgSend(v6, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  LOBYTE(v4) = objc_msgSend(WeakRetained, "shouldGestureHandler:recognizedPopAtLocation:", v4, v10, v12);
  return (char)v4;
}

- (void)_handlePopSwipe:(id)a3
{
  _UINavigationBarGestureHandlerDelegate **p_delegate;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_loadWeakRetained((id *)&self->_navigationBar);
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend(WeakRetained, "gestureHandler:recognizedPopAtLocation:", self, v8, v10);
}

- (void)setIdiom:(int64_t)a3
{
  UISwipeGestureRecognizer *popSwipeGestureRecognizer;
  id v4;

  if (self->_idiom != a3)
  {
    self->_idiom = a3;
    popSwipeGestureRecognizer = self->_popSwipeGestureRecognizer;
    if (a3 == 3)
    {
      -[UIGestureRecognizer setAllowedTouchTypes:](self->_popSwipeGestureRecognizer, "setAllowedTouchTypes:", &unk_1E1A92BA0);
    }
    else
    {
      -[UIGestureRecognizer _defaultAllowedTouchTypes](self->_popSwipeGestureRecognizer);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[UIGestureRecognizer setAllowedTouchTypes:](popSwipeGestureRecognizer, "setAllowedTouchTypes:", v4);

    }
  }
}

- (UINavigationBar)navigationBar
{
  return (UINavigationBar *)objc_loadWeakRetained((id *)&self->_navigationBar);
}

- (_UINavigationBarGestureHandlerDelegate)delegate
{
  return (_UINavigationBarGestureHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_navigationBar);
  objc_storeStrong((id *)&self->_popSwipeGestureRecognizer, 0);
}

@end
