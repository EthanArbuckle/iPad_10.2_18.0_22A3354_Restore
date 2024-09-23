@implementation PXPeopleBootstrapCollectionViewCell

- (PXPeopleBootstrapCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  PXPeopleBootstrapCollectionViewCell *v5;
  PXPeopleBootstrapCollectionViewCell *v6;
  void *v7;
  uint64_t v8;
  UIImageView *imageView;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UIView *selectedCheckmarkView;
  void *v15;
  void *v16;
  uint64_t v17;
  UIView *unselectedCheckmarkView;
  double *p_width;
  CGFloat v20;
  CGFloat v21;
  UIImageView *v22;
  UIImageView *badgeView;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  CGFloat MaxX;
  double v30;
  objc_super v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  width = a3.size.width;
  v32.receiver = self;
  v32.super_class = (Class)PXPeopleBootstrapCollectionViewCell;
  v5 = -[PXPeopleBootstrapCollectionViewCell initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    -[PXPeopleBootstrapCollectionViewCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_presentationStatus = 0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 0.0, 0.0, width, height);
    imageView = v6->_imageView;
    v6->_imageView = (UIImageView *)v8;

    -[UIImageView setContentMode:](v6->_imageView, "setContentMode:", 1);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v6->_imageView, "setAccessibilityIgnoresInvertColors:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v6->_imageView, "setBackgroundColor:", v10);

    objc_msgSend(v7, "addSubview:", v6->_imageView);
    v11 = (void *)MEMORY[0x1E0DC3F10];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_circularGlyphViewWithName:backgroundColor:", CFSTR("checkmark.circle"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    selectedCheckmarkView = v6->_selectedCheckmarkView;
    v6->_selectedCheckmarkView = (UIView *)v13;

    -[UIView setHidden:](v6->_selectedCheckmarkView, "setHidden:", 1);
    -[UIView setUserInteractionEnabled:](v6->_selectedCheckmarkView, "setUserInteractionEnabled:", 0);
    -[UIView setAccessibilityIgnoresInvertColors:](v6->_selectedCheckmarkView, "setAccessibilityIgnoresInvertColors:", 1);
    v15 = (void *)MEMORY[0x1E0DC3F10];
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_circularGlyphViewWithName:backgroundColor:", CFSTR("circle"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    unselectedCheckmarkView = v6->_unselectedCheckmarkView;
    v6->_unselectedCheckmarkView = (UIView *)v17;

    -[UIView setHidden:](v6->_unselectedCheckmarkView, "setHidden:", 1);
    -[UIView setUserInteractionEnabled:](v6->_unselectedCheckmarkView, "setUserInteractionEnabled:", 0);
    -[UIView setAccessibilityIgnoresInvertColors:](v6->_unselectedCheckmarkView, "setAccessibilityIgnoresInvertColors:", 1);
    -[UIView frame](v6->_selectedCheckmarkView, "frame");
    p_width = &v6->_checkmarkImageSize.width;
    v6->_checkmarkImageSize.width = v20;
    v6->_checkmarkImageSize.height = v21;
    objc_msgSend(v7, "addSubview:", v6->_selectedCheckmarkView);
    objc_msgSend(v7, "addSubview:", v6->_unselectedCheckmarkView);
    v22 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    badgeView = v6->_badgeView;
    v6->_badgeView = v22;

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setSymbolConfiguration:](v6->_badgeView, "setSymbolConfiguration:", v24);

    +[PXPeopleBootstrapCollectionViewCell cloudBadgeImage](PXPeopleBootstrapCollectionViewCell, "cloudBadgeImage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v6->_badgeView, "setImage:", v25);

    objc_msgSend(v7, "addSubview:", v6->_badgeView);
    -[UIImageView setHidden:](v6->_badgeView, "setHidden:", 1);
    -[UIImageView setUserInteractionEnabled:](v6->_badgeView, "setUserInteractionEnabled:", 0);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v6->_badgeView, "setAccessibilityIgnoresInvertColors:", 1);
    -[PXPeopleBootstrapCollectionViewCell setClipsToBounds:](v6, "setClipsToBounds:", 1);
    v33.origin.x = 0.0;
    v33.origin.y = 0.0;
    v33.size.width = width;
    v33.size.height = height;
    v26 = CGRectGetMaxY(v33) - v6->_checkmarkImageSize.height + -5.0;
    if (-[PXPeopleBootstrapCollectionViewCell _isRTL](v6, "_isRTL"))
    {
      v27 = *p_width;
      v28 = 5.0;
    }
    else
    {
      v34.origin.x = 0.0;
      v34.origin.y = 0.0;
      v34.size.width = width;
      v34.size.height = height;
      MaxX = CGRectGetMaxX(v34);
      v27 = *p_width;
      v28 = MaxX - *p_width + -5.0;
    }
    v30 = v6->_checkmarkImageSize.height;
    -[UIView setFrame:](v6->_selectedCheckmarkView, "setFrame:", v28, v26, v27, v30);
    -[UIView setFrame:](v6->_unselectedCheckmarkView, "setFrame:", v28, v26, v27, v30);

  }
  return v6;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPeopleBootstrapCollectionViewCell;
  -[PXPeopleBootstrapCollectionViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PXPeopleBootstrapCollectionViewCell _updateCellSizing](self, "_updateCellSizing");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleBootstrapCollectionViewCell;
  -[PXPeopleBootstrapCollectionViewCell setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXPeopleBootstrapCollectionViewCell _updateCellSizing](self, "_updateCellSizing");
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleBootstrapCollectionViewCell;
  -[PXPeopleBootstrapCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[PXPeopleBootstrapCollectionViewCell setImageRequest:](self, "setImageRequest:", 0);
  -[PXPeopleBootstrapCollectionViewCell setIsMergeCandidate:](self, "setIsMergeCandidate:", 0);
  -[PXPeopleBootstrapCollectionViewCell setIsVerified:](self, "setIsVerified:", 0);
  -[PXPeopleBootstrapCollectionViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[PXPeopleBootstrapCollectionViewCell setPresentationStatus:](self, "setPresentationStatus:", 0);
}

- (void)setImage:(id)a3 contentsRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (a3)
    v9 = 2;
  else
    v9 = 3;
  v10 = a3;
  -[PXPeopleBootstrapCollectionViewCell imageView](self, "imageView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v10);

  objc_msgSend(v12, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentsRect:", x, y, width, height);

  -[PXPeopleBootstrapCollectionViewCell setPresentationStatus:](self, "setPresentationStatus:", v9);
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[PXPeopleBootstrapCollectionViewCell imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setPresentationStatus:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  if (self->_presentationStatus != a3)
  {
    self->_presentationStatus = a3;
    -[PXPeopleBootstrapCollectionViewCell badgeView](self, "badgeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v5;
    if (a3 == 3)
    {
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.circle.fill"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageWithSymbolConfiguration:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTintColor:", v10);

      objc_msgSend(v14, "setImage:", v9);
      objc_msgSend(v14, "setHidden:", 0);
      -[PXPeopleBootstrapCollectionViewCell _updateCellSizing](self, "_updateCellSizing");

    }
    else if (a3 == 1)
    {
      +[PXPeopleBootstrapCollectionViewCell cloudBadgeImage](PXPeopleBootstrapCollectionViewCell, "cloudBadgeImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImage:", v6);

      objc_msgSend(v14, "setHidden:", 0);
      -[PXPeopleBootstrapCollectionViewCell _updateCellSizing](self, "_updateCellSizing");
    }
    else
    {
      objc_msgSend(v5, "setHidden:", 1);
    }
    v11 = objc_msgSend(v14, "isHidden") ^ 1;
    -[PXPeopleBootstrapCollectionViewCell selectedCheckmarkView](self, "selectedCheckmarkView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", v11);

    -[PXPeopleBootstrapCollectionViewCell unselectedCheckmarkView](self, "unselectedCheckmarkView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", v11);

  }
}

- (void)setIsMergeCandidate:(BOOL)a3
{
  if (self->_isMergeCandidate != a3)
  {
    self->_isMergeCandidate = a3;
    -[PXPeopleBootstrapCollectionViewCell _updateCellSizing](self, "_updateCellSizing");
  }
}

- (void)setIsVerified:(BOOL)a3
{
  if (self->_isVerified != a3)
  {
    self->_isVerified = a3;
    -[PXPeopleBootstrapCollectionViewCell _updateCellSizing](self, "_updateCellSizing");
  }
}

- (void)setConfirmed:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = !a3;
  -[PXPeopleBootstrapCollectionViewCell selectedCheckmarkView](self, "selectedCheckmarkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  -[PXPeopleBootstrapCollectionViewCell unselectedCheckmarkView](self, "unselectedCheckmarkView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v3);

}

- (BOOL)_isRTL
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirection") == 1;

  return v3;
}

- (void)_updateCellSizing
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  void *v18;
  int v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double MaxY;
  double v25;
  double v26;
  void *v27;
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double Height;
  id v53;
  CGFloat v54;
  CGFloat v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  -[PXPeopleBootstrapCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v54 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PXPeopleBootstrapCollectionViewCell imageView](self, "imageView");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setFrame:", v5, v7, v9, v11);
  v12 = *MEMORY[0x1E0C9D648];
  v51 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[PXPeopleBootstrapCollectionViewCell badgeView](self, "badgeView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "size");
  v16 = v15;
  v50 = v17;
  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "displayBootstrapSuggestionType");

  -[PXPeopleBootstrapCollectionViewCell traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "displayScale");
  v22 = v21;

  v56.origin.x = v5;
  v56.origin.y = v7;
  v56.size.width = v9;
  v56.size.height = v11;
  v23 = CGRectGetMaxY(v56) - self->_checkmarkImageSize.height + -5.0;
  v57.origin.x = v5;
  v55 = v7;
  v57.origin.y = v7;
  v57.size.width = v9;
  v57.size.height = v11;
  MaxY = CGRectGetMaxY(v57);
  v49 = v12;
  v58.origin.x = v12;
  v58.size.width = v16;
  v58.origin.y = v51;
  v58.size.height = v50;
  Height = CGRectGetHeight(v58);
  +[PXPeopleFaceCropManager roundedCornerRadiusForTargetSize:displayScale:](PXPeopleFaceCropManager, "roundedCornerRadiusForTargetSize:displayScale:", v9, v11, v22);
  v26 = v25;
  -[PXPeopleBootstrapCollectionViewCell layer](self, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setCornerRadius:", v26);

  v28 = -[PXPeopleBootstrapCollectionViewCell _isRTL](self, "_isRTL");
  v29 = 5.0;
  if (!v28)
  {
    v59.origin.x = v54;
    v59.origin.y = v55;
    v59.size.width = v9;
    v59.size.height = v11;
    v29 = CGRectGetMaxX(v59) - self->_checkmarkImageSize.width + -5.0;
  }
  v30 = MaxY + -5.0;
  -[PXPeopleBootstrapCollectionViewCell checkmarkImageSize](self, "checkmarkImageSize");
  v32 = v31;
  v34 = v33;
  -[PXPeopleBootstrapCollectionViewCell selectedCheckmarkView](self, "selectedCheckmarkView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v29, v23, v32, v34);

  -[PXPeopleBootstrapCollectionViewCell unselectedCheckmarkView](self, "unselectedCheckmarkView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v29, v23, v32, v34);

  if (v19)
  {
    if (-[PXPeopleBootstrapCollectionViewCell isMergeCandidate](self, "isMergeCandidate")
      && -[PXPeopleBootstrapCollectionViewCell isVerified](self, "isVerified"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[PXPeopleBootstrapCollectionViewCell isMergeCandidate](self, "isMergeCandidate"))
        objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v38 = objc_retainAutorelease(v37);
    v39 = objc_msgSend(v38, "CGColor");

    -[PXPeopleBootstrapCollectionViewCell layer](self, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setBorderColor:", v39);

    -[PXPeopleBootstrapCollectionViewCell layer](self, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setBorderWidth:", 2.0);

  }
  v42 = v54;
  v43 = v55;
  v44 = v9;
  v45 = v11;
  if (v28)
  {
    v46 = CGRectGetMinX(*(CGRect *)&v42) + 5.0;
    v47 = v16;
  }
  else
  {
    v48 = CGRectGetMaxX(*(CGRect *)&v42) + -5.0;
    v60.origin.x = v49;
    v47 = v16;
    v60.origin.y = v30 - Height;
    v60.size.width = v16;
    v60.size.height = v50;
    v46 = v48 - CGRectGetWidth(v60);
  }
  objc_msgSend(v13, "setFrame:", v46, v30 - Height, v47, v50);

}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (unint64_t)presentationStatus
{
  return self->_presentationStatus;
}

- (PXPersonImageRequest)imageRequest
{
  return self->_imageRequest;
}

- (void)setImageRequest:(id)a3
{
  objc_storeStrong((id *)&self->_imageRequest, a3);
}

- (BOOL)isMergeCandidate
{
  return self->_isMergeCandidate;
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (UIView)selectedCheckmarkView
{
  return self->_selectedCheckmarkView;
}

- (UIView)unselectedCheckmarkView
{
  return self->_unselectedCheckmarkView;
}

- (UIImageView)badgeView
{
  return self->_badgeView;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (CGSize)checkmarkImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_checkmarkImageSize.width;
  height = self->_checkmarkImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_unselectedCheckmarkView, 0);
  objc_storeStrong((id *)&self->_selectedCheckmarkView, 0);
  objc_storeStrong((id *)&self->_imageRequest, 0);
}

+ (id)cloudBadgeImage
{
  if (cloudBadgeImage_onceToken_294545 != -1)
    dispatch_once(&cloudBadgeImage_onceToken_294545, &__block_literal_global_294546);
  return (id)cloudBadgeImage_image_294547;
}

void __54__PXPeopleBootstrapCollectionViewCell_cloudBadgeImage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_systemImageNamed:", CFSTR("icloud.fill"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_tintedImageWithColor:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)cloudBadgeImage_image_294547;
  cloudBadgeImage_image_294547 = v1;

}

@end
