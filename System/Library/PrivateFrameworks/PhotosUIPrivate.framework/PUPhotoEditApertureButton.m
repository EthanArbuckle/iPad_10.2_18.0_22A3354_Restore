@implementation PUPhotoEditApertureButton

- (PUPhotoEditApertureButton)initWithFrame:(CGRect)a3
{
  PUPhotoEditApertureButton *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPhotoEditApertureButton;
  v3 = -[PUPhotoEditApertureButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v3);
    -[PUPhotoEditApertureButton addInteraction:](v3, "addInteraction:", v4);
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoEditingToolbarButtonSelectedColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditApertureButton setTintColor:](v3, "setTintColor:", v6);

  }
  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditApertureButton _pointerRect](self, "_pointerRect");
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:cornerRadius:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGRect)_pointerRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  PXEdgeInsetsMake();
  -[PUPhotoEditApertureButton tappableEdgeInsets](self, "tappableEdgeInsets");
  -[PUPhotoEditApertureButton frame](self, "frame");
  PXEdgeInsetsInsetRect();
  PXEdgeInsetsInsetRect();
  v7 = v6 + v5 * 0.5 + -18.5;
  v8 = 37.0;
  result.size.height = v8;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v3;
  return result;
}

@end
