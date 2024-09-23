@implementation NSDateComponents(NSCalendarUnit)

+ (uint64_t)smaller:()NSCalendarUnit componentsRelativeToComponent:
{
  char v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  char v16;
  _QWORD v17[2];
  _OWORD v18[3];
  uint64_t v19;
  _OWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = 0;
  v5 = 0;
  result = 0;
  v22 = *MEMORY[0x1E0C80C00];
  v20[0] = xmmword_186681B30;
  v20[1] = unk_186681B40;
  v20[2] = xmmword_186681B50;
  v21 = 2;
  v18[0] = xmmword_186681B68;
  v18[1] = unk_186681B78;
  v19 = 2;
  v7 = 0x2000;
  if (a4 != 256)
    v7 = a4;
  v8 = -1;
  if (!a3)
    v8 = 1;
  v9 = 6;
  if (!a3)
    v9 = 0;
  v10 = 7;
  if (a3)
    v10 = -1;
  v17[0] = v20;
  v17[1] = v18;
  v18[2] = xmmword_186681B88;
  do
  {
    v11 = 0;
    v12 = (uint64_t *)(v17[v5] + 8 * v9);
    v13 = v9;
    do
    {
      v14 = v11 | (v7 == *v12);
      if ((v11 & 1) != 0)
        v15 = *v12;
      else
        v15 = 0;
      result |= v15;
      v13 += v8;
      v12 += v8;
      v11 = v14;
    }
    while (v13 != v10);
    v16 = v4 | v14;
    v4 = 1;
    v5 = 1;
  }
  while ((v16 & 1) == 0);
  return result;
}

+ (uint64_t)_ui_smallerComponentsRelativeToComponent:()NSCalendarUnit
{
  return objc_msgSend(a1, "smaller:componentsRelativeToComponent:", 1, a3);
}

+ (uint64_t)_ui_largerComponentsRelativeToComponent:()NSCalendarUnit
{
  return objc_msgSend(a1, "smaller:componentsRelativeToComponent:", 0, a3);
}

+ (__CFString)_ui_namesForComponents:()NSCalendarUnit
{
  uint64_t v4;
  void *v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t j;
  _OWORD v11[8];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return CFSTR("NSDateComponentUndefined");
  v4 = a3;
  v11[4] = xmmword_1E16D9610;
  v11[5] = *(_OWORD *)&off_1E16D9620;
  v11[6] = xmmword_1E16D9630;
  v11[7] = *(_OWORD *)&off_1E16D9640;
  v11[0] = xmmword_1E16D95D0;
  v11[1] = *(_OWORD *)&off_1E16D95E0;
  v11[2] = xmmword_1E16D95F0;
  v11[3] = *(_OWORD *)&off_1E16D9600;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 16; ++i)
  {
    v7 = qword_186681BA0[i];
    if ((v7 & v4) != 0)
    {
      objc_msgSend(v5, "addObject:", *(_QWORD *)((char *)v11 + i * 8));
      v4 &= ~v7;
    }
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown: %lu>"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" | "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  for (j = 120; j != -8; j -= 8)
  return (__CFString *)v9;
}

- (id)_ui_conciseDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<NSDateComponents: %p>"), a1);
  objc_msgSend(a1, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    objc_msgSend(a1, "timeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_5;
  }
  objc_msgSend(a1, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\nCalendar: %@ / Time Zone: %@"), v5, v6);

LABEL_5:
  if (objc_msgSend(a1, "era") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v2, "appendFormat:", CFSTR("\n Era: %ld"), objc_msgSend(a1, "era"));
  if (objc_msgSend(a1, "year") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v2, "appendFormat:", CFSTR("\n Year: %ld"), objc_msgSend(a1, "year"));
  if (objc_msgSend(a1, "month") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v2, "appendFormat:", CFSTR("\n Month: %ld"), objc_msgSend(a1, "month"));
  if (objc_msgSend(a1, "day") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v2, "appendFormat:", CFSTR("\n Day: %ld"), objc_msgSend(a1, "day"));
  if (objc_msgSend(a1, "hour") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v2, "appendFormat:", CFSTR("\n Hour: %ld"), objc_msgSend(a1, "hour"));
  if (objc_msgSend(a1, "minute") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v2, "appendFormat:", CFSTR("\n Minute: %ld"), objc_msgSend(a1, "minute"));
  if (objc_msgSend(a1, "second") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v2, "appendFormat:", CFSTR("\n Second: %ld"), objc_msgSend(a1, "second"));
  if (objc_msgSend(a1, "weekOfMonth") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v2, "appendFormat:", CFSTR("\n Week of Month: %ld"), objc_msgSend(a1, "weekOfMonth"));
  if (objc_msgSend(a1, "weekOfYear") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v2, "appendFormat:", CFSTR("\n Week of Year: %ld"), objc_msgSend(a1, "weekOfYear"));
  if (objc_msgSend(a1, "yearForWeekOfYear") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v2, "appendFormat:", CFSTR("\n Year for Week of Year: %ld"), objc_msgSend(a1, "yearForWeekOfYear"));
  if (objc_msgSend(a1, "weekday") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v2, "appendFormat:", CFSTR("\n Weekday: %ld"), objc_msgSend(a1, "weekday"));
  if (objc_msgSend(a1, "weekdayOrdinal") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v2, "appendFormat:", CFSTR("\n Weekday Ordinal: %ld"), objc_msgSend(a1, "weekdayOrdinal"));
  if (objc_msgSend(a1, "quarter") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v2, "appendFormat:", CFSTR("\n Quarter: %ld"), objc_msgSend(a1, "quarter"));
  return v2;
}

- (uint64_t)_ui_valueForComponent:()NSCalendarUnit
{
  if (a3 > 255)
  {
    if (a3 <= 2047)
    {
      switch(a3)
      {
        case 256:
          return objc_msgSend(a1, "week");
        case 512:
          return objc_msgSend(a1, "weekday");
        case 1024:
          return objc_msgSend(a1, "weekdayOrdinal");
      }
    }
    else if (a3 >= 0x2000)
    {
      if (a3 == 0x2000)
        return objc_msgSend(a1, "weekOfYear");
      if (a3 == 0x4000)
        return objc_msgSend(a1, "yearForWeekOfYear");
    }
    else
    {
      if (a3 == 2048)
        return objc_msgSend(a1, "quarter");
      if (a3 == 4096)
        return objc_msgSend(a1, "weekOfMonth");
    }
  }
  else if (a3 <= 15)
  {
    switch(a3)
    {
      case 2:
        return objc_msgSend(a1, "era");
      case 4:
        return objc_msgSend(a1, "year");
      case 8:
        return objc_msgSend(a1, "month");
    }
  }
  else if (a3 > 63)
  {
    if (a3 == 64)
      return objc_msgSend(a1, "minute");
    if (a3 == 128)
      return objc_msgSend(a1, "second");
  }
  else
  {
    if (a3 == 16)
      return objc_msgSend(a1, "day");
    if (a3 == 32)
      return objc_msgSend(a1, "hour");
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_ui_setValue:()NSCalendarUnit forComponent:
{
  if (a4 > 255)
  {
    if (a4 <= 2047)
    {
      switch(a4)
      {
        case 256:
          return (void *)objc_msgSend(a1, "setWeek:");
        case 512:
          return (void *)objc_msgSend(a1, "setWeekday:");
        case 1024:
          return (void *)objc_msgSend(a1, "setWeekdayOrdinal:");
      }
    }
    else if (a4 >= 0x2000)
    {
      if (a4 == 0x2000)
      {
        return (void *)objc_msgSend(a1, "setWeekOfYear:");
      }
      else if (a4 == 0x4000)
      {
        return (void *)objc_msgSend(a1, "setYearForWeekOfYear:");
      }
    }
    else if (a4 == 2048)
    {
      return (void *)objc_msgSend(a1, "setQuarter:");
    }
    else if (a4 == 4096)
    {
      return (void *)objc_msgSend(a1, "setWeekOfMonth:");
    }
  }
  else if (a4 <= 15)
  {
    switch(a4)
    {
      case 2:
        return (void *)objc_msgSend(a1, "setEra:");
      case 4:
        return (void *)objc_msgSend(a1, "setYear:");
      case 8:
        return (void *)objc_msgSend(a1, "setMonth:");
    }
  }
  else if (a4 > 63)
  {
    if (a4 == 64)
    {
      return (void *)objc_msgSend(a1, "setMinute:");
    }
    else if (a4 == 128)
    {
      return (void *)objc_msgSend(a1, "setSecond:");
    }
  }
  else if (a4 == 16)
  {
    return (void *)objc_msgSend(a1, "setDay:");
  }
  else if (a4 == 32)
  {
    return (void *)objc_msgSend(a1, "setHour:");
  }
  return a1;
}

- (void)_ui_setComponents:()NSCalendarUnit
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = 0;
  v11 = v4;
  do
  {
    v6 = qword_186681C20[v5];
    if (objc_msgSend(v4, "_ui_valueForComponent:", v6) != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(a1, "_ui_setValue:forComponent:", objc_msgSend(v11, "_ui_valueForComponent:", v6), v6);
    ++v5;
    v4 = v11;
  }
  while (v5 != 14);
  objc_msgSend(v11, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v11, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setCalendar:", v8);

  }
  objc_msgSend(v11, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v11, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setTimeZone:", v10);

  }
}

@end
