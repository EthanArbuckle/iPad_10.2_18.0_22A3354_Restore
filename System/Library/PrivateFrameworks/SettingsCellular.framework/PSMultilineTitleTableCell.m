@implementation PSMultilineTitleTableCell

- (PSMultilineTitleTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSMultilineTitleTableCell *v4;
  PSMultilineTitleTableCell *v5;
  void *v6;
  void *v7;
  NSString *v8;
  _BOOL4 IsAccessibilityCategory;
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
  uint64_t v21;
  NSLayoutConstraint *titleLeadingCon;
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
  double v41;
  void *v42;
  double v43;
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
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  NSLayoutConstraint *valueTrailingCon;
  void *v73;
  double v74;
  void *v75;
  objc_super v77;

  v77.receiver = self;
  v77.super_class = (Class)PSMultilineTitleTableCell;
  v4 = -[PSMultilineTitleTableCell initWithStyle:reuseIdentifier:](&v77, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PSTableCell titleLabel](v4, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);

    -[PSMultilineTitleTableCell traitCollection](v5, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

    -[PSTableCell titleLabel](v5, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSMultilineTitleTableCell contentView](v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    -[PSTableCell titleLabel](v5, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSMultilineTitleTableCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    titleLeadingCon = v5->_titleLeadingCon;
    v5->_titleLeadingCon = (NSLayoutConstraint *)v21;

    -[NSLayoutConstraint setActive:](v5->_titleLeadingCon, "setActive:", 1);
    -[PSTableCell titleLabel](v5, "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (IsAccessibilityCategory)
    {
      objc_msgSend(v23, "trailingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSMultilineTitleTableCell contentView](v5, "contentView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "safeAreaLayoutGuide");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "trailingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setActive:", 1);

      -[PSTableCell titleLabel](v5, "titleLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bottomAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell valueLabel](v5, "valueLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "topAnchor");
    }
    else
    {
      objc_msgSend(v23, "bottomAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSMultilineTitleTableCell contentView](v5, "contentView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "layoutMarginsGuide");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "bottomAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setActive:", 1);

      -[PSTableCell titleLabel](v5, "titleLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "trailingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell valueLabel](v5, "valueLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "leadingAnchor");
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setActive:", 1);

    -[PSTableCell titleLabel](v5, "titleLabel");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v41) = 1148846080;
    objc_msgSend(v40, "setContentCompressionResistancePriority:forAxis:", 1, v41);

    -[PSTableCell titleLabel](v5, "titleLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v43) = 1148846080;
    objc_msgSend(v42, "setContentHuggingPriority:forAxis:", 1, v43);

    -[PSTableCell titleLabel](v5, "titleLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PSTableCell valueLabel](v5, "valueLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (IsAccessibilityCategory)
    {
      objc_msgSend(v45, "leadingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSMultilineTitleTableCell contentView](v5, "contentView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "layoutMarginsGuide");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "leadingAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintEqualToAnchor:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setActive:", 1);

      -[PSTableCell valueLabel](v5, "valueLabel");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "bottomAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSMultilineTitleTableCell contentView](v5, "contentView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "layoutMarginsGuide");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "bottomAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setActive:", 1);

      -[PSTableCell valueLabel](v5, "valueLabel");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "topAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell titleLabel](v5, "titleLabel");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "bottomAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToAnchor:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setActive:", 1);
    }
    else
    {
      objc_msgSend(v45, "centerYAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSMultilineTitleTableCell contentView](v5, "contentView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "layoutMarginsGuide");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "centerYAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToAnchor:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setActive:", 1);

    }
    -[PSTableCell valueLabel](v5, "valueLabel");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v64) = 1148846080;
    objc_msgSend(v63, "setContentCompressionResistancePriority:forAxis:", 0, v64);

    if (((-[PSMultilineTitleTableCell _shouldReverseLayoutDirection](v5, "_shouldReverseLayoutDirection") ^ 1 | IsAccessibilityCategory) & 1) == 0)
    {
      -[PSTableCell valueLabel](v5, "valueLabel");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setTextAlignment:", 0);

    }
    -[PSTableCell valueLabel](v5, "valueLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSMultilineTitleTableCell contentView](v5, "contentView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "layoutMarginsGuide");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v70);
    v71 = objc_claimAutoreleasedReturnValue();
    valueTrailingCon = v5->_valueTrailingCon;
    v5->_valueTrailingCon = (NSLayoutConstraint *)v71;

    -[NSLayoutConstraint setActive:](v5->_valueTrailingCon, "setActive:", 1);
    -[PSTableCell valueLabel](v5, "valueLabel");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v74) = 1144750080;
    objc_msgSend(v73, "setContentHuggingPriority:forAxis:", 1, v74);

    -[PSTableCell valueLabel](v5, "valueLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSLayoutConstraint *valueTrailingCon;
  NSLayoutConstraint *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  void *v23;
  NSLayoutConstraint *v24;
  void *v25;
  NSString *v26;
  BOOL IsAccessibilityCategory;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)PSMultilineTitleTableCell;
  -[PSTableCell layoutSubviews](&v29, sel_layoutSubviews);
  -[PSMultilineTitleTableCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell valueLabel](self, "valueLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsView:", v4);

  if (v5)
  {
    v6 = -[PSMultilineTitleTableCell accessoryType](self, "accessoryType");
    valueTrailingCon = self->_valueTrailingCon;
    if (v6 == 1)
    {
      if (valueTrailingCon)
      {
        -[NSLayoutConstraint setActive:](valueTrailingCon, "setActive:", 0);
        v8 = self->_valueTrailingCon;
        self->_valueTrailingCon = 0;

      }
      -[PSTableCell valueLabel](self, "valueLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSMultilineTitleTableCell contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safeAreaLayoutGuide");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v13);
      v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v15 = self->_valueTrailingCon;
      self->_valueTrailingCon = v14;

      -[NSLayoutConstraint setActive:](self->_valueTrailingCon, "setActive:", 1);
    }
    else
    {
      if (valueTrailingCon)
      {
        -[NSLayoutConstraint setActive:](valueTrailingCon, "setActive:", 0);
        v16 = self->_valueTrailingCon;
        self->_valueTrailingCon = 0;

      }
      -[PSTableCell valueLabel](self, "valueLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSMultilineTitleTableCell contentView](self, "contentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "layoutMarginsGuide");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v21);
      v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

      -[NSLayoutConstraint setActive:](v22, "setActive:", 1);
      -[PSMultilineTitleTableCell contentView](self, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = PSShouldInsetListView();

      if ((_DWORD)v18)
        -[NSLayoutConstraint setConstant:](v22, "setConstant:", -12.0);
      v24 = self->_valueTrailingCon;
      self->_valueTrailingCon = v22;

    }
  }
  -[PSMultilineTitleTableCell traitCollection](self, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "preferredContentSizeCategory");
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v26);

  if (-[PSMultilineTitleTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    if (!IsAccessibilityCategory)
    {
      -[PSTableCell valueLabel](self, "valueLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setTextAlignment:", 0);

    }
  }
}

- (NSLayoutConstraint)valueTrailingCon
{
  return self->_valueTrailingCon;
}

- (void)setValueTrailingCon:(id)a3
{
  objc_storeStrong((id *)&self->_valueTrailingCon, a3);
}

- (NSLayoutConstraint)titleLeadingCon
{
  return self->_titleLeadingCon;
}

- (void)setTitleLeadingCon:(id)a3
{
  objc_storeStrong((id *)&self->_titleLeadingCon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLeadingCon, 0);
  objc_storeStrong((id *)&self->_valueTrailingCon, 0);
}

@end
