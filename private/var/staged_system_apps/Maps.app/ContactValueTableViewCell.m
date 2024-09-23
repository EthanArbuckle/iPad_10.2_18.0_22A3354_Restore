@implementation ContactValueTableViewCell

- (ContactValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ContactValueTableViewCell *v4;
  ContactValueTableViewCell *v5;
  id v6;
  double y;
  double width;
  double height;
  UILabel *v10;
  UILabel *contactNameLabel;
  void *v12;
  UILabel *v13;
  UILabel *contactHandleLabel;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSLayoutConstraint *nameFirstBaselineToTopConstraint;
  void *v21;
  void *v22;
  uint64_t v23;
  NSLayoutConstraint *handleFirstBaselineToNameLastBaselineConstraint;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSLayoutConstraint *handleLastBaselineToBottomConstraint;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_super v54;
  _QWORD v55[7];

  v54.receiver = self;
  v54.super_class = (Class)ContactValueTableViewCell;
  v4 = -[ContactValueTableViewCell initWithStyle:reuseIdentifier:](&v54, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[ContactValueTableViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("ContactValueTableViewCell"));
    v6 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = (UILabel *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    contactNameLabel = v5->_contactNameLabel;
    v5->_contactNameLabel = v10;

    -[UILabel setAccessibilityIdentifier:](v5->_contactNameLabel, "setAccessibilityIdentifier:", CFSTR("ContactNameLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_contactNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContactValueTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v12, "addSubview:", v5->_contactNameLabel);

    v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    contactHandleLabel = v5->_contactHandleLabel;
    v5->_contactHandleLabel = v13;

    -[UILabel setAccessibilityIdentifier:](v5->_contactHandleLabel, "setAccessibilityIdentifier:", CFSTR("ContactHandleLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_contactHandleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContactValueTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v15, "addSubview:", v5->_contactHandleLabel);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_contactNameLabel, "firstBaselineAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContactValueTableViewCell contentView](v5, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 0.0));
    nameFirstBaselineToTopConstraint = v5->_nameFirstBaselineToTopConstraint;
    v5->_nameFirstBaselineToTopConstraint = (NSLayoutConstraint *)v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_contactHandleLabel, "firstBaselineAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v5->_contactNameLabel, "lastBaselineAnchor"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 0.0));
    handleFirstBaselineToNameLastBaselineConstraint = v5->_handleFirstBaselineToNameLastBaselineConstraint;
    v5->_handleFirstBaselineToNameLastBaselineConstraint = (NSLayoutConstraint *)v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v5->_contactHandleLabel, "lastBaselineAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ContactValueTableViewCell contentView](v5, "contentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 0.0));
    handleLastBaselineToBottomConstraint = v5->_handleLastBaselineToBottomConstraint;
    v5->_handleLastBaselineToBottomConstraint = (NSLayoutConstraint *)v28;

    v55[0] = v5->_nameFirstBaselineToTopConstraint;
    v55[1] = v5->_handleFirstBaselineToNameLastBaselineConstraint;
    v55[2] = v5->_handleLastBaselineToBottomConstraint;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_contactNameLabel, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[ContactValueTableViewCell contentView](v5, "contentView"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "layoutMarginsGuide"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "leadingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v50));
    v55[3] = v49;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_contactNameLabel, "trailingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[ContactValueTableViewCell contentView](v5, "contentView"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "layoutMarginsGuide"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v45));
    v55[4] = v44;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_contactHandleLabel, "leadingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[ContactValueTableViewCell contentView](v5, "contentView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "layoutMarginsGuide"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v31));
    v55[5] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_contactHandleLabel, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ContactValueTableViewCell contentView](v5, "contentView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "layoutMarginsGuide"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v36));
    v55[6] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 7));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[ContactValueTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v40, "addObserver:selector:name:object:", v5, "_contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

    -[ContactValueTableViewCell _contentSizeDidChange](v5, "_contentSizeDidChange");
  }
  return v5;
}

- (void)_contentSizeDidChange
{
  -[ContactValueTableViewCell updateConstraintConstants](self, "updateConstraintConstants");
  -[ContactValueTableViewCell updateFonts](self, "updateFonts");
}

- (void)updateConstraintConstants
{
  double v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 34.0);
  -[NSLayoutConstraint setConstant:](self->_nameFirstBaselineToTopConstraint, "setConstant:");
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 24.0);
  -[NSLayoutConstraint setConstant:](self->_handleFirstBaselineToNameLastBaselineConstraint, "setConstant:");
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 18.0);
  -[NSLayoutConstraint setConstant:](self->_handleLastBaselineToBottomConstraint, "setConstant:", -v3);

}

- (void)updateFonts
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle3));
  -[UILabel setFont:](self->_contactNameLabel, "setFont:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_contactHandleLabel, "setFont:", v4);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ContactValueTableViewCell;
  -[ContactValueTableViewCell prepareForReuse](&v4, "prepareForReuse");
  -[ContactValueTableViewCell setContactValue:](self, "setContactValue:", 0);
  -[ContactValueTableViewCell setContactHandle:](self, "setContactHandle:", 0);
  -[ContactValueTableViewCell setContactCapability:](self, "setContactCapability:", 0);
  -[UILabel setText:](self->_contactNameLabel, "setText:", &stru_1011EB268);
  -[UILabel setText:](self->_contactHandleLabel, "setText:", &stru_1011EB268);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[ContactValueTableViewCell setCapabilityColor:](self, "setCapabilityColor:", v3);

}

- (void)setContactHandle:(id)a3
{
  objc_storeStrong((id *)&self->_contactHandle, a3);
  -[ContactValueTableViewCell updateContactLabel](self, "updateContactLabel");
}

- (void)setContactCapability:(id)a3
{
  objc_storeStrong((id *)&self->_contactCapability, a3);
  -[ContactValueTableViewCell updateContactLabel](self, "updateContactLabel");
}

- (void)updateContactLabel
{
  id v3;

  if (-[NSString length](self->_contactCapability, "length"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ • %@"), self->_contactHandle, self->_contactCapability));
    -[UILabel setText:](self->_contactHandleLabel, "setText:", v3);

  }
  else
  {
    -[UILabel setText:](self->_contactHandleLabel, "setText:", self->_contactHandle);
  }
}

- (void)setCapabilityColor:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_capabilityColor, a3);
  v5 = a3;
  -[UILabel setTextColor:](self->_contactHandleLabel, "setTextColor:", v5);
  -[UILabel setTextColor:](self->_contactNameLabel, "setTextColor:", v5);

}

- (MSPSharedTripContact)contactValue
{
  return self->_contactValue;
}

- (void)setContactValue:(id)a3
{
  objc_storeStrong((id *)&self->_contactValue, a3);
}

- (UILabel)contactNameLabel
{
  return self->_contactNameLabel;
}

- (void)setContactNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_contactNameLabel, a3);
}

- (NSString)contactHandle
{
  return self->_contactHandle;
}

- (NSString)contactCapability
{
  return self->_contactCapability;
}

- (UIColor)capabilityColor
{
  return self->_capabilityColor;
}

- (NSLayoutConstraint)nameFirstBaselineToTopConstraint
{
  return self->_nameFirstBaselineToTopConstraint;
}

- (void)setNameFirstBaselineToTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_nameFirstBaselineToTopConstraint, a3);
}

- (NSLayoutConstraint)handleFirstBaselineToNameLastBaselineConstraint
{
  return self->_handleFirstBaselineToNameLastBaselineConstraint;
}

- (void)setHandleFirstBaselineToNameLastBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_handleFirstBaselineToNameLastBaselineConstraint, a3);
}

- (NSLayoutConstraint)handleLastBaselineToBottomConstraint
{
  return self->_handleLastBaselineToBottomConstraint;
}

- (void)setHandleLastBaselineToBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_handleLastBaselineToBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleLastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_handleFirstBaselineToNameLastBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_nameFirstBaselineToTopConstraint, 0);
  objc_storeStrong((id *)&self->_capabilityColor, 0);
  objc_storeStrong((id *)&self->_contactCapability, 0);
  objc_storeStrong((id *)&self->_contactHandle, 0);
  objc_storeStrong((id *)&self->_contactNameLabel, 0);
  objc_storeStrong((id *)&self->_contactValue, 0);
  objc_storeStrong((id *)&self->_contactHandleLabel, 0);
}

@end
