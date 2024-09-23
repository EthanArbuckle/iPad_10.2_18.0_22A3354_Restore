@implementation REMSaveRequest

- (id)importRemindersFromICSData:(id)a3 insertIntoListChangeItem:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  unint64_t v30;
  REMSaveRequest *v31;
  id v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0x1E67F4000uLL;
  +[REMLogStore write](REMLogStore, "write");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "objectID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v51 = v13;
    _os_log_impl(&dword_1B4A39000, v12, OS_LOG_TYPE_INFO, "Importing ICS data into list change item {%@}.", buf, 0xCu);

  }
  v49 = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB820]), "initWithData:options:error:", v8, 0, &v49);
  v15 = v49;
  if (v15 || !v14)
  {
    +[REMLogStore write](REMLogStore, "write");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[REMSaveRequest(Importing) importRemindersFromICSData:insertIntoListChangeItem:error:].cold.1((uint64_t)v15, v34, v35);

    if (a5)
      *a5 = objc_retainAutorelease(v15);
  }
  else
  {
    objc_msgSend(v9, "saveRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "updateLastModifiedDates"))
      objc_msgSend(v16, "setUpdateLastModifiedDates:", 0);
    v38 = v8;
    v17 = v16;
    if (objc_msgSend(v16, "cloneCompletedRecurrentRemindersAtSave"))
      objc_msgSend(v16, "setCloneCompletedRecurrentRemindersAtSave:", 0);
    v37 = v14;
    objc_msgSend(v14, "calendar");
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "componentKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v43)
    {
      v42 = *(_QWORD *)v46;
      v39 = v16;
      v40 = v10;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v46 != v42)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v44, "componentForKey:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            objc_msgSend(*(id *)(v11 + 3888), "write");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v19;
              _os_log_impl(&dword_1B4A39000, v21, OS_LOG_TYPE_INFO, "Could not find a component with {key: %@}.", buf, 0xCu);
            }

          }
          v22 = objc_opt_class();
          REMDynamicCast(v22, (uint64_t)v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            objc_msgSend(v23, "rem_nonNilSummary");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addReminderWithTitle:toListChangeItem:", v25, v9);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            -[REMSaveRequest _populateReminderChangeItem:withICSTodoItem:icsCalendar:isNew:withOptions:](self, "_populateReminderChangeItem:withICSTodoItem:icsCalendar:isNew:withOptions:", v26, v24, v44, 1, 0);
            -[REMSaveRequest _iCalendarDataFromICSTodoItem:icsCalendar:](self, "_iCalendarDataFromICSTodoItem:icsCalendar:", v24, v44);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setImportedICSData:", v27);

            objc_msgSend(v10, "addObject:", v26);
            objc_msgSend(*(id *)(v11 + 3888), "write");
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v26, "objectID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "objectID");
              v30 = v11;
              v31 = self;
              v32 = v9;
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v51 = v29;
              v52 = 2112;
              v53 = v33;
              _os_log_impl(&dword_1B4A39000, v28, OS_LOG_TYPE_INFO, "Added ICSTodo as reminder change item into list change item {reminder: %@, list: %@}.", buf, 0x16u);

              v9 = v32;
              self = v31;
              v11 = v30;
              v17 = v39;

              v10 = v40;
            }

          }
        }
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v43);
    }

    v14 = v37;
    v8 = v38;
    v15 = 0;
  }

  return v10;
}

- (void)updateReminderChangeItem:(id)a3 fromICSTodo:(id)a4 icsCalendar:(id)a5 isNew:(BOOL)a6 withOptions:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a6;
  v17 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v14, "saveRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "updateLastModifiedDates"))
    objc_msgSend(v15, "setUpdateLastModifiedDates:", 0);
  if (objc_msgSend(v15, "cloneCompletedRecurrentRemindersAtSave"))
    objc_msgSend(v15, "setCloneCompletedRecurrentRemindersAtSave:", 0);
  -[REMSaveRequest _populateReminderChangeItem:withICSTodoItem:icsCalendar:isNew:withOptions:](self, "_populateReminderChangeItem:withICSTodoItem:icsCalendar:isNew:withOptions:", v14, v13, v12, v7, v17);
  -[REMSaveRequest _iCalendarDataFromICSTodoItem:icsCalendar:](self, "_iCalendarDataFromICSTodoItem:icsCalendar:", v13, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setImportedICSData:", v16);
}

- (BOOL)updateReminderChangeItem:(id)a3 fromICSData:(id)a4 isNew:(BOOL)a5 withOptions:(id)a6 error:(id *)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v34;
  void *v35;
  id v36;
  REMSaveRequest *v37;
  _BOOL4 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t buf[4];
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v9 = a5;
  v47 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v43 = 0;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB820]), "initWithData:options:error:", v13, 0, &v43);
  v16 = v43;
  if (v16)
    v17 = 1;
  else
    v17 = v15 == 0;
  if (v17)
  {
    +[REMLogStore write](REMLogStore, "write");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[REMSaveRequest(Importing) importRemindersFromICSData:insertIntoListChangeItem:error:].cold.1((uint64_t)v16, v18, v19);

    v20 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v16);
  }
  else
  {
    v37 = self;
    v38 = v9;
    objc_msgSend(v15, "calendar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v21, "componentKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v23)
    {
      v24 = v23;
      v34 = v16;
      v35 = v15;
      v36 = v12;
      v25 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v40 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v21, "componentForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v28)
          {
            +[REMLogStore write](REMLogStore, "write");
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v45 = v27;
              _os_log_impl(&dword_1B4A39000, v29, OS_LOG_TYPE_INFO, "Could not find a component with {key: %@}.", buf, 0xCu);
            }

          }
          v30 = objc_opt_class();
          REMDynamicCast(v30, (uint64_t)v28);
          v31 = objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v32 = (void *)v31;
            v12 = v36;
            -[REMSaveRequest updateReminderChangeItem:fromICSTodo:icsCalendar:isNew:withOptions:](v37, "updateReminderChangeItem:fromICSTodo:icsCalendar:isNew:withOptions:", v36, v31, v21, v38, v14);

            v20 = 1;
            goto LABEL_24;
          }

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
        if (v24)
          continue;
        break;
      }
      v20 = 0;
      v12 = v36;
LABEL_24:
      v16 = v34;
      v15 = v35;
    }
    else
    {
      v20 = 0;
    }

  }
  return v20;
}

- (void)updateUIDInReminderChangeItem:(id)a3 fromICSComponent:(id)a4 icsCalendar:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "recurrence_id");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "recurrence_id");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rem_dateWithICSCalendar:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "uid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    if (fabs(v13) >= 2.22044605e-16)
    {
      objc_msgSend(v8, "uid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      REMGetRecurrenceUIDFromRealUID(v14, v10);
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v15;
    }
  }
  if (v12)
  {
    +[REMLogStore write](REMLogStore, "write");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "objectID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v17;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1B4A39000, v16, OS_LOG_TYPE_INFO, "Setting ICS item UID to reminder change item {%@, uid: %@}.", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(v7, "setDaCalendarItemUniqueIdentifier:", v12);
  }

}

- (id)_iCalendarDataFromICSTodoItem:(id)a3 icsCalendar:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0DDB7D8]);
  if (v7)
  {
    objc_msgSend(v7, "setX_calendarserver_access:", objc_msgSend(v6, "x_calendarserver_access"));
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setComponents:options:", v8, 2);

    _iCalendarDataFromICSCalendar(v7, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_populateReminderChangeItem:(id)a3 withICSTodoItem:(id)a4 icsCalendar:(id)a5 isNew:(BOOL)a6 withOptions:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  REMUserActivity *v47;
  void *v48;
  REMUserActivity *v49;
  void *v50;
  REMUserActivity *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v59 = a6;
  v70 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  objc_msgSend(v12, "rem_nonNilSummary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitleAsString:", v15);

  objc_msgSend(v12, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v12, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNotesAsString:", v17);

  }
  objc_msgSend(v12, "last_modified");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(v12, "dtstamp");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v62 = v18;
  objc_msgSend(v18, "rem_dateAsUTC");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLastModifiedDate:", v19);

  objc_msgSend(v12, "created");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rem_dateAsUTC");
  v21 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setCreationDate:", v21);
  objc_msgSend(v11, "setPriority:", objc_msgSend(v12, "priority"));
  -[REMSaveRequest icsDueOrEndDateWithICSCalendarItem:options:](self, "icsDueOrEndDateWithICSCalendarItem:options:", v12, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v22;
  if (v22)
  {
    v23 = v22;
    objc_msgSend(v22, "components");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDueDateComponents:", v24);

    objc_msgSend(v13, "systemTimeZoneForDate:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dueDateComponents");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTimeZone:", v25);

  }
  else
  {
    objc_msgSend(v11, "setDueDateComponents:", 0);
  }
  v60 = v14;
  v61 = (void *)v21;
  v63 = v13;
  -[REMSaveRequest updateUIDInReminderChangeItem:fromICSComponent:icsCalendar:](self, "updateUIDInReminderChangeItem:fromICSComponent:icsCalendar:", v11, v12, v13);
  objc_msgSend(v12, "url");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v12, "url");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIcsUrl:", v28);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(v12, "components");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v66 != v33)
          objc_enumerationMutation(v30);
        v35 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v29, "addObject:", v35);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    }
    while (v32);
  }

  -[REMSaveRequest _populateAlarmsInReminderChangeItem:withICSAlarms:icsCalendar:](self, "_populateAlarmsInReminderChangeItem:withICSAlarms:icsCalendar:", v11, v29, v63);
  -[REMSaveRequest _populateRecurrencesInReminderChangeItem:withICSComponent:icsCalendar:](self, "_populateRecurrencesInReminderChangeItem:withICSComponent:icsCalendar:", v11, v12, v63);
  objc_msgSend(v12, "completed");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rem_dateAsUTC");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
  {
    if (objc_msgSend(v12, "percentComplete") == 100 || objc_msgSend(v12, "status") == 4)
    {
      if (v64)
        objc_msgSend(v64, "rem_dateWithICSCalendar:", v63);
      else
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
    }
  }
  objc_msgSend(v11, "setCompleted:", v37 != 0);
  objc_msgSend(v11, "setCompletionDate:", v37);
  objc_msgSend(v12, "x_apple_activity");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "count");

  if (v39)
  {
    v40 = objc_opt_class();
    objc_msgSend(v12, "x_apple_activity");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    REMCheckedDynamicCast(v40, (uint64_t)v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = objc_opt_class();
    objc_msgSend(v43, "value");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    REMCheckedDynamicCast(v44, (uint64_t)v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = -[REMUserActivity initWithUniversalLink:]([REMUserActivity alloc], "initWithUniversalLink:", v46);
      objc_msgSend(v11, "setUserActivity:", v47);

    }
  }
  objc_msgSend(v12, "x_apple_appLinkData");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    v49 = [REMUserActivity alloc];
    objc_msgSend(v12, "x_apple_appLinkData");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[REMUserActivity initWithUserActivityData:](v49, "initWithUserActivityData:", v50);
    objc_msgSend(v11, "setUserActivity:", v51);

  }
  v52 = objc_msgSend(v12, "x_apple_sort_order");
  if (!v52 && !v61)
  {
    +[REMLogStore write](REMLogStore, "write", 0);
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = v60;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      -[REMSaveRequest(Importing) _populateReminderChangeItem:withICSTodoItem:icsCalendar:isNew:withOptions:].cold.1(v12, v53);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "timeIntervalSinceReferenceDate");
    objc_msgSend(v11, "setIcsDisplayOrder:", (unint64_t)v56);
    goto LABEL_40;
  }
  objc_msgSend(v11, "setIcsDisplayOrder:", v52);
  v54 = v60;
  if (v59)
  {
    objc_msgSend(v11, "listChangeItem");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setRemindersICSDisplayOrderChanged:", 1);
LABEL_40:

  }
  objc_msgSend(v12, "x_apple_alternative_due_date_for_calendar");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "rem_dateAsUTC");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAlternativeDisplayDateDateForCalendarWithNormalizedDate:", v58);
}

- (id)icsDueOrEndDateWithICSCalendarItem:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "due");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_6;
  v8 = objc_opt_class();
  objc_msgSend(v6, "valueForKey:", CFSTR("ImportOptionConsiderDTENDForDueDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  REMDynamicCast(v8, (uint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "unsignedIntegerValue") != 1 || (objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_6:
    objc_msgSend(v5, "due");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v5, "performSelector:", sel_dtend);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (void)_populateAlarmsInReminderChangeItem:(id)a3 withICSAlarms:(id)a4 icsCalendar:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  REMSaveRequest *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  id v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "removeAllAlarms");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    v26 = *(_QWORD *)v29;
    v27 = v8;
    v25 = v11;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (!objc_msgSend(v16, "action"))
        {
          objc_msgSend(v16, "trigger");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "isDurationBased"))
          {

          }
          else
          {
            objc_msgSend(v16, "trigger");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "value");
            v19 = v10;
            v20 = self;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "components");
            v22 = v13;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = REMIsInvalidICSAlarmDateComponents(v23);

            v13 = v22;
            self = v20;
            v10 = v19;
            v11 = v25;
            v14 = v26;

            v8 = v27;
            if ((v24 & 1) != 0)
              continue;
          }
        }
        -[REMSaveRequest _addAlarmsToReminderChangeItem:withICSAlarm:icsCalendar:](self, "_addAlarmsToReminderChangeItem:withICSAlarm:icsCalendar:", v8, v16, v10);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }

}

- (void)_addAlarmsToReminderChangeItem:(id)a3 withICSAlarm:(id)a4 icsCalendar:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  REMAlarmTimeIntervalTrigger *v19;
  REMAlarmTimeIntervalTrigger *v20;
  void *v21;
  void *v22;
  void *v23;
  REMAlarmDateTrigger *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  __CFString *v37;
  REMStructuredLocation *v38;
  void *v39;
  REMStructuredLocation *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  void *v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t j;
  void *v77;
  void *v78;
  __CFString *v79;
  __CFString *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  uint64_t v87;
  void *v88;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  uint8_t v99[128];
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  void *v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(v8, "x_wr_alarmuid");
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  +[REMLogStore write](REMLogStore, "write");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[REMSaveRequest(Importing) _addAlarmsToReminderChangeItem:withICSAlarm:icsCalendar:].cold.3((uint64_t)v11, v7, v13);

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0DDB7F0], "makeUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMLogStore write](REMLogStore, "write");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "objectID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v101 = v11;
      v102 = 2112;
      v103 = v15;
      _os_log_impl(&dword_1B4A39000, v14, OS_LOG_TYPE_INFO, "Imported ICS alarm has no UID, generating one {alarmUID: %@, reminderID: %@}.", buf, 0x16u);

    }
  }
  objc_msgSend(v8, "trigger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isDurationBased");
  v89 = v16;
  objc_msgSend(v16, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v19 = [REMAlarmTimeIntervalTrigger alloc];
    objc_msgSend(v18, "timeInterval");
    v20 = -[REMAlarmTimeIntervalTrigger initWithTimeInterval:](v19, "initWithTimeInterval:");
    objc_msgSend(v7, "addAlarmWithTrigger:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAlarmUID:", v11);
    objc_msgSend(v10, "addObject:", v21);
  }
  else
  {
    v22 = v10;
    v20 = (REMAlarmTimeIntervalTrigger *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB800]), "initWithValue:", v18);
    -[REMAlarmTimeIntervalTrigger components](v20, "components");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemTimeZoneForDate:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTimeZone:", v23);

    if ((REMIsInvalidICSAlarmDateComponents(v21) & 1) == 0)
    {
      v24 = -[REMAlarmDateTrigger initWithDateComponents:]([REMAlarmDateTrigger alloc], "initWithDateComponents:", v21);
      objc_msgSend(v7, "addAlarmWithTrigger:", v24);
      v25 = v11;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAlarmUID:", v25);
      objc_msgSend(v22, "addObject:", v26);

      v11 = v25;
    }
    v10 = v22;
  }

  objc_msgSend(v8, "x_apple_proximity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0DDBC00]) & 1) != 0)
  {
    v28 = 1;
  }
  else if (objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0DDBC10]))
  {
    v28 = 2;
  }
  else
  {
    v28 = 0;
  }

  objc_msgSend(v8, "x_apple_proximity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0DDBC08]) & 1) != 0)
  {
    v30 = 1;
  }
  else if (objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0DDBC18]))
  {
    v30 = 2;
  }
  else
  {
    v30 = 0;
  }

  objc_msgSend(v8, "x_apple_structured_location");
  v31 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v87 = objc_claimAutoreleasedReturnValue();
  v88 = (void *)v31;
  if (v28 | v30 || v31 | v87)
  {
    if ((v28 | v30) != 0 && (v31 | v87) != 0)
    {
      if (!objc_msgSend(v10, "count"))
        goto LABEL_38;
      +[REMLogStore write](REMLogStore, "write");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "objectID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v101 = v11;
        v102 = 2112;
        v103 = v33;
        _os_log_impl(&dword_1B4A39000, v32, OS_LOG_TYPE_INFO, "Importing a Proximity/Location trigger when we have already imported a TimeInterval/Date trigger from the same ICSAlarm. So we found a concrete case that they co-exist. {alarmUID: %@, reminderID: %@}", buf, 0x16u);

      }
    }
    else
    {
      if (v31 | v87)
      {
        if (!(v28 | v30))
        {
          +[REMLogStore write](REMLogStore, "write");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            -[REMSaveRequest(Importing) _addAlarmsToReminderChangeItem:withICSAlarm:icsCalendar:].cold.1((uint64_t)v11, v7);

          v28 = 1;
          goto LABEL_39;
        }
LABEL_38:
        if (!v28)
        {
          if (v30)
            v30 = -[REMAlarmVehicleTrigger initWithEvent:]([REMAlarmVehicleTrigger alloc], "initWithEvent:", v30);
          goto LABEL_67;
        }
LABEL_39:
        v83 = v7;
        v35 = v8;
        objc_msgSend(v35, "x_apple_structured_location");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "location");
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          v85 = v9;
          v81 = v10;
          v38 = [REMStructuredLocation alloc];
          objc_msgSend(v36, "title");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[REMStructuredLocation initWithTitle:](v38, "initWithTitle:", v39);

          objc_msgSend(v36, "value");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "scheme");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "lowercaseString");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("geo"));

          v82 = v41;
          if (v44)
          {
            objc_msgSend(v41, "absoluteString");
            v45 = objc_claimAutoreleasedReturnValue();
            -[NSObject substringFromIndex:](v45, "substringFromIndex:", 4);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "rangeOfString:", CFSTR(";"));
            v79 = v37;
            if (v48)
            {
              objc_msgSend(v46, "substringToIndex:", v47);
              v49 = objc_claimAutoreleasedReturnValue();

              v46 = (void *)v49;
            }
            v9 = v85;
            v50 = v11;
            objc_msgSend(v46, "componentsSeparatedByString:", CFSTR(","), v79);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v51, "count") == 2)
            {
              objc_msgSend(v51, "objectAtIndex:", 0);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "doubleValue");
              -[REMStructuredLocation setLatitude:](v40, "setLatitude:");

              objc_msgSend(v51, "objectAtIndex:", 1);
              v53 = objc_claimAutoreleasedReturnValue();
              -[NSObject doubleValue](v53, "doubleValue");
              -[REMStructuredLocation setLongitude:](v40, "setLongitude:");
            }
            else
            {
              +[REMLogStore write](REMLogStore, "write");
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v101 = v46;
                _os_log_impl(&dword_1B4A39000, v53, OS_LOG_TYPE_INFO, "Ignoring invalid coordinates when converting location from ICS: %@", buf, 0xCu);
              }
            }

            v11 = v50;
            v37 = v80;
          }
          else
          {
            +[REMLogStore write](REMLogStore, "write");
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v101 = v41;
              _os_log_impl(&dword_1B4A39000, v45, OS_LOG_TYPE_INFO, "Ignoring unexpected location URL scheme when converting location from ICS: %@.", buf, 0xCu);
            }
            v9 = v85;
          }

          objc_msgSend(v36, "parameterValueForName:", CFSTR("X-APPLE-RADIUS"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v54)
          {
            objc_msgSend(v36, "parameterValueForName:", CFSTR("X-Apple-Radius"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v54, "doubleValue");
          -[REMStructuredLocation setRadius:](v40, "setRadius:");
          objc_msgSend(v36, "address");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMStructuredLocation setAddress:](v40, "setAddress:", v55);

          objc_msgSend(v36, "routing");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMStructuredLocation setRouting:](v40, "setRouting:", v56);

          objc_msgSend(v36, "parameterValueForName:", CFSTR("X-APPLE-REFERENCEFRAME"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (v57)
            -[REMStructuredLocation setReferenceFrameString:](v40, "setReferenceFrameString:", v57);
          objc_msgSend(v36, "parameterValueForName:", CFSTR("X-APPLE-ABUID"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (v58
            || (objc_msgSend(v36, "parameterValueForName:", CFSTR("X-Apple-ABUID")),
                (v58 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[REMStructuredLocation setContactLabel:](v40, "setContactLabel:", v58);

          }
          objc_msgSend(v36, "mapKitHandle");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (v59)
            -[REMStructuredLocation setMapKitHandle:](v40, "setMapKitHandle:", v59);

          v10 = v81;
        }
        else
        {
          if (!v37)
            v37 = &stru_1E67FB1F0;
          v40 = -[REMStructuredLocation initWithTitle:]([REMStructuredLocation alloc], "initWithTitle:", v37);
        }

        v30 = -[REMAlarmLocationTrigger initWithStructuredLocation:proximity:]([REMAlarmLocationTrigger alloc], "initWithStructuredLocation:proximity:", v40, v28);
        v7 = v83;
LABEL_67:
        objc_msgSend(v7, "addAlarmWithTrigger:", v30);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setAlarmUID:", v11);
        objc_msgSend(v10, "addObject:", v60);

        goto LABEL_68;
      }
      +[REMLogStore write](REMLogStore, "write");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[REMSaveRequest(Importing) _addAlarmsToReminderChangeItem:withICSAlarm:icsCalendar:].cold.2((uint64_t)v11, v7);
    }

    goto LABEL_38;
  }
LABEL_68:
  objc_msgSend(v8, "acknowledged");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend(v8, "acknowledged");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB800]), "initWithValue:", v62);
    objc_msgSend(v63, "rem_dateWithICSCalendar:", v9);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v64 = 0;
  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v65 = v10;
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v67; ++i)
      {
        if (*(_QWORD *)v95 != v68)
          objc_enumerationMutation(v65);
        objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "setAcknowledgedDate:", v64);
      }
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
    }
    while (v67);
  }

  objc_msgSend(v8, "relatedTo");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    v84 = v11;
    v86 = v9;
    v71 = v7;
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v72 = v65;
    v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
    if (v73)
    {
      v74 = v73;
      v75 = *(_QWORD *)v91;
      do
      {
        for (j = 0; j != v74; ++j)
        {
          if (*(_QWORD *)v91 != v75)
            objc_enumerationMutation(v72);
          v77 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
          objc_msgSend(v8, "relatedTo");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setOriginalAlarmUID:", v78);

        }
        v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
      }
      while (v74);
    }

    v7 = v71;
    v11 = v84;
    v9 = v86;
  }

}

- (void)_populateRecurrencesInReminderChangeItem:(id)a3 withICSComponent:(id)a4 icsCalendar:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id obj;
  void *v53;
  id v54;
  REMRecurrenceRule *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  uint64_t v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "removeAllRecurrenceRules");
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v49 = v7;
  objc_msgSend(v7, "rrule");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v70;
    v50 = *(_QWORD *)v70;
    do
    {
      v11 = 0;
      v51 = v9;
      do
      {
        if (*(_QWORD *)v70 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_37;
        objc_msgSend(v6, "accountID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectID");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v12;
        v65 = v13;
        v15 = objc_msgSend(v14, "freq");
        v16 = v15;
        v17 = 0;
        switch(v15)
        {
          case 1:
          case 2:
          case 3:
            +[REMLogStore write](REMLogStore, "write");
            v18 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              goto LABEL_11;
            *(_DWORD *)buf = 67109120;
            LODWORD(v79) = v16;
            v19 = v18;
            v20 = "Encountered an ICS frequency that we don't handle: %d. Defaulting to daily";
            goto LABEL_46;
          case 4:
            break;
          case 5:
            v17 = 1;
            break;
          case 6:
            v17 = 2;
            break;
          case 7:
            v17 = 3;
            break;
          default:
            +[REMLogStore write](REMLogStore, "write");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v79) = v16;
              v19 = v18;
              v20 = "Encountered an unknown ICS frequency: %d";
LABEL_46:
              _os_log_error_impl(&dword_1B4A39000, v19, OS_LOG_TYPE_ERROR, v20, buf, 8u);
            }
LABEL_11:

            v17 = 0;
            break;
        }
        objc_msgSend(v14, "interval");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "integerValue");

        objc_msgSend(v14, "wkst");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
          v60 = REMWeekdayFromICSWeekday(objc_msgSend(v23, "integerValue"));
        else
          v60 = 0;
        objc_msgSend(v14, "until");
        v25 = objc_claimAutoreleasedReturnValue();
        v62 = v17;
        v63 = v24;
        if (v25)
        {
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDB800]), "initWithValue:", v25);
          objc_msgSend(v26, "rem_dateAsUTC");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(v27, "dateByAddingTimeInterval:", 86399.0);
            v28 = objc_claimAutoreleasedReturnValue();

            v27 = (void *)v28;
          }
          +[REMRecurrenceEnd recurrenceEndWithEndDate:](REMRecurrenceEnd, "recurrenceEndWithEndDate:", v27);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_21;
        }
        objc_msgSend(v14, "count");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_msgSend(v14, "count");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[REMRecurrenceEnd recurrenceEndWithOccurrenceCount:](REMRecurrenceEnd, "recurrenceEndWithOccurrenceCount:", objc_msgSend(v26, "unsignedIntegerValue"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

          goto LABEL_22;
        }
        v59 = 0;
LABEL_22:
        v61 = (void *)v25;
        v66 = v12;
        v64 = v14;
        objc_msgSend(v14, "byday");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v11;
        v58 = v30;
        if (objc_msgSend(v30, "count"))
        {
          v56 = v22;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v30, "count"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v32 = v30;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v73, buf, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v74;
            do
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v74 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
                v38 = REMWeekdayFromICSWeekday(objc_msgSend(v37, "weekday"));
                objc_msgSend(v37, "number");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                +[REMRecurrenceDayOfWeek dayOfWeek:weekNumber:](REMRecurrenceDayOfWeek, "dayOfWeek:weekNumber:", v38, objc_msgSend(v39, "integerValue"));
                v40 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v31, "addObject:", v40);
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v73, buf, 16);
            }
            while (v34);
          }

          v22 = v56;
        }
        else
        {
          v31 = 0;
        }
        if (v22 <= 1)
          v41 = 1;
        else
          v41 = v22;
        v57 = v41;
        v54 = +[REMRecurrenceRule newObjectID](REMRecurrenceRule, "newObjectID");
        v55 = [REMRecurrenceRule alloc];
        objc_msgSend(v64, "bymonthday");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "bymonth");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "byweekno");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "byyearday");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "bysetpos");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[REMRecurrenceRule initRecurrenceRuleWithObjectID:accountID:reminderID:frequency:interval:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](v55, "initRecurrenceRuleWithObjectID:accountID:reminderID:frequency:interval:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v54, v65, v68, v62, v57, v60, v31, v53, v42, v43, v44, v45, v59);

        v10 = v50;
        v9 = v51;
        v12 = v66;
        v11 = v67;
        if (v46)
        {
          objc_msgSend(v6, "addRecurrenceRule:", v46);
          goto LABEL_39;
        }
LABEL_37:
        +[REMLogStore write](REMLogStore, "write");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "objectID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v79 = v12;
          v80 = 2112;
          v81 = v47;
          _os_log_error_impl(&dword_1B4A39000, v46, OS_LOG_TYPE_ERROR, "Couldn't populate the recurrence rule {icsRecurrence: %@, reminderID: %@}", buf, 0x16u);

        }
LABEL_39:

        ++v11;
      }
      while (v11 != v9);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
      v9 = v48;
    }
    while (v48);
  }

}

- (REMSaveRequest)initWithStore:(id)a3
{
  id v5;
  REMSaveRequest *v6;
  REMSaveRequest *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *trackedAccountChangeItems;
  NSMutableDictionary *v10;
  NSMutableDictionary *trackedListChangeItems;
  NSMutableDictionary *v12;
  NSMutableDictionary *trackedSmartListChangeItems;
  NSMutableDictionary *v14;
  NSMutableDictionary *trackedTemplateChangeItems;
  NSMutableDictionary *v16;
  NSMutableDictionary *trackedReminderChangeItems;
  NSMutableDictionary *v18;
  NSMutableDictionary *trackedAccountCapabilities;
  NSMutableDictionary *v20;
  NSMutableDictionary *trackedListSectionChangeItems;
  NSMutableDictionary *v22;
  NSMutableDictionary *trackedSmartListSectionChangeItems;
  NSMutableDictionary *v24;
  NSMutableDictionary *trackedTemplateSectionChangeItems;
  NSMutableSet *v26;
  NSMutableSet *saveRequestChangeEvents;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  uint64_t v31;
  REMReplicaManagerProviding *replicaManagerProvider;
  NSObject *v33;
  _REMDefaultReplicaManagerProvider *v34;
  REMReplicaManagerProviding *v35;
  uint8_t buf[16];
  objc_super v38;

  v5 = a3;
  if (!v5)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "store");
  v38.receiver = self;
  v38.super_class = (Class)REMSaveRequest;
  v6 = -[REMSaveRequest init](&v38, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedAccountChangeItems = v7->_trackedAccountChangeItems;
    v7->_trackedAccountChangeItems = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedListChangeItems = v7->_trackedListChangeItems;
    v7->_trackedListChangeItems = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedSmartListChangeItems = v7->_trackedSmartListChangeItems;
    v7->_trackedSmartListChangeItems = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedTemplateChangeItems = v7->_trackedTemplateChangeItems;
    v7->_trackedTemplateChangeItems = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedReminderChangeItems = v7->_trackedReminderChangeItems;
    v7->_trackedReminderChangeItems = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedAccountCapabilities = v7->_trackedAccountCapabilities;
    v7->_trackedAccountCapabilities = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedListSectionChangeItems = v7->_trackedListSectionChangeItems;
    v7->_trackedListSectionChangeItems = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedSmartListSectionChangeItems = v7->_trackedSmartListSectionChangeItems;
    v7->_trackedSmartListSectionChangeItems = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trackedTemplateSectionChangeItems = v7->_trackedTemplateSectionChangeItems;
    v7->_trackedTemplateSectionChangeItems = v24;

    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    saveRequestChangeEvents = v7->_saveRequestChangeEvents;
    v7->_saveRequestChangeEvents = v26;

    *(_WORD *)&v7->_updateLastModifiedDates = 1;
    v7->_cloneCompletedRecurrentRemindersAtSave = 1;
    v7->_syncToCloudKit = 1;
    switch(objc_msgSend(v5, "mode"))
    {
      case 1:
        +[REMLogStore write](REMLogStore, "write");
        v28 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          goto LABEL_13;
        *(_WORD *)buf = 0;
        v29 = "Creating saveRequest in migration mode";
        goto LABEL_12;
      case 2:
        +[REMLogStore write](REMLogStore, "write");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4A39000, v30, OS_LOG_TYPE_INFO, "Creating saveRequest in CalDAV-Sync mode", buf, 2u);
        }

        *(_WORD *)&v7->_cloneCompletedRecurrentRemindersAtSave = 256;
        v7->_updateLastModifiedDates = 0;
        objc_msgSend(v5, "replicaManagerProviderForCalDAVSync");
        v31 = objc_claimAutoreleasedReturnValue();
        replicaManagerProvider = v7->_replicaManagerProvider;
        v7->_replicaManagerProvider = (REMReplicaManagerProviding *)v31;

        break;
      case 3:
        +[REMLogStore write](REMLogStore, "write");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v29 = "Creating saveRequest in EventKitSync mode";
LABEL_12:
          _os_log_impl(&dword_1B4A39000, v28, OS_LOG_TYPE_INFO, v29, buf, 2u);
        }
LABEL_13:

        *(_WORD *)&v7->_cloneCompletedRecurrentRemindersAtSave = 256;
        goto LABEL_17;
      case 4:
        +[REMLogStore write](REMLogStore, "write");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4A39000, v33, OS_LOG_TYPE_INFO, "Creating saveRequest in AccountDataMoving mode", buf, 2u);
        }

        v7->_cloneCompletedRecurrentRemindersAtSave = 0;
LABEL_17:
        v7->_updateLastModifiedDates = 0;
        break;
      default:
        break;
    }
    if (!v7->_replicaManagerProvider)
    {
      v34 = -[_REMDefaultReplicaManagerProvider initWithStore:]([_REMDefaultReplicaManagerProvider alloc], "initWithStore:", v5);
      v35 = v7->_replicaManagerProvider;
      v7->_replicaManagerProvider = (REMReplicaManagerProviding *)v34;

    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v19 = (void *)MEMORY[0x1E0CB3940];
  v18 = objc_opt_class();
  -[REMSaveRequest trackedAccountChangeItems](self, "trackedAccountChangeItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v21, "count");
  -[REMSaveRequest trackedListChangeItems](self, "trackedListChangeItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v20, "count");
  -[REMSaveRequest trackedSmartListChangeItems](self, "trackedSmartListChangeItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v17, "count");
  -[REMSaveRequest trackedTemplateChangeItems](self, "trackedTemplateChangeItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[REMSaveRequest trackedReminderChangeItems](self, "trackedReminderChangeItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[REMSaveRequest trackedListSectionChangeItems](self, "trackedListSectionChangeItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[REMSaveRequest trackedSmartListSectionChangeItems](self, "trackedSmartListSectionChangeItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  -[REMSaveRequest trackedTemplateSectionChangeItems](self, "trackedTemplateSectionChangeItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p acounts.count: %ld, lists.count: %ld, smartLists.count: %ld, templates.count: %ld, reminders.count: %ld, listSections.count: %ld>, smartListSections.count: %ld, templateSections.count: %ld>"), v18, self, v16, v15, v14, v4, v6, v8, v10, objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)updateAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  REMAccountChangeItem *v8;
  REMAccountChangeItem *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[REMSaveRequest _trackedAccountChangeItemForObjectID:](self, "_trackedAccountChangeItemForObjectID:", v7);
        v8 = (REMAccountChangeItem *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v9 = [REMAccountChangeItem alloc];
          objc_msgSend(v5, "capabilities");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[REMAccountChangeItem initWithSaveRequest:storage:capabilities:observeInitialValues:](v9, "initWithSaveRequest:storage:capabilities:observeInitialValues:", self, v6, v10, 0);

          -[REMSaveRequest _trackAccountChangeItem:](self, "_trackAccountChangeItem:", v8);
        }
      }
      else
      {
        +[REMLogStore write](REMLogStore, "write");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

        NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
        v8 = 0;
      }

    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[REMSaveRequest updateAccount:].cold.2();

      NSLog(CFSTR("'%s' is unexpectedly nil"), "accountStorage");
      v8 = 0;
    }

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest updateAccount:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "account");
    v8 = 0;
  }

  return v8;
}

- (id)_updateAccountWithListChangeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "parentAccountID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[REMSaveRequest _trackedAccountChangeItemForObjectID:](self, "_trackedAccountChangeItemForObjectID:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Assertion Failure. Missing REMAccountChangeItem associated with REMListChangeItem. {listChangeItem: %@}"), v5);
    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[REMSaveRequest _updateAccountWithListChangeItem:].cold.2();

      NSLog(CFSTR("'%s' is unexpectedly nil"), "accountObjectID");
      v7 = 0;
    }

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _updateAccountWithListChangeItem:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "listChangeItem");
    v7 = 0;
  }

  return v7;
}

- (id)addGroupWithName:(id)a3 toAccountGroupContextChangeItem:(id)a4 groupObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  REMSaveRequest *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  REMListChangeItem *v16;
  NSObject *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      if (!v10)
        v10 = +[REMList newObjectID](REMList, "newObjectID");
      objc_msgSend(v9, "accountChangeItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "saveRequest");
      v12 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

      if (v12 != self)
      {
        v13 = (void *)MEMORY[0x1E0C99DA0];
        v14 = *MEMORY[0x1E0C99768];
        objc_msgSend(v11, "saveRequest");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "raise:format:", v14, CFSTR("accountChangeItem (%@) has incorrect saveRequest (%@). Expected %@"), v11, v15, self);

      }
      v16 = -[REMListChangeItem initWithObjectID:name:insertIntoAccountChangeItem:isGroup:]([REMListChangeItem alloc], "initWithObjectID:name:insertIntoAccountChangeItem:isGroup:", v10, v8, v11, 1);
      -[REMSaveRequest _trackListChangeItem:](self, "_trackListChangeItem:", v16);

      goto LABEL_12;
    }
  }
  else
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "name");
    if (v9)
      goto LABEL_3;
  }
  +[REMLogStore write](REMLogStore, "write");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest addGroupWithName:toAccountGroupContextChangeItem:groupObjectID:].cold.1();

  NSLog(CFSTR("'%s' is unexpectedly nil"), "accountGroupContextChangeItem");
  v16 = 0;
LABEL_12:

  return v16;
}

- (id)addGroupWithName:(id)a3 toAccountGroupContextChangeItem:(id)a4
{
  return -[REMSaveRequest addGroupWithName:toAccountGroupContextChangeItem:groupObjectID:](self, "addGroupWithName:toAccountGroupContextChangeItem:groupObjectID:", a3, a4, 0);
}

- (id)addListWithName:(id)a3 toAccountChangeItem:(id)a4 listObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  REMSaveRequest *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  REMListChangeItem *v15;
  NSObject *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      objc_msgSend(v9, "saveRequest");
      v11 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

      if (v11 != self)
      {
        v12 = (void *)MEMORY[0x1E0C99DA0];
        v13 = *MEMORY[0x1E0C99768];
        objc_msgSend(v9, "saveRequest");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "raise:format:", v13, CFSTR("accountChangeItem (%@) has incorrect saveRequest (%@). Expected %@"), v9, v14, self);

      }
      if (!v10)
        v10 = +[REMList newObjectID](REMList, "newObjectID");
      v15 = -[REMListChangeItem initWithObjectID:name:insertIntoAccountChangeItem:]([REMListChangeItem alloc], "initWithObjectID:name:insertIntoAccountChangeItem:", v10, v8, v9);
      -[REMSaveRequest _trackListChangeItem:](self, "_trackListChangeItem:", v15);
      goto LABEL_12;
    }
  }
  else
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "name");
    if (v9)
      goto LABEL_3;
  }
  +[REMLogStore write](REMLogStore, "write");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest addListWithName:toAccountChangeItem:listObjectID:].cold.1();

  NSLog(CFSTR("'%s' is unexpectedly nil"), "accountChangeItem");
  v15 = 0;
LABEL_12:

  return v15;
}

- (id)addListWithName:(id)a3 toAccountChangeItem:(id)a4
{
  return -[REMSaveRequest addListWithName:toAccountChangeItem:listObjectID:](self, "addListWithName:toAccountChangeItem:listObjectID:", a3, a4, 0);
}

- (id)addListWithName:(id)a3 toListSublistContextChangeItem:(id)a4 listObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  REMSaveRequest *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  REMListChangeItem *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
LABEL_8:
    NSLog(CFSTR("'%s' is unexpectedly nil"), "listSublistContextChangeItem");
    if (v10)
      goto LABEL_4;
    goto LABEL_9;
  }
  NSLog(CFSTR("'%s' is unexpectedly nil"), "name");
  if (!v9)
    goto LABEL_8;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_9:
  v10 = +[REMList newObjectID](REMList, "newObjectID");
LABEL_4:
  objc_msgSend(v9, "listChangeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saveRequest");
  v12 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

  if (v12 != self)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    objc_msgSend(v11, "saveRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", v14, CFSTR("listSublistContextChangeItem (%@) has incorrect saveRequest (%@). Expected %@"), v9, v15, self);

  }
  v16 = -[REMListChangeItem initWithObjectID:name:insertIntoListSublistContextChangeItem:]([REMListChangeItem alloc], "initWithObjectID:name:insertIntoListSublistContextChangeItem:", v10, v8, v9);
  -[REMSaveRequest _trackListChangeItem:](self, "_trackListChangeItem:", v16);

  return v16;
}

- (id)addListWithName:(id)a3 toListSublistContextChangeItem:(id)a4
{
  return -[REMSaveRequest addListWithName:toListSublistContextChangeItem:listObjectID:](self, "addListWithName:toListSublistContextChangeItem:listObjectID:", a3, a4, 0);
}

- (id)addListUsingTemplate:(id)a3 toAccountChangeItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "templatesContextChangeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[REMLogStore write](REMLogStore, "write");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[REMSaveRequest addListUsingTemplate:toAccountChangeItem:].cold.2(v6);

    }
    objc_msgSend(v6, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    -[REMSaveRequest addListWithName:toAccountChangeItem:listObjectID:](self, "addListWithName:toAccountChangeItem:listObjectID:", v11, v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "color");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColor:", v13);

    objc_msgSend(v6, "badgeEmblem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBadgeEmblem:", v14);

    objc_msgSend(v12, "setShowingLargeAttachments:", objc_msgSend(v6, "showingLargeAttachments"));
    objc_msgSend(v6, "sortingStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSortingStyle:", v15);

    objc_msgSend(v6, "objectID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTemplateID:", v16);

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[REMSaveRequest addListUsingTemplate:toAccountChangeItem:].cold.1(v7);
    v12 = 0;
  }

  return v12;
}

- (id)addListUsingPublicTemplateWithREMListRepresentation:(id)a3 toAccountChangeItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "templatesContextChangeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[REMLogStore write](REMLogStore, "write");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[REMSaveRequest addListUsingPublicTemplateWithREMListRepresentation:toAccountChangeItem:].cold.2(v6);

    }
    objc_msgSend(v6, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    -[REMSaveRequest addListWithName:toAccountChangeItem:listObjectID:](self, "addListWithName:toAccountChangeItem:listObjectID:", v11, v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "color");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColor:", v13);

    objc_msgSend(v6, "badgeEmblem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBadgeEmblem:", v14);

    objc_msgSend(v12, "setShowingLargeAttachments:", objc_msgSend(v6, "showingLargeAttachments"));
    objc_msgSend(v6, "sortingStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSortingStyle:", v15);

    objc_msgSend(v6, "objectID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTemplateID:", v16);

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[REMSaveRequest addListUsingPublicTemplateWithREMListRepresentation:toAccountChangeItem:].cold.1(v7);
    v12 = 0;
  }

  return v12;
}

- (id)updateList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "account");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[REMSaveRequest updateAccount:](self, "updateAccount:", v7);

      objc_msgSend(v5, "parentList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = -[REMSaveRequest updateList:](self, "updateList:", v9);
      objc_msgSend(v5, "storage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "capabilities");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSaveRequest _updateListStorage:accountCapabilities:](self, "_updateListStorage:accountCapabilities:", v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[REMSaveRequest updateList:].cold.2();

      NSLog(CFSTR("'%s' is unexpectedly nil"), "listStorage");
      v14 = 0;
    }

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest updateList:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "list");
    v14 = 0;
  }

  return v14;
}

- (id)_updateListStorage:(id)a3 accountCapabilities:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  REMListChangeItem *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest updateList:].cold.2();

    v12 = "listStorage";
    goto LABEL_12;
  }
  if (!v7)
  {
    +[REMLogStore write](REMLogStore, "write");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _updateListStorage:accountCapabilities:].cold.2();

    v12 = "accountCapabilities";
LABEL_12:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v12);
    v10 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v6, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[REMSaveRequest _trackedListChangeItemForObjectID:](self, "_trackedListChangeItemForObjectID:", v9);
    v10 = (REMListChangeItem *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v10 = -[REMListChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:]([REMListChangeItem alloc], "initWithSaveRequest:storage:accountCapabilities:observeInitialValues:", self, v6, v8, 0);
      -[REMSaveRequest _trackListChangeItem:](self, "_trackListChangeItem:", v10);
    }
  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
    v10 = 0;
  }

LABEL_17:
  return v10;
}

- (id)_updateListWithReminderChangeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[REMLogStore write](REMLogStore, "write");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _updateListWithReminderChangeItem:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "reminderChangeItem");
LABEL_12:
    v8 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v4, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _updateListWithReminderChangeItem:].cold.2();

    objc_msgSend(v5, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      NSLog(CFSTR("'%s' is unexpectedly nil"), "reminderChangeItem.storage");
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  objc_msgSend(v5, "listID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[REMSaveRequest _trackedListChangeItemForObjectID:](self, "_trackedListChangeItemForObjectID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Assertion Failure. Missing REMListChangeItem associated with REMReminderChangeItem. {reminderChangeItem: %@}"), v5);
  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionsWithListObjectID:error:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "listObjectID");
    v8 = 0;
  }

LABEL_17:
  return v8;
}

- (id)addCustomSmartListWithName:(id)a3 toAccountChangeItem:(id)a4 smartListObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  REMSaveRequest *v11;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  REMSmartListChangeItem *v23;
  void *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      objc_msgSend(v9, "saveRequest");
      v11 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

      v12 = (uint64_t *)MEMORY[0x1E0C99768];
      if (v11 != self)
      {
        v13 = (void *)MEMORY[0x1E0C99DA0];
        v14 = *MEMORY[0x1E0C99768];
        objc_msgSend(v9, "saveRequest");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "raise:format:", v14, CFSTR("accountChangeItem (%@) has incorrect saveRequest (%@). Expected %@"), v9, v15, self);

      }
      objc_msgSend(v9, "capabilities");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "supportsCustomSmartLists");

      if ((v17 & 1) == 0)
      {
        v18 = (void *)MEMORY[0x1E0C99DA0];
        v19 = *v12;
        objc_msgSend(v9, "objectID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "raise:format:", v19, CFSTR("Cannot add CSL because the given accountChangeItem does not support it {accountID: %@}"), v20);

      }
      if (v10)
        v21 = v10;
      else
        v21 = +[REMSmartList newObjectID](REMSmartList, "newObjectID");
      v24 = v21;
      v23 = -[REMSmartListChangeItem initWithCustomSmartListObjectID:insertIntoAccountChangeItem:]([REMSmartListChangeItem alloc], "initWithCustomSmartListObjectID:insertIntoAccountChangeItem:", v21, v9);
      -[REMSaveRequest _trackSmartListChangeItem:](self, "_trackSmartListChangeItem:", v23);
      -[REMSmartListChangeItem setName:](v23, "setName:", v8);

      goto LABEL_15;
    }
  }
  else
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "name");
    if (v9)
      goto LABEL_3;
  }
  +[REMLogStore write](REMLogStore, "write");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest addListWithName:toAccountChangeItem:listObjectID:].cold.1();

  NSLog(CFSTR("'%s' is unexpectedly nil"), "accountChangeItem");
  v23 = 0;
LABEL_15:

  return v23;
}

- (id)updateSmartList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  REMSmartListChangeItem *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[REMSaveRequest _trackedSmartListChangeItemForObjectID:](self, "_trackedSmartListChangeItemForObjectID:", v8);
        v9 = (REMSmartListChangeItem *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v9 = -[REMSmartListChangeItem initWithSaveRequest:storage:observeInitialValues:]([REMSmartListChangeItem alloc], "initWithSaveRequest:storage:observeInitialValues:", self, v7, objc_msgSend(v5, "isPersisted") ^ 1);
          -[REMSaveRequest _trackSmartListChangeItem:](self, "_trackSmartListChangeItem:", v9);
        }
      }
      else
      {
        +[REMLogStore write](REMLogStore, "write");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

        NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
        v9 = 0;
      }

    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[REMSaveRequest updateSmartList:].cold.2();

      NSLog(CFSTR("'%s' is unexpectedly nil"), "smartListStorage");
      v9 = 0;
    }

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest updateSmartList:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "smartList");
    v9 = 0;
  }

  return v9;
}

- (id)addTemplateWithName:(id)a3 configuration:(id)a4 toAccountChangeItem:(id)a5 templateObjectID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  REMSaveRequest *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  REMTemplateChangeItem *v18;
  NSObject *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    NSLog(CFSTR("'%s' is unexpectedly nil"), "configuration");
    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  NSLog(CFSTR("'%s' is unexpectedly nil"), "name");
  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
  {
LABEL_4:
    objc_msgSend(v12, "saveRequest");
    v14 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

    if (v14 != self)
    {
      v15 = (void *)MEMORY[0x1E0C99DA0];
      v16 = *MEMORY[0x1E0C99768];
      objc_msgSend(v12, "saveRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "raise:format:", v16, CFSTR("accountChangeItem (%@) has incorrect saveRequest (%@). Expected %@"), v12, v17, self);

    }
    v18 = -[REMTemplateChangeItem initWithObjectID:name:configuration:insertIntoAccountChangeItem:]([REMTemplateChangeItem alloc], "initWithObjectID:name:configuration:insertIntoAccountChangeItem:", v13, v10, v11, v12);
    -[REMSaveRequest _trackTemplateChangeItem:](self, "_trackTemplateChangeItem:", v18);
    goto LABEL_12;
  }
LABEL_9:
  +[REMLogStore write](REMLogStore, "write");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest addListWithName:toAccountChangeItem:listObjectID:].cold.1();

  NSLog(CFSTR("'%s' is unexpectedly nil"), "accountChangeItem");
  v18 = 0;
LABEL_12:

  return v18;
}

- (id)addTemplateWithName:(id)a3 configuration:(id)a4 toAccountChangeItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = +[REMTemplate newObjectID](REMTemplate, "newObjectID");
  -[REMSaveRequest addTemplateWithName:configuration:toAccountChangeItem:templateObjectID:](self, "addTemplateWithName:configuration:toAccountChangeItem:templateObjectID:", v10, v9, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)updateTemplate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  REMTemplateChangeItem *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[REMSaveRequest _trackedTemplateChangeItemForObjectID:](self, "_trackedTemplateChangeItemForObjectID:", v8);
        v9 = (REMTemplateChangeItem *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v9 = -[REMTemplateChangeItem initWithSaveRequest:storage:observeInitialValues:]([REMTemplateChangeItem alloc], "initWithSaveRequest:storage:observeInitialValues:", self, v7, objc_msgSend(v5, "isPersisted") ^ 1);
          -[REMSaveRequest _trackTemplateChangeItem:](self, "_trackTemplateChangeItem:", v9);
        }
      }
      else
      {
        +[REMLogStore write](REMLogStore, "write");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

        NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
        v9 = 0;
      }

    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[REMSaveRequest updateTemplate:].cold.2();

      NSLog(CFSTR("'%s' is unexpectedly nil"), "templateStorage");
      v9 = 0;
    }

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest updateTemplate:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "remTemplate");
    v9 = 0;
  }

  return v9;
}

- (id)addReminderWithTitle:(id)a3 toListChangeItem:(id)a4 reminderObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  id v19;
  void *v20;
  char v21;
  REMSaveRequest *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  REMReminderChangeItem *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "title");
    if (v9)
      goto LABEL_3;
  }
  NSLog(CFSTR("'%s' is unexpectedly nil"), "listChangeItem");
LABEL_3:
  objc_msgSend(v9, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMTemplate cdEntityName](REMTemplate, "cdEntityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v10)
  {
    objc_msgSend(v10, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      +[REMTemplate cdEntityNameForSavedReminder](REMTemplate, "cdEntityNameForSavedReminder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if ((v17 & 1) != 0)
        goto LABEL_18;
      +[REMLogStore write](REMLogStore, "write");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[REMSaveRequest addReminderWithTitle:toListChangeItem:reminderObjectID:].cold.1();
    }
    else
    {
      +[REMReminder cdEntityName](REMReminder, "cdEntityName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v15, "isEqualToString:", v20);

      if ((v21 & 1) != 0)
        goto LABEL_18;
      +[REMLogStore write](REMLogStore, "write");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[REMSaveRequest addReminderWithTitle:toListChangeItem:reminderObjectID:].cold.2();
    }

  }
  else
  {
    if (v14)
      v19 = +[REMTemplate newObjectIDForSavedReminder](REMTemplate, "newObjectIDForSavedReminder");
    else
      v19 = +[REMReminder newObjectID](REMReminder, "newObjectID");
    v10 = v19;
  }
LABEL_18:
  objc_msgSend(v9, "saveRequest");
  v22 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

  v23 = (_QWORD *)MEMORY[0x1E0C99768];
  if (v22 != self)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99768];
    objc_msgSend(v9, "saveRequest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "raise:format:", v25, CFSTR("listChangeItem (%@) has incorrect saveRequest (%@). Expected %@"), v9, v26, self);

  }
  if (objc_msgSend(v9, "isGroup"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v23, CFSTR("listChangeItem is a group and adding reminder to group is not currently supported {listChangeItem: %@}"), v9);
  v27 = -[REMReminderChangeItem initWithObjectID:title:insertIntoListChangeItem:]([REMReminderChangeItem alloc], "initWithObjectID:title:insertIntoListChangeItem:", v10, v8, v9);
  -[REMSaveRequest _trackReminderChangeItem:](self, "_trackReminderChangeItem:", v27);

  return v27;
}

- (id)addReminderWithTitle:(id)a3 toListChangeItem:(id)a4
{
  return -[REMSaveRequest addReminderWithTitle:toListChangeItem:reminderObjectID:](self, "addReminderWithTitle:toListChangeItem:reminderObjectID:", a3, a4, 0);
}

- (id)addReminderWithTitle:(id)a3 toReminderSubtaskContextChangeItem:(id)a4 reminderObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  REMSaveRequest *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  REMReminderChangeItem *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "title");
    if (v9)
      goto LABEL_3;
  }
  NSLog(CFSTR("'%s' is unexpectedly nil"), "parentReminderSubtaskContextChangeItem");
LABEL_3:
  objc_msgSend(v9, "reminderChangeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMTemplate cdEntityNameForSavedReminder](REMTemplate, "cdEntityNameForSavedReminder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if (!v10)
  {
    if (v15)
      v20 = +[REMTemplate newObjectIDForSavedReminder](REMTemplate, "newObjectIDForSavedReminder");
    else
      v20 = +[REMReminder newObjectID](REMReminder, "newObjectID");
    v10 = v20;
    goto LABEL_18;
  }
  objc_msgSend(v10, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[REMTemplate cdEntityNameForSavedReminder](REMTemplate, "cdEntityNameForSavedReminder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToString:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_18;
    +[REMLogStore write](REMLogStore, "write");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest addReminderWithTitle:toReminderSubtaskContextChangeItem:reminderObjectID:].cold.1();
  }
  else
  {
    +[REMReminder cdEntityName](REMReminder, "cdEntityName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v16, "isEqualToString:", v21);

    if ((v22 & 1) != 0)
      goto LABEL_18;
    +[REMLogStore write](REMLogStore, "write");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest addReminderWithTitle:toReminderSubtaskContextChangeItem:reminderObjectID:].cold.2();
  }

LABEL_18:
  objc_msgSend(v9, "reminderChangeItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "saveRequest");
  v24 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

  if (v24 != self)
  {
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = *MEMORY[0x1E0C99768];
    objc_msgSend(v23, "saveRequest");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "raise:format:", v26, CFSTR("parentReminderChangeItem (%@) has incorrect saveRequest (%@). Expected %@"), v23, v27, self);

  }
  v28 = -[REMReminderChangeItem initWithObjectID:title:insertIntoParentReminderSubtaskContextChangeItem:]([REMReminderChangeItem alloc], "initWithObjectID:title:insertIntoParentReminderSubtaskContextChangeItem:", v10, v8, v9);
  -[REMSaveRequest _trackReminderChangeItem:](self, "_trackReminderChangeItem:", v28);

  return v28;
}

- (id)addReminderWithTitle:(id)a3 toReminderSubtaskContextChangeItem:(id)a4
{
  return -[REMSaveRequest addReminderWithTitle:toReminderSubtaskContextChangeItem:reminderObjectID:](self, "addReminderWithTitle:toReminderSubtaskContextChangeItem:reminderObjectID:", a3, a4, 0);
}

- (id)updateReminder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  REMReminderChangeItem *v8;
  REMReminderChangeItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[REMSaveRequest _trackedReminderChangeItemForObjectID:](self, "_trackedReminderChangeItemForObjectID:", v7);
        v8 = (REMReminderChangeItem *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v9 = [REMReminderChangeItem alloc];
          objc_msgSend(v5, "storage");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "account");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "capabilities");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[REMReminderChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:](v9, "initWithSaveRequest:storage:accountCapabilities:observeInitialValues:", self, v10, v12, 0);

          -[REMSaveRequest _trackReminderChangeItem:](self, "_trackReminderChangeItem:", v8);
        }
        objc_msgSend(v5, "list");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[REMSaveRequest updateList:](self, "updateList:", v13);

      }
      else
      {
        +[REMLogStore write](REMLogStore, "write");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

        NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
        v8 = 0;
      }

    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[REMSaveRequest updateReminder:].cold.2();

      NSLog(CFSTR("'%s' is unexpectedly nil"), "storage");
      v8 = 0;
    }

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest updateReminder:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "reminder");
    v8 = 0;
  }

  return v8;
}

- (id)addListSectionWithDisplayName:(id)a3 toListSectionContextChangeItem:(id)a4
{
  return -[REMSaveRequest addListSectionWithDisplayName:toListSectionContextChangeItem:listSectionObjectID:](self, "addListSectionWithDisplayName:toListSectionContextChangeItem:listSectionObjectID:", a3, a4, 0);
}

- (id)addListSectionWithDisplayName:(id)a3 toListSectionContextChangeItem:(id)a4 listSectionObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  REMSaveRequest *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  REMListSectionChangeItem *v16;
  void *v17;
  NSObject *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      objc_msgSend(v9, "listChangeItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "saveRequest");
      v12 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

      if (v12 != self)
      {
        v13 = (void *)MEMORY[0x1E0C99DA0];
        v14 = *MEMORY[0x1E0C99768];
        objc_msgSend(v11, "saveRequest");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "raise:format:", v14, CFSTR("listSectionContextChangeItem.listChangeItem (%@) has incorrect saveRequest (%@). Expected %@"), v11, v15, self);

      }
      if (!v10)
        v10 = +[REMListSection newObjectID](REMListSection, "newObjectID");
      v16 = -[REMListSectionChangeItem initWithObjectID:displayName:insertIntoListChangeItem:]([REMListSectionChangeItem alloc], "initWithObjectID:displayName:insertIntoListChangeItem:", v10, v8, v11);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMListSectionChangeItem setCreationDate:](v16, "setCreationDate:", v17);

      -[REMSaveRequest _trackListSectionChangeItem:](self, "_trackListSectionChangeItem:", v16);
      objc_msgSend(v9, "setShouldUpdateSectionsOrdering:", 1);

      goto LABEL_12;
    }
  }
  else
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "displayName");
    if (v9)
      goto LABEL_3;
  }
  +[REMLogStore write](REMLogStore, "write");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest addListSectionWithDisplayName:toListSectionContextChangeItem:listSectionObjectID:].cold.1();

  NSLog(CFSTR("'%s' is unexpectedly nil"), "listSectionContextChangeItem");
  v16 = 0;
LABEL_12:

  return v16;
}

- (id)updateListSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  REMListSectionChangeItem *v8;
  REMListSectionChangeItem *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[REMSaveRequest _trackedListSectionChangeItemForObjectID:](self, "_trackedListSectionChangeItemForObjectID:", v7);
        v8 = (REMListSectionChangeItem *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v9 = [REMListSectionChangeItem alloc];
          objc_msgSend(v5, "storage");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "accountCapabilities");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[REMBaseSectionChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:](v9, "initWithSaveRequest:storage:accountCapabilities:observeInitialValues:", self, v10, v11, 0);

          -[REMSaveRequest _trackListSectionChangeItem:](self, "_trackListSectionChangeItem:", v8);
        }
        objc_msgSend(v5, "list");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[REMSaveRequest updateList:](self, "updateList:", v12);

      }
      else
      {
        +[REMLogStore write](REMLogStore, "write");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

        NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
        v8 = 0;
      }

    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[REMSaveRequest updateReminder:].cold.2();

      NSLog(CFSTR("'%s' is unexpectedly nil"), "storage");
      v8 = 0;
    }

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest updateListSection:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "remListSection");
    v8 = 0;
  }

  return v8;
}

- (id)addSmartListSectionWithDisplayName:(id)a3 toSmartListSectionContextChangeItem:(id)a4
{
  return -[REMSaveRequest addSmartListSectionWithDisplayName:toSmartListSectionContextChangeItem:smartListSectionObjectID:](self, "addSmartListSectionWithDisplayName:toSmartListSectionContextChangeItem:smartListSectionObjectID:", a3, a4, 0);
}

- (id)addSmartListSectionWithDisplayName:(id)a3 toSmartListSectionContextChangeItem:(id)a4 smartListSectionObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  REMSaveRequest *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  REMSmartListSectionChangeItem *v16;
  void *v17;
  NSObject *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      objc_msgSend(v9, "smartListChangeItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "saveRequest");
      v12 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

      if (v12 != self)
      {
        v13 = (void *)MEMORY[0x1E0C99DA0];
        v14 = *MEMORY[0x1E0C99768];
        objc_msgSend(v11, "saveRequest");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "raise:format:", v14, CFSTR("smartListSectionContextChangeItem.smartListChangeItem (%@) has incorrect saveRequest (%@). Expected %@"), v11, v15, self);

      }
      if (!v10)
        v10 = +[REMSmartListSection newObjectID](REMSmartListSection, "newObjectID");
      v16 = -[REMSmartListSectionChangeItem initWithObjectID:displayName:insertIntoSmartListChangeItem:]([REMSmartListSectionChangeItem alloc], "initWithObjectID:displayName:insertIntoSmartListChangeItem:", v10, v8, v11);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMSmartListSectionChangeItem setCreationDate:](v16, "setCreationDate:", v17);

      -[REMSaveRequest _trackSmartListSectionChangeItem:](self, "_trackSmartListSectionChangeItem:", v16);
      objc_msgSend(v9, "setShouldUpdateSectionsOrdering:", 1);

      goto LABEL_12;
    }
  }
  else
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "displayName");
    if (v9)
      goto LABEL_3;
  }
  +[REMLogStore write](REMLogStore, "write");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest addSmartListSectionWithDisplayName:toSmartListSectionContextChangeItem:smartListSectionObjectID:].cold.1();

  NSLog(CFSTR("'%s' is unexpectedly nil"), "smartListSectionContextChangeItem");
  v16 = 0;
LABEL_12:

  return v16;
}

- (id)updateSmartListSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  REMSmartListSectionChangeItem *v8;
  REMSmartListSectionChangeItem *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[REMSaveRequest _trackedSmartListSectionChangeItemForObjectID:](self, "_trackedSmartListSectionChangeItemForObjectID:", v7);
        v8 = (REMSmartListSectionChangeItem *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v9 = [REMSmartListSectionChangeItem alloc];
          objc_msgSend(v5, "storage");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "accountCapabilities");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[REMBaseSectionChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:](v9, "initWithSaveRequest:storage:accountCapabilities:observeInitialValues:", self, v10, v11, 0);

          -[REMSaveRequest _trackSmartListSectionChangeItem:](self, "_trackSmartListSectionChangeItem:", v8);
        }
        objc_msgSend(v5, "smartList");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[REMSaveRequest updateSmartList:](self, "updateSmartList:", v12);

      }
      else
      {
        +[REMLogStore write](REMLogStore, "write");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

        NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
        v8 = 0;
      }

    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[REMSaveRequest updateReminder:].cold.2();

      NSLog(CFSTR("'%s' is unexpectedly nil"), "storage");
      v8 = 0;
    }

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest updateSmartListSection:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "remSmartListSection");
    v8 = 0;
  }

  return v8;
}

- (id)addTemplateSectionWithDisplayName:(id)a3 toTemplateSectionContextChangeItem:(id)a4
{
  return -[REMSaveRequest addTemplateSectionWithDisplayName:toTemplateSectionContextChangeItem:templateSectionObjectID:](self, "addTemplateSectionWithDisplayName:toTemplateSectionContextChangeItem:templateSectionObjectID:", a3, a4, 0);
}

- (id)addTemplateSectionWithDisplayName:(id)a3 toTemplateSectionContextChangeItem:(id)a4 templateSectionObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  REMSaveRequest *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  REMTemplateSectionChangeItem *v16;
  void *v17;
  NSObject *v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      objc_msgSend(v9, "templateChangeItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "saveRequest");
      v12 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

      if (v12 != self)
      {
        v13 = (void *)MEMORY[0x1E0C99DA0];
        v14 = *MEMORY[0x1E0C99768];
        objc_msgSend(v11, "saveRequest");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "raise:format:", v14, CFSTR("templateSectionContextChangeItem.templateChangeItem (%@) has incorrect saveRequest (%@). Expected %@"), v11, v15, self);

      }
      if (!v10)
        v10 = +[REMTemplateSection newObjectID](REMTemplateSection, "newObjectID");
      v16 = -[REMTemplateSectionChangeItem initWithObjectID:displayName:insertIntoTemplateChangeItem:]([REMTemplateSectionChangeItem alloc], "initWithObjectID:displayName:insertIntoTemplateChangeItem:", v10, v8, v11);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMTemplateSectionChangeItem setCreationDate:](v16, "setCreationDate:", v17);

      -[REMSaveRequest _trackTemplateSectionChangeItem:](self, "_trackTemplateSectionChangeItem:", v16);
      objc_msgSend(v9, "setShouldUpdateSectionsOrdering:", 1);

      goto LABEL_12;
    }
  }
  else
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "displayName");
    if (v9)
      goto LABEL_3;
  }
  +[REMLogStore write](REMLogStore, "write");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest addTemplateSectionWithDisplayName:toTemplateSectionContextChangeItem:templateSectionObjectID:].cold.1();

  NSLog(CFSTR("'%s' is unexpectedly nil"), "templateSectionContextChangeItem");
  v16 = 0;
LABEL_12:

  return v16;
}

- (id)updateTemplateSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  REMTemplateSectionChangeItem *v8;
  REMTemplateSectionChangeItem *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[REMSaveRequest _trackedTemplateSectionChangeItemForObjectID:](self, "_trackedTemplateSectionChangeItemForObjectID:", v7);
        v8 = (REMTemplateSectionChangeItem *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v9 = [REMTemplateSectionChangeItem alloc];
          objc_msgSend(v5, "storage");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "accountCapabilities");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[REMBaseSectionChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:](v9, "initWithSaveRequest:storage:accountCapabilities:observeInitialValues:", self, v10, v11, 0);

          -[REMSaveRequest _trackTemplateSectionChangeItem:](self, "_trackTemplateSectionChangeItem:", v8);
        }
        objc_msgSend(v5, "parentTemplate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[REMSaveRequest updateTemplate:](self, "updateTemplate:", v12);

      }
      else
      {
        +[REMLogStore write](REMLogStore, "write");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

        NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
        v8 = 0;
      }

    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[REMSaveRequest updateReminder:].cold.2();

      NSLog(CFSTR("'%s' is unexpectedly nil"), "storage");
      v8 = 0;
    }

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest updateTemplateSection:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "remTemplateSection");
    v8 = 0;
  }

  return v8;
}

- (void)_updateResolutionTokenMapForChangeItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "resolutionTokenMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v3, "changedKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v3, "resolutionTokenKeyForChangedKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = v5;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v4, "updateForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[REMSaveRequest _updateResolutionTokenMapForChangeItem:].cold.1(v12);
  }

}

- (void)_willSaveAccountChangeItems:(id)a3 listChangeItems:(id)a4 listSectionChangeItems:(id)a5 smartListChangeItems:(id)a6 smartListSectionChangeItems:(id)a7 templateChangeItems:(id)a8 templateSectionChangeItems:(id)a9 reminderChangeItems:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t n;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t ii;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t jj;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t kk;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id WeakRetained;
  void *v76;
  void *v77;
  _BOOL4 v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  id v92;
  id *v93;
  id v94;
  id v95;
  id obj;
  id v97;
  uint64_t v98;
  id *location;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v92 = a8;
  v97 = a9;
  location = (id *)a10;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  obj = v16;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v139, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v129;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v129 != v23)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * i);
        v26 = (void *)MEMORY[0x1B5E3DEC4]();
        -[REMSaveRequest _updateResolutionTokenMapForChangeItem:](self, "_updateResolutionTokenMapForChangeItem:", v25);
        objc_autoreleasePoolPop(v26);
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v139, 16);
    }
    while (v22);
  }

  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v27 = v17;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v124, v138, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v125;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v125 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * j);
        v33 = (void *)MEMORY[0x1B5E3DEC4]();
        -[REMSaveRequest _updateResolutionTokenMapForChangeItem:](self, "_updateResolutionTokenMapForChangeItem:", v32);
        objc_autoreleasePoolPop(v33);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v124, v138, 16);
    }
    while (v29);
  }

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v95 = v18;
  v34 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v120, v137, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v121;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v121 != v36)
          objc_enumerationMutation(v95);
        v38 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * k);
        v39 = (void *)MEMORY[0x1B5E3DEC4]();
        -[REMSaveRequest _updateResolutionTokenMapForChangeItem:](self, "_updateResolutionTokenMapForChangeItem:", v38);
        objc_autoreleasePoolPop(v39);
      }
      v35 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v120, v137, 16);
    }
    while (v35);
  }

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v94 = v19;
  v40 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v116, v136, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v117;
    do
    {
      for (m = 0; m != v41; ++m)
      {
        if (*(_QWORD *)v117 != v42)
          objc_enumerationMutation(v94);
        v44 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * m);
        v45 = (void *)MEMORY[0x1B5E3DEC4]();
        -[REMSaveRequest _updateResolutionTokenMapForChangeItem:](self, "_updateResolutionTokenMapForChangeItem:", v44);
        objc_autoreleasePoolPop(v45);
      }
      v41 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v116, v136, 16);
    }
    while (v41);
  }

  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v46 = v20;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v112, v135, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v113;
    do
    {
      for (n = 0; n != v48; ++n)
      {
        if (*(_QWORD *)v113 != v49)
          objc_enumerationMutation(v46);
        v51 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * n);
        v52 = (void *)MEMORY[0x1B5E3DEC4]();
        -[REMSaveRequest _updateResolutionTokenMapForChangeItem:](self, "_updateResolutionTokenMapForChangeItem:", v51);
        objc_autoreleasePoolPop(v52);
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v112, v135, 16);
    }
    while (v48);
  }
  v90 = v27;

  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v53 = v92;
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v108, v134, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v109;
    do
    {
      for (ii = 0; ii != v55; ++ii)
      {
        if (*(_QWORD *)v109 != v56)
          objc_enumerationMutation(v53);
        v58 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * ii);
        v59 = (void *)MEMORY[0x1B5E3DEC4]();
        -[REMSaveRequest _updateResolutionTokenMapForChangeItem:](self, "_updateResolutionTokenMapForChangeItem:", v58);
        objc_autoreleasePoolPop(v59);
      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v108, v134, 16);
    }
    while (v55);
  }

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v60 = v97;
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v104, v133, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v105;
    do
    {
      for (jj = 0; jj != v62; ++jj)
      {
        if (*(_QWORD *)v105 != v63)
          objc_enumerationMutation(v60);
        v65 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * jj);
        v66 = (void *)MEMORY[0x1B5E3DEC4]();
        -[REMSaveRequest _updateResolutionTokenMapForChangeItem:](self, "_updateResolutionTokenMapForChangeItem:", v65);
        objc_autoreleasePoolPop(v66);
      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v104, v133, 16);
    }
    while (v62);
  }
  v88 = v53;
  v89 = v46;
  v87 = v60;

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v93 = location;
  v67 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v100, v132, 16);
  if (v67)
  {
    v68 = v67;
    v98 = *(_QWORD *)v101;
    do
    {
      for (kk = 0; kk != v68; ++kk)
      {
        if (*(_QWORD *)v101 != v98)
          objc_enumerationMutation(v93);
        v70 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * kk);
        v71 = (void *)MEMORY[0x1B5E3DEC4]();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "creationDate");
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v73)
          objc_msgSend(v70, "setCreationDate:", v72);
        if (-[REMSaveRequest updateLastModifiedDates](self, "updateLastModifiedDates")
          || (objc_msgSend(v70, "lastModifiedDate"),
              v74 = (void *)objc_claimAutoreleasedReturnValue(),
              v74,
              !v74))
        {
          objc_msgSend(v70, "setLastModifiedDate:", v72);
        }
        -[REMSaveRequest _updateResolutionTokenMapForChangeItem:](self, "_updateResolutionTokenMapForChangeItem:", v70);
        WeakRetained = objc_loadWeakRetained((id *)&self->_notifyChangeDelegate);

        if (WeakRetained)
        {
          objc_msgSend(v70, "listChangeItem");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "sharees");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = +[REMList isSharedWithShareeCount:sharingStatus:](REMList, "isSharedWithShareeCount:sharingStatus:", objc_msgSend(v77, "count"), objc_msgSend(v76, "sharingStatus"));

          if (v78)
          {
            objc_msgSend(v70, "changedKeys");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = objc_msgSend(v79, "containsObject:", CFSTR("objectID"));

            objc_msgSend(v70, "changedKeys");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v81, "containsObject:", CFSTR("titleDocument")) & 1) != 0)
            {

              if (!v80)
                goto LABEL_71;
LABEL_69:
              -[REMSaveRequest saveRequestChangeEvents](self, "saveRequestChangeEvents");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = v84;
              v86 = &unk_1E6836FE8;
LABEL_72:
              objc_msgSend(v84, "addObject:", v86);

            }
            else
            {
              objc_msgSend(v70, "changedKeys");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v82, "containsObject:", CFSTR("notesDocument")) & 1) != 0)
              {

                if ((v80 & 1) != 0)
                  goto LABEL_69;
LABEL_71:
                -[REMSaveRequest saveRequestChangeEvents](self, "saveRequestChangeEvents");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                v85 = v84;
                v86 = &unk_1E6837000;
                goto LABEL_72;
              }
              objc_msgSend(v70, "changedKeys");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = objc_msgSend(v83, "containsObject:", CFSTR("hashtags"));

              if ((v80 & 1) != 0)
                goto LABEL_69;
              if (v91)
                goto LABEL_71;
            }
          }

        }
        objc_autoreleasePoolPop(v71);
      }
      v68 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v100, v132, 16);
    }
    while (v68);
  }

}

- (void)saveWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD activity_block[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "queue");
    if (v8)
      goto LABEL_3;
  }
  NSLog(CFSTR("'%s' is unexpectedly nil"), "completion");
LABEL_3:
  if (-[REMSaveRequest _changeItemsAreAllEmpty](self, "_changeItemsAreAllEmpty"))
  {
    -[REMSaveRequest author](self, "author");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.eventkitsyncd")) & 1) != 0)
    {

LABEL_9:
      +[REMLogStore write](REMLogStore, "write");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[REMSaveRequest author](self, "author");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v12;
        v24 = 1024;
        v25 = -[REMSaveRequest saveIsNoopIfNoChangedKeys](self, "saveIsNoopIfNoChangedKeys");
        _os_log_impl(&dword_1B4A39000, v11, OS_LOG_TYPE_DEFAULT, "Save Request has no changed keys. Opted to return early as no-op. {author: %{public}@, saveIsNoopIfNoChangedKeys: %d}", buf, 0x12u);

      }
      -[REMSaveRequest store](self, "store");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "processNoOpSaveRequest:queue:completion:", self, v6, v8);
      goto LABEL_18;
    }
    v10 = -[REMSaveRequest saveIsNoopIfNoChangedKeys](self, "saveIsNoopIfNoChangedKeys");

    if (v10)
      goto LABEL_9;
    +[REMLogStore write](REMLogStore, "write");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[REMSaveRequest author](self, "author");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v15;
      _os_log_impl(&dword_1B4A39000, v14, OS_LOG_TYPE_DEFAULT, "LOOKATME: Save Request has no changed keys. Save will continue. Revisit if caller should avoid such saves. {author: %{public}@}", buf, 0xCu);

    }
  }
  -[REMSaveRequest setSaved:](self, "setSaved:", 1);
  +[REMLogStore write](REMLogStore, "write");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B4A39000, v16, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.reminderkit.REMSaveRequest}", buf, 2u);
  }

  v17 = (void *)os_transaction_create();
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __43__REMSaveRequest_saveWithQueue_completion___block_invoke;
  activity_block[3] = &unk_1E67F8660;
  activity_block[4] = self;
  v19 = v6;
  v20 = v17;
  v21 = v8;
  v13 = v17;
  _os_activity_initiate(&dword_1B4A39000, "REMSaveRequest save async", OS_ACTIVITY_FLAG_IF_NONE_PRESENT, activity_block);

LABEL_18:
}

void __43__REMSaveRequest_saveWithQueue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__REMSaveRequest_saveWithQueue_completion___block_invoke_2;
  v3[3] = &unk_1E67FA308;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_prepareSave:", v3);

}

void __43__REMSaveRequest_saveWithQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;

  v17 = *(void **)(a1 + 32);
  v32 = a9;
  v31 = a8;
  v29 = a7;
  v30 = a6;
  v28 = a5;
  v18 = a4;
  v19 = a3;
  v20 = a2;
  objc_msgSend(v17, "store");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(void **)(a1 + 32);
  objc_msgSend(v22, "author");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "replicaManagerProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(a1 + 40);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __43__REMSaveRequest_saveWithQueue_completion___block_invoke_3;
  v33[3] = &unk_1E67FA2E0;
  v25 = *(id *)(a1 + 56);
  v26 = *(_QWORD *)(a1 + 32);
  v35 = v25;
  v33[4] = v26;
  v34 = *(id *)(a1 + 48);
  objc_msgSend(v21, "saveSaveRequest:accountChangeItems:listChangeItems:listSectionChangeItems:smartListChangeItems:smartListSectionChangeItems:templateChangeItems:templateSectionChangeItems:reminderChangeItems:author:replicaManagerProvider:queue:completion:", v22, v20, v19, v18, v28, v30, v29, v31, v32, v27, v23, v24, v33);

}

id __43__REMSaveRequest_saveWithQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint8_t v6[16];

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "notifyChangeDelegateForSaveSuccess:", a2 == 0);
  +[REMLogStore write](REMLogStore, "write");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B4A39000, v4, OS_LOG_TYPE_DEFAULT, "os_transaction RELEASE {name: com.apple.reminderkit.REMSaveRequest}", v6, 2u);
  }

  return (id)objc_opt_self();
}

- (BOOL)saveSynchronouslyWithError:(id *)a3
{
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _BYTE buf[18];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__12;
  v19 = __Block_byref_object_dispose__12;
  v20 = 0;
  if (-[REMSaveRequest _changeItemsAreAllEmpty](self, "_changeItemsAreAllEmpty"))
  {
    -[REMSaveRequest author](self, "author");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.eventkitsyncd")) & 1) != 0)
    {

LABEL_5:
      +[REMLogStore write](REMLogStore, "write");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[REMSaveRequest author](self, "author");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[REMSaveRequest saveIsNoopIfNoChangedKeys](self, "saveIsNoopIfNoChangedKeys");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v9;
        _os_log_impl(&dword_1B4A39000, v7, OS_LOG_TYPE_DEFAULT, "Save Request has no changed keys. Opted to return early as no-op. {author: %{public}@, saveIsNoopIfNoChangedKeys: %d}", buf, 0x12u);

      }
      v10 = 1;
      goto LABEL_14;
    }
    v6 = -[REMSaveRequest saveIsNoopIfNoChangedKeys](self, "saveIsNoopIfNoChangedKeys");

    if (v6)
      goto LABEL_5;
    +[REMLogStore write](REMLogStore, "write");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[REMSaveRequest author](self, "author");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1B4A39000, v11, OS_LOG_TYPE_DEFAULT, "LOOKATME: Save Request has no changed keys. Save will continue. Revisit if caller should avoid such saves. {author: %{public}@}", buf, 0xCu);

    }
  }
  -[REMSaveRequest setSaved:](self, "setSaved:", 1);
  v7 = _os_activity_create(&dword_1B4A39000, "REMSaveRequest save sync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  os_activity_scope_enter(v7, (os_activity_scope_state_t)buf);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__REMSaveRequest_saveSynchronouslyWithError___block_invoke;
  v14[3] = &unk_1E67FA330;
  v14[4] = self;
  v14[5] = &v21;
  v14[6] = &v15;
  -[REMSaveRequest _prepareSave:](self, "_prepareSave:", v14);
  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v10 = *((_BYTE *)v22 + 24) != 0;
  os_activity_scope_leave((os_activity_scope_state_t)buf);
LABEL_14:

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v10;
}

void __45__REMSaveRequest_saveSynchronouslyWithError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  char v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;

  v17 = *(void **)(a1 + 32);
  v18 = a9;
  v32 = a8;
  v30 = a7;
  v31 = a6;
  v29 = a5;
  v19 = a4;
  v20 = a3;
  v21 = a2;
  objc_msgSend(v17, "store");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(void **)(a1 + 32);
  objc_msgSend(v22, "author");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "replicaManagerProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v28 = objc_msgSend(v33, "saveSaveRequest:accountChangeItems:listChangeItems:listSectionChangeItems:smartListChangeItems:smartListSectionChangeItems:templateChangeItems:templateSectionChangeItems:reminderChangeItems:author:replicaManagerProvider:error:", v22, v21, v20, v19, v29, v31, v30, v32, v18, v34, v23, &v35);

  v24 = v35;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v28;

  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v24;
  v27 = v24;

  objc_msgSend(*(id *)(a1 + 32), "notifyChangeDelegateForSaveSuccess:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (void)notifyChangeDelegateForSaveSuccess:(BOOL)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  REMSaveRequest *v17;
  id v18;
  uint8_t buf[16];

  if (a3)
  {
    -[REMSaveRequest saveRequestChangeEvents](self, "saveRequestChangeEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[REMSaveRequest notifyChangeDelegate](self, "notifyChangeDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        +[REMLogStore write](REMLogStore, "write");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4A39000, v6, OS_LOG_TYPE_DEFAULT, "notifyChangeDelegateForSaveSuccess: SHOULD_NOTIFY {name: com.apple.reminderkit.REMSaveRequest}", buf, 2u);
        }

        -[REMSaveRequest saveRequestChangeEvents](self, "saveRequestChangeEvents");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v7, "copy");

        -[REMSaveRequest notifyChangeDelegate](self, "notifyChangeDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "callbackQueue");
        v10 = objc_claimAutoreleasedReturnValue();

        v13 = MEMORY[0x1E0C809B0];
        v14 = 3221225472;
        v15 = __53__REMSaveRequest_notifyChangeDelegateForSaveSuccess___block_invoke;
        v16 = &unk_1E67F9EF8;
        v17 = self;
        v18 = v8;
        v11 = v8;
        dispatch_async(v10, &v13);

      }
    }
    else
    {

    }
  }
  -[REMSaveRequest saveRequestChangeEvents](self, "saveRequestChangeEvents", v13, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

}

void __53__REMSaveRequest_notifyChangeDelegateForSaveSuccess___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "notifyChangeDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyEventFromSaveRequest:", *(_QWORD *)(a1 + 40));

}

- (BOOL)_changeItemsAreAllEmpty
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  BOOL v68;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  -[REMSaveRequest trackedAccountChangeItems](self, "trackedAccountChangeItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v99;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v99 != v7)
        objc_enumerationMutation(v4);
      objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * v8), "valueWithoutPerformingCopy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "changedKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    -[REMSaveRequest trackedListChangeItems](self, "trackedListChangeItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v95;
LABEL_11:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v95 != v15)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * v16), "valueWithoutPerformingCopy");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "changedKeys");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
          if (v14)
            goto LABEL_11;
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:

      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      -[REMSaveRequest trackedSmartListChangeItems](self, "trackedSmartListChangeItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allValues");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v91;
LABEL_19:
        v24 = 0;
        while (1)
        {
          if (*(_QWORD *)v91 != v23)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v24), "valueWithoutPerformingCopy");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "changedKeys");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "count");

          if (v27)
            break;
          if (v22 == ++v24)
          {
            v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
            if (v22)
              goto LABEL_19;
            goto LABEL_25;
          }
        }
      }
      else
      {
LABEL_25:

        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        -[REMSaveRequest trackedTemplateChangeItems](self, "trackedTemplateChangeItems");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "allValues");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v86, v106, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v87;
LABEL_27:
          v32 = 0;
          while (1)
          {
            if (*(_QWORD *)v87 != v31)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * v32), "valueWithoutPerformingCopy");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "changedKeys");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "count");

            if (v35)
              break;
            if (v30 == ++v32)
            {
              v30 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v86, v106, 16);
              if (v30)
                goto LABEL_27;
              goto LABEL_33;
            }
          }
        }
        else
        {
LABEL_33:

          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          -[REMSaveRequest trackedReminderChangeItems](self, "trackedReminderChangeItems");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "allValues");
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v82, v105, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v83;
LABEL_35:
            v40 = 0;
            while (1)
            {
              if (*(_QWORD *)v83 != v39)
                objc_enumerationMutation(v4);
              objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * v40), "valueWithoutPerformingCopy");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "changedKeys");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v42, "count");

              if (v43)
                break;
              if (v38 == ++v40)
              {
                v38 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v82, v105, 16);
                if (v38)
                  goto LABEL_35;
                goto LABEL_41;
              }
            }
          }
          else
          {
LABEL_41:

            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            -[REMSaveRequest trackedListSectionChangeItems](self, "trackedListSectionChangeItems");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "allValues");
            v4 = (void *)objc_claimAutoreleasedReturnValue();

            v45 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v78, v104, 16);
            if (v45)
            {
              v46 = v45;
              v47 = *(_QWORD *)v79;
LABEL_43:
              v48 = 0;
              while (1)
              {
                if (*(_QWORD *)v79 != v47)
                  objc_enumerationMutation(v4);
                objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * v48), "valueWithoutPerformingCopy");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "changedKeys");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = objc_msgSend(v50, "count");

                if (v51)
                  break;
                if (v46 == ++v48)
                {
                  v46 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v78, v104, 16);
                  if (v46)
                    goto LABEL_43;
                  goto LABEL_49;
                }
              }
            }
            else
            {
LABEL_49:

              v76 = 0u;
              v77 = 0u;
              v74 = 0u;
              v75 = 0u;
              -[REMSaveRequest trackedSmartListSectionChangeItems](self, "trackedSmartListSectionChangeItems");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "allValues");
              v4 = (void *)objc_claimAutoreleasedReturnValue();

              v53 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v74, v103, 16);
              if (v53)
              {
                v54 = v53;
                v55 = *(_QWORD *)v75;
LABEL_51:
                v56 = 0;
                while (1)
                {
                  if (*(_QWORD *)v75 != v55)
                    objc_enumerationMutation(v4);
                  objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * v56), "valueWithoutPerformingCopy");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "changedKeys");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = objc_msgSend(v58, "count");

                  if (v59)
                    break;
                  if (v54 == ++v56)
                  {
                    v54 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v74, v103, 16);
                    if (v54)
                      goto LABEL_51;
                    goto LABEL_57;
                  }
                }
              }
              else
              {
LABEL_57:

                v72 = 0u;
                v73 = 0u;
                v70 = 0u;
                v71 = 0u;
                -[REMSaveRequest trackedTemplateSectionChangeItems](self, "trackedTemplateSectionChangeItems", 0);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "allValues");
                v4 = (void *)objc_claimAutoreleasedReturnValue();

                v61 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v70, v102, 16);
                if (!v61)
                {
                  v68 = 1;
                  goto LABEL_67;
                }
                v62 = v61;
                v63 = *(_QWORD *)v71;
LABEL_59:
                v64 = 0;
                while (1)
                {
                  if (*(_QWORD *)v71 != v63)
                    objc_enumerationMutation(v4);
                  objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v64), "valueWithoutPerformingCopy");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "changedKeys");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  v67 = objc_msgSend(v66, "count");

                  if (v67)
                    break;
                  if (v62 == ++v64)
                  {
                    v62 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v70, v102, 16);
                    v68 = 1;
                    if (v62)
                      goto LABEL_59;
                    goto LABEL_67;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v68 = 0;
LABEL_67:

  return v68;
}

- (void)_prepareSave:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t ii;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t jj;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t kk;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void (**v74)(id, void *, void *, void *, void *, void *, void *, void *, void *);
  id v75;
  id v76;
  id obj;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v74 = (void (**)(id, void *, void *, void *, void *, void *, void *, void *, void *))a3;
  if (!v74)
    NSLog(CFSTR("'%s' is unexpectedly nil"), "saveBlock");
  -[REMSaveRequest performPreSaveActions](self, "performPreSaveActions");
  -[REMSaveRequest trackedAccountChangeItems](self, "trackedAccountChangeItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMSaveRequest trackedListChangeItems](self, "trackedListChangeItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMSaveRequest trackedSmartListChangeItems](self, "trackedSmartListChangeItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMSaveRequest trackedTemplateChangeItems](self, "trackedTemplateChangeItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMSaveRequest trackedReminderChangeItems](self, "trackedReminderChangeItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMSaveRequest trackedListSectionChangeItems](self, "trackedListSectionChangeItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allValues");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMSaveRequest trackedSmartListSectionChangeItems](self, "trackedSmartListSectionChangeItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allValues");
  v75 = (id)objc_claimAutoreleasedReturnValue();

  -[REMSaveRequest trackedTemplateSectionChangeItems](self, "trackedTemplateSectionChangeItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allValues");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v5;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v121, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v111;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v111 != v19)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * i), "valueForSaveRequest:", self);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "addObject:", v21);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v121, 16);
    }
    while (v18);
  }

  v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v22 = v7;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v106, v120, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v107;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v107 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * j), "valueForSaveRequest:", self);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "addObject:", v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v106, v120, 16);
    }
    while (v24);
  }

  v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v28 = v9;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v102, v119, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v103;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v103 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * k), "valueForSaveRequest:", self);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "addObject:", v33);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v102, v119, 16);
    }
    while (v30);
  }

  v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v34 = v11;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v98, v118, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v99;
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v99 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * m), "valueForSaveRequest:", self);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "addObject:", v39);

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v98, v118, 16);
    }
    while (v36);
  }
  v68 = v34;

  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v41 = v13;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v94, v117, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v95;
    do
    {
      for (n = 0; n != v43; ++n)
      {
        if (*(_QWORD *)v95 != v44)
          objc_enumerationMutation(v41);
        objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * n), "valueForSaveRequest:", self);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v46);

      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v94, v117, 16);
    }
    while (v43);
  }
  v71 = v28;
  v73 = v22;

  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v69, "count"));
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v48 = v69;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v90, v116, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v91;
    do
    {
      for (ii = 0; ii != v50; ++ii)
      {
        if (*(_QWORD *)v91 != v51)
          objc_enumerationMutation(v48);
        objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * ii), "valueForSaveRequest:", self);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addObject:", v53);

      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v90, v116, 16);
    }
    while (v50);
  }
  v70 = v41;

  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v75, "count"));
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v76 = v75;
  v55 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v86, v115, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v87;
    do
    {
      for (jj = 0; jj != v56; ++jj)
      {
        if (*(_QWORD *)v87 != v57)
          objc_enumerationMutation(v76);
        objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * jj), "valueForSaveRequest:", self);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addObject:", v59);

      }
      v56 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v86, v115, 16);
    }
    while (v56);
  }
  v67 = v48;

  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v72, "count"));
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v61 = v72;
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v82, v114, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v83;
    do
    {
      for (kk = 0; kk != v63; ++kk)
      {
        if (*(_QWORD *)v83 != v64)
          objc_enumerationMutation(v61);
        objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * kk), "valueForSaveRequest:", self);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "addObject:", v66);

      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v82, v114, 16);
    }
    while (v63);
  }

  -[REMSaveRequest _willSaveAccountChangeItems:listChangeItems:listSectionChangeItems:smartListChangeItems:smartListSectionChangeItems:templateChangeItems:templateSectionChangeItems:reminderChangeItems:](self, "_willSaveAccountChangeItems:listChangeItems:listSectionChangeItems:smartListChangeItems:smartListSectionChangeItems:templateChangeItems:templateSectionChangeItems:reminderChangeItems:", v81, v80, v47, v79, v54, v78, v60, v40);
  v74[2](v74, v81, v80, v47, v79, v54, v78, v60, v40);

}

- (void)performPreSaveActions
{
  id v3;

  if (-[REMSaveRequest cloneCompletedRecurrentRemindersAtSave](self, "cloneCompletedRecurrentRemindersAtSave"))
    v3 = -[REMSaveRequest advanceForwardRecurrenceAfterNowAndAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasks](self, "advanceForwardRecurrenceAfterNowAndAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasks");
}

- (void)preFetchDueDateDeltaAlertsForCompletedRecurrenceClone
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_4_0(&dword_1B4A39000, a3, v6, "preFetchDueDateDeltaAlertsForCompletedRecurrenceClone - Error fetching dueDateDeltaAlerts for reminders {error: %{public}@, reminderIDs: %{public}@}", (uint8_t *)&v7);

}

- (void)preFlightActionSaveAndUpdateParentsOfRecurrentSubtasksWithLogPrefix:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[REMLogStore write](REMLogStore, "write");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v45 = v4;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "%{public}@: Preflight - Collect parentsOfRecurrentSubtasks", buf, 0xCu);
  }
  v32 = v4;

  v6 = (void *)MEMORY[0x1E0C99E20];
  -[REMSaveRequest trackedReminderChangeItems](self, "trackedReminderChangeItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[REMSaveRequest trackedReminderChangeItems](self, "trackedReminderChangeItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "valueForSaveRequest:", self);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v17);

        if (objc_msgSend(v16, "isCompleted"))
        {
          objc_msgSend(v16, "recurrenceRules");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

          if (v19)
          {
            objc_msgSend(v16, "parentReminderID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
              objc_msgSend(v9, "addObject:", v20);

          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v13);
  }

  +[REMLogStore write](REMLogStore, "write");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v45 = v32;
    _os_log_impl(&dword_1B4A39000, v21, OS_LOG_TYPE_INFO, "%{public}@: Preflight -  Fetch and update parents of recurrent subtasks", buf, 0xCu);
  }

  objc_msgSend(v9, "minusSet:", v8);
  if (objc_msgSend(v9, "count"))
  {
    -[REMSaveRequest store](self, "store");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v22, "fetchRemindersWithObjectIDs:error:", v23, &v37);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v37;

    if (v25)
    {
      +[REMLogStore write](REMLogStore, "write");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[REMSaveRequest preFlightActionSaveAndUpdateParentsOfRecurrentSubtasksWithLogPrefix:].cold.1();
    }
    else
    {
      if (!objc_msgSend(v24, "count"))
        goto LABEL_22;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      objc_msgSend(v24, "objectEnumerator");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v34 != v29)
              objc_enumerationMutation(v26);
            v31 = -[REMSaveRequest updateReminder:](self, "updateReminder:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
          }
          v28 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        }
        while (v28);
      }
    }

LABEL_22:
  }

}

- (id)advanceForwardRecurrenceAfterNowAndCreateIncompleteCloneWithoutRecurrenceRulesAndSubtasks
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v34;
  void *v35;
  REMSaveRequest *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  _BYTE v47[14];
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[16];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E67F4000uLL;
  +[REMLogStore write](REMLogStore, "write");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B4A39000, v4, OS_LOG_TYPE_INFO, "IncompleteRecurrenceClone: Started advanceForwardRecurrenceAfterNowAndCreateIncompleteCloneWithoutRecurrenceRulesAndSubtasks", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "rem_now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_opt_new();
  -[REMSaveRequest preFlightActionSaveAndUpdateParentsOfRecurrentSubtasksWithLogPrefix:](self, "preFlightActionSaveAndUpdateParentsOfRecurrentSubtasksWithLogPrefix:", CFSTR("IncompleteRecurrenceClone"));
  +[REMLogStore write](REMLogStore, "write");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B4A39000, v6, OS_LOG_TYPE_INFO, "IncompleteRecurrenceClone: Incomplete Duplicate and Advance Forward", buf, 2u);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[REMSaveRequest trackedReminderChangeItems](self, "trackedReminderChangeItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v39)
  {
    v9 = *(_QWORD *)v41;
    v35 = v5;
    v36 = self;
    v38 = *(_QWORD *)v41;
    v34 = v8;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v10), "valueForSaveRequest:", self);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v3 + 3888), "write");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v11, "objectID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v45 = v13;
          _os_log_impl(&dword_1B4A39000, v12, OS_LOG_TYPE_INFO, "IncompleteRecurrenceClone: Performing check for has recurrenceRules {reminderID: %{public}@};",
            buf,
            0xCu);

        }
        objc_msgSend(v11, "recurrenceRules");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15)
        {
          objc_msgSend(v11, "dueDateComponents");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "nextRecurrentAdvanceAmountForDateComponents:afterDate:", v16, v5);
          v18 = v17;

          if (v18 <= 0.0)
          {
            objc_msgSend(*(id *)(v3 + 3888), "write");
            v19 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
              goto LABEL_25;
            objc_msgSend(v11, "objectID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v45 = v20;
            v46 = 2048;
            *(double *)v47 = v18;
            _os_log_fault_impl(&dword_1B4A39000, v19, OS_LOG_TYPE_FAULT, "IncompleteRecurrenceClone: Unable to clone recurrent reminder with dueDateAdvanceAmount < 0 {reminderID: %{public}@, dueDateAdvanceAmount: %f}", buf, 0x16u);
          }
          else
          {
            v19 = +[REMReminder newObjectID](REMReminder, "newObjectID");
            objc_msgSend(v11, "duplicateForRecurrenceUsingReminderID:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              objc_msgSend(v11, "objectID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v20, v21);

              objc_msgSend(v11, "cleanupDuplicate:markAsCompleted:", v20, 0);
              objc_msgSend(v11, "advanceForwardToNextRecurrenceAfterDate:", v5);
            }
            else
            {
              objc_msgSend(*(id *)(v3 + 3888), "write");
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                -[REMSaveRequest advanceForwardRecurrenceAfterNowAndCreateIncompleteCloneWithoutRecurrenceRulesAndSubtasks].cold.1((uint64_t)v52, (uint64_t)v11);

            }
          }

        }
        else
        {
          objc_msgSend(v11, "recurrenceRules");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "firstObject");
          v19 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v3 + 3888), "write");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v11, "objectID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v11, "isCompleted");
            -[NSObject objectID](v19, "objectID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject iCalendarDescription](v19, "iCalendarDescription");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v11, "recurrenceRules");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v45 = v24;
            v46 = 1026;
            *(_DWORD *)v47 = v25;
            v8 = v34;
            *(_WORD *)&v47[4] = 2114;
            *(_QWORD *)&v47[6] = v26;
            v48 = 2114;
            v49 = v27;
            v50 = 2114;
            v51 = v30;
            _os_log_impl(&dword_1B4A39000, v23, OS_LOG_TYPE_INFO, "IncompleteRecurrenceClone: Skipping advanceForwardRecurrenceAfterNowAndCreateIncompleteCloneWithoutRecurrenceRulesAndSubtasks to advance forward date alarm for reminder, didn't meet conditions for hasRecurrenceRules {reminderID: %{public}@, isCompleted:%{public}i, recurrenceRuleID: %{public}@, recurrenceRule: %{public}@, ruleCount: %{public}@};",
              buf,
              0x30u);

            v5 = v35;
            self = v36;

            v3 = 0x1E67F4000;
          }

          v9 = v38;
        }
LABEL_25:

        ++v10;
      }
      while (v39 != v10);
      v39 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    }
    while (v39);
  }

  v32 = (void *)objc_msgSend(v37, "copy");
  return v32;
}

- (id)advanceForwardRecurrenceAfterNowAndAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasks
{
  return -[REMSaveRequest advanceForwardRecurrenceAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasksAfterDate:](self, "advanceForwardRecurrenceAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasksAfterDate:", 0);
}

- (id)advanceForwardRecurrenceAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasksAfterDate:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  REMSaveRequest *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v59;
  void *v60;
  uint64_t v61;
  void (**v62)(id, void *);
  id obj;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[16];
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  _BYTE v76[38];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v62 = (void (**)(id, void *))a3;
  v4 = 0x1E67F4000uLL;
  +[REMLogStore write](REMLogStore, "write");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "CompletedRecurrenceClone: Started advanceForwardRecurrenceAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasksAfterDate", buf, 2u);
  }

  v60 = (void *)objc_opt_new();
  -[REMSaveRequest preFetchDueDateDeltaAlertsForCompletedRecurrenceClone](self, "preFetchDueDateDeltaAlertsForCompletedRecurrenceClone");
  -[REMSaveRequest preFlightActionSaveAndUpdateParentsOfRecurrentSubtasksWithLogPrefix:](self, "preFlightActionSaveAndUpdateParentsOfRecurrentSubtasksWithLogPrefix:", CFSTR("CompletedRecurrenceClone"));
  +[REMLogStore write](REMLogStore, "write");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B4A39000, v6, OS_LOG_TYPE_INFO, "CompletedRecurrenceClone: Complete Duplicate and Advance Forward", buf, 2u);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  -[REMSaveRequest trackedReminderChangeItems](self, "trackedReminderChangeItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v67 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
  if (v67)
  {
    v66 = *(_QWORD *)v69;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v69 != v66)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * v9), "valueForSaveRequest:", self);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v4 + 3888), "write");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "objectID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v74 = v12;
          _os_log_impl(&dword_1B4A39000, v11, OS_LOG_TYPE_INFO, "CompletedRecurrenceClone: Performing check for isCompleted and has recurrenceRules {reminderID: %{public}@};",
            buf,
            0xCu);

        }
        objc_msgSend(v10, "changedKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "containsObject:", CFSTR("completed"))
          || (objc_msgSend(v10, "isCompleted") & 1) == 0)
        {

LABEL_23:
          objc_msgSend(v10, "recurrenceRules");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v4 + 3888), "write");
          v35 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            goto LABEL_26;
          objc_msgSend(v10, "objectID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v9;
          v38 = objc_msgSend(v10, "isCompleted");
          objc_msgSend(v17, "objectID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "iCalendarDescription");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v10, "recurrenceRules");
          v65 = v17;
          v42 = self;
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v43, "count"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v74 = v36;
          v75 = 1026;
          *(_DWORD *)v76 = v38;
          v9 = v37;
          *(_WORD *)&v76[4] = 2114;
          *(_QWORD *)&v76[6] = v39;
          *(_WORD *)&v76[14] = 2114;
          *(_QWORD *)&v76[16] = v40;
          *(_WORD *)&v76[24] = 2114;
          *(_QWORD *)&v76[26] = v44;
          _os_log_impl(&dword_1B4A39000, v35, OS_LOG_TYPE_INFO, "CompletedRecurrenceClone: Skipping advanceForwardRecurrenceAfterNowAndAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasks to advance forward date alarm for reminder, didn't meet conditions for isCompleted and hasRecurrenceRules {reminderID: %{public}@, isCompleted:%{public}i, recurrenceRuleID: %{public}@, recurrenceRule: %{public}@, ruleCount: %{public}@};",
            buf,
            0x30u);

          v4 = 0x1E67F4000;
          self = v42;
          v17 = v65;

LABEL_25:
          goto LABEL_26;
        }
        objc_msgSend(v10, "recurrenceRules");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (!v15)
          goto LABEL_23;
        if (!v62
          || (objc_msgSend(v10, "objectID"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v62[2](v62, v16),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v16,
              !v17))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "rem_now");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v10, "dueDateComponents");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "nextRecurrentAdvanceAmountForDateComponents:afterDate:", v18, v17);
        v20 = v19;

        if (v20 <= 0.0)
        {
          objc_msgSend(*(id *)(v4 + 3888), "write");
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v10, "objectID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v74 = v36;
            v75 = 2048;
            *(double *)v76 = v20;
            _os_log_fault_impl(&dword_1B4A39000, v35, OS_LOG_TYPE_FAULT, "CompletedRecurrenceClone: Unable to clone recurrent reminder with dueDateAdvanceAmount < 0 {reminderID: %{public}@, dueDateAdvanceAmount: %f}", buf, 0x16u);
            goto LABEL_25;
          }
        }
        else
        {
          v61 = v9;
          objc_msgSend(v10, "dueDateComponents");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "timeZone");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqual:", v23);

          if (v24)
          {
            v64 = v17;
            objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "dueDateComponents");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)MEMORY[0x1E0C99D78];
            v28 = v10;
            objc_msgSend(v10, "dueDateComponents");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "rem_dateWithDateComponents:timeZone:", v29, v25);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v25, "nextDaylightSavingTimeTransitionAfterDate:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if (v31)
            {
              v33 = v31;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
              v33 = (id)objc_claimAutoreleasedReturnValue();
            }
            v45 = v33;

            objc_msgSend(v45, "timeIntervalSinceDate:", v30);
            if (v46 < v20)
            {
              objc_msgSend(*(id *)(v4 + 3888), "write");
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v10, "objectID");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "rem_stringRepresentation");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544386;
                v74 = v48;
                v75 = 2114;
                *(_QWORD *)v76 = v25;
                *(_WORD *)&v76[8] = 2114;
                *(_QWORD *)&v76[10] = v59;
                *(_WORD *)&v76[18] = 2114;
                *(_QWORD *)&v76[20] = v45;
                *(_WORD *)&v76[28] = 2048;
                *(double *)&v76[30] = v20;
                _os_log_impl(&dword_1B4A39000, v47, OS_LOG_TYPE_DEFAULT, "CompletedRecurrenceClone: FYI we are advancing a GMT due date across a DST boundary, this user maybe impacted by an hour drift caused by loss of user original due date time zone. {reminderID: %{public}@, userTimeZone: %{public}@, dueDateComponents(before): %{public}@, nextDSTDate: %{public}@, dueDateAdvanceAmount: %f}", buf, 0x34u);

              }
            }

            v10 = v28;
            v17 = v64;
          }
          v35 = +[REMReminder newObjectID](REMReminder, "newObjectID");
          objc_msgSend(v10, "duplicateForRecurrenceUsingReminderID:");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (v49)
          {
            objc_msgSend(v10, "objectID");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "setObject:forKeyedSubscript:", v49, v50);

            objc_msgSend(v10, "cleanupDuplicate:markAsCompleted:", v49, 1);
            objc_msgSend(v10, "setCompleted:", 0);
            objc_msgSend(v10, "recurrenceRules");
            v51 = objc_claimAutoreleasedReturnValue();
            v52 = v17;
            objc_msgSend(v10, "advanceForwardToNextRecurrenceAfterDate:", v17);
            v53 = v10;
            objc_msgSend(v10, "displayDate");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "date");
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v49, "setAlternativeDisplayDateDateForCalendarToPreviousRecurrentDateBefore:recurrenceRules:", v55, v51);
          }
          else
          {
            v52 = v17;
            v53 = v10;
            objc_msgSend(*(id *)(v4 + 3888), "write");
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
              -[REMSaveRequest advanceForwardRecurrenceAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasksAfterDate:].cold.1((uint64_t)v72, (uint64_t)v10);
          }
          v9 = v61;

          v10 = v53;
          v17 = v52;
        }
LABEL_26:

        ++v9;
      }
      while (v67 != v9);
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      v67 = v56;
    }
    while (v56);
  }

  -[REMSaveRequest setCloneCompletedRecurrentRemindersAtSave:](self, "setCloneCompletedRecurrentRemindersAtSave:", 0);
  v57 = (void *)objc_msgSend(v60, "copy");

  return v57;
}

- (id)_trackedAccountChangeItemForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    -[REMSaveRequest trackedAccountChangeItems](self, "trackedAccountChangeItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForSaveRequest:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
    v7 = 0;
  }

  return v7;
}

- (void)_trackAccountChangeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMSaveRequestTrackedValueContainer *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest addListWithName:toAccountChangeItem:listObjectID:].cold.1();

    v11 = "accountChangeItem";
    goto LABEL_7;
  }
  objc_msgSend(v4, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[REMSaveRequestTrackedValueContainer initWithValue:]([REMSaveRequestTrackedValueContainer alloc], "initWithValue:", v5);
    -[REMSaveRequest trackedAccountChangeItems](self, "trackedAccountChangeItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    goto LABEL_11;
  }
  +[REMLogStore write](REMLogStore, "write");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest _trackAccountChangeItem:].cold.2();

  objc_msgSend(v5, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v11 = "accountChangeItem.objectID";
LABEL_7:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v11);
  }
LABEL_11:

}

- (void)_updateTrackedAccountChangeItem:(id)a3 withObjectID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest addListWithName:toAccountChangeItem:listObjectID:].cold.1();

    v16 = "accountChangeItem";
    goto LABEL_15;
  }
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7)
    {
      -[REMSaveRequest trackedAccountChangeItems](self, "trackedAccountChangeItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[REMSaveRequest trackedAccountChangeItems](self, "trackedAccountChangeItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", v13);

      objc_msgSend(v6, "setObjectID:", v7);
      -[REMSaveRequest trackedAccountChangeItems](self, "trackedAccountChangeItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v7);

      goto LABEL_16;
    }
    +[REMLogStore write](REMLogStore, "write");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _updateTrackedAccountChangeItem:withObjectID:].cold.3();

    v16 = "newObjectID";
LABEL_15:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v16);
    goto LABEL_16;
  }
  +[REMLogStore write](REMLogStore, "write");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest _trackAccountChangeItem:].cold.2();

  objc_msgSend(v6, "objectID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v16 = "accountChangeItem.objectID";
    goto LABEL_15;
  }
LABEL_16:

}

- (id)_trackedListChangeItemForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    -[REMSaveRequest trackedListChangeItems](self, "trackedListChangeItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForSaveRequest:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
    v7 = 0;
  }

  return v7;
}

- (void)_trackListChangeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMSaveRequestTrackedValueContainer *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _updateAccountWithListChangeItem:].cold.1();

    v11 = "listChangeItem";
    goto LABEL_7;
  }
  objc_msgSend(v4, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[REMSaveRequestTrackedValueContainer initWithValue:]([REMSaveRequestTrackedValueContainer alloc], "initWithValue:", v5);
    -[REMSaveRequest trackedListChangeItems](self, "trackedListChangeItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    goto LABEL_11;
  }
  +[REMLogStore write](REMLogStore, "write");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest _trackListChangeItem:].cold.2();

  objc_msgSend(v5, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v11 = "listChangeItem.objectID";
LABEL_7:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v11);
  }
LABEL_11:

}

- (void)_updateTrackedListChangeItem:(id)a3 withObjectID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _updateAccountWithListChangeItem:].cold.1();

    v16 = "listChangeItem";
    goto LABEL_15;
  }
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7)
    {
      -[REMSaveRequest trackedListChangeItems](self, "trackedListChangeItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[REMSaveRequest trackedListChangeItems](self, "trackedListChangeItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", v13);

      objc_msgSend(v6, "setObjectID:", v7);
      -[REMSaveRequest trackedListChangeItems](self, "trackedListChangeItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v7);

      goto LABEL_16;
    }
    +[REMLogStore write](REMLogStore, "write");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _updateTrackedAccountChangeItem:withObjectID:].cold.3();

    v16 = "newObjectID";
LABEL_15:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v16);
    goto LABEL_16;
  }
  +[REMLogStore write](REMLogStore, "write");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest _trackListChangeItem:].cold.2();

  objc_msgSend(v6, "objectID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v16 = "listChangeItem.objectID";
    goto LABEL_15;
  }
LABEL_16:

}

- (id)_trackedSmartListChangeItemForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    -[REMSaveRequest trackedSmartListChangeItems](self, "trackedSmartListChangeItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForSaveRequest:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
    v7 = 0;
  }

  return v7;
}

- (void)_trackSmartListChangeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMSaveRequestTrackedValueContainer *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _trackSmartListChangeItem:].cold.1();

    v11 = "smartListChangeItem";
    goto LABEL_7;
  }
  objc_msgSend(v4, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[REMSaveRequestTrackedValueContainer initWithValue:]([REMSaveRequestTrackedValueContainer alloc], "initWithValue:", v5);
    -[REMSaveRequest trackedSmartListChangeItems](self, "trackedSmartListChangeItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    goto LABEL_11;
  }
  +[REMLogStore write](REMLogStore, "write");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest _trackSmartListChangeItem:].cold.2();

  objc_msgSend(v5, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v11 = "smartListChangeItem.objectID";
LABEL_7:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v11);
  }
LABEL_11:

}

- (void)_updateTrackedSmartListChangeItem:(id)a3 withObjectID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _trackSmartListChangeItem:].cold.1();

    v16 = "smartListChangeItem";
    goto LABEL_15;
  }
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7)
    {
      -[REMSaveRequest trackedSmartListChangeItems](self, "trackedSmartListChangeItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[REMSaveRequest trackedSmartListChangeItems](self, "trackedSmartListChangeItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", v13);

      objc_msgSend(v6, "setObjectID:", v7);
      -[REMSaveRequest trackedSmartListChangeItems](self, "trackedSmartListChangeItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v7);

      goto LABEL_16;
    }
    +[REMLogStore write](REMLogStore, "write");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _updateTrackedAccountChangeItem:withObjectID:].cold.3();

    v16 = "newObjectID";
LABEL_15:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v16);
    goto LABEL_16;
  }
  +[REMLogStore write](REMLogStore, "write");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest _trackSmartListChangeItem:].cold.2();

  objc_msgSend(v6, "objectID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v16 = "smartListChangeItem.objectID";
    goto LABEL_15;
  }
LABEL_16:

}

- (id)_trackedTemplateChangeItemForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    -[REMSaveRequest trackedTemplateChangeItems](self, "trackedTemplateChangeItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForSaveRequest:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
    v7 = 0;
  }

  return v7;
}

- (void)_trackTemplateChangeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMSaveRequestTrackedValueContainer *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _trackTemplateChangeItem:].cold.1();

    v11 = "templateChangeItem";
    goto LABEL_7;
  }
  objc_msgSend(v4, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[REMSaveRequestTrackedValueContainer initWithValue:]([REMSaveRequestTrackedValueContainer alloc], "initWithValue:", v5);
    -[REMSaveRequest trackedTemplateChangeItems](self, "trackedTemplateChangeItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    goto LABEL_11;
  }
  +[REMLogStore write](REMLogStore, "write");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest _trackTemplateChangeItem:].cold.2();

  objc_msgSend(v5, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v11 = "templateChangeItem.objectID";
LABEL_7:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v11);
  }
LABEL_11:

}

- (void)_trackListSectionChangeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMSaveRequestTrackedValueContainer *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _trackListSectionChangeItem:].cold.1();

    v11 = "listSectionChangeItem";
    goto LABEL_7;
  }
  objc_msgSend(v4, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[REMSaveRequestTrackedValueContainer initWithValue:]([REMSaveRequestTrackedValueContainer alloc], "initWithValue:", v5);
    -[REMSaveRequest trackedListSectionChangeItems](self, "trackedListSectionChangeItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    goto LABEL_11;
  }
  +[REMLogStore write](REMLogStore, "write");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest _trackListSectionChangeItem:].cold.2();

  objc_msgSend(v5, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v11 = "listSectionChangeItem.objectID";
LABEL_7:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v11);
  }
LABEL_11:

}

- (id)_trackedListSectionChangeItemForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    -[REMSaveRequest trackedListSectionChangeItems](self, "trackedListSectionChangeItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForSaveRequest:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
    v7 = 0;
  }

  return v7;
}

- (void)_trackSmartListSectionChangeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMSaveRequestTrackedValueContainer *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _trackSmartListSectionChangeItem:].cold.1();

    v11 = "smartListSectionChangeItem";
    goto LABEL_7;
  }
  objc_msgSend(v4, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[REMSaveRequestTrackedValueContainer initWithValue:]([REMSaveRequestTrackedValueContainer alloc], "initWithValue:", v5);
    -[REMSaveRequest trackedSmartListSectionChangeItems](self, "trackedSmartListSectionChangeItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    goto LABEL_11;
  }
  +[REMLogStore write](REMLogStore, "write");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest _trackSmartListSectionChangeItem:].cold.2();

  objc_msgSend(v5, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v11 = "smartListSectionChangeItem.objectID";
LABEL_7:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v11);
  }
LABEL_11:

}

- (id)_trackedSmartListSectionChangeItemForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    -[REMSaveRequest trackedSmartListSectionChangeItems](self, "trackedSmartListSectionChangeItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForSaveRequest:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
    v7 = 0;
  }

  return v7;
}

- (void)_trackTemplateSectionChangeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMSaveRequestTrackedValueContainer *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _trackTemplateSectionChangeItem:].cold.1();

    v11 = "templateSectionChangeItem";
    goto LABEL_7;
  }
  objc_msgSend(v4, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[REMSaveRequestTrackedValueContainer initWithValue:]([REMSaveRequestTrackedValueContainer alloc], "initWithValue:", v5);
    -[REMSaveRequest trackedTemplateSectionChangeItems](self, "trackedTemplateSectionChangeItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    goto LABEL_11;
  }
  +[REMLogStore write](REMLogStore, "write");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest _trackTemplateSectionChangeItem:].cold.2();

  objc_msgSend(v5, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v11 = "templateSectionChangeItem.objectID";
LABEL_7:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v11);
  }
LABEL_11:

}

- (id)_trackedTemplateSectionChangeItemForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    -[REMSaveRequest trackedTemplateSectionChangeItems](self, "trackedTemplateSectionChangeItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForSaveRequest:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
    v7 = 0;
  }

  return v7;
}

- (id)_trackedReminderChangeItemForObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    -[REMSaveRequest trackedReminderChangeItems](self, "trackedReminderChangeItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForSaveRequest:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[REMLogStore write](REMLogStore, "write");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
    v7 = 0;
  }

  return v7;
}

- (void)_trackReminderChangeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REMSaveRequestTrackedValueContainer *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[REMLogStore write](REMLogStore, "write");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _trackReminderChangeItem:].cold.1();

    v11 = "reminderChangeItem";
    goto LABEL_7;
  }
  objc_msgSend(v4, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[REMSaveRequestTrackedValueContainer initWithValue:]([REMSaveRequestTrackedValueContainer alloc], "initWithValue:", v5);
    -[REMSaveRequest trackedReminderChangeItems](self, "trackedReminderChangeItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    goto LABEL_11;
  }
  +[REMLogStore write](REMLogStore, "write");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest _trackReminderChangeItem:].cold.2();

  objc_msgSend(v5, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v11 = "reminderChangeItem.objectID";
LABEL_7:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v11);
  }
LABEL_11:

}

- (void)_updateTrackedReminderChangeItem:(id)a3 withObjectID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _trackReminderChangeItem:].cold.1();

    v16 = "reminderChangeItem";
    goto LABEL_15;
  }
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7)
    {
      -[REMSaveRequest trackedReminderChangeItems](self, "trackedReminderChangeItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[REMSaveRequest trackedReminderChangeItems](self, "trackedReminderChangeItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectForKey:", v13);

      objc_msgSend(v6, "setObjectID:", v7);
      -[REMSaveRequest trackedReminderChangeItems](self, "trackedReminderChangeItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v7);

      goto LABEL_16;
    }
    +[REMLogStore write](REMLogStore, "write");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _updateTrackedAccountChangeItem:withObjectID:].cold.3();

    v16 = "newObjectID";
LABEL_15:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v16);
    goto LABEL_16;
  }
  +[REMLogStore write](REMLogStore, "write");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    -[REMSaveRequest _trackReminderChangeItem:].cold.2();

  objc_msgSend(v6, "objectID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v16 = "reminderChangeItem.objectID";
    goto LABEL_15;
  }
LABEL_16:

}

- (void)_trackAccountCapabilities:(id)a3 forObjectID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint8_t buf[4];
  REMSaveRequest *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _trackAccountCapabilities:forObjectID:].cold.1();

    v12 = "accountCapabilities";
    goto LABEL_12;
  }
  +[REMLogStore write](REMLogStore, "write");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

    v12 = "objectID";
LABEL_12:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v12);
    goto LABEL_13;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_debug_impl(&dword_1B4A39000, v9, OS_LOG_TYPE_DEBUG, "_trackAccountCapabilities {SaveRequest: %@ accountCapabilities: %@ objectID: %@", buf, 0x20u);
  }

  -[REMSaveRequest trackedAccountCapabilities](self, "trackedAccountCapabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v7);

LABEL_13:
}

- (id)_trackedAccountCapabilitiesForObjectID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  REMAccountCapabilities *v9;
  REMAccountCapabilities *v10;
  NSObject *v11;

  v4 = a3;
  +[REMLogStore write](REMLogStore, "write");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[REMSaveRequest _trackedAccountCapabilitiesForObjectID:].cold.3();

    -[REMSaveRequest trackedAccountCapabilities](self, "trackedAccountCapabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
    }
    else
    {
      +[REMLogStore write](REMLogStore, "write");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[REMSaveRequest _trackedAccountCapabilitiesForObjectID:].cold.2();

      v9 = -[REMAccountCapabilities initWithAccountType:]([REMAccountCapabilities alloc], "initWithAccountType:", 0);
    }
    v10 = v9;

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:].cold.1();

    NSLog(CFSTR("'%s' is unexpectedly nil"), "objectID");
    v10 = 0;
  }

  return v10;
}

- (id)_copyReminder:(id)a3 toListChangeItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  REMSaveRequest *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  REMReminderChangeItem *v14;
  void *v15;
  void *v16;
  void *v17;
  REMReminderChangeItem *v18;
  REMReminderChangeItem *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _copyReminder:toListChangeItem:].cold.1();

    v21 = "original";
    goto LABEL_14;
  }
  if (!v7)
  {
    +[REMLogStore write](REMLogStore, "write");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _updateAccountWithListChangeItem:].cold.1();

    v21 = "listChangeItem";
LABEL_14:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v21);
    v19 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v7, "saveRequest");
  v9 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

  v10 = (_QWORD *)MEMORY[0x1E0C99768];
  if (v9 != self)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    objc_msgSend(v8, "saveRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", v12, CFSTR("List has incorrect save request {original: %@, saveRequest: %@, expectedSaveRequest: %@}"), v8, v13, self);

  }
  if (objc_msgSend(v8, "isGroup"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v10, CFSTR("listChangeItem is a group and adding reminder to group is not currently supported {listChangeItem: %@}"), v8);
  v14 = [REMReminderChangeItem alloc];
  objc_msgSend(v6, "storage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "capabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[REMReminderChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:](v14, "initWithSaveRequest:storage:accountCapabilities:observeInitialValues:", self, v15, v17, 0);

  v19 = -[REMReminderChangeItem initWithReminderChangeItem:insertIntoListChangeItem:]([REMReminderChangeItem alloc], "initWithReminderChangeItem:insertIntoListChangeItem:", v18, v8);
  -[REMSaveRequest _trackReminderChangeItem:](self, "_trackReminderChangeItem:", v19);

LABEL_15:
  return v19;
}

- (id)_copyReminder:(id)a3 toReminderSubtaskContextChangeItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  REMSaveRequest *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  REMReminderChangeItem *v14;
  void *v15;
  void *v16;
  void *v17;
  REMReminderChangeItem *v18;
  REMReminderChangeItem *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _copyReminder:toListChangeItem:].cold.1();

    v21 = "original";
    goto LABEL_12;
  }
  if (!v7)
  {
    +[REMLogStore write](REMLogStore, "write");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _copyReminder:toReminderSubtaskContextChangeItem:].cold.2();

    v21 = "parentReminderSubtaskContextChangeItem";
LABEL_12:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v21);
    v19 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v7, "reminderChangeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveRequest");
  v10 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

  if (v10 != self)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    objc_msgSend(v9, "saveRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", v12, CFSTR("Parent reminder has incorrect save request {original: %@, saveRequest: %@, expectedSaveRequest: %@}"), v9, v13, self);

  }
  v14 = [REMReminderChangeItem alloc];
  objc_msgSend(v6, "storage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "capabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[REMReminderChangeItem initWithSaveRequest:storage:accountCapabilities:observeInitialValues:](v14, "initWithSaveRequest:storage:accountCapabilities:observeInitialValues:", self, v15, v17, 0);

  v19 = -[REMReminderChangeItem initWithReminderChangeItem:insertIntoParentReminderSubtaskContextChangeItem:]([REMReminderChangeItem alloc], "initWithReminderChangeItem:insertIntoParentReminderSubtaskContextChangeItem:", v18, v8);
  -[REMSaveRequest _trackReminderChangeItem:](self, "_trackReminderChangeItem:", v19);

LABEL_13:
  return v19;
}

- (id)_copyReminderChangeItem:(id)a3 toListChangeItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  REMSaveRequest *v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  REMSaveRequest *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  REMReminderChangeItem *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _copyReminder:toListChangeItem:].cold.1();

    v20 = "original";
    goto LABEL_16;
  }
  if (!v7)
  {
    +[REMLogStore write](REMLogStore, "write");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _updateAccountWithListChangeItem:].cold.1();

    v20 = "listChangeItem";
LABEL_16:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v20);
    v18 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v6, "saveRequest");
  v9 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

  v10 = (uint64_t *)MEMORY[0x1E0C99768];
  if (v9 != self)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    objc_msgSend(v6, "saveRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", v12, CFSTR("Original reminder has incorrect save request {original: %@, saveRequest: %@, expectedSaveRequest: %@}"), v6, v13, self);

  }
  objc_msgSend(v8, "saveRequest");
  v14 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

  if (v14 != self)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *v10;
    objc_msgSend(v8, "saveRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("List has incorrect save request {original: %@, saveRequest: %@, expectedSaveRequest: %@}"), v8, v17, self);

  }
  if (objc_msgSend(v8, "isGroup"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v10, CFSTR("listChangeItem is a group and adding reminder to group is not currently supported {listChangeItem: %@}"), v8);
  v18 = -[REMReminderChangeItem initWithReminderChangeItem:insertIntoListChangeItem:]([REMReminderChangeItem alloc], "initWithReminderChangeItem:insertIntoListChangeItem:", v6, v8);
  -[REMSaveRequest _trackReminderChangeItem:](self, "_trackReminderChangeItem:", v18);
LABEL_17:

  return v18;
}

- (id)_copyReminderChangeItem:(id)a3 toReminderSubtaskContextChangeItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  REMSaveRequest *v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  REMSaveRequest *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  REMReminderChangeItem *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    +[REMLogStore write](REMLogStore, "write");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _copyReminder:toListChangeItem:].cold.1();

    v21 = "original";
    goto LABEL_14;
  }
  if (!v7)
  {
    +[REMLogStore write](REMLogStore, "write");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[REMSaveRequest _copyReminder:toReminderSubtaskContextChangeItem:].cold.2();

    v21 = "parentReminderSubtaskContextChangeItem";
LABEL_14:
    NSLog(CFSTR("'%s' is unexpectedly nil"), v21);
    v19 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v6, "saveRequest");
  v9 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

  v10 = (uint64_t *)MEMORY[0x1E0C99768];
  if (v9 != self)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    objc_msgSend(v6, "saveRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", v12, CFSTR("Original reminder has incorrect save request {original: %@, saveRequest: %@, expectedSaveRequest: %@}"), v6, v13, self);

  }
  objc_msgSend(v8, "reminderChangeItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "saveRequest");
  v15 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

  if (v15 != self)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *v10;
    objc_msgSend(v14, "saveRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "raise:format:", v17, CFSTR("Parent reminder has incorrect save request {original: %@, saveRequest: %@, expectedSaveRequest: %@}"), v14, v18, self);

  }
  v19 = -[REMReminderChangeItem initWithReminderChangeItem:insertIntoParentReminderSubtaskContextChangeItem:]([REMReminderChangeItem alloc], "initWithReminderChangeItem:insertIntoParentReminderSubtaskContextChangeItem:", v6, v8);
  -[REMSaveRequest _trackReminderChangeItem:](self, "_trackReminderChangeItem:", v19);

LABEL_15:
  return v19;
}

- (REMStore)store
{
  return self->_store;
}

- (NSMutableDictionary)trackedTemplateChangeItems
{
  return self->_trackedTemplateChangeItems;
}

- (NSMutableDictionary)trackedListSectionChangeItems
{
  return self->_trackedListSectionChangeItems;
}

- (NSMutableDictionary)trackedSmartListSectionChangeItems
{
  return self->_trackedSmartListSectionChangeItems;
}

- (NSMutableDictionary)trackedTemplateSectionChangeItems
{
  return self->_trackedTemplateSectionChangeItems;
}

- (NSMutableSet)saveRequestChangeEvents
{
  return self->_saveRequestChangeEvents;
}

- (void)setSaveRequestChangeEvents:(id)a3
{
  objc_storeStrong((id *)&self->_saveRequestChangeEvents, a3);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isSaved
{
  return self->_saved;
}

- (void)setSaved:(BOOL)a3
{
  self->_saved = a3;
}

- (NSMutableDictionary)trackedAccountChangeItems
{
  return self->_trackedAccountChangeItems;
}

- (NSMutableDictionary)trackedListChangeItems
{
  return self->_trackedListChangeItems;
}

- (NSMutableDictionary)trackedSmartListChangeItems
{
  return self->_trackedSmartListChangeItems;
}

- (NSMutableDictionary)trackedReminderChangeItems
{
  return self->_trackedReminderChangeItems;
}

- (NSMutableDictionary)trackedAccountCapabilities
{
  return self->_trackedAccountCapabilities;
}

- (BOOL)updateLastModifiedDates
{
  return self->_updateLastModifiedDates;
}

- (void)setUpdateLastModifiedDates:(BOOL)a3
{
  self->_updateLastModifiedDates = a3;
}

- (BOOL)saveIsNoopIfNoChangedKeys
{
  return self->_saveIsNoopIfNoChangedKeys;
}

- (void)setSaveIsNoopIfNoChangedKeys:(BOOL)a3
{
  self->_saveIsNoopIfNoChangedKeys = a3;
}

- (BOOL)cloneCompletedRecurrentRemindersAtSave
{
  return self->_cloneCompletedRecurrentRemindersAtSave;
}

- (void)setCloneCompletedRecurrentRemindersAtSave:(BOOL)a3
{
  self->_cloneCompletedRecurrentRemindersAtSave = a3;
}

- (BOOL)applyCRDTsWithoutMerging
{
  return self->_applyCRDTsWithoutMerging;
}

- (void)setApplyCRDTsWithoutMerging:(BOOL)a3
{
  self->_applyCRDTsWithoutMerging = a3;
}

- (BOOL)syncToCloudKit
{
  return self->_syncToCloudKit;
}

- (void)setSyncToCloudKit:(BOOL)a3
{
  self->_syncToCloudKit = a3;
}

- (REMReplicaManagerProviding)replicaManagerProvider
{
  return self->_replicaManagerProvider;
}

- (void)setReplicaManagerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_replicaManagerProvider, a3);
}

- (REMSaveRequestNotifyChangeDelegate)notifyChangeDelegate
{
  return (REMSaveRequestNotifyChangeDelegate *)objc_loadWeakRetained((id *)&self->_notifyChangeDelegate);
}

- (void)setNotifyChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_notifyChangeDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notifyChangeDelegate);
  objc_storeStrong((id *)&self->_replicaManagerProvider, 0);
  objc_storeStrong((id *)&self->_trackedAccountCapabilities, 0);
  objc_storeStrong((id *)&self->_trackedReminderChangeItems, 0);
  objc_storeStrong((id *)&self->_trackedSmartListChangeItems, 0);
  objc_storeStrong((id *)&self->_trackedListChangeItems, 0);
  objc_storeStrong((id *)&self->_trackedAccountChangeItems, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_saveRequestChangeEvents, 0);
  objc_storeStrong((id *)&self->_trackedTemplateSectionChangeItems, 0);
  objc_storeStrong((id *)&self->_trackedSmartListSectionChangeItems, 0);
  objc_storeStrong((id *)&self->_trackedListSectionChangeItems, 0);
  objc_storeStrong((id *)&self->_trackedTemplateChangeItems, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (id)_addLocalAccountWithName:(id)a3 accountObjectID:(id)a4
{
  return -[REMSaveRequest __addAccountWithType:name:accountObjectID:](self, "__addAccountWithType:name:accountObjectID:", 1, a3, a4);
}

- (id)_addLocalAccountWithName:(id)a3
{
  return -[REMSaveRequest _addLocalAccountWithName:accountObjectID:](self, "_addLocalAccountWithName:accountObjectID:", a3, 0);
}

- (id)_addCalDavAccountWithName:(id)a3 accountObjectID:(id)a4
{
  return -[REMSaveRequest __addAccountWithType:name:accountObjectID:](self, "__addAccountWithType:name:accountObjectID:", 3, a3, a4);
}

- (id)_addCalDavAccountWithName:(id)a3
{
  return -[REMSaveRequest _addCalDavAccountWithName:accountObjectID:](self, "_addCalDavAccountWithName:accountObjectID:", a3, 0);
}

- (id)_addExchangeAccountWithName:(id)a3 accountObjectID:(id)a4
{
  return -[REMSaveRequest __addAccountWithType:name:accountObjectID:](self, "__addAccountWithType:name:accountObjectID:", 4, a3, a4);
}

- (id)_addExchangeAccountWithName:(id)a3
{
  return -[REMSaveRequest _addExchangeAccountWithName:accountObjectID:](self, "_addExchangeAccountWithName:accountObjectID:", a3, 0);
}

- (id)_addTestOnlyLocalInternalAccountWithName:(id)a3 accountObjectID:(id)a4
{
  return -[REMSaveRequest __addAccountWithType:name:accountObjectID:](self, "__addAccountWithType:name:accountObjectID:", 5, a3, a4);
}

- (id)_addTestOnlyLocalInternalAccountWithName:(id)a3
{
  return -[REMSaveRequest _addTestOnlyLocalInternalAccountWithName:accountObjectID:](self, "_addTestOnlyLocalInternalAccountWithName:accountObjectID:", a3, 0);
}

- (id)_addTestOnlyPrimaryCKAccountWithName:(id)a3 accountObjectID:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[REMSaveRequest __addAccountWithType:name:accountObjectID:](self, "__addAccountWithType:name:accountObjectID:", _auto_REMAccountTypeForPrimaryCloudKit(), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_addTestOnlyPrimaryCKAccountWithName:(id)a3
{
  return -[REMSaveRequest _addTestOnlyPrimaryCKAccountWithName:accountObjectID:](self, "_addTestOnlyPrimaryCKAccountWithName:accountObjectID:", a3, 0);
}

- (id)_addTestOnlyExtraPrimaryCKAccountWithName:(id)a3 accountObjectID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[REMSaveRequest __addAccountWithType:name:accountObjectID:](self, "__addAccountWithType:name:accountObjectID:", _auto_REMAccountTypeForPrimaryCloudKit(), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setIsAddingExtraPrimaryCKAccountForTesting:", 1);

  return v8;
}

- (id)_addTestOnlyExtraPrimaryCKAccountWithName:(id)a3
{
  return -[REMSaveRequest _addTestOnlyExtraPrimaryCKAccountWithName:accountObjectID:](self, "_addTestOnlyExtraPrimaryCKAccountWithName:accountObjectID:", a3, 0);
}

- (id)_addTestOnlyNonPrimaryCKAccountWithName:(id)a3 accountObjectID:(id)a4
{
  return -[REMSaveRequest __addAccountWithType:name:accountObjectID:](self, "__addAccountWithType:name:accountObjectID:", 6, a3, a4);
}

- (id)_addTestOnlyNonPrimaryCKAccountWithName:(id)a3
{
  return -[REMSaveRequest _addTestOnlyNonPrimaryCKAccountWithName:accountObjectID:](self, "_addTestOnlyNonPrimaryCKAccountWithName:accountObjectID:", a3, 0);
}

- (id)__addAccountWithType:(int64_t)a3 name:(id)a4 accountObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  REMAccountChangeItem *v11;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "name");
    if (v10)
      goto LABEL_3;
LABEL_5:
    v10 = +[REMAccount newObjectID](REMAccount, "newObjectID");
    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v11 = -[REMAccountChangeItem initWithObjectID:type:name:insertIntoSaveRequest:]([REMAccountChangeItem alloc], "initWithObjectID:type:name:insertIntoSaveRequest:", v10, a3, v8, self);
  -[REMSaveRequest _trackAccountChangeItem:](self, "_trackAccountChangeItem:", v11);

  return v11;
}

- (id)__addAccountWithType:(int64_t)a3 name:(id)a4
{
  return -[REMSaveRequest __addAccountWithType:name:accountObjectID:](self, "__addAccountWithType:name:accountObjectID:", a3, a4, 0);
}

- (id)addCustomSmartListWithName:(id)a3 toListSublistContextChangeItem:(id)a4 smartListObjectID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  REMSaveRequest *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  REMSmartListChangeItem *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    NSLog(CFSTR("'%s' is unexpectedly nil"), "name");
    if (v9)
      goto LABEL_3;
  }
  NSLog(CFSTR("'%s' is unexpectedly nil"), "listSublistContextChangeItem");
LABEL_3:
  objc_msgSend(v9, "listChangeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSaveRequest _updateAccountWithListChangeItem:](self, "_updateAccountWithListChangeItem:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "saveRequest");
  v13 = (REMSaveRequest *)objc_claimAutoreleasedReturnValue();

  v14 = (_QWORD *)MEMORY[0x1E0C99768];
  if (v13 != self)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99768];
    objc_msgSend(v12, "saveRequest");
    v17 = v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "raise:format:", v16, CFSTR("accountChangeItem (%@) has incorrect saveRequest (%@). Expected %@"), v12, v18, self);

    v14 = v17;
  }
  objc_msgSend(v12, "capabilities");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "supportsCustomSmartLists");

  if ((v20 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *v14;
    objc_msgSend(v12, "objectID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "raise:format:", v22, CFSTR("Cannot add CSL to sublist context because the account does not support it {accountID: %@}"), v23);

  }
  if (!v10)
    v10 = +[REMSmartList newObjectID](REMSmartList, "newObjectID");
  v24 = -[REMSmartListChangeItem initWithCustomSmartListObjectID:insertIntoListSublistContextChangeItem:]([REMSmartListChangeItem alloc], "initWithCustomSmartListObjectID:insertIntoListSublistContextChangeItem:", v10, v9);
  -[REMSaveRequest _trackSmartListChangeItem:](self, "_trackSmartListChangeItem:", v24);
  -[REMSmartListChangeItem setName:](v24, "setName:", v8);

  return v24;
}

- (void)updateAccount:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)updateAccount:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_updateAccountWithListChangeItem:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_updateAccountWithListChangeItem:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)addGroupWithName:toAccountGroupContextChangeItem:groupObjectID:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)addListWithName:toAccountChangeItem:listObjectID:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)addListUsingTemplate:(void *)a1 toAccountChangeItem:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1B4A39000, v2, v3, "Failed to add list using template because account does not support templates. {accountChangeItem.objectID: %{public}@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)addListUsingTemplate:(void *)a1 toAccountChangeItem:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1B4A39000, v2, v3, "Template has no name {templateID: %{public}@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)addListUsingPublicTemplateWithREMListRepresentation:(void *)a1 toAccountChangeItem:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1B4A39000, v2, v3, "Failed to add list using public template because account does not support templates. {accountChangeItem.objectID: %{public}@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)addListUsingPublicTemplateWithREMListRepresentation:(void *)a1 toAccountChangeItem:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1B4A39000, v2, v3, "Public template has no name {publicTemplateObjectID: %{public}@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)updateList:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)updateList:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_updateListStorage:accountCapabilities:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_updateListWithReminderChangeItem:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_updateListWithReminderChangeItem:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)updateSmartList:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)updateSmartList:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)updateTemplate:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)updateTemplate:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)addReminderWithTitle:toListChangeItem:reminderObjectID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, v0, v1, "rem_log_fault_if (![[reminderObjectID entityName] isEqualToString:[REMTemplate cdEntityNameForSavedReminder]]) -- Failed to add new reminder to a list, which represents a template, because reminderObjectID.entityName was not REMCDSavedReminder {reminderObjectID: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)addReminderWithTitle:toListChangeItem:reminderObjectID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, v0, v1, "rem_log_fault_if (![[reminderObjectID entityName] isEqualToString:[REMReminder cdEntityName]]) -- Failed to add new reminder to a list, which does not represents a template, because reminderObjectID.entityName was not REMCDReminder {reminderObjectID: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)addReminderWithTitle:toReminderSubtaskContextChangeItem:reminderObjectID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, v0, v1, "rem_log_fault_if (![[reminderObjectID entityName] isEqualToString:[REMTemplate cdEntityNameForSavedReminder]]) -- Failed to add new reminder to parent saved reminder in a template because reminderObjectID.entityName was not REMCDSavedReminder {reminderObjectID: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)addReminderWithTitle:toReminderSubtaskContextChangeItem:reminderObjectID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, v0, v1, "rem_log_fault_if (![[reminderObjectID entityName] isEqualToString:[REMReminder cdEntityName]]) -- Failed to add new reminder to parent reminder in a list because reminderObjectID.entityName was not REMCDReminder {reminderObjectID: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)updateReminder:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)updateReminder:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)addListSectionWithDisplayName:toListSectionContextChangeItem:listSectionObjectID:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)updateListSection:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)addSmartListSectionWithDisplayName:toSmartListSectionContextChangeItem:smartListSectionObjectID:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)updateSmartListSection:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)addTemplateSectionWithDisplayName:toTemplateSectionContextChangeItem:templateSectionObjectID:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)updateTemplateSection:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_updateResolutionTokenMapForChangeItem:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B4A39000, log, OS_LOG_TYPE_ERROR, "resolutionTokenMap should never be undefined", v1, 2u);
}

- (void)preFlightActionSaveAndUpdateParentsOfRecurrentSubtasksWithLogPrefix:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(&dword_1B4A39000, v0, (uint64_t)v0, "%{public}@: Preflight -  Error fetching parentsOfRecurrentSubtasks {error: %@}", v1);
  OUTLINED_FUNCTION_3_1();
}

- (void)advanceForwardRecurrenceAfterNowAndCreateIncompleteCloneWithoutRecurrenceRulesAndSubtasks
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_2_5(a1, a2), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138543362;
  *v2 = v4;
  OUTLINED_FUNCTION_11_1(&dword_1B4A39000, v5, v6, "IncompleteRecurrenceClone: Unable to clone recurrent reminder {reminderID: %{public}@}");

  OUTLINED_FUNCTION_5_2();
}

- (void)advanceForwardRecurrenceAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasksAfterDate:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_2_5(a1, a2), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138543362;
  *v2 = v4;
  OUTLINED_FUNCTION_11_1(&dword_1B4A39000, v5, v6, "CompletedRecurrenceClone: Unable to clone recurrent reminder {reminderID: %{public}@}");

  OUTLINED_FUNCTION_5_2();
}

- (void)_trackAccountChangeItem:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_updateTrackedAccountChangeItem:withObjectID:.cold.3()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackListChangeItem:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackSmartListChangeItem:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackSmartListChangeItem:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackTemplateChangeItem:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackTemplateChangeItem:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackListSectionChangeItem:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackListSectionChangeItem:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackSmartListSectionChangeItem:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackSmartListSectionChangeItem:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackTemplateSectionChangeItem:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackTemplateSectionChangeItem:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackReminderChangeItem:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackReminderChangeItem:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackAccountCapabilities:forObjectID:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_trackedAccountCapabilitiesForObjectID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, v0, v1, "Don't have account capabilities for {objectID: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)_trackedAccountCapabilitiesForObjectID:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_4();
  _os_log_debug_impl(&dword_1B4A39000, v0, OS_LOG_TYPE_DEBUG, "_trackedAccountCapabilitiesForObjectID {SaveRequest: %@ objectID: %@", v1, 0x16u);
  OUTLINED_FUNCTION_3_1();
}

- (void)_copyReminder:toListChangeItem:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

- (void)_copyReminder:toReminderSubtaskContextChangeItem:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  const char *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_12();
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B4A39000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1();
}

@end
