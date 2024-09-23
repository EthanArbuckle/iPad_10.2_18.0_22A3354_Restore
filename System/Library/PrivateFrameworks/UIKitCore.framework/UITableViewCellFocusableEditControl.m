@implementation UITableViewCellFocusableEditControl

- (void)_updateFloatingViewForCurrentTraits
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  _UIFloatingContentView *focusedFloatingContentView;
  void *v9;
  _UIFloatingContentView *v10;
  double v11;
  double v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._cell);
  objc_msgSend(WeakRetained, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  v6 = v5 == 1000 || v5 == 2;
  focusedFloatingContentView = self->_focusedFloatingContentView;
  if (v6)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingContentView setBackgroundColor:forState:](focusedFloatingContentView, "setBackgroundColor:forState:", v7, 0);

    v10 = self->_focusedFloatingContentView;
    v11 = 1.0;
    v12 = 0.2;
  }
  else
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingContentView setBackgroundColor:forState:](focusedFloatingContentView, "setBackgroundColor:forState:", v9, 0);

    v10 = self->_focusedFloatingContentView;
    v11 = 1.0;
    v12 = 0.5;
  }
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v11, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingContentView setBackgroundColor:forState:](v10, "setBackgroundColor:forState:");

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellFocusableEditControl;
  -[UITableViewCellEditControl traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[UITableViewCellEditControl _updateImageView](self, "_updateImageView");
  -[UITableViewCellFocusableEditControl _updateFloatingViewForCurrentTraits](self, "_updateFloatingViewForCurrentTraits");
}

- (id)_currentImage
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellFocusableEditControl;
  -[UITableViewCellEditControl _currentImage](&v3, sel__currentImage);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellFocusableEditControl;
  -[UITableViewCellEditControl layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[_UIFloatingContentView setFrame:](self->_focusedFloatingContentView, "setFrame:");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellFocusableEditControl;
  -[UITableViewCellEditControl setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[_UIFloatingContentView setControlState:animated:](self->_focusedFloatingContentView, "setControlState:animated:", -[UIControl state](self, "state"), +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"));
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellFocusableEditControl;
  -[UITableViewCellEditControl setSelected:](&v4, sel_setSelected_, a3);
  -[_UIFloatingContentView setControlState:animated:](self->_focusedFloatingContentView, "setControlState:animated:", -[UIControl state](self, "state"), +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"));
}

- (BOOL)wantsMaskingWhileAnimatingDisabled
{
  return -[_UIFloatingContentView clipsContentToBounds](self->_focusedFloatingContentView, "clipsContentToBounds");
}

- (BOOL)wantsImageShadow
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellFocusableEditControl;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v5, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, a4);
  -[_UIFloatingContentView setControlState:animated:](self->_focusedFloatingContentView, "setControlState:animated:", -[UIControl state](self, "state"), 1);
  -[UITableViewCellEditControl _updateImageView](self, "_updateImageView");
}

- (BOOL)_shouldHandlePressEvent:(id)a3
{
  return 0;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  v6 = a3;
  v7 = a4;
  if (-[UITableViewCellFocusableEditControl _shouldHandlePressEvent:](self, "_shouldHandlePressEvent:", v7))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__UITableViewCellFocusableEditControl_pressesBegan_withEvent___block_invoke;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.1);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCellFocusableEditControl;
    -[UIResponder pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v6, v7);
  }

}

uint64_t __62__UITableViewCellFocusableEditControl_pressesBegan_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 1);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  v6 = a3;
  v7 = a4;
  if (-[UITableViewCellFocusableEditControl _shouldHandlePressEvent:](self, "_shouldHandlePressEvent:", v7))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__UITableViewCellFocusableEditControl_pressesEnded_withEvent___block_invoke;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.1);
    -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCellFocusableEditControl;
    -[UIResponder pressesEnded:withEvent:](&v8, sel_pressesEnded_withEvent_, v6, v7);
  }

}

uint64_t __62__UITableViewCellFocusableEditControl_pressesEnded_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  v6 = a3;
  v7 = a4;
  if (-[UITableViewCellFocusableEditControl _shouldHandlePressEvent:](self, "_shouldHandlePressEvent:", v7))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__UITableViewCellFocusableEditControl_pressesCancelled_withEvent___block_invoke;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.1);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCellFocusableEditControl;
    -[UIResponder pressesCancelled:withEvent:](&v8, sel_pressesCancelled_withEvent_, v6, v7);
  }

}

uint64_t __66__UITableViewCellFocusableEditControl_pressesCancelled_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedFloatingContentView, 0);
}

@end
