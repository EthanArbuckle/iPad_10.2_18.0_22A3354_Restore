@implementation _UIStaticScrollBar

- (_UIStaticScrollBar)initWithFrame:(CGRect)a3
{
  _UIStaticScrollBar *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStaticScrollBar;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView _setHostsLayoutEngine:](v3, "_setHostsLayoutEngine:", 1);
  return v3;
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStaticScrollBar;
  -[UIView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3)
    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = -[_UIStaticScrollBar _axis](self, "_axis");
  -[UIView _screen](self, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale(v7);
  if (v6 == 2)
    width = v8;
  else
    height = v8;

  v9 = width;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_setupSubviewsIfNeeded
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  UIButton *v5;
  UIButton *upButton;
  UIButton *v7;
  UIButton *downButton;
  UIView *v9;
  UIView *dividerLine;
  void *v11;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44___UIStaticScrollBar__setupSubviewsIfNeeded__block_invoke;
  aBlock[3] = &unk_1E16EAEA0;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  v4 = (void (**)(_QWORD, _QWORD))v3;
  if (!self->_upButton)
  {
    (*((void (**)(void *, const __CFString *))v3 + 2))(v3, CFSTR("chevron.up"));
    v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
    upButton = self->_upButton;
    self->_upButton = v5;

    -[UIView addSubview:](self, "addSubview:", self->_upButton);
  }
  if (!self->_downButton)
  {
    ((void (**)(_QWORD, const __CFString *))v4)[2](v4, CFSTR("chevron.down"));
    v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
    downButton = self->_downButton;
    self->_downButton = v7;

    -[UIView addSubview:](self, "addSubview:", self->_downButton);
  }
  if (!self->_dividerLine)
  {
    v9 = objc_alloc_init(UIView);
    dividerLine = self->_dividerLine;
    self->_dividerLine = v9;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_dividerLine, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_dividerLine, "setBackgroundColor:", v11);

    -[UIView addSubview:](self, "addSubview:", self->_dividerLine);
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  -[_UIStaticScrollBar _setupSubviewsIfNeeded](self, "_setupSubviewsIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)_UIStaticScrollBar;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)updateConstraints
{
  NSArray *v3;
  NSArray *constraints;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStaticScrollBar;
  -[UIView updateConstraints](&v5, sel_updateConstraints);
  -[_UIStaticScrollBar _setupSubviewsIfNeeded](self, "_setupSubviewsIfNeeded");
  if (self->_constraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
  -[_UIStaticScrollBar _constraintsForEdge:](self, "_constraintsForEdge:", -[_UIStaticScrollBar edge](self, "edge"));
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v3;

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_constraints);
}

- (id)_constraintsForEdge:(int64_t)a3
{
  unint64_t v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  _QWORD v38[4];
  _QWORD v39[5];

  v39[4] = *MEMORY[0x1E0C80C00];
  if (!self->_upButton || !self->_downButton || !self->_dividerLine)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStaticScrollBar.m"), 131, CFSTR("you should not request constraints before setting up the required views"));

  }
  v5 = -[_UIStaticScrollBar _axis](self, "_axis", a3);
  if (-[_UIStaticScrollBar shouldInsetButtonsForIndex](self, "shouldInsetButtonsForIndex"))
    v6 = 100.0;
  else
    v6 = 0.0;
  -[UIView _screen](self, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale(v7);
  v9 = v8;

  -[UIButton imageForState:](self->_upButton, "imageForState:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = v11;
  v14 = v13;

  if (v5 == 2)
    v12 = v14;
  v38[0] = CFSTR("margin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v15;
  v38[1] = CFSTR("spacing");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v16;
  v38[2] = CFSTR("hairline");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v17;
  v38[3] = CFSTR("minLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  _NSDictionaryOfVariableBindings(CFSTR("_dividerLine, _upButton, _downButton"), self->_dividerLine, self->_upButton, self->_downButton, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  switch(v5)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_UIStaticScrollBar edge](self, "edge"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStaticScrollBar.m"), 179, CFSTR("scroll bar edge is outside expected values (edge:%@)"), v24);

LABEL_24:
      break;
    case 1uLL:
      if (-[_UIStaticScrollBar edge](self, "edge") == 2)
      {
        v25 = CFSTR("V:|[_downButton][_dividerLine]|");
        v26 = CFSTR("V:|[_upButton][_dividerLine(hairline)]|");
      }
      else
      {
        if (-[_UIStaticScrollBar edge](self, "edge") != 4)
        {
LABEL_20:
          objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[_dividerLine]|"), 0, v19, v20);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObjectsFromArray:", v29);

          v30 = (void *)MEMORY[0x1E0D156E0];
          v31 = CFSTR("|-margin-[_upButton(==_downButton)]-spacing@750-[_downButton(>=minLength)]-margin-|");
LABEL_23:
          objc_msgSend(v30, "constraintsWithVisualFormat:options:metrics:views:", v31, 0, v19, v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObjectsFromArray:", v23);
          goto LABEL_24;
        }
        v25 = CFSTR("V:|[_dividerLine][_downButton]|");
        v26 = CFSTR("V:|[_dividerLine(hairline)][_upButton]|");
      }
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", v26, 0, v19, v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObjectsFromArray:", v27);

      objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", v25, 0, v19, v20);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObjectsFromArray:", v28);

      goto LABEL_20;
    case 2uLL:
      if (-[_UIStaticScrollBar edge](self, "edge") == 3)
        v22 = 0x10000;
      else
        v22 = (unint64_t)(-[_UIStaticScrollBar edge](self, "edge") == 5) << 17;
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[_upButton][_dividerLine(hairline)]|"), v22, v19, v20);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObjectsFromArray:", v32);

      objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[_downButton][_dividerLine]|"), v22, v19, v20);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObjectsFromArray:", v33);

      objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_dividerLine]|"), 0, v19, v20);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObjectsFromArray:", v34);

      v30 = (void *)MEMORY[0x1E0D156E0];
      v31 = CFSTR("V:|-margin-[_upButton(==_downButton)]-spacing@750-[_downButton(>=minLength)]-margin-|");
      goto LABEL_23;
  }
  v35 = (void *)objc_msgSend(v21, "copy");

  return v35;
}

- (BOOL)overlay
{
  return 0;
}

- (unint64_t)_axis
{
  if (((-[_UIStaticScrollBar edge](self, "edge") - 2) & 0xFFFFFFFFFFFFFFFDLL) != 0)
    return 2;
  else
    return 1;
}

- (void)buttonTapped:(id)a3
{
  double v4;
  id v5;

  if (self->_upButton == a3)
    v4 = -1.0;
  else
    v4 = 1.0;
  -[_UIStaticScrollBar scrollView](self, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_staticScrollBar:didScrollInDirection:", self, 0.0, v4);

}

- (void)setShouldInsetButtonsForIndex:(BOOL)a3
{
  if (self->_shouldInsetButtonsForIndex != a3)
  {
    self->_shouldInsetButtonsForIndex = a3;
    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setEdge:(int64_t)a3
{
  if (self->_edge != a3)
  {
    self->_edge = a3;
    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (int64_t)desiredAccessoryEdge
{
  void *v2;
  int64_t v3;

  +[UIScreen _carScreen](UIScreen, "_carScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_isRightHandDrive"))
    v3 = 3;
  else
    v3 = 5;

  return v3;
}

- (CGRect)centeringBounds
{
  double v3;
  double v4;
  char v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  UIRoundToViewScale(self);
  v4 = v3;
  if (-[_UIStaticScrollBar _axis](self, "_axis") == 2)
    v5 = 10;
  else
    v5 = 5;
  -[UIView bounds](self, "bounds");
  v10 = UIRectInsetEdges(v5, v6, v7, v8, v9, v4);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (int64_t)edge
{
  return self->_edge;
}

- (UIButton)upButton
{
  return self->_upButton;
}

- (UIButton)downButton
{
  return self->_downButton;
}

- (BOOL)shouldInsetButtonsForIndex
{
  return self->_shouldInsetButtonsForIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downButton, 0);
  objc_storeStrong((id *)&self->_upButton, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_invocation, 0);
  objc_storeStrong((id *)&self->_dividerLine, 0);
}

@end
