@implementation ICSTravelAdvisoryBehavior

- (ICSTravelAdvisoryBehavior)initWithString:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSTravelAdvisoryBehavior;
  return -[ICSProperty initWithValue:type:](&v4, sel_initWithValue_type_, a3, 5007);
}

- (ICSDateTimeUTCValue)acknowledged
{
  return (ICSDateTimeUTCValue *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("ACKNOWLEDGED"));
}

- (void)setAcknowledged:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("ACKNOWLEDGED"));
}

@end
