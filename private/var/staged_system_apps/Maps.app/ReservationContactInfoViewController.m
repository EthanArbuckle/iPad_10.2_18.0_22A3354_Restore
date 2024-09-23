@implementation ReservationContactInfoViewController

- (ReservationContactInfoViewController)initWithNameComponents:(id)a3 emailAddress:(id)a4 phoneNumber:(id)a5 guestDisplayPreferences:(id)a6 requirements:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  ReservationContactInfoViewController *v18;
  void *v19;
  void *v20;
  INRestaurantGuestDisplayPreferences *v21;
  INRestaurantGuestDisplayPreferences *guestDisplayPreferences;
  NSString *v23;
  NSString *initializedEmailAddress;
  NSString *v25;
  NSString *initializedPhoneNumber;
  objc_super v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)ReservationContactInfoViewController;
  v18 = -[ReservationContactInfoViewController initWithStyle:](&v28, "initWithStyle:", 1);
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("reservation_enter_info_key"), CFSTR("localized string not found"), 0));
    -[ReservationContactInfoViewController setTitle:](v18, "setTitle:", v20);

    v21 = (INRestaurantGuestDisplayPreferences *)objc_msgSend(v16, "copy");
    guestDisplayPreferences = v18->_guestDisplayPreferences;
    v18->_guestDisplayPreferences = v21;

    objc_storeStrong((id *)&v18->_requirements, a7);
    -[ReservationContactInfoViewController updateFooterText](v18, "updateFooterText");
    v23 = (NSString *)objc_msgSend(v14, "copy");
    initializedEmailAddress = v18->_initializedEmailAddress;
    v18->_initializedEmailAddress = v23;

    v25 = (NSString *)objc_msgSend(v15, "copy");
    initializedPhoneNumber = v18->_initializedPhoneNumber;
    v18->_initializedPhoneNumber = v25;

    objc_storeStrong((id *)&v18->_initializedNameComponents, a3);
  }

  return v18;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ReservationContactInfoViewController;
  -[ReservationContactInfoViewController viewDidLoad](&v3, "viewDidLoad");
  -[ReservationContactInfoViewController configureContactItems](self, "configureContactItems");
  -[ReservationContactInfoViewController configureTableView](self, "configureTableView");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ReservationContactInfoViewController;
  -[ReservationContactInfoViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController contactDelegate](self, "contactDelegate"));
  objc_msgSend(v4, "reservationContactInfoViewControllerDidSelectDone:", self);

}

- (void)configureContactItems
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController guestDisplayPreferences](self, "guestDisplayPreferences"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController requirements](self, "requirements"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController itemsForGuestDisplayPreferences:requirements:](self, "itemsForGuestDisplayPreferences:requirements:", v5, v3));
  -[ReservationContactInfoViewController setContactItems:](self, "setContactItems:", v4);

}

- (id)itemsForGuestDisplayPreferences:(id)a3 requirements:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  ContactCellItem *v11;
  ContactCellItem *v12;
  void *v13;
  ContactCellItem *v14;
  ContactCellItem *v15;
  void *v16;
  _QWORD v18[2];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 4));
  if (objc_msgSend(v5, "nameFieldShouldBeDisplayed"))
  {
    if ((objc_msgSend(v5, "nameFieldFirstNameOptional") & 1) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(v6, "nameRequired") ^ 1;
    if ((objc_msgSend(v5, "nameFieldLastNameOptional") & 1) != 0)
      v9 = 1;
    else
      v9 = objc_msgSend(v6, "nameRequired") ^ 1;
    if (objc_msgSend(v6, "nameRequired") && objc_msgSend(v5, "nameFieldFirstNameOptional"))
    {
      v10 = objc_msgSend(v5, "nameFieldLastNameOptional");
      v9 &= ~v10;
      v8 |= v10;
    }
    v11 = -[ContactCellItem initWithType:editable:required:]([ContactCellItem alloc], "initWithType:editable:required:", 0, objc_msgSend(v5, "nameEditable"), v8 ^ 1);
    v12 = -[ContactCellItem initWithType:editable:required:]([ContactCellItem alloc], "initWithType:editable:required:", 1, objc_msgSend(v5, "nameEditable"), v9 ^ 1);
    v18[0] = v11;
    v18[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
    objc_msgSend(v7, "addObjectsFromArray:", v13);

  }
  if (objc_msgSend(v5, "phoneNumberFieldShouldBeDisplayed"))
  {
    v14 = -[ContactCellItem initWithType:editable:required:]([ContactCellItem alloc], "initWithType:editable:required:", 3, objc_msgSend(v5, "phoneNumberEditable"), objc_msgSend(v6, "phoneNumberRequired"));
    objc_msgSend(v7, "addObject:", v14);

  }
  if (objc_msgSend(v5, "emailAddressFieldShouldBeDisplayed"))
  {
    v15 = -[ContactCellItem initWithType:editable:required:]([ContactCellItem alloc], "initWithType:editable:required:", 2, objc_msgSend(v5, "emailAddressEditable"), objc_msgSend(v6, "emailAddressRequired"));
    objc_msgSend(v7, "addObject:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v7));

  return v16;
}

- (void)configureTableView
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setTableFooterView:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController tableView](self, "tableView"));
  v6 = objc_opt_class(ReservationInputCell);
  v7 = (objc_class *)objc_opt_class(ReservationInputCell);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v6, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setRowHeight:", UITableViewAutomaticDimension);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController tableView](self, "tableView"));
  objc_msgSend(v11, "setScrollEnabled:", 1);

}

- (void)doneButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController contactDelegate](self, "contactDelegate", a3));
  objc_msgSend(v4, "reservationContactInfoViewControllerDidSelectDone:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ReservationContactInfoViewController;
  -[ReservationContactInfoViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController contactItems](self, "contactItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController inputCellForType:](self, "inputCellForType:", objc_msgSend(v5, "type")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textField"));
  objc_msgSend(v7, "becomeFirstResponder");

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", a4));
  v4 = objc_opt_class(ReservationInputCell);
  if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textField"));
    objc_msgSend(v5, "becomeFirstResponder");

  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController contactItems](self, "contactItems", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class(ReservationInputCell);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v10));

  if (((unint64_t)objc_msgSend(v6, "row") & 0x8000000000000000) == 0)
  {
    v12 = objc_msgSend(v6, "row");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController contactItems](self, "contactItems"));
    v14 = objc_msgSend(v13, "count");

    if (v12 < v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController contactItems](self, "contactItems"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

      -[ReservationContactInfoViewController configureCell:withItem:](self, "configureCell:withItem:", v11, v16);
      -[ReservationContactInfoViewController syncStateForInputCell:type:](self, "syncStateForInputCell:type:", v11, objc_msgSend(v16, "type"));

    }
  }

  return v11;
}

- (void)configureCell:(id)a3 withItem:(id)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "required");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  if (v7)
    v10 = CFSTR("reservation_required_key");
  else
    v10 = CFSTR("reservation_optional_key");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));
  objc_msgSend(v19, "setPlaceholderText:", v11);

  v12 = objc_msgSend(v6, "editable");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "textField"));
  objc_msgSend(v13, "setEnabled:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "textField"));
  if ((objc_msgSend(v14, "isEnabled") & 1) != 0)
    v15 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  else
    v15 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v16 = (void *)v15;
  objc_msgSend(v19, "setDetailTextColor:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController titleStringForContactCellType:](self, "titleStringForContactCellType:", objc_msgSend(v6, "type")));
  objc_msgSend(v19, "setTitleText:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController textFieldTextForContactCellType:](self, "textFieldTextForContactCellType:", objc_msgSend(v6, "type")));
  objc_msgSend(v19, "setText:", v18);

  objc_msgSend(v19, "setType:", -[ReservationContactInfoViewController inputCellTypeForContactCellType:](self, "inputCellTypeForContactCellType:", objc_msgSend(v6, "type")));
  objc_msgSend(v19, "setRequired:", objc_msgSend(v6, "required"));
  objc_msgSend(v19, "setSelectionStyle:", 0);

}

- (id)textFieldTextForContactCellType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  uint64_t v25;

  switch(a3)
  {
    case 0uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController initializedNameComponents](self, "initializedNameComponents"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "givenName"));

      if (objc_msgSend(v5, "length"))
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController firstNameCell](self, "firstNameCell"));

        if (!v6)
          goto LABEL_22;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController firstNameCell](self, "firstNameCell"));

      if (!v7)
        goto LABEL_21;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController firstNameCell](self, "firstNameCell"));
      goto LABEL_10;
    case 1uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController initializedNameComponents](self, "initializedNameComponents"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "familyName"));

      if (objc_msgSend(v5, "length"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController lastNameCell](self, "lastNameCell"));

        if (!v10)
        {
LABEL_22:
          v23 = v5;
          goto LABEL_23;
        }
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController lastNameCell](self, "lastNameCell"));

      if (v11)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController lastNameCell](self, "lastNameCell"));
LABEL_10:
        v12 = v8;
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));

      }
      else
      {
LABEL_21:
        v13 = &stru_1011EB268;
      }
      goto LABEL_24;
    case 2uLL:
      v14 = objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController initializedEmailAddress](self, "initializedEmailAddress"));
      if (v14)
      {
        v15 = (void *)v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController emailCell](self, "emailCell"));

        if (!v16)
        {
          v25 = objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController initializedEmailAddress](self, "initializedEmailAddress"));
          goto LABEL_28;
        }
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController emailCell](self, "emailCell"));

      if (!v17)
        goto LABEL_20;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController emailCell](self, "emailCell"));
      goto LABEL_19;
    case 3uLL:
      v19 = objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController initializedPhoneNumber](self, "initializedPhoneNumber"));
      if (v19
        && (v20 = (void *)v19,
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController phoneNumberCell](self, "phoneNumberCell")),
            v21,
            v20,
            !v21))
      {
        v25 = objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController initializedPhoneNumber](self, "initializedPhoneNumber"));
LABEL_28:
        v13 = (__CFString *)v25;
      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController phoneNumberCell](self, "phoneNumberCell"));

        if (v22)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController phoneNumberCell](self, "phoneNumberCell"));
LABEL_19:
          v5 = v18;
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "text"));
LABEL_23:
          v13 = v23;
LABEL_24:

        }
        else
        {
LABEL_20:
          v13 = &stru_1011EB268;
        }
      }
      return v13;
    default:
      goto LABEL_20;
  }
}

- (int64_t)inputCellTypeForContactCellType:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 2;
  else
    return qword_100E34F88[a3 - 1];
}

- (id)titleStringForContactCellType:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  switch(a3)
  {
    case 0uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("reservation_name_key_given");
      goto LABEL_7;
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("reservation_name_key_last");
      goto LABEL_7;
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("reservation_email_key");
      goto LABEL_7;
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("reservation_phone_key");
LABEL_7:
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

      break;
    default:
      v6 = &stru_1011EB268;
      break;
  }
  return v6;
}

- (void)syncStateForInputCell:(id)a3 type:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0uLL:
      -[ReservationContactInfoViewController setFirstNameCell:](self, "setFirstNameCell:", v6);
      goto LABEL_6;
    case 1uLL:
      -[ReservationContactInfoViewController setLastNameCell:](self, "setLastNameCell:", v6);
      goto LABEL_6;
    case 2uLL:
      -[ReservationContactInfoViewController setEmailCell:](self, "setEmailCell:", v6);
      goto LABEL_6;
    case 3uLL:
      -[ReservationContactInfoViewController setPhoneNumberCell:](self, "setPhoneNumberCell:", v6);
LABEL_6:
      v6 = v7;
      break;
    default:
      break;
  }

}

- (id)inputCellForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController firstNameCell](self, "firstNameCell", v3, v4));
      break;
    case 1uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController lastNameCell](self, "lastNameCell", v3, v4));
      break;
    case 2uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController emailCell](self, "emailCell", v3, v4));
      break;
    case 3uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController phoneNumberCell](self, "phoneNumberCell", v3, v4));
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (void)updateFooterText
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController requirements](self, "requirements"));
  v3 = objc_msgSend(v8, "nameRequired");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController requirements](self, "requirements"));
  v5 = objc_msgSend(v4, "phoneNumberRequired");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController requirements](self, "requirements"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController stringForNameMissing:phoneNumberMissing:emailAddressMissing:](self, "stringForNameMissing:phoneNumberMissing:emailAddressMissing:", v3, v5, objc_msgSend(v6, "emailAddressRequired")));
  -[ReservationContactInfoViewController setFooterText:](self, "setFooterText:", v7);

}

- (id)stringForNameMissing:(BOOL)a3 phoneNumberMissing:(BOOL)a4 emailAddressMissing:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  __CFString *v12;

  v5 = !a3 || !a4;
  v6 = !a5;
  if (!v5 && !v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("reservation_name_email_phone_missing_key");
LABEL_17:
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), 0));

    return v12;
  }
  if (!v5 && !a5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("reservation_name_phone_missing_key");
    goto LABEL_17;
  }
  v10 = !a3 || a4;
  if (!v10 && !v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("reservation_name_email_missing_key");
    goto LABEL_17;
  }
  v11 = !a4 || a3;
  if (!v11 && !v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("reservation_phone_email_missing_key");
    goto LABEL_17;
  }
  if (!a3 && !a4 && !v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("reservation_email_missing_key");
    goto LABEL_17;
  }
  if (!v11 && !a5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("reservation_phone_missing_key");
    goto LABEL_17;
  }
  if (!v10 && !a5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("reservation_name_missing_key");
    goto LABEL_17;
  }
  v12 = &stru_1011EB268;
  return v12;
}

- (NSPersonNameComponents)nameComponents
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController guestDisplayPreferences](self, "guestDisplayPreferences"));
  v4 = objc_msgSend(v3, "nameFieldShouldBeDisplayed");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController initializedNameComponents](self, "initializedNameComponents"));
  v6 = v5;
  if (v4)
  {

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController initializedNameComponents](self, "initializedNameComponents"));
      v6 = objc_msgSend(v7, "copy");

    }
    else
    {
      v6 = objc_alloc_init((Class)NSPersonNameComponents);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController firstNameCell](self, "firstNameCell"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
    objc_msgSend(v6, "setGivenName:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController lastNameCell](self, "lastNameCell"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
    objc_msgSend(v6, "setFamilyName:", v11);

  }
  return (NSPersonNameComponents *)v6;
}

- (NSString)emailAddress
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController guestDisplayPreferences](self, "guestDisplayPreferences"));
  if ((objc_msgSend(v3, "emailAddressFieldShouldBeDisplayed") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController emailCell](self, "emailCell"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController initializedEmailAddress](self, "initializedEmailAddress"));
  }

  return (NSString *)v5;
}

- (NSString)phoneNumber
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController guestDisplayPreferences](self, "guestDisplayPreferences"));
  if ((objc_msgSend(v3, "phoneNumberFieldShouldBeDisplayed") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController phoneNumberCell](self, "phoneNumberCell"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationContactInfoViewController initializedPhoneNumber](self, "initializedPhoneNumber"));
  }

  return (NSString *)v5;
}

- (ReservationContactInfoViewControllerDelegate)contactDelegate
{
  return (ReservationContactInfoViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_contactDelegate);
}

- (void)setContactDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contactDelegate, a3);
}

- (ReservationInputCell)firstNameCell
{
  return self->_firstNameCell;
}

- (void)setFirstNameCell:(id)a3
{
  objc_storeStrong((id *)&self->_firstNameCell, a3);
}

- (ReservationInputCell)lastNameCell
{
  return self->_lastNameCell;
}

- (void)setLastNameCell:(id)a3
{
  objc_storeStrong((id *)&self->_lastNameCell, a3);
}

- (ReservationInputCell)phoneNumberCell
{
  return self->_phoneNumberCell;
}

- (void)setPhoneNumberCell:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumberCell, a3);
}

- (ReservationInputCell)emailCell
{
  return self->_emailCell;
}

- (void)setEmailCell:(id)a3
{
  objc_storeStrong((id *)&self->_emailCell, a3);
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSPersonNameComponents)initializedNameComponents
{
  return self->_initializedNameComponents;
}

- (void)setInitializedNameComponents:(id)a3
{
  objc_storeStrong((id *)&self->_initializedNameComponents, a3);
}

- (NSString)initializedPhoneNumber
{
  return self->_initializedPhoneNumber;
}

- (void)setInitializedPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_initializedPhoneNumber, a3);
}

- (NSString)initializedEmailAddress
{
  return self->_initializedEmailAddress;
}

- (void)setInitializedEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_initializedEmailAddress, a3);
}

- (NSArray)contactItems
{
  return self->_contactItems;
}

- (void)setContactItems:(id)a3
{
  objc_storeStrong((id *)&self->_contactItems, a3);
}

- (INRestaurantGuestDisplayPreferences)guestDisplayPreferences
{
  return self->_guestDisplayPreferences;
}

- (void)setGuestDisplayPreferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (ContactRequirements)requirements
{
  return self->_requirements;
}

- (void)setRequirements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirements, 0);
  objc_storeStrong((id *)&self->_guestDisplayPreferences, 0);
  objc_storeStrong((id *)&self->_contactItems, 0);
  objc_storeStrong((id *)&self->_initializedEmailAddress, 0);
  objc_storeStrong((id *)&self->_initializedPhoneNumber, 0);
  objc_storeStrong((id *)&self->_initializedNameComponents, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_emailCell, 0);
  objc_storeStrong((id *)&self->_phoneNumberCell, 0);
  objc_storeStrong((id *)&self->_lastNameCell, 0);
  objc_storeStrong((id *)&self->_firstNameCell, 0);
  objc_destroyWeak((id *)&self->_contactDelegate);
}

@end
