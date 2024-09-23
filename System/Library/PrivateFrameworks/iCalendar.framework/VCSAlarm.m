@implementation VCSAlarm

- (VCSAlarm)initWithLine:(id)a3 parseState:(id)a4 property:(id *)a5
{
  id v6;
  VCSAlarm *v7;
  id v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  const char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  VCSDate *v18;
  VCSDate *triggerDate;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  VCSProperty *v25;
  VCSProperty *v26;
  void *v27;
  VCSProperty *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  NSString *v32;
  VCSAlarm *v33;
  const char *v34;
  uint64_t v35;
  NSString *summary;
  char *__endptr;
  objc_super v39;

  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)VCSAlarm;
  v7 = -[VCSEntity init](&v39, sel_init);
  if (!v7)
  {
LABEL_33:
    v33 = v7;
    goto LABEL_34;
  }
  objc_msgSend(v6, "content");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = strdup((const char *)objc_msgSend(v8, "bytes"));

  v10 = strchr(v9, 59);
  v11 = v10;
  if (!v10)
  {
    v13 = 0;
    goto LABEL_9;
  }
  *v10 = 0;
  v11 = v10 + 1;
  v12 = strchr(v10 + 1, 59);
  v13 = v12;
  if (!v12)
  {
LABEL_9:
    v15 = 0;
LABEL_10:
    v17 = 0;
    goto LABEL_11;
  }
  *v12 = 0;
  v13 = v12 + 1;
  v14 = strchr(v12 + 1, 59);
  v15 = v14;
  if (!v14)
    goto LABEL_10;
  *v14 = 0;
  v15 = v14 + 1;
  if (objc_msgSend(v6, "tokenID") != 27)
    goto LABEL_10;
  v16 = strchr(v15, 59);
  v17 = v16;
  if (v16)
  {
    *v16 = 0;
    v17 = v16 + 1;
  }
LABEL_11:
  v18 = -[VCSDate initWithDateString:]([VCSDate alloc], "initWithDateString:", v9);
  if (v18)
  {
    v7->_triggerType = 0;
    triggerDate = v7->_triggerDate;
    v7->_triggerDate = v18;

    if (v11)
    {
      __endptr = 0;
      v20 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_componentsWithISO8601DurationString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = strtol(v13, &__endptr, 10);
      if (v22)
      {
        v24 = v23;
        v25 = -[VCSProperty initWithName:rawValue:type:]([VCSProperty alloc], "initWithName:rawValue:type:", CFSTR("DURATION"), v22, 5);
        -[VCSEntity setProperty:](v7, "setProperty:", v25);

        v26 = [VCSProperty alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[VCSProperty initWithName:rawValue:type:](v26, "initWithName:rawValue:type:", CFSTR("REPEAT"), v27, 4);
        -[VCSEntity setProperty:](v7, "setProperty:", v28);

      }
    }
    v29 = objc_msgSend(v6, "tokenID");
    if (v29 > 26)
    {
      if (v29 == 27)
      {
        v7->_alarmType = 2;
        if (v17)
          v34 = v17;
        else
          v34 = "";
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v34);
        v35 = objc_claimAutoreleasedReturnValue();
        summary = v7->_summary;
        v7->_summary = (NSString *)v35;

        objc_storeStrong((id *)&v7->_body, v7->_summary);
      }
      else if (v29 == 30)
      {
        v7->_alarmType = 3;
      }
    }
    else if (v29 == 14)
    {
      v7->_alarmType = 0;
    }
    else if (v29 == 20)
    {
      v7->_alarmType = 1;
      if (v15)
        v30 = v15;
      else
        v30 = "";
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v30);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v7->_summary;
      v7->_summary = (NSString *)v31;

    }
    free(v9);
    goto LABEL_33;
  }
  free(v9);
  v33 = 0;
LABEL_34:

  return v33;
}

- (unint64_t)entityType
{
  return 4;
}

- (void)ensureRelativeAlarmWithStartDate:(id)a3
{
  VCSDate *triggerDate;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  if (self->_triggerType != 1)
  {
    triggerDate = self->_triggerDate;
    v5 = a3;
    -[VCSDate components](triggerDate, "components");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v9);
    self->_triggerDuration = v10;

    self->_triggerType = 1;
  }
}

- (id)dictify
{
  void *v3;
  void *v4;
  unint64_t alarmType;
  __CFString *v6;
  NSString *summary;
  NSString *body;
  unint64_t triggerType;
  __CFString *v10;
  void *v11;
  const __CFString *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VCSAlarm;
  -[VCSEntity dictify](&v14, sel_dictify);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  alarmType = self->_alarmType;
  if (alarmType >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid(%lu)"), self->_alarmType);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E953A718[alarmType];
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("alarmType"));

  summary = self->_summary;
  if (summary)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", summary, CFSTR("alarmSummary"));
  body = self->_body;
  if (body)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", body, CFSTR("alarmBody"));
  triggerType = self->_triggerType;
  if (triggerType)
  {
    if (triggerType == 1)
    {
      v10 = CFSTR("Relative");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid(%lu)"), self->_triggerType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = CFSTR("Absolute");
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("alarmTriggerType"));

  if (self->_triggerType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_triggerDuration);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("alarmTriggerDuration");
  }
  else
  {
    -[VCSDate description](self->_triggerDate, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("alarmTriggerDate");
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

  return v4;
}

+ (id)_componentsWithISO8601DurationString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  char *v6;
  char *v7;
  const char *v8;
  int v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  const char *v13;
  unsigned int v14;
  int v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *__endptr;

  v3 = a3;
  if (!v3)
  {
    v17 = 0;
    goto LABEL_44;
  }
  v4 = (void *)objc_opt_new();
  v5 = objc_retainAutorelease(v3);
  v6 = (char *)objc_msgSend(v5, "UTF8String");
  if (!v6)
  {
LABEL_36:
    v17 = 0;
    goto LABEL_43;
  }
  v7 = v6;
  if (*v6 != 80)
  {
    VCSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[VCSAlarm _componentsWithISO8601DurationString:].cold.3((uint64_t)v5, v18, v19, v20, v21, v22, v23, v24);

    goto LABEL_36;
  }
  v8 = v6 + 1;
  v9 = v6[1];
  v10 = v4;
  if (!v6[1])
    goto LABEL_42;
  v11 = 0;
  while (1)
  {
    __endptr = 0;
    v12 = v9 == 84;
    if (v9 == 84)
      v13 = v7 + 2;
    else
      v13 = v8;
    v14 = strtol(v13, &__endptr, 10);
    v7 = __endptr;
    if (v13 == __endptr || (v14 & 0x80000000) != 0)
    {
      VCSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        +[VCSAlarm _componentsWithISO8601DurationString:].cold.2((uint64_t)v5, v25, v27, v28, v29, v30, v31, v32);
      goto LABEL_41;
    }
    v11 |= v12;
    v16 = *__endptr;
    if ((v11 & 1) != 0)
    {
      switch(v16)
      {
        case 'S':
          objc_msgSend(v4, "setSecond:", v14);
          break;
        case 'M':
          objc_msgSend(v4, "setMinute:", v14);
          break;
        case 'H':
          objc_msgSend(v4, "setHour:", v14);
          break;
        default:
          goto LABEL_39;
      }
      goto LABEL_30;
    }
    if (v16 > 86)
      break;
    if (v16 == 68)
    {
      objc_msgSend(v4, "setDay:", v14);
    }
    else
    {
      if (v16 != 77)
        goto LABEL_39;
      objc_msgSend(v4, "setMonth:", v14);
    }
LABEL_30:
    v8 = v7 + 1;
    v9 = v7[1];
    if (!v7[1])
    {
      v10 = v4;
      goto LABEL_42;
    }
  }
  if (v16 == 87)
  {
    objc_msgSend(v4, "setWeekOfYear:", v14);
    goto LABEL_30;
  }
  if (v16 == 89)
  {
    objc_msgSend(v4, "setYear:", v14);
    goto LABEL_30;
  }
LABEL_39:
  VCSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    +[VCSAlarm _componentsWithISO8601DurationString:].cold.1((uint64_t)v5, v25, v33, v34, v35, v36, v37, v38);
LABEL_41:

  v10 = 0;
LABEL_42:
  v17 = v10;
LABEL_43:

LABEL_44:
  return v17;
}

- (unint64_t)alarmType
{
  return self->_alarmType;
}

- (NSString)summary
{
  return self->_summary;
}

- (NSString)body
{
  return self->_body;
}

- (unint64_t)triggerType
{
  return self->_triggerType;
}

- (VCSDate)triggerDate
{
  return self->_triggerDate;
}

- (double)triggerDuration
{
  return self->_triggerDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerDate, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_summary, 0);
}

+ (void)_componentsWithISO8601DurationString:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3456000, a2, a3, "String %@ is not a duration.(2)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)_componentsWithISO8601DurationString:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3456000, a2, a3, "String %@ is not a duration.(3)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)_componentsWithISO8601DurationString:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3456000, a2, a3, "String %@ is not a duration.(1)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
