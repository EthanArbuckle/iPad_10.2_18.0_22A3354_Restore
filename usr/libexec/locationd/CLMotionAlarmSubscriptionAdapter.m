@implementation CLMotionAlarmSubscriptionAdapter

- (CLMotionAlarmSubscriptionAdapter)initWithMotionAlarmSubscription:(void *)a3
{
  CLMotionAlarmSubscriptionAdapter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLMotionAlarmSubscriptionAdapter;
  result = -[CLMotionAlarmSubscriptionAdapter init](&v5, "init");
  if (result)
    result->_motionAlarmSubscription = a3;
  return result;
}

- (void)fireAlarm:(id)a3 error:(int)a4
{
  sub_100920B54((uint64_t)-[CLMotionAlarmSubscriptionAdapter motionAlarmSubscription](self, "motionAlarmSubscription"), (uint64_t)a3, *(uint64_t *)&a4);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)motionAlarmSubscription
{
  return self->_motionAlarmSubscription;
}

- (void)setMotionAlarmSubscription:(void *)a3
{
  self->_motionAlarmSubscription = a3;
}

@end
