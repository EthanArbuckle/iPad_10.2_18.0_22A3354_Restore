@implementation UITableViewCellFocusableReorderControl

- (UITableViewCellFocusableReorderControl)initWithTableViewCell:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellFocusableReorderControl;
  return -[UITableViewCellReorderControl initWithTableViewCell:](&v4, sel_initWithTableViewCell_, a3);
}

- (void)_updateFloatingViewForCurrentTraits
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  _UIFloatingContentView *floatingContentView;
  void *v9;
  _UIFloatingContentView *v10;
  double v11;
  double v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._cell);
  objc_msgSend(WeakRetained, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceStyle");

  if (self->_cellHasReorderingAppearance)
  {
    -[_UIFloatingContentView setBackgroundColor:forState:](self->_floatingContentView, "setBackgroundColor:forState:", 0, 0);
    -[_UIFloatingContentView setBackgroundColor:forState:](self->_floatingContentView, "setBackgroundColor:forState:", 0, 4);
  }
  else
  {
    v6 = v5 == 1000 || v5 == 2;
    floatingContentView = self->_floatingContentView;
    if (v6)
    {
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFloatingContentView setBackgroundColor:forState:](floatingContentView, "setBackgroundColor:forState:", v7, 0);

      v10 = self->_floatingContentView;
      v11 = 1.0;
      v12 = 0.2;
    }
    else
    {
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFloatingContentView setBackgroundColor:forState:](floatingContentView, "setBackgroundColor:forState:", v9, 0);

      v10 = self->_floatingContentView;
      v11 = 1.0;
      v12 = 0.5;
    }
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v11, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingContentView setBackgroundColor:forState:](v10, "setBackgroundColor:forState:", v13, 4);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellFocusableReorderControl;
  -[UIView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[UITableViewCellReorderControl _updateImageView](self, "_updateImageView");
  -[UITableViewCellFocusableReorderControl _updateFloatingViewForCurrentTraits](self, "_updateFloatingViewForCurrentTraits");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellFocusableReorderControl;
  -[UITableViewCellReorderControl layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[_UIFloatingContentView setFrame:](self->_floatingContentView, "setFrame:");
}

- (BOOL)wantsMaskingWhileAnimatingDisabled
{
  return -[_UIFloatingContentView clipsContentToBounds](self->_floatingContentView, "clipsContentToBounds");
}

- (void)floatingContentView:(id)a3 isTransitioningFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v8;
  id WeakRetained;
  id v10;
  id v11;

  v8 = a3;
  if (a5 == 4)
  {
    v11 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->super._cell);
    objc_msgSend(WeakRetained, "_transitionToReorderingAppearance:", 1);

    self->_cellHasReorderingAppearance = 1;
    -[UITableViewCellFocusableReorderControl _updateFloatingViewForCurrentTraits](self, "_updateFloatingViewForCurrentTraits");
LABEL_5:
    v8 = v11;
    goto LABEL_6;
  }
  if (a4 == 4)
  {
    v11 = v8;
    v10 = objc_loadWeakRetained((id *)&self->super._cell);
    objc_msgSend(v10, "_transitionToReorderingAppearance:", 0);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)floatingContentView:(id)a3 didFinishTransitioningToState:(unint64_t)a4
{
  id WeakRetained;

  if (a4 != 4 && self->_cellHasReorderingAppearance)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._cell);
    objc_msgSend(WeakRetained, "_finishTransitioningToReorderingAppearance:", 0);

    self->_cellHasReorderingAppearance = 0;
    -[UITableViewCellFocusableReorderControl _updateFloatingViewForCurrentTraits](self, "_updateFloatingViewForCurrentTraits");
  }
}

- (void)_updateFocusedFloatingContentView:(BOOL)a3
{
  _BOOL8 v3;
  UIControlState v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[UIControl state](self, "state");
  if (-[UIControl isTracking](self, "isTracking"))
    v6 = 4;
  else
    v6 = v5;
  -[_UIFloatingContentView setControlState:animated:](self->_floatingContentView, "setControlState:animated:", v6, v3);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  UITableViewCellFocusableReorderControl *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITableViewCellFocusableReorderControl;
  v6 = a3;
  -[UIView didUpdateFocusInContext:withAnimationCoordinator:](&v8, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedView", v8.receiver, v8.super_class);
  v7 = (UITableViewCellFocusableReorderControl *)objc_claimAutoreleasedReturnValue();

  if (-[UIControl isTracking](self, "isTracking") && v7 != self)
  {
    -[UIControl setHighlighted:](self, "setHighlighted:", 0);
    -[UITableViewCellFocusableReorderControl _endIndirectTracking](self, "_endIndirectTracking");
  }
  -[UITableViewCellFocusableReorderControl _updateFocusedFloatingContentView:](self, "_updateFocusedFloatingContentView:", 1);
  -[UITableViewCellReorderControl _updateImageView](self, "_updateImageView");
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[UIControl isTracking](self, "isTracking"))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITableViewCellFocusableReorderControl;
    v5 = -[UIView shouldUpdateFocusInContext:](&v7, sel_shouldUpdateFocusInContext_, v4);
  }

  return v5;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (void)_beginIndirectTracking
{
  UIPanGestureRecognizer *v3;
  UIPanGestureRecognizer *panRecognizer;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *upArrowButtonRecognizer;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *downArrowButtonRecognizer;
  id WeakRetained;

  v3 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__panRecognizer_);
  panRecognizer = self->_panRecognizer;
  self->_panRecognizer = v3;

  -[UIGestureRecognizer setCancelsTouchesInView:](self->_panRecognizer, "setCancelsTouchesInView:", 0);
  -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_panRecognizer);
  v5 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__upArrowButton_);
  upArrowButtonRecognizer = self->_upArrowButtonRecognizer;
  self->_upArrowButtonRecognizer = v5;

  -[UITapGestureRecognizer setAllowedPressTypes:](self->_upArrowButtonRecognizer, "setAllowedPressTypes:", &unk_1E1A94BF8);
  -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_upArrowButtonRecognizer);
  v7 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__downArrowButton_);
  downArrowButtonRecognizer = self->_downArrowButtonRecognizer;
  self->_downArrowButtonRecognizer = v7;

  -[UITapGestureRecognizer setAllowedPressTypes:](self->_downArrowButtonRecognizer, "setAllowedPressTypes:", &unk_1E1A94C10);
  -[UIView addGestureRecognizer:](self, "addGestureRecognizer:", self->_downArrowButtonRecognizer);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._cell);
  objc_msgSend(WeakRetained, "_grabberBeganReorder:touch:", self, 0);

  -[UITableViewCellReorderControl setTracking:](self, "setTracking:", 1);
  -[UITableViewCellFocusableReorderControl _updateFocusedFloatingContentView:](self, "_updateFocusedFloatingContentView:", 1);
}

- (void)_endIndirectTracking
{
  UIPanGestureRecognizer *panRecognizer;
  UITapGestureRecognizer *upArrowButtonRecognizer;
  UITapGestureRecognizer *downArrowButtonRecognizer;
  id WeakRetained;

  -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_panRecognizer);
  panRecognizer = self->_panRecognizer;
  self->_panRecognizer = 0;

  -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_upArrowButtonRecognizer);
  upArrowButtonRecognizer = self->_upArrowButtonRecognizer;
  self->_upArrowButtonRecognizer = 0;

  -[UIView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_downArrowButtonRecognizer);
  downArrowButtonRecognizer = self->_downArrowButtonRecognizer;
  self->_downArrowButtonRecognizer = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._cell);
  objc_msgSend(WeakRetained, "_grabberReleased:", self);

  -[UITableViewCellReorderControl setTracking:](self, "setTracking:", 0);
  -[UITableViewCellFocusableReorderControl _updateFocusedFloatingContentView:](self, "_updateFocusedFloatingContentView:", 1);
}

- (BOOL)_shouldHandlePressEvent:(id)a3
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "_lastPreparedPress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type") == 4
    && -[UIControl isEnabled](self, "isEnabled")
    && -[UIView isFocused](self, "isFocused");

  return v5;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[UITableViewCellFocusableReorderControl _shouldHandlePressEvent:](self, "_shouldHandlePressEvent:", v7))
  {
    -[UIControl setHighlighted:](self, "setHighlighted:", 1);
    -[UITableViewCellFocusableReorderControl _updateFocusedFloatingContentView:](self, "_updateFocusedFloatingContentView:", 1);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCellFocusableReorderControl;
    -[UIResponder pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[UITableViewCellFocusableReorderControl _shouldHandlePressEvent:](self, "_shouldHandlePressEvent:", v7))
  {
    -[UIControl setHighlighted:](self, "setHighlighted:", 0);
    -[UITableViewCellFocusableReorderControl _updateFocusedFloatingContentView:](self, "_updateFocusedFloatingContentView:", 1);
    if (-[UIControl isTracking](self, "isTracking"))
      -[UITableViewCellFocusableReorderControl _endIndirectTracking](self, "_endIndirectTracking");
    else
      -[UITableViewCellFocusableReorderControl _beginIndirectTracking](self, "_beginIndirectTracking");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCellFocusableReorderControl;
    -[UIResponder pressesEnded:withEvent:](&v8, sel_pressesEnded_withEvent_, v6, v7);
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (-[UITableViewCellFocusableReorderControl _shouldHandlePressEvent:](self, "_shouldHandlePressEvent:", v7))
  {
    -[UIControl setHighlighted:](self, "setHighlighted:", 0);
    -[_UIFloatingContentView setControlState:animated:](self->_floatingContentView, "setControlState:animated:", -[UIControl state](self, "state"), 1);
    if (-[UIControl isTracking](self, "isTracking"))
      -[UITableViewCellFocusableReorderControl _endIndirectTracking](self, "_endIndirectTracking");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewCellFocusableReorderControl;
    -[UIResponder pressesCancelled:withEvent:](&v8, sel_pressesCancelled_withEvent_, v6, v7);
  }

}

- (void)_panRecognizer:(id)a3
{
  uint64_t v4;
  CGFloat v5;
  CGFloat v6;
  id WeakRetained;
  void *v8;
  void *v9;
  double Height;
  void *v11;
  double v12;
  id v13;
  double v14;
  double v15;
  id v16;
  CGRect v17;
  CGRect v18;

  v16 = a3;
  if (-[UIControl isTracking](self, "isTracking"))
  {
    v4 = objc_msgSend(v16, "state");
    if (v4 == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->super._cell);
      objc_msgSend(WeakRetained, "_tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_scrollView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "frame");
      Height = CGRectGetHeight(v17);
      -[UIView _screen](self, "_screen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v12 = Height / CGRectGetHeight(v18);

      v13 = objc_loadWeakRetained((id *)&self->super._cell);
      objc_msgSend(v16, "locationInView:", self);
      v15 = round(v12 * (v14 - self->super._downPoint.y));
      *(float *)&v15 = v15;
      objc_msgSend(v13, "_grabberDragged:yDelta:", self, v15);

    }
    else if (v4 == 1)
    {
      objc_msgSend(v16, "locationInView:", self);
      self->super._downPoint.x = v5;
      self->super._downPoint.y = v6;
    }
  }

}

- (void)_arrowButton:(int64_t)a3
{
  id WeakRetained;
  double Height;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[6];
  CGRect v13;

  if (-[UIControl isTracking](self, "isTracking"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._cell);
    objc_msgSend(WeakRetained, "frame");
    Height = CGRectGetHeight(v13);
    v7 = objc_loadWeakRetained((id *)&self->super._cell);
    objc_msgSend(v7, "_tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_rowSpacing");
    v10 = Height + v9;

    v11 = -v10;
    if (a3)
      v11 = v10;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__UITableViewCellFocusableReorderControl__arrowButton___block_invoke;
    v12[3] = &unk_1E16B1888;
    v12[4] = self;
    *(double *)&v12[5] = v11;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v12, 0.2);
  }
}

void __55__UITableViewCellFocusableReorderControl__arrowButton___block_invoke(uint64_t a1)
{
  double v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 464));
  v2 = *(double *)(a1 + 40);
  *(float *)&v2 = v2;
  objc_msgSend(WeakRetained, "_grabberDragged:yDelta:", *(_QWORD *)(a1 + 32), v2);

}

- (void)_upArrowButton:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[UITableViewCellFocusableReorderControl _arrowButton:](self, "_arrowButton:", 0);
}

- (void)_downArrowButton:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[UITableViewCellFocusableReorderControl _arrowButton:](self, "_arrowButton:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downArrowButtonRecognizer, 0);
  objc_storeStrong((id *)&self->_upArrowButtonRecognizer, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
  objc_storeStrong((id *)&self->_floatingContentView, 0);
}

@end
