@implementation UIScrollViewDirectionalPressGestureRecognizer

- (UIScrollViewDirectionalPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIScrollViewDirectionalPressGestureRecognizer *v4;
  UIScrollViewDirectionalPressGestureRecognizer *v5;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIScrollViewDirectionalPressGestureRecognizer;
  v4 = -[_UIRepeatingPressGestureRecognizer initWithTarget:action:](&v9, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_activePressType = -1;
    v8.receiver = v4;
    v8.super_class = (Class)UIScrollViewDirectionalPressGestureRecognizer;
    -[UIGestureRecognizer setAllowedTouchTypes:](&v8, sel_setAllowedTouchTypes_, MEMORY[0x1E0C9AA60]);
    v7.receiver = v5;
    v7.super_class = (Class)UIScrollViewDirectionalPressGestureRecognizer;
    -[UIGestureRecognizer setAllowedPressTypes:](&v7, sel_setAllowedPressTypes_, &unk_1E1A95318);
  }
  return v5;
}

- (BOOL)_shouldReceivePress:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  int64_t activePressType;
  BOOL v12;
  BOOL v13;

  v4 = objc_msgSend(a3, "type");
  -[UIGestureRecognizer allowedPressTypes](self, "allowedPressTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (!v7)
    return 0;
  -[UIScrollViewDirectionalPressGestureRecognizer scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_canScrollX");
  if (((objc_msgSend(v8, "_canScrollY") & 1) != 0 || v4 >= 2)
    && ((v4 & 0xFFFFFFFFFFFFFFFELL) != 2 ? (v10 = 1) : (v10 = v9),
        v10 == 1
     && ((activePressType = self->_activePressType, activePressType != -1) ? (v12 = activePressType == v4) : (v12 = 1),
         v12)))
  {
    self->_activePressType = v4;
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)reset
{
  self->_activePressType = -1;
}

- (void)setEnabled:(BOOL)a3
{
  id WeakRetained;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIScrollViewDirectionalPressGestureRecognizer;
  -[UIGestureRecognizer setEnabled:](&v6, sel_setEnabled_, a3);
  self->_hasBeenModified = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_originalView);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_originalView);
    objc_msgSend(v5, "addGestureRecognizer:", self);

    objc_storeWeak((id *)&self->_originalView, 0);
  }
}

- (void)_setEnabledIfAllowed:(BOOL)a3
{
  objc_super v3;

  if (!self->_hasBeenModified)
  {
    v3.receiver = self;
    v3.super_class = (Class)UIScrollViewDirectionalPressGestureRecognizer;
    -[UIGestureRecognizer setEnabled:](&v3, sel_setEnabled_, a3);
  }
}

- (void)_addToViewIfAllowed:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->_hasBeenModified)
  {
    v7 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_originalView);

    if (!WeakRetained)
    {
      -[UIGestureRecognizer view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_originalView, v6);

    }
    objc_msgSend(v7, "addGestureRecognizer:", self);
    v4 = v7;
  }

}

- (void)_resetToOriginalViewIfAllowed
{
  void *v3;
  id WeakRetained;

  if (!self->_hasBeenModified)
  {
    -[UIGestureRecognizer view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeGestureRecognizer:", self);

    WeakRetained = objc_loadWeakRetained((id *)&self->_originalView);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", self);

  }
}

- (void)setAllowedPressTypes:(id)a3
{
  NSLog(CFSTR("WARNING - Changing allowedPressTypes is not allowed on the directionalPressGestureRecognizer of UIScrollView."), a2, a3);
}

- (void)setAllowedTouchTypes:(id)a3
{
  NSLog(CFSTR("WARNING - Changing allowedTouchTypes is not allowed on the directionalPressGestureRecognizer of UIScrollView."), a2, a3);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (int64_t)activePressType
{
  return self->_activePressType;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_originalView);
}

@end
