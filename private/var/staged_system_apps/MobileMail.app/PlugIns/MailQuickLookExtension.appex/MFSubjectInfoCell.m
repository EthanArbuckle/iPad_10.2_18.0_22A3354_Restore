@implementation MFSubjectInfoCell

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("MFSubjectLabelCellIdentifier");
}

- (MFSubjectInfoCell)initWithFrame:(CGRect)a3
{
  MFSubjectInfoCell *v3;
  UILabel *v4;
  UILabel *subjectLabel;
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
  objc_super v28;
  _QWORD v29[4];

  v28.receiver = self;
  v28.super_class = (Class)MFSubjectInfoCell;
  v3 = -[MFSubjectInfoCell initWithFrame:](&v28, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    subjectLabel = v3->_subjectLabel;
    v3->_subjectLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UILabel setFont:](v3->_subjectLabel, "setFont:", v6);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_subjectLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSubjectInfoCell contentView](v3, "contentView"));
    objc_msgSend(v7, "addSubview:", v3->_subjectLabel);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFSubjectInfoCell contentView](v3, "contentView"));
    objc_msgSend(v9, "setBackgroundColor:", v8);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v3->_subjectLabel, "leadingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFSubjectInfoCell contentView](v3, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", 20.0));
    v29[0] = v22;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v3->_subjectLabel, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFSubjectInfoCell contentView](v3, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", -35.0));
    v29[1] = v19;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_subjectLabel, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFSubjectInfoCell contentView](v3, "contentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v10, 20.0));
    v29[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_subjectLabel, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFSubjectInfoCell contentView](v3, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, -20.0));
    v29[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    -[UILabel setNumberOfLines:](v3->_subjectLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_subjectLabel, "setLineBreakMode:", 0);
    -[UILabel sizeToFit](v3->_subjectLabel, "sizeToFit");
  }
  return v3;
}

- (UILabel)subjectLabel
{
  return self->_subjectLabel;
}

- (void)setSubjectLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subjectLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectLabel, 0);
}

@end
