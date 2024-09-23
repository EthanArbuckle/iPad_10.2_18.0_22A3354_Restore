@implementation FMDDeviceMotion

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDDeviceMotion stringFromActivityState:](FMDDeviceMotion, "stringFromActivityState:", -[FMDDeviceMotion activityState](self, "activityState")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDeviceMotion activityStartDate](self, "activityStartDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DeviceMotion state %@, startDate %@"), v3, v4));

  return v5;
}

+ (id)stringFromActivityState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("unknown");
  else
    return *(&off_1002C3070 + a3 - 1);
}

- (int64_t)activityState
{
  return self->_activityState;
}

- (void)setActivityState:(int64_t)a3
{
  self->_activityState = a3;
}

- (NSDate)activityStartDate
{
  return self->_activityStartDate;
}

- (void)setActivityStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityStartDate, 0);
}

@end
