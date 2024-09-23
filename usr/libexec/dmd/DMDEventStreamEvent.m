@implementation DMDEventStreamEvent

- (DMDEventStreamEvent)initWithEventType:(id)a3 details:(id)a4
{
  id v6;
  id v7;
  DMDEventStreamEvent *v8;
  NSString *v9;
  NSString *eventType;
  NSDictionary *v11;
  NSDictionary *details;
  NSDate *v13;
  NSDate *timestamp;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DMDEventStreamEvent;
  v8 = -[DMDEventStreamEvent init](&v16, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    eventType = v8->_eventType;
    v8->_eventType = v9;

    v11 = (NSDictionary *)objc_msgSend(v7, "copy");
    details = v8->_details;
    v8->_details = v11;

    v13 = objc_opt_new(NSDate);
    timestamp = v8->_timestamp;
    v8->_timestamp = v13;

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[0] = CFSTR("eventType");
  v7[1] = CFSTR("timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));
  v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)eventStatusMessageWithPayloadIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 4);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, DMFDeclarationEventsMessageInReplyToKey);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventStreamEvent eventType](self, "eventType"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, DMFDeclarationEventsMessageEventTypeKey);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventStreamEvent timestamp](self, "timestamp"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, DMFDeclarationEventsMessageEventTimestampKey);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEventStreamEvent details](self, "details"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, DMFDeclarationEventsMessageEventPayloadKey);

  return v5;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSDictionary)details
{
  return self->_details;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
}

@end
