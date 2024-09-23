@implementation CalendarMessageEventInvitationCell

- (id)titleStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v13 = v6;
    v7 = &v13;
  }
  else
  {
    *(_QWORD *)&v8 = objc_opt_class(self).n128_u64[0];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v9, v8));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("(No Title)"), &stru_1001B67C0, 0));
    v12 = v6;
    v7 = &v12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 1));

  return v10;
}

- (id)bodyStringDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  unsigned int v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "descriptionStrings:", CUIKCalendarNoboDescriptionProfile));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageEventInvitationCell _organizerString](self, "_organizerString"));
  if (v6)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CUIKNotificationDescriptionKeyPerson);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageEventInvitationCell _invitedByString](self, "_invitedByString"));
  if (v7)
  {
    v8 = &CUIKNotificationDescriptionKeySecondPerson;
    if (!v6)
      v8 = &CUIKNotificationDescriptionKeyPerson;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *v8);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v10 = objc_msgSend(v9, "couldBeJunk");

  if (v10)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CUIKNotificationDescriptionKeyPerson);

  return v5;
}

- (id)preActionBodyStrings
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v4 = objc_msgSend(v3, "couldBeJunk");

  if (!v4)
    goto LABEL_12;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "owner"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "emailAddress"));
  if (v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "emailAddress"));
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "phoneNumber"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKPhoneNumberDescriptionGenerator sharedGenerator](CUIKPhoneNumberDescriptionGenerator, "sharedGenerator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "phoneNumber"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "formattedStringForPhoneNumber:", v11));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "resourceSpecifier"));

    if (v10)
    {
      v8 = v10;
      goto LABEL_9;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
    v16 = CUIKDisplayStringForNotificationIdentity(v11, 0, 0);
    v12 = objc_claimAutoreleasedReturnValue(v16);
  }
  v8 = (id)v12;

LABEL_9:
LABEL_10:

  if (!v8)
  {
LABEL_12:
    v14 = 0;
    return v14;
  }
  v17[0] = v8;
  v17[1] = CFSTR(" — ");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));

  return v14;
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

- (int64_t)selectedResponseButton
{
  void *v2;
  char *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v3 = (char *)objc_msgSend(v2, "participationStatus");

  if ((unint64_t)(v3 - 2) > 2)
    return 0;
  else
    return qword_1001A17B8[(_QWORD)(v3 - 2)];
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
    v7.super_class = (Class)CalendarMessageEventInvitationCell;
    -[CalendarMessageCell updateAuthor](&v7, "updateAuthor");
  }
}

- (id)_invitedByString
{
  void *v3;
  void *v4;
  NSString *invitedByString;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "invitedBy"));

  if (v4)
  {
    invitedByString = self->_invitedByString;
    if (!invitedByString)
    {
      *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v7, v6));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Invited by %@"), &stru_1001B67C0, 0));

      if (v9)
      {
        v10 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v4));
        v11 = self->_invitedByString;
        self->_invitedByString = v10;

      }
      invitedByString = self->_invitedByString;
    }
    v12 = invitedByString;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_organizerString
{
  void *v3;
  unsigned __int8 v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  NSString *organizerName;
  NSString *v15;
  uint64_t v16;
  NSString *v17;
  NSString *organizerString;

  if (!self->_organizerString)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
    v4 = objc_msgSend(v3, "couldBeJunk");

    if ((v4 & 1) == 0)
    {
      if (-[CalendarMessageEventInvitationCell notificationIsCancelled](self, "notificationIsCancelled"))
      {
        *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v6, v5));
        v8 = v7;
        v9 = CFSTR("Canceled by %@");
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageEventInvitationCell _invitedByString](self, "_invitedByString"));

        if (!v10)
          return self->_organizerString;
        *(_QWORD *)&v11 = objc_opt_class(self).n128_u64[0];
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v12, v11));
        v8 = v7;
        v9 = CFSTR("Organized by %@");
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1001B67C0, 0));

      organizerName = self->_organizerName;
      v15 = organizerName;
      if (!organizerName)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
        v16 = CUIKDisplayStringForNotificationIdentity(v8, 0, 0);
        v15 = (NSString *)objc_claimAutoreleasedReturnValue(v16);
      }
      v17 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v15));
      organizerString = self->_organizerString;
      self->_organizerString = v17;

      if (!organizerName)
      {

      }
    }
  }
  return self->_organizerString;
}

- (id)_dateString
{
  NSString *dateString;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  double v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *v19;

  dateString = self->_dateString;
  if (dateString)
    return dateString;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  if (objc_msgSend(v4, "timeChanged"))
  {
    *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v6, v5));
    v8 = v7;
    v9 = CFSTR("Time changed to %@");
  }
  else
  {
    if (!objc_msgSend(v4, "dateChanged"))
    {
      v13 = 1;
      v12 = CFSTR("%@");
      goto LABEL_8;
    }
    *(_QWORD *)&v10 = objc_opt_class(self).n128_u64[0];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v11, v10));
    v8 = v7;
    v9 = CFSTR("Date changed to %@");
  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1001B67C0, 0));

  v13 = 0;
LABEL_8:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKDateDescriptionGenerator sharedGenerator](CUIKDateDescriptionGenerator, "sharedGenerator"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDateForNextOccurrence"));
  v16 = v15;
  if (!v15)
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateStringForDate:allDay:standalone:shortFormat:", v16, objc_msgSend(v4, "isAllDay"), v13, 0));
  if (!v15)

  v18 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v17));
  v19 = self->_dateString;
  self->_dateString = v18;

  dateString = self->_dateString;
  return dateString;
}

- (id)actions
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionsForNotification:", v6));

  return v7;
}

+ (id)actionsForNotification:(id)a3
{
  id v4;
  _UNKNOWN **v5;

  v4 = a3;
  if ((objc_msgSend(a1, "_notificationIsInvite:", v4) & 1) != 0)
  {
    v5 = &off_1001BC8B0;
  }
  else if (objc_msgSend(v4, "type") == (id)2)
  {
    v5 = &off_1001BC8C8;
  }
  else
  {
    v5 = &off_1001BC8E0;
  }

  return v5;
}

+ (BOOL)_notificationIsInvite:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (objc_msgSend(a1, "_notificationIsCancelled:", v4) & 1) == 0
    && objc_msgSend(v4, "participationStatus") != (id)2
    && objc_msgSend(v4, "participationStatus") != (id)3
    && objc_msgSend(v4, "participationStatus") != (id)4;

  return v5;
}

+ (BOOL)_notificationIsCancelled:(id)a3
{
  return objc_msgSend(a3, "type") == (id)2;
}

- (unint64_t)options
{
  return 4;
}

- (BOOL)showAsCancelledOrDeclined
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CalendarMessageEventInvitationCell;
  if (-[CalendarMessageCell showAsCancelledOrDeclined](&v4, "showAsCancelledOrDeclined"))
    return 1;
  else
    return -[CalendarMessageEventInvitationCell notificationIsCancelled](self, "notificationIsCancelled");
}

- (BOOL)notificationIsCancelled
{
  double v3;
  void *v4;
  void *v5;
  void *v6;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification", v3));
  LOBYTE(v5) = objc_msgSend(v5, "_notificationIsCancelled:", v6);

  return (char)v5;
}

- (BOOL)notificationIsInvite
{
  double v3;
  void *v4;
  void *v5;
  void *v6;

  *(_QWORD *)&v3 = objc_opt_class(self).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification", v3));
  LOBYTE(v5) = objc_msgSend(v5, "_notificationIsInvite:", v6);

  return (char)v5;
}

- (void)setNotification:(id)a3
{
  uint64_t v4;
  _BOOL8 v5;
  NSString *organizerString;
  NSString *dateString;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CalendarMessageEventInvitationCell;
  -[CalendarMessageCell setNotification:](&v8, "setNotification:", a3);
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(self, v4))
    v5 = -[CalendarMessageEventInvitationCell notificationIsInvite](self, "notificationIsInvite");
  else
    v5 = 0;
  -[CalendarMessageCell setHasDisclosure:](self, "setHasDisclosure:", v5);
  organizerString = self->_organizerString;
  self->_organizerString = 0;

  dateString = self->_dateString;
  self->_dateString = 0;

}

- (NSString)organizerName
{
  return self->_organizerName;
}

- (void)setOrganizerName:(id)a3
{
  objc_storeStrong((id *)&self->_organizerName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizerName, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_invitedByString, 0);
  objc_storeStrong((id *)&self->_organizerString, 0);
}

@end
