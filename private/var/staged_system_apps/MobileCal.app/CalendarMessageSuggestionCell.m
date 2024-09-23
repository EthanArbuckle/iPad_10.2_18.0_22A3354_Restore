@implementation CalendarMessageSuggestionCell

- (CalendarMessageSuggestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CalendarMessageSuggestionCell *v4;
  CalendarMessageSuggestionCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CalendarMessageSuggestionCell;
  v4 = -[CalendarMessageCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[CalendarMessageCell setHasDisclosure:](v4, "setHasDisclosure:", 1);
  return v5;
}

- (id)provideAuthorView
{
  return objc_alloc_init((Class)UIImageView);
}

- (void)updateAuthor
{
  LSApplicationRecord *applicationRecord;
  void *v4;
  unsigned int v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell authorView](self, "authorView"));
  applicationRecord = self->_applicationRecord;
  if (applicationRecord
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord applicationState](applicationRecord, "applicationState")),
        v5 = objc_msgSend(v4, "isInstalled"),
        v4,
        v5))
  {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord bundleIdentifier](self->_applicationRecord, "bundleIdentifier"));
  }
  else
  {
    v6 = CFSTR("com.apple.siri");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "scale");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 0));

  objc_msgSend(v9, "setImage:", v8);
}

- (id)titleStrings
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (id)bodyStringDict
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageSuggestionCell _fromString](self, "_fromString"));
  if (v4)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CUIKNotificationDescriptionKeyPerson);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageSuggestionCell _dateString](self, "_dateString"));
  if (v5)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CUIKNotificationDescriptionKeyDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageSuggestionCell _locationString](self, "_locationString"));
  if (v6)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, CUIKNotificationDescriptionKeyAction);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageSuggestionCell _appNameString](self, "_appNameString"));
  if (v7)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CUIKNotificationDescriptionKeyApp);

  return v3;
}

- (id)_fromString
{
  NSString *v3;
  unsigned int v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *fromString;
  NSString *v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;

  v3 = self->_suggestionOriginSenderName;
  if (v3)
  {
    if (!self->_fromString)
    {
      v4 = -[CalendarMessageSuggestionCell notificationIsCancelled](self, "notificationIsCancelled");
      *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v6, v5));
      v8 = v7;
      if (v4)
        v9 = CFSTR("Canceled by %@");
      else
        v9 = CFSTR("From: %@");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1001B67C0, 0));
      v14 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v3));
      fromString = self->_fromString;
      self->_fromString = v14;

    }
  }
  else
  {
    v10 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
      *(_DWORD *)buf = 136315394;
      v19 = "-[CalendarMessageSuggestionCell _fromString]";
      v20 = 2112;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s: Suggested Event Notification had no from name; this is probably unexpected [%@]",
        buf,
        0x16u);

    }
  }
  v16 = self->_fromString;

  return v16;
}

- (id)_dateString
{
  NSString *dateString;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  NSString *v11;
  NSString *v12;
  const __CFString *v13;
  double v14;
  uint64_t v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;

  dateString = self->_dateString;
  if (!dateString)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
    if ((objc_msgSend(v4, "timeChanged") & 1) != 0)
      v5 = 0;
    else
      v5 = objc_msgSend(v4, "dateChanged") ^ 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKDateDescriptionGenerator sharedGenerator](CUIKDateDescriptionGenerator, "sharedGenerator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDateForNextOccurrence"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateStringForDate:allDay:standalone:shortFormat:", v7, objc_msgSend(v4, "allDay"), v5, 0));

    if (objc_msgSend(v4, "timeChanged"))
    {
      *(_QWORD *)&v9 = objc_opt_class(self).n128_u64[0];
      v11 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v10, v9));
      v12 = v11;
      v13 = CFSTR("Time changed to %@");
    }
    else
    {
      if (!objc_msgSend(v4, "dateChanged"))
      {
        v19 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v8));
        v12 = self->_dateString;
        self->_dateString = v19;
        goto LABEL_11;
      }
      *(_QWORD *)&v14 = objc_opt_class(self).n128_u64[0];
      v11 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v15, v14));
      v12 = v11;
      v13 = CFSTR("Date changed to %@");
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSString localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", v13, &stru_1001B67C0, 0));
    v17 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v8));
    v18 = self->_dateString;
    self->_dateString = v17;

LABEL_11:
    dateString = self->_dateString;
  }
  return dateString;
}

- (id)_locationString
{
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  if (objc_msgSend(v3, "locationChanged"))
  {
    *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v5, v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Location changed"), &stru_1001B67C0, 0));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_appNameString
{
  NSString *appNameString;
  void *v4;
  NSString *v5;
  NSString *v6;

  appNameString = self->_appNameString;
  if (!appNameString)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord localizedName](self->_applicationRecord, "localizedName"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(+[CUIKSuggestionDescriptionGenerator originDescriptionStringWithAppName:](CUIKSuggestionDescriptionGenerator, "originDescriptionStringWithAppName:", v4));
    v6 = self->_appNameString;
    self->_appNameString = v5;

    appNameString = self->_appNameString;
  }
  return appNameString;
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
  if ((objc_msgSend(a1, "_notificationIsCancelled:", v4) & 1) != 0)
  {
    v5 = &off_1001BC808;
  }
  else if (objc_msgSend(v4, "type") == (id)12)
  {
    v5 = &off_1001BC820;
  }
  else
  {
    v5 = &off_1001BC838;
  }

  return v5;
}

- (unint64_t)options
{
  return 4;
}

- (BOOL)showAsCancelledOrDeclined
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CalendarMessageSuggestionCell;
  if (-[CalendarMessageCell showAsCancelledOrDeclined](&v4, "showAsCancelledOrDeclined"))
    return 1;
  else
    return -[CalendarMessageSuggestionCell notificationIsCancelled](self, "notificationIsCancelled");
}

- (BOOL)notificationIsCancelled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v3 = objc_msgSend(v2, "type") == (id)13;

  return v3;
}

+ (BOOL)_notificationIsCancelled:(id)a3
{
  return objc_msgSend(a3, "type") == (id)13;
}

- (void)setNotification:(id)a3
{
  NSString *fromString;
  id v5;
  NSString *dateString;
  NSString *appNameString;
  objc_super v8;

  fromString = self->_fromString;
  self->_fromString = 0;
  v5 = a3;

  dateString = self->_dateString;
  self->_dateString = 0;

  appNameString = self->_appNameString;
  self->_appNameString = 0;

  -[CalendarMessageSuggestionCell _updateSuggestionPropertiesWithNotification:](self, "_updateSuggestionPropertiesWithNotification:", v5);
  v8.receiver = self;
  v8.super_class = (Class)CalendarMessageSuggestionCell;
  -[CalendarMessageCell setNotification:](&v8, "setNotification:", v5);

}

- (void)_updateSuggestionPropertiesWithNotification:(id)a3
{
  void *v4;
  LSApplicationRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSString *v15;
  NSString *suggestionOriginSenderName;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *v22;
  LSApplicationRecord *v23;
  LSApplicationRecord *applicationRecord;
  id v25;

  v25 = a3;
  if (v25)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell delegate](self, "delegate"));
    v5 = (LSApplicationRecord *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventStoreForCell:", self));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "resourceChangeFromEventStore:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "calendarItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localCustomObjectForKey:", kSuggestionsEkEventOriginBundleIdKey));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localCustomObjectForKey:", kSuggestionsEkEventOriginDisplayNameKey));
    if (v8)
    {
      objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
        v11 = v8;
      else
        v11 = 0;
      v12 = v11;
      objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
        v14 = v9;
      else
        v14 = 0;
      v15 = v14;
      suggestionOriginSenderName = self->_suggestionOriginSenderName;
      self->_suggestionOriginSenderName = v15;
    }
    else
    {
      suggestionOriginSenderName = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "suggestedEvent"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSString origin](suggestionOriginSenderName, "origin"));
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleId"));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString origin](suggestionOriginSenderName, "origin"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fromPerson"));
      v21 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "displayName"));
      v22 = self->_suggestionOriginSenderName;
      self->_suggestionOriginSenderName = v21;

    }
    if (v12)
    {
      v23 = (LSApplicationRecord *)objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v12, 0, 0);
      applicationRecord = self->_applicationRecord;
      self->_applicationRecord = v23;

    }
  }
  else
  {
    v17 = self->_suggestionOriginSenderName;
    self->_suggestionOriginSenderName = 0;

    v5 = self->_applicationRecord;
    self->_applicationRecord = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationRecord, 0);
  objc_storeStrong((id *)&self->_suggestionOriginSenderName, 0);
  objc_storeStrong((id *)&self->_appNameString, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_fromString, 0);
}

@end
