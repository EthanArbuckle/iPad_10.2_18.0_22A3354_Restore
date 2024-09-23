@implementation VCSDate

+ (id)dateListFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  unsigned __int8 *v10;
  uint64_t v11;
  VCSDate *v12;
  id v14;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v14 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v14, "bytes");
  v7 = v6;
  for (i = 0; ; ++i)
  {
    v9 = *(unsigned __int8 *)(v6 + i);
    if (v9 != 32 && v9 != 59)
      break;
  }
  v10 = (unsigned __int8 *)(v6 + i);
  while (1)
  {
    v11 = 0;
    while (v9 > 0x3Bu || ((1 << v9) & 0x800000100000001) == 0)
      LOBYTE(v9) = v10[++v11];
    if (!(_DWORD)v11)
      break;
    objc_msgSend(v5, "setLength:", 0);
    objc_msgSend(v5, "appendBytes:length:", v7 + (int)i, v11);
    objc_msgSend(v5, "increaseLengthBy:", 1);
    v12 = -[VCSDate initWithDateString:]([VCSDate alloc], "initWithDateString:", objc_msgSend(objc_retainAutorelease(v5), "bytes"));
    if (v12)
      objc_msgSend(v4, "addObject:", v12);
    LODWORD(i) = v11 + i;
    v10 += v11;

    while (1)
    {
      v9 = *v10;
      if (v9 != 59 && v9 != 32)
        break;
      ++v10;
      LODWORD(i) = i + 1;
    }
  }

  return v4;
}

- (VCSDate)initWithDateComponents:(id)a3 floating:(BOOL)a4 dateOnly:(BOOL)a5
{
  id v8;
  VCSDate *v9;
  uint64_t v10;
  NSDateComponents *components;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VCSDate;
  v9 = -[VCSDate init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    components = v9->_components;
    v9->_components = (NSDateComponents *)v10;

    v9->_floating = a4;
    v9->_dateOnly = a5;
  }

  return v9;
}

- (VCSDate)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 floating:(BOOL)a9 dateOnly:(BOOL)a10
{
  void *v17;
  void *v18;
  VCSDate *v19;

  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setYear:", a3);
  objc_msgSend(v17, "setMonth:", a4);
  objc_msgSend(v17, "setDay:", a5);
  objc_msgSend(v17, "setHour:", a6);
  objc_msgSend(v17, "setMinute:", a7);
  objc_msgSend(v17, "setSecond:", a8);
  objc_msgSend(MEMORY[0x1E0C99D48], "VCS_gregorianGMTCalendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCalendar:", v18);

  v19 = -[VCSDate initWithDateComponents:floating:dateOnly:](self, "initWithDateComponents:floating:dateOnly:", v17, a9, a10);
  return v19;
}

- (VCSDate)initWithDateString:(const char *)a3
{
  size_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  VCSDate *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v29 = 0;
  v30 = 0;
  v28 = 0;
  v5 = strlen(a3);
  if (v5 != 8)
  {
    if (v5 == 15)
    {
      v6 = 1;
    }
    else
    {
      if (v5 != 16)
      {
LABEL_16:
        v11 = 0;
        goto LABEL_17;
      }
      if (a3[15] != 90)
      {
        VCSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[VCSDate initWithDateString:].cold.1((uint64_t)a3, v12, v19, v20, v21, v22, v23, v24);
LABEL_15:

        goto LABEL_16;
      }
      v6 = 0;
    }
    v27 = 0;
    sscanf(a3, "%04d%02d%02d%c%02d%02d%02d", (char *)&v30 + 4, &v30, (char *)&v29 + 4, &v27, &v29, (char *)&v28 + 4, &v28);
    if (v27 == 84)
    {
      v10 = 0;
      v8 = HIDWORD(v28);
      v9 = v29;
      v7 = v28;
      goto LABEL_10;
    }
    VCSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[VCSDate initWithDateString:].cold.1((uint64_t)a3, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_15;
  }
  sscanf(a3, "%04d%02d%02d", (char *)&v30 + 4, &v30, (char *)&v29 + 4);
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v6 = 1;
  v10 = 1;
LABEL_10:
  BYTE1(v26) = v10;
  LOBYTE(v26) = v6;
  self = -[VCSDate initWithYear:month:day:hour:minute:second:floating:dateOnly:](self, "initWithYear:month:day:hour:minute:second:floating:dateOnly:", SHIDWORD(v30), v30, HIDWORD(v29), v9, v8, v7, v26);
  v11 = self;
LABEL_17:

  return v11;
}

- (id)description
{
  void *v3;
  NSInteger v4;
  NSInteger v5;
  NSInteger v6;
  NSInteger v7;
  NSInteger v8;
  NSInteger v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[NSDateComponents year](self->_components, "year");
  v5 = -[NSDateComponents month](self->_components, "month");
  v6 = -[NSDateComponents day](self->_components, "day");
  v7 = -[NSDateComponents hour](self->_components, "hour");
  v8 = -[NSDateComponents minute](self->_components, "minute");
  v9 = -[NSDateComponents second](self->_components, "second");
  if (self->_floating)
    v10 = CFSTR("floating");
  else
    v10 = CFSTR("UTC");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_dateOnly);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%04ld-%02ld-%02ld %02ld:%02ld:%02ld (%@), dateOnly: %@"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VCSDate *v4;
  void *v5;
  VCSDate *v6;

  v4 = [VCSDate alloc];
  v5 = (void *)-[NSDateComponents copy](self->_components, "copy");
  v6 = -[VCSDate initWithDateComponents:floating:dateOnly:](v4, "initWithDateComponents:floating:dateOnly:", v5, self->_floating, self->_dateOnly);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int floating;
  int dateOnly;
  NSDateComponents *components;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    floating = self->_floating;
    if (floating == objc_msgSend(v5, "floating")
      && (dateOnly = self->_dateOnly, dateOnly == objc_msgSend(v5, "dateOnly")))
    {
      components = self->_components;
      objc_msgSend(v5, "components");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSDateComponents isEqual:](components, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)dateForEndOfDay
{
  void *v3;
  VCSDate *v4;

  v3 = (void *)-[NSDateComponents copy](self->_components, "copy");
  objc_msgSend(v3, "setHour:", 23);
  objc_msgSend(v3, "setMinute:", 59);
  objc_msgSend(v3, "setSecond:", 59);
  v4 = -[VCSDate initWithDateComponents:floating:dateOnly:]([VCSDate alloc], "initWithDateComponents:floating:dateOnly:", v3, self->_floating, self->_dateOnly);

  return v4;
}

- (id)dateByAddingDays:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  VCSDate *v8;
  void *v9;
  void *v10;
  VCSDate *v11;

  -[NSDateComponents calendar](self->_components, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateComponents date](self->_components, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, a3, v6, 1024);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [VCSDate alloc];
  -[NSDateComponents calendar](self->_components, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "components:fromDate:", 3145982, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[VCSDate initWithDateComponents:floating:dateOnly:](v8, "initWithDateComponents:floating:dateOnly:", v10, self->_floating, self->_dateOnly);

  return v11;
}

- (VCSDate)dateWithTimeComponentsFromDate:(id)a3
{
  NSDateComponents *components;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VCSDate *v9;
  uint64_t v10;
  uint64_t v11;
  VCSDate *v12;

  components = self->_components;
  v4 = a3;
  v5 = (void *)-[NSDateComponents copy](components, "copy");
  objc_msgSend(v4, "components");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHour:", objc_msgSend(v6, "hour"));

  objc_msgSend(v4, "components");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinute:", objc_msgSend(v7, "minute"));

  objc_msgSend(v4, "components");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecond:", objc_msgSend(v8, "second"));

  v9 = [VCSDate alloc];
  v10 = objc_msgSend(v4, "floating");
  v11 = objc_msgSend(v4, "dateOnly");

  v12 = -[VCSDate initWithDateComponents:floating:dateOnly:](v9, "initWithDateComponents:floating:dateOnly:", v5, v10, v11);
  return v12;
}

- (id)nsDateWithLocalTimeZone:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[VCSDate floating](self, "floating");
  if (v4 && v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "VCS_gregorianLocalCalendar:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "VCS_gregorianGMTCalendar");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  -[VCSDate components](self, "components");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDateComponents)components
{
  return self->_components;
}

- (BOOL)floating
{
  return self->_floating;
}

- (BOOL)dateOnly
{
  return self->_dateOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
}

- (void)initWithDateString:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3456000, a2, a3, "malformed string for VCSDate: %s", a5, a6, a7, a8, 2u);
}

@end
