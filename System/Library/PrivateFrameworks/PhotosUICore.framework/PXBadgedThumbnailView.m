@implementation PXBadgedThumbnailView

- (PXBadgedThumbnailView)initWithplaceholderImageView:(id)a3
{
  id v5;
  PXBadgedThumbnailView *v6;
  PXBadgedThumbnailView *v7;
  id *p_placeholderImageView;
  void *v9;
  PXCollageView *v10;
  PXCollageView *collageView;
  void *v12;
  UIImageView *v13;
  UIImageView *badgeView;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXBadgedThumbnailView;
  v6 = -[PXBadgedThumbnailView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    p_placeholderImageView = (id *)&v6->_placeholderImageView;
    objc_storeStrong((id *)&v6->_placeholderImageView, a3);
    objc_msgSend(*p_placeholderImageView, "setClipsToBounds:", 1);
    objc_msgSend(*p_placeholderImageView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 4.0);

    objc_msgSend(*p_placeholderImageView, "setAccessibilityIgnoresInvertColors:", 1);
    -[PXBadgedThumbnailView addSubview:](v7, "addSubview:", *p_placeholderImageView);
    v10 = objc_alloc_init(PXCollageView);
    collageView = v7->_collageView;
    v7->_collageView = v10;

    -[PXCollageView setSpacing:](v7->_collageView, "setSpacing:", 1.0);
    -[PXCollageView layer](v7->_collageView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", 4.0);

    -[PXBadgedThumbnailView addSubview:](v7, "addSubview:", v7->_collageView);
    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    badgeView = v7->_badgeView;
    v7->_badgeView = v13;

    -[UIImageView setContentMode:](v7->_badgeView, "setContentMode:", 0);
    -[PXBadgedThumbnailView addSubview:](v7, "addSubview:", v7->_badgeView);
    -[PXBadgedThumbnailView setShowBadge:](v7, "setShowBadge:", 0);
    -[PXBadgedThumbnailView setClipsToBounds:](v7, "setClipsToBounds:", 0);
  }

  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  objc_super v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v41.receiver = self;
  v41.super_class = (Class)PXBadgedThumbnailView;
  -[PXBadgedThumbnailView layoutSubviews](&v41, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");

  -[PXBadgedThumbnailView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PXBadgedThumbnailView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "layoutDirection");

  if (v13 == 1)
  {
    v42.origin.x = v5;
    v42.origin.y = v7;
    v42.size.width = v9;
    v42.size.height = v11;
    CGRectGetMaxX(v42);
    v43.origin.x = -6.0;
    v43.origin.y = -6.0;
    v43.size.width = 23.0;
    v43.size.height = 23.0;
    CGRectGetWidth(v43);
    v44.origin.x = -6.0;
    v44.origin.y = -6.0;
    v44.size.width = 23.0;
    v44.size.height = 23.0;
    CGRectGetMinX(v44);
  }
  PXRectRoundToPixel();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[PXBadgedThumbnailView placeholderImageView](self, "placeholderImageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  PXRectRoundToPixel();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[PXBadgedThumbnailView collageView](self, "collageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

  PXRectRoundToPixel();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[PXBadgedThumbnailView badgeView](self, "badgeView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

}

- (int64_t)numberOfItems
{
  void *v2;
  int64_t v3;

  -[PXBadgedThumbnailView collageView](self, "collageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfItems");

  return v3;
}

- (void)setNumberOfItems:(int64_t)a3
{
  void *v5;
  BOOL v6;
  _BOOL8 v7;
  uint64_t v8;
  id v9;

  -[PXBadgedThumbnailView collageView](self, "collageView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PXBadgedThumbnailView placeholderImageView](self, "placeholderImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberOfItems:", a3);
  v6 = a3 == 0;
  v7 = a3 != 0;
  v8 = v6;
  objc_msgSend(v9, "setHidden:", v8);
  objc_msgSend(v5, "setHidden:", v7);

}

- (void)setShowBadge:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = !a3;
  -[PXBadgedThumbnailView badgeView](self, "badgeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

  if (!v4)
  {
    -[PXBadgedThumbnailView badgeView](self, "badgeView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PXBadgedThumbnailView bringSubviewToFront:](self, "bringSubviewToFront:", v6);

  }
}

- (void)setBadgeImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXBadgedThumbnailView badgeView](self, "badgeView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (BOOL)shouldShowBadge
{
  void *v2;
  char v3;

  -[PXBadgedThumbnailView badgeView](self, "badgeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setImage:(id)a3 forItemAtIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[PXBadgedThumbnailView collageView](self, "collageView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:forItemAtIndex:", v6, a4);

}

- (id)imageViewForItemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PXBadgedThumbnailView collageView](self, "collageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_imageViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)setImageHidden:(BOOL)a3 forItemAtIndex:(unint64_t)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a3;
  -[PXBadgedThumbnailView imageViewForItemAtIndex:](self, "imageViewForItemAtIndex:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

}

- (UIImage)badgeImage
{
  return self->_badgeImage;
}

- (BOOL)shouldShowLikeBadge
{
  return self->_showBadge;
}

- (UIImageView)placeholderImageView
{
  return self->_placeholderImageView;
}

- (void)setPlaceholderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImageView, a3);
}

- (PXCollageView)collageView
{
  return self->_collageView;
}

- (void)setCollageView:(id)a3
{
  objc_storeStrong((id *)&self->_collageView, a3);
}

- (UIImageView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_collageView, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_badgeImage, 0);
}

@end
