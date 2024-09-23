@implementation ICSTimeZoneBlock

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  -[ICSTimeZoneBlock dtstart](self, "dtstart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dtstart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (BOOL)validate:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  objc_super v17;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DTSTART"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("TZOFFSETTO"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("TZOFFSETFROM"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RRULE"));
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8
          || (v9 = (void *)v8,
              -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RDATE")),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              v10,
              v9,
              !v10))
        {
          v17.receiver = self;
          v17.super_class = (Class)ICSTimeZoneBlock;
          return -[ICSComponent validate:](&v17, sel_validate_, a3);
        }
        if (a3)
        {
          v11 = (void *)MEMORY[0x1E0CB35C8];
          v12 = (void *)MEMORY[0x1E0C99D80];
          v13 = *MEMORY[0x1E0CB2D50];
          v14 = CFSTR("RDATE and RRULE cannot both be set for VTIMEZONE.");
LABEL_14:
          objc_msgSend(v12, "dictionaryWithObject:forKey:", v14, v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iCalendar"), 1000, v15);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else if (a3)
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = *MEMORY[0x1E0CB2D50];
        v14 = CFSTR("TZOFFSETFROM is required for VTIMEZONE.");
        goto LABEL_14;
      }
    }
    else if (a3)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = *MEMORY[0x1E0CB2D50];
      v14 = CFSTR("TZOFFSETTO is required for VTIMEZONE.");
      goto LABEL_14;
    }
  }
  else if (a3)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = *MEMORY[0x1E0CB2D50];
    v14 = CFSTR("DTSTART is required for VTIMEZONE.");
    goto LABEL_14;
  }
  return 0;
}

- (ICSDate)dtstart
{
  void *v2;
  void *v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DTSTART"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICSDate *)v3;
}

- (void)setDtstart:(id)a3
{
  -[ICSComponent setProperty:forName:](self, "setProperty:forName:", a3, CFSTR("DTSTART"));
}

- (void)setRdate:(id)a3
{
  -[ICSComponent setProperties:forName:](self, "setProperties:forName:", a3, CFSTR("RDATE"));
}

- (NSArray)rdate
{
  return (NSArray *)-[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RDATE"));
}

- (void)setRrule:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  ICSProperty *v12;
  ICSProperty *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = [ICSProperty alloc];
        v13 = -[ICSProperty initWithValue:type:](v12, "initWithValue:type:", v11, 5029, (_QWORD)v14);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[ICSComponent setProperties:forName:](self, "setProperties:forName:", v5, CFSTR("RRULE"));
}

- (NSArray)rrule
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("RRULE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)tzname
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("TZNAME"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)setTzname:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  ICSProperty *v12;
  ICSProperty *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = [ICSProperty alloc];
        v13 = -[ICSProperty initWithValue:type:](v12, "initWithValue:type:", v11, 5007, (_QWORD)v14);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[ICSComponent setProperties:forName:](self, "setProperties:forName:", v5, CFSTR("TZNAME"));
}

- (int64_t)tzoffsetfrom
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("TZOFFSETFROM"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (void)setTzoffsetfrom:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5018, CFSTR("TZOFFSETFROM"));

}

- (int64_t)tzoffsetto
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("TZOFFSETTO"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (void)setTzoffsetto:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5018, CFSTR("TZOFFSETTO"));

}

- (void)addRecurrenceDate:(id)a3
{
  -[ICSComponent addProperty:withValue:](self, "addProperty:withValue:", CFSTR("RDATE"), a3);
}

- (id)computeTimeZoneChangeListFromDate:(id)a3 toDate:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  id v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  ICSTimeZoneChange *v23;
  ICSTimeZoneChange *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  ICSTimeZoneChange *v35;
  ICSTimeZoneChange *v36;
  void *v37;
  void *v38;
  ICSTimeZoneChange *v39;
  ICSTimeZoneChange *v40;
  ICSTimeZoneBlock *v42;
  id obj;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  char *v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v49 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSTimeZoneBlock dtstart](self, "dtstart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = -[ICSTimeZoneBlock tzoffsetfrom](self, "tzoffsetfrom");
  v10 = -[ICSTimeZoneBlock tzoffsetto](self, "tzoffsetto");
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0C99D48]);
  v48 = (void *)objc_msgSend(v12, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v45 = (void *)v11;
  objc_msgSend(v48, "setTimeZone:", v11);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v42 = self;
  -[ICSTimeZoneBlock rrule](self, "rrule");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v8;
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v47)
  {
    v44 = *(_QWORD *)v62;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v62 != v44)
          objc_enumerationMutation(obj);
        v50 = v13;
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v13), "occurrencesForStartDate:fromDate:toDate:inTimeZone:", v8, v52, v49, v45);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "components");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "dateFromComponents:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v17 = v14;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v58;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v58 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
              if (objc_msgSend(v16, "compare:", v22) == -1)
              {
                v23 = [ICSTimeZoneChange alloc];
                objc_msgSend(v22, "timeIntervalSinceReferenceDate");
                v24 = -[ICSTimeZoneChange initWithTimeInterval:tzOffsetTo:](v23, "initWithTimeInterval:tzOffsetTo:", v10);
                objc_msgSend(v6, "addObject:", v24);

              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
          }
          while (v19);
        }

        v13 = v50 + 1;
        v8 = (uint64_t)v46;
      }
      while (v50 + 1 != (char *)v47);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    }
    while (v47);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[ICSTimeZoneBlock rdate](v42, "rdate");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v54 != v27)
          objc_enumerationMutation(v51);
        v29 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
        objc_msgSend(v29, "value");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "compare:", v30) == -1)
        {
          objc_msgSend(v29, "value");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v49, "compare:", v31);

          if (v32 == -1)
            continue;
          objc_msgSend(v29, "value");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "components");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "dateFromComponents:", v34);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = [ICSTimeZoneChange alloc];
          objc_msgSend(v30, "timeIntervalSinceReferenceDate");
          v36 = -[ICSTimeZoneChange initWithTimeInterval:tzOffsetTo:](v35, "initWithTimeInterval:tzOffsetTo:", v10);
          objc_msgSend(v6, "addObject:", v36);

        }
      }
      v26 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v26);
  }

  if (!objc_msgSend(v6, "count")
    && objc_msgSend(v52, "compare:", v46) == -1
    && objc_msgSend(v49, "compare:", v46) != -1)
  {
    objc_msgSend(v46, "components");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "dateFromComponents:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = [ICSTimeZoneChange alloc];
    objc_msgSend(v38, "timeIntervalSinceReferenceDate");
    v40 = -[ICSTimeZoneChange initWithTimeInterval:tzOffsetTo:](v39, "initWithTimeInterval:tzOffsetTo:", v10);
    objc_msgSend(v6, "addObject:", v40);

  }
  return v6;
}

@end
