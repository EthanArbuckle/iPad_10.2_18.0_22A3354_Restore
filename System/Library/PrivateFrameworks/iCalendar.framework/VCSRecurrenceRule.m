@implementation VCSRecurrenceRule

- (VCSRecurrenceRule)initWithString:(const char *)a3
{
  VCSRecurrenceRule *v4;
  _BOOL4 v5;
  int v6;
  int v7;
  int v8;
  const char *i;
  int v10;
  NSObject *v12;
  const char *j;
  int v14;
  VCSRecurrenceRule *v16;
  VCSDate *v17;
  uint64_t v18;
  VCSDate *endDate;
  const char *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)VCSRecurrenceRule;
  v4 = -[VCSRecurrenceRule init](&v22, sel_init);
  if (!v4)
  {
LABEL_39:
    v16 = v4;
    goto LABEL_40;
  }
  v5 = 0;
  v21 = a3;
  v6 = *a3;
  if (v6 > 86)
  {
    if (v6 == 87)
    {
      v4->_recurrenceType = 2;
      v21 = a3 + 1;
      v5 = -[VCSRecurrenceRule decodeWeekly:](v4, "decodeWeekly:", &v21);
      goto LABEL_18;
    }
    if (v6 != 89)
      goto LABEL_18;
    v8 = *((unsigned __int8 *)a3 + 1);
    v21 = a3 + 1;
    if (v8 != 68)
    {
      if (v8 == 77)
      {
        v4->_recurrenceType = 5;
        v21 = a3 + 2;
        v5 = -[VCSRecurrenceRule decodeYearlyByMonth:](v4, "decodeYearlyByMonth:", &v21);
        goto LABEL_18;
      }
      goto LABEL_15;
    }
    v4->_recurrenceType = 6;
    v21 = a3 + 2;
    v5 = -[VCSRecurrenceRule decodeYearlyByDay:](v4, "decodeYearlyByDay:", &v21);
  }
  else
  {
    if (v6 == 68)
    {
      v4->_recurrenceType = 1;
      v21 = a3 + 1;
      v5 = -[VCSRecurrenceRule decodeDaily:](v4, "decodeDaily:", &v21);
      goto LABEL_18;
    }
    if (v6 != 77)
      goto LABEL_18;
    v7 = *((unsigned __int8 *)a3 + 1);
    v21 = a3 + 1;
    if (v7 != 68)
    {
      if (v7 == 80)
      {
        v4->_recurrenceType = 3;
        v21 = a3 + 2;
        v5 = -[VCSRecurrenceRule decodeMonthlyByPos:](v4, "decodeMonthlyByPos:", &v21);
        goto LABEL_18;
      }
LABEL_15:
      v5 = 0;
      goto LABEL_18;
    }
    v4->_recurrenceType = 4;
    v21 = a3 + 2;
    v5 = -[VCSRecurrenceRule decodeMonthlyByDay:](v4, "decodeMonthlyByDay:", &v21);
  }
LABEL_18:
  if (v4->_recurrenceType)
  {
    if (v5)
    {
      for (i = v21; ; v21 = i)
      {
        v10 = *(unsigned __int8 *)i++;
        if (v10 != 32 && v10 != 9)
          break;
      }
      if (-[VCSRecurrenceRule decodeDuration:](v4, "decodeDuration:", &v21))
      {
        for (j = v21; ; v21 = j)
        {
          v14 = *(unsigned __int8 *)j++;
          if (v14 != 32 && v14 != 9)
            break;
        }
        v17 = [VCSDate alloc];
        v18 = -[VCSDate initWithDateString:](v17, "initWithDateString:", v21);
        endDate = v4->_endDate;
        v4->_endDate = (VCSDate *)v18;

        goto LABEL_39;
      }
    }
  }
  else
  {
    VCSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[VCSRecurrenceRule initWithString:].cold.1(v12);

  }
  v16 = 0;
LABEL_40:

  return v16;
}

- (id)dictify
{
  void *v3;
  void *v4;
  unint64_t recurrenceType;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VCSDate *endDate;
  void *v12;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  recurrenceType = self->_recurrenceType;
  if (recurrenceType > 6)
    v6 = CFSTR("Invalid");
  else
    v6 = off_1E953B280[recurrenceType];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_interval);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("interval"));

  if (-[NSMutableArray count](self->_occurrenceList, "count"))
  {
    -[NSMutableArray componentsJoinedByString:](self->_occurrenceList, "componentsJoinedByString:", CFSTR(","));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("occurrences"));

  }
  if (-[NSMutableArray count](self->_weekdayList, "count"))
  {
    -[NSMutableArray VCS_map:](self->_weekdayList, "VCS_map:", &__block_literal_global_11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("weekdays"));

  }
  if (-[NSArray count](self->_dayNumberList, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_dayNumberList, CFSTR("dayNumbers"));
  if (-[NSArray count](self->_monthList, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_monthList, CFSTR("months"));
  if (-[NSArray count](self->_dayList, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_dayList, CFSTR("days"));
  if (self->_hasDuration)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_duration);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("duration"));

  }
  endDate = self->_endDate;
  if (endDate)
  {
    -[VCSDate description](endDate, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("endDate"));

  }
  return v4;
}

const __CFString *__28__VCSRecurrenceRule_dictify__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "unsignedIntegerValue");
  if (v2 > 6)
    return CFSTR("??");
  else
    return off_1E953B2B8[v2];
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[VCSRecurrenceRule dictify](self, "dictify");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)decodeWeekly:(const char *)a3
{
  _BOOL4 v5;
  const char *i;
  int v7;

  v5 = -[VCSRecurrenceRule decodeInterval:](self, "decodeInterval:");
  if (v5)
  {
    for (i = *a3; ; *a3 = i)
    {
      v7 = *(unsigned __int8 *)i++;
      if (v7 != 32 && v7 != 9)
        break;
    }
    LOBYTE(v5) = -[VCSRecurrenceRule decodeWeekdayList:](self, "decodeWeekdayList:", a3);
  }
  return v5;
}

- (BOOL)decodeMonthlyByPos:(const char *)a3
{
  _BOOL4 v5;
  const char *i;
  int v7;
  const char *j;
  int v10;

  v5 = -[VCSRecurrenceRule decodeInterval:](self, "decodeInterval:");
  if (v5)
  {
    for (i = *a3; ; *a3 = i)
    {
      v7 = *(unsigned __int8 *)i++;
      if (v7 != 32 && v7 != 9)
        break;
    }
    v5 = -[VCSRecurrenceRule decodeOccurrenceList:](self, "decodeOccurrenceList:", a3);
    if (v5)
    {
      if (self->_occurrenceList)
      {
        for (j = *a3; ; *a3 = j)
        {
          v10 = *(unsigned __int8 *)j++;
          if (v10 != 32 && v10 != 9)
            break;
        }
        LOBYTE(v5) = -[VCSRecurrenceRule decodeWeekdayList:](self, "decodeWeekdayList:", a3);
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (BOOL)decodeMonthlyByDay:(const char *)a3
{
  _BOOL4 v5;
  const char *i;
  int v7;
  NSArray *v9;
  NSArray *dayNumberList;

  v5 = -[VCSRecurrenceRule decodeInterval:](self, "decodeInterval:");
  if (v5)
  {
    for (i = *a3; ; *a3 = i)
    {
      v7 = *(unsigned __int8 *)i++;
      if (v7 != 32 && v7 != 9)
        break;
    }
    -[VCSRecurrenceRule _decodeNumberList:min:max:](self, "_decodeNumberList:min:max:", a3, 1, 31);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dayNumberList = self->_dayNumberList;
    self->_dayNumberList = v9;

  }
  return v5;
}

- (BOOL)decodeYearlyByMonth:(const char *)a3
{
  _BOOL4 v5;
  const char *i;
  int v7;
  NSArray *v9;
  NSArray *monthList;

  v5 = -[VCSRecurrenceRule decodeInterval:](self, "decodeInterval:");
  if (v5)
  {
    for (i = *a3; ; *a3 = i)
    {
      v7 = *(unsigned __int8 *)i++;
      if (v7 != 32 && v7 != 9)
        break;
    }
    -[VCSRecurrenceRule _decodeNumberList:min:max:](self, "_decodeNumberList:min:max:", a3, 1, 12);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    monthList = self->_monthList;
    self->_monthList = v9;

  }
  return v5;
}

- (BOOL)decodeYearlyByDay:(const char *)a3
{
  _BOOL4 v5;
  const char *i;
  int v7;
  NSArray *v9;
  NSArray *dayList;

  v5 = -[VCSRecurrenceRule decodeInterval:](self, "decodeInterval:");
  if (v5)
  {
    for (i = *a3; ; *a3 = i)
    {
      v7 = *(unsigned __int8 *)i++;
      if (v7 != 32 && v7 != 9)
        break;
    }
    -[VCSRecurrenceRule _decodeNumberList:min:max:](self, "_decodeNumberList:min:max:", a3, 1, 366);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dayList = self->_dayList;
    self->_dayList = v9;

  }
  return v5;
}

- (BOOL)decodeInterval:(const char *)a3
{
  _BOOL4 v4;
  int64_t v6;

  v6 = 0;
  v4 = -[VCSRecurrenceRule decodeDigits:withResult:](self, "decodeDigits:withResult:", a3, &v6);
  if (v4)
    self->_interval = v6;
  return v4;
}

- (BOOL)decodeWeekdayList:(const char *)a3
{
  const char *v5;
  int v6;
  uint64_t v7;
  const char *v8;
  char *v9;
  unsigned int v10;
  BOOL v11;
  uint64_t v12;
  NSMutableArray *weekdayList;
  NSMutableArray *v15;
  NSMutableArray *v16;
  void *v17;

  v5 = *a3;
LABEL_2:
  while (1)
  {
    v6 = *(unsigned __int8 *)v5;
    if (v6 != 9 && v6 != 32)
      break;
    ++v5;
  }
  v7 = 0;
  v8 = v5 + 2;
  do
  {
    v9 = decodeWeekdayList__weekdays[v7];
    if (v6 == *v9 && *((unsigned __int8 *)v5 + 1) == v9[1])
    {
      v10 = *(unsigned __int8 *)v8;
      v11 = v10 > 0x20;
      v12 = (1 << v10) & 0x100000201;
      if (!v11 && v12 != 0)
      {
        weekdayList = self->_weekdayList;
        if (!weekdayList)
        {
          v15 = (NSMutableArray *)objc_opt_new();
          v16 = self->_weekdayList;
          self->_weekdayList = v15;

          weekdayList = self->_weekdayList;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", decodeWeekdayList__weekdaysCode[v7]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](weekdayList, "addObject:", v17);

        v5 = v8;
        goto LABEL_2;
      }
    }
    ++v7;
  }
  while (v7 != 7);
  *a3 = v5;
  return 1;
}

- (BOOL)decodeOccurrenceList:(const char *)a3
{
  const char *v5;
  int v6;
  int v7;
  int v8;
  NSMutableArray *occurrenceList;
  NSMutableArray *v10;
  NSMutableArray *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;

  v5 = *a3;
  LOBYTE(v6) = **a3;
  do
  {
    if ((v6 - 49) > 4u)
      break;
    v7 = *((unsigned __int8 *)v5 + 1);
    if (v7 != 45 && v7 != 43)
      break;
    v8 = (char)v6;
    occurrenceList = self->_occurrenceList;
    if (occurrenceList)
    {
      v6 = (char)v6;
    }
    else
    {
      v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = self->_occurrenceList;
      self->_occurrenceList = v10;

      v6 = *v5;
      v7 = *((unsigned __int8 *)v5 + 1);
      occurrenceList = self->_occurrenceList;
    }
    v12 = v8 - 58;
    v13 = v6 - 48;
    v14 = 48 - v6;
    v15 = v7 == 45 ? v14 : v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](occurrenceList, "addObject:", v16);

    for (v5 += 2; ; ++v5)
    {
      v6 = *(unsigned __int8 *)v5;
      if (v6 != 32 && v6 != 9)
        break;
    }
  }
  while (v12 > 0xFFFFFFF5);
  *a3 = v5;
  return 1;
}

- (id)_decodeNumberList:(const char *)a3 min:(int64_t)a4 max:(int64_t)a5
{
  const char *i;
  BOOL v10;
  void *v11;
  void *v13;
  int v14;
  int64_t v17;
  const char *v18;

  i = *a3;
  v17 = 0;
  v18 = i;
  if (-[VCSRecurrenceRule decodeDigits:withResult:](self, "decodeDigits:withResult:", &v18, &v17)
    && (v17 >= a4 ? (v10 = v17 <= a5) : (v10 = 0), v10))
  {
    v11 = 0;
    do
    {
      if (!v11)
        v11 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

      for (i = v18; ; ++i)
      {
        v14 = *(unsigned __int8 *)i;
        if (v14 != 32 && v14 != 9)
          break;
      }
      v18 = i;
      if (!-[VCSRecurrenceRule decodeDigits:withResult:](self, "decodeDigits:withResult:", &v18, &v17))
        break;
    }
    while (v17 >= a4 && v17 <= a5);
  }
  else
  {
    v11 = 0;
  }
  *a3 = i;
  return v11;
}

- (BOOL)decodeDuration:(const char *)a3
{
  VCSRecurrenceRule *v3;
  const char *v6;

  v3 = self;
  if (**a3 == 35)
  {
    v6 = *a3 + 1;
    LODWORD(self) = -[VCSRecurrenceRule decodeDigits:withResult:](self, "decodeDigits:withResult:", &v6, &self->_duration);
    if ((_DWORD)self)
      v3->_hasDuration = 1;
    *a3 = v6;
  }
  else
  {
    self->_hasDuration = 0;
    LOBYTE(self) = 1;
  }
  return (char)self;
}

- (BOOL)decodeDigits:(const char *)a3 withResult:(int64_t *)a4
{
  uint64_t v6;
  int64_t v7;
  char *__endptr;

  if ((**a3 - 48) <= 9)
  {
    __endptr = 0;
    *__error() = 0;
    v6 = strtol(*a3, &__endptr, 10);
    v7 = v6;
    if (v6)
    {
      if ((unint64_t)(v6 - 0x7FFFFFFFFFFFFFFFLL) > 1 || *__error() != 34)
        goto LABEL_5;
    }
    else if (*__error() != 22)
    {
LABEL_5:
      *a4 = v7;
      *a3 = __endptr;
      return 1;
    }
  }
  return 0;
}

- (unint64_t)recurrenceType
{
  return self->_recurrenceType;
}

- (int64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(int64_t)a3
{
  self->_interval = a3;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

- (int64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(int64_t)a3
{
  self->_duration = a3;
}

- (NSArray)dayNumberList
{
  return self->_dayNumberList;
}

- (void)setDayNumberList:(id)a3
{
  objc_storeStrong((id *)&self->_dayNumberList, a3);
}

- (NSArray)monthList
{
  return self->_monthList;
}

- (void)setMonthList:(id)a3
{
  objc_storeStrong((id *)&self->_monthList, a3);
}

- (NSArray)dayList
{
  return self->_dayList;
}

- (void)setDayList:(id)a3
{
  objc_storeStrong((id *)&self->_dayList, a3);
}

- (NSMutableArray)occurrenceList
{
  return self->_occurrenceList;
}

- (void)setOccurrenceList:(id)a3
{
  objc_storeStrong((id *)&self->_occurrenceList, a3);
}

- (NSMutableArray)weekdayList
{
  return self->_weekdayList;
}

- (void)setWeekdayList:(id)a3
{
  objc_storeStrong((id *)&self->_weekdayList, a3);
}

- (VCSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_weekdayList, 0);
  objc_storeStrong((id *)&self->_occurrenceList, 0);
  objc_storeStrong((id *)&self->_dayList, 0);
  objc_storeStrong((id *)&self->_monthList, 0);
  objc_storeStrong((id *)&self->_dayNumberList, 0);
}

- (void)initWithString:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3456000, log, OS_LOG_TYPE_ERROR, "Invalid recurrence type.", v1, 2u);
}

@end
