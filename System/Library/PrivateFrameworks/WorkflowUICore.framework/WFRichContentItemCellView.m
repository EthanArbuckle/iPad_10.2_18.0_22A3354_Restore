@implementation WFRichContentItemCellView

- (double)imageDimension
{
  return 44.0;
}

- (WFRichContentItemCellView)initWithFrame:(CGRect)a3
{
  WFRichContentItemCellView *v3;
  UILabel *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UILabel *titleLabel;
  UILabel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  NSLayoutConstraint *imageHeightConstraint;
  uint64_t v19;
  NSLayoutConstraint *imageWidthConstraint;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSLayoutConstraint *imageLeadingConstraint;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  WFRichContentItemCellView *v38;
  void *v40;
  objc_super v41;
  _QWORD v42[4];

  v42[3] = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)WFRichContentItemCellView;
  v3 = -[WFRichContentItemCellView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 20.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scaledFontForFont:maximumPointSize:", v6, 36.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4, "setFont:", v7);

    -[WFRichContentItemCellView tintColor](v3, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4, "setTextColor:", v8);

    -[UILabel setAdjustsFontSizeToFitWidth:](v4, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v4, "setMinimumScaleFactor:", 0.8);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFRichContentItemCellView addSubview:](v3, "addSubview:", v4);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;
    v10 = v4;

    v11 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    objc_msgSend(v11, "setTextAlignment:", 0);
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFRichContentItemCellView addSubview:](v3, "addSubview:", v11);
    objc_storeWeak((id *)&v3->_subtitleLabel, v11);
    v13 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v14);

    objc_msgSend(v13, "setTextAlignment:", 2);
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v15) = 1144750080;
    objc_msgSend(v13, "setContentHuggingPriority:forAxis:", 0, v15);
    -[WFRichContentItemCellView addSubview:](v3, "addSubview:", v13);
    objc_storeWeak((id *)&v3->_altLabel, v13);
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setClipsToBounds:", 1);
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFRichContentItemCellView addSubview:](v3, "addSubview:", v16);
    objc_storeWeak((id *)&v3->_imageView, v16);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 10, 0, v3, 10, 1.0, 0.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 8, 0, 0, 0, 1.0, 0.0);
    v17 = objc_claimAutoreleasedReturnValue();
    imageHeightConstraint = v3->_imageHeightConstraint;
    v3->_imageHeightConstraint = (NSLayoutConstraint *)v17;

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 7, 0, 0, 0, 1.0, 0.0);
    v19 = objc_claimAutoreleasedReturnValue();
    imageWidthConstraint = v3->_imageWidthConstraint;
    v3->_imageWidthConstraint = (NSLayoutConstraint *)v19;

    v21 = (void *)MEMORY[0x24BDD1628];
    v42[0] = v40;
    v42[1] = v3->_imageHeightConstraint;
    v42[2] = v3->_imageWidthConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v22);

    _NSDictionaryOfVariableBindings(CFSTR("titleLabel, subtitleLabel, altLabel"), v10, v11, v13, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v10, "setContentCompressionResistancePriority:forAxis:", 0, v24);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[titleLabel]-[altLabel]-elementPadding-|"), 0, &unk_24EF6A6B8, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRichContentItemCellView setFirstRowConstraintsWithAltText:](v3, "setFirstRowConstraintsWithAltText:", v25);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[titleLabel]-elementPadding-|"), 0, &unk_24EF6A6B8, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRichContentItemCellView setFirstRowConstraintsWithoutAltText:](v3, "setFirstRowConstraintsWithoutAltText:", v26);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[titleLabel]-2-[subtitleLabel]-(>=0)-|"), 0, 0, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRichContentItemCellView setVerticalConstraintsWithSubtitle:](v3, "setVerticalConstraintsWithSubtitle:", v27);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[titleLabel]-|"), 0, 0, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRichContentItemCellView setVerticalConstraintsWithoutSubtitle:](v3, "setVerticalConstraintsWithoutSubtitle:", v28);

    v29 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, 5, 0, v3, 5, 1.0, 14.0);
    v30 = objc_claimAutoreleasedReturnValue();
    imageLeadingConstraint = v3->_imageLeadingConstraint;
    v3->_imageLeadingConstraint = (NSLayoutConstraint *)v30;

    objc_msgSend(v29, "addObject:", v3->_imageLeadingConstraint);
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 5, 0, v16, 6, 1.0, 14.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v32);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 5, 0, v16, 6, 1.0, 14.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v33);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[subtitleLabel]-elementPadding-|"), 0, &unk_24EF6A6B8, v23);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObjectsFromArray:", v34);

    -[WFRichContentItemCellView firstRowConstraintsWithoutAltText](v3, "firstRowConstraintsWithoutAltText");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObjectsFromArray:", v35);

    -[WFRichContentItemCellView verticalConstraintsWithSubtitle](v3, "verticalConstraintsWithSubtitle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObjectsFromArray:", v36);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 10, 0, v13, 10, 1.0, 0.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v37);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v29);
    v38 = v3;

  }
  return v3;
}

- (void)updateConstraints
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)WFRichContentItemCellView;
  -[WFRichContentItemCellView updateConstraints](&v22, sel_updateConstraints);
  v3 = 0.0;
  v4 = 0.0;
  if (-[WFRichContentItemCellView hasImage](self, "hasImage"))
  {
    -[WFRichContentItemCellView imageDimension](self, "imageDimension");
    v3 = v5;
    v4 = 14.0;
  }
  -[NSLayoutConstraint setConstant:](self->_imageWidthConstraint, "setConstant:", v3);
  -[NSLayoutConstraint setConstant:](self->_imageHeightConstraint, "setConstant:", v3);
  -[NSLayoutConstraint setConstant:](self->_imageLeadingConstraint, "setConstant:", v4);
  -[WFRichContentItemCellView altLabel](self, "altLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  v9 = (void *)MEMORY[0x24BDD1628];
  if (v8)
  {
    -[WFRichContentItemCellView firstRowConstraintsWithoutAltText](self, "firstRowConstraintsWithoutAltText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v10);

    v11 = (void *)MEMORY[0x24BDD1628];
    -[WFRichContentItemCellView firstRowConstraintsWithAltText](self, "firstRowConstraintsWithAltText");
  }
  else
  {
    -[WFRichContentItemCellView firstRowConstraintsWithAltText](self, "firstRowConstraintsWithAltText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deactivateConstraints:", v12);

    v11 = (void *)MEMORY[0x24BDD1628];
    -[WFRichContentItemCellView firstRowConstraintsWithoutAltText](self, "firstRowConstraintsWithoutAltText");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateConstraints:", v13);

  -[WFRichContentItemCellView subtitleLabel](self, "subtitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  v17 = (void *)MEMORY[0x24BDD1628];
  if (v16)
  {
    -[WFRichContentItemCellView verticalConstraintsWithoutSubtitle](self, "verticalConstraintsWithoutSubtitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deactivateConstraints:", v18);

    v19 = (void *)MEMORY[0x24BDD1628];
    -[WFRichContentItemCellView verticalConstraintsWithSubtitle](self, "verticalConstraintsWithSubtitle");
  }
  else
  {
    -[WFRichContentItemCellView verticalConstraintsWithSubtitle](self, "verticalConstraintsWithSubtitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deactivateConstraints:", v20);

    v19 = (void *)MEMORY[0x24BDD1628];
    -[WFRichContentItemCellView verticalConstraintsWithoutSubtitle](self, "verticalConstraintsWithoutSubtitle");
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v21);

}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRichContentItemCellView;
  -[WFRichContentItemCellView tintColorDidChange](&v5, sel_tintColorDidChange);
  -[WFRichContentItemCellView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRichContentItemCellView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFRichContentItemCellView;
  -[WFRichContentItemCellView layoutSubviews](&v3, sel_layoutSubviews);
  -[WFRichContentItemCellView updateImageCornerRadius](self, "updateImageCornerRadius");
}

- (void)setHasImage:(BOOL)a3
{
  self->_hasImage = a3;
  -[WFRichContentItemCellView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[WFRichContentItemCellView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  -[WFRichContentItemCellView imageDimension](self, "imageDimension");
  v10 = v9;
  -[WFRichContentItemCellView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 <= v10 && v6 <= v10)
    v14 = 4;
  else
    v14 = 1;
  objc_msgSend(v11, "setContentMode:", v14);

  -[WFRichContentItemCellView imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:", v4);

  -[WFRichContentItemCellView setHasImage:](self, "setHasImage:", v4 != 0);
}

- (void)setImage:(id)a3 options:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a4;
  -[WFRichContentItemCellView setImage:](self, "setImage:", a3);
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BEC1820]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    v7 = objc_msgSend(v8, "unsignedIntegerValue");
  else
    v7 = 0;
  -[WFRichContentItemCellView setImageRoundingStyle:](self, "setImageRoundingStyle:", v7);
  -[WFRichContentItemCellView updateImageCornerRadius](self, "updateImageCornerRadius");

}

- (void)updateImageCornerRadius
{
  unint64_t v3;
  double v4;
  double v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[WFRichContentItemCellView imageView](self, "imageView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[WFRichContentItemCellView imageRoundingStyle](self, "imageRoundingStyle");
  objc_msgSend(v10, "bounds");
  WFContentItemListThumbnailCornerRadiusForRoundingStyle();
  v5 = v4;
  objc_msgSend(v10, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v5);

  v7 = (uint64_t *)MEMORY[0x24BDE58E0];
  if (v3 != 3)
    v7 = (uint64_t *)MEMORY[0x24BDE58E8];
  v8 = *v7;
  objc_msgSend(v10, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerCurve:", v8);

}

- (void)setSubtitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WFRichContentItemCellView subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[WFRichContentItemCellView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setSelectableAlertButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFContentItem *item;
  id v17;

  v17 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFRichContentItemCellView setContentAlertButton:](self, "setContentAlertButton:", v17);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFRichContentItemCellView setAttributedAlertButton:](self, "setAttributedAlertButton:", v17);
    }
    else
    {
      objc_msgSend(v17, "image");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UIImage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRichContentItemCellView titleLabel](self, "titleLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v6);

      v8 = -[WFRichContentItemCellView alwaysLeftAlign](self, "alwaysLeftAlign");
      if (v8)
      {
        v9 = 4;
      }
      else
      {
        objc_msgSend(v17, "subtitle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "length");
        v11 = 4;
        if (!v5)
          v11 = 1;
        if (v10)
          v9 = 4;
        else
          v9 = v11;
      }
      -[WFRichContentItemCellView titleLabel](self, "titleLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTextAlignment:", v9);

      if (!v8)
      objc_msgSend(v17, "subtitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFRichContentItemCellView subtitleLabel](self, "subtitleLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v13);

      -[WFRichContentItemCellView altLabel](self, "altLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setText:", 0);

      -[WFRichContentItemCellView setImage:options:](self, "setImage:options:", v5, 0);
      item = self->_item;
      self->_item = 0;

    }
  }

}

- (void)setAttributedAlertButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFContentItem *item;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "attributedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRichContentItemCellView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v5);

  -[WFRichContentItemCellView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 1);

  -[WFRichContentItemCellView subtitleLabel](self, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", 0);

  -[WFRichContentItemCellView altLabel](self, "altLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", 0);

  -[WFRichContentItemCellView setImage:options:](self, "setImage:options:", 0, 0);
  item = self->_item;
  self->_item = 0;

  objc_msgSend(v4, "label");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[WFRichContentItemCellView setAccessibilityLabel:](self, "setAccessibilityLabel:", v11);
}

- (void)setContentAlertButton:(id)a3
{
  id v4;
  WFContentItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  char v12;
  double v13;
  double v14;
  char v15;
  uint64_t v16;
  void *v17;
  id *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id from;
  id location[2];

  v4 = a3;
  objc_msgSend(v4, "contentItem");
  v5 = (WFContentItem *)objc_claimAutoreleasedReturnValue();
  if (v5 != self->_item)
  {
    objc_initWeak(location, self);
    objc_initWeak(&from, v5);
    objc_storeStrong((id *)&self->_item, v5);
    -[WFContentItem richListTitle](v5, "richListTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRichContentItemCellView titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    -[WFRichContentItemCellView subtitleLabel](self, "subtitleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", 0);

    -[WFRichContentItemCellView altLabel](self, "altLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", 0);

    -[WFRichContentItemCellView setImage:options:](self, "setImage:options:", 0, 0);
    v10 = objc_msgSend(v4, "hideSubtitle");
    v11 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __51__WFRichContentItemCellView_setContentAlertButton___block_invoke;
    v28[3] = &unk_24EF60368;
    objc_copyWeak(&v29, location);
    objc_copyWeak(&v30, &from);
    objc_msgSend(v4, "getSubtitle:", v28);
    v25[0] = v11;
    v25[1] = 3221225472;
    v25[2] = __51__WFRichContentItemCellView_setContentAlertButton___block_invoke_2;
    v25[3] = &unk_24EF60368;
    objc_copyWeak(&v26, location);
    objc_copyWeak(&v27, &from);
    v12 = -[WFContentItem getListAltText:](v5, "getListAltText:", v25);
    -[WFRichContentItemCellView imageDimension](self, "imageDimension");
    v14 = v13;
    v19 = v11;
    v20 = 3221225472;
    v21 = __51__WFRichContentItemCellView_setContentAlertButton___block_invoke_3;
    v22 = &unk_24EF60390;
    objc_copyWeak(&v23, location);
    objc_copyWeak(&v24, &from);
    -[WFRichContentItemCellView setHasImage:](self, "setHasImage:", -[WFContentItem getListThumbnail:forSize:](v5, "getListThumbnail:forSize:", &v19, v14, v14));
    if (self->_hasImage)
      v15 = 1;
    else
      v15 = v12;
    v16 = 4;
    if ((v15 & 1) == 0 && ((v10 ^ 1) & 1) == 0)
    {
      if (self->_alwaysLeftAlign)
        v16 = 4;
      else
        v16 = 1;
    }
    -[WFRichContentItemCellView titleLabel](self, "titleLabel", &v29, v19, v20, v21, v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextAlignment:", v16);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v30);
    objc_destroyWeak(v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (BOOL)alwaysLeftAlign
{
  return self->_alwaysLeftAlign;
}

- (void)setAlwaysLeftAlign:(BOOL)a3
{
  self->_alwaysLeftAlign = a3;
}

- (WFContentItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (UILabel)subtitleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_subtitleLabel);
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_subtitleLabel, a3);
}

- (UILabel)altLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_altLabel);
}

- (void)setAltLabel:(id)a3
{
  objc_storeWeak((id *)&self->_altLabel, a3);
}

- (UIImageView)imageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (void)setImageView:(id)a3
{
  objc_storeWeak((id *)&self->_imageView, a3);
}

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (unint64_t)imageRoundingStyle
{
  return self->_imageRoundingStyle;
}

- (void)setImageRoundingStyle:(unint64_t)a3
{
  self->_imageRoundingStyle = a3;
}

- (NSLayoutConstraint)imageHeightConstraint
{
  return self->_imageHeightConstraint;
}

- (void)setImageHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageHeightConstraint, a3);
}

- (NSLayoutConstraint)imageWidthConstraint
{
  return self->_imageWidthConstraint;
}

- (void)setImageWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageWidthConstraint, a3);
}

- (NSLayoutConstraint)imageLeadingConstraint
{
  return self->_imageLeadingConstraint;
}

- (void)setImageLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageLeadingConstraint, a3);
}

- (NSArray)firstRowConstraintsWithAltText
{
  return self->_firstRowConstraintsWithAltText;
}

- (void)setFirstRowConstraintsWithAltText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSArray)firstRowConstraintsWithoutAltText
{
  return self->_firstRowConstraintsWithoutAltText;
}

- (void)setFirstRowConstraintsWithoutAltText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (NSArray)verticalConstraintsWithSubtitle
{
  return self->_verticalConstraintsWithSubtitle;
}

- (void)setVerticalConstraintsWithSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (NSArray)verticalConstraintsWithoutSubtitle
{
  return self->_verticalConstraintsWithoutSubtitle;
}

- (void)setVerticalConstraintsWithoutSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalConstraintsWithoutSubtitle, 0);
  objc_storeStrong((id *)&self->_verticalConstraintsWithSubtitle, 0);
  objc_storeStrong((id *)&self->_firstRowConstraintsWithoutAltText, 0);
  objc_storeStrong((id *)&self->_firstRowConstraintsWithAltText, 0);
  objc_storeStrong((id *)&self->_imageLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_altLabel);
  objc_destroyWeak((id *)&self->_subtitleLabel);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

void __51__WFRichContentItemCellView_setContentAlertButton___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "item");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 && v4 == v5)
    objc_msgSend(WeakRetained, "setSubtitle:", v6);

}

void __51__WFRichContentItemCellView_setContentAlertButton___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "item");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 && v4 == v5)
  {
    objc_msgSend(WeakRetained, "altLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

  }
}

void __51__WFRichContentItemCellView_setContentAlertButton___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "item");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 && v7 == v8)
  {
    objc_msgSend(v10, "UIImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setImage:options:", v9, v5);

  }
}

@end
