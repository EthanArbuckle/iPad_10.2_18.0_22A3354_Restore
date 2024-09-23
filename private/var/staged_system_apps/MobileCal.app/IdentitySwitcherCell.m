@implementation IdentitySwitcherCell

+ (double)cellHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleHeadline, 0x8000, 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v2, 0.0));
  objc_msgSend(v3, "_scaledValueForValue:", 60.0);
  v5 = v4;

  return v5;
}

+ (id)cellForSource:(id)a3 withModel:(id)a4 inTableView:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  IdentitySwitcherCell *v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CalContactsProvider defaultProvider](CalContactsProvider, "defaultProvider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "unifiedMeContact"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CalContactsProvider defaultProvider](CalContactsProvider, "defaultProvider"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "myFullName"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[ContactsUtils defaultContactKeysToFetch](ContactsUtils, "defaultContactKeysToFetch"));
      v11 = (id)objc_claimAutoreleasedReturnValue(+[ContactsUtils contactForContact:keysToFetch:](ContactsUtils, "contactForContact:keysToFetch:", v20, v22));

      if (v13)
      {
        v17 = 0;
        v15 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      v11 = objc_alloc_init((Class)CNContact);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("My Calendar"), &stru_1001B67C0, 0));
    v15 = 0;
    goto LABEL_11;
  }
  v10 = contactForSource(v7);
  v11 = (id)objc_claimAutoreleasedReturnValue(v10);
  v12 = CUIKDisplayedTitleForSource(v7, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "eventNotificationReferencesForIdentity:", v7));
  v15 = objc_msgSend(v14, "count");

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "CalEmailAddresses"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));

  if (!v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "CalPhoneNumbers"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));

  }
  if (objc_msgSend(v17, "hasSuffix:", CFSTR("@do_not_reply")))
  {
LABEL_11:

    v17 = 0;
  }
LABEL_12:
  v23 = (IdentitySwitcherCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithIdentifier:", CFSTR("identityCell")));
  if (!v23)
    v23 = -[IdentitySwitcherCell initWithStyle:reuseIdentifier:]([IdentitySwitcherCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("identityCell"));
  -[IdentitySwitcherCell configureWithContact:displayName:address:notificationCount:](v23, "configureWithContact:displayName:address:notificationCount:", v11, v13, v17, v15);

  return v23;
}

- (void)prepareForReuse
{
  NSMutableArray *constraints;
  EKUILabeledAvatarView *avatarView;
  UILabel *nameLabel;
  UILabel *addressLabel;
  UILabel *notificationCountLabel;
  objc_super v8;

  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
  -[EKUILabeledAvatarView removeFromSuperview](self->_avatarView, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_nameLabel, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_addressLabel, "removeFromSuperview");
  -[UILabel removeFromSuperview](self->_notificationCountLabel, "removeFromSuperview");
  constraints = self->_constraints;
  self->_constraints = 0;

  avatarView = self->_avatarView;
  self->_avatarView = 0;

  nameLabel = self->_nameLabel;
  self->_nameLabel = 0;

  addressLabel = self->_addressLabel;
  self->_addressLabel = 0;

  notificationCountLabel = self->_notificationCountLabel;
  self->_notificationCountLabel = 0;

  v8.receiver = self;
  v8.super_class = (Class)IdentitySwitcherCell;
  -[IdentitySwitcherCell prepareForReuse](&v8, "prepareForReuse");
}

- (void)configureWithContact:(id)a3 displayName:(id)a4 address:(id)a5 notificationCount:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSMutableArray *v13;
  NSMutableArray *constraints;
  EKUILabeledAvatarView *v15;
  EKUILabeledAvatarView *avatarView;
  void *v17;
  UILabel *v18;
  UILabel *nameLabel;
  void *v20;
  void *v21;
  void *v22;
  UILabel *addressLabel;
  UILabel *v24;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  void *v29;
  UILabel *notificationCountLabel;
  UILabel *v31;
  UILabel *v32;
  void *v33;
  double v34;
  UILabel *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  NSMutableArray *v50;
  EKUILabeledAvatarView *v51;
  void *v52;
  void *v53;
  EKUILabeledAvatarView *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  UILabel *v60;
  UILabel *v61;
  UILabel *v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  UILabel *v69;
  void *v70;
  void *v71;
  void *v72;
  UILabel *v73;
  NSMutableArray *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  UILabel *v79;
  NSMutableArray *v80;
  void *v81;
  void *v82;
  UILabel *v83;
  void *v84;
  void *v85;
  void *v86;
  NSMutableArray *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSMutableArray *v93;
  UILabel *v94;
  void *v95;
  void *v96;
  void *v97;
  _QWORD v98[2];
  _QWORD v99[3];
  _QWORD v100[3];
  _QWORD v101[4];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (self->_constraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  constraints = self->_constraints;
  self->_constraints = v13;

  if (v10 && !self->_avatarView)
  {
    v15 = (EKUILabeledAvatarView *)objc_msgSend(objc_alloc((Class)EKUILabeledAvatarView), "initWithPlacement:options:", 0, 0);
    avatarView = self->_avatarView;
    self->_avatarView = v15;

    -[EKUILabeledAvatarView setTranslatesAutoresizingMaskIntoConstraints:](self->_avatarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherCell contentView](self, "contentView"));
    objc_msgSend(v17, "addSubview:", self->_avatarView);

  }
  if (v11 && !self->_nameLabel)
  {
    v18 = (UILabel *)objc_alloc_init((Class)UILabel);
    nameLabel = self->_nameLabel;
    self->_nameLabel = v18;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleHeadline, 0x8000, 0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v20, 0.0));
    -[UILabel setFont:](self->_nameLabel, "setFont:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherCell contentView](self, "contentView"));
    objc_msgSend(v22, "addSubview:", self->_nameLabel);

  }
  addressLabel = self->_addressLabel;
  v97 = v12;
  if (v12 && !addressLabel)
  {
    v24 = (UILabel *)objc_alloc_init((Class)UILabel);
    v25 = self->_addressLabel;
    self->_addressLabel = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](self->_addressLabel, "setTextColor:", v26);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_addressLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v27 = (UILabel *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleSubhead, 0x8000, 0));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v27, 0.0));
    -[UILabel setFont:](self->_addressLabel, "setFont:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherCell contentView](self, "contentView"));
    objc_msgSend(v29, "addSubview:", self->_addressLabel);

LABEL_15:
    goto LABEL_16;
  }
  if (!v12 && addressLabel)
  {
    -[UILabel removeFromSuperview](addressLabel, "removeFromSuperview");
    v27 = self->_addressLabel;
    self->_addressLabel = 0;
    goto LABEL_15;
  }
LABEL_16:
  notificationCountLabel = self->_notificationCountLabel;
  if (a6 && !notificationCountLabel)
  {
    v31 = (UILabel *)objc_alloc_init((Class)UILabel);
    v32 = self->_notificationCountLabel;
    self->_notificationCountLabel = v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    -[UILabel setTextColor:](self->_notificationCountLabel, "setTextColor:", v33);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_notificationCountLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v34) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](self->_notificationCountLabel, "setContentHuggingPriority:forAxis:", 0, v34);
    v35 = (UILabel *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleBody, 0x8000, 0));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v35, 0.0));
    -[UILabel setFont:](self->_notificationCountLabel, "setFont:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherCell contentView](self, "contentView"));
    objc_msgSend(v37, "addSubview:", self->_notificationCountLabel);

LABEL_22:
    goto LABEL_23;
  }
  if (!a6 && notificationCountLabel)
  {
    -[UILabel removeFromSuperview](notificationCountLabel, "removeFromSuperview");
    v35 = self->_notificationCountLabel;
    self->_notificationCountLabel = 0;
    goto LABEL_22;
  }
LABEL_23:
  -[EKUILabeledAvatarView setContact:](self->_avatarView, "setContact:", v10);
  -[UILabel setText:](self->_nameLabel, "setText:", v11);
  if (v12)
    -[UILabel setText:](self->_addressLabel, "setText:", v12);
  v95 = v11;
  v96 = v10;
  if (a6)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a6));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v38, 1));
    -[UILabel setText:](self->_notificationCountLabel, "setText:", v39);

  }
  -[IdentitySwitcherCell scaledValueForValue:](self, "scaledValueForValue:", 37.0);
  v41 = v40;
  -[IdentitySwitcherCell scaledValueForValue:](self, "scaledValueForValue:", 16.0);
  v43 = v42;
  -[IdentitySwitcherCell scaledValueForValue:](self, "scaledValueForValue:", 12.0);
  v45 = v44;
  -[IdentitySwitcherCell scaledValueForValue:](self, "scaledValueForValue:", 2.0);
  v47 = v46;
  -[IdentitySwitcherCell scaledValueForValue:](self, "scaledValueForValue:", 60.0);
  v49 = v48;
  v50 = self->_constraints;
  v51 = self->_avatarView;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherCell contentView](self, "contentView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v51, 5, 0, v52, 5, 1.0, v43));
  v101[0] = v53;
  v54 = self->_avatarView;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherCell contentView](self, "contentView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v54, 10, 0, v55, 10, 1.0, 0.0));
  v101[1] = v56;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_avatarView, 7, 0, 0, 0, 1.0, v41));
  v101[2] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_avatarView, 8, 0, 0, 0, 1.0, v41));
  v101[3] = v58;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v101, 4));
  -[NSMutableArray addObjectsFromArray:](v50, "addObjectsFromArray:", v59);

  v60 = self->_notificationCountLabel;
  if (v60)
    v61 = v60;
  else
    v61 = (UILabel *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherCell contentView](self, "contentView"));
  v62 = v61;
  if (self->_notificationCountLabel)
    v63 = 5;
  else
    v63 = 18;
  if (self->_notificationCountLabel)
    v64 = -v43;
  else
    v64 = 0.0;
  v65 = 3;
  if (!self->_addressLabel)
    v65 = 10;
  v92 = v65;
  v93 = self->_constraints;
  v94 = v61;
  if (self->_addressLabel)
    v66 = 15;
  else
    v66 = 10;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_nameLabel, 5, 0, self->_avatarView, 6, 1.0, v45, 8));
  v100[0] = v67;
  v91 = v63;
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_nameLabel, 6, 0, v62, v63, 1.0, v64));
  v100[1] = v68;
  v69 = self->_nameLabel;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherCell contentView](self, "contentView"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v69, v92, 0, v70, v66, 1.0, 0.0));
  v100[2] = v71;
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v100, 3));
  -[NSMutableArray addObjectsFromArray:](v93, "addObjectsFromArray:", v72);

  v73 = self->_addressLabel;
  if (v73)
  {
    v74 = self->_constraints;
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v73, 5, 0, *(Class *)((char *)&self->super.super.super.super.isa + v90), 6, 1.0, v45));
    v99[0] = v75;
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_addressLabel, 6, 0, v94, v91, 1.0, v64));
    v99[1] = v76;
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_addressLabel, 3, 0, self->_nameLabel, 4, 1.0, v47));
    v99[2] = v77;
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v99, 3));
    -[NSMutableArray addObjectsFromArray:](v74, "addObjectsFromArray:", v78);

  }
  v79 = self->_notificationCountLabel;
  if (v79)
  {
    v80 = self->_constraints;
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherCell contentView](self, "contentView"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v79, 6, 0, v81, 18, 1.0, 0.0));
    v98[0] = v82;
    v83 = self->_notificationCountLabel;
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherCell contentView](self, "contentView"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v83, 10, 0, v84, 10, 1.0, 0.0));
    v98[1] = v85;
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v98, 2));
    -[NSMutableArray addObjectsFromArray:](v80, "addObjectsFromArray:", v86);

  }
  v87 = self->_constraints;
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[IdentitySwitcherCell contentView](self, "contentView"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v88, 8, 1, 0, 0, 1.0, v49));
  -[NSMutableArray addObject:](v87, "addObject:", v89);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
}

- (double)scaledValueForValue:(double)a3
{
  UILabel *nameLabel;
  void *v5;
  double v6;

  nameLabel = self->_nameLabel;
  if (nameLabel)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](nameLabel, "font"));
    objc_msgSend(v5, "_scaledValueForValue:", a3);
    a3 = v6;

  }
  return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_notificationCountLabel, 0);
  objc_storeStrong((id *)&self->_addressLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
