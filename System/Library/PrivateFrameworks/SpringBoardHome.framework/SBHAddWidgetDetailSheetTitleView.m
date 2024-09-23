@implementation SBHAddWidgetDetailSheetTitleView

- (SBHAddWidgetDetailSheetTitleView)initWithIconImageInfo:(SBIconImageInfo *)a3 contentInsets:(NSDirectionalEdgeInsets)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat trailing;
  CGFloat bottom;
  CGFloat leading;
  CGFloat top;
  SBHAddWidgetDetailSheetTitleView *v16;
  SBHAddWidgetDetailSheetTitleView *v17;
  UIImageView *v18;
  UIImageView *imageView;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  UILabel *v27;
  UILabel *textLabel;
  UILabel *v29;
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
  id v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_super v64;
  void *v65;
  _QWORD v66[3];
  _QWORD v67[5];
  _QWORD v68[4];

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  trailing = a4.trailing;
  bottom = a4.bottom;
  leading = a4.leading;
  top = a4.top;
  v68[2] = *MEMORY[0x1E0C80C00];
  v64.receiver = self;
  v64.super_class = (Class)SBHAddWidgetDetailSheetTitleView;
  v16 = -[SBHAddWidgetDetailSheetTitleView initWithFrame:](&v64, sel_initWithFrame_, a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v17 = v16;
  if (v16)
  {
    v16->_iconImageInfo.size.width = top;
    v16->_iconImageInfo.size.height = leading;
    v16->_iconImageInfo.scale = bottom;
    v16->_iconImageInfo.continuousCornerRadius = trailing;
    v16->_contentInsets.top = v11;
    v16->_contentInsets.leading = v10;
    v16->_contentInsets.bottom = v9;
    v16->_contentInsets.trailing = v8;
    v18 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v17->_imageView;
    v17->_imageView = v18;

    -[UIImageView setContentMode:](v17->_imageView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v17->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBHAddWidgetDetailSheetTitleView addSubview:](v17, "addSubview:", v17->_imageView);
    v20 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView widthAnchor](v17->_imageView, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetDetailSheetTitleView iconImageInfo](v17, "iconImageInfo");
    objc_msgSend(v21, "constraintEqualToConstant:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v22;
    -[UIImageView heightAnchor](v17->_imageView, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetDetailSheetTitleView iconImageInfo](v17, "iconImageInfo");
    objc_msgSend(v23, "constraintEqualToConstant:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v26);

    v27 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v17->_textLabel;
    v17->_textLabel = v27;

    v29 = v17->_textLabel;
    -[SBHAddWidgetDetailSheetTitleView _textLabelFont](v17, "_textLabelFont");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v29, "setFont:", v30);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v17->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v17->_textLabel, "setNumberOfLines:", -[SBHAddWidgetDetailSheetTitleView _textLabelNumberOfLines](v17, "_textLabelNumberOfLines"));
    -[SBHAddWidgetDetailSheetTitleView addSubview:](v17, "addSubview:", v17->_textLabel);
    v55 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView topAnchor](v17->_imageView, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetDetailSheetTitleView topAnchor](v17, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintGreaterThanOrEqualToAnchor:constant:", v60, v11);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v59;
    -[SBHAddWidgetDetailSheetTitleView bottomAnchor](v17, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v17->_imageView, "bottomAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintGreaterThanOrEqualToAnchor:constant:", v57, v9);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = v56;
    -[UILabel topAnchor](v17->_textLabel, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetDetailSheetTitleView topAnchor](v17, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintGreaterThanOrEqualToAnchor:constant:", v53, v11);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v67[2] = v52;
    -[SBHAddWidgetDetailSheetTitleView bottomAnchor](v17, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v17->_textLabel, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:constant:", v32, v9);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v67[3] = v33;
    -[UIImageView centerYAnchor](v17->_imageView, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v17->_textLabel, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v67[4] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "activateConstraints:", v37);

    v61 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView leadingAnchor](v17->_imageView, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetDetailSheetTitleView leadingAnchor](v17, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v38, v10);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v39;
    -[UILabel leadingAnchor](v17->_textLabel, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v17->_imageView, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v41, 1.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v42;
    -[SBHAddWidgetDetailSheetTitleView trailingAnchor](v17, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v17->_textLabel, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:constant:", v44, v8);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "activateConstraints:", v46);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObserver:selector:name:object:", v17, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0DC48E8], 0);

    objc_opt_self();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (id)-[SBHAddWidgetDetailSheetTitleView registerForTraitChanges:withAction:](v17, "registerForTraitChanges:withAction:", v49, sel__contentSizeCategoryDidChange);

  }
  return v17;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetDetailSheetTitleView;
  -[SBHAddWidgetDetailSheetTitleView dealloc](&v4, sel_dealloc);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = *MEMORY[0x1E0DC55F0];
  -[SBHAddWidgetDetailSheetTitleView iconImageInfo](self, "iconImageInfo");
  v5 = v4;
  -[UILabel intrinsicContentSize](self->_textLabel, "intrinsicContentSize");
  if (v5 >= v6)
    v7 = v5;
  else
    v7 = v6;
  v8 = v7 + self->_contentInsets.top + self->_contentInsets.bottom;
  v9 = v3;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)setAddWidgetSheetAppCollectionViewCellTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHAddWidgetDetailSheetTitleView textLabel](self, "textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setAddWidgetSheetAppCollectionViewCellIconImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHAddWidgetDetailSheetTitleView imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (id)_textLabelFont
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4B10];
  -[SBHAddWidgetDetailSheetTitleView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v4, 4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)_textLabelNumberOfLines
{
  if (_SBHTraitEnvironmentIsAccessibilityTextSize(self))
    return 2;
  else
    return 1;
}

- (void)_contentSizeCategoryDidChange
{
  void *v3;
  id v4;

  -[SBHAddWidgetDetailSheetTitleView textLabel](self, "textLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetDetailSheetTitleView _textLabelFont](self, "_textLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  objc_msgSend(v4, "setNumberOfLines:", -[SBHAddWidgetDetailSheetTitleView _textLabelNumberOfLines](self, "_textLabelNumberOfLines"));
  -[SBHAddWidgetDetailSheetTitleView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[SBHAddWidgetDetailSheetTitleView setNeedsLayout](self, "setNeedsLayout");

}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_contentInsets.top;
  leading = self->_contentInsets.leading;
  bottom = self->_contentInsets.bottom;
  trailing = self->_contentInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
