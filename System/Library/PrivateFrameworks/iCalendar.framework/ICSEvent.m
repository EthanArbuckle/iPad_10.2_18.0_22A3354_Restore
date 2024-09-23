@implementation ICSEvent

- (void)fixComponent
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  ICSDuration *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  ICSDuration *v31;
  ICSCalendar *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D824FCDC](self, a2);
  v51.receiver = self;
  v51.super_class = (Class)ICSEvent;
  -[ICSComponent fixComponent](&v51, sel_fixComponent);
  -[ICSEvent fixAttendeeComments](self, "fixAttendeeComments");
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DTEND"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICSComponent dtend](self, "dtend");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("DTEND"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("LOCATION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICSComponent location](self, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("LOCATION"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("TRANSP"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("TRANSP"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("TRANSP"));
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("PRIORITY"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("PRIORITY"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) == 0)
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("PRIORITY"));
  }
  -[ICSComponent dtstart](self, "dtstart");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[ICSComponent dtend](self, "dtend");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DTEND"));
  v22 = (ICSDuration *)objc_claimAutoreleasedReturnValue();
  if (v22)
    goto LABEL_14;
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DURATION"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v22 = -[ICSDuration initWithWeeks:days:hours:minutes:seconds:]([ICSDuration alloc], "initWithWeeks:days:hours:minutes:seconds:", 0, 0, 0, 0, 0);
    -[ICSComponent setDuration:](self, "setDuration:", v22);
LABEL_14:

  }
  if (-[ICSComponent isAllDay](self, "isAllDay"))
  {
    -[ICSComponent dtstart](self, "dtstart");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "value");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICSComponent dtend](self, "dtend");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "value");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(v25, "year");
    if (v28 == objc_msgSend(v27, "year"))
    {
      v29 = objc_msgSend(v25, "month");
      if (v29 == objc_msgSend(v27, "month"))
      {
        v30 = objc_msgSend(v25, "day");
        if (v30 == objc_msgSend(v27, "day"))
        {
          v31 = -[ICSDuration initWithWeeks:days:hours:minutes:seconds:]([ICSDuration alloc], "initWithWeeks:days:hours:minutes:seconds:", 0, 1, 0, 0, 0);
          -[ICSComponent setDuration:](self, "setDuration:", v31);

        }
      }
    }

  }
  v32 = objc_alloc_init(ICSCalendar);
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("EXDATE"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v46 = v3;
    v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    -[ICSComponent exdate](self, "exdate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v48 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          -[ICSCalendar systemDateForDate:options:](v32, "systemDateForDate:options:", v41, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v35, "containsObject:", v42) & 1) == 0)
          {
            objc_msgSend(v34, "addObject:", v41);
            objc_msgSend(v35, "addObject:", v42);
          }

        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v38);
    }

    -[ICSComponent exdate](self, "exdate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "count");
    v45 = objc_msgSend(v34, "count");

    if (v44 != v45)
      -[ICSComponent setExdate:](self, "setExdate:", v34);

    v3 = v46;
  }

  objc_autoreleasePoolPop(v3);
}

- (void)fixAttendeeComments
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-CALENDARSERVER-ATTENDEE-COMMENT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[ICSEvent x_calendarserver_attendee_comment](self, "x_calendarserver_attendee_comment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    -[ICSEvent x_calendarserver_attendee_comment](self, "x_calendarserver_attendee_comment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "x_calendarserver_attendee_ref");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            if (objc_msgSend(v11, "containsObject:", v10))
              objc_msgSend(v7, "addIndex:", v8);
            else
              objc_msgSend(v11, "addObject:", v10);
          }

        }
        else
        {
          objc_msgSend(v7, "addIndex:", v8);
        }

        ++v8;
      }
      while (v8 < objc_msgSend(v6, "count"));
    }
    objc_msgSend(v6, "removeObjectsAtIndexes:", v7);
    if (!objc_msgSend(v6, "count"))
      -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-CALENDARSERVER-ATTENDEE-COMMENT"));

  }
}

+ (id)name
{
  return CFSTR("VEVENT");
}

- (BOOL)validate:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  unsigned int v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DTSTART"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (a3)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("DTSTART is required for VEVENT."), *MEMORY[0x1E0CB2D50]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iCalendar"), 1000, v14);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DTEND"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICSComponent dtstart](self, "dtstart");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSComponent dtend](self, "dtend");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tzid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0C99E80];
      objc_msgSend(v7, "tzid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeZoneWithName:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v8, "tzid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = (void *)v12;
    if (v15
      && (v16 = (void *)MEMORY[0x1E0C99E80],
          objc_msgSend(v8, "tzid"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "timeZoneWithName:", v17),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v17,
          v12)
      && v15)
    {
      v18 = objc_alloc(MEMORY[0x1E0C99D48]);
      v19 = *MEMORY[0x1E0C996C8];
      v20 = (void *)objc_msgSend(v18, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
      objc_msgSend(v20, "setTimeZone:", v12);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v19);
      objc_msgSend(v21, "setTimeZone:", v15);
      objc_msgSend(v7, "components");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dateFromComponents:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "components");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dateFromComponents:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(v25, "compare:", v23);
      if (v26 == -1)
        goto LABEL_13;
    }
    else
    {
      objc_msgSend(v8, "value");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "compare:", v32);

      if (v33 == -1)
      {
LABEL_13:
        if (a3)
        {
          v27 = (void *)MEMORY[0x1E0CB35C8];
          v28 = (void *)MEMORY[0x1E0C99D80];
          v29 = *MEMORY[0x1E0CB2D50];
          v30 = CFSTR("DTEND must not be before DTSTART.");
LABEL_19:
          objc_msgSend(v28, "dictionaryWithObject:forKey:", v30, v29);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iCalendar"), 1000, v35);
          v36 = v43;
          *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
          return 0;
        }
        goto LABEL_20;
      }
    }
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DURATION"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      if (a3)
      {
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v28 = (void *)MEMORY[0x1E0C99D80];
        v29 = *MEMORY[0x1E0CB2D50];
        v30 = CFSTR("DTEND and DURATION cannot both be set for VEVENT.");
        goto LABEL_19;
      }
LABEL_20:
      v36 = v43;
      goto LABEL_21;
    }

  }
  else
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("DURATION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("STATUS"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = -[ICSComponent status](self, "status");
    v40 = v39;
    if (v39 > 8 || ((1 << v39) & 0x107) == 0)
    {
      if (a3)
      {
        v41 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Invalid STATUS for VEVENT."), *MEMORY[0x1E0CB2D50]);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iCalendar"), 1000, v42);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (v40 != 8)
        return 0;
    }
  }
  v44.receiver = self;
  v44.super_class = (Class)ICSEvent;
  return -[ICSComponent validate:](&v44, sel_validate_, a3);
}

- (int)transp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("TRANSP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("TRANSP"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  return v7;
}

- (void)setTransp:(int)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    +[ICSPredefinedValue numberWithLong:](ICSTransparencyValue, "numberWithLong:", a3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5004, CFSTR("TRANSP"));

}

- (NSArray)x_calendarserver_attendee_comment
{
  return (NSArray *)-[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-CALENDARSERVER-ATTENDEE-COMMENT"));
}

- (void)setX_calendarserver_attendee_comment:(id)a3
{
  -[ICSComponent setProperties:forName:](self, "setProperties:forName:", a3, CFSTR("X-CALENDARSERVER-ATTENDEE-COMMENT"));
}

- (NSString)x_calendarserver_private_comment
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-CALENDARSERVER-PRIVATE-COMMENT"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_calendarserver_private_comment:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-CALENDARSERVER-PRIVATE-COMMENT"));
}

- (void)setX_apple_dontschedule:(BOOL)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5012, CFSTR("X-APPLE-DONTSCHEDULE"));

  }
  else
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-APPLE-DONTSCHEDULE"));
  }
}

- (BOOL)x_apple_dontschedule
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-DONTSCHEDULE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)x_apple_needs_reply
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-NEEDS-REPLY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setX_apple_needs_reply:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5012, CFSTR("X-APPLE-NEEDS-REPLY"));

}

- (void)setX_wr_itipalreadysent:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("DONE");
  else
    v3 = 0;
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", v3, CFSTR("X-WR-ITIPALREADYSENT"));
}

- (BOOL)x_wr_itipalreadysent
{
  void *v2;
  BOOL v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-ITIPALREADYSENT"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setX_wr_itipstatusattendeeml:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("UNCLEAN");
  else
    v3 = 0;
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", v3, CFSTR("X-WR-ITIPSTATUSATTENDEEML"));
}

- (BOOL)x_wr_itipstatusattendeeml
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-ITIPSTATUSATTENDEEML"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-ITIPSTATUSATTENDEEML"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("UNCLEAN"));

  return v7;
}

- (void)setX_wr_itipstatusml:(BOOL)a3
{
  void *v4;

  if (a3)
  {
    -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("ATTENDEE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", CFSTR("UNCLEAN"), CFSTR("X-WR-ITIPSTATUSML"));
  }
  else
  {
    -[ICSComponent removePropertiesForName:](self, "removePropertiesForName:", CFSTR("X-WR-ITIPSTATUSML"));
  }
}

- (BOOL)x_wr_itipstatusml
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-ITIPSTATUSML"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-ITIPSTATUSML"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("UNCLEAN"));

  return v7;
}

- (void)setX_wr_rsvpneeded:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("UNCLEAN");
  else
    v3 = 0;
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", v3, CFSTR("X-WR-RSVPNEEDED"));
}

- (BOOL)x_wr_rsvpneeded
{
  void *v2;
  BOOL v3;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-WR-RSVPNEEDED"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int)x_apple_ews_busystatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-EWS-BUSYSTATUS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-EWS-BUSYSTATUS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");

  return v7;
}

- (void)setX_apple_ews_busystatus:(int)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    +[ICSPredefinedValue numberWithLong:](ICSBusyStatusValue, "numberWithLong:", a3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (id)v4;
  -[ICSComponent setPropertyValue:type:forName:](self, "setPropertyValue:type:forName:", v4, 5031, CFSTR("X-APPLE-EWS-BUSYSTATUS"));

}

- (NSString)x_apple_special_day
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-SPECIAL-DAY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_special_day:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-SPECIAL-DAY"));
}

- (NSString)x_apple_creator_identity
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-CREATOR-IDENTITY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_creator_identity:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-CREATOR-IDENTITY"));
}

- (NSString)x_apple_creator_team_identity
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("X-APPLE-CREATOR-TEAM-IDENTITY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setX_apple_creator_team_identity:(id)a3
{
  -[ICSComponent setPropertyValue:forName:](self, "setPropertyValue:forName:", a3, CFSTR("X-APPLE-CREATOR-TEAM-IDENTITY"));
}

- (BOOL)isDefaultAlarmDeleted
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ICSComponent components](self, "components", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = v6;
          if (objc_msgSend(v7, "isNoneAlarm") && (objc_msgSend(v7, "x_apple_default_alarm") & 1) == 0)
          {

            LOBYTE(v3) = 1;
            goto LABEL_15;
          }
          v8 = objc_msgSend(v7, "x_apple_default_alarm");

          if ((v8 & 1) != 0)
          {
            LOBYTE(v3) = 0;
            goto LABEL_15;
          }
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_15:

  return v3;
}

@end
