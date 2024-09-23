@implementation TransparencyTranscriptEvent

- (TransparencyTranscriptEvent)initWithName:(id)a3
{
  id v4;
  TransparencyTranscriptEvent *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TransparencyTranscriptEvent;
  v5 = -[TransparencyTranscriptEvent init](&v8, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[TransparencyTranscriptEvent setTimestamp:](v5, "setTimestamp:", v6);

    -[TransparencyTranscriptEvent setName:](v5, "setName:", v4);
  }

  return v5;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v8[0] = CFSTR("timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscriptEvent timestamp](self, "timestamp"));
  objc_msgSend(v3, "timeIntervalSince1970");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v8[1] = CFSTR("name");
  v9[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyTranscriptEvent name](self, "name"));
  v9[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

  return v6;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
