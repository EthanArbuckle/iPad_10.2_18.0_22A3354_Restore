@implementation BKRecentBookOpenTrackingEvent

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKRecentBookOpenTrackingEvent timestamp](self, "timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("timestamp"));

  objc_msgSend(v5, "encodeBool:forKey:", -[BKRecentBookOpenTrackingEvent isStart](self, "isStart"), CFSTR("isStart"));
}

- (BKRecentBookOpenTrackingEvent)initWithStart:(BOOL)a3 date:(id)a4
{
  id v7;
  BKRecentBookOpenTrackingEvent *v8;
  BKRecentBookOpenTrackingEvent *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BKRecentBookOpenTrackingEvent;
  v8 = -[BKRecentBookOpenTrackingEvent init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_timestamp, a4);
    v9->_isStart = a3;
  }

  return v9;
}

+ (id)eventForStart:(BOOL)a3
{
  _BOOL8 v3;
  BKRecentBookOpenTrackingEvent *v4;
  void *v5;
  BKRecentBookOpenTrackingEvent *v6;

  v3 = a3;
  v4 = [BKRecentBookOpenTrackingEvent alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = -[BKRecentBookOpenTrackingEvent initWithStart:date:](v4, "initWithStart:date:", v3, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BKRecentBookOpenTrackingEvent)initWithCoder:(id)a3
{
  id v4;
  BKRecentBookOpenTrackingEvent *v5;
  id v6;
  uint64_t v7;
  NSDate *timestamp;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKRecentBookOpenTrackingEvent;
  v5 = -[BKRecentBookOpenTrackingEvent init](&v10, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("timestamp"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v7;

    v5->_isStart = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isStart"));
  }

  return v5;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
