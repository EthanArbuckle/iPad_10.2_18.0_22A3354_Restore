@implementation PXSharedLibraryRulesTableViewCell

- (PXSharedLibraryRulesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PXSharedLibraryRulesTableViewCell *v4;
  PXSharedLibraryRulesTableViewCell *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *imageView;
  void *v9;
  id v10;
  void *v11;
  UILabel *v12;
  UILabel *titleLabel;
  UILabel *v14;
  UILabel *subtitleLabel;
  UILabel *v16;
  UILabel *detailLabel;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_super v54;
  _QWORD v55[11];

  v55[9] = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)PXSharedLibraryRulesTableViewCell;
  v4 = -[PXSharedLibraryRulesTableViewCell initWithStyle:reuseIdentifier:](&v54, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PXSharedLibraryRulesTableViewCell setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryRulesTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v5->_imageView;
    v5->_imageView = v7;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXSharedLibraryRulesTableViewCell contentView](v5, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v5->_imageView);

    v10 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setAxis:", 1);
    objc_msgSend(v10, "setAlignment:", 1);
    -[PXSharedLibraryRulesTableViewCell contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "addArrangedSubview:", v5->_titleLabel);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v5->_subtitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v10, "addArrangedSubview:", v5->_subtitleLabel);
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailLabel = v5->_detailLabel;
    v5->_detailLabel = v16;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXSharedLibraryRulesTableViewCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v5->_detailLabel);

    -[PXSharedLibraryRulesTableViewCell setAccessoryType:](v5, "setAccessoryType:", 0);
    v41 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView leadingAnchor](v5->_imageView, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryRulesTableViewCell contentView](v5, "contentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, 10.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v50;
    -[UIImageView centerYAnchor](v5->_imageView, "centerYAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryRulesTableViewCell contentView](v5, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "centerYAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v46;
    objc_msgSend(v10, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryRulesTableViewCell contentView](v5, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 10.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v42;
    objc_msgSend(v10, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryRulesTableViewCell contentView](v5, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, -10.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v37;
    objc_msgSend(v10, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v5->_imageView, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 10.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v55[4] = v34;
    objc_msgSend(v10, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerYAnchor](v5->_imageView, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v55[5] = v31;
    objc_msgSend(v10, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v5->_detailLabel, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:constant:", v29, -10.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v55[6] = v28;
    -[UILabel centerYAnchor](v5->_detailLabel, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerYAnchor](v5->_imageView, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v55[7] = v21;
    -[UILabel trailingAnchor](v5->_detailLabel, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibraryRulesTableViewCell contentView](v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, -10.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v55[8] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v26);

    -[PXSharedLibraryRulesTableViewCell _updateImageView](v5, "_updateImageView");
    -[PXSharedLibraryRulesTableViewCell _updateTitleLabel](v5, "_updateTitleLabel");
    -[PXSharedLibraryRulesTableViewCell _updateSubtitleLabel](v5, "_updateSubtitleLabel");
    -[PXSharedLibraryRulesTableViewCell _updateDetailLabel](v5, "_updateDetailLabel");

  }
  return v5;
}

- (void)_updateImageView
{
  void *v3;
  void *v4;
  void *v5;

  -[PXSharedLibraryRulesTableViewCell image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v3);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v4);

  -[UIImageView setAccessibilityIgnoresInvertColors:](self->_imageView, "setAccessibilityIgnoresInvertColors:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v5);

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 4);
  -[PXSharedLibraryRulesTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_updateTitleLabel
{
  void *v3;
  void *v4;
  id v5;

  -[PXSharedLibraryRulesTableViewCell title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0);
  -[PXSharedLibraryRulesTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)_updateSubtitleLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXSharedLibraryRulesTableViewCell subtitle](self, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_subtitleLabel, "setText:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v4);

  -[PXSharedLibraryRulesTableViewCell detail](self, "detail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", v5 != 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A98], 0x8000, 2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v6);
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_subtitleLabel, "setLineBreakMode:", 0);
  -[PXSharedLibraryRulesTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (void)_updateDetailLabel
{
  void *v3;
  void *v4;
  id v5;

  -[PXSharedLibraryRulesTableViewCell detail](self, "detail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_detailLabel, "setText:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_detailLabel, "setTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_detailLabel, "setFont:", v5);

}

- (void)setTitle:(id)a3
{
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  -[PXSharedLibraryRulesTableViewCell title](self, "title");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqualToString:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_title, a3);
      -[PXSharedLibraryRulesTableViewCell _updateTitleLabel](self, "_updateTitleLabel");
    }
  }

}

- (void)setSubtitle:(id)a3
{
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  -[PXSharedLibraryRulesTableViewCell subtitle](self, "subtitle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqualToString:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_subtitle, a3);
      -[PXSharedLibraryRulesTableViewCell _updateSubtitleLabel](self, "_updateSubtitleLabel");
    }
  }

}

- (void)setDetail:(id)a3
{
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  -[PXSharedLibraryRulesTableViewCell detail](self, "detail");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqualToString:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_detail, a3);
      -[PXSharedLibraryRulesTableViewCell _updateDetailLabel](self, "_updateDetailLabel");
      -[PXSharedLibraryRulesTableViewCell _updateSubtitleLabel](self, "_updateSubtitleLabel");
    }
  }

}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  -[PXSharedLibraryRulesTableViewCell _updateImageView](self, "_updateImageView");
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)detail
{
  return self->_detail;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
