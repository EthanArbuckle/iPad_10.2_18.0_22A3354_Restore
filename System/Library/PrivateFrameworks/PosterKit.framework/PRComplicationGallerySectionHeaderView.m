@implementation PRComplicationGallerySectionHeaderView

- (PRComplicationGallerySectionHeaderView)initWithFrame:(CGRect)a3
{
  PRComplicationGallerySectionHeaderView *v3;
  UIImageView *v4;
  UIImageView *iconImageView;
  double v6;
  UILabel *v7;
  UILabel *label;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[6];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)PRComplicationGallerySectionHeaderView;
  v3 = -[PRComplicationGallerySectionHeaderView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v4;

    LODWORD(v6) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v3->_iconImageView, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v3->_label;
    v3->_label = v7;

    v9 = v3->_label;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    v11 = v3->_label;
    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC1448]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_label, "setAdjustsFontForContentSizeCategory:", 1);
    v13 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v37[0] = v3->_iconImageView;
    v37[1] = v3->_label;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithArrangedSubviews:", v14);

    objc_msgSend(v15, "setAlignment:", 3);
    objc_msgSend(v15, "setSpacing:", 8.0);
    -[PRComplicationGallerySectionHeaderView addSubview:](v3, "addSubview:", v15);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v27 = (void *)MEMORY[0x1E0CB3718];
    -[UIImageView widthAnchor](v3->_iconImageView, "widthAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", 24.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v33;
    -[UIImageView heightAnchor](v3->_iconImageView, "heightAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToConstant:", 24.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v31;
    objc_msgSend(v15, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGallerySectionHeaderView leadingAnchor](v3, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 8.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v28;
    objc_msgSend(v15, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGallerySectionHeaderView trailingAnchor](v3, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:constant:", v25, -8.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v16;
    objc_msgSend(v15, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGallerySectionHeaderView topAnchor](v3, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36[4] = v19;
    objc_msgSend(v15, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRComplicationGallerySectionHeaderView bottomAnchor](v3, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[5] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v23);

  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRComplicationGallerySectionHeaderView;
  -[PRComplicationGallerySectionHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  -[UIImageView setHidden:](self->_iconImageView, "setHidden:", 0);
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (NSString)title
{
  return -[UILabel text](self->_label, "text");
}

- (void)setIconImage:(id)a3
{
  -[UIImageView setImage:](self->_iconImageView, "setImage:");
  -[UIImageView setHidden:](self->_iconImageView, "setHidden:", a3 == 0);
}

- (UIImage)iconImage
{
  return -[UIImageView image](self->_iconImageView, "image");
}

+ (CGSize)iconImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 24.0;
  v3 = 24.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
