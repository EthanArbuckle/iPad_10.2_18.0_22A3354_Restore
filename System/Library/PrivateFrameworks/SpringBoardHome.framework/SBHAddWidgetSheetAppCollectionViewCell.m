@implementation SBHAddWidgetSheetAppCollectionViewCell

- (SBHAddWidgetSheetAppCollectionViewCell)initWithFrame:(CGRect)a3
{
  SBHAddWidgetSheetAppCollectionViewCell *v3;
  SBHAddWidgetSheetAppCollectionViewCell *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *imageView;
  void *v8;
  uint64_t v9;
  NSLayoutConstraint *iconWidthConstraint;
  void *v11;
  double v12;
  uint64_t v13;
  NSLayoutConstraint *iconHeightConstraint;
  void *v15;
  void *v16;
  UILabel *v17;
  UILabel *textLabel;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  UILabel *detailTextLabel;
  UILabel *v23;
  void *v24;
  UILabel *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  UIStackView *verticalStackView;
  id v31;
  void *v32;
  uint64_t v33;
  UIStackView *horizontalStackView;
  void *v35;
  void *v36;
  uint64_t v37;
  NSLayoutConstraint *leadingConstraint;
  void *v39;
  void *v40;
  uint64_t v41;
  NSLayoutConstraint *trailingConstraint;
  void *v43;
  void *v44;
  uint64_t v45;
  NSLayoutConstraint *topConstraint;
  void *v47;
  void *v48;
  double v49;
  uint64_t v50;
  NSLayoutConstraint *bottomConstraint;
  void *v52;
  void *v53;
  UIView *v54;
  UIView *separatorView;
  UIView *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v74;
  void *v75;
  void *v76;
  objc_super v77;
  void *v78;
  _QWORD v79[3];
  _QWORD v80[4];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[4];

  v83[2] = *MEMORY[0x1E0C80C00];
  v77.receiver = self;
  v77.super_class = (Class)SBHAddWidgetSheetAppCollectionViewCell;
  v3 = -[SBHAddWidgetSheetAppCollectionViewCell initWithFrame:](&v77, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBHAddWidgetSheetAppCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v4->_imageView;
    v4->_imageView = v6;

    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v4->_imageView);
    -[UIImageView widthAnchor](v4->_imageView, "widthAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetSheetAppCollectionViewCell iconImageInfo](v4, "iconImageInfo");
    objc_msgSend(v8, "constraintEqualToConstant:");
    v9 = objc_claimAutoreleasedReturnValue();
    iconWidthConstraint = v4->_iconWidthConstraint;
    v4->_iconWidthConstraint = (NSLayoutConstraint *)v9;

    -[UIImageView heightAnchor](v4->_imageView, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetSheetAppCollectionViewCell iconImageInfo](v4, "iconImageInfo");
    objc_msgSend(v11, "constraintEqualToConstant:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    iconHeightConstraint = v4->_iconHeightConstraint;
    v4->_iconHeightConstraint = (NSLayoutConstraint *)v13;

    v15 = (void *)MEMORY[0x1E0CB3718];
    v83[0] = v4->_iconWidthConstraint;
    v83[1] = v4->_iconHeightConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v16);

    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v4->_textLabel;
    v4->_textLabel = v17;

    v19 = v4->_textLabel;
    -[SBHAddWidgetSheetAppCollectionViewCell _textLabelFont](v4, "_textLabelFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v19, "setFont:", v20);

    -[UILabel setNumberOfLines:](v4->_textLabel, "setNumberOfLines:", -[SBHAddWidgetSheetAppCollectionViewCell _textLabelNumberOfLines](v4, "_textLabelNumberOfLines"));
    v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailTextLabel = v4->_detailTextLabel;
    v4->_detailTextLabel = v21;

    v23 = v4->_detailTextLabel;
    -[SBHAddWidgetSheetAppCollectionViewCell _detailTextLabelFont](v4, "_detailTextLabelFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v23, "setFont:", v24);

    v25 = v4->_detailTextLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v25, "setTextColor:", v26);

    -[UILabel setNumberOfLines:](v4->_detailTextLabel, "setNumberOfLines:", 0);
    -[UILabel setHidden:](v4->_detailTextLabel, "setHidden:", 1);
    v27 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v82[0] = v4->_textLabel;
    v82[1] = v4->_detailTextLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "initWithArrangedSubviews:", v28);
    verticalStackView = v4->_verticalStackView;
    v4->_verticalStackView = (UIStackView *)v29;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_verticalStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v4->_verticalStackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v4->_verticalStackView, "setAlignment:", 1);
    objc_msgSend(v5, "addSubview:", v4->_verticalStackView);
    v31 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v81[0] = v4->_imageView;
    v81[1] = v4->_verticalStackView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "initWithArrangedSubviews:", v32);
    horizontalStackView = v4->_horizontalStackView;
    v4->_horizontalStackView = (UIStackView *)v33;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_horizontalStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v4->_horizontalStackView, "setAxis:", 0);
    -[UIStackView setAlignment:](v4->_horizontalStackView, "setAlignment:", 3);
    objc_msgSend(v5, "addSubview:", v4->_horizontalStackView);
    -[UIStackView leadingAnchor](v4->_horizontalStackView, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v4->_contentInsets.leading);
    v37 = objc_claimAutoreleasedReturnValue();
    leadingConstraint = v4->_leadingConstraint;
    v4->_leadingConstraint = (NSLayoutConstraint *)v37;

    -[UIStackView trailingAnchor](v4->_horizontalStackView, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, -v4->_contentInsets.trailing);
    v41 = objc_claimAutoreleasedReturnValue();
    trailingConstraint = v4->_trailingConstraint;
    v4->_trailingConstraint = (NSLayoutConstraint *)v41;

    -[UIStackView topAnchor](v4->_horizontalStackView, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetSheetAppCollectionViewCell contentInsets](v4, "contentInsets");
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44);
    v45 = objc_claimAutoreleasedReturnValue();
    topConstraint = v4->_topConstraint;
    v4->_topConstraint = (NSLayoutConstraint *)v45;

    -[UIStackView bottomAnchor](v4->_horizontalStackView, "bottomAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHAddWidgetSheetAppCollectionViewCell contentInsets](v4, "contentInsets");
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, -v49);
    v50 = objc_claimAutoreleasedReturnValue();
    bottomConstraint = v4->_bottomConstraint;
    v4->_bottomConstraint = (NSLayoutConstraint *)v50;

    v80[0] = v4->_leadingConstraint;
    v80[1] = v4->_trailingConstraint;
    v52 = (void *)MEMORY[0x1E0CB3718];
    v80[2] = v4->_topConstraint;
    v80[3] = v4->_bottomConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 4);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "activateConstraints:", v53);

    v54 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v54;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v56 = v4->_separatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v56, "setBackgroundColor:", v57);

    -[SBHAddWidgetSheetAppCollectionViewCell setSeparatorVisible:](v4, "setSeparatorVisible:", 1);
    objc_msgSend(v5, "addSubview:", v4->_separatorView);
    v74 = (void *)MEMORY[0x1E0CB3718];
    -[UIView trailingAnchor](v4->_separatorView, "trailingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v5;
    objc_msgSend(v5, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v59;
    -[UIView bottomAnchor](v4->_separatorView, "bottomAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v62;
    -[UIView heightAnchor](v4->_separatorView, "heightAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "scale");
    objc_msgSend(v63, "constraintEqualToConstant:", 1.0 / v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v79[2] = v66;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 3);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "activateConstraints:", v67);

    -[SBHAddWidgetSheetAppCollectionViewCell _updateSeparatorLeadingConstraint](v4, "_updateSeparatorLeadingConstraint");
    v68 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[SBHAddWidgetSheetAppCollectionViewCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v68);
    -[SBHAddWidgetSheetAppCollectionViewCell _updateAppearanceForFocus](v4, "_updateAppearanceForFocus");
    -[SBHAddWidgetSheetAppCollectionViewCell _updateTableViewStyle](v4, "_updateTableViewStyle");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObserver:selector:name:object:", v4, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0DC48E8], 0);

    objc_opt_self();
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v70;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (id)-[SBHAddWidgetSheetAppCollectionViewCell registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v71, sel__contentSizeCategoryDidChange);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetSheetAppCollectionViewCell;
  -[SBHAddWidgetSheetAppCollectionViewCell dealloc](&v4, sel_dealloc);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[SBHAddWidgetSheetAppCollectionViewCell addWidgetSheetStyle](self, "addWidgetSheetStyle") != 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBHAddWidgetSheetAppCollectionViewCell;
    -[SBHAddWidgetSheetAppCollectionViewCell setHighlighted:](&v5, sel_setHighlighted_, v3);
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetSheetAppCollectionViewCell;
  -[SBHAddWidgetSheetAppCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  self->_isFocused = 0;
  -[UILabel setText:](self->_textLabel, "setText:", 0);
  -[UILabel setText:](self->_detailTextLabel, "setText:", 0);
  -[UIImageView setImage:](self->_imageView, "setImage:", 0);
  -[SBHAddWidgetSheetAppCollectionViewCell setSeparatorVisible:](self, "setSeparatorVisible:", 1);
  -[SBHAddWidgetSheetAppCollectionViewCell _updateAppearanceForFocus](self, "_updateAppearanceForFocus");
  -[SBHAddWidgetSheetAppCollectionViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
}

- (void)setAddWidgetSheetStyle:(unint64_t)a3
{
  if (self->_addWidgetSheetStyle != a3)
  {
    self->_addWidgetSheetStyle = a3;
    -[SBHAddWidgetSheetAppCollectionViewCell _updateTableViewStyle](self, "_updateTableViewStyle");
  }
}

- (void)setSeparatorVisible:(BOOL)a3
{
  if (self->_separatorVisible != a3)
  {
    self->_separatorVisible = a3;
    -[SBHAddWidgetSheetAppCollectionViewCell _updateTableViewStyle](self, "_updateTableViewStyle");
  }
}

- (void)_updateTableViewStyle
{
  unint64_t addWidgetSheetStyle;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  BOOL v10;
  uint64_t v11;

  addWidgetSheetStyle = self->_addWidgetSheetStyle;
  -[SBHAddWidgetSheetAppCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (addWidgetSheetStyle)
  {
    objc_msgSend(v4, "_setContinuousCornerRadius:", 12.0);
    -[SBHAddWidgetSheetAppCollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 12.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v9);

    objc_msgSend(v5, "_setContinuousCornerRadius:", 0.0);
    -[SBHAddWidgetSheetAppCollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0.0;
  }
  objc_msgSend(v6, "_setContinuousCornerRadius:", v8);

  -[SBHAddWidgetSheetAppCollectionViewCell _contentSizeCategoryDidChange](self, "_contentSizeCategoryDidChange");
  if (addWidgetSheetStyle)
    v10 = 1;
  else
    v10 = !self->_separatorVisible;
  v11 = v10;
  -[UIView setHidden:](self->_separatorView, "setHidden:", v11);
}

- (void)setSeparatorAlignedToLabels:(BOOL)a3
{
  if (self->_separatorAlignedToLabels != a3)
  {
    self->_separatorAlignedToLabels = a3;
    -[SBHAddWidgetSheetAppCollectionViewCell _updateSeparatorLeadingConstraint](self, "_updateSeparatorLeadingConstraint");
  }
}

- (void)_updateSeparatorLeadingConstraint
{
  void *v2;
  NSLayoutConstraint *separatorLeadingConstraint;
  NSLayoutConstraint *v5;
  void *v6;
  _BOOL4 separatorAlignedToLabels;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *v10;

  separatorLeadingConstraint = self->_separatorLeadingConstraint;
  if (separatorLeadingConstraint)
  {
    -[NSLayoutConstraint setActive:](separatorLeadingConstraint, "setActive:", 0);
    v5 = self->_separatorLeadingConstraint;
    self->_separatorLeadingConstraint = 0;

  }
  -[UIView leadingAnchor](self->_separatorView, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  separatorAlignedToLabels = self->_separatorAlignedToLabels;
  if (self->_separatorAlignedToLabels)
  {
    -[UILabel leadingAnchor](self->_textLabel, "leadingAnchor");
  }
  else
  {
    -[SBHAddWidgetSheetAppCollectionViewCell contentView](self, "contentView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "leadingAnchor");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  v10 = self->_separatorLeadingConstraint;
  self->_separatorLeadingConstraint = v9;

  if (!separatorAlignedToLabels)
  {

    v8 = v2;
  }

  -[NSLayoutConstraint setActive:](self->_separatorLeadingConstraint, "setActive:", 1);
}

- (void)setDetailText:(id)a3
{
  -[UILabel setText:](self->_detailTextLabel, "setText:");
  -[UILabel setHidden:](self->_detailTextLabel, "setHidden:", a3 == 0);
}

- (NSString)detailText
{
  return -[UILabel text](self->_detailTextLabel, "text");
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double bottom;
  double top;

  trailing = a3.trailing;
  bottom = a3.bottom;
  top = a3.top;
  if (a3.leading != self->_contentInsets.leading
    || a3.top != self->_contentInsets.top
    || a3.trailing != self->_contentInsets.trailing
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    -[NSLayoutConstraint setConstant:](self->_leadingConstraint, "setConstant:", a3.leading);
    -[NSLayoutConstraint setConstant:](self->_trailingConstraint, "setConstant:", -trailing);
    -[NSLayoutConstraint setConstant:](self->_topConstraint, "setConstant:", top);
    -[NSLayoutConstraint setConstant:](self->_bottomConstraint, "setConstant:", -bottom);
  }
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBIconImageInfo *p_iconImageInfo;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    -[NSLayoutConstraint setConstant:](self->_iconWidthConstraint, "setConstant:", v10);
    -[NSLayoutConstraint setConstant:](self->_iconHeightConstraint, "setConstant:", v9);
  }
}

- (void)setContentHorizontalSpacing:(double)a3
{
  -[UIStackView setSpacing:](self->_horizontalStackView, "setSpacing:", a3);
  -[SBHAddWidgetSheetAppCollectionViewCell _updateSeparatorLeadingConstraint](self, "_updateSeparatorLeadingConstraint");
}

- (double)contentHorizontalSpacing
{
  double result;

  -[UIStackView spacing](self->_horizontalStackView, "spacing");
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  SBHAddWidgetSheetAppCollectionViewCell *v5;
  SBHAddWidgetSheetAppCollectionViewCell *v6;
  BOOL v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "nextFocusedItem");
  v5 = (SBHAddWidgetSheetAppCollectionViewCell *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    v7 = 1;
    goto LABEL_5;
  }
  objc_msgSend(v8, "previouslyFocusedItem");
  v6 = (SBHAddWidgetSheetAppCollectionViewCell *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    v7 = 0;
LABEL_5:
    self->_isFocused = v7;
    -[SBHAddWidgetSheetAppCollectionViewCell _updateAppearanceForFocus](self, "_updateAppearanceForFocus");
  }

}

- (void)_updateAppearanceForFocus
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_isFocused)
  {
    -[SBHAddWidgetSheetAppCollectionViewCell tintColor](self, "tintColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_visualStylingProvider);
    v5 = WeakRetained != 0;

  }
  -[SBHAddWidgetSheetAppCollectionViewCell selectedBackgroundView](self, "selectedBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v11);

  -[SBHAddWidgetSheetAppCollectionViewCell textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v3);

  -[SBHAddWidgetSheetAppCollectionViewCell imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v3);

  -[SBHAddWidgetSheetAppCollectionViewCell detailTextLabel](self, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v4);

  -[SBHAddWidgetSheetAppCollectionViewCell setTextLabelHasVisualStyling:](self, "setTextLabelHasVisualStyling:", v5);
  if (-[SBHAddWidgetSheetAppCollectionViewCell imageViewRequiresVisualStyling](self, "imageViewRequiresVisualStyling"))
    -[SBHAddWidgetSheetAppCollectionViewCell setImageViewHasVisualStyling:](self, "setImageViewHasVisualStyling:", v5);

}

- (void)setVisualStylingProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_visualStylingProvider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    if (obj)
    {
      objc_storeWeak((id *)&self->_visualStylingProvider, obj);
      -[SBHAddWidgetSheetAppCollectionViewCell _updateAppearanceForFocus](self, "_updateAppearanceForFocus");
    }
    else
    {
      -[SBHAddWidgetSheetAppCollectionViewCell setTextLabelHasVisualStyling:](self, "setTextLabelHasVisualStyling:", 0);
      -[SBHAddWidgetSheetAppCollectionViewCell setImageViewHasVisualStyling:](self, "setImageViewHasVisualStyling:", 0);
      objc_storeWeak((id *)&self->_visualStylingProvider, 0);
    }
    v5 = obj;
  }

}

- (void)setTextLabelHasVisualStyling:(BOOL)a3
{
  if (self->_textLabelHasVisualStyling != a3)
  {
    self->_textLabelHasVisualStyling = a3;
    -[SBHAddWidgetSheetAppCollectionViewCell _updateVisualStylingForTextLabel](self, "_updateVisualStylingForTextLabel");
  }
}

- (void)setImageViewHasVisualStyling:(BOOL)a3
{
  if (self->_imageViewHasVisualStyling != a3)
  {
    self->_imageViewHasVisualStyling = a3;
    -[SBHAddWidgetSheetAppCollectionViewCell _updateVisualStylingForImageView](self, "_updateVisualStylingForImageView");
  }
}

- (void)setImageViewRequiresVisualStyling:(BOOL)a3
{
  if (self->_imageViewRequiresVisualStyling != a3)
  {
    self->_imageViewRequiresVisualStyling = a3;
    if (a3)
      -[SBHAddWidgetSheetAppCollectionViewCell _updateAppearanceForFocus](self, "_updateAppearanceForFocus");
    else
      -[SBHAddWidgetSheetAppCollectionViewCell setImageViewHasVisualStyling:](self, "setImageViewHasVisualStyling:");
  }
}

- (void)_updateVisualStylingForTextLabel
{
  void *v3;
  id v4;

  -[SBHAddWidgetSheetAppCollectionViewCell visualStylingProvider](self, "visualStylingProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetAppCollectionViewCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_textLabelHasVisualStyling)
  {
    objc_msgSend(v4, "automaticallyUpdateView:withStyle:", v3, 1);
  }
  else
  {
    objc_msgSend(v4, "stopAutomaticallyUpdatingView:", v3);
    objc_msgSend(v3, "mt_removeAllVisualStyling");
  }

}

- (void)_updateVisualStylingForImageView
{
  void *v3;
  id v4;

  -[SBHAddWidgetSheetAppCollectionViewCell visualStylingProvider](self, "visualStylingProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetAppCollectionViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_imageViewHasVisualStyling)
  {
    objc_msgSend(v4, "automaticallyUpdateView:withStyle:", v3, 2);
  }
  else
  {
    objc_msgSend(v4, "stopAutomaticallyUpdatingView:", v3);
    objc_msgSend(v3, "mt_removeAllVisualStyling");
  }

}

- (void)setAddWidgetSheetAppCollectionViewCellTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHAddWidgetSheetAppCollectionViewCell textLabel](self, "textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setAddWidgetSheetAppCollectionViewCellIconImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHAddWidgetSheetAppCollectionViewCell imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  objc_msgSend(v5, "setHidden:", 0);
}

- (int64_t)_uiHIFontStyle
{
  if (self->_addWidgetSheetStyle == 1)
    return 1;
  else
    return 4;
}

- (id)_textLabelFont
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4A88];
  v5 = -[SBHAddWidgetSheetAppCollectionViewCell _uiHIFontStyle](self, "_uiHIFontStyle");
  -[SBHAddWidgetSheetAppCollectionViewCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_detailTextLabelFont
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4A88];
  -[SBHAddWidgetSheetAppCollectionViewCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v4, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)_textLabelNumberOfLines
{
  void *v2;
  NSString *v3;
  unint64_t v4;

  -[SBHAddWidgetSheetAppCollectionViewCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (UIContentSizeCategoryIsAccessibilityCategory(v3))
      v4 = 2;
    else
      v4 = 1;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)_contentSizeCategoryDidChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SBHAddWidgetSheetAppCollectionViewCell textLabel](self, "textLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetAppCollectionViewCell _textLabelFont](self, "_textLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v3);

  objc_msgSend(v6, "setNumberOfLines:", -[SBHAddWidgetSheetAppCollectionViewCell _textLabelNumberOfLines](self, "_textLabelNumberOfLines"));
  -[SBHAddWidgetSheetAppCollectionViewCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetAppCollectionViewCell _detailTextLabelFont](self, "_detailTextLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  -[SBHAddWidgetSheetAppCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (unint64_t)addWidgetSheetStyle
{
  return self->_addWidgetSheetStyle;
}

- (BOOL)isSeparatorVisible
{
  return self->_separatorVisible;
}

- (BOOL)isSeparatorAlignedToLabels
{
  return self->_separatorAlignedToLabels;
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

- (SBIconImageInfo)iconImageInfo
{
  return self;
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

- (BOOL)imageViewRequiresVisualStyling
{
  return self->_imageViewRequiresVisualStyling;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return (MTVisualStylingProvider *)objc_loadWeakRetained((id *)&self->_visualStylingProvider);
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void)setDetailTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailTextLabel, a3);
}

- (UIStackView)horizontalStackView
{
  return self->_horizontalStackView;
}

- (void)setHorizontalStackView:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalStackView, a3);
}

- (UIStackView)verticalStackView
{
  return self->_verticalStackView;
}

- (void)setVerticalStackView:(id)a3
{
  objc_storeStrong((id *)&self->_verticalStackView, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (NSLayoutConstraint)iconHeightConstraint
{
  return self->_iconHeightConstraint;
}

- (void)setIconHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_iconHeightConstraint, a3);
}

- (NSLayoutConstraint)iconWidthConstraint
{
  return self->_iconWidthConstraint;
}

- (void)setIconWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_iconWidthConstraint, a3);
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingConstraint, a3);
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingConstraint, a3);
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (NSLayoutConstraint)separatorLeadingConstraint
{
  return self->_separatorLeadingConstraint;
}

- (void)setSeparatorLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_separatorLeadingConstraint, a3);
}

- (BOOL)textLabelHasVisualStyling
{
  return self->_textLabelHasVisualStyling;
}

- (BOOL)imageViewHasVisualStyling
{
  return self->_imageViewHasVisualStyling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_iconWidthConstraint, 0);
  objc_storeStrong((id *)&self->_iconHeightConstraint, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
  objc_storeStrong((id *)&self->_horizontalStackView, 0);
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_destroyWeak((id *)&self->_visualStylingProvider);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
