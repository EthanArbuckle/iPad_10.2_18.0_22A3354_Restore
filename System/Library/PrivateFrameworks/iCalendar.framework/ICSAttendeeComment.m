@implementation ICSAttendeeComment

- (ICSAttendeeComment)initWithComment:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSAttendeeComment;
  return -[ICSProperty initWithValue:type:](&v4, sel_initWithValue_type_, a3, 5007);
}

- (void)setComment:(id)a3
{
  -[ICSProperty setValue:type:](self, "setValue:type:", a3, 5007);
}

- (void)setX_calendarserver_attendee_ref:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-CALENDARSERVER-ATTENDEE-REF"));
}

- (NSString)x_calendarserver_attendee_ref
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-CALENDARSERVER-ATTENDEE-REF"));
}

- (void)setX_calendarserver_dtstamp:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-CALENDARSERVER-DTSTAMP"));
}

- (ICSDateValue)x_calendarserver_dtstamp
{
  return (ICSDateValue *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-CALENDARSERVER-DTSTAMP"));
}

- (BOOL)shouldObscureParameter:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("X-CALENDARSERVER-ATTENDEE-REF"));
}

- (BOOL)shouldObscureValue
{
  return 1;
}

@end
