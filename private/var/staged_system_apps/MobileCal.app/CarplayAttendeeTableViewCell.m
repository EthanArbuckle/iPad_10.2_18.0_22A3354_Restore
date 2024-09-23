@implementation CarplayAttendeeTableViewCell

- (CarplayAttendeeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CarplayAttendeeTableViewCell *v4;
  EKUILabeledAvatarView *v5;
  EKUILabeledAvatarView *avatar;
  void *v7;
  UILabel *v8;
  UILabel *attendeeRelationship;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *attendeeName;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CarplayAttendeeTableViewCell;
  v4 = -[CarplayAttendeeTableViewCell initWithStyle:reuseIdentifier:](&v23, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (EKUILabeledAvatarView *)objc_msgSend(objc_alloc((Class)EKUILabeledAvatarView), "initWithPlacement:options:", 0, 0);
    avatar = v4->_avatar;
    v4->_avatar = v5;

    -[EKUILabeledAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v4->_avatar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayAttendeeTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v7, "addSubview:", v4->_avatar);

    v8 = objc_opt_new(UILabel);
    attendeeRelationship = v4->_attendeeRelationship;
    v4->_attendeeRelationship = v8;

    -[UILabel setNumberOfLines:](v4->_attendeeRelationship, "setNumberOfLines:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
    -[UILabel setTextColor:](v4->_attendeeRelationship, "setTextColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusPrimaryColor](UIColor, "_carSystemFocusPrimaryColor"));
    -[UILabel setHighlightedTextColor:](v4->_attendeeRelationship, "setHighlightedTextColor:", v11);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_attendeeRelationship, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayAttendeeTableViewCell traitCollection](v4, "traitCollection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleCaption1, v12));
    -[UILabel setFont:](v4->_attendeeRelationship, "setFont:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayAttendeeTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v14, "addSubview:", v4->_attendeeRelationship);

    v15 = objc_opt_new(UILabel);
    attendeeName = v4->_attendeeName;
    v4->_attendeeName = v15;

    -[UILabel setNumberOfLines:](v4->_attendeeName, "setNumberOfLines:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_attendeeName, "setTextColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    -[UILabel setHighlightedTextColor:](v4->_attendeeName, "setHighlightedTextColor:", v18);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_attendeeName, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayAttendeeTableViewCell traitCollection](v4, "traitCollection"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleCallout, v19));
    -[UILabel setFont:](v4->_attendeeName, "setFont:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayAttendeeTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v21, "addSubview:", v4->_attendeeName);

    -[CarplayAttendeeTableViewCell setAccessoryType:](v4, "setAccessoryType:", 1);
    -[CarplayAttendeeTableViewCell _createAndActivateConstraints](v4, "_createAndActivateConstraints");
  }
  return v4;
}

- (void)_createAndActivateConstraints
{
  void *v3;
  void *v4;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  _QWORD v40[11];

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[EKUILabeledAvatarView leadingAnchor](self->_avatar, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayAttendeeTableViewCell contentView](self, "contentView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 8.0));
  v40[0] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[EKUILabeledAvatarView widthAnchor](self->_avatar, "widthAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToConstant:", 30.0));
  v40[1] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[EKUILabeledAvatarView heightAnchor](self->_avatar, "heightAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToConstant:", 30.0));
  v40[2] = v32;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[EKUILabeledAvatarView centerYAnchor](self->_avatar, "centerYAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayAttendeeTableViewCell contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "centerYAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v40[3] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_attendeeName, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[EKUILabeledAvatarView trailingAnchor](self->_avatar, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 8.0));
  v40[4] = v25;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_attendeeName, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayAttendeeTableViewCell contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v40[5] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_attendeeRelationship, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[EKUILabeledAvatarView trailingAnchor](self->_avatar, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, 8.0));
  v40[6] = v18;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_attendeeRelationship, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayAttendeeTableViewCell contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v40[7] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_attendeeName, "firstBaselineAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_attendeeRelationship, "lastBaselineAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v3, 18.0));
  v40[8] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_attendeeRelationship, "firstBaselineAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayAttendeeTableViewCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, 18.0));
  v40[9] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayAttendeeTableViewCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "heightAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintGreaterThanOrEqualToConstant:", 44.0));
  v40[10] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 11));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)updateWithEvent:(id)a3
{
  EKEvent **p_event;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNContact *v14;
  CNContact *contact;
  EKUILabeledAvatarView *avatar;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  CNContact *v24;

  p_event = &self->_event;
  objc_storeStrong((id *)&self->_event, a3);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EKEvent organizer](*p_event, "organizer"));
  v8 = DisplayAddressForIdentity();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ContactsUtils defaultContactKeysToFetch](ContactsUtils, "defaultContactKeysToFetch"));
  v14 = (CNContact *)objc_claimAutoreleasedReturnValue(+[ContactsUtils contactForAddress:fullName:firstName:lastName:keysToFetch:](ContactsUtils, "contactForAddress:fullName:firstName:lastName:keysToFetch:", v9, v10, v11, v12, v13));
  contact = self->_contact;
  self->_contact = v14;

  avatar = self->_avatar;
  v24 = self->_contact;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  -[EKUILabeledAvatarView updateWithContacts:](avatar, "updateWithContacts:", v17);

  *(_QWORD *)&v18 = objc_opt_class(self).n128_u64[0];
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v19, v18));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Invitation from"), &stru_1001B67C0, 0));
  -[UILabel setText:](self->_attendeeRelationship, "setText:", v21);

  v22 = objc_msgSend((id)EKWeakLinkClass(CFSTR("CNContactFormatter"), 4), "stringFromContact:style:", self->_contact, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[UILabel setText:](self->_attendeeName, "setText:", v23);

}

- (void)cellWasTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v3 = kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Attendee cell was tapped", v6, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNStarkCardViewController starkCardControllerForCalendarEventWithContact:](CNStarkCardViewController, "starkCardControllerForCalendarEventWithContact:", self->_contact));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayDetailTableViewCell delegate](self, "delegate"));
  objc_msgSend(v5, "pushViewController:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendeeName, 0);
  objc_storeStrong((id *)&self->_attendeeRelationship, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
