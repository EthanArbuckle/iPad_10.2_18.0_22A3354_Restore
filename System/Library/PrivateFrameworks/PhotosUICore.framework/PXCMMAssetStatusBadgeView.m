@implementation PXCMMAssetStatusBadgeView

+ (CGSize)preferredSize
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_circularGlyphViewWithName:backgroundColor:", CFSTR("checkmark.circle"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)becomeReusable
{
  -[PXCMMAssetStatusBadgeView setHidden:](self, "setHidden:", 1);
  -[PXCMMAssetStatusBadgeView setStatus:](self, "setStatus:", 0);
  -[PXCMMAssetStatusBadgeView _updateImageViewIfNeeded](self, "_updateImageViewIfNeeded");
}

- (void)prepareForReuse
{
  -[PXCMMAssetStatusBadgeView setHidden:](self, "setHidden:", 0);
  -[PXCMMAssetStatusBadgeView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  -[PXCMMAssetStatusBadgeView setStatus:](self, "setStatus:", objc_msgSend(a4, "status", a3));
  -[PXCMMAssetStatusBadgeView _updateImageViewIfNeeded](self, "_updateImageViewIfNeeded");
}

- (void)setStatus:(int64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    -[PXCMMAssetStatusBadgeView _invalidateImageView](self, "_invalidateImageView");
  }
}

- (void)_invalidateImageView
{
  self->_needsUpdateFlags.imageView = 1;
}

- (void)_updateImageViewIfNeeded
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_needsUpdateFlags.imageView)
  {
    self->_needsUpdateFlags.imageView = 0;
    v3 = -[PXCMMAssetStatusBadgeView status](self, "status");
    if (v3 < 2)
    {
      -[PXCMMAssetStatusBadgeView glyphView](self, "glyphView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      -[PXCMMAssetStatusBadgeView setGlyphView:](self, "setGlyphView:", 0);
      return;
    }
    if (v3 == -1)
    {
      -[PXCMMAssetStatusBadgeView glyphView](self, "glyphView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

      -[PXCMMAssetStatusBadgeView setGlyphView:](self, "setGlyphView:", 0);
      v5 = (void *)MEMORY[0x1E0DC3F10];
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CFSTR("exclamationmark.circle");
      goto LABEL_9;
    }
    if (v3 == 2)
    {
      -[PXCMMAssetStatusBadgeView glyphView](self, "glyphView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeFromSuperview");

      -[PXCMMAssetStatusBadgeView setGlyphView:](self, "setGlyphView:", 0);
      v5 = (void *)MEMORY[0x1E0DC3F10];
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = CFSTR("checkmark.circle");
LABEL_9:
      objc_msgSend(v5, "px_circularGlyphViewWithName:backgroundColor:", v7, v6);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      -[PXCMMAssetStatusBadgeView addSubview:](self, "addSubview:", v10);
      -[PXCMMAssetStatusBadgeView setGlyphView:](self, "setGlyphView:", v10);

    }
  }
}

- (int64_t)status
{
  return self->_status;
}

- (UIView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphView, 0);
}

@end
