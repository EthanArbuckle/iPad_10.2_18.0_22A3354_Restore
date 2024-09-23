@implementation PBFPosterGalleryPreviewCell

+ (CGSize)contentSizeForCellWithTitle:(BOOL)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5
{
  _BOOL4 v6;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v6 = a3;
  v8 = a5;
  objc_msgSend(v8, "posterContentSizeForOrientation:", a4);
  v10 = v9;
  v12 = v11;
  if (v6)
  {
    objc_msgSend(a1, "maximumTitleHeightForFont:", 0);
    v14 = v13;
    objc_msgSend(v8, "previewCellLabelToImageVerticalSpacing");
    v12 = v12 + v14 + v15;
  }

  v16 = v10;
  v17 = v12;
  result.height = v17;
  result.width = v16;
  return result;
}

+ (CGSize)contentSizeForCellWithTitleSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5
{
  double height;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  v7 = a5;
  objc_msgSend(v7, "posterContentSizeForOrientation:", a4);
  v9 = v8;
  v11 = v10;
  if (height > 0.0)
  {
    objc_msgSend(v7, "previewCellLabelToImageVerticalSpacing");
    v11 = v11 + height + v12;
  }

  v13 = v9;
  v14 = v11;
  result.height = v14;
  result.width = v13;
  return result;
}

+ (CGSize)contentSizeForSmartAlbumCellWithTitle:(BOOL)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5
{
  _BOOL8 v6;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v6 = a3;
  v8 = a5;
  objc_msgSend(a1, "contentSizeForCellWithTitle:interfaceOrientation:spec:", v6, a4, v8);
  v10 = v9;
  v12 = v11;
  objc_msgSend(v8, "previewSmartAlbumCellAdditionalTopMargin");
  v14 = v13;

  v15 = v12 + v14;
  v16 = v10;
  result.height = v15;
  result.width = v16;
  return result;
}

+ (CGSize)contentSizeForSmartAlbumCellWithTitleSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5
{
  double height;
  double width;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  objc_msgSend(a1, "contentSizeForCellWithTitleSize:interfaceOrientation:spec:", a4, v9, width, height);
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "previewSmartAlbumCellAdditionalTopMargin");
  v15 = v14;

  v16 = v13 + v15;
  v17 = v11;
  result.height = v16;
  result.width = v17;
  return result;
}

+ (CGSize)heroContentSizeForCellWithTitle:(BOOL)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5
{
  _BOOL4 v5;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v5 = a3;
  v7 = a5;
  objc_msgSend(v7, "posterHeroContentSize");
  v9 = v8;
  v11 = v10;
  if (v5)
  {
    objc_msgSend(a1, "maximumTitleHeightForFont:", 0);
    v13 = v12;
    objc_msgSend(v7, "previewCellLabelToImageVerticalSpacing");
    v11 = v11 + v13 + v14;
  }

  v15 = v9;
  v16 = v11;
  result.height = v16;
  result.width = v15;
  return result;
}

+ (CGSize)heroContentSizeForCellWithTitleSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 spec:(id)a5
{
  double height;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  v6 = a5;
  objc_msgSend(v6, "posterHeroContentSize");
  v8 = v7;
  v10 = v9;
  if (height > 0.0)
  {
    objc_msgSend(v6, "previewCellLabelToImageVerticalSpacing");
    v10 = v10 + height + v11;
  }

  v12 = v8;
  v13 = v10;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (double)maximumTitleHeightForFont:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = a3;
  if (!v3)
  {
    +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewCellLabelFont");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "lineHeight");
  v6 = v5;

  return v6;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBFPosterGalleryPreviewCell;
  -[PBFPosterGalleryPreviewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[PBFPosterGalleryPreviewCell setPosterTitle:](self, "setPosterTitle:", 0);
  -[PBFPosterGalleryPreviewCell setAttributedPosterTitle:](self, "setAttributedPosterTitle:", 0);
  -[PBFPosterGalleryPreviewCell posterPreviewView](self, "posterPreviewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

}

- (BOOL)supportsPosterTitle
{
  return 1;
}

- (BOOL)supportsPosterDescription
{
  return 0;
}

- (id)pbf_displayContext
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBFPosterGalleryPreviewCell;
  -[UIView pbf_displayContext](&v6, sel_pbf_displayContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayContextWithUpdatedInterfaceOrientation:", self->_layoutOrientation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updatePreviewType:(id)a3 scale:(double)a4 posterPreviewView:(id)a5 layoutOrientation:(int64_t)a6 index:(unint64_t)a7
{
  NSString *v12;
  id v13;
  void *v14;
  NSString *previewType;

  v12 = (NSString *)a3;
  v13 = a5;
  -[PBFPosterGalleryPreviewCell posterPreviewView](self, "posterPreviewView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updatePreviewType:scale:posterPreviewView:layoutOrientation:index:", v12, v13, a6, a7, a4);

  self->_layoutOrientation = a6;
  previewType = self->_previewType;
  self->_previewType = v12;

  -[PBFPosterGalleryPreviewCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[PBFPosterGalleryPreviewCell setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)posterTitle
{
  void *v2;
  void *v3;

  -[PBFPosterGalleryPreviewCell titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPosterTitle:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PBFPosterGalleryPreviewCell posterTitle](self, "posterTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    if (v7)
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v7);
    else
      v6 = 0;
    -[PBFPosterGalleryPreviewCell _setMutableAttributedPosterTitle:](self, "_setMutableAttributedPosterTitle:", v6);

  }
}

- (NSAttributedString)attributedPosterTitle
{
  void *v2;
  void *v3;

  -[PBFPosterGalleryPreviewCell titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setAttributedPosterTitle:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PBFPosterGalleryPreviewCell attributedPosterTitle](self, "attributedPosterTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v7, "mutableCopy");
    -[PBFPosterGalleryPreviewCell _setMutableAttributedPosterTitle:](self, "_setMutableAttributedPosterTitle:", v6);

  }
}

- (void)_setMutableAttributedPosterTitle:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = (void *)objc_opt_new();
    LODWORD(v5) = 1036831949;
    objc_msgSend(v4, "setHyphenationFactor:", v5);
    objc_msgSend(v4, "setAllowsDefaultTighteningForTruncation:", 1);
    objc_msgSend(v4, "setLineBreakMode:", 4);
    objc_msgSend(v4, "setAlignment:", 1);
    objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v4, 0, objc_msgSend(v7, "length"));

  }
  -[PBFPosterGalleryPreviewCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v7);

  self->_titleLabelSize = (CGSize)*MEMORY[0x1E0C9D820];
  -[PBFPosterGalleryPreviewCell setNeedsLayout](self, "setNeedsLayout");

}

- (NSString)posterDescription
{
  return 0;
}

- (id)titleLabel
{
  UILabel *titleLabel;
  UILabel *v3;
  void *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  void *v14;

  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    v3 = titleLabel;
  }
  else
  {
    -[PBFPosterGalleryPreviewCell window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (UILabel *)objc_opt_new();
    v9 = self->_titleLabel;
    self->_titleLabel = v8;

    v10 = self->_titleLabel;
    objc_msgSend(v7, "previewCellLabelFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    v12 = self->_titleLabel;
    objc_msgSend(v7, "previewCellLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
    -[UILabel setMaximumContentSizeCategory:](self->_titleLabel, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48D8]);
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[PBFPosterGalleryPreviewCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", self->_titleLabel);

    -[PBFPosterGalleryPreviewCell setNeedsLayout](self, "setNeedsLayout");
    v3 = self->_titleLabel;

  }
  return v3;
}

- (PBFPosterGalleryPreviewView)posterPreviewView
{
  PBFPosterGalleryPreviewView *posterPreviewView;
  PBFPosterGalleryPreviewView *v4;
  PBFPosterGalleryPreviewView *v5;
  void *v6;
  void *v7;

  posterPreviewView = self->_posterPreviewView;
  if (!posterPreviewView)
  {
    v4 = (PBFPosterGalleryPreviewView *)objc_opt_new();
    v5 = self->_posterPreviewView;
    self->_posterPreviewView = v4;

    -[PBFPosterGalleryPreviewView sizeToFit](self->_posterPreviewView, "sizeToFit");
    -[PBFPosterGalleryPreviewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_posterPreviewView);

    -[PBFPosterGalleryPreviewCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendSubviewToBack:", self->_posterPreviewView);

    posterPreviewView = self->_posterPreviewView;
  }
  return posterPreviewView;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  __CFString *previewType;
  double v22;
  double v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  objc_super v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v41.receiver = self;
  v41.super_class = (Class)PBFPosterGalleryPreviewCell;
  -[PBFPosterGalleryPreviewCell layoutSubviews](&v41, sel_layoutSubviews);
  -[PBFPosterGalleryPreviewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[PBFPosterGalleryPreviewCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryPreviewCell posterPreviewView](self, "posterPreviewView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryPreviewCell window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "bounds");
  v14 = v13;
  if ((__CFString *)self->_previewType == PBFPreviewTypeHero)
    objc_msgSend(v12, "posterHeroContentSize");
  else
    objc_msgSend(v12, "posterContentSizeForOrientation:", self->_layoutOrientation);
  if (v15 <= v5)
    v17 = v15;
  else
    v17 = v5;
  if (v16 <= v7)
    v18 = v16;
  else
    v18 = v7;
  UIFloorToViewScale();
  v20 = v19;
  previewType = (__CFString *)self->_previewType;
  if (previewType == PBFPreviewTypeSmartAlbum)
  {
    objc_msgSend(v12, "previewSmartAlbumCellAdditionalTopMargin");
    v14 = v14 + v22;
    previewType = (__CFString *)self->_previewType;
  }
  if (previewType == PBFPreviewTypeHero)
    v23 = v5 + 14.0;
  else
    v23 = v5;
  if (self->_titleLabelSize.width == *MEMORY[0x1E0C9D820]
    && self->_titleLabelSize.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v8, "text");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "length"))
    {
      objc_msgSend(v8, "sizeThatFits:", v23, v7);
    }
    else
    {
      v25 = 0.0;
      v26 = 0.0;
    }
    self->_titleLabelSize.width = v25;
    self->_titleLabelSize.height = v26;

  }
  objc_msgSend(v8, "frame");
  v42.origin.x = v20;
  v42.origin.y = v14;
  v42.size.width = v17;
  v42.size.height = v18;
  CGRectGetMaxY(v42);
  objc_msgSend(v12, "previewCellLabelToImageVerticalSpacing");
  v27 = (void *)objc_opt_class();
  objc_msgSend(v8, "font");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "maximumTitleHeightForFont:", v28);

  -[PBFPosterGalleryPreviewCell traitCollection](self, "traitCollection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "displayScale");
  v40 = v30;
  v31 = v18;
  UIRectCenteredXInRectScale();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  objc_msgSend(v9, "frame", v40);
  v45.origin.x = v20;
  v45.origin.y = v14;
  v45.size.width = v17;
  v45.size.height = v31;
  if (!CGRectEqualToRect(v43, v45))
    objc_msgSend(v9, "setFrame:", v20, v14, v17, v31);
  objc_msgSend(v8, "frame");
  v46.origin.x = v33;
  v46.origin.y = v35;
  v46.size.width = v37;
  v46.size.height = v39;
  if (!CGRectEqualToRect(v44, v46))
    objc_msgSend(v8, "setFrame:", v33, v35, v37, v39);

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __CFString *previewType;
  __CFString *v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  int64_t layoutOrientation;
  double v29;
  double v30;
  double v31;
  double v32;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PBFPosterGalleryPreviewCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    *(float *)&v13 = a4;
    *(float *)&v14 = a5;
    objc_msgSend(v10, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v13, v14);
    v16 = v15;
    v18 = v17;
  }
  else
  {
    v16 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  previewType = (__CFString *)self->_previewType;
  if (previewType == PBFPreviewTypeHero)
  {
    v27 = (void *)objc_opt_class();
    layoutOrientation = self->_layoutOrientation;
    -[PBFPosterGalleryPreviewCell pbf_displayContext](self, "pbf_displayContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterGalleryViewSpec specForDisplayContext:](PBFPosterGalleryViewSpec, "specForDisplayContext:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "heroContentSizeForCellWithTitleSize:interfaceOrientation:spec:", layoutOrientation, v24, v16, v18);
  }
  else
  {
    v20 = PBFPreviewTypeSmartAlbum;
    v21 = (void *)objc_opt_class();
    v22 = self->_layoutOrientation;
    -[PBFPosterGalleryPreviewCell pbf_displayContext](self, "pbf_displayContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterGalleryViewSpec specForDisplayContext:](PBFPosterGalleryViewSpec, "specForDisplayContext:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (previewType == v20)
      objc_msgSend(v21, "contentSizeForSmartAlbumCellWithTitleSize:interfaceOrientation:spec:", v22, v24, v16, v18);
    else
      objc_msgSend(v21, "contentSizeForCellWithTitleSize:interfaceOrientation:spec:", v22, v24, v16, v18);
  }
  v29 = v25;
  v30 = v26;

  v31 = v29;
  v32 = v30;
  result.height = v32;
  result.width = v31;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedPosterTitle, 0);
  objc_storeStrong((id *)&self->_posterTitle, 0);
  objc_storeStrong((id *)&self->_posterPreviewView, 0);
  objc_storeStrong((id *)&self->_previewType, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
