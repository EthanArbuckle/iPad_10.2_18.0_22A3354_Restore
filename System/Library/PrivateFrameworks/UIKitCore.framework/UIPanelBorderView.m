@implementation UIPanelBorderView

- (UIPanelBorderView)initWithFrame:(CGRect)a3
{
  UIPanelBorderView *v3;
  UIPanelBorderView *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIPanelBorderView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsEdgeAntialiasing:", 1);

    -[UIView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHitTestsAsOpaque:", 1);

  }
  return v4;
}

- (void)setStatusBarAvoidance:(int64_t)a3
{
  if (self->_statusBarAvoidance != a3)
  {
    self->_statusBarAvoidance = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRenderAsShadow:(BOOL)a3
{
  uint64_t v4;
  uint64_t *v5;
  id v6;

  self->_renderAsShadow = a3;
  if (a3)
  {
    if (qword_1ECD7A508 != -1)
      dispatch_once(&qword_1ECD7A508, &__block_literal_global_136);
    -[UIView traitCollection](self, "traitCollection");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "userInterfaceStyle");
    v5 = &_MergedGlobals_3_4;
    if (v4 == 2)
      v5 = &qword_1ECD7A500;
    -[UIView setBackgroundColor:](self, "setBackgroundColor:", *v5);

  }
}

void __39__UIPanelBorderView_setRenderAsShadow___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_3_4;
  _MergedGlobals_3_4 = v0;

  +[UIColor opaqueSeparatorColor](UIColor, "opaqueSeparatorColor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD7A500;
  qword_1ECD7A500 = v2;

}

- (void)layoutSubviews
{
  int64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double v13;
  UIPanelBorderReplicatingView *v14;
  _UIBackdropView *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)UIPanelBorderView;
  -[UIView layoutSubviews](&v18, sel_layoutSubviews);
  v3 = -[UIPanelBorderView statusBarAvoidance](self, "statusBarAvoidance");
  -[UIPanelBorderView replicatingView](self, "replicatingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 1)
  {

    if (!v5)
    {
      -[UIView bounds](self, "bounds");
      v7 = v6;
      -[UIView window](self, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __UIStatusBarManagerForWindow(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "statusBarHeight");
      v11 = v10;

      v12 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
      v13 = -1.0;
      if (v12)
        v13 = 1.0;
      v14 = -[UIPanelBorderReplicatingView initWithFrame:replicaOffset:]([UIPanelBorderReplicatingView alloc], "initWithFrame:replicaOffset:", v7 * v13, 0.0, v7, v11, -(v13 * v7));
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIPanelBorderView setReplicatingView:](self, "setReplicatingView:", v14);
      v15 = -[_UIBackdropView initWithPrivateStyle:]([_UIBackdropView alloc], "initWithPrivateStyle:", -4);
      -[UIPanelBorderView _cachedBackdropGroupName](self, "_cachedBackdropGroupName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIBackdropView setGroupName:](v15, "setGroupName:", v16);

      -[UIView addSubview:](v14, "addSubview:", v15);
      -[UIView addSubview:](self, "addSubview:", v14);

    }
  }
  else
  {

    if (v5)
    {
      -[UIPanelBorderView replicatingView](self, "replicatingView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeFromSuperview");

      -[UIPanelBorderView setReplicatingView:](self, "setReplicatingView:", 0);
    }
  }
}

- (id)_cachedBackdropGroupName
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;

  -[UIPanelBorderView backdropGroupName](self, "backdropGroupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%p"), v6, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIPanelBorderView setBackdropGroupName:](self, "setBackdropGroupName:", v3);
  }
  return v3;
}

- (int64_t)statusBarAvoidance
{
  return self->_statusBarAvoidance;
}

- (BOOL)isDraggable
{
  return self->_draggable;
}

- (void)setDraggable:(BOOL)a3
{
  self->_draggable = a3;
}

- (BOOL)renderAsShadow
{
  return self->_renderAsShadow;
}

- (UIPanelBorderReplicatingView)replicatingView
{
  return self->_replicatingView;
}

- (void)setReplicatingView:(id)a3
{
  objc_storeStrong((id *)&self->_replicatingView, a3);
}

- (BOOL)observesTime
{
  return self->_observesTime;
}

- (void)setObservesTime:(BOOL)a3
{
  self->_observesTime = a3;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (void)setBackdropGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_backdropGroupName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_replicatingView, 0);
}

@end
