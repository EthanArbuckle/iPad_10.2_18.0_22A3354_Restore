@implementation EventSummaryData

- (EventSummaryData)init
{
  EventSummaryData *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EventSummaryData;
  result = -[EventSummaryData init](&v8, "init");
  if (result)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_normalizedStart = _Q0;
  }
  return result;
}

+ (id)eventSummaryDataFromEKEvent:(id)a3
{
  id v3;
  EventSummaryData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (v3)
  {
    v4 = objc_opt_new(EventSummaryData);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    -[EventSummaryData setStartDate:](v4, "setStartDate:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    -[EventSummaryData setEndDate:](v4, "setEndDate:", v6);

    if (objc_msgSend(v3, "isAllDay"))
    {
      -[EventSummaryData setIsAllDay:](v4, "setIsAllDay:", 1);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone calendarTimeZone](NSTimeZone, "calendarTimeZone"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar CalGregorianCalendarForTimeZone:](NSCalendar, "CalGregorianCalendarForTimeZone:", v7));
      -[EventSummaryData setIsAllDay:](v4, "setIsAllDay:", objc_msgSend(v3, "isMultiDayTimedEventInCalendar:", v8));

    }
    if ((objc_msgSend(v3, "isIntegrationEvent") & 1) != 0)
    {
      v9 = CUIKIntegrationEventBackgroundColor();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      -[EventSummaryData setColor:](v4, "setColor:", v10);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "calendar"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayColor"));
      -[EventSummaryData setColor:](v4, "setColor:", v11);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventOccurrenceID"));
    -[EventSummaryData setEventIdentifier:](v4, "setEventIdentifier:", v12);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (void)setIsAllDay:(BOOL)a3
{
  self->_isAllDay = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_eventIdentifier, a3);
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (double)units
{
  return self->_units;
}

- (void)setUnits:(double)a3
{
  self->_units = a3;
}

- (double)normalizedStart
{
  return self->_normalizedStart;
}

- (void)setNormalizedStart:(double)a3
{
  self->_normalizedStart = a3;
}

- (double)normalizedEnd
{
  return self->_normalizedEnd;
}

- (void)setNormalizedEnd:(double)a3
{
  self->_normalizedEnd = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
