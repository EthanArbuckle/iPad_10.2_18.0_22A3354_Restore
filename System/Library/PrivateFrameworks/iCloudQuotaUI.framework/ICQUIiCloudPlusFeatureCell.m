@implementation ICQUIiCloudPlusFeatureCell

- (ICQUIiCloudPlusFeatureCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ICQUIiCloudPlusFeatureCell *v4;
  ICQUIiCloudPlusFeatureCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQUIiCloudPlusFeatureCell;
  v4 = -[ICQUIiCloudPlusFeatureCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[ICQUIiCloudPlusFeatureCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[ICQUIiCloudPlusFeatureCell setEnabled:](v5, "setEnabled:", 1);
    -[ICQUIiCloudPlusFeatureCell _setupViews](v5, "_setupViews");
  }
  return v5;
}

- (void)_setupViews
{
  id v3;
  UIImageView *v4;
  UIImageView *cellImageView;
  UILabel *v6;
  UILabel *titleLabel;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
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
  _QWORD v45[9];

  v45[7] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEBD668]);
  v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  cellImageView = self->_cellImageView;
  self->_cellImageView = v4;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_cellImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_cellImageView, "setContentMode:", 1);
  v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v6;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE220], *MEMORY[0x24BEBB608]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v8, "setFont:", v9);

  v10 = self->_titleLabel;
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](v10, "setColor:", v11);

  -[ICQUIiCloudPlusFeatureCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_titleLabel);

  -[ICQUIiCloudPlusFeatureCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_cellImageView);

  v33 = (void *)MEMORY[0x24BDD1628];
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUIiCloudPlusFeatureCell contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "layoutMarginsGuide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v41, 42.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v40;
  -[UILabel centerYAnchor](self->_titleLabel, "centerYAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUIiCloudPlusFeatureCell contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "layoutMarginsGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "centerYAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v35;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUIiCloudPlusFeatureCell contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "layoutMarginsGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v29;
  -[UIImageView widthAnchor](self->_cellImageView, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToConstant:", 24.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v27;
  -[UIImageView heightAnchor](self->_cellImageView, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", 24.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v25;
  -[UIImageView leadingAnchor](self->_cellImageView, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUIiCloudPlusFeatureCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layoutMarginsGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v16;
  -[UIImageView centerYAnchor](self->_cellImageView, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUIiCloudPlusFeatureCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v22);

  -[ICQUIiCloudPlusFeatureCell setAccessoryType:](self, "setAccessoryType:", 1);
}

- (void)setIcon:(id)a3
{
  -[UIImageView setImage:](self->_cellImageView, "setImage:", a3);
}

+ (int64_t)cellStyle
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICQUIiCloudPlusFeatureCell;
  -[PSTableCell layoutSubviews](&v12, sel_layoutSubviews);
  -[ICQUIiCloudPlusFeatureCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUIiCloudPlusFeatureCell setSeparatorColor:](self, "setSeparatorColor:", v4);

  LODWORD(v4) = self->_isLastCell;
  -[ICQUIiCloudPlusFeatureCell layoutMargins](self, "layoutMargins");
  v6 = v5;
  v8 = v7;
  -[ICQUIiCloudPlusFeatureCell layoutMargins](self, "layoutMargins");
  if ((_DWORD)v4)
  {
    v10 = v9;
    -[ICQUIiCloudPlusFeatureCell layoutMargins](self, "layoutMargins");
    v11 = 20.0;
    v8 = v10;
  }
  else
  {
    v6 = 0.0;
    v11 = 0.0;
  }
  -[ICQUIiCloudPlusFeatureCell setLayoutMargins:](self, "setLayoutMargins:", v6, v8, v11);
  -[ICQUIiCloudPlusFeatureCell setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UILabel *titleLabel;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICQUIiCloudPlusFeatureCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v9, sel_refreshCellContentsWithSpecifier_, v4);
  -[ICQUIiCloudPlusFeatureCell textLabel](self, "textLabel", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", &stru_24E400750);

  objc_msgSend(v4, "propertyForKey:", CFSTR("LAST_ITEM_KEY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isLastCell = v6 != 0;

  titleLabel = self->_titleLabel;
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](titleLabel, "setText:", v8);
  -[ICQUIiCloudPlusFeatureCell setNeedsLayout](self, "setNeedsLayout");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_cellImageView, 0);
}

@end
