@implementation HKSPAnalyticsWindDownEventDataWrapper

- (HKSPAnalyticsWindDownEventDataWrapper)initWithEventDatums:(id)a3
{
  id v5;
  HKSPAnalyticsWindDownEventDataWrapper *v6;
  HKSPAnalyticsWindDownEventDataWrapper *v7;
  HKSPAnalyticsWindDownEventDataWrapper *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSPAnalyticsWindDownEventDataWrapper;
  v6 = -[HKSPAnalyticsWindDownEventDataWrapper init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventDatums, a3);
    v8 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_eventDatums, CFSTR("WindDownEvents"));
}

- (HKSPAnalyticsWindDownEventDataWrapper)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKSPAnalyticsWindDownEventDataWrapper *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("WindDownEvents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HKSPAnalyticsWindDownEventDataWrapper initWithEventDatums:](self, "initWithEventDatums:", v5);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)eventDatums
{
  return self->_eventDatums;
}

- (void)setEventDatums:(id)a3
{
  objc_storeStrong((id *)&self->_eventDatums, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDatums, 0);
}

@end
