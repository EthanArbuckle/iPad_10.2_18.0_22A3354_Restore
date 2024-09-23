@implementation WFTriggerImageCell

- (WFTriggerImageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFTriggerImageCell *v4;
  UIImageView *v5;
  UIImageView *iconView;
  UILabel *v7;
  UILabel *label;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSLayoutConstraint *widthConstraint;
  void *v16;
  uint64_t v17;
  NSLayoutConstraint *heightConstraint;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSLayoutConstraint *imagePaddingTopConstraint;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *imagePaddingBottomConstraint;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  WFTriggerImageCell *v38;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  objc_super v63;
  _QWORD v64[13];

  v64[11] = *MEMORY[0x24BDAC8D0];
  v63.receiver = self;
  v63.super_class = (Class)WFTriggerImageCell;
  v4 = -[WFTriggerImageCell initWithStyle:reuseIdentifier:](&v63, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    iconView = v4->_iconView;
    v4->_iconView = v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_iconView, "setContentMode:", 1);
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    label = v4->_label;
    v4->_label = v7;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_label, "setFont:", v9);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_label, "setTextColor:", v10);

    -[UILabel setNumberOfLines:](v4->_label, "setNumberOfLines:", 0);
    -[WFTriggerImageCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_iconView);

    -[WFTriggerImageCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v4->_label);

    -[UIImageView widthAnchor](v4->_iconView, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToConstant:", 42.0);
    v14 = objc_claimAutoreleasedReturnValue();
    widthConstraint = v4->_widthConstraint;
    v4->_widthConstraint = (NSLayoutConstraint *)v14;

    -[UIImageView heightAnchor](v4->_iconView, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToConstant:", 42.0);
    v17 = objc_claimAutoreleasedReturnValue();
    heightConstraint = v4->_heightConstraint;
    v4->_heightConstraint = (NSLayoutConstraint *)v17;

    -[UIImageView topAnchor](v4->_iconView, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerImageCell contentView](v4, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:constant:", v21, 15.0);
    v22 = objc_claimAutoreleasedReturnValue();
    imagePaddingTopConstraint = v4->_imagePaddingTopConstraint;
    v4->_imagePaddingTopConstraint = (NSLayoutConstraint *)v22;

    -[UIImageView bottomAnchor](v4->_iconView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerImageCell contentView](v4, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:constant:", v26, 15.0);
    v27 = objc_claimAutoreleasedReturnValue();
    imagePaddingBottomConstraint = v4->_imagePaddingBottomConstraint;
    v4->_imagePaddingBottomConstraint = (NSLayoutConstraint *)v27;

    v50 = (void *)MEMORY[0x24BDD1628];
    -[UIImageView centerYAnchor](v4->_iconView, "centerYAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerImageCell contentView](v4, "contentView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v60);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v59;
    -[UIImageView leadingAnchor](v4->_iconView, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerImageCell contentView](v4, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, 15.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v55;
    -[UILabel centerYAnchor](v4->_label, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerImageCell contentView](v4, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "centerYAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v51;
    -[UILabel leadingAnchor](v4->_label, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v4->_iconView, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, 15.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v64[3] = v47;
    -[UILabel trailingAnchor](v4->_label, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerImageCell contentView](v4, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "layoutMarginsGuide");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v64[4] = v42;
    -[UILabel topAnchor](v4->_label, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerImageCell contentView](v4, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layoutMarginsGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v64[5] = v31;
    -[UILabel bottomAnchor](v4->_label, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerImageCell contentView](v4, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layoutMarginsGuide");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v64[6] = v36;
    v64[7] = v4->_widthConstraint;
    v64[8] = v4->_heightConstraint;
    v64[9] = v4->_imagePaddingTopConstraint;
    v64[10] = v4->_imagePaddingBottomConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 11);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "activateConstraints:", v37);

    v38 = v4;
  }

  return v4;
}

- (void)setImage:(id)a3 width:(double)a4 height:(double)a5
{
  NSLayoutConstraint *widthConstraint;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;

  widthConstraint = self->_widthConstraint;
  v9 = a3;
  -[NSLayoutConstraint setConstant:](widthConstraint, "setConstant:", a4);
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", a5);
  -[UIImageView setImage:](self->_iconView, "setImage:", v9);

  -[WFTriggerImageCell separatorInset](self, "separatorInset");
  v11 = v10;
  -[WFTriggerImageCell separatorInset](self, "separatorInset");
  v13 = v12;
  -[WFTriggerImageCell separatorInset](self, "separatorInset");
  -[WFTriggerImageCell setSeparatorInset:](self, "setSeparatorInset:", v11, a4 + 30.0, v13);
  -[WFTriggerImageCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setImageTopPadding:(double)a3 bottomPadding:(double)a4
{
  -[NSLayoutConstraint setConstant:](self->_imagePaddingTopConstraint, "setConstant:", a3);
  -[NSLayoutConstraint setConstant:](self->_imagePaddingBottomConstraint, "setConstant:", a4);
  -[WFTriggerImageCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setCornerRadius:(double)a3
{
  -[UIImageView _setContinuousCornerRadius:](self->_iconView, "_setContinuousCornerRadius:", a3);
  -[UIImageView setClipsToBounds:](self->_iconView, "setClipsToBounds:", 1);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTriggerImageCell;
  -[WFTriggerImageCell prepareForReuse](&v4, sel_prepareForReuse);
  -[WFTriggerImageCell setAccessoryType:](self, "setAccessoryType:", 0);
  -[WFTriggerImageCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

}

- (UILabel)label
{
  return self->_label;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_objectIdentifier, a3);
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (NSLayoutConstraint)imagePaddingTopConstraint
{
  return self->_imagePaddingTopConstraint;
}

- (void)setImagePaddingTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imagePaddingTopConstraint, a3);
}

- (NSLayoutConstraint)imagePaddingBottomConstraint
{
  return self->_imagePaddingBottomConstraint;
}

- (void)setImagePaddingBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imagePaddingBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagePaddingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_imagePaddingTopConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
