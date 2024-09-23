@implementation MapsThemeLabel

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
  v9.super_class = (Class)MapsThemeLabel;
  -[MapsThemeLabel traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  if (v5
    && (v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel traitCollection](self, "traitCollection")),
        v6 == objc_msgSend(v3, "userInterfaceStyle")))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v5)
    if (v8)
      -[MapsThemeLabel updateTheme](self, "updateTheme");
  }

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsThemeLabel;
  -[MapsThemeLabel didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel window](self, "window"));

  if (v3)
    -[MapsThemeLabel updateTheme](self, "updateTheme");
}

- (void)updateTheme
{
  -[MapsThemeLabel _updateAttributedText](self, "_updateAttributedText");
  -[MapsThemeLabel _updateTextColor](self, "_updateTextColor");
}

- (void)setAttributedTextProvider:(id)a3
{
  id v4;
  id attributedTextProvider;

  if (self->_attributedTextProvider != a3)
  {
    v4 = objc_retainBlock(a3);
    attributedTextProvider = self->_attributedTextProvider;
    self->_attributedTextProvider = v4;

    -[MapsThemeLabel _updateAttributedText](self, "_updateAttributedText");
  }
}

- (void)_updateAttributedText
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t (**v7)(id, void *);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel attributedTextProvider](self, "attributedTextProvider"));

  if (v3)
  {
    v7 = (uint64_t (**)(id, void *))objc_claimAutoreleasedReturnValue(-[MapsThemeLabel attributedTextProvider](self, "attributedTextProvider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme sharedTheme](MapsTheme, "sharedTheme"));
    v5 = v7[2](v7, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[MapsThemeLabel setAttributedText:](self, "setAttributedText:", v6);

  }
}

- (void)setTextColorProvider:(id)a3
{
  id v4;
  id textColorProvider;

  if (self->_textColorProvider != a3)
  {
    v4 = objc_retainBlock(a3);
    textColorProvider = self->_textColorProvider;
    self->_textColorProvider = v4;

    -[MapsThemeLabel _updateTextColor](self, "_updateTextColor");
  }
}

- (void)_updateTextColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t (**v7)(id, void *);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel textColorProvider](self, "textColorProvider"));

  if (v3)
  {
    v7 = (uint64_t (**)(id, void *))objc_claimAutoreleasedReturnValue(-[MapsThemeLabel textColorProvider](self, "textColorProvider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme sharedTheme](MapsTheme, "sharedTheme"));
    v5 = v7[2](v7, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[MapsThemeLabel setTextColor:](self, "setTextColor:", v6);

  }
}

- (id)attributedTextProvider
{
  return self->_attributedTextProvider;
}

- (id)textColorProvider
{
  return self->_textColorProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_textColorProvider, 0);
  objc_storeStrong(&self->_attributedTextProvider, 0);
}

@end
