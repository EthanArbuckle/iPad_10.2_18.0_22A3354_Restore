@implementation MapsThemeButton

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
  v9.super_class = (Class)MapsThemeButton;
  -[MapsThemeButton traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  if (v5
    && (v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton traitCollection](self, "traitCollection")),
        v6 == objc_msgSend(v3, "userInterfaceStyle")))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v5)
    if (v8)
      -[MapsThemeButton updateTheme](self, "updateTheme");
  }

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsThemeButton;
  -[MapsThemeButton didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton window](self, "window"));

  if (v3)
    -[MapsThemeButton updateTheme](self, "updateTheme");
}

- (void)updateTheme
{
  void *v3;
  id v4;

  -[MapsThemeButton _updateImage](self, "_updateImage");
  -[MapsThemeButton _updateTitleColor](self, "_updateTitleColor");
  -[MapsThemeButton _updateTintColor](self, "_updateTintColor");
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MapsTheme sharedTheme](MapsTheme, "sharedTheme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "disabledTitleColor"));
  -[MapsThemeButton setTitleColor:forState:](self, "setTitleColor:forState:", v3, 2);

}

- (void)setImageProvider:(id)a3
{
  id v4;
  id imageProvider;

  if (self->_imageProvider != a3)
  {
    v4 = objc_retainBlock(a3);
    imageProvider = self->_imageProvider;
    self->_imageProvider = v4;

    -[MapsThemeButton _updateImage](self, "_updateImage");
  }
}

- (void)setTitleColorProvider:(id)a3
{
  id v4;
  id titleColorProvider;

  if (self->_titleColorProvider != a3)
  {
    v4 = objc_retainBlock(a3);
    titleColorProvider = self->_titleColorProvider;
    self->_titleColorProvider = v4;

    -[MapsThemeButton _updateTitleColor](self, "_updateTitleColor");
  }
}

- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsThemeButton;
  -[MapsThemeButton setAttributedTitle:forState:](&v5, "setAttributedTitle:forState:", a3, a4);
  -[MapsThemeButton _updateTitleColor](self, "_updateTitleColor");
}

- (void)setTintColorProvider:(id)a3
{
  id v4;
  id tintColorProvider;

  if (self->_tintColorProvider != a3)
  {
    v4 = objc_retainBlock(a3);
    tintColorProvider = self->_tintColorProvider;
    self->_tintColorProvider = v4;

    -[MapsThemeButton _updateTintColor](self, "_updateTintColor");
  }
}

- (void)_updateImage
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t (**v7)(id, void *);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton imageProvider](self, "imageProvider"));

  if (v3)
  {
    v7 = (uint64_t (**)(id, void *))objc_claimAutoreleasedReturnValue(-[MapsThemeButton imageProvider](self, "imageProvider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme sharedTheme](MapsTheme, "sharedTheme"));
    v5 = v7[2](v7, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[MapsThemeButton setImage:forState:](self, "setImage:forState:", v6, 0);

  }
}

- (void)_updateTitleColor
{
  void *v3;
  uint64_t (**v4)(_QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleColorProvider](self, "titleColorProvider"));

  if (v3)
  {
    v4 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleColorProvider](self, "titleColorProvider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme sharedTheme](MapsTheme, "sharedTheme"));
    v6 = ((uint64_t (**)(_QWORD, void *))v4)[2](v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    -[MapsThemeButton setTitleColor:forState:](self, "setTitleColor:forState:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton attributedTitleForState:](self, "attributedTitleForState:", 0));
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "length");
      v11 = objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v11, "removeAttribute:range:", NSForegroundColorAttributeName, 0, v10);
      objc_msgSend(v11, "addAttribute:value:range:", NSForegroundColorAttributeName, v7, 0, v10);
      v12 = objc_msgSend(v11, "copy");
      v13.receiver = self;
      v13.super_class = (Class)MapsThemeButton;
      -[MapsThemeButton setAttributedTitle:forState:](&v13, "setAttributedTitle:forState:", v12, 0);

    }
  }
}

- (void)_updateTintColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t (**v7)(id, void *);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton tintColorProvider](self, "tintColorProvider"));

  if (v3)
  {
    v7 = (uint64_t (**)(id, void *))objc_claimAutoreleasedReturnValue(-[MapsThemeButton tintColorProvider](self, "tintColorProvider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme sharedTheme](MapsTheme, "sharedTheme"));
    v5 = v7[2](v7, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[MapsThemeButton setTintColor:](self, "setTintColor:", v6);

  }
}

- (id)imageProvider
{
  return self->_imageProvider;
}

- (id)titleColorProvider
{
  return self->_titleColorProvider;
}

- (id)tintColorProvider
{
  return self->_tintColorProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tintColorProvider, 0);
  objc_storeStrong(&self->_titleColorProvider, 0);
  objc_storeStrong(&self->_imageProvider, 0);
}

@end
