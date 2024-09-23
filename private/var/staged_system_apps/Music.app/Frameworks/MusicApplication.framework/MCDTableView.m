@implementation MCDTableView

- (MCDTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  MCDTableView *v4;
  MCDTableView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCDTableView;
  v4 = -[MCDTableView initWithFrame:style:](&v7, "initWithFrame:style:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[MCDTableView setContentInsetAdjustmentBehavior:](v4, "setContentInsetAdjustmentBehavior:", 0);
    -[MCDTableView setRowHeight:](v5, "setRowHeight:", UITableViewAutomaticDimension);
    -[MCDTableView setEstimatedRowHeight:](v5, "setEstimatedRowHeight:", UITableViewAutomaticDimension);
    -[MCDTableView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("CPListTemplate"));
  }
  return v5;
}

- (BOOL)_shouldShowHeadersAndFooters
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)preferredFocusEnvironments
{
  void *v3;
  id v4;
  void *v5;
  objc_super v7;
  MCDTableView *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDTableView window](self, "window"));

  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)MCDTableView;
    v4 = -[MCDTableView preferredFocusEnvironments](&v7, "preferredFocusEnvironments");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v8 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  }
  return v5;
}

- (BOOL)shouldShowHeadersAndFooters
{
  return self->_shouldShowHeadersAndFooters;
}

- (void)setShouldShowHeadersAndFooters:(BOOL)a3
{
  self->_shouldShowHeadersAndFooters = a3;
}

@end
