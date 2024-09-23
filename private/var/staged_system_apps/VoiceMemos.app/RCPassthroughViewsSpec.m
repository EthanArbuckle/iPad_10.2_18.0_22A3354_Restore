@implementation RCPassthroughViewsSpec

+ (id)passthroughViewsSpecWithTopLevelView:(id)a3 includeTopLevelView:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  RCPassthroughViewsSpec *v6;

  v4 = a4;
  v5 = a3;
  v6 = objc_opt_new(RCPassthroughViewsSpec);
  -[RCPassthroughViewsSpec setTopLevelView:](v6, "setTopLevelView:", v5);

  -[RCPassthroughViewsSpec setIncludeTopLevelView:](v6, "setIncludeTopLevelView:", v4);
  return v6;
}

- (UIView)topLevelView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_topLevelView);
}

- (void)setTopLevelView:(id)a3
{
  objc_storeWeak((id *)&self->_topLevelView, a3);
}

- (BOOL)includeTopLevelView
{
  return self->_includeTopLevelView;
}

- (void)setIncludeTopLevelView:(BOOL)a3
{
  self->_includeTopLevelView = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_topLevelView);
}

@end
