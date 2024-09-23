@implementation REMReminderFlaggedContext

- (REMReminderFlaggedContext)initWithReminder:(id)a3
{
  id v5;
  REMReminderFlaggedContext *v6;
  REMReminderFlaggedContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderFlaggedContext;
  v6 = -[REMReminderFlaggedContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reminder, a3);

  return v7;
}

- (int64_t)flagged
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;

  -[REMReminderFlaggedContext reminder](self, "reminder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "flagged");

  if (!v4)
    return 0;
  -[REMReminderFlaggedContext reminder](self, "reminder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "flagged");

  return v6;
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
