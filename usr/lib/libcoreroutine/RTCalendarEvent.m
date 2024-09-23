@implementation RTCalendarEvent

+ (id)participantStatusToString:(unint64_t)a3
{
  if (a3 > 7)
    return CFSTR("Unhandled");
  else
    return off_1E9299520[a3];
}

+ (id)eventAvailabilityToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Not Supported");
  else
    return off_1E9299560[a3];
}

- (RTCalendarEvent)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithEventIdentifier_allDay_startDate_endDate_participantStatus_availability_location_locationTitle_locationMapItemHandle_);
}

- (RTCalendarEvent)initWithEventIdentifier:(id)a3 allDay:(BOOL)a4 startDate:(id)a5 endDate:(id)a6 participantStatus:(unint64_t)a7 availability:(int64_t)a8 location:(id)a9 locationTitle:(id)a10 locationMapItemHandle:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  RTCalendarEvent *v23;
  uint64_t v24;
  NSString *eventIdentifier;
  uint64_t v26;
  NSDate *startDate;
  uint64_t v28;
  NSDate *endDate;
  uint64_t v30;
  RTLocation *location;
  uint64_t v32;
  NSString *locationTitle;
  uint64_t v34;
  NSData *locationMapItemHandle;
  objc_super v37;

  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v37.receiver = self;
  v37.super_class = (Class)RTCalendarEvent;
  v23 = -[RTCalendarEvent init](&v37, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v17, "copy");
    eventIdentifier = v23->_eventIdentifier;
    v23->_eventIdentifier = (NSString *)v24;

    v23->_allDay = a4;
    v26 = objc_msgSend(v18, "copy");
    startDate = v23->_startDate;
    v23->_startDate = (NSDate *)v26;

    v28 = objc_msgSend(v19, "copy");
    endDate = v23->_endDate;
    v23->_endDate = (NSDate *)v28;

    v23->_participantStatus = a7;
    v23->_availability = a8;
    v30 = objc_msgSend(v20, "copy");
    location = v23->_location;
    v23->_location = (RTLocation *)v30;

    v32 = objc_msgSend(v21, "copy");
    locationTitle = v23->_locationTitle;
    v23->_locationTitle = (NSString *)v32;

    v34 = objc_msgSend(v22, "copy");
    locationMapItemHandle = v23->_locationMapItemHandle;
    v23->_locationMapItemHandle = (NSData *)v34;

  }
  return v23;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  NSString *eventIdentifier;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_allDay)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  eventIdentifier = self->_eventIdentifier;
  -[NSDate stringFromDate](self->_startDate, "stringFromDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate stringFromDate](self->_endDate, "stringFromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "participantStatusToString:", self->_participantStatus);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "eventAvailabilityToString:", self->_availability);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (self->_location)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_locationTitle)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (self->_locationMapItemHandle)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("eventIdentifier, %@, allDay, %@, startDate, %@, endDate, %@, particpantStatus, %@, availability, %@, location, %@, locationTitle, %@, locationMapItemHandle, %@"), eventIdentifier, v4, v6, v7, v8, v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)participantStatus
{
  return self->_participantStatus;
}

- (int64_t)availability
{
  return self->_availability;
}

- (RTLocation)location
{
  return self->_location;
}

- (NSString)locationTitle
{
  return self->_locationTitle;
}

- (NSData)locationMapItemHandle
{
  return self->_locationMapItemHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationMapItemHandle, 0);
  objc_storeStrong((id *)&self->_locationTitle, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end
