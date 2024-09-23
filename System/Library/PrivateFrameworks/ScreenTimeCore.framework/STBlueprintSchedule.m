@implementation STBlueprintSchedule

+ (id)startDateKeyPaths
{
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("day0Start");
  v3[1] = CFSTR("day1Start");
  v3[2] = CFSTR("day2Start");
  v3[3] = CFSTR("day3Start");
  v3[4] = CFSTR("day4Start");
  v3[5] = CFSTR("day5Start");
  v3[6] = CFSTR("day6Start");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)endDateKeyPaths
{
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("day0End");
  v3[1] = CFSTR("day1End");
  v3[2] = CFSTR("day2End");
  v3[3] = CFSTR("day3End");
  v3[4] = CFSTR("day4End");
  v3[5] = CFSTR("day5End");
  v3[6] = CFSTR("day6End");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)keyPathsForValuesAffectingScheduleRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("day0Start"), CFSTR("day1Start"), CFSTR("day2Start"), CFSTR("day3Start"), CFSTR("day4Start"), CFSTR("day5Start"), CFSTR("day6Start"), CFSTR("day0End"), CFSTR("day1End"), CFSTR("day2End"), CFSTR("day3End"), CFSTR("day4End"), CFSTR("day5End"), CFSTR("day6End"), 0);
}

- (STBlueprintScheduleRepresentation)scheduleRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  STBlueprintScheduleRepresentation *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;

  v25 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v3;
  objc_msgSend(v3, "setTimeZone:", v4);

  +[STBlueprintSchedule startDateKeyPaths](STBlueprintSchedule, "startDateKeyPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STBlueprintSchedule endDateKeyPaths](STBlueprintSchedule, "endDateKeyPaths");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_opt_new();
  v26 = v5;
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v30 = 1;
    v9 = 1;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[STBlueprintSchedule valueForKey:](self, "valueForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[STBlueprintSchedule valueForKey:](self, "valueForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      if (v11 && v13)
      {
        v15 = (void *)objc_opt_new();
        objc_msgSend(v15, "setDay:", v8);
        objc_msgSend(v29, "components:fromDate:", 96, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          v30 &= objc_msgSend(v6, "isEqual:", v16);
        objc_msgSend(v15, "setStartTime:", v16);
        objc_msgSend(v29, "components:fromDate:", 96, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          v9 = objc_msgSend(v7, "isEqual:", v17) & v9;
        objc_msgSend(v15, "setEndTime:", v17);
        v18 = v16;

        objc_msgSend(v27, "addObject:", v15);
        v14 = v9;
        v6 = v18;
        v5 = v26;
      }
      else
      {
        v17 = v7;
        v30 = 0;
      }

      ++v8;
      v9 = v14;
      v7 = v17;
    }
    while (v8 < objc_msgSend(v5, "count"));
  }
  else
  {
    v17 = 0;
    v6 = 0;
    LOBYTE(v14) = 1;
    LOBYTE(v30) = 1;
  }
  objc_msgSend(v25, "setCustomScheduleItems:", v27);
  if ((v30 & 1) != 0 && (v14 & 1) != 0)
  {
    objc_msgSend(v27, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_new();
    objc_msgSend(v19, "startTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setStartTime:", v21);

    objc_msgSend(v19, "endTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setEndTime:", v22);

    objc_msgSend(v25, "setSimpleSchedule:", v20);
    v5 = v26;

  }
  v23 = v25;

  return v23;
}

- (void)setScheduleRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "simpleSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "startTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STBlueprintSchedule setStartTime:endTime:](self, "setStartTime:endTime:", v7, v8);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "customScheduleItems", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v14, "startTime");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "endTime");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[STBlueprintSchedule setStartTime:endTime:forDay:](self, "setStartTime:endTime:forDay:", v15, v16, objc_msgSend(v14, "day"));

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void)setStartTime:(id)a3 endTime:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeZone:", v9);

  v33 = v6;
  objc_msgSend(v8, "dateFromComponents:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v8;
  v32 = v7;
  objc_msgSend(v8, "dateFromComponents:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STBlueprintSchedule startDateKeyPaths](STBlueprintSchedule, "startDateKeyPaths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[STBlueprintSchedule endDateKeyPaths](STBlueprintSchedule, "endDateKeyPaths");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[STBlueprintSchedule valueForKey:](self, "valueForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToDate:", v10);

        if ((v20 & 1) == 0)
          -[STBlueprintSchedule setValue:forKey:](self, "setValue:forKey:", v10, v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v15);
  }
  v30 = v13;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v21 = v29;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
        -[STBlueprintSchedule valueForKey:](self, "valueForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToDate:", v11);

        if ((v28 & 1) == 0)
          -[STBlueprintSchedule setValue:forKey:](self, "setValue:forKey:", v11, v26);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v23);
  }

}

- (void)setStartTime:(id)a3 endTime:(id)a4 forDay:(unint64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  if (a5 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STBlueprintSchedule.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("day < 7"));

  }
  v10 = 0;
  if (v15)
  {
    v11 = 0;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTimeZone:", v13);

      objc_msgSend(v12, "dateFromComponents:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dateFromComponents:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v11 = 0;
  }
  switch(a5)
  {
    case 0uLL:
      -[STBlueprintSchedule setDay0Start:](self, "setDay0Start:", v11);
      -[STBlueprintSchedule setDay0End:](self, "setDay0End:", v10);
      break;
    case 1uLL:
      -[STBlueprintSchedule setDay1Start:](self, "setDay1Start:", v11);
      -[STBlueprintSchedule setDay1End:](self, "setDay1End:", v10);
      break;
    case 2uLL:
      -[STBlueprintSchedule setDay2Start:](self, "setDay2Start:", v11);
      -[STBlueprintSchedule setDay2End:](self, "setDay2End:", v10);
      break;
    case 3uLL:
      -[STBlueprintSchedule setDay3Start:](self, "setDay3Start:", v11);
      -[STBlueprintSchedule setDay3End:](self, "setDay3End:", v10);
      break;
    case 4uLL:
      -[STBlueprintSchedule setDay4Start:](self, "setDay4Start:", v11);
      -[STBlueprintSchedule setDay4End:](self, "setDay4End:", v10);
      break;
    case 5uLL:
      -[STBlueprintSchedule setDay5Start:](self, "setDay5Start:", v11);
      -[STBlueprintSchedule setDay5End:](self, "setDay5End:", v10);
      break;
    case 6uLL:
      -[STBlueprintSchedule setDay6Start:](self, "setDay6Start:", v11);
      -[STBlueprintSchedule setDay6End:](self, "setDay6End:", v10);
      break;
    default:
      break;
  }

}

- (void)_datePairForDay:(int64_t)a3 startDate:(id *)a4 endDate:(id *)a5
{
  uint64_t v8;
  void *v9;
  id v10;

  switch(a3)
  {
    case 1:
      -[STBlueprintSchedule day0Start](self, "day0Start");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[STBlueprintSchedule day0End](self, "day0End");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2:
      -[STBlueprintSchedule day1Start](self, "day1Start");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[STBlueprintSchedule day1End](self, "day1End");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3:
      -[STBlueprintSchedule day2Start](self, "day2Start");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[STBlueprintSchedule day2End](self, "day2End");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4:
      -[STBlueprintSchedule day3Start](self, "day3Start");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[STBlueprintSchedule day3End](self, "day3End");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5:
      -[STBlueprintSchedule day4Start](self, "day4Start");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[STBlueprintSchedule day4End](self, "day4End");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 6:
      -[STBlueprintSchedule day5Start](self, "day5Start");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[STBlueprintSchedule day5End](self, "day5End");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 7:
      -[STBlueprintSchedule day6Start](self, "day6Start");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[STBlueprintSchedule day6End](self, "day6End");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v9 = (void *)v8;
      if (a4)
        goto LABEL_12;
      goto LABEL_13;
    default:
      v9 = 0;
      v10 = 0;
      if (!a4)
        goto LABEL_13;
LABEL_12:
      *a4 = objc_retainAutorelease(v10);
LABEL_13:
      if (a5)
        *a5 = objc_retainAutorelease(v9);

      return;
  }
}

- (BOOL)isActiveAtDate:(id)a3 inCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  char v12;

  v6 = a3;
  v7 = a4;
  if (-[STBlueprintSchedule enabled](self, "enabled"))
  {
    v12 = 0;
    -[STBlueprintSchedule computeNextScheduleBoundaryAfterDate:inCalendar:isStartDate:](self, "computeNextScheduleBoundaryAfterDate:inCalendar:isStartDate:", v6, v7, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v12 == 0;
    else
      v9 = 0;
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)computeNextScheduleBoundaryAfterDate:(id)a3 inCalendar:(id)a4 isStartDate:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v24;
  id v25;

  v8 = a4;
  STUTCErasedDateFromDate(a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "copy");

  STUTCTimeZone();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimeZone:", v11);

  v24 = 0;
  v25 = 0;
  v12 = -[STBlueprintSchedule _computeStartBoundaries:endBoundaries:forCreationDate:calendar:](self, "_computeStartBoundaries:endBoundaries:forCreationDate:calendar:", &v25, &v24, v9, v10);
  v13 = v25;
  v14 = v24;
  v15 = 0;
  if (v12)
  {
    v16 = (void *)objc_msgSend(v13, "mutableCopy");
    v17 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_2);
    objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_2);
    objc_msgSend(v16, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v15 = 0;
    if (v18 && v19)
    {
      v21 = objc_msgSend(v18, "compare:", v19);
      if (v21 == -1)
        v22 = v18;
      else
        v22 = v20;
      if (a5)
        *a5 = v21 == -1;
      v15 = v22;
    }

  }
  return v15;
}

uint64_t __83__STBlueprintSchedule_computeNextScheduleBoundaryAfterDate_inCalendar_isStartDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)computeNextOverrideEndDateForState:(int64_t)a3 creationDate:(id)a4 inCalendar:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  id v14;
  void *v15;
  id v17;
  id v18;

  v8 = a5;
  STUTCErasedDateFromDate(a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "copy");

  STUTCTimeZone();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimeZone:", v11);

  v17 = 0;
  v18 = 0;
  v12 = -[STBlueprintSchedule _computeStartBoundaries:endBoundaries:forCreationDate:calendar:](self, "_computeStartBoundaries:endBoundaries:forCreationDate:calendar:", &v18, &v17, v9, v10);
  v13 = v18;
  v14 = v17;
  v15 = 0;
  if (v12)
  {
    +[STBlueprintSchedule _boundaryForState:fromStartBoundaries:fromEndBoundaries:](STBlueprintSchedule, "_boundaryForState:fromStartBoundaries:fromEndBoundaries:", a3, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (BOOL)_computeStartBoundaries:(id *)a3 endBoundaries:(id *)a4 forCreationDate:(id)a5 calendar:(id)a6
{
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  id v23;
  id v24;
  id *v26;
  id *v27;
  BOOL v28;
  void *v29;
  id v30;
  id v31;

  v10 = a5;
  v11 = a6;
  v12 = v11;
  if (a3)
    v13 = a4 == 0;
  else
    v13 = 1;
  v14 = !v13;
  if (!v13)
  {
    v26 = a3;
    v27 = a4;
    v28 = v14;
    v15 = objc_msgSend(v11, "component:fromDate:", 512, v10);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "maximumRangeOfUnit:", 512);
    v18 = v17;

    v19 = (void *)objc_opt_new();
    v29 = (void *)objc_opt_new();
    if (v18 >= 1)
    {
      v20 = 0;
      v21 = (v15 - 1) % v18;
      do
      {
        v30 = 0;
        v31 = 0;
        v22 = -[STBlueprintSchedule _computeNextStartDate:nextEndDate:afterDate:forDay:usingCalendar:](self, "_computeNextStartDate:nextEndDate:afterDate:forDay:usingCalendar:", &v31, &v30, v10, (v21 + v20) % v18 + 1, v12);
        v23 = v31;
        v24 = v30;
        if (v22)
        {
          objc_msgSend(v19, "addObject:", v23);
          objc_msgSend(v29, "addObject:", v24);
        }

        ++v20;
      }
      while (v18 != v20);
    }
    *v26 = (id)objc_msgSend(v19, "copy");
    *v27 = (id)objc_msgSend(v29, "copy");

    v14 = v28;
  }

  return v14;
}

- (BOOL)_computeNextStartDate:(id *)a3 nextEndDate:(id *)a4 afterDate:(id)a5 forDay:(int64_t)a6 usingCalendar:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  id *v21;
  id *v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  void *v27;
  id v29;
  id v30;

  v12 = a5;
  v13 = a7;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimeZone:", v14);

  v29 = 0;
  v30 = 0;
  -[STBlueprintSchedule _datePairForDay:startDate:endDate:](self, "_datePairForDay:startDate:endDate:", a6, &v30, &v29);
  v15 = v30;
  v16 = v29;
  v17 = v16;
  v18 = 0;
  if (v15 && v16)
  {
    +[STBlueprintSchedule _nextBoundaryAfterDate:matchingDate:onDay:inCalendar:](STBlueprintSchedule, "_nextBoundaryAfterDate:matchingDate:onDay:inCalendar:", v12, v15, a6, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "compare:", v17) == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "maximumRangeOfUnit:", 512);
      v21 = a3;
      v22 = a4;
      v24 = v23;

      v25 = a6 % v24;
      a4 = v22;
      a3 = v21;
      a6 = v25 + 1;
    }
    +[STBlueprintSchedule _nextBoundaryAfterDate:matchingDate:onDay:inCalendar:](STBlueprintSchedule, "_nextBoundaryAfterDate:matchingDate:onDay:inCalendar:", v12, v17, a6, v13);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    v18 = 0;
    if (v19 && v26)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v19);
      if (a4)
        *a4 = objc_retainAutorelease(v27);
      v18 = 1;
    }

  }
  return v18;
}

+ (id)_boundaryForState:(int64_t)a3 fromStartBoundaries:(id)a4 fromEndBoundaries:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (a3 != 1)
  {
    if (a3)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v8 = v7;
  }
  v10 = (void *)objc_msgSend(v8, "mutableCopy");
LABEL_6:
  objc_msgSend(v10, "sortUsingComparator:", &__block_literal_global_85);
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  return v12;
}

uint64_t __79__STBlueprintSchedule__boundaryForState_fromStartBoundaries_fromEndBoundaries___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)_nextBoundaryAfterDate:(id)a3 matchingDate:(id)a4 onDay:(int64_t)a5 inCalendar:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a6;
  v10 = a3;
  objc_msgSend(v9, "components:fromDate:", 96, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWeekday:", a5);
  objc_msgSend(v9, "nextDateAfterDate:matchingComponents:options:", v10, v11, 1024);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("calendarIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintSchedule setCalendarIdentifier:](self, "setCalendarIdentifier:", v5);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notificationTimeInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlueprintSchedule setNotificationTimeInterval:](self, "setNotificationTimeInterval:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "BOOLValue");
  else
    v9 = 1;
  -[STBlueprintSchedule setEnabled:](self, "setEnabled:", v9);
  +[STBlueprintSchedule startDateKeyPaths](STBlueprintSchedule, "startDateKeyPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[STBlueprintSchedule endDateKeyPaths](STBlueprintSchedule, "endDateKeyPaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[STBlueprintSchedule setValue:forKeyPath:](self, "setValue:forKeyPath:", v18, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v14);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = v11;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        objc_msgSend(v4, "objectForKeyedSubscript:", v24, (_QWORD)v27);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[STBlueprintSchedule setValue:forKeyPath:](self, "setValue:forKeyPath:", v25, v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v21);
  }

  return 1;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[STBlueprintSchedule calendarIdentifier](self, "calendarIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("calendarIdentifier"));

  -[STBlueprintSchedule notificationTimeInterval](self, "notificationTimeInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("notificationTimeInterval"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STBlueprintSchedule enabled](self, "enabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("enabled"));

  +[STBlueprintSchedule startDateKeyPaths](STBlueprintSchedule, "startDateKeyPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[STBlueprintSchedule endDateKeyPaths](STBlueprintSchedule, "endDateKeyPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[STBlueprintSchedule valueForKeyPath:](self, "valueForKeyPath:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        -[STBlueprintSchedule valueForKeyPath:](self, "valueForKeyPath:", v21, (_QWORD)v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v18);
  }

  v23 = (void *)objc_msgSend(v3, "copy");
  return v23;
}

@end
