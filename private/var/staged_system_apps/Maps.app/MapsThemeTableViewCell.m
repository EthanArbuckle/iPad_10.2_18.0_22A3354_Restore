@implementation MapsThemeTableViewCell

- (void)traitCollectionDidChange:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsThemeTableViewCell;
  -[MapsThemeTableViewCell traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  if (v5
    && (v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableViewCell traitCollection](self, "traitCollection")),
        v6 == objc_msgSend(v3, "userInterfaceStyle")))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableViewCell traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v5)
    if (v8)
      -[MapsThemeTableViewCell updateTheme](self, "updateTheme");
  }

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsThemeTableViewCell;
  -[MapsThemeTableViewCell didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableViewCell window](self, "window"));

  if (v3)
    -[MapsThemeTableViewCell updateTheme](self, "updateTheme");
}

- (MapsThemeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MapsThemeTableViewCell *v4;
  id v5;
  id v6;
  MapsThemeTableViewCell *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MapsThemeTableViewCell;
  v4 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc((Class)UIView);
    -[MapsThemeTableViewCell bounds](v4, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    -[MapsThemeTableViewCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v6);

    v7 = v4;
  }

  return v4;
}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableViewCell theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableViewCellHighlightedOverlayColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableViewCell selectedBackgroundView](self, "selectedBackgroundView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[MapsThemeTableViewCell _updateSelectedBackgroundColor](self, "_updateSelectedBackgroundColor");
}

- (void)setSelectedBackgroundColorProvider:(id)a3
{
  id v4;
  id selectedBackgroundColorProvider;

  if (self->_selectedBackgroundColorProvider != a3)
  {
    v4 = objc_retainBlock(a3);
    selectedBackgroundColorProvider = self->_selectedBackgroundColorProvider;
    self->_selectedBackgroundColorProvider = v4;

    -[MapsThemeTableViewCell _updateSelectedBackgroundColor](self, "_updateSelectedBackgroundColor");
  }
}

- (void)_updateSelectedBackgroundColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t (**v8)(id, void *);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableViewCell selectedBackgroundColorProvider](self, "selectedBackgroundColorProvider"));

  if (v3)
  {
    v8 = (uint64_t (**)(id, void *))objc_claimAutoreleasedReturnValue(-[MapsThemeTableViewCell selectedBackgroundColorProvider](self, "selectedBackgroundColorProvider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableViewCell theme](self, "theme"));
    v5 = v8[2](v8, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableViewCell selectedBackgroundView](self, "selectedBackgroundView"));
    objc_msgSend(v7, "setBackgroundColor:", v6);

  }
}

- (id)selectedBackgroundColorProvider
{
  return self->_selectedBackgroundColorProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectedBackgroundColorProvider, 0);
}

@end
