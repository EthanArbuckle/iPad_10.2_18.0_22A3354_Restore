@implementation PXPhotosGridRecentlyDeletedDecorationView

- (PXPhotosGridRecentlyDeletedDecorationView)initWithFrame:(CGRect)a3
{
  PXPhotosGridRecentlyDeletedDecorationView *v3;
  PXTextBannerView *v4;
  PXTextBannerView *v5;
  PXTextBannerView *textBannerView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPhotosGridRecentlyDeletedDecorationView;
  v3 = -[PXPhotosGridRecentlyDeletedDecorationView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [PXTextBannerView alloc];
    v5 = -[PXTextBannerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PXTextBannerView setTextAlignment:](v5, "setTextAlignment:", 1);
    -[PXPhotosGridRecentlyDeletedDecorationView addSubview:](v3, "addSubview:", v5);
    textBannerView = v3->_textBannerView;
    v3->_textBannerView = v5;

  }
  return v3;
}

- (void)updateTextBanner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PXPhotosGridRecentlyDeletedDecorationView textBannerView](self, "textBannerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridRecentlyDeletedDecorationView userData](self, "userData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 0;
    PXPhotoKitLocalizedMessageForRecentlyDeletedDaysRemainingAsset(v5, &v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", v6);
    objc_msgSend(v3, "setDestructiveText:", v7);

  }
  else
  {
    objc_msgSend(v3, "setText:", 0);
  }

}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  -[PXPhotosGridRecentlyDeletedDecorationView bounds](self, "bounds");
  -[PXTextBannerView setFrame:](self->_textBannerView, "setFrame:", 0.0, CGRectGetHeight(v4) + -24.0, v4.size.width, 24.0);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosGridRecentlyDeletedDecorationView;
  -[PXPhotosGridRecentlyDeletedDecorationView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)setUserData:(id)a3
{
  PXAssetReference *v5;
  PXAssetReference *v6;

  v5 = (PXAssetReference *)a3;
  if (self->_userData != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userData, a3);
    -[PXPhotosGridRecentlyDeletedDecorationView updateTextBanner](self, "updateTextBanner");
    v5 = v6;
  }

}

- (unint64_t)decorationOptions
{
  return self->_decorationOptions;
}

- (void)setDecorationOptions:(unint64_t)a3
{
  self->_decorationOptions = a3;
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXAssetReference)userData
{
  return self->_userData;
}

- (PXTextBannerView)textBannerView
{
  return self->_textBannerView;
}

- (void)setTextBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_textBannerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textBannerView, 0);
  objc_storeStrong((id *)&self->_userData, 0);
}

@end
