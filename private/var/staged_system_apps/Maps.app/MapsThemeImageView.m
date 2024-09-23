@implementation MapsThemeImageView

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
  v9.super_class = (Class)MapsThemeImageView;
  -[MapsThemeImageView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v5);
  if (v5
    && (v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeImageView traitCollection](self, "traitCollection")),
        v6 == objc_msgSend(v3, "userInterfaceStyle")))
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeImageView traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    if (v5)
    if (v8)
      -[MapsThemeImageView updateTheme](self, "updateTheme");
  }

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsThemeImageView;
  -[MapsThemeImageView didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeImageView window](self, "window"));

  if (v3)
    -[MapsThemeImageView updateTheme](self, "updateTheme");
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

    -[MapsThemeImageView _updateImage](self, "_updateImage");
  }
}

- (void)_updateImage
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t (**v7)(id, void *);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeImageView imageProvider](self, "imageProvider"));

  if (v3)
  {
    v7 = (uint64_t (**)(id, void *))objc_claimAutoreleasedReturnValue(-[MapsThemeImageView imageProvider](self, "imageProvider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme sharedTheme](MapsTheme, "sharedTheme"));
    v5 = v7[2](v7, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[MapsThemeImageView setImage:](self, "setImage:", v6);

  }
}

- (id)imageProvider
{
  return self->_imageProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageProvider, 0);
}

@end
