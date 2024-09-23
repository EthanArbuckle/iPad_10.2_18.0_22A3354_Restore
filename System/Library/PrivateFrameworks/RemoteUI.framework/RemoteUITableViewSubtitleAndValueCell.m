@implementation RemoteUITableViewSubtitleAndValueCell

- (id)effectiveDetailTextLabel
{
  void *v3;
  NSString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
    -[RemoteUITableViewSubtitleAndValueCell detailTextLabel](self, "detailTextLabel");
  else
    -[RemoteUITableViewSubtitleAndValueCell valueLabel](self, "valueLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)effectiveValueTextLabel
{
  void *v3;
  NSString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
    -[RemoteUITableViewSubtitleAndValueCell valueLabel](self, "valueLabel");
  else
    -[RemoteUITableViewSubtitleAndValueCell detailTextLabel](self, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)textLabel
{
  -[RemoteUITableViewSubtitleAndValueCell _setUpViews](self, "_setUpViews");
  return self->_titleLabel;
}

- (id)detailTextLabel
{
  -[RemoteUITableViewSubtitleAndValueCell _setUpViews](self, "_setUpViews");
  return self->_detailLabel;
}

- (void)_updateLeadingConstraint
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  _BOOL8 v6;

  -[RemoteUITableViewSubtitleAndValueCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;
  v6 = v4 != 0;

  -[NSLayoutConstraint setActive:](self->_imageConstraint, "setActive:", v6);
  -[NSLayoutConstraint setActive:](self->_leadingConstraint, "setActive:", v5);
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[RemoteUITableViewSubtitleAndValueCell _tableView](self, "_tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginUpdates");

  v7.receiver = self;
  v7.super_class = (Class)RemoteUITableViewSubtitleAndValueCell;
  -[RemoteUITableViewSubtitleAndValueCell setImage:](&v7, sel_setImage_, v4);

  -[RemoteUITableViewSubtitleAndValueCell _updateLeadingConstraint](self, "_updateLeadingConstraint");
  -[RemoteUITableViewSubtitleAndValueCell _tableView](self, "_tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endUpdates");

}

- (void)setImage:(id)a3 padding:(UIEdgeInsets)a4 tintColor:(id)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v11 = a5;
  v12 = a3;
  -[RemoteUITableViewSubtitleAndValueCell _tableView](self, "_tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "beginUpdates");

  v15.receiver = self;
  v15.super_class = (Class)RemoteUITableViewSubtitleAndValueCell;
  -[RemoteUITableViewCell setImage:padding:tintColor:](&v15, sel_setImage_padding_tintColor_, v12, v11, top, left, bottom, right);

  -[RemoteUITableViewSubtitleAndValueCell _updateLeadingConstraint](self, "_updateLeadingConstraint");
  -[RemoteUITableViewSubtitleAndValueCell _tableView](self, "_tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endUpdates");

}

- (void)_setUpViews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UILabel *v8;
  UILabel *titleLabel;
  uint64_t v10;
  void *v11;
  UILabel *v12;
  UILabel *detailLabel;
  void *v14;
  UILabel *v15;
  UILabel *valueLabel;
  RUIWebContainerView *v17;
  RUIWebContainerView *htmlSublabelContainer;
  double v19;
  double v20;
  double v21;
  id v22;
  UILabel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  UILabel *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSLayoutConstraint *v37;
  NSLayoutConstraint *imageConstraint;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSLayoutConstraint *v43;
  NSLayoutConstraint *leadingConstraint;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
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
  _QWORD v77[5];
  _QWORD v78[2];
  _QWORD v79[5];

  v79[3] = *MEMORY[0x24BDAC8D0];
  if (!self->_titleLabel)
  {
    v3 = objc_alloc(MEMORY[0x24BEBD708]);
    v4 = *MEMORY[0x24BDBF090];
    v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v8;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_titleLabel, "setFont:", v11);

    v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v4, v5, v6, v7);
    detailLabel = self->_detailLabel;
    self->_detailLabel = v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_detailLabel, "setFont:", v14);

    v15 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v4, v5, v6, v7);
    valueLabel = self->_valueLabel;
    self->_valueLabel = v15;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = -[RUIWebContainerView initWithContent:baseURL:]([RUIWebContainerView alloc], "initWithContent:baseURL:", 0, 0);
    htmlSublabelContainer = self->_htmlSublabelContainer;
    self->_htmlSublabelContainer = v17;

    -[RUIWebContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_htmlSublabelContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RUIWebContainerView setHidden:](self->_htmlSublabelContainer, "setHidden:", 1);
    LODWORD(v19) = 1148846080;
    -[RUIWebContainerView setContentCompressionResistancePriority:forAxis:](self->_htmlSublabelContainer, "setContentCompressionResistancePriority:forAxis:", 2, v19);
    -[RUIWebContainerView setUserStyleSheet:](self->_htmlSublabelContainer, "setUserStyleSheet:", CFSTR("body { color: -apple-system-secondary-label; font: -apple-system-footnote; line-height: 1.5em }"));
    LODWORD(v20) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 2, v20);
    LODWORD(v21) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_valueLabel, "setContentCompressionResistancePriority:forAxis:", 2, v21);
    v22 = objc_alloc(MEMORY[0x24BEBD978]);
    v23 = self->_valueLabel;
    v79[0] = self->_titleLabel;
    v79[1] = v23;
    v79[2] = self->_htmlSublabelContainer;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithArrangedSubviews:", v24);

    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v25, "setAlignment:", 1);
    objc_msgSend(v25, "setAxis:", 1);
    objc_msgSend(v25, "setSpacing:", 2.0);
    objc_msgSend(v25, "setDistribution:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_titleLabel, "setFont:", v26);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_detailLabel, "setFont:", v27);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_valueLabel, "setFont:", v28);

    -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_detailLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_valueLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v29 = objc_alloc(MEMORY[0x24BEBD978]);
    v30 = self->_detailLabel;
    v78[0] = v25;
    v78[1] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v29, "initWithArrangedSubviews:", v31);

    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v32, "setAlignment:", 3);
    objc_msgSend(v32, "setAxis:", 0);
    objc_msgSend(v32, "setSpacing:", 8.0);
    objc_msgSend(v32, "setDistribution:", 0);
    -[RemoteUITableViewSubtitleAndValueCell contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", v32);

    objc_msgSend(v32, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUITableViewSubtitleAndValueCell imageView](self, "imageView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, 16.0);
    v37 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    imageConstraint = self->_imageConstraint;
    self->_imageConstraint = v37;

    objc_msgSend(v32, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUITableViewSubtitleAndValueCell contentView](self, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "readableContentGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v42);
    v43 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    leadingConstraint = self->_leadingConstraint;
    self->_leadingConstraint = v43;

    v66 = (void *)MEMORY[0x24BDD1628];
    -[RUIWebContainerView leadingAnchor](self->_htmlSublabelContainer, "leadingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v25;
    objc_msgSend(v25, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v74);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v73;
    -[RUIWebContainerView trailingAnchor](self->_htmlSublabelContainer, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v71);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v70;
    objc_msgSend(v32, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUITableViewSubtitleAndValueCell contentView](self, "contentView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "readableContentGuide");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "topAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v64;
    objc_msgSend(v32, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUITableViewSubtitleAndValueCell contentView](self, "contentView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "readableContentGuide");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v77[3] = v46;
    objc_msgSend(v32, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUITableViewSubtitleAndValueCell contentView](self, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "readableContentGuide");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v77[4] = v51;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 5);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "activateConstraints:", v52);

    LODWORD(v53) = 1148846080;
    -[RUIWebContainerView setContentCompressionResistancePriority:forAxis:](self->_htmlSublabelContainer, "setContentCompressionResistancePriority:forAxis:", 2, v53);
    LODWORD(v54) = 1148846080;
    -[RUIWebContainerView setContentCompressionResistancePriority:forAxis:](self->_htmlSublabelContainer, "setContentCompressionResistancePriority:forAxis:", 1, v54);
    LODWORD(v55) = 1132068864;
    objc_msgSend(v76, "setContentHuggingPriority:forAxis:", 3, v55);
    LODWORD(v56) = 1148846080;
    objc_msgSend(v76, "setContentCompressionResistancePriority:forAxis:", 3, v56);
    LODWORD(v57) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_valueLabel, "setContentCompressionResistancePriority:forAxis:", 1, v57);
    LODWORD(v58) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](self->_detailLabel, "setContentHuggingPriority:forAxis:", 1, v58);
    -[RemoteUITableViewSubtitleAndValueCell _tableView](self, "_tableView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "beginUpdates");

    -[RemoteUITableViewSubtitleAndValueCell _updateLeadingConstraint](self, "_updateLeadingConstraint");
    -[RemoteUITableViewSubtitleAndValueCell _tableView](self, "_tableView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "endUpdates");

  }
}

- (id)valueLabel
{
  -[RemoteUITableViewSubtitleAndValueCell _setUpViews](self, "_setUpViews");
  return self->_valueLabel;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  CGColor *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[RemoteUITableViewSubtitleAndValueCell backgroundColor](self, "backgroundColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (CGColor *)objc_msgSend(v5, "CGColor");
  v8.receiver = self;
  v8.super_class = (Class)RemoteUITableViewSubtitleAndValueCell;
  -[RemoteUITableViewSubtitleAndValueCell setBackgroundColor:](&v8, sel_setBackgroundColor_, v4);
  if (-[RemoteUITableViewSubtitleAndValueCell selectionStyle](self, "selectionStyle")
    && (-[RemoteUITableViewSubtitleAndValueCell isSelected](self, "isSelected") & 1) != 0
    || (-[RemoteUITableViewSubtitleAndValueCell isHighlighted](self, "isHighlighted") & 1) != 0
    || !CGColorEqualToColor((CGColorRef)-[UILabel _backgroundCGColor](self->_valueLabel, "_backgroundCGColor"), v6))
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_valueLabel, "setBackgroundColor:", v7);

  }
  else
  {
    -[UILabel setBackgroundColor:](self->_valueLabel, "setBackgroundColor:", v4);
  }

}

- (void)setHTMLSubLabelData:(id)a3 sourceURL:(id)a4 delegate:(id)a5
{
  RUIWebContainerView *htmlSublabelContainer;
  id v9;
  id v10;
  id v11;

  if (a3)
  {
    htmlSublabelContainer = self->_htmlSublabelContainer;
    v9 = a5;
    v10 = a4;
    v11 = a3;
    -[RUIWebContainerView setHidden:](htmlSublabelContainer, "setHidden:", 0);
    -[RUIWebContainerView setDelegate:](self->_htmlSublabelContainer, "setDelegate:", v9);

    -[RUIWebContainerView updateContent:baseURL:](self->_htmlSublabelContainer, "updateContent:baseURL:", v11, v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_htmlSublabelContainer, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageConstraint, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
