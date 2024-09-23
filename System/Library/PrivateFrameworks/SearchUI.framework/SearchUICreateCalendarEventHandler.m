@implementation SearchUICreateCalendarEventHandler

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a4;
  objc_msgSend(a3, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    SearchUITapLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SearchUICreateCalendarEventHandler createViewControllerForCommand:environment:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_8;
  }
  objc_msgSend(v6, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    SearchUITapLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SearchUICreateCalendarEventHandler createViewControllerForCommand:environment:].cold.2(v14, v22, v23, v24, v25, v26, v27, v28);
LABEL_8:

    v12 = 0;
    goto LABEL_9;
  }
  v10 = (void *)objc_opt_new();
  -[SearchUICreateCalendarEventHandler eventFromSFCalendarEvent:eventStore:](self, "eventFromSFCalendarEvent:eventStore:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setEventStore:", v10);
  objc_msgSend(v12, "setEvent:", v11);
  objc_msgSend(v6, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEditViewDelegate:", v13);

LABEL_9:
  return v12;
}

- (BOOL)prefersModalPresentation
{
  return 1;
}

- (BOOL)prefersContextMenu
{
  return 0;
}

- (unint64_t)destination
{
  if (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS"))
    return 2;
  else
    return 3;
}

- (id)eventFromSFCalendarEvent:(id)a3 eventStore:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CAA060];
  v7 = a4;
  objc_msgSend(v6, "eventWithEventStore:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeZone:", v9);

  objc_msgSend(v5, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v10);

  objc_msgSend(v8, "setAllDay:", objc_msgSend(v5, "isAllDay"));
  objc_msgSend(v5, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStartDate:", v11);

  if ((objc_msgSend(v5, "isAllDay") & 1) != 0)
    objc_msgSend(v5, "startDate");
  else
    objc_msgSend(v5, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEndDate:", v12);

  objc_msgSend(v5, "notes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNotes:", v13);

  objc_msgSend(v7, "defaultCalendarForNewEvents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setCalendar:", v14);
  objc_msgSend(v5, "location");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v5, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "geoLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)objc_opt_new();
      objc_msgSend(v5, "location");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "title");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTitle:", v21);

      v22 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      objc_msgSend(v5, "location");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "geoLocation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lat");
      v26 = v25;
      objc_msgSend(v5, "location");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "geoLocation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lng");
      v30 = (void *)objc_msgSend(v22, "initWithLatitude:longitude:", v26, v29);
      objc_msgSend(v19, "setGeoLocation:", v30);

      objc_msgSend(v5, "location");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "radius");
      objc_msgSend(v19, "setRadius:");

      objc_msgSend(v8, "setStructuredLocation:", v19);
    }
  }

  return v8;
}

- (void)createViewControllerForCommand:(uint64_t)a3 environment:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DAD39000, a1, a3, "Error performing SFCreateCalendarEventCommand: No calendar event provided.", a5, a6, a7, a8, 0);
}

- (void)createViewControllerForCommand:(uint64_t)a3 environment:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DAD39000, a1, a3, "Error performing SFCreateCalendarEventCommand: no presentingViewController controller available", a5, a6, a7, a8, 0);
}

@end
