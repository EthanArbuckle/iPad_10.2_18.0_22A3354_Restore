@implementation REMReminderSubtaskContext

- (REMReminderSubtaskContext)initWithReminder:(id)a3
{
  id v5;
  REMReminderSubtaskContext *v6;
  REMReminderSubtaskContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderSubtaskContext;
  v6 = -[REMReminderSubtaskContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reminder, a3);

  return v7;
}

- (REMReminder)parentReminder
{
  void *v2;
  void *v3;

  -[REMReminderSubtaskContext reminder](self, "reminder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentReminder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMReminder *)v3;
}

- (BOOL)hasSubtasksWithError:(id *)a3
{
  REMRemindersDataView *v5;
  void *v6;
  void *v7;
  REMRemindersDataView *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = [REMRemindersDataView alloc];
  -[REMReminderSubtaskContext reminder](self, "reminder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMRemindersDataView initWithStore:](v5, "initWithStore:", v7);

  -[REMReminderSubtaskContext reminder](self, "reminder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView fetchObjectIDsOfRemindersWithParentReminderID:includeIncomplete:includeCompleted:isUnsupported:error:](v8, "fetchObjectIDsOfRemindersWithParentReminderID:includeIncomplete:includeCompleted:isUnsupported:error:", v10, 1, 1, 0, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v11, "count") != 0;
  return (char)v9;
}

- (int64_t)fetchSubtasksMasksWithError:(id *)a3
{
  REMRemindersDataView *v5;
  void *v6;
  void *v7;
  REMRemindersDataView *v8;
  void *v9;
  void *v10;
  int64_t v11;

  v5 = [REMRemindersDataView alloc];
  -[REMReminderSubtaskContext reminder](self, "reminder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMRemindersDataView initWithStore:](v5, "initWithStore:", v7);

  -[REMReminderSubtaskContext reminder](self, "reminder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[REMRemindersDataView fetchSubtasksMasksWithParentReminderID:includingConcealed:error:](v8, "fetchSubtasksMasksWithParentReminderID:includingConcealed:error:", v10, 0, a3);

  return v11;
}

- (int64_t)fetchSubtasksMasksIncludingConcealedWithError:(id *)a3
{
  REMRemindersDataView *v5;
  void *v6;
  void *v7;
  REMRemindersDataView *v8;
  void *v9;
  void *v10;
  int64_t v11;

  v5 = [REMRemindersDataView alloc];
  -[REMReminderSubtaskContext reminder](self, "reminder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMRemindersDataView initWithStore:](v5, "initWithStore:", v7);

  -[REMReminderSubtaskContext reminder](self, "reminder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[REMRemindersDataView fetchSubtasksMasksWithParentReminderID:includingConcealed:error:](v8, "fetchSubtasksMasksWithParentReminderID:includingConcealed:error:", v10, 1, a3);

  return v11;
}

- (id)fetchRemindersWithError:(id *)a3
{
  REMRemindersDataView *v5;
  void *v6;
  void *v7;
  REMRemindersDataView *v8;
  void *v9;
  void *v10;

  v5 = [REMRemindersDataView alloc];
  -[REMReminderSubtaskContext reminder](self, "reminder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMRemindersDataView initWithStore:](v5, "initWithStore:", v7);

  -[REMReminderSubtaskContext reminder](self, "reminder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView fetchSubtasksOfParentReminder:fetchOption:error:](v8, "fetchSubtasksOfParentReminder:fetchOption:error:", v9, 0, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fetchSubtasksMarkedForDeletionWithError:(id *)a3
{
  REMRemindersDataView *v5;
  void *v6;
  void *v7;
  REMRemindersDataView *v8;
  void *v9;
  void *v10;

  v5 = [REMRemindersDataView alloc];
  -[REMReminderSubtaskContext reminder](self, "reminder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMRemindersDataView initWithStore:](v5, "initWithStore:", v7);

  -[REMReminderSubtaskContext reminder](self, "reminder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView fetchSubtasksOfParentReminder:fetchOption:error:](v8, "fetchSubtasksOfParentReminder:fetchOption:error:", v9, 2, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fetchRemindersForMovingWithError:(id *)a3
{
  REMRemindersDataView *v5;
  void *v6;
  void *v7;
  REMRemindersDataView *v8;
  void *v9;
  void *v10;

  v5 = [REMRemindersDataView alloc];
  -[REMReminderSubtaskContext reminder](self, "reminder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMRemindersDataView initWithStore:](v5, "initWithStore:", v7);

  -[REMReminderSubtaskContext reminder](self, "reminder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView fetchSubtasksOfParentReminder:fetchOption:error:](v8, "fetchSubtasksOfParentReminder:fetchOption:error:", v9, 1, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fetchObjectIDsOfCompletedSubtasksWithError:(id *)a3
{
  REMRemindersDataView *v5;
  void *v6;
  void *v7;
  REMRemindersDataView *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = [REMRemindersDataView alloc];
  -[REMReminderSubtaskContext reminder](self, "reminder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMRemindersDataView initWithStore:](v5, "initWithStore:", v7);

  -[REMReminderSubtaskContext reminder](self, "reminder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView fetchObjectIDsOfRemindersWithParentReminderID:includeIncomplete:includeCompleted:isUnsupported:error:](v8, "fetchObjectIDsOfRemindersWithParentReminderID:includeIncomplete:includeCompleted:isUnsupported:error:", v10, 0, 1, 0, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fetchObjectIDsOfUnsupportedSubtasksWithError:(id *)a3
{
  REMRemindersDataView *v5;
  void *v6;
  void *v7;
  REMRemindersDataView *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = [REMRemindersDataView alloc];
  -[REMReminderSubtaskContext reminder](self, "reminder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMRemindersDataView initWithStore:](v5, "initWithStore:", v7);

  -[REMReminderSubtaskContext reminder](self, "reminder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRemindersDataView fetchObjectIDsOfRemindersWithParentReminderID:includeIncomplete:includeCompleted:isUnsupported:error:](v8, "fetchObjectIDsOfRemindersWithParentReminderID:includeIncomplete:includeCompleted:isUnsupported:error:", v10, 1, 1, 1, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
