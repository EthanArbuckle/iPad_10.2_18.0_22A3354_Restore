@implementation SFPersonCollectionViewCell

+ (CGSize)_cachedPreferredItemSizeForViewWidth:(double)a3 sizeCategory:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(a1, "_cachedPreferredItemSizeForString:viewWidth:sizeCategory:", CFSTR("Apple\nInc."), a4, a3);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)_cachedPreferredItemSizeForString:(id)a3 viewWidth:(double)a4 sizeCategory:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  SFPersonCollectionViewCell *v12;
  SFPersonCollectionViewCell *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%ld-%@"), v7, (uint64_t)a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  getCachedPreferredItemSizesByString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = (SFPersonCollectionViewCell *)(id)__prototypeActivityCell;
    if (!v12)
    {
      v13 = objc_alloc_init(SFPersonCollectionViewCell);
      v14 = (void *)__prototypeActivityCell;
      __prototypeActivityCell = (uint64_t)v13;

      v12 = v13;
      -[SFPersonCollectionViewCell nameLabel](v12, "nameLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAdjustsFontSizeToFitWidth:", 0);

    }
    -[SFPersonCollectionViewCell nameLabel](v12, "nameLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v7);

    -[SFPersonCollectionViewCell calculatedContentSizeForSheetWidth:sizeCategory:](v12, "calculatedContentSizeForSheetWidth:sizeCategory:", v8, a4);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    getCachedPreferredItemSizesByString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v11, v9);

  }
  objc_msgSend(v11, "CGSizeValue");
  v19 = v18;
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (SFPersonCollectionViewCell)initWithFrame:(CGRect)a3
{
  SFPersonCollectionViewCell *v3;
  SFPersonCollectionViewCell *v4;
  NSArray *progressKeyPaths;
  SFPersonImageView *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SFCircleProgressView *v18;
  SFCircleProgressView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSString *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
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
  uint64_t v49;
  SFPersonCollectionViewCell *v50;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)SFPersonCollectionViewCell;
  v3 = -[SFPersonCollectionViewCell initWithFrame:](&v52, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    progressKeyPaths = v3->_progressKeyPaths;
    v3->_progressKeyPaths = (NSArray *)&unk_24CE21E20;

    v6 = objc_alloc_init(SFPersonImageView);
    -[SFPersonImageView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SFPersonImageView setContentMode:](v6, "setContentMode:", 2);
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");
    -[SFPersonImageView layer](v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShadowColor:", v8);

    -[SFPersonImageView layer](v6, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1032805417;
    objc_msgSend(v10, "setShadowOpacity:", v11);

    v12 = *MEMORY[0x24BDBF148];
    v13 = *(double *)(MEMORY[0x24BDBF148] + 8);
    -[SFPersonImageView layer](v6, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShadowOffset:", v12, v13);

    -[SFPersonImageView layer](v6, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShadowRadius:", 10.0);

    -[SFPersonImageView layer](v6, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShadowPathIsBounds:", 1);

    -[SFPersonCollectionViewCell setImageView:](v4, "setImageView:", v6);
    -[SFPersonCollectionViewCell contentView](v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v6);

    v18 = [SFCircleProgressView alloc];
    v19 = -[SFCircleProgressView initWithFrame:](v18, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[SFCircleProgressView setProgressLineWidth:](v19, "setProgressLineWidth:", 2.0);
    -[SFCircleProgressView setShowProgressTray:](v19, "setShowProgressTray:", 1);
    -[SFCircleProgressView setAlpha:](v19, "setAlpha:", 1.0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCircleProgressView setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[SFCircleProgressView setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCircleProgressView setUsesRoundedLineCap:](v19, "setUsesRoundedLineCap:", objc_msgSend(v21, "userInterfaceIdiom") == 6);

    -[SFPersonCollectionViewCell setCircleProgressView:](v4, "setCircleProgressView:", v19);
    -[SFPersonCollectionViewCell contentView](v4, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v19);

    -[SFPersonCollectionViewCell traitCollection](v4, "traitCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "preferredContentSizeCategory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    createNameLabel(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPersonCollectionViewCell setNameLabel:](v4, "setNameLabel:", v25);

    -[SFPersonCollectionViewCell contentView](v4, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPersonCollectionViewCell nameLabel](v4, "nameLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v27);

    -[SFPersonCollectionViewCell traitCollection](v4, "traitCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "preferredContentSizeCategory");
    v29 = (NSString *)objc_claimAutoreleasedReturnValue();
    v30 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTextColor:", v31);

    objc_msgSend(v30, "_screen");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _SFPersonLabelFont();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFont:", v33);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBackgroundColor:", v34);

    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x24BEBE098], v29) == NSOrderedAscending)
      v35 = 4;
    else
      v35 = 1;
    objc_msgSend(v30, "setTextAlignment:", v35);
    objc_msgSend(v30, "setNumberOfLines:", 1);
    objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v36) = 0.75;
    objc_msgSend(v30, "_setHyphenationFactor:", v36);
    -[SFPersonCollectionViewCell setSecondLabel:](v4, "setSecondLabel:", v30);

    -[SFPersonCollectionViewCell contentView](v4, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPersonCollectionViewCell secondLabel](v4, "secondLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", v38);

    -[SFPersonCollectionViewCell traitCollection](v4, "traitCollection");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "preferredContentSizeCategory");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    createNameLabel(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPersonCollectionViewCell setLabelForPositioning:](v4, "setLabelForPositioning:", v41);

    -[SFPersonCollectionViewCell labelForPositioning](v4, "labelForPositioning");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAlpha:", 0.0);

    -[SFPersonCollectionViewCell labelForPositioning](v4, "labelForPositioning");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setText:", CFSTR("Apple\nInc"));

    -[SFPersonCollectionViewCell contentView](v4, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPersonCollectionViewCell labelForPositioning](v4, "labelForPositioning");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addSubview:", v45);

    -[SFPersonCollectionViewCell contentView](v4, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setBackgroundColor:", v47);

    objc_msgSend(v46, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[SFPersonCollectionViewCell setupConstraintsYukon](v4, "setupConstraintsYukon");
    -[SFPersonCollectionViewCell prepareHapticsPreWarm:](v4, "prepareHapticsPreWarm:", 0);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "userInterfaceIdiom");

    if (v49 == 6)
      -[SFPersonCollectionViewCell _setCornerRadius:](v4, "_setCornerRadius:", 12.0);
    v50 = v4;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SFPersonCollectionViewCell setPerson:](self, "setPerson:", 0);
  -[SFPersonCollectionViewCell setProgress:](self, "setProgress:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SFPersonCollectionViewCell;
  -[SFPersonCollectionViewCell dealloc](&v3, sel_dealloc);
}

- (void)setupConstraints
{
  uint64_t v3;
  uint64_t v4;
  double ChickletSize;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *cellWidthConstraint;
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
  UILabel *nameLabel;
  void *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *chickletToTitleSpacingConstraint;
  void *v31;
  void *v32;
  void *v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *secondLabelFBConstraint;
  void *v36;
  NSLayoutConstraint *v37;
  NSLayoutConstraint *largeTextNameCenterYConstraint;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  UILabel *v44;
  void *v45;
  void *v46;
  void *v47;
  UILabel *secondLabel;
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
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  _QWORD v96[2];
  _QWORD v97[10];
  _QWORD v98[7];
  _QWORD v99[11];

  v99[9] = *MEMORY[0x24BDAC8D0];
  -[SFPersonCollectionViewCell circleProgressView](self, "circleProgressView");
  v3 = objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell contentView](self, "contentView");
  v4 = objc_claimAutoreleasedReturnValue();
  ChickletSize = getChickletSize();
  v7 = v6;
  v8 = (void *)MEMORY[0x24BDD1628];
  -[SFPersonCollectionViewCell imageView](self, "imageView", ChickletSize);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 7, 0, v90, 7, 1.0, 10.0);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v87;
  v9 = (void *)MEMORY[0x24BDD1628];
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 8, 0, v84, 8, 1.0, 10.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v81;
  v10 = (void *)MEMORY[0x24BDD1628];
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)v3;
  objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 9, 0, v80, 9, 1.0, 0.0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v99[2] = v78;
  v11 = (void *)MEMORY[0x24BDD1628];
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 10, 0, v76, 10, 1.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v99[3] = v12;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 7, 0, 0, 0, 1.0, 0.0);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  cellWidthConstraint = self->_cellWidthConstraint;
  self->_cellWidthConstraint = v13;

  v99[4] = v13;
  v15 = (void *)MEMORY[0x24BDD1628];
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 8, 0, 0, 0, 1.0, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v99[5] = v17;
  v18 = (void *)MEMORY[0x24BDD1628];
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 7, 0, 0, 0, 1.0, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v99[6] = v20;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_nameLabel, 6, 0, v4, 6, 1.0, -0.5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v99[7] = v21;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_secondLabel, 6, 0, v4, 6, 1.0, -0.5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v99[8] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 9);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x24BDD1628];
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v91, 3, 0, v4, 3, 1.0, 0.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v88;
  v24 = (void *)MEMORY[0x24BDD1628];
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v4;
  objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v85, 9, 0, v4, 9, 1.0, 0.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v98[1] = v82;
  v26 = (void *)MEMORY[0x24BDD1628];
  nameLabel = self->_nameLabel;
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", nameLabel, 12, 0, v28, 4, 1.0, 0.0);
  v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  chickletToTitleSpacingConstraint = self->_chickletToTitleSpacingConstraint;
  self->_chickletToTitleSpacingConstraint = v29;

  v98[2] = v29;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 4, 0, self->_secondLabel, 11, 1.0, 0.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v98[3] = v31;
  v95 = v25;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_nameLabel, 5, 0, v25, 5, 1.0, 0.5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v98[4] = v32;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_secondLabel, 5, 0, v25, 5, 1.0, 0.5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v98[5] = v33;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_secondLabel, 3, 0, self->_nameLabel, 12, 1.0, 3.0);
  v34 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  secondLabelFBConstraint = self->_secondLabelFBConstraint;
  self->_secondLabelFBConstraint = v34;

  v98[6] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell setRegularConstraints:](self, "setRegularConstraints:", v36);

  -[UILabel centerYAnchor](self->_labelForPositioning, "centerYAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "centerYAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "constraintEqualToAnchor:", v86);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = v83;
  -[UILabel leadingAnchor](self->_labelForPositioning, "leadingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "trailingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:constant:", v75, 10.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v74;
  -[UILabel trailingAnchor](self->_labelForPositioning, "trailingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v72, -0.5);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2] = v71;
  -[UILabel firstBaselineAnchor](self->_secondLabel, "firstBaselineAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](self->_labelForPositioning, "lastBaselineAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v97[3] = v68;
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "topAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintGreaterThanOrEqualToAnchor:constant:", v65, 5.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v97[4] = v64;
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintLessThanOrEqualToAnchor:constant:", v61, -5.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v97[5] = v60;
  -[UILabel centerYAnchor](self->_nameLabel, "centerYAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "centerYAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v57);
  v37 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  largeTextNameCenterYConstraint = self->_largeTextNameCenterYConstraint;
  self->_largeTextNameCenterYConstraint = v37;

  v97[6] = v37;
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, 5.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v97[7] = v42;
  v43 = (void *)MEMORY[0x24BDD1628];
  v44 = self->_nameLabel;
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v44, 5, 0, v45, 6, 1.0, 10.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v97[8] = v46;
  v47 = (void *)MEMORY[0x24BDD1628];
  secondLabel = self->_secondLabel;
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", secondLabel, 5, 0, v49, 6, 1.0, 10.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v97[9] = v50;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97, 10);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell setLargeTextConstraints:](self, "setLargeTextConstraints:", v51);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_nameLabel, 11, 0, self->_nameLabel, 12, 1.0, 0.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v52;
  -[UILabel firstBaselineAnchor](self->_nameLabel, "firstBaselineAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel firstBaselineAnchor](self->_labelForPositioning, "firstBaselineAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v96[1] = v55;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v96, 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell setSecondLabelVisibleConstraintsArray:](self, "setSecondLabelVisibleConstraintsArray:", v56);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v93);
}

- (void)setupConstraintsYukon
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
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
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSString *v54;
  NSComparisonResult v55;
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
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  _QWORD v194[2];
  _QWORD v195[19];
  _QWORD v196[18];

  v196[16] = *MEMORY[0x24BDAC8D0];
  -[SFPersonCollectionViewCell circleProgressView](self, "circleProgressView");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell contentView](self, "contentView");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v190 = v4;
  if (v4 == 6)
  {
    v5 = 8.0;
    v6 = -8.0;
    v7 = 4.0;
    v8 = 52.0;
    v9 = -8.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_referenceBounds");
    if (v11 >= 414.0)
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "userInterfaceIdiom");

      if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v8 = 62.0;
      else
        v8 = 66.0;
    }
    else
    {
      v8 = 62.0;
    }

    v9 = -5.0;
    v6 = 0.0;
    v7 = 10.0;
    v5 = 0.0;
  }
  v14 = (void *)MEMORY[0x24BDBCEB8];
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "widthAnchor");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "constraintEqualToConstant:", v8);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v196[0] = v182;
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "heightAnchor");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "constraintEqualToConstant:", v8);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v196[1] = v176;
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "topAnchor");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "topAnchor");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "constraintEqualToAnchor:constant:", v170, v5);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v196[2] = v168;
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "centerXAnchor");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "centerXAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "constraintEqualToAnchor:", v162);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v196[3] = v160;
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "centerXAnchor");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "centerXAnchor");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "constraintEqualToAnchor:", v152);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v196[4] = v150;
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "bottomAnchor");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "topAnchor");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "constraintEqualToAnchor:constant:", v142, v9);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v196[5] = v140;
  -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "bottomAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "bottomAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToAnchor:constant:", v134, v6);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v196[6] = v132;
  -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "firstBaselineAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "firstBaselineAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "constraintEqualToAnchor:", v124);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v196[7] = v122;
  -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "widthAnchor");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "widthAnchor");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "constraintEqualToAnchor:constant:", v116, v6);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v196[8] = v114;
  -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "centerXAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "centerXAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "constraintEqualToAnchor:", v106);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v196[9] = v104;
  -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "widthAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "widthAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "constraintEqualToAnchor:constant:", v98, v6);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v196[10] = v96;
  -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "lastBaselineAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "lastBaselineAnchor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:", v88);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v196[11] = v86;
  objc_msgSend(v193, "widthAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "widthAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:constant:", v80, v7);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v196[12] = v78;
  objc_msgSend(v193, "heightAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "heightAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:constant:", v72, v7);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v196[13] = v70;
  objc_msgSend(v193, "centerXAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v196[14] = v17;
  objc_msgSend(v193, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v196[15] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v196, 16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v190 == 6)
  {
    -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v28);

  }
  v191 = v23;
  -[SFPersonCollectionViewCell setRegularConstraints:](self, "setRegularConstraints:", v23);
  -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "centerYAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell setLargeTextNameCenterYConstraint:](self, "setLargeTextNameCenterYConstraint:", v33);

  v34 = (void *)MEMORY[0x24BDBCEB8];
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "widthAnchor");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "constraintEqualToConstant:", v8);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v195[0] = v183;
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "heightAnchor");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "constraintEqualToConstant:", v8);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v195[1] = v177;
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "centerYAnchor");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "centerYAnchor");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "constraintEqualToAnchor:", v171);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v195[2] = v169;
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "leadingAnchor");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "leadingAnchor");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "constraintEqualToAnchor:", v163);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v195[3] = v161;
  -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "bottomAnchor");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "bottomAnchor");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "constraintEqualToAnchor:constant:", v155, -8.0);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v195[4] = v153;
  -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "topAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "topAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintEqualToAnchor:constant:", v147, 8.0);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v195[5] = v145;
  -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "leadingAnchor");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "trailingAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "constraintEqualToAnchor:constant:", v137, 13.0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v195[6] = v135;
  -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "trailingAnchor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "trailingAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "constraintEqualToAnchor:constant:", v129, 8.0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v195[7] = v127;
  -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "firstBaselineAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "firstBaselineAnchor");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "constraintEqualToAnchor:", v119);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v195[8] = v117;
  -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "leadingAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "trailingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "constraintEqualToAnchor:constant:", v109, 13.0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v195[9] = v107;
  -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "trailingAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "trailingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToAnchor:constant:", v101, -8.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v195[10] = v99;
  objc_msgSend(v193, "widthAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "widthAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:constant:", v93, v7);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v195[11] = v91;
  objc_msgSend(v193, "heightAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "heightAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:constant:", v85, v7);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v195[12] = v83;
  objc_msgSend(v193, "centerXAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "centerXAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "constraintEqualToAnchor:", v77);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v195[13] = v75;
  objc_msgSend(v193, "centerYAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "centerYAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v69);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v195[14] = v67;
  -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "widthAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "widthAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v195[15] = v62;
  -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v58);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v195[16] = v35;
  -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "lastBaselineAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "lastBaselineAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v195[17] = v40;
  -[SFPersonCollectionViewCell largeTextNameCenterYConstraint](self, "largeTextNameCenterYConstraint");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v195[18] = v41;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v195, 19);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "arrayWithArray:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell setLargeTextConstraints:](self, "setLargeTextConstraints:", v43);

  -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "lastBaselineAnchor");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "firstBaselineAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v194[0] = v46;
  -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "firstBaselineAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "firstBaselineAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v194[1] = v51;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v194, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell setSecondLabelVisibleConstraintsArray:](self, "setSecondLabelVisibleConstraintsArray:", v52);

  -[SFPersonCollectionViewCell traitCollection](self, "traitCollection");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "preferredContentSizeCategory");
  v54 = (NSString *)objc_claimAutoreleasedReturnValue();
  v55 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x24BEBE098], v54);

  v56 = (void *)MEMORY[0x24BDD1628];
  if (v55 == NSOrderedAscending)
    -[SFPersonCollectionViewCell largeTextConstraints](self, "largeTextConstraints");
  else
    -[SFPersonCollectionViewCell regularConstraints](self, "regularConstraints");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "activateConstraints:", v57);

}

- (void)setDarkStyleOnLegacyApp:(BOOL)a3
{
  UILabel *nameLabel;
  void *v5;
  id v6;

  self->_darkStyleOnLegacyApp = a3;
  nameLabel = self->_nameLabel;
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setColor:](nameLabel, "setColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SFPersonCollectionViewCell setFadedSecondLabelColor:](self, "setFadedSecondLabelColor:", v6);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFPersonCollectionViewCell;
  -[SFPersonCollectionViewCell prepareForReuse](&v6, sel_prepareForReuse);
  -[SFPersonCollectionViewCell deactivateHaptics](self, "deactivateHaptics");
  -[SFPersonCollectionViewCell setPerson:](self, "setPerson:", 0);
  -[SFPersonCollectionViewCell setProgress:](self, "setProgress:", 0);
  -[SFPersonCollectionViewCell setCellState:](self, "setCellState:", 0);
  -[SFPersonCollectionViewCell setSelected:](self, "setSelected:", 0);
  -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  -[SFPersonCollectionViewCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", 0);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFPersonCollectionViewCell;
  -[SFPersonCollectionViewCell layoutSubviews](&v11, sel_layoutSubviews);
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[SFPersonCollectionViewCell contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;

    -[SFPersonCollectionViewCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFrame:", v5, 0.0, v7, v9);

  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (-[SFPersonCollectionViewCell isSelected](self, "isSelected") != a3)
  {
    v5 = -[SFPersonCollectionViewCell isHighlighted](self, "isHighlighted");
    v7.receiver = self;
    v7.super_class = (Class)SFPersonCollectionViewCell;
    -[SFPersonCollectionViewCell setSelected:](&v7, sel_setSelected_, v3);
    -[SFPersonCollectionViewCell imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHighlighted:", v5);

  }
}

- (void)setPerson:(id)a3
{
  SFAirDropNode **p_person;
  SFAirDropNode *v6;

  p_person = &self->_person;
  v6 = (SFAirDropNode *)a3;
  if (*p_person != v6)
  {
    -[SFPersonCollectionViewCell removeObserverOfValuesForKeyPaths:ofObject:](self, "removeObserverOfValuesForKeyPaths:ofObject:", &unk_24CE21E38);
    -[SFPersonCollectionViewCell willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("person"));
    objc_storeStrong((id *)&self->_person, a3);
    -[SFPersonCollectionViewCell didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("person"));
    -[SFPersonCollectionViewCell addObserverOfValuesForKeyPaths:ofObject:](self, "addObserverOfValuesForKeyPaths:ofObject:", &unk_24CE21E38, *p_person);
    if (*p_person)
    {
      -[SFPersonCollectionViewCell updatePersonIconView](self, "updatePersonIconView");
      -[SFPersonCollectionViewCell updateNameLabel](self, "updateNameLabel");
    }
  }

}

- (void)setProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_progress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  p_progress = &self->_progress;
  if (self->_progress != v5)
  {
    v7 = v5;
    -[SFPersonCollectionViewCell removeObserverOfValuesForKeyPaths:ofObject:](self, "removeObserverOfValuesForKeyPaths:ofObject:", self->_progressKeyPaths);
    objc_storeStrong((id *)&self->_progress, a3);
    -[SFPersonCollectionViewCell addObserverOfValuesForKeyPaths:ofObject:](self, "addObserverOfValuesForKeyPaths:ofObject:", self->_progressKeyPaths, *p_progress);
    -[SFPersonCollectionViewCell triggerKVOForKeyPaths:ofObject:](self, "triggerKVOForKeyPaths:ofObject:", self->_progressKeyPaths, *p_progress);
    v5 = v7;
  }

}

- (void)setCellState:(int64_t)a3
{
  -[SFPersonCollectionViewCell setCellState:animated:silent:](self, "setCellState:animated:silent:", a3, 0, 1);
}

- (void)setCellState:(int64_t)a3 animated:(BOOL)a4 silent:(BOOL)a5
{
  int64_t cellState;
  _BOOL8 v7;
  unint64_t v10;
  NSObject *v11;
  unint64_t v12;
  const __CFString *v13;
  NSProgress *progress;
  int v15;
  SFCircleProgressView *circleProgressView;
  double v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SFCircleProgressView *v28;
  void *v29;
  void *v30;
  SFCircleProgressView *v31;
  void *v32;
  void *v33;
  SFCircleProgressView *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  unint64_t v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  id v46;
  BOOL v47;
  BOOL v48;
  _QWORD v49[4];
  id v50;
  BOOL v51;
  BOOL v52;
  _QWORD v53[4];
  id v54;
  BOOL v55;
  BOOL v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _BYTE buf[12];
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  cellState = self->_cellState;
  if (cellState != a3)
  {
    v7 = a4;
    v10 = a3 - 2;
    if ((unint64_t)a3 < 2 || cellState <= a3)
    {
      progress = self->_progress;
      if (!progress || (-[NSProgress sf_initiator](progress, "sf_initiator") & 1) != 0)
      {
        v15 = 1;
      }
      else
      {
        if ((unint64_t)(a3 - 3) >= 4 && a3)
          return;
        -[SFCircleProgressView setAlpha:](self->_circleProgressView, "setAlpha:", 0.0);
        v15 = 0;
      }
      switch(a3)
      {
        case 0:
          -[SFPersonCollectionViewCell prepareHaptics](self, "prepareHaptics");
          -[SFPersonCollectionViewCell setSecondLabelText:withTextColor:animated:completion:](self, "setSecondLabelText:withTextColor:animated:completion:", 0, 0, v7, 0);
          -[SFCircleProgressView setProgress:animated:completion:](self->_circleProgressView, "setProgress:animated:completion:", v7, 0, 0.0);
          circleProgressView = self->_circleProgressView;
          v17 = 0.0;
          goto LABEL_33;
        case 1:
          *(_QWORD *)buf = 0;
          -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_initWeak((id *)buf, v20);

          if (!a5)
            -[SFPersonCollectionViewCell fireHapticsForState:](self, "fireHapticsForState:", 1);
          SFLocalizedStringForKey();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPersonCollectionViewCell fadedSecondLabelColor](self, "fadedSecondLabelColor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v59[0] = MEMORY[0x24BDAC760];
          v59[1] = 3221225472;
          v59[2] = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke;
          v59[3] = &unk_24CE0FB50;
          objc_copyWeak(&v60, (id *)buf);
          -[SFPersonCollectionViewCell setSecondLabelText:withTextColor:animated:completion:](self, "setSecondLabelText:withTextColor:animated:completion:", v21, v22, v7, v59);

          -[SFCircleProgressView setProgress:animated:completion:](self->_circleProgressView, "setProgress:animated:completion:", v7, 0, 0.0);
          if (v15)
            -[SFCircleProgressView setAlpha:](self->_circleProgressView, "setAlpha:", 1.0);
          objc_destroyWeak(&v60);
          objc_destroyWeak((id *)buf);
          break;
        case 2:
          *(_QWORD *)buf = 0;
          -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_initWeak((id *)buf, v23);

          if (!a5)
            -[SFPersonCollectionViewCell fireHapticsForState:](self, "fireHapticsForState:", 2);
          SFLocalizedStringForKey();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPersonCollectionViewCell fadedSecondLabelColor](self, "fadedSecondLabelColor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v57[0] = MEMORY[0x24BDAC760];
          v57[1] = 3221225472;
          v57[2] = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_3;
          v57[3] = &unk_24CE0FB50;
          objc_copyWeak(&v58, (id *)buf);
          -[SFPersonCollectionViewCell setSecondLabelText:withTextColor:animated:completion:](self, "setSecondLabelText:withTextColor:animated:completion:", v24, v25, v7, v57);

          objc_destroyWeak(&v58);
          objc_destroyWeak((id *)buf);
          break;
        case 3:
          if (!a5)
            -[SFPersonCollectionViewCell fireHapticsForState:](self, "fireHapticsForState:", 3);
          SFLocalizedStringForKey();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPersonCollectionViewCell fadedSecondLabelColor](self, "fadedSecondLabelColor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPersonCollectionViewCell setSecondLabelText:withTextColor:animated:completion:](self, "setSecondLabelText:withTextColor:animated:completion:", v26, v27, v7, 0);

          if (v15)
          {
            circleProgressView = self->_circleProgressView;
            v17 = 1.0;
LABEL_33:
            -[SFCircleProgressView setAlpha:](circleProgressView, "setAlpha:", v17);
          }
          break;
        case 4:
          if (v7)
          {
            *(_QWORD *)buf = 0;
            objc_initWeak((id *)buf, self);
            v28 = self->_circleProgressView;
            v53[0] = MEMORY[0x24BDAC760];
            v53[1] = 3221225472;
            v53[2] = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_5;
            v53[3] = &unk_24CE0FB78;
            v55 = a5;
            objc_copyWeak(&v54, (id *)buf);
            v56 = v7;
            -[SFCircleProgressView animateProgressCompletedWithCompletion:](v28, "animateProgressCompletedWithCompletion:", v53);
            objc_destroyWeak(&v54);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            SFLocalizedStringForKey();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFPersonCollectionViewCell setSecondLabelText:withTextColor:animated:completion:](self, "setSecondLabelText:withTextColor:animated:completion:", v35, v36, 0, 0);

            -[SFCircleProgressView setAlpha:](self->_circleProgressView, "setAlpha:", 0.0);
            -[SFCircleProgressView setProgress:](self->_circleProgressView, "setProgress:", 1.0);
          }
          break;
        case 5:
          *(_QWORD *)buf = 0;
          objc_initWeak((id *)buf, self);
          SFLocalizedStringForKey();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPersonCollectionViewCell setSecondLabelText:withTextColor:animated:completion:](self, "setSecondLabelText:withTextColor:animated:completion:", v29, v30, v7, 0);

          v31 = self->_circleProgressView;
          v49[0] = MEMORY[0x24BDAC760];
          v49[1] = 3221225472;
          v49[2] = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_7;
          v49[3] = &unk_24CE0FB78;
          v51 = v7;
          v52 = a5;
          objc_copyWeak(&v50, (id *)buf);
          -[SFCircleProgressView setProgress:animated:completion:](v31, "setProgress:animated:completion:", v7, v49, 0.0);
          -[SFCircleProgressView setAlpha:](self->_circleProgressView, "setAlpha:", 0.0);
          objc_destroyWeak(&v50);
          objc_destroyWeak((id *)buf);
          break;
        case 6:
          *(_QWORD *)buf = 0;
          objc_initWeak((id *)buf, self);
          SFLocalizedStringForKey();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPersonCollectionViewCell setSecondLabelText:withTextColor:animated:completion:](self, "setSecondLabelText:withTextColor:animated:completion:", v32, v33, v7, 0);

          v34 = self->_circleProgressView;
          v42 = MEMORY[0x24BDAC760];
          v43 = 3221225472;
          v44 = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_8;
          v45 = &unk_24CE0FB78;
          v47 = v7;
          v48 = a5;
          objc_copyWeak(&v46, (id *)buf);
          -[SFCircleProgressView setProgress:animated:completion:](v34, "setProgress:animated:completion:", v7, &v42, 0.0);
          -[SFCircleProgressView setAlpha:](self->_circleProgressView, "setAlpha:", 0.0, v42, v43, v44, v45);
          objc_destroyWeak(&v46);
          objc_destroyWeak((id *)buf);
          break;
        default:
          break;
      }
      airdrop_ui_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = self->_cellState;
        if (v38 > 6)
          v39 = CFSTR("?");
        else
          v39 = off_24CE0FBE8[v38];
        if ((unint64_t)a3 > 6)
          v40 = CFSTR("?");
        else
          v40 = off_24CE0FBE8[a3];
        -[SFAirDropNode displayName](self->_person, "displayName");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412803;
        *(_QWORD *)&buf[4] = v39;
        v62 = 2112;
        v63 = v40;
        v64 = 2113;
        v65 = v41;
        _os_log_impl(&dword_212728000, v37, OS_LOG_TYPE_DEFAULT, "Changing cell state %@ -> %@ for person %{private}@", buf, 0x20u);

      }
      self->_cellState = a3;
    }
    else
    {
      airdrop_ui_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_cellState;
        if (v12 > 6)
          v13 = CFSTR("?");
        else
          v13 = off_24CE0FBE8[v12];
        if (v10 > 4)
          v18 = CFSTR("?");
        else
          v18 = off_24CE0FBC0[v10];
        -[SFAirDropNode displayName](self->_person, "displayName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412803;
        *(_QWORD *)&buf[4] = v13;
        v62 = 2112;
        v63 = v18;
        v64 = 2113;
        v65 = v19;
        _os_log_impl(&dword_212728000, v11, OS_LOG_TYPE_DEFAULT, "Unsupported cell state transition %@ -> %@ for person %{private}@. Ignoring", buf, 0x20u);

      }
    }
  }
}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_2;
  v2[3] = &unk_24CE0ECE8;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  objc_msgSend(v1, "animateWithDuration:delay:options:animations:completion:", 24, v2, 0, 0.75, 0.0);
  objc_destroyWeak(&v3);
}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAlpha:", 0.2);

}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_4;
  v2[3] = &unk_24CE0ECE8;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  objc_msgSend(v1, "animateWithDuration:delay:options:animations:completion:", 24, v2, 0, 0.75, 0.0);
  objc_destroyWeak(&v3);
}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAlpha:", 0.2);

}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  if (!*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "fireHapticsForState:", 4);

  }
  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  SFLocalizedStringForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSecondLabelText:withTextColor:animated:completion:", v4, v5, *(unsigned __int8 *)(a1 + 41), 0);

  v6 = (void *)MEMORY[0x24BEBDB00];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_6;
  v7[3] = &unk_24CE0ECE8;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  objc_msgSend(v6, "animateWithDuration:animations:", v7, 0.5);
  objc_destroyWeak(&v8);
}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_6(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "circleProgressView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  if (*(_BYTE *)(a1 + 40))
  {
    if (!*(_BYTE *)(a1 + 41))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "fireHapticsForState:", 5);

    }
  }
}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  if (*(_BYTE *)(a1 + 40))
  {
    if (!*(_BYTE *)(a1 + 41))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "fireHapticsForState:", 6);

    }
  }
}

- (void)restoreCellStateFromFinalTransferState:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) <= 2)
  {
    -[SFPersonCollectionViewCell setCellState:](self, "setCellState:", qword_2127A2B98[a3 - 4]);
    -[SFPersonCollectionViewCell updateNameLabel](self, "updateNameLabel");
  }
}

- (void)prepareHaptics
{
  -[SFPersonCollectionViewCell prepareHapticsPreWarm:](self, "prepareHapticsPreWarm:", 1);
}

- (void)prepareHapticsPreWarm:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  UINotificationFeedbackGenerator *v6;
  UINotificationFeedbackGenerator *notificationHaptic;
  UIImpactFeedbackGenerator *v8;
  UIImpactFeedbackGenerator *impactHaptic;
  UISelectionFeedbackGenerator *v10;
  UISelectionFeedbackGenerator *selectionHaptic;
  NSObject *v12;

  v3 = a3;
  airdrop_ui_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SFPersonCollectionViewCell prepareHapticsPreWarm:].cold.2();

  if (!self->_notificationHaptic)
  {
    v6 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x24BEBD7B8]);
    notificationHaptic = self->_notificationHaptic;
    self->_notificationHaptic = v6;

  }
  if (!self->_impactHaptic)
  {
    v8 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD670]), "initWithStyle:", 1);
    impactHaptic = self->_impactHaptic;
    self->_impactHaptic = v8;

  }
  if (self->_selectionHaptic)
  {
    if (!v3)
      return;
  }
  else
  {
    v10 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x24BEBD940]);
    selectionHaptic = self->_selectionHaptic;
    self->_selectionHaptic = v10;

    if (!v3)
      return;
  }
  airdrop_ui_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[SFPersonCollectionViewCell prepareHapticsPreWarm:].cold.1();

  -[UINotificationFeedbackGenerator prepare](self->_notificationHaptic, "prepare");
  -[UIImpactFeedbackGenerator prepare](self->_impactHaptic, "prepare");
  -[UISelectionFeedbackGenerator prepare](self->_selectionHaptic, "prepare");
}

- (void)deactivateHaptics
{
  UINotificationFeedbackGenerator *notificationHaptic;
  UIImpactFeedbackGenerator *impactHaptic;
  UISelectionFeedbackGenerator *selectionHaptic;

  notificationHaptic = self->_notificationHaptic;
  self->_notificationHaptic = 0;

  impactHaptic = self->_impactHaptic;
  self->_impactHaptic = 0;

  selectionHaptic = self->_selectionHaptic;
  self->_selectionHaptic = 0;

}

- (void)fireHapticsForState:(int64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  v4 = 0;
  switch(a3)
  {
    case 1:
    case 3:
      -[SFPersonCollectionViewCell prepareHaptics](self, "prepareHaptics");
      airdrop_ui_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[SFPersonCollectionViewCell fireHapticsForState:].cold.3();

      -[UIImpactFeedbackGenerator impactOccurred](self->_impactHaptic, "impactOccurred");
      goto LABEL_16;
    case 2:
      -[SFPersonCollectionViewCell prepareHaptics](self, "prepareHaptics");
      airdrop_ui_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[SFPersonCollectionViewCell fireHapticsForState:].cold.4();

      -[UISelectionFeedbackGenerator selectionChanged](self->_selectionHaptic, "selectionChanged");
      goto LABEL_16;
    case 4:
      goto LABEL_13;
    case 5:
      v4 = 1;
      goto LABEL_13;
    case 6:
      v4 = 2;
LABEL_13:
      -[SFPersonCollectionViewCell prepareHaptics](self, "prepareHaptics");
      airdrop_ui_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[SFPersonCollectionViewCell fireHapticsForState:].cold.2();

      -[UINotificationFeedbackGenerator notificationOccurred:](self->_notificationHaptic, "notificationOccurred:", v4);
LABEL_16:
      -[SFPersonCollectionViewCell prepareHaptics](self, "prepareHaptics");
      break;
    default:
      airdrop_ui_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[SFPersonCollectionViewCell fireHapticsForState:].cold.1();

      break;
  }
}

- (void)updatePersonIconView
{
  _BOOL4 stateBeingRestored;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  stateBeingRestored = self->_stateBeingRestored;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__SFPersonCollectionViewCell_updatePersonIconView__block_invoke;
  aBlock[3] = &unk_24CE0ED80;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v5 = v4;
  if (stateBeingRestored)
  {
    (*((void (**)(void *))v4 + 2))(v4);
  }
  else
  {
    v6 = (void *)MEMORY[0x24BEBDB00];
    -[SFPersonCollectionViewCell imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionWithView:duration:options:animations:completion:", v7, 5242880, v5, 0, 0.200000003);

  }
}

void __50__SFPersonCollectionViewCell_updatePersonIconView__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "person");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isClassroom");
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageIsSquare:", v3);

  v5 = objc_alloc(MEMORY[0x24BEBD640]);
  objc_msgSend(*(id *)(a1 + 32), "person");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "initWithCGImage:", objc_msgSend(v6, "displayIcon"));

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v8);

}

- (void)updateNameLabel
{
  SFAirDropNode *person;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSComparisonResult v8;
  id v9;
  double v10;
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
  double v21;
  double v22;
  double height;
  void *v24;
  void *v25;
  double v26;
  float v27;
  uint64_t v28;
  void *v29;
  NSString *v30;
  NSComparisonResult v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[3];
  _QWORD v36[4];
  CGRect v37;
  CGRect v38;

  v36[3] = *MEMORY[0x24BDAC8D0];
  person = self->_person;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropNode displayNameForLocale:](person, "displayNameForLocale:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[SFAirDropNode isMe](self->_person, "isMe") & 1) != 0
    || (-[SFAirDropNode isUnknown](self->_person, "isUnknown") & 1) != 0
    || (-[SFAirDropNode isClassroom](self->_person, "isClassroom") & 1) != 0
    || (-[SFPersonCollectionViewCell traitCollection](self, "traitCollection"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "preferredContentSizeCategory"),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v8 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x24BEBE098], v7),
        v7,
        v6,
        v8 == NSOrderedAscending))
  {
    if ((-[SFAirDropNode isMe](self->_person, "isMe") & 1) != 0
      || -[SFAirDropNode isUnknown](self->_person, "isUnknown"))
    {
      -[SFPersonCollectionViewCell traitCollection](self, "traitCollection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "preferredContentSizeCategory");
      v30 = (NSString *)objc_claimAutoreleasedReturnValue();
      v31 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x24BEBE098], v30);

      if (v31 != NSOrderedAscending)
      {
        SFNonBreakingStringFromDeviceName();
        v32 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v32;
      }
    }
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x24BEBB490]);
    objc_msgSend(v9, "setLineBreakMode:", 0);
    LODWORD(v10) = 0;
    objc_msgSend(v9, "setHyphenationFactor:", v10);
    objc_msgSend(v9, "setLineBreakStrategy:", 0xFFFFLL);
    objc_msgSend(v9, "setAlignment:", 1);
    v35[0] = *MEMORY[0x24BEBB368];
    -[UILabel textColor](self->_nameLabel, "textColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v11;
    v35[1] = *MEMORY[0x24BEBB360];
    -[UILabel font](self->_nameLabel, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v12;
    v35[2] = *MEMORY[0x24BEBB3A8];
    v13 = (void *)objc_msgSend(v9, "copy");
    v36[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count") == 2)
    {
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length") && objc_msgSend(v18, "length"))
      {
        v34 = v18;
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v17, v14);
        -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "frame");
        v33 = v19;
        objc_msgSend(v19, "boundingRectWithSize:options:context:", 35, 0, v21, v22);
        v38 = CGRectIntegral(v37);
        height = v38.size.height;

        -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "font");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lineHeight");
        *(float *)&v26 = v26;
        LODWORD(v19) = llroundf(*(float *)&v26);

        v27 = height;
        if ((int)llroundf(v27) / (int)v19 == 1)
        {
          v18 = v34;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), v17, v34);
          v28 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v28;
        }
        else
        {
          v18 = v34;
        }

      }
    }

  }
  -[UILabel setText:](self->_nameLabel, "setText:", v5);

}

- (void)setSecondLabelText:(id)a3 withTextColor:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  unint64_t v9;
  id v10;
  void (**v11)(id, uint64_t);
  void *v12;
  NSString *v13;
  NSComparisonResult v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v9 = (unint64_t)a3;
  v10 = a4;
  v11 = (void (**)(id, uint64_t))a6;
  -[SFPersonCollectionViewCell traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x24BEBE098], v13);

  if (objc_msgSend((id)v9, "length"))
  {
    if (v14 == NSOrderedAscending)
    {
      v15 = (void *)MEMORY[0x24BDD1628];
      -[SFPersonCollectionViewCell largeTextNameCenterYConstraint](self, "largeTextNameCenterYConstraint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deactivateConstraints:", v17);

    }
    v18 = (void *)MEMORY[0x24BDD1628];
    -[SFPersonCollectionViewCell secondLabelVisibleConstraintsArray](self, "secondLabelVisibleConstraintsArray");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v19);

    -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = 0;
  }
  else
  {
    if (v14 == NSOrderedAscending)
    {
      v23 = (void *)MEMORY[0x24BDD1628];
      -[SFPersonCollectionViewCell largeTextNameCenterYConstraint](self, "largeTextNameCenterYConstraint");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v24;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "activateConstraints:", v25);

    }
    v26 = (void *)MEMORY[0x24BDD1628];
    -[SFPersonCollectionViewCell secondLabelVisibleConstraintsArray](self, "secondLabelVisibleConstraintsArray");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "deactivateConstraints:", v27);

    -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = 4;
  }
  objc_msgSend(v20, "setLineBreakMode:", v22);

  -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "text");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v9 | v29)
  {
    v30 = (void *)v29;
    -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "text");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isEqual:", v9);

    if ((v33 & 1) == 0)
    {
      -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "removeAllAnimations");

      -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAlpha:", 1.0);

      -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setText:", v9);

      -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setTextColor:", v10);

      -[SFPersonCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
      if (v11)
        v11[2](v11, 1);
    }
  }
  else
  {

  }
}

- (void)resetTransferState
{
  -[SFPersonCollectionViewCell setCellState:animated:silent:](self, "setCellState:animated:silent:", 0, 1, 1);
  -[SFPersonCollectionViewCell updateNameLabel](self, "updateNameLabel");
}

- (void)userDidSelect
{
  -[SFPersonCollectionViewCell resetTransferState](self, "resetTransferState");
  -[SFPersonCollectionViewCell setCellState:animated:silent:](self, "setCellState:animated:silent:", 2, 1, 0);
}

- (void)userDidCancel
{
  if ((self->_cellState | 2) != 6)
  {
    -[NSProgress cancel](self->_progress, "cancel");
    -[SFAirDropNode cancelSend](self->_person, "cancelSend");
    -[SFPersonCollectionViewCell setCellState:animated:silent:](self, "setCellState:animated:silent:", 0, 1, 1);
    -[SFPersonCollectionViewCell updateNameLabel](self, "updateNameLabel");
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (objc_msgSend(v11, "isEqual:", self->_person))
    {
      -[SFPersonCollectionViewCell handleKVOUpdateForPerson:keyPath:](self, "handleKVOUpdateForPerson:keyPath:", self->_person, v10);
    }
    else if (objc_msgSend(v11, "isEqual:", self->_progress))
    {
      -[SFPersonCollectionViewCell handleKVOUpdateForProgress:keyPath:](self, "handleKVOUpdateForProgress:keyPath:", self->_progress, v10);
    }
    else
    {
      airdrop_ui_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SFPersonCollectionViewCell observeValueForKeyPath:ofObject:change:context:].cold.1((uint64_t)self, (uint64_t)v10, v14);

    }
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__SFPersonCollectionViewCell_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_24CE0FBA0;
    block[4] = self;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    v19 = a6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __77__SFPersonCollectionViewCell_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observeValueForKeyPath:ofObject:change:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)addObserverOfValuesForKeyPaths:(id)a3 ofObject:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), 0, 0);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }

}

- (void)removeObserverOfValuesForKeyPaths:(id)a3 ofObject:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(v7, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }

}

- (void)triggerKVOForKeyPaths:(id)a3 ofObject:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v6);
          -[SFPersonCollectionViewCell observeValueForKeyPath:ofObject:change:context:](self, "observeValueForKeyPath:ofObject:change:context:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), v7, 0, 0);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFPersonCollectionViewCell;
  v4 = a3;
  -[SFPersonCollectionViewCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[SFPersonCollectionViewCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[SFPersonCollectionViewCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  NSComparisonResult v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *nameLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *rhs;

  -[SFPersonCollectionViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  rhs = (NSString *)objc_claimAutoreleasedReturnValue();

  v4 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x24BEBE098], rhs);
  -[SFPersonCollectionViewCell _screen](self, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _SFPersonLabelFont();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFPersonCollectionViewCell secondLabel](self, "secondLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v6);

  -[SFPersonCollectionViewCell labelForPositioning](self, "labelForPositioning");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v6);

  nameLabel = self->_nameLabel;
  if (v4 == NSOrderedAscending)
  {
    -[UILabel setTextAlignment:](nameLabel, "setTextAlignment:", 4);
    -[UILabel setTextAlignment:](self->_secondLabel, "setTextAlignment:", 4);
    v14 = (void *)MEMORY[0x24BDD1628];
    -[SFPersonCollectionViewCell regularConstraints](self, "regularConstraints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deactivateConstraints:", v15);

    v13 = (void *)MEMORY[0x24BDD1628];
    -[SFPersonCollectionViewCell largeTextConstraints](self, "largeTextConstraints");
  }
  else
  {
    -[UILabel setTextAlignment:](nameLabel, "setTextAlignment:", 1);
    -[UILabel setTextAlignment:](self->_secondLabel, "setTextAlignment:", 1);
    v11 = (void *)MEMORY[0x24BDD1628];
    -[SFPersonCollectionViewCell largeTextConstraints](self, "largeTextConstraints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deactivateConstraints:", v12);

    v13 = (void *)MEMORY[0x24BDD1628];
    -[SFPersonCollectionViewCell regularConstraints](self, "regularConstraints");
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v16);

  -[SFPersonCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)handleKVOUpdateForPerson:(id)a3 keyPath:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_msgSend(v5, "isEqual:", CFSTR("displayIcon")) & 1) != 0
    || (objc_msgSend(v5, "isEqual:", CFSTR("monogram")) & 1) != 0
    || (objc_msgSend(v5, "isEqual:", CFSTR("unknown")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("me")))
  {
    -[SFPersonCollectionViewCell updatePersonIconView](self, "updatePersonIconView");
  }
  else if ((objc_msgSend(v5, "isEqual:", CFSTR("displayName")) & 1) != 0
         || objc_msgSend(v5, "isEqual:", CFSTR("secondaryName")))
  {
    -[SFPersonCollectionViewCell updateNameLabel](self, "updateNameLabel");
  }

}

- (void)handleKVOUpdateForProgress:(id)a3 keyPath:(id)a4
{
  id v5;
  _BOOL4 stateBeingRestored;
  _BOOL8 v7;
  id WeakRetained;
  SFPersonCollectionViewCell *v9;
  uint64_t v10;
  _BOOL8 v11;
  _BOOL8 v12;
  SFCircleProgressView *circleProgressView;
  NSObject *v14;
  SFPersonCollectionViewCell *v15;
  uint64_t v16;
  _BOOL8 v17;
  _BOOL8 v18;
  NSObject *v19;
  id v20;

  v5 = a4;
  stateBeingRestored = self->_stateBeingRestored;
  v7 = !self->_stateBeingRestored;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("userInfo.sendState")))
  {
    switch(-[NSProgress sf_transferState](self->_progress, "sf_transferState"))
    {
      case 0:
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "personCollectionViewCellDidStartTransfer:", self);

        v9 = self;
        v10 = 2;
        v11 = v7;
        v12 = stateBeingRestored;
        goto LABEL_10;
      case 1:
        v12 = stateBeingRestored;
        v9 = self;
        v10 = 1;
        goto LABEL_9;
      case 2:
        v12 = stateBeingRestored;
        v9 = self;
        v10 = 2;
        goto LABEL_9;
      case 3:
        v12 = stateBeingRestored;
        v9 = self;
        v10 = 3;
LABEL_9:
        v11 = v7;
LABEL_10:
        -[SFPersonCollectionViewCell setCellState:animated:silent:](v9, "setCellState:animated:silent:", v10, v11, v12);
        break;
      case 4:
        airdrop_ui_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[SFPersonCollectionViewCell handleKVOUpdateForProgress:keyPath:].cold.1((uint64_t)self, v14);

        v15 = self;
        v16 = 5;
        v17 = v7;
        v18 = stateBeingRestored;
        goto LABEL_17;
      case 5:
        airdrop_ui_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[SFPersonCollectionViewCell handleKVOUpdateForProgress:keyPath:].cold.2((id *)&self->_progress, v19);

        v15 = self;
        v16 = 6;
        v17 = v7;
        v18 = stateBeingRestored;
LABEL_17:
        -[SFPersonCollectionViewCell setCellState:animated:silent:](v15, "setCellState:animated:silent:", v16, v17, v18);
        -[SFCircleProgressView setProgress:animated:completion:](self->_circleProgressView, "setProgress:animated:completion:", v7, 0, 0.0);
        v20 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v20, "personCollectionViewCellDidTerminateTransfer:", self);
        goto LABEL_19;
      case 6:
        -[SFPersonCollectionViewCell setCellState:animated:silent:](self, "setCellState:animated:silent:", 4, v7, stateBeingRestored);
        v20 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v20, "personCollectionViewCellDidFinishTransfer:", self);
LABEL_19:

        break;
      default:
        break;
    }
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("fractionCompleted")))
  {
    circleProgressView = self->_circleProgressView;
    -[NSProgress fractionCompleted](self->_progress, "fractionCompleted");
    -[SFCircleProgressView setProgress:animated:completion:](circleProgressView, "setProgress:animated:completion:", v7, 0);
  }

}

- (CGSize)calculatedContentSizeForSheetWidth:(double)a3 sizeCategory:(id)a4
{
  NSString *v5;
  void *v6;
  void *v7;
  double ChickletSize;
  id v9;
  NSComparisonResult v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  v5 = (NSString *)a4;
  -[SFPersonCollectionViewCell _screen](self, "_screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _SFPersonLabelFont();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  ChickletSize = getChickletSize();
  v9 = v7;
  v10 = UIContentSizeCategoryCompareToCategory(v5, (UIContentSizeCategory)*MEMORY[0x24BEBE0A0]);

  if (v10 == NSOrderedAscending)
  {
    v13 = 1.0;
  }
  else
  {
    objc_msgSend(v9, "pointSize");
    v12 = v11 / 11.0;
    if (v12 <= 2.0)
      v13 = v12;
    else
      v13 = 2.0;
  }

  objc_msgSend(v9, "ascender");
  -[SFPersonCollectionViewCell nameLabel](self, "nameLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  v17 = (void *)sNameLabel;
  if (!sNameLabel)
  {
    createNameLabel((void *)*MEMORY[0x24BEBE0B8]);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)sNameLabel;
    sNameLabel = v18;

    v17 = (void *)sNameLabel;
  }
  objc_msgSend(v17, "setFont:", v16);
  objc_msgSend((id)sNameLabel, "setText:", v15);
  objc_msgSend((id)sNameLabel, "sizeThatFits:", v13 * ChickletSize + 10.0, 1.79769313e308);

  objc_msgSend(v16, "descender");
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "scale");
  UIRectIntegralWithScale();
  v22 = v21;
  v24 = v23;

  v25 = v22;
  v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

- (BOOL)darkStyleOnLegacyApp
{
  return self->_darkStyleOnLegacyApp;
}

- (SFAirDropNode)person
{
  return self->_person;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (int64_t)cellState
{
  return self->_cellState;
}

- (BOOL)stateBeingRestored
{
  return self->_stateBeingRestored;
}

- (void)setStateBeingRestored:(BOOL)a3
{
  self->_stateBeingRestored = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (SFPersonCollectionViewCellDelegate)delegate
{
  return (SFPersonCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)activitySheetWidth
{
  return self->_activitySheetWidth;
}

- (void)setActivitySheetWidth:(double)a3
{
  self->_activitySheetWidth = a3;
}

- (SFPersonImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIView)badgedContactView
{
  return self->_badgedContactView;
}

- (void)setBadgedContactView:(id)a3
{
  objc_storeStrong((id *)&self->_badgedContactView, a3);
}

- (SFCircleProgressView)circleProgressView
{
  return self->_circleProgressView;
}

- (void)setCircleProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_circleProgressView, a3);
}

- (id)progressToken
{
  return self->_progressToken;
}

- (void)setProgressToken:(id)a3
{
  objc_storeStrong(&self->_progressToken, a3);
}

- (NSArray)progressKeyPaths
{
  return self->_progressKeyPaths;
}

- (void)setProgressKeyPaths:(id)a3
{
  objc_storeStrong((id *)&self->_progressKeyPaths, a3);
}

- (UILabel)secondLabel
{
  return self->_secondLabel;
}

- (void)setSecondLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondLabel, a3);
}

- (NSArray)secondLabelVisibleConstraintsArray
{
  return self->_secondLabelVisibleConstraintsArray;
}

- (void)setSecondLabelVisibleConstraintsArray:(id)a3
{
  objc_storeStrong((id *)&self->_secondLabelVisibleConstraintsArray, a3);
}

- (UIColor)fadedSecondLabelColor
{
  return self->_fadedSecondLabelColor;
}

- (void)setFadedSecondLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_fadedSecondLabelColor, a3);
}

- (UILabel)labelForPositioning
{
  return self->_labelForPositioning;
}

- (void)setLabelForPositioning:(id)a3
{
  objc_storeStrong((id *)&self->_labelForPositioning, a3);
}

- (UINotificationFeedbackGenerator)notificationHaptic
{
  return self->_notificationHaptic;
}

- (void)setNotificationHaptic:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHaptic, a3);
}

- (UISelectionFeedbackGenerator)selectionHaptic
{
  return self->_selectionHaptic;
}

- (void)setSelectionHaptic:(id)a3
{
  objc_storeStrong((id *)&self->_selectionHaptic, a3);
}

- (UIImpactFeedbackGenerator)impactHaptic
{
  return self->_impactHaptic;
}

- (void)setImpactHaptic:(id)a3
{
  objc_storeStrong((id *)&self->_impactHaptic, a3);
}

- (NSLayoutConstraint)secondLabelFBConstraint
{
  return self->_secondLabelFBConstraint;
}

- (void)setSecondLabelFBConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondLabelFBConstraint, a3);
}

- (NSLayoutConstraint)cellWidthConstraint
{
  return self->_cellWidthConstraint;
}

- (void)setCellWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_cellWidthConstraint, a3);
}

- (NSLayoutConstraint)chickletToTitleSpacingConstraint
{
  return self->_chickletToTitleSpacingConstraint;
}

- (void)setChickletToTitleSpacingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_chickletToTitleSpacingConstraint, a3);
}

- (NSLayoutConstraint)nameFirstBaselineConstraint
{
  return self->_nameFirstBaselineConstraint;
}

- (void)setNameFirstBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_nameFirstBaselineConstraint, a3);
}

- (NSLayoutConstraint)largeTextNameCenterYConstraint
{
  return self->_largeTextNameCenterYConstraint;
}

- (void)setLargeTextNameCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_largeTextNameCenterYConstraint, a3);
}

- (NSArray)regularConstraints
{
  return self->_regularConstraints;
}

- (void)setRegularConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_regularConstraints, a3);
}

- (NSArray)largeTextConstraints
{
  return self->_largeTextConstraints;
}

- (void)setLargeTextConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_largeTextConstraints, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_largeTextConstraints, 0);
  objc_storeStrong((id *)&self->_regularConstraints, 0);
  objc_storeStrong((id *)&self->_largeTextNameCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_nameFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_chickletToTitleSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_cellWidthConstraint, 0);
  objc_storeStrong((id *)&self->_secondLabelFBConstraint, 0);
  objc_storeStrong((id *)&self->_impactHaptic, 0);
  objc_storeStrong((id *)&self->_selectionHaptic, 0);
  objc_storeStrong((id *)&self->_notificationHaptic, 0);
  objc_storeStrong((id *)&self->_labelForPositioning, 0);
  objc_storeStrong((id *)&self->_fadedSecondLabelColor, 0);
  objc_storeStrong((id *)&self->_secondLabelVisibleConstraintsArray, 0);
  objc_storeStrong((id *)&self->_secondLabel, 0);
  objc_storeStrong((id *)&self->_progressKeyPaths, 0);
  objc_storeStrong(&self->_progressToken, 0);
  objc_storeStrong((id *)&self->_circleProgressView, 0);
  objc_storeStrong((id *)&self->_badgedContactView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (void)prepareHapticsPreWarm:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_212728000, v0, v1, "Preparing haptics.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)prepareHapticsPreWarm:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_212728000, v0, v1, "Ensuring haptics initialized...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)fireHapticsForState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_212728000, v0, v1, "Haptics not supported for cell state: (%ld)", v2);
}

- (void)fireHapticsForState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_212728000, v0, v1, "Firing haptic (type = %ld)", v2);
}

- (void)fireHapticsForState:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_212728000, v0, v1, "Firing haptic (type = impact)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)fireHapticsForState:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_212728000, v0, v1, "Firing haptic (type = selection)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)observeValueForKeyPath:(NSObject *)a3 ofObject:change:context:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_212728000, a3, OS_LOG_TYPE_ERROR, "%@: incorrect object for keypath %@", v7, 0x16u);

}

- (void)handleKVOUpdateForProgress:(uint64_t)a1 keyPath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 656), "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_212728000, a2, v4, "SFAirDropTransferProgressStateCanceled by: %@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)handleKVOUpdateForProgress:(id *)a1 keyPath:(NSObject *)a2 .cold.2(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "sf_error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_212728000, a2, v4, "SFAirDropTransferProgressStateFailed with error: %@", v5);

  OUTLINED_FUNCTION_1();
}

@end
