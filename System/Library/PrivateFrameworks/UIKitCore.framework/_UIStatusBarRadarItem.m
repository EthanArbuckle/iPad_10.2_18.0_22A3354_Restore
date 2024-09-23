@implementation _UIStatusBarRadarItem

- (id)indicatorEntryKey
{
  return CFSTR("radarEntry");
}

- (id)imageForUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "radarEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)MEMORY[0x1E0CB34D0];
  _UIKitResourceBundlePath(CFSTR("CarPlayArtwork.bundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "styleAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("Black_Radar"), v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v12, "size");
    _UIGraphicsBeginImageContextWithOptions(0, 0, v13, v14, 1.0);
    _UIGraphicsGetImageFromCurrentImageContext(0);
    v15 = objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    v12 = (void *)v15;
  }
  objc_msgSend(v12, "imageWithRenderingMode:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (_UIStatusBarRadarView)radarItemView
{
  _UIStatusBarRadarView *radarItemView;

  radarItemView = self->_radarItemView;
  if (!radarItemView)
  {
    -[_UIStatusBarRadarItem _create_radarItemView](self, "_create_radarItemView");
    radarItemView = self->_radarItemView;
  }
  return radarItemView;
}

- (void)_create_radarItemView
{
  _UIStatusBarRadarView *v3;
  _UIStatusBarRadarView *v4;
  _UIStatusBarRadarView *radarItemView;

  v3 = [_UIStatusBarRadarView alloc];
  v4 = -[_UIStatusBarRadarView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  radarItemView = self->_radarItemView;
  self->_radarItemView = v4;

}

- (void)setRadarItemView:(id)a3
{
  objc_storeStrong((id *)&self->_radarItemView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarItemView, 0);
}

@end
