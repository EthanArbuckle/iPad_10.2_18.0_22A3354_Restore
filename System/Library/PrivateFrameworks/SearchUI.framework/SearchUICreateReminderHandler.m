@implementation SearchUICreateReminderHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  objc_msgSend(a3, "reminder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CAA128], "reminderWithEventStore:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v8);

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dueDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsInTimeZone:fromDate:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDueDateComponents:", v12);

    objc_msgSend(v5, "notes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNotes:", v13);

    -[NSObject defaultCalendarForNewReminders](v6, "defaultCalendarForNewReminders");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCalendar:", v14);

    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeZone:", v15);

    v23 = 0;
    -[NSObject saveReminder:commit:error:](v6, "saveReminder:commit:error:", v7, 1, &v23);
    v16 = v23;
    if (v16)
    {
      SearchUITapLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SearchUICreateReminderHandler performCommand:triggerEvent:environment:].cold.2(v16, v17);
    }
    else
    {
      v18 = objc_alloc(MEMORY[0x1E0C99E98]);
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "calendarItemIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("x-apple-reminderkit://REMCDReminder/%@"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v18, "initWithString:", v21);

      objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIUtilities openPunchout:](SearchUIUtilities, "openPunchout:", v22);

    }
  }
  else
  {
    SearchUITapLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SearchUICreateReminderHandler performCommand:triggerEvent:environment:].cold.1(v6);
  }

}

- (unint64_t)destination
{
  return 2;
}

- (void)performCommand:(os_log_t)log triggerEvent:environment:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "Error performing SFCreateReminderCommand: No reminder details provided.", v1, 2u);
}

- (void)performCommand:(void *)a1 triggerEvent:(NSObject *)a2 environment:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "Error while creating new calendar event: %@", (uint8_t *)&v4, 0xCu);

}

@end
