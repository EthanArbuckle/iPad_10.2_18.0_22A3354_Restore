@implementation STDowntimeOverrideTransformer

+ (id)coreOverrideFromDowntimeOverride:(id)a3 existingDowntimeOverride:(id)a4 inContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  STCoreDowntimeOverride *v12;
  STCoreDowntimeOverride *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "type");
  v11 = objc_msgSend(v7, "state");
  v12 = (STCoreDowntimeOverride *)v8;
  v13 = v12;
  if (!v12)
    v13 = -[STCoreDowntimeOverride initWithContext:]([STCoreDowntimeOverride alloc], "initWithContext:", v9);
  -[STCoreDowntimeOverride setType:](v13, "setType:", v10 == 1);
  -[STCoreDowntimeOverride setState:](v13, "setState:", v11 == 1);
  objc_msgSend(v7, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");
  -[STCoreDowntimeOverride setCreationDate:](v13, "setCreationDate:", v15);

  objc_msgSend(v7, "calendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "calendarIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  -[STCoreDowntimeOverride setCalendarIdentifier:](v13, "setCalendarIdentifier:", v18);

  objc_msgSend(v7, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  -[STCoreDowntimeOverride setEndDate:](v13, "setEndDate:", v20);

  -[STCoreDowntimeOverride setIsTombstoned:](v13, "setIsTombstoned:", 0);
  return v13;
}

+ (id)downtimeOverrideFromCoreDowntimeOverride:(id)a3 inContext:(id)a4
{
  void *v4;
  id v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = objc_msgSend(v5, "state") == 1;
  v7 = (void *)MEMORY[0x1E0C99D48];
  objc_msgSend(v5, "calendarIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calendarWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    +[STLog blueprint](STLog, "blueprint");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[STDowntimeOverrideTransformer downtimeOverrideFromCoreDowntimeOverride:inContext:].cold.1(v5, v10);

    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = objc_msgSend(v5, "type");
  if (v11 == 1)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "creationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v17);
    objc_msgSend(v15, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "creationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[STDowntimeOverride overrideWithState:creationDate:calendar:fixedDuration:](STDowntimeOverride, "overrideWithState:creationDate:calendar:fixedDuration:", v6, v13, v9, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!v11)
  {
    objc_msgSend(v5, "creationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[STDowntimeOverride overrideWithState:creationDate:calendar:endDate:](STDowntimeOverride, "overrideWithState:creationDate:calendar:endDate:", v6, v12, v9, v13);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v4 = (void *)v14;

  }
  return v4;
}

+ (void)downtimeOverrideFromCoreDowntimeOverride:(void *)a1 inContext:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "calendarIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_ERROR, "Failed to get calendar from persisted identifier: %@. Falling back to current.", (uint8_t *)&v4, 0xCu);

}

@end
