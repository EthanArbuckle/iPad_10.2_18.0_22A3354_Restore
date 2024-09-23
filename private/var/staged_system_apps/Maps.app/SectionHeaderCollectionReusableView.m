@implementation SectionHeaderCollectionReusableView

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

- (SectionHeaderCollectionReusableView)initWithFrame:(CGRect)a3
{
  SectionHeaderCollectionReusableView *v3;
  void *v4;
  SectionHeaderView *v5;
  SectionHeaderView *sectionHeaderView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[4];

  v21.receiver = self;
  v21.super_class = (Class)SectionHeaderCollectionReusableView;
  v3 = -[SectionHeaderCollectionReusableView initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[SectionHeaderCollectionReusableView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[SectionHeaderCollectionReusableView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("SectionHeaderCollectionReusableView"));
    -[SectionHeaderCollectionReusableView _mapsui_resetLayoutMargins](v3, "_mapsui_resetLayoutMargins");
    -[SectionHeaderCollectionReusableView setEdgesPreservingSuperviewLayoutMargins:](v3, "setEdgesPreservingSuperviewLayoutMargins:", 10);
    v5 = objc_alloc_init(SectionHeaderView);
    sectionHeaderView = v3->_sectionHeaderView;
    v3->_sectionHeaderView = v5;

    -[SectionHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v3->_sectionHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SectionHeaderCollectionReusableView addSubview:](v3, "addSubview:", v3->_sectionHeaderView);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView leadingAnchor](v3->_sectionHeaderView, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView leadingAnchor](v3, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
    v22[0] = v18;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView trailingAnchor](v3->_sectionHeaderView, "trailingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView trailingAnchor](v3, "trailingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v7));
    v22[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView topAnchor](v3->_sectionHeaderView, "topAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView topAnchor](v3, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    v22[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderView bottomAnchor](v3->_sectionHeaderView, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView bottomAnchor](v3, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
    v22[3] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

  }
  return v3;
}

- (void)setFirstNonEmptySection:(BOOL)a3 topMargin:(double)a4
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v6, "setFirstNonEmptySection:topMargin:", v5, a4);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SectionHeaderCollectionReusableView;
  -[SectionHeaderCollectionReusableView prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v3, "clearContents");

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SectionHeaderCollectionReusableView layoutMargins](self, "layoutMargins");
  v11 = width - v10;
  -[SectionHeaderCollectionReusableView layoutMargins](self, "layoutMargins");
  v13 = v11 - v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v14, "updateConstraintsWithAvailableWidthWithoutMargins:", v13);

  v19.receiver = self;
  v19.super_class = (Class)SectionHeaderCollectionReusableView;
  *(float *)&v15 = a4;
  *(float *)&v16 = a5;
  -[SectionHeaderCollectionReusableView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v19, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v15, v16);
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SectionHeaderCollectionReusableView;
  -[SectionHeaderCollectionReusableView layoutMarginsDidChange](&v3, "layoutMarginsDidChange");
  -[SectionHeaderCollectionReusableView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SectionHeaderCollectionReusableView;
  v4 = a3;
  -[SectionHeaderCollectionReusableView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
    -[SectionHeaderCollectionReusableView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
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
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("SectionHeaderView")));
  -[SectionHeaderCollectionReusableView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("Section")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v7, "setAccessibilityIdentifier:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("Action")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionButton"));
  objc_msgSend(v10, "setAccessibilityIdentifier:", v8);

  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("Title")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "label"));
  objc_msgSend(v12, "setAccessibilityIdentifier:", v13);

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v5, "setTitle:", v4);

}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return (NSString *)v3;
}

- (void)setActionTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v5, "setActionTitle:", v4);

}

- (NSString)actionTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actionTitle"));

  return (NSString *)v3;
}

- (void)setFirstNonEmptySection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v4, "setFirstNonEmptySection:", v3);

}

- (BOOL)firstNonEmptySection
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  v3 = objc_msgSend(v2, "firstNonEmptySection");

  return v3;
}

- (void)setShowsBottomHairline:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v4, "setShowsBottomHairline:", v3);

}

- (BOOL)showsBottomHairline
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  v3 = objc_msgSend(v2, "showsBottomHairline");

  return v3;
}

- (void)setActionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v5, "setActionHandler:", v4);

}

- (id)actionHandler
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actionHandler"));

  return v3;
}

- (SectionHeaderCollectionReusableView)initWithTitle:(id)a3 isFirstNonEmptySection:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SectionHeaderCollectionReusableView *v7;
  SectionHeaderCollectionReusableView *v8;

  v4 = a4;
  v6 = a3;
  v7 = -[SectionHeaderCollectionReusableView init](self, "init");
  v8 = v7;
  if (v7)
  {
    -[SectionHeaderCollectionReusableView setTitle:](v7, "setTitle:", v6);
    -[SectionHeaderCollectionReusableView setFirstNonEmptySection:](v8, "setFirstNonEmptySection:", v4);
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
  objc_msgSend(v8, "setActionTitle:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[SectionHeaderCollectionReusableView sectionHeaderView](self, "sectionHeaderView"));
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
