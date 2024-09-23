@implementation PXAssetUIImageViewTile

- (PXAssetUIImageViewTile)init
{
  PXAssetUIImageViewTile *v2;
  uint64_t v3;
  UIColor *placeholderColor;
  CGSize v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXAssetUIImageViewTile;
  v2 = -[PXAssetUIImageViewTile init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v3 = objc_claimAutoreleasedReturnValue();
    placeholderColor = v2->_placeholderColor;
    v2->_placeholderColor = (UIColor *)v3;

    v5 = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
    v2->__desiredContentsRect.origin = *(CGPoint *)off_1E50B86D0;
    v2->__desiredContentsRect.size = v5;
    *(_WORD *)&v2->_hasPlaceholder = 0;
  }
  return v2;
}

- (UIView)view
{
  UIView *contentView;

  contentView = self->_contentView;
  if (!contentView)
  {
    -[PXAssetUIImageViewTile _updateContentView](self, "_updateContentView");
    contentView = self->_contentView;
  }
  return contentView;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[PXAssetUIImageViewTile imageRequester](self, "imageRequester");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setPlaceholderColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_placeholderColor != v5)
  {
    objc_storeStrong((id *)&self->_placeholderColor, a3);
    if (self->_contentView)
      -[PXAssetUIImageViewTile _updateContentView](self, "_updateContentView");
  }

}

- (void)setShouldAllowFocus:(BOOL)a3
{
  if (self->_shouldAllowFocus != a3)
  {
    self->_shouldAllowFocus = a3;
    if (self->_contentView)
      -[PXAssetUIImageViewTile _updateContentView](self, "_updateContentView");
  }
}

- (void)_updateContentView
{
  PXFocusableUIImageView *imageView;
  PXFocusableUIImageView *v4;
  PXFocusableUIImageView *v5;
  PXFocusableUIImageView *v6;
  void *v7;
  uint64_t v8;
  PXFocusableUIImageView *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = [PXFocusableUIImageView alloc];
    v5 = -[PXFocusableUIImageView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_imageView;
    self->_imageView = v5;

    -[PXFocusableUIImageView setDrawsFocusRing:](self->_imageView, "setDrawsFocusRing:", 1);
    -[PXFocusableUIImageView layer](self->_imageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

    imageView = self->_imageView;
  }
  -[PXFocusableUIImageView setOpaque:](imageView, "setOpaque:", 1);
  -[PXFocusableUIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
  if (self->_hasPlaceholder)
    v8 = 1;
  else
    v8 = 2;
  -[PXFocusableUIImageView setContentMode:](self->_imageView, "setContentMode:", v8);
  v9 = self->_imageView;
  -[PXAssetUIImageViewTile placeholderColor](self, "placeholderColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFocusableUIImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

  -[PXAssetUIImageViewTile cornerRadius](self, "cornerRadius");
  if (v11 == 0.0)
  {
    -[PXFocusableUIImageView layer](self->_imageView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerRadius:", 0.0);
  }
  else
  {
    -[PXAssetUIImageViewTile cornerRadius](self, "cornerRadius");
    v13 = v12;
    -[PXFocusableUIImageView layer](self->_imageView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", v13);

    v15 = *MEMORY[0x1E0CD2A68];
    -[PXFocusableUIImageView layer](self->_imageView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerCurve:", v15);

    -[PXFocusableUIImageView layer](self->_imageView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsGroupOpacity:", 0);
  }

  if (self->_shouldAllowFocus)
  {
    -[PXFocusableUIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 0);
    -[PXFocusableUIImageView setUserInteractionEnabled:](self->_imageView, "setUserInteractionEnabled:", 1);
  }
  -[PXAssetUIImageViewTile _updateImageView](self, "_updateImageView");
  objc_storeStrong((id *)&self->_contentView, self->_imageView);
}

- (void)becomeReusable
{
  void *v3;

  -[PXFocusableUIImageView setReusable:](self->_imageView, "setReusable:", 1);
  -[PXAssetUIImageViewTile view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[PXAssetUIImageViewTile setImageRequester:](self, "setImageRequester:", 0);
  -[PXAssetUIImageViewTile _setContentSize:](self, "_setContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[PXAssetUIImageViewTile _setDesiredContentsRect:](self, "_setDesiredContentsRect:", *(double *)off_1E50B86D0, *((double *)off_1E50B86D0 + 1), *((double *)off_1E50B86D0 + 2), *((double *)off_1E50B86D0 + 3));
}

- (void)prepareForReuse
{
  id v3;

  -[PXFocusableUIImageView setReusable:](self->_imageView, "setReusable:", 0);
  -[PXAssetUIImageViewTile view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  -[PXAssetUIImageViewTile _setContentSize:](self, "_setContentSize:", a3->contentSize.width, a3->contentSize.height);
  -[PXAssetUIImageViewTile _setDesiredContentsRect:](self, "_setDesiredContentsRect:", a3->contentsRect.origin.x, a3->contentsRect.origin.y, a3->contentsRect.size.width, a3->contentsRect.size.height);
  -[PXAssetUIImageViewTile _updateImageRequester](self, "_updateImageRequester");
}

- (void)setImageRequester:(id)a3
{
  PXImageRequester *v5;
  PXImageRequester *imageRequester;
  PXImageRequester *v7;

  v5 = (PXImageRequester *)a3;
  imageRequester = self->_imageRequester;
  v7 = v5;
  if (imageRequester != v5)
  {
    -[PXImageRequester unregisterChangeObserver:context:](imageRequester, "unregisterChangeObserver:context:", self, PXImageRequesterObserverContext_167483);
    objc_storeStrong((id *)&self->_imageRequester, a3);
    -[PXAssetUIImageViewTile _updateImageRequester](self, "_updateImageRequester");
    -[PXAssetUIImageViewTile _updateImageView](self, "_updateImageView");
    -[PXImageRequester registerChangeObserver:context:](v7, "registerChangeObserver:context:", self, PXImageRequesterObserverContext_167483);
  }

}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PXAssetUIImageViewTile _updateContentView](self, "_updateContentView");
  }
}

- (void)_setDesiredContentsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->__desiredContentsRect, a3))
  {
    self->__desiredContentsRect.origin.x = x;
    self->__desiredContentsRect.origin.y = y;
    self->__desiredContentsRect.size.width = width;
    self->__desiredContentsRect.size.height = height;
  }
}

- (void)_setContentSize:(CGSize)a3
{
  if (self->__contentSize.width != a3.width || self->__contentSize.height != a3.height)
    self->__contentSize = a3;
}

- (void)_updateImageRequester
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[12];

  -[PXAssetUIImageViewTile _contentSize](self, "_contentSize");
  v4 = v3;
  v6 = v5;
  -[PXAssetUIImageViewTile _desiredContentsRect](self, "_desiredContentsRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PXFocusableUIImageView bounds](self->_imageView, "bounds");
  v16 = v15;
  v18 = v17;
  -[PXAssetUIImageViewTile imageRequester](self, "imageRequester");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __47__PXAssetUIImageViewTile__updateImageRequester__block_invoke;
  v20[3] = &__block_descriptor_96_e35_v16__0___PXMutableImageRequester__8l;
  v20[4] = v4;
  v20[5] = v6;
  v20[6] = v8;
  v20[7] = v10;
  v20[8] = v12;
  v20[9] = v14;
  v20[10] = v16;
  v20[11] = v18;
  objc_msgSend(v19, "performChanges:", v20);

}

- (void)_updateImageView
{
  void *v3;
  void *v4;
  PXFocusableUIImageView *imageView;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  CGRect v25;
  CGRect v26;

  -[PXAssetUIImageViewTile imageRequester](self, "imageRequester");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[PXFocusableUIImageView image](self->_imageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    imageView = self->_imageView;
    objc_msgSend(v24, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFocusableUIImageView setImage:](imageView, "setImage:", v6);

  }
  -[PXFocusableUIImageView layer](self->_imageView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    v20 = *(double *)off_1E50B86D0;
    v21 = *((double *)off_1E50B86D0 + 1);
    v22 = *((double *)off_1E50B86D0 + 2);
    v23 = *((double *)off_1E50B86D0 + 3);
    goto LABEL_7;
  }
  objc_msgSend(v24, "contentsRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "contentsRect");
  v26.origin.x = v16;
  v26.origin.y = v17;
  v26.size.width = v18;
  v26.size.height = v19;
  v25.origin.x = v9;
  v25.origin.y = v11;
  v25.size.width = v13;
  v25.size.height = v15;
  if (!CGRectEqualToRect(v25, v26))
  {
    objc_msgSend(v24, "contentsRect");
LABEL_7:
    objc_msgSend(v7, "setContentsRect:", v20, v21, v22, v23);
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v5;
  id v7;
  id v8;

  if ((void *)PXImageRequesterObserverContext_167483 == a5)
  {
    v5 = a4;
    v7 = a3;
    -[PXAssetUIImageViewTile imageRequester](self, "imageRequester");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if ((v5 & 0x84) != 0 && v8 == v7)
      -[PXAssetUIImageViewTile imageDidChange](self, "imageDidChange");
  }
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImage, a3);
}

- (BOOL)shouldAllowFocus
{
  return self->_shouldAllowFocus;
}

- (CGSize)_contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->__contentSize.width;
  height = self->__contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)_desiredContentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__desiredContentsRect.origin.x;
  y = self->__desiredContentsRect.origin.y;
  width = self->__desiredContentsRect.size.width;
  height = self->__desiredContentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

void __47__PXAssetUIImageViewTile__updateImageRequester__block_invoke(double *a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "setContentSize:", v3, v4);
  objc_msgSend(v5, "setDesiredContentsRect:", a1[6], a1[7], a1[8], a1[9]);
  objc_msgSend(v5, "setViewportSize:", a1[10], a1[11]);

}

@end
