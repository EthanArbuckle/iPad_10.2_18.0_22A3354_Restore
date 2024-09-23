@implementation RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification

- (RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification)initWithAlertDimissedReason:(unint64_t)a3
{
  RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTHealthKitManagerWorkoutEndReminderAlertDismissedNotification;
  result = -[RTNotification init](&v5, sel_init);
  if (result)
    result->_reason = a3;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTNotification name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTHealthKitManager stringFromRTWorkoutEndReminderAlertDismissedReason:](RTHealthKitManager, "stringFromRTWorkoutEndReminderAlertDismissedReason:", self->_reason);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("name, %@, reason, %@,"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

@end
