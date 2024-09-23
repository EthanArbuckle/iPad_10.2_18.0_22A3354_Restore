@implementation UIDebuggingInformationHierarchyCell

- (void)layoutSubviews
{
  UIButton *v3;
  UIButton *v4;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIButton *disclosureButton;
  __int128 v24;
  UIButton *v25;
  UIButton *v26;
  UIButton *v27;
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
  UIButton *infoButton;
  UILabel *mainLabel;
  UILabel *v43;
  UILabel *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSLayoutConstraint *v49;
  NSLayoutConstraint *disclosureButtonAvailableConstraint;
  void *v51;
  void *v52;
  NSLayoutConstraint *v53;
  NSLayoutConstraint *disclosureButtonUnavailableConstraint;
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
  UILabel *v66;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  id WeakRetained;
  int v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  CGAffineTransform v77;
  CGAffineTransform v78;

  if (!self->_disclosureButton)
  {
    v3 = [UIButton alloc];
    -[UIView bounds](self, "bounds");
    v4 = -[UIButton initWithFrame:](v3, "initWithFrame:");
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(off_1E167A828, "fontWithName:size:", CFSTR("Menlo"), 12.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v4, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v5);

    -[UICollectionViewCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4);

    -[UIView leadingAnchor](v4, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v10, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    -[UIView widthAnchor](v4, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", 10.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[UIView topAnchor](v4, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[UIView bottomAnchor](v4, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[UIButton setTitle:forState:](v4, "setTitle:forState:", CFSTR("▶︎"), 0);
    -[UIControl addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel_deliverToggle, 64);
    +[UIColor blackColor](UIColor, "blackColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v4, "setTitleColor:forState:", v22, 0);

    disclosureButton = self->_disclosureButton;
    self->_disclosureButton = v4;

  }
  if (self->_collapsedBeneath)
  {
    v24 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v78.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v78.c = v24;
    *(_OWORD *)&v78.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  else
  {
    CGAffineTransformMakeRotation(&v78, 1.57079633);
  }
  v25 = self->_disclosureButton;
  v77 = v78;
  -[UIView setTransform:](v25, "setTransform:", &v77);
  -[UIView setHidden:](self->_disclosureButton, "setHidden:", self->_disclosureIndicatorHidden);
  if (!self->_infoButton)
  {
    v26 = [UIButton alloc];
    v27 = -[UIButton initWithFrame:](v26, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("UIAccessoryButtonInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v27, "setImage:forState:", v28, 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UICollectionViewCell contentView](self, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v27);

    -[UIView trailingAnchor](v27, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -8.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 1);

    -[UIView centerYAnchor](v27, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCell contentView](self, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setActive:", 1);

    -[UIView heightAnchor](v27, "heightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToConstant:", 24.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setActive:", 1);

    -[UIView widthAnchor](v27, "widthAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToConstant:", 24.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

    -[UIControl addTarget:action:forControlEvents:](v27, "addTarget:action:forControlEvents:", self, sel_displayDetailsForCell, 64);
    infoButton = self->_infoButton;
    self->_infoButton = v27;

  }
  mainLabel = self->_mainLabel;
  if (!mainLabel)
  {
    v43 = [UILabel alloc];
    -[UIView bounds](self, "bounds");
    v44 = -[UILabel initWithFrame:](v43, "initWithFrame:");
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(off_1E167A828, "fontWithName:size:", CFSTR("Menlo"), 12.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v44, "setFont:", v45);

    -[UICollectionViewCell contentView](self, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addSubview:", v44);

    -[UIView leadingAnchor](v44, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_disclosureButton, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, 3.0);
    v49 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    disclosureButtonAvailableConstraint = self->_disclosureButtonAvailableConstraint;
    self->_disclosureButtonAvailableConstraint = v49;

    -[UIView leadingAnchor](v44, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, 8.0);
    v53 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    disclosureButtonUnavailableConstraint = self->_disclosureButtonUnavailableConstraint;
    self->_disclosureButtonUnavailableConstraint = v53;

    -[UIView trailingAnchor](v44, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_infoButton, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, -3.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setActive:", 1);

    -[UIView topAnchor](v44, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCell contentView](self, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setActive:", 1);

    -[UIView bottomAnchor](v44, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCell contentView](self, "contentView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setActive:", 1);

    v66 = self->_mainLabel;
    self->_mainLabel = v44;

    mainLabel = self->_mainLabel;
  }
  -[UILabel setText:](mainLabel, "setText:", self->_name);
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.9, 1.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v67);

  +[UIColor redColor](UIColor, "redColor");
  v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v69 = objc_msgSend(v68, "CGColor");
  -[UIView layer](self, "layer");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setBorderColor:", v69);

  if (-[UICollectionViewCell isSelected](self, "isSelected")
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        v72 = objc_msgSend(WeakRetained, "shouldHighlightSelectedCells"),
        WeakRetained,
        v72))
  {
    -[UIView layer](self, "layer");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v73;
    v75 = 2.0;
  }
  else
  {
    -[UIView layer](self, "layer");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v73;
    v75 = 0.0;
  }
  objc_msgSend(v73, "setBorderWidth:", v75);

  -[NSLayoutConstraint setActive:](self->_disclosureButtonUnavailableConstraint, "setActive:", self->_disclosureIndicatorHidden);
  -[NSLayoutConstraint setActive:](self->_disclosureButtonAvailableConstraint, "setActive:", !self->_disclosureIndicatorHidden);
  -[UICollectionViewCell contentView](self, "contentView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bringSubviewToFront:", self->_disclosureButton);

}

- (void)deliverToggle
{
  _BOOL4 collapsedBeneath;
  id WeakRetained;
  void *v5;

  collapsedBeneath = self->_collapsedBeneath;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (collapsedBeneath)
    objc_msgSend(WeakRetained, "expandBeneathCell:", self);
  else
    objc_msgSend(WeakRetained, "collapseBeneathCell:", self);

  self->_collapsedBeneath ^= 1u;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)displayDetailsForCell
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "displayDetailsForCell:", self);

}

- (UIButton)infoButton
{
  return self->_infoButton;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDisclosureIndicatorHidden:(BOOL)a3
{
  self->_disclosureIndicatorHidden = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  NSIndexPath *v5;
  NSIndexPath *indexPath;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIDebuggingInformationHierarchyCell;
  v4 = a3;
  -[UICollectionReusableView applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "indexPath", v7.receiver, v7.super_class);
  v5 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();

  indexPath = self->_indexPath;
  self->_indexPath = v5;

}

- (void)prepareForReuse
{
  UILabel *mainLabel;
  NSIndexPath *indexPath;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIDebuggingInformationHierarchyCell;
  -[UICollectionViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[UIView removeFromSuperview](self->_mainLabel, "removeFromSuperview");
  mainLabel = self->_mainLabel;
  self->_mainLabel = 0;

  indexPath = self->_indexPath;
  self->_indexPath = 0;

  self->_disclosureIndicatorHidden = 0;
}

- (NSString)name
{
  return self->_name;
}

- (UIDebuggingInformationHierarchyCellDelegate)delegate
{
  return (UIDebuggingInformationHierarchyCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)disclosureIndicatorHidden
{
  return self->_disclosureIndicatorHidden;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_disclosureButtonUnavailableConstraint, 0);
  objc_storeStrong((id *)&self->_disclosureButtonAvailableConstraint, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
  objc_storeStrong((id *)&self->_disclosureButton, 0);
}

@end
