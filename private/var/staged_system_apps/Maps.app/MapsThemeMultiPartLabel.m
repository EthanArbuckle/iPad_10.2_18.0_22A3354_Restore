@implementation MapsThemeMultiPartLabel

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
  v9.super_class = (Class)MapsThemeMultiPartLabel;
  -[MapsThemeMultiPartLabel traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  if (v5
    && (v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel traitCollection](self, "traitCollection")),
        v6 == objc_msgSend(v3, "userInterfaceStyle")))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v5)
    if (v8)
      -[MapsThemeMultiPartLabel updateTheme](self, "updateTheme");
  }

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsThemeMultiPartLabel;
  -[MapsThemeMultiPartLabel didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel window](self, "window"));

  if (v3)
    -[MapsThemeMultiPartLabel updateTheme](self, "updateTheme");
}

- (void)updateTheme
{
  -[MapsThemeMultiPartLabel _updateTextColor](self, "_updateTextColor");
}

- (void)setTextColorProvider:(id)a3
{
  id v4;
  id textColorProvider;

  if (self->_textColorProvider != a3)
  {
    v4 = objc_msgSend(a3, "copy");
    textColorProvider = self->_textColorProvider;
    self->_textColorProvider = v4;

    -[MapsThemeMultiPartLabel _updateTextColor](self, "_updateTextColor");
  }
}

- (void)_updateTextColor
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t (**v9)(id, void *);

  v3 = objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel textColorProvider](self, "textColorProvider"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel window](self, "window"));

    if (v5)
    {
      v9 = (uint64_t (**)(id, void *))objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel textColorProvider](self, "textColorProvider"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel theme](self, "theme"));
      v7 = v9[2](v9, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      -[MapsThemeMultiPartLabel setTextColor:](self, "setTextColor:", v8);

    }
  }
}

- (id)textColorProvider
{
  return self->_textColorProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_textColorProvider, 0);
}

@end
