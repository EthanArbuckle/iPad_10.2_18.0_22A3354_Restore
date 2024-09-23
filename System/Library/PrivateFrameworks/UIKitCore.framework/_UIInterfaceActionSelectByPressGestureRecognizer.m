@implementation _UIInterfaceActionSelectByPressGestureRecognizer

- (_UIInterfaceActionSelectByPressGestureRecognizer)initWithFocusedInterfaceActionPressDelegate:(id)a3
{
  id v4;
  _UIInterfaceActionSelectByPressGestureRecognizer *v5;
  _UIInterfaceActionSelectByPressGestureRecognizer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIInterfaceActionSelectByPressGestureRecognizer;
  v5 = -[UITapGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, self, sel__gestureChanged_);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_pressDelegate, v4);
    -[UITapGestureRecognizer setAllowedPressTypes:](v6, "setAllowedPressTypes:", &unk_1E1A92A08);
    -[UIGestureRecognizer setAllowedTouchTypes:](v6, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
  }

  return v6;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIInterfaceActionSelectByPressGestureRecognizer;
  -[UITapGestureRecognizer pressesBegan:withEvent:](&v7, sel_pressesBegan_withEvent_, a3, a4);
  -[_UIInterfaceActionSelectByPressGestureRecognizer pressDelegate](self, "pressDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focusedInterfaceAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInterfaceActionSelectByPressGestureRecognizer setInterfaceActionOnPressBegan:](self, "setInterfaceActionOnPressBegan:", v6);

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  -[_UIInterfaceActionSelectByPressGestureRecognizer pressDelegate](self, "pressDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "focusedInterfaceAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIInterfaceActionSelectByPressGestureRecognizer interfaceActionOnPressBegan](self, "interfaceActionOnPressBegan");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIInterfaceActionSelectByPressGestureRecognizer;
    -[UITapGestureRecognizer pressesEnded:withEvent:](&v11, sel_pressesEnded_withEvent_, v6, v7);
  }
  else
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionSelectByPressGestureRecognizer;
  -[UIGestureRecognizer reset](&v3, sel_reset);
  -[_UIInterfaceActionSelectByPressGestureRecognizer setInterfaceActionOnPressBegan:](self, "setInterfaceActionOnPressBegan:", 0);
}

- (void)_gestureChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[_UIInterfaceActionSelectByPressGestureRecognizer pressDelegate](self, "pressDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "focusedInterfaceAction");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_UIInterfaceActionSelectByPressGestureRecognizer pressDelegate](self, "pressDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handlePressedFocusedInterfaceAction:", v6);

    }
  }
}

- (UIFocusedInterfaceActionPressDelegate)pressDelegate
{
  return (UIFocusedInterfaceActionPressDelegate *)objc_loadWeakRetained((id *)&self->_pressDelegate);
}

- (void)setPressDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pressDelegate, a3);
}

- (UIInterfaceActionGroupView)actionGroupView
{
  return (UIInterfaceActionGroupView *)objc_loadWeakRetained((id *)&self->_actionGroupView);
}

- (void)setActionGroupView:(id)a3
{
  objc_storeWeak((id *)&self->_actionGroupView, a3);
}

- (UIInterfaceAction)interfaceActionOnPressBegan
{
  return (UIInterfaceAction *)objc_loadWeakRetained((id *)&self->_interfaceActionOnPressBegan);
}

- (void)setInterfaceActionOnPressBegan:(id)a3
{
  objc_storeWeak((id *)&self->_interfaceActionOnPressBegan, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interfaceActionOnPressBegan);
  objc_destroyWeak((id *)&self->_actionGroupView);
  objc_destroyWeak((id *)&self->_pressDelegate);
}

@end
