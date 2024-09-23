@implementation SimpleContaineeFooterView

- (SimpleContaineeFooterView)initWithReuseIdentifier:(id)a3
{
  SimpleContaineeFooterView *v3;
  UILabel *v4;
  UILabel *label;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  UILabel *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SimpleContaineeFooterView;
  v3 = -[SimpleContaineeFooterView initWithReuseIdentifier:](&v21, "initWithReuseIdentifier:", a3);
  if (v3)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    label = v3->_label;
    v3->_label = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v3->_label, "setFont:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v3->_label, "setBackgroundColor:", v8);

    LODWORD(v9) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_label, "setContentCompressionResistancePriority:forAxis:", 1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeFooterView contentView](v3, "contentView"));
    objc_msgSend(v10, "addSubview:", v3->_label);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration"));
    -[SimpleContaineeFooterView setBackgroundConfiguration:](v3, "setBackgroundConfiguration:", v11);

    v12 = sub_1002A8AA0(v3);
    if (v12 == 5)
      v13 = 4.0;
    else
      v13 = 16.0;
    if (v12 == 5)
      v14 = 0.0;
    else
      v14 = 16.0;
    v15 = v3->_label;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleContaineeFooterView contentView](v3, "contentView"));
    LODWORD(v17) = 1148846080;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel _maps_constraintsEqualToEdgesOfView:insets:priority:](v15, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v16, v13, v14, 0.0, v14, v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

  }
  return v3;
}

- (void)setText:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "copy");
  -[UILabel setText:](self->_label, "setText:", v4);

}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
