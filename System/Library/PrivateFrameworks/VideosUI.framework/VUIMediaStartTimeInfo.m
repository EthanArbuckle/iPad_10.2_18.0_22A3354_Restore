@implementation VUIMediaStartTimeInfo

- (VUIMediaStartTimeInfo)initWithStartTime:(id)a3 timestamp:(id)a4 type:(int64_t)a5 source:(id)a6
{
  id v11;
  id v12;
  id v13;
  VUIMediaStartTimeInfo *v14;
  VUIMediaStartTimeInfo *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)VUIMediaStartTimeInfo;
  v14 = -[VUIMediaStartTimeInfo init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_startTime, a3);
    objc_storeStrong((id *)&v15->_timestamp, a4);
    v15->_type = a5;
    objc_storeStrong((id *)&v15->_source, a6);
  }

  return v15;
}

- (id)description
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[VUIMediaStartTimeInfo type](self, "type"))
  {
    if (-[VUIMediaStartTimeInfo type](self, "type") == 1)
      v3 = CFSTR("relative to main content");
    else
      v3 = CFSTR("unknown");
  }
  else
  {
    v3 = CFSTR("absolute");
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaStartTimeInfo startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaStartTimeInfo timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaStartTimeInfo source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("start time: %@, timestamp: %@, type: %@, source: %@"), v5, v6, v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
