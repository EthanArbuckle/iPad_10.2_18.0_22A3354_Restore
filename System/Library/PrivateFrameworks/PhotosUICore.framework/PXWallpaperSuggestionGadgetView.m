@implementation PXWallpaperSuggestionGadgetView

- (PXWallpaperSuggestionGadgetView)initWithFrame:(CGRect)a3
{
  PXWallpaperSuggestionGadgetView *v3;
  PXWallpaperSuggestionView *v4;
  PXWallpaperSuggestionView *wallpaperView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXWallpaperSuggestionGadgetView;
  v3 = -[PXWallpaperSuggestionGadgetView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PXWallpaperSuggestionView);
    wallpaperView = v3->_wallpaperView;
    v3->_wallpaperView = v4;

    -[PXWallpaperSuggestionGadgetView contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_wallpaperView);

  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXWallpaperSuggestionGadgetView;
  -[PXWallpaperSuggestionGadgetView prepareForReuse](&v3, sel_prepareForReuse);
  -[PXWallpaperSuggestionGadgetView setAsset:](self, "setAsset:", 0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXWallpaperSuggestionGadgetView;
  -[PXWallpaperSuggestionGadgetView layoutSubviews](&v12, sel_layoutSubviews);
  -[PXWallpaperSuggestionGadgetView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXWallpaperSuggestionGadgetView wallpaperView](self, "wallpaperView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)setAsset:(id)a3
{
  id v4;
  id v5;

  if (self->_asset != a3)
  {
    self->_asset = (PXDisplayAsset *)a3;
    v4 = a3;
    -[PXWallpaperSuggestionGadgetView wallpaperView](self, "wallpaperView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAsset:", v4);

  }
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (PXWallpaperSuggestionView)wallpaperView
{
  return self->_wallpaperView;
}

- (void)setWallpaperView:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperView, 0);
}

@end
