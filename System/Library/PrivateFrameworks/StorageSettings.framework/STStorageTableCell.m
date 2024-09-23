@implementation STStorageTableCell

- (int64_t)size
{
  return self->_size;
}

- (void)setSizeString:(id)a3
{
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;

  v13 = (__CFString *)a3;
  if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("…")))
  {
    -[UILabel setText:](self->_sizeLabel, "setText:", 0);
    -[STStorageTableCell spinner](self, "spinner");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString startAnimating](v4, "startAnimating");
  }
  else
  {
    -[STStorageTableCell spinner](self, "spinner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopAnimating");

    -[UILabel text](self->_sizeLabel, "text");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_24C756F10;
    v4 = v8;

    if (v13)
      v9 = v13;
    else
      v9 = &stru_24C756F10;
    v10 = v9;
    if ((-[__CFString isEqualToString:](v4, "isEqualToString:", v10) & 1) == 0)
    {
      if (-[__CFString length](v13, "length"))
        v11 = v13;
      else
        v11 = 0;
      -[UILabel setText:](self->_sizeLabel, "setText:", v11);
      -[STStorageTableCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNeedsLayout");

    }
  }

}

- (UIActivityIndicatorView)spinner
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 1320, 1);
}

- (void)setInfo:(id)a3
{
  __CFString *v4;
  const __CFString *v5;

  v4 = (__CFString *)a3;
  if (-[__CFString length](v4, "length"))
    v5 = v4;
  else
    v5 = &stru_24C756F10;
  -[UILabel setText:](self->_infoLabel, "setText:", v5);

  -[STStorageTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (STStorageTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STStorageTableCell *v5;
  STStorageTableCell *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  UIImageView *iconView;
  uint64_t v17;
  NSLayoutConstraint *iconSizeConstraint;
  uint64_t v19;
  UIView *titleInfoView;
  double v21;
  double v22;
  uint64_t v23;
  UILabel *titleLabel;
  double v25;
  double v26;
  uint64_t v27;
  UIImageView *cloudIconView;
  void *v29;
  void *v30;
  uint64_t v31;
  UILabel *infoLabel;
  void *v33;
  double v34;
  double v35;
  uint64_t v36;
  UILabel *sizeLabel;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  UIActivityIndicatorView *spinner;
  double v43;
  double v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSLayoutConstraint *minHeightConstraint;
  double v49;
  uint64_t v50;
  NSLayoutConstraint *cloudIconConstraint;
  uint64_t v52;
  NSLayoutConstraint *noCloudIconConstraint;
  void *v55;
  void *v56;
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)STStorageTableCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v57, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[STStorageTableCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77C0]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v11 = *MEMORY[0x24BDBF090];
    v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x24BDBF090], v12, v13, v14);
    iconView = v6->_iconView;
    v6->_iconView = (UIImageView *)v15;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6->_iconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIdentifier:](v6->_iconView, "setAccessibilityIdentifier:", CFSTR("Icon"));
    -[UIImageView setContentMode:](v6->_iconView, "setContentMode:", 1);
    objc_msgSend(v7, "addSubview:", v6->_iconView);
    objc_msgSend(v9, "addObject:", v6->_iconView);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_iconView, 8, 0, 0, 0, 0.0, 29.0);
    v17 = objc_claimAutoreleasedReturnValue();
    iconSizeConstraint = v6->_iconSizeConstraint;
    v6->_iconSizeConstraint = (NSLayoutConstraint *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v11, v12, v13, v14);
    titleInfoView = v6->_titleInfoView;
    v6->_titleInfoView = (UIView *)v19;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_titleInfoView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v21) = 1144750080;
    -[UIView setContentHuggingPriority:forAxis:](v6->_titleInfoView, "setContentHuggingPriority:forAxis:", 1, v21);
    LODWORD(v22) = 1144750080;
    -[UIView setContentCompressionResistancePriority:forAxis:](v6->_titleInfoView, "setContentCompressionResistancePriority:forAxis:", 1, v22);
    objc_msgSend(v7, "addSubview:", v6->_titleInfoView);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v11, v12, v13, v14);
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = (UILabel *)v23;

    v55 = (void *)v8;
    -[UILabel setFont:](v6->_titleLabel, "setFont:", v8);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v6->_titleLabel, "setAccessibilityIdentifier:", CFSTR("Title"));
    -[UILabel setNumberOfLines:](v6->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](v6->_titleLabel, "setLineBreakMode:", 4);
    -[UILabel setAllowsDefaultTighteningForTruncation:](v6->_titleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v6->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v25) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v6->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v25);
    LODWORD(v26) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v6->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v26);
    -[UIView addSubview:](v6->_titleInfoView, "addSubview:", v6->_titleLabel);
    objc_msgSend(v9, "addObject:", v6->_titleLabel);
    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v11, v12, v13, v14);
    cloudIconView = v6->_cloudIconView;
    v6->_cloudIconView = (UIImageView *)v27;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6->_cloudIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIdentifier:](v6->_cloudIconView, "setAccessibilityIdentifier:", CFSTR("CloudIcon"));
    -[UIImageView setContentMode:](v6->_cloudIconView, "setContentMode:", 1);
    -[UIImageView setHidden:](v6->_cloudIconView, "setHidden:", 1);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("icloud.and.arrow.down"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v6->_cloudIconView, "setImage:", v29);

    -[STStorageTableCell _cloudIconColor](v6, "_cloudIconColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v6->_cloudIconView, "setTintColor:", v30);

    -[UIView addSubview:](v6->_titleInfoView, "addSubview:", v6->_cloudIconView);
    objc_msgSend(v9, "addObject:", v6->_cloudIconView);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v11, v12, v13, v14);
    infoLabel = v6->_infoLabel;
    v6->_infoLabel = (UILabel *)v31;

    -[UILabel setFont:](v6->_infoLabel, "setFont:", v56);
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->_sizeLabel, "setTextColor:", v33);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_infoLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v6->_infoLabel, "setAccessibilityIdentifier:", CFSTR("Info"));
    -[UILabel setNumberOfLines:](v6->_infoLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](v6->_infoLabel, "setLineBreakMode:", 4);
    -[UILabel setAllowsDefaultTighteningForTruncation:](v6->_infoLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v6->_infoLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v34) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v6->_infoLabel, "setContentHuggingPriority:forAxis:", 1, v34);
    LODWORD(v35) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v6->_infoLabel, "setContentCompressionResistancePriority:forAxis:", 1, v35);
    -[UIView addSubview:](v6->_titleInfoView, "addSubview:", v6->_infoLabel);
    objc_msgSend(v9, "addObject:", v6->_infoLabel);
    v36 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v11, v12, v13, v14);
    sizeLabel = v6->_sizeLabel;
    v6->_sizeLabel = (UILabel *)v36;

    -[UILabel setFont:](v6->_sizeLabel, "setFont:", v8);
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->_sizeLabel, "setTextColor:", v38);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_sizeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v6->_sizeLabel, "setAccessibilityIdentifier:", CFSTR("Size"));
    -[UILabel setNumberOfLines:](v6->_sizeLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](v6->_sizeLabel, "setLineBreakMode:", 4);
    -[UILabel setAdjustsFontForContentSizeCategory:](v6->_sizeLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v39) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v6->_sizeLabel, "setContentHuggingPriority:forAxis:", 0, v39);
    LODWORD(v40) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v6->_sizeLabel, "setContentCompressionResistancePriority:forAxis:", 0, v40);
    objc_msgSend(v7, "addSubview:", v6->_sizeLabel);
    objc_msgSend(v9, "addObject:", v6->_sizeLabel);
    v41 = objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithFrame:", v11, v12, v13, v14);
    spinner = v6->_spinner;
    v6->_spinner = (UIActivityIndicatorView *)v41;

    -[UIActivityIndicatorView setEnabled:](v6->_spinner, "setEnabled:", 0);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v6->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setAccessibilityIdentifier:](v6->_spinner, "setAccessibilityIdentifier:", CFSTR("Spinner"));
    -[UIActivityIndicatorView setHidesWhenStopped:](v6->_spinner, "setHidesWhenStopped:", 1);
    LODWORD(v43) = 1148846080;
    -[UIActivityIndicatorView setContentHuggingPriority:forAxis:](v6->_spinner, "setContentHuggingPriority:forAxis:", 0, v43);
    LODWORD(v44) = 1148846080;
    -[UIActivityIndicatorView setContentCompressionResistancePriority:forAxis:](v6->_spinner, "setContentCompressionResistancePriority:forAxis:", 0, v44);
    objc_msgSend(v7, "addSubview:", v6->_spinner);
    objc_msgSend(v9, "addObject:", v6->_spinner);
    objc_msgSend(v7, "setAccessibilityElements:", v9);
    v45 = (void *)MEMORY[0x24BDD1628];
    -[STStorageTableCell contentView](v6, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v46, 8, 1, 0, 0, 0.0, 0.0);
    v47 = objc_claimAutoreleasedReturnValue();
    minHeightConstraint = v6->_minHeightConstraint;
    v6->_minHeightConstraint = (NSLayoutConstraint *)v47;

    LODWORD(v49) = 1144750080;
    -[NSLayoutConstraint setPriority:](v6->_minHeightConstraint, "setPriority:", v49);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_titleLabel, 5, 0, v6->_titleInfoView, 5, 1.0, 0.0);
    v50 = objc_claimAutoreleasedReturnValue();
    cloudIconConstraint = v6->_cloudIconConstraint;
    v6->_cloudIconConstraint = (NSLayoutConstraint *)v50;

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_titleLabel, 5, 0, v6->_titleInfoView, 5, 1.0, 0.0);
    v52 = objc_claimAutoreleasedReturnValue();
    noCloudIconConstraint = v6->_noCloudIconConstraint;
    v6->_noCloudIconConstraint = (NSLayoutConstraint *)v52;

    -[STStorageTableCell setupTitleAndInfoConstraints](v6, "setupTitleAndInfoConstraints");
    -[STStorageTableCell setNeedsUpdateConstraints](v6, "setNeedsUpdateConstraints");

  }
  return v6;
}

- (void)setupTitleAndInfoConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *infoConstraints;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", self->_noCloudIconConstraint);
  objc_msgSend(v3, "addObject:", self->_cloudIconConstraint);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_cloudIconView, 5, 0, self->_titleInfoView, 5, 1.0, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_cloudIconView, 12, 0, self->_titleLabel, 12, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_cloudIconView, 8, 0, 0, 0, 0.0, 22.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  -[UIImageView sizeToFit](self->_cloudIconView, "sizeToFit");
  -[UIImageView size](self->_cloudIconView, "size");
  -[NSLayoutConstraint setConstant:](self->_cloudIconConstraint, "setConstant:", v7 + 5.0);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleInfoView, 6, 1, self->_titleLabel, 6, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 3, 0, self->_titleInfoView, 3, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleInfoView, 4, 1, self->_titleLabel, 4, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_infoLabel, 5, 0, self->_titleInfoView, 5, 1.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v11, "addObject:", v12);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_infoLabel, 6, -1, self->_titleInfoView, 6, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v11, "addObject:", v13);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_infoLabel, 3, 0, self->_titleLabel, 4, 1.0, 2.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v11, "addObject:", v14);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleInfoView, 4, 1, self->_infoLabel, 4, 1.0, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v11, "addObject:", v15);

  infoConstraints = self->_infoConstraints;
  self->_infoConstraints = v11;

}

+ (double)defaultCellHeight
{
  return *MEMORY[0x24BDF7DE0];
}

- (void)createNormalFontConstraints
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *sizeRightConstraint;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *normalFontConstraints;
  id v17;

  -[STStorageTableCell contentView](self, "contentView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 16);
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_iconView, 5, 0, v17, 5, 1.0, 15.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_iconView, 7, 0, self->_iconView, 8, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_iconView, 10, 0, v17, 10, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_sizeLabel, 6, 0, v17, 6, 1.0, 0.0);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  sizeRightConstraint = self->_sizeRightConstraint;
  self->_sizeRightConstraint = v7;

  -[NSMutableArray addObject:](v3, "addObject:", self->_sizeRightConstraint);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_sizeLabel, 10, 0, v17, 10, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleInfoView, 5, 0, self->_iconView, 6, 1.0, 15.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v10);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleInfoView, 6, 0, self->_sizeLabel, 5, 1.0, -10.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v11);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleInfoView, 10, 0, v17, 10, 1.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v12);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleInfoView, 10, 1, v17, 10, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v13);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_spinner, 10, 0, v17, 10, 1.0, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v14);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_spinner, 6, 0, v17, 6, 1.0, -10.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v15);

  normalFontConstraints = self->_normalFontConstraints;
  self->_normalFontConstraints = v3;

}

- (void)createLargeFontConstraints
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *largeFontConstraints;
  id v18;

  -[STStorageTableCell contentView](self, "contentView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 12);
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_iconView, 5, 0, v18, 5, 1.0, 10.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_iconView, 7, 0, self->_iconView, 8, 1.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_iconView, 4, 0, self->_titleLabel, 12, 1.0, 2.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleInfoView, 5, 0, self->_iconView, 6, 1.0, 15.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v7);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleInfoView, 6, 0, v18, 6, 1.0, -10.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v8);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleInfoView, 3, 0, v18, 3, 1.0, 12.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 4, 1, self->_titleInfoView, 4, 1.0, 12.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v10);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_sizeLabel, 5, 0, self->_iconView, 6, 1.0, 15.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v11);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_sizeLabel, 6, -1, v18, 6, 1.0, -10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v12);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_sizeLabel, 3, 0, self->_titleInfoView, 4, 1.0, 2.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v13);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v18, 4, 1, self->_sizeLabel, 4, 1.0, 12.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v14);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_spinner, 10, 0, v18, 10, 1.0, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v15);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_spinner, 6, 0, v18, 6, 1.0, -10.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v16);

  largeFontConstraints = self->_largeFontConstraints;
  self->_largeFontConstraints = v3;

}

- (void)updateConstraints
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  int v18;
  NSMutableArray *infoConstraints;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSLayoutConstraint **p_noCloudIconConstraint;
  void *v26;
  void *v27;
  double v28;
  objc_super v29;
  NSLayoutConstraint *cloudIconConstraint;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *noCloudIconConstraint;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  -[STStorageTableCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77C0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ascender");
  v9 = v8;
  objc_msgSend(v6, "descender");
  v11 = v9 - v10;
  objc_msgSend(v7, "ascender");
  v13 = v12;
  objc_msgSend(v7, "descender");
  v15 = v11 + v13 - v14 + 2.0 + 12.0 + 12.0;
  if (IsAccessibilityCategory)
  {
    if (!self->_largeFontConstraints)
      -[STStorageTableCell createLargeFontConstraints](self, "createLargeFontConstraints");
    if (self->_normalFontConstraints)
      objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:");
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_largeFontConstraints);
    -[NSLayoutConstraint setActive:](self->_sizeRightConstraint, "setActive:", 0);
    -[UILabel setNumberOfLines:](self->_infoLabel, "setNumberOfLines:", 3);
    v15 = v11 + 2.0 + v15;
  }
  else
  {
    if (!self->_normalFontConstraints)
      -[STStorageTableCell createNormalFontConstraints](self, "createNormalFontConstraints");
    if (self->_largeFontConstraints)
      objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:");
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_normalFontConstraints);
    v16 = -[STStorageTableCell accessoryType](self, "accessoryType");
    v17 = -15.0;
    if (v16 == 1)
      v17 = 0.0;
    -[NSLayoutConstraint setConstant:](self->_sizeRightConstraint, "setConstant:", v17);
    -[NSLayoutConstraint setActive:](self->_sizeRightConstraint, "setActive:", 1);
    -[UILabel setNumberOfLines:](self->_infoLabel, "setNumberOfLines:", 1);
  }
  v18 = -[UILabel isHidden](self->_infoLabel, "isHidden");
  infoConstraints = self->_infoConstraints;
  if (v18)
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", infoConstraints);
  else
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", infoConstraints);
  v20 = -[UIImageView isHidden](self->_cloudIconView, "isHidden");
  v21 = (void *)MEMORY[0x24BDD1628];
  if (v20)
  {
    v33[0] = self->_cloudIconConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deactivateConstraints:", v22);

    v23 = (void *)MEMORY[0x24BDD1628];
    noCloudIconConstraint = self->_noCloudIconConstraint;
    v24 = (void *)MEMORY[0x24BDBCE30];
    p_noCloudIconConstraint = &noCloudIconConstraint;
  }
  else
  {
    v31 = self->_noCloudIconConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deactivateConstraints:", v26);

    v23 = (void *)MEMORY[0x24BDD1628];
    cloudIconConstraint = self->_cloudIconConstraint;
    v24 = (void *)MEMORY[0x24BDBCE30];
    p_noCloudIconConstraint = &cloudIconConstraint;
  }
  objc_msgSend(v24, "arrayWithObjects:count:", p_noCloudIconConstraint, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v27);

  v28 = 39.0;
  if (v15 >= 39.0)
    v28 = v15;
  -[NSLayoutConstraint setConstant:](self->_minHeightConstraint, "setConstant:", v28);
  -[NSLayoutConstraint setActive:](self->_minHeightConstraint, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_iconSizeConstraint, "setActive:", 1);
  v29.receiver = self;
  v29.super_class = (Class)STStorageTableCell;
  -[STStorageTableCell updateConstraints](&v29, sel_updateConstraints);
  -[STStorageTableCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STStorageTableCell;
  -[STStorageTableCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[STStorageTableCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setIcon:(id)a3
{
  -[UIImageView setImage:](self->_iconView, "setImage:", a3);
}

- (UIImage)icon
{
  return -[UIImageView image](self->_iconView, "image");
}

- (void)setTitle:(id)a3
{
  __CFString *v4;
  const __CFString *v5;

  v4 = (__CFString *)a3;
  if (-[__CFString length](v4, "length"))
    v5 = v4;
  else
    v5 = &stru_24C756F10;
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  -[STStorageTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (NSString)info
{
  return -[UILabel text](self->_infoLabel, "text");
}

- (BOOL)infoHidden
{
  return -[UILabel isHidden](self->_infoLabel, "isHidden");
}

- (void)setInfoHidden:(BOOL)a3
{
  -[UILabel setHidden:](self->_infoLabel, "setHidden:", a3);
  -[STStorageTableCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (NSString)sizeString
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[UILabel text](self->_sizeLabel, "text");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24C756F10;
  v4 = v2;

  return v4;
}

- (void)setSize:(int64_t)a3
{
  id v4;

  if (a3 < 0)
  {
    -[STStorageTableCell setSizeString:](self, "setSizeString:", CFSTR("…"));
  }
  else if (self->_size != a3)
  {
    self->_size = a3;
    STFormattedSize();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[STStorageTableCell setSizeString:](self, "setSizeString:", v4);

  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)STStorageTableCell;
  -[STStorageTableCell setEnabled:](&v5, sel_setEnabled_);
  -[UILabel setEnabled:](self->_titleLabel, "setEnabled:", v3);
}

- (BOOL)cloudIconHidden
{
  return -[UIImageView isHidden](self->_cloudIconView, "isHidden");
}

- (void)setCloudIconHidden:(BOOL)a3
{
  id v4;

  -[UIImageView setHidden:](self->_cloudIconView, "setHidden:", a3);
  -[STStorageTableCell contentView](self, "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateConstraints");

}

- (id)_cloudIconColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
}

- (void)setSpinner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1320);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cloudIconView, 0);
  objc_storeStrong((id *)&self->_sizeLabel, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleInfoView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_cloudIconConstraint, 0);
  objc_storeStrong((id *)&self->_noCloudIconConstraint, 0);
  objc_storeStrong((id *)&self->_minHeightConstraint, 0);
  objc_storeStrong((id *)&self->_sizeRightConstraint, 0);
  objc_storeStrong((id *)&self->_iconSizeConstraint, 0);
  objc_storeStrong((id *)&self->_infoConstraints, 0);
  objc_storeStrong((id *)&self->_largeFontConstraints, 0);
  objc_storeStrong((id *)&self->_normalFontConstraints, 0);
}

@end
