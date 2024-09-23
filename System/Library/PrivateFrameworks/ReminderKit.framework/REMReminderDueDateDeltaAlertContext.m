@implementation REMReminderDueDateDeltaAlertContext

- (REMReminderDueDateDeltaAlertContext)initWithReminder:(id)a3
{
  id v5;
  REMReminderDueDateDeltaAlertContext *v6;
  REMReminderDueDateDeltaAlertContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderDueDateDeltaAlertContext;
  v6 = -[REMReminderDueDateDeltaAlertContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reminder, a3);

  return v7;
}

- (NSArray)dueDateDeltaAlerts
{
  void *v2;
  void *v3;
  void *v4;

  -[REMReminderDueDateDeltaAlertContext reminder](self, "reminder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchedDueDateDeltaAlerts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (REMDueDateDeltaAlert)fetchedCurrentDueDateDeltaAlert
{
  void *v2;
  void *v3;

  -[REMReminderDueDateDeltaAlertContext dueDateDeltaAlerts](self, "dueDateDeltaAlerts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMDueDateDeltaAlert *)v3;
}

- (REMReminder)reminder
{
  return self->_reminder;
}

- (void)setReminder:(id)a3
{
  objc_storeStrong((id *)&self->_reminder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminder, 0);
}

@end
