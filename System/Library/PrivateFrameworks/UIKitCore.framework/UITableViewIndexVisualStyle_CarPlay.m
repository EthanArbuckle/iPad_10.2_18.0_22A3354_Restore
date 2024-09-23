@implementation UITableViewIndexVisualStyle_CarPlay

- (UITableViewIndexVisualStyle_CarPlay)initWithTableViewIndex:(id)a3
{
  id v3;
  UITableViewIndexVisualStyle_CarPlay *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITableViewIndexVisualStyle_CarPlay;
  v3 = a3;
  v4 = -[UITableViewIndexVisualStyle_CarPlay init](&v7, sel_init);
  -[UITableViewIndexVisualStyle_CarPlay setTableViewIndex:](v4, "setTableViewIndex:", v3, v7.receiver, v7.super_class);

  objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 11.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewIndexVisualStyle_CarPlay setFont:](v4, "setFont:", v5);

  return v4;
}

- (double)indexWidth
{
  void *v2;
  uint64_t v3;
  double result;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  result = 15.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 30.0;
  return result;
}

- (double)_lineSpacingForCurrentIdiom
{
  void *v2;
  void *v3;
  double v4;

  -[UITableViewIndexVisualStyle_CarPlay tableViewIndex](self, "tableViewIndex");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v4 = 16.0;
  else
    v4 = 6.0;

  return v4;
}

- (double)minLineSpacing
{
  void *v3;
  double v4;
  double v5;

  -[UITableViewIndexVisualStyle_CarPlay _lineSpacingForCurrentIdiom](self, "_lineSpacingForCurrentIdiom");
  -[UITableViewIndexVisualStyle_CarPlay tableViewIndex](self, "tableViewIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale(v3);
  v5 = v4;

  return v5;
}

- (UITableViewIndex)tableViewIndex
{
  return (UITableViewIndex *)objc_loadWeakRetained((id *)&self->_tableViewIndex);
}

- (void)setTableViewIndex:(id)a3
{
  objc_storeWeak((id *)&self->_tableViewIndex, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_tableViewIndex);
}

@end
