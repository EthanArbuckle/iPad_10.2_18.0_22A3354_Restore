@implementation CarTwoPartLabel

- (CarTwoPartLabel)initWithTopLabelHorizontalCompressionResistancePriority:(float)a3 bottomLabelHorizontalCompressionResistancePriority:(float)a4
{
  double y;
  double width;
  double height;
  CarTwoPartLabel *v9;
  CarTwoPartLabel *v10;
  UILabel *v11;
  UILabel *topLabel;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  UILabel *v19;
  void *v20;
  double v21;
  UILabel *v22;
  UILabel *bottomLabel;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  UILabel *v30;
  void *v31;
  double v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CarTwoPartLabel;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = -[CarTwoPartLabel initWithFrame:](&v34, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v10 = v9;
  if (v9)
  {
    -[CarTwoPartLabel setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("CarTwoPartLabel"));
    v10->_topLabelPriority = a3;
    v10->_bottomLabelPriority = a4;
    v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    topLabel = v10->_topLabel;
    v10->_topLabel = v11;

    -[UILabel setAccessibilityIdentifier:](v10->_topLabel, "setAccessibilityIdentifier:", CFSTR("TopLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_topLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v13) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v10->_topLabel, "setContentHuggingPriority:forAxis:", 1, v13);
    LODWORD(v14) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v10->_topLabel, "setContentCompressionResistancePriority:forAxis:", 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v10->_topLabel, "setTextColor:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightBold));
    -[UILabel setFont:](v10->_topLabel, "setFont:", v16);

    -[UILabel setAdjustsFontSizeToFitWidth:](v10->_topLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v10->_topLabel, "font"));
    objc_msgSend(v17, "pointSize");
    v19 = v10->_topLabel;
    if (10.0 / v18 > 1.0)
    {
      -[UILabel setMinimumScaleFactor:](v19, "setMinimumScaleFactor:", 1.0);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v19, "font"));
      objc_msgSend(v20, "pointSize");
      -[UILabel setMinimumScaleFactor:](v10->_topLabel, "setMinimumScaleFactor:", 10.0 / v21);

    }
    -[CarTwoPartLabel addSubview:](v10, "addSubview:", v10->_topLabel);
    v22 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    bottomLabel = v10->_bottomLabel;
    v10->_bottomLabel = v22;

    -[UILabel setAccessibilityIdentifier:](v10->_bottomLabel, "setAccessibilityIdentifier:", CFSTR("BottomLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_bottomLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v24) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v10->_bottomLabel, "setContentHuggingPriority:forAxis:", 1, v24);
    LODWORD(v25) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v10->_bottomLabel, "setContentCompressionResistancePriority:forAxis:", 1, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
    -[UILabel setTextColor:](v10->_bottomLabel, "setTextColor:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption1, UIFontWeightRegular));
    -[UILabel setFont:](v10->_bottomLabel, "setFont:", v27);

    -[UILabel setAdjustsFontSizeToFitWidth:](v10->_bottomLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v10->_bottomLabel, "font"));
    objc_msgSend(v28, "pointSize");
    v30 = v10->_bottomLabel;
    if (10.0 / v29 > 1.0)
    {
      -[UILabel setMinimumScaleFactor:](v30, "setMinimumScaleFactor:", 1.0);
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v30, "font"));
      objc_msgSend(v31, "pointSize");
      -[UILabel setMinimumScaleFactor:](v10->_bottomLabel, "setMinimumScaleFactor:", 10.0 / v32);

    }
    -[CarTwoPartLabel addSubview:](v10, "addSubview:", v10->_bottomLabel);
    -[CarTwoPartLabel _setupConstraints](v10, "_setupConstraints");
  }
  return v10;
}

- (void)layoutIfNeeded
{
  void *v3;
  _QWORD v4[5];
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarTwoPartLabel;
  -[CarTwoPartLabel layoutIfNeeded](&v6, "layoutIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarTwoPartLabel window](self, "window"));

  if (v3)
  {
    if (-[UILabel isTextTruncated](self->_topLabel, "isTextTruncated"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10074517C;
      block[3] = &unk_1011AC860;
      block[4] = self;
      if (qword_1014D3000 != -1)
        dispatch_once(&qword_1014D3000, block);
    }
    if (-[UILabel isTextTruncated](self->_bottomLabel, "isTextTruncated"))
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_10074537C;
      v4[3] = &unk_1011AC860;
      v4[4] = self;
      if (qword_1014D3008 != -1)
        dispatch_once(&qword_1014D3008, v4);
    }
  }
}

- (double)_topToBottomBaselineConstant
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_topLabel, "font"));
  objc_msgSend(v3, "_scaledValueForValue:useLanguageAwareScaling:", 1, 13.0);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_bottomLabel, "font"));
  objc_msgSend(v6, "_scaledValueForValue:useLanguageAwareScaling:", 1, 13.0);
  if (v5 > v7)
    v8 = 56;
  else
    v8 = 64;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v8), "font"));
  objc_msgSend(v9, "_scaledValueForValue:useLanguageAwareScaling:", 1, 13.0);
  v11 = v10;

  return v11;
}

- (void)_setupConstraints
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *topToBottomConstraint;
  NSLayoutConstraint *v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[8];

  -[CarTwoPartLabel _topToBottomBaselineConstant](self, "_topToBottomBaselineConstant");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_bottomLabel, "firstBaselineAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_topLabel, "lastBaselineAnchor"));
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, v4));
  topToBottomConstraint = self->_topToBottomConstraint;
  self->_topToBottomConstraint = v7;

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_topLabel, "firstBaselineAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarTwoPartLabel topAnchor](self, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 20.0));
  v32[0] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_topLabel, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarTwoPartLabel leadingAnchor](self, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v32[1] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_topLabel, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarTwoPartLabel trailingAnchor](self, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v9 = self->_topToBottomConstraint;
  v32[2] = v23;
  v32[3] = v9;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_bottomLabel, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_topLabel, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v32[4] = v20;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_bottomLabel, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarTwoPartLabel leadingAnchor](self, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v32[5] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_bottomLabel, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarTwoPartLabel trailingAnchor](self, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v32[6] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_bottomLabel, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarTwoPartLabel bottomAnchor](self, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  v32[7] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

}

- (void)setPrimaryText:(id)a3
{
  id v5;
  NSString *primaryText;
  id v7;
  unsigned __int8 v8;
  unint64_t v9;

  v5 = a3;
  primaryText = self->_primaryText;
  v9 = (unint64_t)v5;
  v7 = primaryText;
  if (v9 | (unint64_t)v7)
  {
    v8 = objc_msgSend((id)v9, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_primaryText, a3);
      -[UILabel setText:](self->_topLabel, "setText:", v9);
      -[CarTwoPartLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
  }

}

- (void)setPrimaryAttributedText:(id)a3
{
  id v5;
  NSAttributedString *primaryAttributedText;
  id v7;
  unsigned __int8 v8;
  unint64_t v9;

  v5 = a3;
  primaryAttributedText = self->_primaryAttributedText;
  v9 = (unint64_t)v5;
  v7 = primaryAttributedText;
  if (v9 | (unint64_t)v7)
  {
    v8 = objc_msgSend((id)v9, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_primaryAttributedText, a3);
      -[UILabel setAttributedText:](self->_topLabel, "setAttributedText:", v9);
      -[CarTwoPartLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
  }

}

- (void)setSecondaryText:(id)a3
{
  id v5;
  NSString *secondaryText;
  id v7;
  unsigned __int8 v8;
  unint64_t v9;

  v5 = a3;
  secondaryText = self->_secondaryText;
  v9 = (unint64_t)v5;
  v7 = secondaryText;
  if (v9 | (unint64_t)v7)
  {
    v8 = objc_msgSend((id)v9, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_secondaryText, a3);
      -[UILabel setText:](self->_bottomLabel, "setText:", v9);
      -[CarTwoPartLabel invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    }
  }

}

- (void)setSecondaryAccessibilityText:(id)a3
{
  id v5;
  NSString *secondaryAccessibilityText;
  id v7;
  unsigned __int8 v8;
  unint64_t v9;

  v5 = a3;
  secondaryAccessibilityText = self->_secondaryAccessibilityText;
  v9 = (unint64_t)v5;
  v7 = secondaryAccessibilityText;
  if (v9 | (unint64_t)v7)
  {
    v8 = objc_msgSend((id)v9, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_secondaryAccessibilityText, a3);
      -[UILabel setAccessibilityLabel:](self->_bottomLabel, "setAccessibilityLabel:", v9);
    }
  }

}

- (id)viewForFirstBaselineLayout
{
  return self->_topLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_bottomLabel;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[UILabel intrinsicContentSize](self->_topLabel, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  -[UILabel intrinsicContentSize](self->_bottomLabel, "intrinsicContentSize");
  if (v4 > v7)
    v7 = v4;
  v9 = v6 + v8 + 10.0;
  result.height = v9;
  result.width = v7;
  return result;
}

- (double)topLabelIntrinsicWidth
{
  double result;

  -[UILabel intrinsicContentSize](self->_topLabel, "intrinsicContentSize");
  return result;
}

- (double)bottomLabelIntrinsicWidth
{
  double result;

  -[UILabel intrinsicContentSize](self->_bottomLabel, "intrinsicContentSize");
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarTwoPartLabel;
  v4 = a3;
  -[CarTwoPartLabel traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarTwoPartLabel traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  if (v6 != v7)
  {
    -[CarTwoPartLabel _topToBottomBaselineConstant](self, "_topToBottomBaselineConstant");
    -[NSLayoutConstraint setConstant:](self->_topToBottomConstraint, "setConstant:");
  }
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSAttributedString)primaryAttributedText
{
  return self->_primaryAttributedText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (NSString)secondaryAccessibilityText
{
  return self->_secondaryAccessibilityText;
}

- (UILabel)topLabel
{
  return self->_topLabel;
}

- (UILabel)bottomLabel
{
  return self->_bottomLabel;
}

- (float)topLabelPriority
{
  return self->_topLabelPriority;
}

- (float)bottomLabelPriority
{
  return self->_bottomLabelPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);
  objc_storeStrong((id *)&self->_secondaryAccessibilityText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryAttributedText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_topToBottomConstraint, 0);
}

@end
