@implementation RTMotionActivityManagerNotificationActivityAlarm

- (RTMotionActivityManagerNotificationActivityAlarm)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithActivityAlarmTrigger_);
}

- (RTMotionActivityManagerNotificationActivityAlarm)initWithActivityAlarmTrigger:(int64_t)a3
{
  RTMotionActivityManagerNotificationActivityAlarm *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTMotionActivityManagerNotificationActivityAlarm;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_trigger = a3;
  return result;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  +[RTMotionActivityManager activityAlarmTriggerToString:](RTMotionActivityManager, "activityAlarmTriggerToString:", -[RTMotionActivityManagerNotificationActivityAlarm trigger](self, "trigger"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("activity alarm trigger, %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)trigger
{
  return self->_trigger;
}

@end
