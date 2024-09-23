@implementation RCRecordingStartTimeInfo

+ (RCRecordingStartTimeInfo)infoWithCurrentDateAndTime
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = objc_msgSend(v2, "initWithDateRecordingStartTime:initWithMachRecordingStartTime:", v3, mach_absolute_time());

  return (RCRecordingStartTimeInfo *)v4;
}

- (RCRecordingStartTimeInfo)initWithDateRecordingStartTime:(id)a3 initWithMachRecordingStartTime:(unint64_t)a4
{
  id v7;
  RCRecordingStartTimeInfo *v8;
  RCRecordingStartTimeInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RCRecordingStartTimeInfo;
  v8 = -[RCRecordingStartTimeInfo init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dateRecordingStartTime, a3);
    v9->_machRecordingStartTime = a4;
  }

  return v9;
}

- (unint64_t)machRecordingStartTime
{
  return self->_machRecordingStartTime;
}

- (NSDate)dateRecordingStartTime
{
  return self->_dateRecordingStartTime;
}

- (double)recordingTimeAtStartTime
{
  return self->_recordingTimeAtStartTime;
}

- (void)setRecordingTimeAtStartTime:(double)a3
{
  self->_recordingTimeAtStartTime = a3;
}

- (double)recordingDurationAtStartTime
{
  return self->_recordingDurationAtStartTime;
}

- (void)setRecordingDurationAtStartTime:(double)a3
{
  self->_recordingDurationAtStartTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRecordingStartTime, 0);
}

@end
