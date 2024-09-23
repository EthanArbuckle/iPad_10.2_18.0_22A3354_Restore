@implementation MapsDropCalendarEventReader

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return (NSArray *)&off_1012733C8;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v18;

  v9 = a3;
  v10 = a4;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.reminders.ics")) & 1) == 0
    && !objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.calendar.ics")))
  {
    if (a5)
    {
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, 0));
      goto LABEL_13;
    }
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  v18 = 0;
  v11 = objc_msgSend(objc_alloc((Class)ICSDocument), "initWithData:options:error:", v9, 0, &v18);
  v12 = v18;
  v13 = v12;
  if (!v11)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v12);

    goto LABEL_12;
  }
  v14 = objc_alloc_init((Class)objc_opt_class(a1));
  if (a1)
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "calendar"));
    v16 = (void *)*((_QWORD *)v14 + 2);
    *((_QWORD *)v14 + 2) = v15;

    objc_storeStrong((id *)v14 + 1, a3);
    objc_storeStrong((id *)v14 + 3, a4);
  }

LABEL_13:
  return v14;
}

- (NSData)data
{
  return self->_data;
}

- (ICSCalendar)calendar
{
  return self->_calendar;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
