@implementation UIAutoRespondingScrollViewControllerKeyboardSupport

- (void)_keyboardDidShow:(id)a3
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setKeepsFirstResponderVisibleOnBoundsChange:", 0);

}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  id WeakRetained;
  int v6;
  id v7;
  void *v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAutoRespondingScrollViewControllerKeyboardSupport _adjustScrollViewForKeyboardInfo:](self, "_adjustScrollViewForKeyboardInfo:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v6 = objc_msgSend(WeakRetained, "_isInViewControllerThatHandlesKeyboardAvoidance");

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(v7, "_scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setKeepsFirstResponderVisibleOnBoundsChange:", 1);

  }
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__adjustScrollViewForKeyboardInfo_, 0);
}

- (void)_keyboardDidChangeFrame:(id)a3
{
  void *v4;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAutoRespondingScrollViewControllerKeyboardSupport _adjustScrollViewForKeyboardInfo:](self, "_adjustScrollViewForKeyboardInfo:", v4);

  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__adjustScrollViewForKeyboardInfo_, 0);
}

- (void)_adjustScrollViewForKeyboardInfo:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  double adjustmentForKeyboard;

  v4 = a3;
  if ((*((_BYTE *)self + 24) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(WeakRetained, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_loadWeakRetained((id *)&self->_viewController);
      v9 = objc_msgSend(v8, "_isInViewControllerThatHandlesKeyboardAvoidance");

      if ((v9 & 1) == 0)
      {
        adjustmentForKeyboard = self->_adjustmentForKeyboard;
        v10 = objc_loadWeakRetained((id *)&self->_viewController);
        objc_msgSend(v10, "_scrollView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_adjustForAutomaticKeyboardInfo:animated:lastAdjustment:", v4, 1, &adjustmentForKeyboard);

        self->_adjustmentForKeyboard = adjustmentForKeyboard;
      }
    }
  }

}

- (void)setViewIsDisappearing:(BOOL)a3
{
  *((_BYTE *)self + 24) = *((_BYTE *)self + 24) & 0xFE | a3;
}

- (void)setRegisteredForNotifications:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 24) = *((_BYTE *)self + 24) & 0xFD | v3;
}

- (void)setAdjustmentForKeyboard:(double)a3
{
  self->_adjustmentForKeyboard = a3;
}

- (BOOL)registeredForNotifications
{
  return (*((unsigned __int8 *)self + 24) >> 1) & 1;
}

- (double)adjustmentForKeyboard
{
  return self->_adjustmentForKeyboard;
}

- (UIAutoRespondingScrollViewControllerKeyboardSupport)initWithViewController:(id)a3
{
  id v4;
  UIAutoRespondingScrollViewControllerKeyboardSupport *v5;
  UIAutoRespondingScrollViewControllerKeyboardSupport *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIAutoRespondingScrollViewControllerKeyboardSupport;
  v5 = -[UIAutoRespondingScrollViewControllerKeyboardSupport init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_viewController, v4);

  return v6;
}

- (BOOL)viewIsDisappearing
{
  return *((_BYTE *)self + 24) & 1;
}

- (void)_keyboardWillHide:(id)a3
{
  void *v4;
  _UIKeyboardAutoRespondingScrollViewController **p_viewController;
  id WeakRetained;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99860]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAutoRespondingScrollViewControllerKeyboardSupport performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__adjustScrollViewForKeyboardInfo_, 0, v4, 0.0);

  p_viewController = &self->_viewController;
  WeakRetained = objc_loadWeakRetained((id *)p_viewController);
  LODWORD(v4) = objc_msgSend(WeakRetained, "_isInViewControllerThatHandlesKeyboardAvoidance");

  if ((_DWORD)v4)
  {
    v8 = objc_loadWeakRetained((id *)p_viewController);
    objc_msgSend(v8, "_scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setKeepsFirstResponderVisibleOnBoundsChange:", 1);

  }
}

- (void)_keyboardDidHide:(id)a3
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_msgSend(WeakRetained, "_scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setKeepsFirstResponderVisibleOnBoundsChange:", 0);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
}

@end
