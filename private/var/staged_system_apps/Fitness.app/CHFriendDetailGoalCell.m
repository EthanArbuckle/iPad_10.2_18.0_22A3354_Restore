@implementation CHFriendDetailGoalCell

- (void)_setupCell
{
  void *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *subtitleLabel;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[CHFriendDetailGoalCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v7);

  -[CHFriendDetailGoalCell addSubview:](self, "addSubview:", self->_titleLabel);
  v8 = (UILabel *)objc_alloc_init((Class)UILabel);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v10);

  -[CHFriendDetailGoalCell addSubview:](self, "addSubview:", self->_subtitleLabel);
}

- (CHFriendDetailGoalCell)initWithFrame:(CGRect)a3
{
  CHFriendDetailGoalCell *v3;
  CHFriendDetailGoalCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHFriendDetailGoalCell;
  v3 = -[CHFriendDetailGoalCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CHFriendDetailGoalCell _setupCell](v3, "_setupCell");
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double Height;
  double v6;
  CGFloat v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  UILabel *subtitleLabel;
  void *v19;
  objc_super v20;
  _QWORD v21[2];
  NSAttributedStringKey v22;
  void *v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v20.receiver = self;
  v20.super_class = (Class)CHFriendDetailGoalCell;
  -[CHFriendDetailGoalCell layoutSubviews](&v20, "layoutSubviews");
  -[CHFriendDetailGoalCell bounds](self, "bounds");
  v4 = v3;
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[UILabel sizeToFit](self->_subtitleLabel, "sizeToFit");
  -[CHFriendDetailGoalCell bounds](self, "bounds");
  Height = CGRectGetHeight(v24);
  -[UILabel frame](self->_titleLabel, "frame");
  v6 = Height - CGRectGetHeight(v25);
  -[UILabel frame](self->_subtitleLabel, "frame");
  v7 = CGRectGetHeight(v26);
  v8 = UIRoundToViewScale(self, (v6 - v7 - -5.0) * 0.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  v22 = NSFontAttributeName;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  v23 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  objc_msgSend(v9, "sizeWithAttributes:", v11);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, v8, v4, v12);

  -[UILabel frame](self->_titleLabel, "frame");
  v14 = v13;
  -[UILabel frame](self->_titleLabel, "frame");
  v15 = CGRectGetMaxY(v27) + -5.0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_subtitleLabel, "attributedText"));
  objc_msgSend(v16, "size");
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v14, v15, v4, v17);

  if ((id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0) == (id)1)
  {
    subtitleLabel = self->_subtitleLabel;
    v21[0] = self->_titleLabel;
    v21[1] = subtitleLabel;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
    -[CHFriendDetailGoalCell ch_transformViewsForRightToLeftLanguages:](self, "ch_transformViewsForRightToLeftLanguages:", v19);

  }
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
  -[CHFriendDetailGoalCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCurrentValue:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", a3, 1));
  v4 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fu_sausageFontOfSize:](UIFont, "fu_sausageFontOfSize:", 30.0));
  objc_msgSend(v4, "addAttribute:value:range:", NSFontAttributeName, v5, 0, objc_msgSend(v4, "length"));

  objc_msgSend(v4, "addAttribute:value:range:", NSForegroundColorAttributeName, self->_keyColor, 0, objc_msgSend(v4, "length"));
  -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v4);
  -[CHFriendDetailGoalCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)setCurrentValue:(id)a3 unitString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  void *v25;
  UIFontDescriptorAttributeName v26;
  void *v27;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fu_sausageFontOfSize:](UIFont, "fu_sausageFontOfSize:", 30.0));
  v26 = UIFontDescriptorFeatureSettingsAttribute;
  v23[0] = UIFontFeatureTypeIdentifierKey;
  v23[1] = UIFontFeatureSelectorIdentifierKey;
  v24[0] = &off_1007B3C50;
  v24[1] = &off_1007B3C68;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
  v25 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v27 = v10;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontDescriptor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fontDescriptorByAddingAttributes:", v22));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v12, 30.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", v7, 3));

  v15 = objc_alloc((Class)NSMutableAttributedString);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v14, v6));
  v17 = objc_msgSend(v15, "initWithString:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "string"));
  v19 = objc_msgSend(v18, "rangeOfString:", v6);
  v21 = v20;

  objc_msgSend(v17, "addAttribute:value:range:", NSFontAttributeName, v8, 0, v19);
  objc_msgSend(v17, "addAttribute:value:range:", NSFontAttributeName, v13, v19, v21);
  objc_msgSend(v17, "addAttribute:value:range:", NSForegroundColorAttributeName, self->_keyColor, 0, objc_msgSend(v17, "length"));
  -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v17);
  -[CHFriendDetailGoalCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)setCurrentValue:(id)a3 goalValue:(id)a4 unitString:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v29[2];
  _QWORD v30[2];
  void *v31;
  UIFontDescriptorAttributeName v32;
  void *v33;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fu_sausageFontOfSize:](UIFont, "fu_sausageFontOfSize:", 30.0));
  v32 = UIFontDescriptorFeatureSettingsAttribute;
  v29[0] = UIFontFeatureTypeIdentifierKey;
  v29[1] = UIFontFeatureSelectorIdentifierKey;
  v30[0] = &off_1007B3C50;
  v30[1] = &off_1007B3C68;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
  v31 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
  v33 = v12;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fontDescriptor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fontDescriptorByAddingAttributes:", v27));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v14, 30.0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString goalProgressAttrStringWithCurrentValue:goalValue:unitString:](NSString, "goalProgressAttrStringWithCurrentValue:goalValue:unitString:", v9, v8, v7));

  v17 = objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v17, "removeAttribute:range:", NSFontAttributeName, 0, objc_msgSend(v17, "length"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "string"));
  v19 = objc_msgSend(v18, "rangeOfString:", v7);
  v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "string"));
  v23 = objc_msgSend(v22, "rangeOfString:", CFSTR("/"));
  v25 = v24;

  objc_msgSend(v17, "addAttribute:value:range:", NSFontAttributeName, v15, v19, v21);
  objc_msgSend(v17, "addAttribute:value:range:", NSFontAttributeName, v10, 0, v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fu_shortSlashFont"));
  objc_msgSend(v17, "addAttribute:value:range:", NSFontAttributeName, v26, v23, v25);

  objc_msgSend(v17, "addAttribute:value:range:", NSForegroundColorAttributeName, self->_keyColor, 0, objc_msgSend(v17, "length"));
  -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v17);
  -[CHFriendDetailGoalCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)setKeyColor:(id)a3
{
  objc_storeStrong((id *)&self->_keyColor, a3);
  -[CHFriendDetailGoalCell setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSAttributedStringKey v20;
  void *v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_titleLabel, "text"));
  v20 = NSFontAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_titleLabel, "font"));
  v21 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, width, height);
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_subtitleLabel, "attributedText"));
  objc_msgSend(v13, "boundingRectWithSize:options:context:", 1, 0, width, height);
  v15 = v14;
  v17 = v16;

  if (v10 >= v15)
    v18 = v10;
  else
    v18 = v15;
  v19 = v12 + v17 + -5.0;
  result.height = v19;
  result.width = v18;
  return result;
}

+ (double)preferredHeight
{
  return 72.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_metricString, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
