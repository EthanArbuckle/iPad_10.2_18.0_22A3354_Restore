@implementation SBFluidSwitcherContentView

- (void)setPassesTouchesThrough:(BOOL)a3
{
  self->_passesTouchesThrough = a3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBFluidSwitcherContentView *v5;
  SBFluidSwitcherContentView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherContentView;
  -[SBFluidSwitcherContentView hitTest:withEvent:](&v8, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBFluidSwitcherContentView *)objc_claimAutoreleasedReturnValue();
  if (-[SBFluidSwitcherContentView passesTouchesThrough](self, "passesTouchesThrough") && v5 == self)
    v6 = 0;
  else
    v6 = v5;

  return v6;
}

- (unint64_t)switcherLayoutElementType
{
  return 5;
}

- (CGPoint)contentOffset
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[SBFluidSwitcherContentView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switcherScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGSize)contentSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SBFluidSwitcherContentView delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switcherScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)visibleSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[SBFluidSwitcherContentView bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[SBFluidSwitcherContentView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultFocusItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFluidSwitcherContentView;
    -[SBFluidSwitcherContentView preferredFocusEnvironments](&v8, sel_preferredFocusEnvironments);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (BOOL)passesTouchesThrough
{
  return self->_passesTouchesThrough;
}

- (SBFluidSwitcherContentViewDelegate)delegate
{
  return (SBFluidSwitcherContentViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
