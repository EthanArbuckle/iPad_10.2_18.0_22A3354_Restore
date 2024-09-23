@implementation RTMotionActivityManagerNotificationActivity

- (RTMotionActivityManagerNotificationActivity)initWithActivity:(id)a3
{
  id v4;
  RTMotionActivityManagerNotificationActivity *v5;
  uint64_t v6;
  RTMotionActivity *activity;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTMotionActivityManagerNotificationActivity;
  v5 = -[RTNotification init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    activity = v5->_activity;
    v5->_activity = (RTMotionActivity *)v6;

  }
  return v5;
}

- (RTMotionActivity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
