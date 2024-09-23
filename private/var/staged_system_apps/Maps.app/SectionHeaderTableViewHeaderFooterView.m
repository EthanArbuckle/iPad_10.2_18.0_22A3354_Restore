@implementation SectionHeaderTableViewHeaderFooterView

+ (NSString)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

+ (double)heightWhenFirstNonEmptySection:(BOOL)a3 title:(id)a4 actionTitle:(id)a5 availableWidth:(double)a6 traitCollection:(id)a7
{
  double result;

  +[SectionHeaderView heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:](SectionHeaderView, "heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:", a3, a4, a5, a7, a6);
  return result;
}

+ (double)estimatedHeight
{
  double result;

  +[SectionHeaderView estimatedHeight](SectionHeaderView, "estimatedHeight");
  return result;
}

- (SectionHeaderTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  SectionHeaderTableViewHeaderFooterView *v3;
  id v4;
  void *v5;
  void *v6;
  SectionHeaderView *v7;
  SectionHeaderView *sectionHeaderView;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[4];

  v28.receiver = self;
  v28.super_class = (Class)SectionHeaderTableViewHeaderFooterView;
  v3 = -[SectionHeaderTableViewHeaderFooterView initWithReuseIdentifier:](&v28, "initWithReuseIdentifier:", a3);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[SectionHeaderTableViewHeaderFooterView setBackgroundView:](v3, "setBackgroundView:", v4);

    -[SectionHeaderTableViewHeaderFooterView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("SectionHeaderTableViewHeaderFooterView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView contentView](v3, "contentView"));
    objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("SectionHeaderTableViewHeaderFooterContent"));

    -[SectionHeaderTableViewHeaderFooterView _mapsui_resetLayoutMarginsWithPreservesSuperview:](v3, "_mapsui_resetLayoutMarginsWithPreservesSuperview:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView contentView](v3, "contentView"));
    objc_msgSend(v6, "_mapsui_resetLayoutMarginsWithPreservesSuperview:", 1);

    v7 = objc_alloc_init(SectionHeaderView);
    sectionHeaderView = v3->_sectionHeaderView;
    v3->_sectionHeaderView = v7;

    -[SectionHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v3->_sectionHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView contentView](v3, "contentView"));
    objc_msgSend(v9, "addSubview:", v3->_sectionHeaderView);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView leadingAnchor](v3->_sectionHeaderView, "leadingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView contentView](v3, "contentView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
    v29[0] = v24;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView trailingAnchor](v3->_sectionHeaderView, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView contentView](v3, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
    v29[1] = v20;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView topAnchor](v3->_sectionHeaderView, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView contentView](v3, "contentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
    v29[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView bottomAnchor](v3->_sectionHeaderView, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView contentView](v3, "contentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
    v29[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

  }
  return v3;
}

- (void)setAccessibilityIdentifiersWithBaseString:(id)a3
{
  id v4;
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
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("SectionHeaderView")));
  -[SectionHeaderTableViewHeaderFooterView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("SectionHeaderViewContent")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView contentView](self, "contentView"));
  objc_msgSend(v7, "setAccessibilityIdentifier:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("Section")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v9, "setAccessibilityIdentifier:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("Action")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionButton"));
  objc_msgSend(v12, "setAccessibilityIdentifier:", v10);

  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("Title")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "label"));
  objc_msgSend(v14, "setAccessibilityIdentifier:", v15);

}

- (void)setFirstNonEmptySection:(BOOL)a3 topMargin:(double)a4
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v6, "setFirstNonEmptySection:topMargin:", v5, a4);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SectionHeaderTableViewHeaderFooterView;
  -[SectionHeaderTableViewHeaderFooterView prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v3, "clearContents");

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v5, "setTitle:", v4);

}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return (NSString *)v3;
}

- (void)setActionTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v5, "setActionTitle:", v4);

}

- (NSString)actionTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actionTitle"));

  return (NSString *)v3;
}

- (void)setFirstNonEmptySection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v4, "setFirstNonEmptySection:", v3);

}

- (BOOL)firstNonEmptySection
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  v3 = objc_msgSend(v2, "firstNonEmptySection");

  return v3;
}

- (void)setShowsBottomHairline:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v4, "setShowsBottomHairline:", v3);

}

- (BOOL)showsBottomHairline
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  v3 = objc_msgSend(v2, "showsBottomHairline");

  return v3;
}

- (void)setActionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v5, "setActionHandler:", v4);

}

- (id)actionHandler
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actionHandler"));

  return v3;
}

- (SectionHeaderTableViewHeaderFooterView)initWithTitle:(id)a3 isFirstNonEmptySection:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SectionHeaderTableViewHeaderFooterView *v7;
  SectionHeaderTableViewHeaderFooterView *v8;

  v4 = a4;
  v6 = a3;
  v7 = -[SectionHeaderTableViewHeaderFooterView initWithReuseIdentifier:](self, "initWithReuseIdentifier:", 0);
  v8 = v7;
  if (v7)
  {
    -[SectionHeaderTableViewHeaderFooterView setTitle:](v7, "setTitle:", v6);
    -[SectionHeaderTableViewHeaderFooterView setFirstNonEmptySection:](v8, "setFirstNonEmptySection:", v4);
  }

  return v8;
}

- (void)setActionTitle:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v8, "setActionTitle:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderTableViewHeaderFooterView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v9, "setActionHandler:", v6);

}

- (SectionHeaderView)sectionHeaderView
{
  return self->_sectionHeaderView;
}

- (void)setSectionHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_sectionHeaderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeaderView, 0);
}

@end
