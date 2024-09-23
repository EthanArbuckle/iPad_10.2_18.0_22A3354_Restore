@implementation MapsThemeTableView

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
  v9.super_class = (Class)MapsThemeTableView;
  -[MapsThemeTableView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  if (v5
    && (v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView traitCollection](self, "traitCollection")),
        v6 == objc_msgSend(v3, "userInterfaceStyle")))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v5)
    if (v8)
      -[MapsThemeTableView updateTheme](self, "updateTheme");
  }

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsThemeTableView;
  -[MapsThemeTableView didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView window](self, "window"));

  if (v3)
    -[MapsThemeTableView updateTheme](self, "updateTheme");
}

- (void)updateTheme
{
  -[MapsThemeTableView _updateSeparatorColor](self, "_updateSeparatorColor");
}

- (void)setCellSeparatorColorProvider:(id)a3
{
  id v4;
  id separatorColorProvider;

  if (self->_separatorColorProvider != a3)
  {
    v4 = objc_retainBlock(a3);
    separatorColorProvider = self->_separatorColorProvider;
    self->_separatorColorProvider = v4;

    -[MapsThemeTableView _updateSeparatorColor](self, "_updateSeparatorColor");
  }
}

- (void)_updateSeparatorColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t (**v7)(id, void *);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView separatorColorProvider](self, "separatorColorProvider"));

  if (v3)
  {
    v7 = (uint64_t (**)(id, void *))objc_claimAutoreleasedReturnValue(-[MapsThemeTableView separatorColorProvider](self, "separatorColorProvider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme sharedTheme](MapsTheme, "sharedTheme"));
    v5 = v7[2](v7, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[MapsThemeTableView setSeparatorColor:](self, "setSeparatorColor:", v6);

  }
}

- (id)separatorColorProvider
{
  return self->_separatorColorProvider;
}

- (void)setSeparatorColorProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_separatorColorProvider, 0);
}

@end
