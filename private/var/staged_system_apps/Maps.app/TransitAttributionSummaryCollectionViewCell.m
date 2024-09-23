@implementation TransitAttributionSummaryCollectionViewCell

- (TransitAttributionSummaryCollectionViewCell)initWithFrame:(CGRect)a3
{
  TransitAttributionSummaryCollectionViewCell *v3;
  TransitAttributionSummaryCollectionViewCell *v4;
  UILabel *v5;
  UILabel *attributionLabel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[4];

  v26.receiver = self;
  v26.super_class = (Class)TransitAttributionSummaryCollectionViewCell;
  v3 = -[TransitAttributionSummaryCollectionViewCell initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TransitAttributionSummaryCollectionViewCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("TransitAttributionSummaryCollectionViewCell"));
    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    attributionLabel = v4->_attributionLabel;
    v4->_attributionLabel = v5;

    -[UILabel setNumberOfLines:](v4->_attributionLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_attributionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v4->_attributionLabel, "setAccessibilityIdentifier:", CFSTR("AttributionLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAttributionSummaryCollectionViewCell contentView](v4, "contentView"));
    objc_msgSend(v7, "addSubview:", v4->_attributionLabel);

    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v4->_attributionLabel, &stru_1011E7AF8);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_attributionLabel, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAttributionSummaryCollectionViewCell contentView](v4, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
    v27[0] = v22;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_attributionLabel, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAttributionSummaryCollectionViewCell contentView](v4, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
    v27[1] = v18;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_attributionLabel, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAttributionSummaryCollectionViewCell contentView](v4, "contentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v10, 1.0));
    v27[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAttributionSummaryCollectionViewCell contentView](v4, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_attributionLabel, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 27.0));
    v27[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  }
  return v4;
}

- (void)setAttribution:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_providerNames"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_mapkit_componentsJoinedInCommaDelimitedList"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TransitAttribution_LineCard_Format"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4));

  -[TransitAttributionSummaryCollectionViewCell setAttributionSummary:](self, "setAttributionSummary:", v7);
}

- (void)setAttributionSummary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  id v23;

  v4 = a3;
  v23 = (id)objc_claimAutoreleasedReturnValue(-[TransitAttributionSummaryCollectionViewCell _moreString](self, "_moreString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Attribution_And_More_format"), CFSTR("localized string not found"), 0));

  v7 = objc_alloc((Class)NSMutableAttributedString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v4, v23));
  v9 = objc_msgSend(v7, "initWithString:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "string"));
  v11 = objc_msgSend(v10, "rangeOfString:", v4);
  v13 = v12;

  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL && v13 != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAttributionSummaryCollectionViewCell mk_theme](self, "mk_theme"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lightTextColor"));
    objc_msgSend(v9, "addAttribute:value:range:", NSForegroundColorAttributeName, v16, v11, v13);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "string"));
  v18 = objc_msgSend(v17, "rangeOfString:options:", v23, 4);
  v20 = v19;

  if (v18 != (id)0x7FFFFFFFFFFFFFFFLL && v20 != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAttributionSummaryCollectionViewCell tintColor](self, "tintColor"));
    objc_msgSend(v9, "addAttribute:value:range:", NSForegroundColorAttributeName, v22, v18, v20);

  }
  -[UILabel setAttributedText:](self->_attributionLabel, "setAttributedText:", v9);

}

- (id)attributionSummary
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_attributionLabel, "attributedText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "string"));

  return v3;
}

- (id)_moreString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("More_ellipsis"), CFSTR("localized string not found"), 0));

  return v3;
}

- (void)tintColorDidChange
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TransitAttributionSummaryCollectionViewCell;
  -[TransitAttributionSummaryCollectionViewCell tintColorDidChange](&v13, "tintColorDidChange");
  v3 = objc_alloc((Class)NSMutableAttributedString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_attributionLabel, "attributedText"));
  v5 = objc_msgSend(v3, "initWithAttributedString:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAttributionSummaryCollectionViewCell _moreString](self, "_moreString"));
  v8 = objc_msgSend(v6, "rangeOfString:", v7);
  v10 = v9;

  objc_msgSend(v5, "removeAttribute:range:", NSForegroundColorAttributeName, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAttributionSummaryCollectionViewCell mk_theme](self, "mk_theme"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tintColor"));
  objc_msgSend(v5, "addAttribute:value:range:", NSForegroundColorAttributeName, v12, v8, v10);

  -[UILabel setAttributedText:](self->_attributionLabel, "setAttributedText:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionLabel, 0);
}

@end
