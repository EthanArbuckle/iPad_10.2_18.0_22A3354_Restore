@implementation RelatedSectionTableViewCell

- (RelatedSectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RelatedSectionTableViewCell *v4;
  RelatedSectionTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RelatedSectionTableViewCell;
  v4 = -[RelatedSectionTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[RelatedSectionTableViewCell configureSection](v4, "configureSection");
  return v5;
}

- (void)configureSection
{
  MKVibrantLabel *v3;
  MKVibrantLabel *sectionNameLabel;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];

  v3 = (MKVibrantLabel *)objc_msgSend(objc_alloc((Class)MKVibrantLabel), "initWithStyle:", 1);
  sectionNameLabel = self->_sectionNameLabel;
  self->_sectionNameLabel = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleSubheadline));
  -[MKVibrantLabel setFont:](self->_sectionNameLabel, "setFont:", v5);

  -[MKVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_sectionNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RelatedSectionTableViewCell setSeparatorInset:](self, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  -[RelatedSectionTableViewCell _setShouldHaveFullLengthBottomSeparator:](self, "_setShouldHaveFullLengthBottomSeparator:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSectionTableViewCell contentView](self, "contentView"));
  objc_msgSend(v6, "addSubview:", self->_sectionNameLabel);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel leadingAnchor](self->_sectionNameLabel, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSectionTableViewCell contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 16.0));
  v24[0] = v20;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel trailingAnchor](self->_sectionNameLabel, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSectionTableViewCell contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v24[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel topAnchor](self->_sectionNameLabel, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSectionTableViewCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, 16.0));
  v24[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel bottomAnchor](self->_sectionNameLabel, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSectionTableViewCell contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintLessThanOrEqualToAnchor:", v14));
  v24[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

}

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

+ (id)accessibilityIdentifier
{
  objc_class *v2;
  NSString *v3;
  void *v4;
  void *v5;

  v2 = (objc_class *)objc_opt_class(a1);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v4, CFSTR("Accessibility")));

  return v5;
}

+ (double)cellHeight
{
  return 248.0;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RelatedSectionTableViewCell;
  -[RelatedSectionTableViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSectionTableViewCell sectionNameLabel](self, "sectionNameLabel"));
  objc_msgSend(v3, "setText:", 0);

  -[RelatedSectionTableViewCell setSectionName:](self, "setSectionName:", 0);
}

- (void)setSectionName:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_sectionName, a3);
  v5 = a3;
  -[MKVibrantLabel setText:](self->_sectionNameLabel, "setText:", v5);

}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (MKVibrantLabel)sectionNameLabel
{
  return self->_sectionNameLabel;
}

- (void)setSectionNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sectionNameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionNameLabel, 0);
  objc_storeStrong((id *)&self->_sectionName, 0);
}

@end
