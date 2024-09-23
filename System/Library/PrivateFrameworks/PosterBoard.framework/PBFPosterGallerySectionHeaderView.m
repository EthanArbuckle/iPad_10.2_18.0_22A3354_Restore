@implementation PBFPosterGallerySectionHeaderView

- (PBFPosterGallerySectionHeaderView)initWithFrame:(CGRect)a3
{
  PBFPosterGallerySectionHeaderView *v3;
  PBFPosterGallerySectionHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBFPosterGallerySectionHeaderView;
  v3 = -[PBFPosterGallerySectionHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PBFPosterGallerySectionHeaderView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  return v4;
}

- (void)setText:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[PBFPosterGallerySectionHeaderView label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v7);

  if ((v6 & 1) == 0)
  {
    -[UILabel setText:](self->_label, "setText:", v7);
    -[PBFPosterGallerySectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSubtitle:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[PBFPosterGallerySectionHeaderView subtitleLabel](self, "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v7);

  if ((v6 & 1) == 0)
  {
    -[UILabel setText:](self->_subtitleLabel, "setText:", v7);
    -[PBFPosterGallerySectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UILabel)label
{
  UILabel *label;
  UILabel *v3;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;

  label = self->_label;
  if (label)
  {
    v3 = label;
  }
  else
  {
    v5 = (UILabel *)objc_opt_new();
    v6 = self->_label;
    self->_label = v5;

    -[PBFPosterGallerySectionHeaderView window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
    v10 = self->_label;
    objc_msgSend(v9, "sectionHeaderTitleFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    v12 = self->_label;
    objc_msgSend(v9, "sectionHeaderTitleColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[PBFPosterGallerySectionHeaderView addSubview:](self, "addSubview:", self->_label);
    v3 = self->_label;

  }
  return v3;
}

- (UILabel)subtitleLabel
{
  UILabel *subtitleLabel;
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

  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel)
  {
    v3 = subtitleLabel;
  }
  else
  {
    -[PBFPosterGallerySectionHeaderView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (UILabel *)objc_opt_new();
    v9 = self->_subtitleLabel;
    self->_subtitleLabel = v8;

    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
    v10 = self->_subtitleLabel;
    objc_msgSend(v7, "sectionHeaderSubtitleFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

    v12 = self->_subtitleLabel;
    objc_msgSend(v7, "sectionHeaderSubtitleColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[PBFPosterGallerySectionHeaderView addSubview:](self, "addSubview:", self->_subtitleLabel);
    v3 = self->_subtitleLabel;

  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBFPosterGallerySectionHeaderView;
  -[PBFPosterGallerySectionHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  -[UILabel setText:](self->_label, "setText:", 0);
  -[UILabel setText:](self->_subtitleLabel, "setText:", 0);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double MaxY;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;
  CGRect v44;

  v43.receiver = self;
  v43.super_class = (Class)PBFPosterGallerySectionHeaderView;
  -[PBFPosterGallerySectionHeaderView layoutSubviews](&v43, sel_layoutSubviews);
  -[PBFPosterGallerySectionHeaderView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PBFPosterGallerySectionHeaderView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[PBFPosterGallerySectionHeaderView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  -[PBFPosterGallerySectionHeaderView label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "systemLayoutSizeFittingSize:", v8, v10);
  v13 = v12;
  v15 = v14;

  if (v6)
    v16 = v8 - v13;
  else
    v16 = 0.0;
  objc_msgSend(v5, "sectionHeaderTopSpacing");
  v18 = v17;
  -[PBFPosterGallerySectionHeaderView label](self, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v16, v18, v13, v15);

  v20 = (void *)MEMORY[0x1E0CB3940];
  -[PBFPosterGallerySectionHeaderView label](self, "label");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("header-%@"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBFPosterGallerySectionHeaderView label](self, "label");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAccessibilityIdentifier:", v23);

  -[PBFPosterGallerySectionHeaderView subtitleLabel](self, "subtitleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "text");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (v27)
  {
    -[PBFPosterGallerySectionHeaderView subtitleLabel](self, "subtitleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "systemLayoutSizeFittingSize:", v8, v10);
    v30 = v29;
    v32 = v31;

    if (v6)
      v33 = v8 - v30;
    else
      v33 = 0.0;
    v44.origin.x = v16;
    v44.origin.y = v18;
    v44.size.width = v13;
    v44.size.height = v15;
    MaxY = CGRectGetMaxY(v44);
    objc_msgSend(v5, "sectionHeaderSubtitleTopMargin");
    v36 = MaxY + v35;
    -[PBFPosterGallerySectionHeaderView subtitleLabel](self, "subtitleLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFrame:", v33, v36, v30, v32);

    v38 = (void *)MEMORY[0x1E0CB3940];
    -[PBFPosterGallerySectionHeaderView subtitleLabel](self, "subtitleLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "text");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("subtitle-%@"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBFPosterGallerySectionHeaderView subtitleLabel](self, "subtitleLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAccessibilityIdentifier:", v41);

  }
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PBFPosterGallerySectionHeaderView window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "sectionHeaderTopSpacing");
  v14 = v13;
  objc_msgSend(v12, "sectionHeaderBottomSpacing");
  v16 = v14 + v15;
  -[PBFPosterGallerySectionHeaderView label](self, "label");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v18 = a4;
  *(float *)&v19 = a5;
  objc_msgSend(v17, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v18, v19);
  v21 = v20;

  v22 = v16 + v21;
  -[UILabel text](self->_subtitleLabel, "text");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    -[PBFPosterGallerySectionHeaderView subtitleLabel](self, "subtitleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v26 = a4;
    *(float *)&v27 = a5;
    objc_msgSend(v25, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v26, v27);
    v29 = v28;

    objc_msgSend(v12, "sectionHeaderSubtitleTopMargin");
    v22 = v29 + v22 + v30;
  }

  v31 = width;
  v32 = v22;
  result.height = v32;
  result.width = v31;
  return result;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
