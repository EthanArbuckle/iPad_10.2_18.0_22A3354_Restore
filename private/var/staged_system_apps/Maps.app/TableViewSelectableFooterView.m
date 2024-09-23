@implementation TableViewSelectableFooterView

- (TableViewSelectableFooterView)initWithReuseIdentifier:(id)a3 options:(id)a4
{
  id v6;
  TableViewSelectableFooterView *v7;
  uint64_t v8;
  NSString *footerLabelText;
  uint64_t v10;
  NSString *footerLinkText;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TableViewSelectableFooterView;
  v7 = -[TableViewSelectableFooterView initWithReuseIdentifier:](&v15, "initWithReuseIdentifier:", a3);
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "labelText"));
    footerLabelText = v7->_footerLabelText;
    v7->_footerLabelText = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "linkText"));
    footerLinkText = v7->_footerLinkText;
    v7->_footerLinkText = (NSString *)v10;

    -[TableViewSelectableFooterView _createSubviews](v7, "_createSubviews");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewSelectableFooterView _initialConstraints](v7, "_initialConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, "contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v7;
}

- (void)contentSizeDidChange
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableFooterViewFont](RAPFontManager, "tableFooterViewFont"));
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 38.0);
  -[NSLayoutConstraint setConstant:](self->_topToFirstBaselineConstraint, "setConstant:");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableFooterViewFont](RAPFontManager, "tableFooterViewFont"));
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", -11.0);
  -[NSLayoutConstraint setConstant:](self->_lastBaselineToBottomConstraint, "setConstant:");

  -[TableViewSelectableFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_createSubviews
{
  UIButton *v3;
  UIButton *footerButton;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];
  _QWORD v21[3];

  v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  footerButton = self->_footerButton;
  self->_footerButton = v3;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_footerButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_footerButton, "titleLabel"));
  objc_msgSend(v5, "setLineBreakMode:", 0);

  v17 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v17, "setLineBreakMode:", 0);
  v21[0] = v17;
  v20[0] = NSParagraphStyleAttributeName;
  v20[1] = NSFontAttributeName;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableFooterViewFont](RAPFontManager, "tableFooterViewFont"));
  v21[1] = v6;
  v20[2] = NSForegroundColorAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v21[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 3));

  v18[0] = NSFontAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableFooterViewFont](RAPFontManager, "tableFooterViewFont"));
  v18[1] = NSForegroundColorAttributeName;
  v19[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v19[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));

  v12 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", self->_footerLabelText, v8);
  v13 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", self->_footerLinkText, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableAttributedString localizedAttributedStringWithFormat:](NSMutableAttributedString, "localizedAttributedStringWithFormat:", v12, v13));
  -[UIButton setAttributedTitle:forState:](self->_footerButton, "setAttributedTitle:forState:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_footerButton, "titleLabel"));
  objc_msgSend(v15, "setNumberOfLines:", 0);

  -[UIButton setContentHorizontalAlignment:](self->_footerButton, "setContentHorizontalAlignment:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewSelectableFooterView contentView](self, "contentView"));
  objc_msgSend(v16, "addSubview:", self->_footerButton);

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
  void *v7;
  double v8;
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
  _QWORD v27[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_footerButton, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewSelectableFooterView contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintLessThanOrEqualToAnchor:constant:", v6, -15.0));

  LODWORD(v8) = 1148829696;
  objc_msgSend(v7, "setPriority:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_footerButton, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewSelectableFooterView contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, 8.0));
  topToFirstBaselineConstraint = self->_topToFirstBaselineConstraint;
  self->_topToFirstBaselineConstraint = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton lastBaselineAnchor](self->_footerButton, "lastBaselineAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewSelectableFooterView contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager tableFooterViewFont](RAPFontManager, "tableFooterViewFont"));
  objc_msgSend(v17, "_mapkit_scaledValueForValue:", -11.0);
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16));
  lastBaselineToBottomConstraint = self->_lastBaselineToBottomConstraint;
  self->_lastBaselineToBottomConstraint = v18;

  v27[0] = self->_topToFirstBaselineConstraint;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_footerButton, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewSelectableFooterView contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 15.0));
  v24 = self->_lastBaselineToBottomConstraint;
  v27[1] = v23;
  v27[2] = v24;
  v27[3] = v7;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
  objc_msgSend(v3, "addObjectsFromArray:", v25);

  return v3;
}

- (void)setFooterLabelText:(id)a3
{
  NSString *v4;
  NSString *footerLabelText;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_footerLabelText) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    footerLabelText = self->_footerLabelText;
    self->_footerLabelText = v4;

  }
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TableViewSelectableFooterView;
  -[TableViewSelectableFooterView layoutSubviews](&v2, "layoutSubviews");
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  -[UIButton addTarget:action:forControlEvents:](self->_footerButton, "addTarget:action:forControlEvents:", a3, a4, 64);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TableViewSelectableFooterView;
  -[TableViewSelectableFooterView prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_footerButton, "titleLabel"));
  objc_msgSend(v3, "setText:", 0);

  -[UIButton removeTarget:action:forControlEvents:](self->_footerButton, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
}

- (NSString)footerLabelText
{
  return self->_footerLabelText;
}

- (UIButton)footerButton
{
  return self->_footerButton;
}

- (void)setFooterButton:(id)a3
{
  objc_storeStrong((id *)&self->_footerButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerLabelText, 0);
  objc_storeStrong((id *)&self->_footerLinkText, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topToFirstBaselineConstraint, 0);
}

@end
