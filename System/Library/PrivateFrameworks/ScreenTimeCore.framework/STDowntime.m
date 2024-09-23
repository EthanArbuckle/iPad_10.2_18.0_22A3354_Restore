@implementation STDowntime

- (void)setStartHour:(int64_t)a3 startMinute:(int64_t)a4 endHour:(int64_t)a5 endMinute:(int64_t)a6
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  STDowntime *v33;
  void *v34;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  STDowntime *v44;
  int64_t v45;
  int64_t v46;
  int64_t v47;
  int64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  uint64_t v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[STDowntime managedObjectContext](self, "managedObjectContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99D48];
  -[STDowntime calendarIdentifier](self, "calendarIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "calendarWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0CB3788]);
  v34 = v11;
  v13 = objc_msgSend(v11, "maximumRangeOfUnit:", 512);
  v37 = (void *)objc_msgSend(v12, "initWithIndexesInRange:", v13, v14);
  v15 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v33 = self;
  -[STDowntime schedule](self, "schedule");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v50 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v23 = objc_msgSend(v22, "weekday");
        if ((objc_msgSend(v15, "containsIndex:", v23) & 1) != 0)
        {
          if (v19)
            objc_msgSend(v19, "addObject:", v22);
          else
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v22, 0);
        }
        else
        {
          objc_msgSend(v37, "removeIndex:", v23);
          objc_msgSend(v15, "addIndex:", v23);
          objc_msgSend(v22, "setStartHour:", a3);
          objc_msgSend(v22, "setStartMinute:", a4);
          objc_msgSend(v22, "setEndHour:", a5);
          objc_msgSend(v22, "setEndMinute:", a6);
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __57__STDowntime_setStartHour_startMinute_endHour_endMinute___block_invoke;
  v42[3] = &unk_1E9371598;
  v24 = v32;
  v45 = a3;
  v46 = a4;
  v47 = a5;
  v48 = a6;
  v43 = v24;
  v44 = v33;
  objc_msgSend(v37, "enumerateIndexesUsingBlock:", v42);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v25 = v19;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v57, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v39 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
        +[STLog screentime](STLog, "screentime");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v54 = "-[STDowntime setStartHour:startMinute:endHour:endMinute:]";
          v55 = 2112;
          v56 = v30;
          _os_log_impl(&dword_1D22E7000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s: ScheduleToDelete (%@)", buf, 0x16u);
        }

        objc_msgSend(v24, "deleteObject:", v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v57, 16);
    }
    while (v27);
  }

}

void __57__STDowntime_setStartHour_startMinute_endHour_endMinute___block_invoke(uint64_t a1, uint64_t a2)
{
  STDailySchedule *v4;

  v4 = -[STDailySchedule initWithContext:]([STDailySchedule alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  -[STDailySchedule setWeekday:](v4, "setWeekday:", a2);
  -[STDailySchedule setStartHour:](v4, "setStartHour:", *(_QWORD *)(a1 + 48));
  -[STDailySchedule setStartMinute:](v4, "setStartMinute:", *(_QWORD *)(a1 + 56));
  -[STDailySchedule setEndHour:](v4, "setEndHour:", *(_QWORD *)(a1 + 64));
  -[STDailySchedule setEndMinute:](v4, "setEndMinute:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 40), "addScheduleObject:", v4);

}

@end
