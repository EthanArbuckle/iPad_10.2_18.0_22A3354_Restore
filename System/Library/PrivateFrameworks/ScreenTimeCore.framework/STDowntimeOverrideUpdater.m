@implementation STDowntimeOverrideUpdater

+ (BOOL)updateActiveOverrideOnBlueprintNow:(id)a3 usingModifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a4;
  objc_msgSend(a3, "schedule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(a1, "updateActiveOverrideUsingModifier:byRecomputingFromSchedule:atDate:inCalendar:error:", v8, v9, v10, v11, a5);

  return (char)a5;
}

+ (BOOL)updateActiveOverrideUsingModifier:(id)a3 byRecomputingFromSchedule:(id)a4 atDate:(id)a5 inCalendar:(id)a6 error:(id *)a7
{
  char v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint8_t v28[16];
  uint8_t buf[16];
  uint8_t v30[16];

  v12 = a3;
  v13 = a4;
  v14 = a6;
  STUTCErasedDateFromDate(a5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "copy");

  STUTCTimeZone();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimeZone:", v17);

  objc_msgSend(v12, "activeOverride");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = objc_msgSend(v18, "modificationBasedOnScheduleChangeAtDate:", v15);
    if (v20 == 1)
    {
      +[STLog blueprint](STLog, "blueprint");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1D22E7000, v23, OS_LOG_TYPE_DEFAULT, "Updating active override", v28, 2u);
      }

      v24 = objc_msgSend(v19, "state");
      objc_msgSend(v19, "creationDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[STDowntimeOverrideBuilder createAutomaticOverrideWithState:schedule:creationDate:calendar:](STDowntimeOverrideBuilder, "createAutomaticOverrideWithState:schedule:creationDate:calendar:", v24, v13, v25, v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v12, "applyDowntimeOverride:error:", v26, a7);
    }
    else if (!v20)
    {
      +[STLog blueprint](STLog, "blueprint");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D22E7000, v21, OS_LOG_TYPE_DEFAULT, "Removing active override", buf, 2u);
      }

      v7 = objc_msgSend(v12, "removeDowntimeOverrideWithError:", a7);
    }
  }
  else
  {
    +[STLog blueprint](STLog, "blueprint");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1D22E7000, v22, OS_LOG_TYPE_DEFAULT, "No active override to modify", v30, 2u);
    }

    v7 = 1;
  }

  return v7 & 1;
}

- (STDowntimeOverrideModifier)downtimeOverrideModifier
{
  return (STDowntimeOverrideModifier *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downtimeOverrideModifier, 0);
}

@end
