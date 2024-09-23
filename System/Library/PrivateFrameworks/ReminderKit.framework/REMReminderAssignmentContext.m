@implementation REMReminderAssignmentContext

- (REMReminderAssignmentContext)initWithReminder:(id)a3
{
  id v4;
  REMReminderAssignmentContext *v5;
  REMReminderAssignmentContext *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMReminderAssignmentContext;
  v5 = -[REMReminderAssignmentContext init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_reminder, v4);

  return v6;
}

- (REMAssignment)currentAssignment
{
  void *v2;
  void *v3;
  void *v4;

  -[REMReminderAssignmentContext reminder](self, "reminder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAssignment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMAssignment *)v4;
}

- (NSSet)assignments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[REMReminderAssignmentContext reminder](self, "reminder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assignments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[REMReminderAssignmentContext reminder](self, "reminder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assignments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSSet *)v6;
}

- (REMReminder)reminder
{
  return (REMReminder *)objc_loadWeakRetained((id *)&self->_reminder);
}

- (void)setReminder:(id)a3
{
  objc_storeWeak((id *)&self->_reminder, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_reminder);
}

@end
