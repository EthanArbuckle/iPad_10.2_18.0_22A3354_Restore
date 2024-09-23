@implementation ICQUISpecifierCellWithAsyncImageLoading

- (ICQUISpecifierCellWithAsyncImageLoading)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ICQUISpecifierCellWithAsyncImageLoading *v4;
  ICQUISpecifierCellWithAsyncImageLoading *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQUISpecifierCellWithAsyncImageLoading;
  v4 = -[ICQUISpecifierCellWithAsyncImageLoading initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[ICQUISpecifierCellWithAsyncImageLoading setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[ICQUISpecifierCellWithAsyncImageLoading _setupViews](v5, "_setupViews");
  }
  return v5;
}

+ (int64_t)cellStyle
{
  return 0;
}

- (void)_setupViews
{
  UILabel *v3;
  UILabel *titleLabel;
  uint64_t v5;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *subtitleLabel;
  void *v10;
  void *v11;
  id v12;
  UIImageView *v13;
  UIImageView *cellImageView;
  id v15;
  UILabel *v16;
  void *v17;
  void *v18;
  double v19;
  UILabel *v20;
  UILabel *accessoryLabel;
  void *v22;
  void *v23;
  double v24;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD v76[11];
  _QWORD v77[4];

  v77[2] = *MEMORY[0x24BDAC8D0];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](self->_titleLabel, "setColor:", v7);

  v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v8;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v10);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](self->_subtitleLabel, "setColor:", v11);

  v12 = objc_alloc(MEMORY[0x24BEBD668]);
  v13 = (UIImageView *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  cellImageView = self->_cellImageView;
  self->_cellImageView = v13;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_cellImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setContentMode:](self->_cellImageView, "setContentMode:", 2);
  v15 = objc_alloc(MEMORY[0x24BEBD978]);
  v16 = self->_subtitleLabel;
  v77[0] = self->_titleLabel;
  v77[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithArrangedSubviews:", v17);

  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v18, "setAxis:", 1);
  objc_msgSend(v18, "setSpacing:", 1.0);
  LODWORD(v19) = 1144750080;
  objc_msgSend(v18, "setContentCompressionResistancePriority:forAxis:", 0, v19);
  v20 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
  accessoryLabel = self->_accessoryLabel;
  self->_accessoryLabel = v20;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_accessoryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_accessoryLabel, "setFont:", v22);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](self->_accessoryLabel, "setColor:", v23);

  -[UILabel setTextAlignment:](self->_accessoryLabel, "setTextAlignment:", 2);
  LODWORD(v24) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_accessoryLabel, "setContentCompressionResistancePriority:forAxis:", 0, v24);
  -[ICQUISpecifierCellWithAsyncImageLoading contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", self->_cellImageView);

  -[ICQUISpecifierCellWithAsyncImageLoading contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v18);

  -[ICQUISpecifierCellWithAsyncImageLoading contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", self->_accessoryLabel);

  v56 = (void *)MEMORY[0x24BDD1628];
  -[UIImageView widthAnchor](self->_cellImageView, "widthAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToConstant:", 29.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v74;
  -[UIImageView heightAnchor](self->_cellImageView, "heightAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToConstant:", 40.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v72;
  -[UIImageView leadingAnchor](self->_cellImageView, "leadingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUISpecifierCellWithAsyncImageLoading contentView](self, "contentView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "layoutMarginsGuide");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "leadingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v76[2] = v67;
  -[UIImageView centerYAnchor](self->_cellImageView, "centerYAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUISpecifierCellWithAsyncImageLoading contentView](self, "contentView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "layoutMarginsGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "centerYAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v76[3] = v62;
  -[UILabel centerYAnchor](self->_accessoryLabel, "centerYAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUISpecifierCellWithAsyncImageLoading contentView](self, "contentView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "layoutMarginsGuide");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "centerYAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v76[4] = v57;
  -[UILabel trailingAnchor](self->_accessoryLabel, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUISpecifierCellWithAsyncImageLoading contentView](self, "contentView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "layoutMarginsGuide");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v52);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v76[5] = v50;
  -[UILabel leadingAnchor](self->_accessoryLabel, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintGreaterThanOrEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v76[6] = v47;
  objc_msgSend(v18, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUISpecifierCellWithAsyncImageLoading contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "layoutMarginsGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 5.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v76[7] = v42;
  objc_msgSend(v18, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUISpecifierCellWithAsyncImageLoading contentView](self, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "layoutMarginsGuide");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, -5.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v76[8] = v37;
  v51 = v18;
  objc_msgSend(v18, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_cellImageView, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 10.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v76[9] = v30;
  objc_msgSend(v18, "centerYAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUISpecifierCellWithAsyncImageLoading contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layoutMarginsGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v76[10] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 11);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "activateConstraints:", v36);

  -[ICQUISpecifierCellWithAsyncImageLoading setAccessoryType:](self, "setAccessoryType:", 1);
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQUISpecifierCellWithAsyncImageLoading;
  -[PSTableCell layoutSubviews](&v4, sel_layoutSubviews);
  -[ICQUISpecifierCellWithAsyncImageLoading imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[ICQUISpecifierCellWithAsyncImageLoading setContentMode:](self, "setContentMode:", 3);
}

- (void)setIcon:(id)a3
{
  -[UIImageView setImage:](self->_cellImageView, "setImage:", a3);
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  UILabel *titleLabel;
  void *v7;
  UILabel *subtitleLabel;
  void *v9;
  void *v10;
  UILabel *accessoryLabel;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICQUISpecifierCellWithAsyncImageLoading;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v13, sel_refreshCellContentsWithSpecifier_, v4);
  -[ICQUISpecifierCellWithAsyncImageLoading textLabel](self, "textLabel", v13.receiver, v13.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", &stru_24E400750);

  titleLabel = self->_titleLabel;
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](titleLabel, "setText:", v7);

  subtitleLabel = self->_subtitleLabel;
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D28]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](subtitleLabel, "setText:", v9);

  objc_msgSend(v4, "target");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      accessoryLabel = self->_accessoryLabel;
      objc_msgSend(v10, "storageUsedLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](accessoryLabel, "setText:", v12);

    }
  }
  -[ICQUISpecifierCellWithAsyncImageLoading setNeedsLayout](self, "setNeedsLayout");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryLabel, 0);
  objc_storeStrong((id *)&self->_cellImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
