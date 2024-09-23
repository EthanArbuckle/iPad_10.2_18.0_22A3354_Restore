@implementation WBSHistoryServiceEvent

- (WBSHistoryServiceEvent)init
{

  return 0;
}

- (WBSHistoryServiceEvent)initWithEventID:(int64_t)a3 type:(id)a4 time:(id)a5 value:(id)a6
{
  id v10;
  id v11;
  id v12;
  WBSHistoryServiceEvent *v13;
  WBSHistoryServiceEvent *v14;
  uint64_t v15;
  NSString *eventType;
  uint64_t v17;
  NSDate *time;
  uint64_t v19;
  NSDictionary *value;
  WBSHistoryServiceEvent *v21;
  objc_super v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)WBSHistoryServiceEvent;
  v13 = -[WBSHistoryServiceEvent init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_eventID = a3;
    v15 = objc_msgSend(v10, "copy");
    eventType = v14->_eventType;
    v14->_eventType = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    time = v14->_time;
    v14->_time = (NSDate *)v17;

    v19 = objc_msgSend(v12, "copy");
    value = v14->_value;
    v14->_value = (NSDictionary *)v19;

    v21 = v14;
  }

  return v14;
}

- (WBSHistoryServiceEvent)initWithCoder:(id)a3
{
  id v4;
  WBSHistoryServiceEvent *v5;
  uint64_t v6;
  NSString *eventType;
  uint64_t v8;
  NSDate *time;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDictionary *value;
  WBSHistoryServiceEvent *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WBSHistoryServiceEvent;
  v5 = -[WBSHistoryServiceEvent init](&v23, sel_init);
  if (v5)
  {
    v5->_eventID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("eventID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    eventType = v5->_eventType;
    v5->_eventType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time"));
    v8 = objc_claimAutoreleasedReturnValue();
    time = v5->_time;
    v5->_time = (NSDate *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("value"));
    v19 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSDictionary *)v19;

    v21 = v5;
  }

  return v5;
}

- (WBSHistoryServiceEvent)initWithType:(id)a3 time:(id)a4 value:(id)a5
{
  return -[WBSHistoryServiceEvent initWithEventID:type:time:value:](self, "initWithEventID:type:time:value:", 0, a3, a4, a5);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t eventID;
  id v5;

  eventID = self->_eventID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", eventID, CFSTR("eventID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventType, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_time, CFSTR("time"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)eventID
{
  return self->_eventID;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSDate)time
{
  return self->_time;
}

- (NSDictionary)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
}

@end
