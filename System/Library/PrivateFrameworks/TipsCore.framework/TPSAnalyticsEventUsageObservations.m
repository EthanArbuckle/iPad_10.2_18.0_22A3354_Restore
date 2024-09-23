@implementation TPSAnalyticsEventUsageObservations

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventUsageObservations)initWithCoder:(id)a3
{
  id v4;
  TPSAnalyticsEventUsageObservations *v5;
  uint64_t v6;
  NSString *eventID;
  uint64_t v8;
  NSNumber *eventCount;
  uint64_t v10;
  NSString *experimentID;
  uint64_t v12;
  NSString *experimentCampID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventUsageObservations;
  v5 = -[TPSAnalyticsEvent initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("event_ID"));
    v6 = objc_claimAutoreleasedReturnValue();
    eventID = v5->_eventID;
    v5->_eventID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("event_count"));
    v8 = objc_claimAutoreleasedReturnValue();
    eventCount = v5->_eventCount;
    v5->_eventCount = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experiment_ID"));
    v10 = objc_claimAutoreleasedReturnValue();
    experimentID = v5->_experimentID;
    v5->_experimentID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("experiment_camp_ID"));
    v12 = objc_claimAutoreleasedReturnValue();
    experimentCampID = v5->_experimentCampID;
    v5->_experimentCampID = (NSString *)v12;

  }
  return v5;
}

- (id)_initWithEventID:(id)a3 eventCount:(id)a4
{
  id v7;
  id v8;
  TPSAnalyticsEventUsageObservations *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TPSAnalyticsEventUsageObservations;
  v9 = -[TPSAnalyticsEvent initWithDate:](&v12, sel_initWithDate_, 0);
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventID, a3);
    objc_storeStrong(p_isa + 5, a4);
  }

  return p_isa;
}

+ (id)eventWithEventID:(id)a3 eventCount:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithEventID:eventCount:", v7, v6);

  return v8;
}

- (void)setDataProvider:(id)a3
{
  NSString *experimentID;
  NSString *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *experimentCampID;
  NSString *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TPSAnalyticsEventUsageObservations;
  -[TPSAnalyticsEvent setDataProvider:](&v14, sel_setDataProvider_, a3);
  experimentID = self->_experimentID;
  if (experimentID)
  {
    v5 = experimentID;
    v6 = self->_experimentID;
    self->_experimentID = v5;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "experimentID");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_experimentID;
    self->_experimentID = v7;

  }
  experimentCampID = self->_experimentCampID;
  if (experimentCampID)
  {
    v10 = experimentCampID;
    v11 = self->_experimentCampID;
    self->_experimentCampID = v10;
  }
  else
  {
    -[TPSAnalyticsEvent dataProvider](self, "dataProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "experimentCampID");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = self->_experimentCampID;
    self->_experimentCampID = v12;

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventUsageObservations;
  v4 = a3;
  -[TPSAnalyticsEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_eventID, CFSTR("event_ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_eventCount, CFSTR("event_count"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_experimentID, CFSTR("experiment_ID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_experimentCampID, CFSTR("experiment_camp_ID"));

}

- (id)eventName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.tips"), CFSTR("event_observations"));
}

- (id)mutableAnalyticsEventRepresentation
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_eventID, CFSTR("event_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_eventCount, CFSTR("event_count"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_experimentID, CFSTR("experiment_ID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_experimentCampID, CFSTR("experiment_camp_ID"));
  return v3;
}

- (NSString)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
{
  objc_storeStrong((id *)&self->_eventID, a3);
}

- (NSNumber)eventCount
{
  return self->_eventCount;
}

- (void)setEventCount:(id)a3
{
  objc_storeStrong((id *)&self->_eventCount, a3);
}

- (NSString)experimentID
{
  return self->_experimentID;
}

- (NSString)experimentCampID
{
  return self->_experimentCampID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentCampID, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_eventCount, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
}

@end
