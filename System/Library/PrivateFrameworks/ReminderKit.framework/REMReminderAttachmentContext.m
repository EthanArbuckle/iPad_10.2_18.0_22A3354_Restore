@implementation REMReminderAttachmentContext

- (REMReminderAttachmentContext)initWithReminder:(id)a3
{
  id v5;
  REMReminderAttachmentContext *v6;
  REMReminderAttachmentContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderAttachmentContext;
  v6 = -[REMReminderAttachmentContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reminder, a3);

  return v7;
}

- (id)attachmentsOfClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[REMReminderAttachmentContext attachments](self, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__REMReminderAttachmentContext_attachmentsOfClass___block_invoke;
  v8[3] = &__block_descriptor_40_e26_B24__0__REMAttachment_8_16lu32l8;
  v8[4] = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __51__REMReminderAttachmentContext_attachmentsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (NSArray)fileAttachments
{
  return (NSArray *)-[REMReminderAttachmentContext attachmentsOfClass:](self, "attachmentsOfClass:", objc_opt_class());
}

- (NSArray)imageAttachments
{
  return (NSArray *)-[REMReminderAttachmentContext attachmentsOfClass:](self, "attachmentsOfClass:", objc_opt_class());
}

- (NSArray)urlAttachments
{
  return (NSArray *)-[REMReminderAttachmentContext attachmentsOfClass:](self, "attachmentsOfClass:", objc_opt_class());
}

- (NSArray)attachments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[REMReminderAttachmentContext reminder](self, "reminder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[REMReminderAttachmentContext reminder](self, "reminder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v6;
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
