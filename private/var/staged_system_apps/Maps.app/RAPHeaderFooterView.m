@implementation RAPHeaderFooterView

- (RAPHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  RAPHeaderFooterView *v3;
  RAPHeaderFooterView *v4;
  void *v5;
  id v6;
  double v7;
  uint64_t v8;
  NSDictionary *attributes;
  void *v10;
  objc_super v12;
  NSAttributedStringKey v13;
  id v14;

  v12.receiver = self;
  v12.super_class = (Class)RAPHeaderFooterView;
  v3 = -[RAPHeaderFooterView initWithReuseIdentifier:](&v12, "initWithReuseIdentifier:", a3);
  v4 = v3;
  if (v3)
  {
    -[RAPHeaderFooterView _createSubviews](v3, "_createSubviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHeaderFooterView _initialConstraints](v4, "_initialConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5);

    v6 = objc_alloc_init((Class)NSMutableParagraphStyle);
    LODWORD(v7) = 1.0;
    objc_msgSend(v6, "setHyphenationFactor:", v7);
    v13 = NSParagraphStyleAttributeName;
    v14 = v6;
    v8 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    attributes = v4->_attributes;
    v4->_attributes = (NSDictionary *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v4, "contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v4;
}

- (void)contentSizeDidChange
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager regularTitleFont](RAPFontManager, "regularTitleFont"));
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 38.0);
  -[NSLayoutConstraint setConstant:](self->_topToFirstBaselineConstraint, "setConstant:");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager regularTitleFont](RAPFontManager, "regularTitleFont"));
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", -11.0);
  -[NSLayoutConstraint setConstant:](self->_lastBaselineToBottomConstraint, "setConstant:");

  -[RAPHeaderFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_createSubviews
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHeaderFooterView contentView](self, "contentView"));
  objc_msgSend(v5, "addSubview:", self->_titleLabel);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager regularTitleFont](RAPFontManager, "regularTitleFont"));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHeaderFooterView traitCollection](self, "traitCollection"));
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 != (id)5)
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHeaderFooterView contentView](self, "contentView", a3.width, a3.height));
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)bottomPadding
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "scale");
  v4 = -1.0 / v3;

  return v4 + 7.0;
}

- (id)_initialConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *topToFirstBaselineConstraint;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *lastBaselineToBottomConstraint;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSLayoutConstraint *v24;
  void *v25;
  void *v27;
  _QWORD v28[4];

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHeaderFooterView contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintLessThanOrEqualToAnchor:", v5));

  LODWORD(v7) = 1148829696;
  objc_msgSend(v6, "setPriority:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHeaderFooterView contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager regularTitleFont](RAPFontManager, "regularTitleFont"));
  objc_msgSend(v11, "_mapkit_scaledValueForValue:", 38.0);
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10));
  topToFirstBaselineConstraint = self->_topToFirstBaselineConstraint;
  self->_topToFirstBaselineConstraint = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHeaderFooterView contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager regularTitleFont](RAPFontManager, "regularTitleFont"));
  objc_msgSend(v17, "_mapkit_scaledValueForValue:", -11.0);
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16));
  lastBaselineToBottomConstraint = self->_lastBaselineToBottomConstraint;
  self->_lastBaselineToBottomConstraint = v18;

  v28[0] = self->_topToFirstBaselineConstraint;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPHeaderFooterView contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 16.0));
  v24 = self->_lastBaselineToBottomConstraint;
  v28[1] = v23;
  v28[2] = v24;
  v28[3] = v6;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
  objc_msgSend(v27, "addObjectsFromArray:", v25);

  return v27;
}

- (void)setTitleLabelText:(id)a3
{
  NSString *v4;
  NSString *titleLabelText;
  id v6;
  const __CFString *v7;
  id v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "isEqualToString:", self->_titleLabelText) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v9, "copy");
    titleLabelText = self->_titleLabelText;
    self->_titleLabelText = v4;

    v6 = objc_alloc((Class)NSAttributedString);
    if (self->_titleLabelText)
      v7 = (const __CFString *)self->_titleLabelText;
    else
      v7 = &stru_1011EB268;
    v8 = objc_msgSend(v6, "initWithString:attributes:", v7, self->_attributes);
    -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v8);

  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPHeaderFooterView;
  -[RAPHeaderFooterView layoutSubviews](&v5, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager regularTitleFont](RAPFontManager, "regularTitleFont"));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NSString)titleLabelText
{
  return self->_titleLabelText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelText, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topToFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
