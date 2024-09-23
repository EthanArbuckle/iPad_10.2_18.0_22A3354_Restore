@implementation MapsDebugCollectionViewCell

- (MapsDebugCollectionViewCell)initWithFrame:(CGRect)a3
{
  MapsDebugCollectionViewCell *v3;
  MapsDebugCollectionViewCell *v4;
  uint64_t v5;
  id v6;
  double y;
  double width;
  double height;
  UILabel *v10;
  UILabel *textLabel;
  uint64_t v12;
  void *v13;
  UILabel *v14;
  UILabel *detailTextLabel;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MapsDebugCollectionViewCell;
  v3 = -[MapsDebugCollectionViewCell initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = sub_1002A8AA0(v3);
    v6 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = (UILabel *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    textLabel = v4->_textLabel;
    v4->_textLabel = v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (v5 == 5)
      v12 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
    else
      v12 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v13 = (void *)v12;
    -[UILabel setFont:](v4->_textLabel, "setFont:", v12);

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_textLabel, "setAdjustsFontForContentSizeCategory:", v5 != 5);
    -[UILabel setNumberOfLines:](v4->_textLabel, "setNumberOfLines:", 2);
    -[UILabel setAccessibilityIdentifier:](v4->_textLabel, "setAccessibilityIdentifier:", CFSTR("TextLabel"));
    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    detailTextLabel = v4->_detailTextLabel;
    v4->_detailTextLabel = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_detailTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_detailTextLabel, "setTextColor:", v16);

    if (v5 == 5)
      v17 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
    else
      v17 = objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    v18 = (void *)v17;
    -[UILabel setFont:](v4->_detailTextLabel, "setFont:", v17);

    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_detailTextLabel, "setAdjustsFontForContentSizeCategory:", v5 != 5);
    -[UILabel setNumberOfLines:](v4->_detailTextLabel, "setNumberOfLines:", 2);
    -[UILabel setAccessibilityIdentifier:](v4->_detailTextLabel, "setAccessibilityIdentifier:", CFSTR("DetailTextLabel"));
    -[MapsDebugCollectionViewCell setupContentView](v4, "setupContentView");
  }
  return v4;
}

- (void)setupContentView
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  UILabel *detailTextLabel;
  void *v11;
  id v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _BYTE v24[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCollectionViewCell contentView](self, "contentView", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subviews"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v8), "removeFromSuperview");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  v9 = objc_alloc((Class)UIStackView);
  detailTextLabel = self->_detailTextLabel;
  v23[0] = self->_textLabel;
  v23[1] = detailTextLabel;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
  v12 = objc_msgSend(v9, "initWithArrangedSubviews:", v11);

  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v12, "setAxis:", 1);
  objc_msgSend(v12, "setAlignment:", 0);
  objc_msgSend(v12, "setDistribution:", 2);
  objc_msgSend(v12, "setSpacing:", 1.0);
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("MapsDebugCollectionViewCellTextStack"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v13, "addSubview:", v12);

  if (sub_1002A8AA0(self) == 5)
    v14 = 5.0;
  else
    v14 = 10.0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugCollectionViewCell contentView](self, "contentView"));
  LODWORD(v16) = 1148846080;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_maps_constraintsEqualToEdgesOfView:insets:priority:", v15, v14, 16.0, v14, 16.0, v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (UILabel)detailTextLabel
{
  return self->_detailTextLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
