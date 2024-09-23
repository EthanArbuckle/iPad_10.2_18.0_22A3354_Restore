@implementation REMReminderHashtagContext

- (REMReminderHashtagContext)initWithReminder:(id)a3
{
  id v4;
  REMReminderHashtagContext *v5;
  REMReminderHashtagContext *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMReminderHashtagContext;
  v5 = -[REMReminderHashtagContext init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_reminder, v4);

  return v6;
}

- (NSSet)hashtags
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[REMReminderHashtagContext reminder](self, "reminder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hashtags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[REMReminderHashtagContext reminder](self, "reminder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hashtags");
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
