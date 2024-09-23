@implementation CalendarMessageSharedCalendarCell

- (BOOL)_shouldShowMessage
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v3 = v2;
  v4 = v2
    && objc_msgSend(v2, "sharingInvitationResponse") != (id)1
    && objc_msgSend(v3, "sharingInvitationResponse") != (id)2;

  return v4;
}

- (id)titleStrings
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (!-[CalendarMessageSharedCalendarCell _shouldShowMessage](self, "_shouldShowMessage"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  }
  else
  {
    *(_QWORD *)&v8 = objc_opt_class(self).n128_u64[0];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v9, v8));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Shared Calendar"), &stru_1001B67C0, 0));
  }
  v10 = (void *)v6;

  *(_QWORD *)&v11 = objc_opt_class(self).n128_u64[0];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v12, v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Join “%@”?"), &stru_1001B67C0, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v10));
  v17 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));

  return v16;
}

- (id)bodyStringDict
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "descriptionStrings:", CUIKCalendarNoboDescriptionProfile));

  return v3;
}

- (id)preActionBodyStrings
{
  void *v3;
  unsigned int v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v4 = objc_msgSend(v3, "couldBeJunk");

  if (!v4)
    return 0;
  *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v6, v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("This invitation is from an unknown sender."), &stru_1001B67C0, 0));
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  return v9;
}

- (id)actionBodyString
{
  void *v3;
  unsigned int v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v4 = objc_msgSend(v3, "couldBeJunk");

  if (v4)
  {
    *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v6, v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Report Junk…"), &stru_1001B67C0, 0));

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (int64_t)actionBodyStringAction
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v3 = objc_msgSend(v2, "couldBeJunk");

  if (v3)
    return 0x10000;
  else
    return 0;
}

- (void)updateAuthor
{
  void *v3;
  unsigned int v4;
  CNContact *v5;
  id v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v4 = objc_msgSend(v3, "couldBeJunk");

  if (v4)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell authorView](self, "authorView"));
    v5 = objc_opt_new(CNContact);
    objc_msgSend(v6, "setContact:", v5);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CalendarMessageSharedCalendarCell;
    -[CalendarMessageCell updateAuthor](&v7, "updateAuthor");
  }
}

- (id)actions
{
  return &off_1001BC8F8;
}

- (unint64_t)options
{
  return 0;
}

@end
