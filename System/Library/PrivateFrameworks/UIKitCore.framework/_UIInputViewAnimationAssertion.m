@implementation _UIInputViewAnimationAssertion

+ (id)_assertionWithDirection:(int)a3 animated:(BOOL)a4 sceneDelegate:(id)a5
{
  id v7;
  _UIInputViewAnimationAssertion *v8;
  id v9;
  _UIInputViewAnimationAssertion *v10;
  uint64_t v11;
  UIInputViewAnimationStyle *style;
  id WeakRetained;
  void *v14;
  objc_super v16;

  v7 = a5;
  v8 = [_UIInputViewAnimationAssertion alloc];
  v9 = v7;
  if (v8)
  {
    v16.receiver = v8;
    v16.super_class = (Class)_UIInputViewAnimationAssertion;
    v10 = objc_msgSendSuper2(&v16, sel_init);
    v8 = v10;
    if (v10)
    {
      v10->_direction = a3;
      v10->_animated = a4;
      objc_storeWeak((id *)&v10->_sceneDelegate, v9);
      +[UIInputViewAnimationStyleDirectional animationStyleAnimated:duration:outDirection:](UIInputViewAnimationStyleDirectional, "animationStyleAnimated:duration:outDirection:", -[_UIInputViewAnimationAssertion animated](v8, "animated"), -[_UIInputViewAnimationAssertion direction](v8, "direction"), 0.25);
      v11 = objc_claimAutoreleasedReturnValue();
      style = v8->_style;
      v8->_style = (UIInputViewAnimationStyle *)v11;

      -[UIInputViewAnimationStyle setForAssertion:](v8->_style, "setForAssertion:", 1);
      WeakRetained = objc_loadWeakRetained((id *)&v8->_sceneDelegate);
      -[_UIInputViewAnimationAssertion style](v8, "style");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "pushAnimationStyle:", v14);

      v8->_valid = 1;
    }
  }

  return v8;
}

- (UIInputViewAnimationStyle)style
{
  return self->_style;
}

- (int)direction
{
  return self->_direction;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)invalidate
{
  id WeakRetained;
  void *v4;

  if (self->_valid)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
    -[_UIInputViewAnimationAssertion style](self, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "popOrRemoveAnimationStyle:", v4);

    self->_valid = 0;
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (UIKeyboardSceneDelegate)sceneDelegate
{
  return (UIKeyboardSceneDelegate *)objc_loadWeakRetained((id *)&self->_sceneDelegate);
}

- (void)setSceneDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sceneDelegate, a3);
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_destroyWeak((id *)&self->_sceneDelegate);
}

@end
