@implementation PGHolidayMemoryTrigger

- (PGHolidayMemoryTrigger)initWithLoggingConnection:(id)a3 holidayService:(id)a4
{
  id v7;
  PGHolidayMemoryTrigger *v8;
  PGHolidayMemoryTrigger *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGHolidayMemoryTrigger;
  v8 = -[PGMemoryTrigger initWithLoggingConnection:](&v11, sel_initWithLoggingConnection_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_holidayService, a4);

  return v9;
}

- (CLSHolidayCalendarEventService)holidayService
{
  return self->_holidayService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holidayService, 0);
}

@end
