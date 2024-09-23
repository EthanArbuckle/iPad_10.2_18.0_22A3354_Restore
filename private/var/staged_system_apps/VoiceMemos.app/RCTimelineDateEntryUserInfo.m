@implementation RCTimelineDateEntryUserInfo

- (RCTimelineDateEntryUserInfo)initWithCurrentTime:(double)a3 recordingDuration:(double)a4
{
  RCTimelineDateEntryUserInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCTimelineDateEntryUserInfo;
  result = -[RCTimelineDateEntryUserInfo init](&v7, "init");
  if (result)
  {
    result->_currentTime = a3;
    result->_recordingDuration = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  RCTimelineDateEntryUserInfo *v5;
  uint64_t v6;
  RCTimelineDateEntryUserInfo *v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;

  v5 = (RCTimelineDateEntryUserInfo *)a3;
  if (self == v5)
  {
    v16 = 1;
  }
  else
  {
    v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      -[RCTimelineDateEntryUserInfo currentTime](self, "currentTime");
      v9 = v8;
      -[RCTimelineDateEntryUserInfo currentTime](v7, "currentTime");
      v11 = v9 == v10;
      -[RCTimelineDateEntryUserInfo recordingDuration](self, "recordingDuration");
      v13 = v12;
      -[RCTimelineDateEntryUserInfo recordingDuration](v7, "recordingDuration");
      v15 = v14;

      v16 = v13 == v15 && v11;
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  -[RCTimelineDateEntryUserInfo currentTime](self, "currentTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  -[RCTimelineDateEntryUserInfo recordingDuration](self, "recordingDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[RCTimelineDateEntryUserInfo currentTime](self, "currentTime");
  v4 = v3;
  -[RCTimelineDateEntryUserInfo recordingDuration](self, "recordingDuration");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("currentTime = %f;  recordingDuration = %f"),
           v4,
           v5);
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)recordingDuration
{
  return self->_recordingDuration;
}

- (void)setRecordingDuration:(double)a3
{
  self->_recordingDuration = a3;
}

@end
