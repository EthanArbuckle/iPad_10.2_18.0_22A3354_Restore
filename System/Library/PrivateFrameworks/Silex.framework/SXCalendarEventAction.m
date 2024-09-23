@implementation SXCalendarEventAction

- (SXCalendarEventAction)initWithStartDate:(id)a3
{
  id v4;
  SXCalendarEventAction *v5;
  uint64_t v6;
  NSDate *startDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXCalendarEventAction;
  v5 = -[SXCalendarEventAction init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

  }
  return v5;
}

- (NSString)type
{
  return (NSString *)CFSTR("calendar");
}

- (SXJSONDictionary)analytics
{
  return self->analytics;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (void)setAllDay:(BOOL)a3
{
  self->_allDay = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SXFormattedText)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->analytics, 0);
}

@end
