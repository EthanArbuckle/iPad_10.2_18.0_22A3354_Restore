@implementation SBHStackConfigurationBackgroundDimmingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SBHStackConfigurationBackgroundDimmingView *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBHStackConfigurationBackgroundDimmingView;
  -[SBHStackConfigurationBackgroundDimmingView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  v8 = (SBHStackConfigurationBackgroundDimmingView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    if (objc_msgSend(v7, "type") == 9)
    {
      -[SBHStackConfigurationBackgroundDimmingView iconListView](self, "iconListView");
      v8 = (SBHStackConfigurationBackgroundDimmingView *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = self;
    }
  }

  return v8;
}

- (SBIconListView)iconListView
{
  return (SBIconListView *)objc_loadWeakRetained((id *)&self->_iconListView);
}

- (void)setIconListView:(id)a3
{
  objc_storeWeak((id *)&self->_iconListView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconListView);
}

@end
