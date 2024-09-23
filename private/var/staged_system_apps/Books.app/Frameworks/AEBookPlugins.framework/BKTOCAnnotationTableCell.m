@implementation BKTOCAnnotationTableCell

+ (double)titleFontSize
{
  return 17.0;
}

+ (double)dateFontSize
{
  return 14.0;
}

+ (double)pageNumberFontSize
{
  return 17.0;
}

+ (id)dateFontForPopover
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", UIFontTextStyleCallout));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleCallout));
  objc_msgSend(v3, "pointSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollectionLimitedToSizeCategory:](UITraitCollection, "currentTraitCollectionLimitedToSizeCategory:", UIContentSizeCategoryLarge));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scaledFontForFont:maximumPointSize:compatibleWithTraitCollection:", v4, v5, 28.0));

  return v6;
}

+ (id)pageNumberFontForPopover
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollectionLimitedToSizeCategory:](UITraitCollection, "currentTraitCollectionLimitedToSizeCategory:", UIContentSizeCategoryAccessibilityLarge));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v2));

  return v3;
}

+ (CGSize)dateLabelSizeForString:(id)a3 font:(id)a4 bounds:(CGRect)a5
{
  double width;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;
  double v16;
  float v17;
  double v18;
  CGSize result;

  width = a5.size.width;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "lineHeight");
  +[UILabel bkSizeForString:constrainedToSize:font:lineBreakMode:](UILabel, "bkSizeForString:constrainedToSize:font:lineBreakMode:", v8, v7, 4, width, v9);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = width;
  v16 = fminf(ceilf(v14), ceilf(v15));
  v17 = v13;
  v18 = ceilf(v17);
  result.height = v18;
  result.width = v16;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  objc_super v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v28.receiver = self;
  v28.super_class = (Class)BKTOCAnnotationTableCell;
  -[BKTOCTableViewCell layoutSubviews](&v28, "layoutSubviews");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell contentView](self, "contentView"));
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[BKTOCTableViewCell contentInsets](self, "contentInsets");
  v23 = v22;
  -[BKTOCTableViewCell contentInsets](self, "contentInsets");
  v25 = v19 - (v23 + v24);
  -[BKTOCTableViewCell contentInsets](self, "contentInsets");
  -[BKTOCAnnotationTableCell layoutSubviewsNotEditingWithBounds:](self, "layoutSubviewsNotEditingWithBounds:", v15 + v26, v17, v25, v21);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[BKTOCAnnotationTableCell setBackgroundColor:](self, "setBackgroundColor:", v27);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKTOCAnnotationTableCell;
  -[BKTOCTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[UILabel setText:](self->_dateLabel, "setText:", 0);
}

- (void)configureWithPageString:(id)a3 dateString:(id)a4 insets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v11;
  void *v12;
  double v13;
  id v14;
  uint64_t v15;
  double v16;
  id v17;
  void *v18;
  double v19;
  id v20;
  uint64_t v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  id v26;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v26 = a3;
  v11 = a4;
  -[BKTOCTableViewCell setupSelectedBackgroundNil](self, "setupSelectedBackgroundNil");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
  if (v26)
  {
    objc_msgSend(v12, "setHidden:", 0);
    if (-[BKTOCTableViewCell usesPopoverStyle](self, "usesPopoverStyle"))
    {
      *(_QWORD *)&v13 = objc_opt_class(self).n128_u64[0];
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pageNumberFontForPopover", v13));
    }
    else
    {
      *(_QWORD *)&v16 = objc_opt_class(self).n128_u64[0];
      objc_msgSend(v17, "pageNumberFontSize", v16);
      v15 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
    }
    v18 = (void *)v15;
    objc_msgSend(v12, "bkSetText:font:lineBreakMode:", v26, v15, 4);

  }
  else
  {
    objc_msgSend(v12, "setHidden:", 1);
  }
  if (objc_msgSend(v11, "length"))
  {
    if (-[BKTOCTableViewCell usesPopoverStyle](self, "usesPopoverStyle"))
    {
      *(_QWORD *)&v19 = objc_opt_class(self).n128_u64[0];
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dateFontForPopover", v19));
    }
    else
    {
      *(_QWORD *)&v22 = objc_opt_class(self).n128_u64[0];
      objc_msgSend(v23, "dateFontSize", v22);
      v21 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:"));
    }
    v24 = (void *)v21;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell dateLabel](self, "dateLabel"));
    objc_msgSend(v25, "bkSetText:font:lineBreakMode:", v11, v24, 4);

  }
  -[BKTOCTableViewCell setContentInsets:](self, "setContentInsets:", top, left, bottom, right);
  -[BKTOCAnnotationTableCell setSeparatorInset:](self, "setSeparatorInset:", top, left, bottom, right);

}

- (UILabel)dateLabel
{
  UILabel *dateLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  dateLabel = self->_dateLabel;
  if (!dateLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_dateLabel;
    self->_dateLabel = v4;

    -[UILabel setOpaque:](self->_dateLabel, "setOpaque:", 0);
    -[UILabel setNumberOfLines:](self->_dateLabel, "setNumberOfLines:", 1);
    -[UILabel setTextAlignment:](self->_dateLabel, "setTextAlignment:", 2* (-[BKTOCAnnotationTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") != (char *)&dword_0 + 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell contentView](self, "contentView"));
    objc_msgSend(v6, "addSubview:", self->_dateLabel);

    dateLabel = self->_dateLabel;
  }
  return dateLabel;
}

- (UILabel)noteLabel
{
  UILabel *noteLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  noteLabel = self->_noteLabel;
  if (!noteLabel)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_noteLabel;
    self->_noteLabel = v4;

    -[UILabel setOpaque:](self->_noteLabel, "setOpaque:", 0);
    -[UILabel setNumberOfLines:](self->_noteLabel, "setNumberOfLines:", 3);
    -[UILabel setTextAlignment:](self->_noteLabel, "setTextAlignment:", 2* (-[BKTOCAnnotationTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == (char *)&dword_0 + 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCell contentView](self, "contentView"));
    objc_msgSend(v6, "addSubview:", self->_noteLabel);

    noteLabel = self->_noteLabel;
  }
  return noteLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end
