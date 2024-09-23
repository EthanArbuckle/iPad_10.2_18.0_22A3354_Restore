@implementation SignpostSupportObject

- (BOOL)isEqual:(id)a3
{
  SignpostSupportObject *v4;
  SignpostSupportObject *v5;
  SignpostSupportObject *v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;

  v4 = (SignpostSupportObject *)a3;
  v5 = v4;
  if (self == v4)
  {
    v18 = 1;
  }
  else if (v4 && -[SignpostSupportObject isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v6 = v5;
    v7 = -[SignpostSupportObject startMachContinuousTime](self, "startMachContinuousTime");
    if (v7 != -[SignpostSupportObject startMachContinuousTime](v6, "startMachContinuousTime"))
      goto LABEL_14;
    v8 = -[SignpostSupportObject endMachContinuousTime](self, "endMachContinuousTime");
    if (v8 != -[SignpostSupportObject endMachContinuousTime](v6, "endMachContinuousTime"))
      goto LABEL_14;
    v9 = -[SignpostSupportObject tv_sec](self, "tv_sec");
    if (v9 != -[SignpostSupportObject tv_sec](v6, "tv_sec"))
      goto LABEL_14;
    v10 = -[SignpostSupportObject tv_usec](self, "tv_usec");
    if (v10 != -[SignpostSupportObject tv_usec](v6, "tv_usec"))
      goto LABEL_14;
    v11 = -[SignpostSupportObject tz_minuteswest](self, "tz_minuteswest");
    if (v11 != -[SignpostSupportObject tz_minuteswest](v6, "tz_minuteswest"))
      goto LABEL_14;
    v12 = -[SignpostSupportObject tz_dsttime](self, "tz_dsttime");
    if (v12 != -[SignpostSupportObject tz_dsttime](v6, "tz_dsttime"))
      goto LABEL_14;
    -[SignpostSupportObject subsystem](self, "subsystem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostSupportObject subsystem](v6, "subsystem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (v15)
    {
      -[SignpostSupportObject category](self, "category");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostSupportObject category](v6, "category");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

    }
    else
    {
LABEL_14:
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
}

- (SignpostSupportObject)initWithSubsystem:(id)a3 category:(id)a4 timebaseRatio:(double)a5
{
  __CFString *v8;
  __CFString *v9;
  SignpostSupportObject *v10;
  SignpostSupportObject *v11;
  __CFString *v12;
  __CFString *v13;
  objc_super v15;

  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v15.receiver = self;
  v15.super_class = (Class)SignpostSupportObject;
  v10 = -[SignpostSupportObject init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    if (v8)
      v12 = v8;
    else
      v12 = CFSTR("Unknown");
    objc_storeStrong((id *)&v10->_subsystem, v12);
    if (v9)
      v13 = v9;
    else
      v13 = CFSTR("Unknown");
    objc_storeStrong((id *)&v11->_category, v13);
    v11->_timebaseRatio = a5;
  }

  return v11;
}

- (BOOL)_containsTimeObject:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v4 = a3;
  v5 = -[SignpostSupportObject startMachContinuousTime](self, "startMachContinuousTime");
  v7 = 0;
  if (v5 <= objc_msgSend(v4, "startMachContinuousTime"))
  {
    v6 = -[SignpostSupportObject endMachContinuousTime](self, "endMachContinuousTime");
    if (v6 >= objc_msgSend(v4, "endMachContinuousTime"))
      v7 = 1;
  }

  return v7;
}

- (id)_containedObjectsFromArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[SignpostSupportObject _containsTimeObject:](self, "_containsTimeObject:", v10))
        {
          if (!v7)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v7, "addObject:", v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SignpostSupportObject durationMachContinuousTime](self, "durationMachContinuousTime");
  v4 = -[SignpostSupportObject startMachContinuousTime](self, "startMachContinuousTime");
  if (v3)
    v4 ^= -[SignpostSupportObject endMachContinuousTime](self, "endMachContinuousTime");
  return v4;
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4
{
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    -[SignpostSupportObject humanReadableType](self, "humanReadableType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("SignpostObjectType"));
    v8 = CFSTR("Subsystem");
    v9 = CFSTR("Category");
    v10 = CFSTR("TimebaseRatio");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "serializationTypeNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("SerType"));
    v8 = CFSTR("Sub");
    v9 = CFSTR("Cat");
    v10 = CFSTR("TBR");
  }

  -[SignpostSupportObject subsystem](self, "subsystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v8);

  -[SignpostSupportObject category](self, "category");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v9);

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v10);

  return v6;
}

- (id)serializeableDictionaryWithShouldRedact:(BOOL)a3
{
  return -[SignpostSupportObject _dictionaryRepresentationWithIsHumanReadable:shouldRedact:](self, "_dictionaryRepresentationWithIsHumanReadable:shouldRedact:", 0, a3);
}

- (id)humanReadableDictionaryRepresentation
{
  return -[SignpostSupportObject _dictionaryRepresentationWithIsHumanReadable:shouldRedact:](self, "_dictionaryRepresentationWithIsHumanReadable:shouldRedact:", 1, 0);
}

- (SignpostSupportObject)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  SignpostSupportObject *v15;
  objc_super v17;

  v4 = a3;
  if (v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)SignpostSupportObject;
    self = -[SignpostSupportObject init](&v17, sel_init);
    if (!self)
    {
LABEL_13:
      self = self;
      v15 = self;
      goto LABEL_14;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SerType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "serializationTypeNumber");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToNumber:", v6);

      if (v7)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Sub"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostSupportObject setSubsystem:](self, "setSubsystem:", v8);

        -[SignpostSupportObject subsystem](self, "subsystem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Cat"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostSupportObject setCategory:](self, "setCategory:", v10);

          -[SignpostSupportObject category](self, "category");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TBR"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            if (v12)
              objc_msgSend(v12, "doubleValue");
            else
              v14 = SignpostSystemTimebaseRatio();
            -[SignpostSupportObject setTimebaseRatio:](self, "setTimebaseRatio:", v14);

            goto LABEL_13;
          }
        }
      }
    }

  }
  v15 = 0;
LABEL_14:

  return v15;
}

+ (id)serializationTypeNumber
{
  __assert_rtn("+[SignpostSupportObject(Serialization) serializationTypeNumber]", "SignpostSupportDeserialization.m", 450, "NO");
}

- (id)humanReadableType
{
  __assert_rtn("-[SignpostSupportObject(Serialization) humanReadableType]", "SignpostSupportDeserialization.m", 456, "false");
}

- (BOOL)_populateTimeStruct:(time *)a3 withTimeval:(timeval *)a4 withTZString:(id)a5
{
  id v8;
  void *v9;
  __darwin_time_t tv_sec;
  void *v11;
  __darwin_time_t v12;
  tm *v13;
  int v14;
  int v15;
  char *v16;
  BOOL v17;
  unint64_t v18;
  int8x16_t v19;
  time_t v21;
  tm v22;

  v8 = a5;
  v9 = v8;
  tv_sec = a4->tv_sec;
  if (a4->tv_sec || a4->tv_usec)
  {
    if (v8)
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("local")) & 1) != 0)
      {
        v11 = 0;
      }
      else
      {
        v16 = getenv("TZ");
        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
        setenv("TZ", (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), 1);
        tzset();
      }
      memset(&v22, 0, sizeof(v22));
      v21 = a4->tv_sec;
      v13 = localtime_r(&v21, &v22);
      v18 = ((unsigned __int128)(v22.tm_gmtoff * (__int128)0x7777777777777777) >> 64) - v22.tm_gmtoff;
      v15 = (v18 >> 5) + (v18 >> 63);
    }
    else
    {
      memset(&v22, 0, sizeof(v22));
      v12 = tv_sec - 60 * -[SignpostSupportObject tz_minuteswest](self, "tz_minuteswest");
      v21 = v12 + 3600 * -[SignpostSupportObject tz_dsttime](self, "tz_dsttime");
      v13 = gmtime_r(&v21, &v22);
      LODWORD(v12) = -[SignpostSupportObject tz_minuteswest](self, "tz_minuteswest");
      v14 = -[SignpostSupportObject tz_dsttime](self, "tz_dsttime");
      v11 = 0;
      v15 = v12 - 60 * v14;
    }
    v17 = v13 != 0;
    if (v13)
    {
      *(int32x2_t *)&a3->var0 = vrev64_s32(vadd_s32(*(int32x2_t *)&v22.tm_mon, (int32x2_t)0x76C00000001));
      v19 = (int8x16_t)vrev64q_s32(*(int32x4_t *)&v22.tm_sec);
      *(int8x16_t *)&a3->var2 = vextq_s8(v19, v19, 8uLL);
      a3->var6 = a4->tv_usec;
      a3->var7 = ((int)(((unint64_t)(2004318071 * v15) >> 32) - v15) >> 5)
               + ((((unint64_t)(2004318071 * v15) >> 32) - v15) >> 31);
      if (v15 < 0)
        v15 = -v15;
      a3->var8 = v15 % 0x3Cu;
    }
    if (v9)
    {
      if (v11)
        setenv("TZ", (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), 1);
      else
        unsetenv("TZ");
      tzset();
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_adjustBeginTimeVal:(timeval *)a3
{
  a3->tv_sec = -[SignpostSupportObject tv_sec](self, "tv_sec");
  a3->tv_usec = -[SignpostSupportObject tv_usec](self, "tv_usec");
}

- (void)_adjustEndTimeVal:(timeval *)a3
{
  a3->tv_sec = -[SignpostSupportObject tv_sec](self, "tv_sec");
  a3->tv_usec = -[SignpostSupportObject tv_usec](self, "tv_usec");
}

- (id)_wallTimeStringWithTimeZone:(id)a3 isBegin:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  __CFString *v7;
  __int128 v9;
  __int128 v10;
  unsigned int v11;
  _QWORD v12[2];

  v4 = a4;
  v6 = a3;
  v12[0] = 0;
  v12[1] = 0;
  if (v4)
    -[SignpostSupportObject _adjustBeginTimeVal:](self, "_adjustBeginTimeVal:", v12);
  else
    -[SignpostSupportObject _adjustEndTimeVal:](self, "_adjustEndTimeVal:", v12);
  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  if (-[SignpostSupportObject _populateTimeStruct:withTimeval:withTZString:](self, "_populateTimeStruct:withTimeval:withTZString:", &v9, v12, v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%04d-%02d-%02d %02d:%02d:%02d.%06d%+03d%02d"), v9, DWORD1(v9), DWORD2(v9), HIDWORD(v9), v10, DWORD1(v10), DWORD2(v10), HIDWORD(v10), v11);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("Unknown");
  }

  return v7;
}

- (id)beginWallTimeStringWithTimeZoneName:(id)a3
{
  return -[SignpostSupportObject _wallTimeStringWithTimeZone:isBegin:](self, "_wallTimeStringWithTimeZone:isBegin:", a3, 1);
}

- (id)endWallTimeStringWithTimeZoneName:(id)a3
{
  return -[SignpostSupportObject _wallTimeStringWithTimeZone:isBegin:](self, "_wallTimeStringWithTimeZone:isBegin:", a3, 0);
}

- (BOOL)_hasBeginTimeval
{
  int v3;

  if (-[SignpostSupportObject tv_sec](self, "tv_sec") || (v3 = -[SignpostSupportObject tv_usec](self, "tv_usec")) != 0)
    LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)_hasEndTimeval
{
  int v3;

  if (-[SignpostSupportObject tv_sec](self, "tv_sec") || (v3 = -[SignpostSupportObject tv_usec](self, "tv_usec")) != 0)
    LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)beginTimezone:(timezone *)a3
{
  BOOL v5;
  int v6;

  v5 = -[SignpostSupportObject _hasBeginTimeval](self, "_hasBeginTimeval");
  if (v5)
  {
    a3->tz_minuteswest = -[SignpostSupportObject tz_minuteswest](self, "tz_minuteswest");
    v6 = -[SignpostSupportObject tz_dsttime](self, "tz_dsttime");
  }
  else
  {
    v6 = 0;
    a3->tz_minuteswest = 0;
  }
  a3->tz_dsttime = v6;
  return v5;
}

- (BOOL)endTimezone:(timezone *)a3
{
  BOOL v5;
  int v6;

  v5 = -[SignpostSupportObject _hasEndTimeval](self, "_hasEndTimeval");
  if (v5)
  {
    a3->tz_minuteswest = -[SignpostSupportObject tz_minuteswest](self, "tz_minuteswest");
    v6 = -[SignpostSupportObject tz_dsttime](self, "tz_dsttime");
  }
  else
  {
    v6 = 0;
    a3->tz_minuteswest = 0;
  }
  a3->tz_dsttime = v6;
  return v5;
}

- (BOOL)beginTimeval:(timeval *)a3
{
  BOOL v5;

  v5 = -[SignpostSupportObject _hasBeginTimeval](self, "_hasBeginTimeval");
  if (v5)
  {
    -[SignpostSupportObject _adjustBeginTimeVal:](self, "_adjustBeginTimeVal:", a3);
  }
  else
  {
    a3->tv_sec = 0;
    a3->tv_usec = 0;
  }
  return v5;
}

- (BOOL)endTimeval:(timeval *)a3
{
  BOOL v5;

  v5 = -[SignpostSupportObject _hasEndTimeval](self, "_hasEndTimeval");
  if (v5)
  {
    -[SignpostSupportObject _adjustEndTimeVal:](self, "_adjustEndTimeVal:", a3);
  }
  else
  {
    a3->tv_sec = 0;
    a3->tv_usec = 0;
  }
  return v5;
}

- (NSDate)beginDate
{
  _BOOL4 v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  v2 = -[SignpostSupportObject beginTimeval:](self, "beginTimeval:", &v5);
  v3 = 0;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(int)v6 / 1000000.0 + (double)v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v3;
}

- (NSDate)endDate
{
  _BOOL4 v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  v2 = -[SignpostSupportObject endTimeval:](self, "endTimeval:", &v5);
  v3 = 0;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(int)v6 / 1000000.0 + (double)v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v3;
}

+ (id)headerWithTimeFormat:(unint64_t)a3 verbosity:(unsigned __int8)a4
{
  __CFString *v4;
  int v6;
  unint64_t v8;
  char v9;
  __CFString *v10;
  __CFString **v11;
  uint64_t v12;

  if (a4 != 3)
  {
    v6 = a4;
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = 1;
    while (1)
    {
      if (v6 || v8 <= 0xC)
      {
        v10 = CFSTR("Glitch Count");
        switch(v8)
        {
          case 0uLL:
            if (a3 >= 3)
              goto LABEL_16;
            v11 = &off_1E4601948;
            goto LABEL_14;
          case 1uLL:
            if (a3 >= 3)
              goto LABEL_16;
            v11 = &off_1E4601960;
            goto LABEL_14;
          case 2uLL:
            goto LABEL_16;
          case 4uLL:
            if (a3 >= 3)
            {
LABEL_16:
              v10 = CFSTR("FPS");
              if ((v9 & 1) != 0)
                goto LABEL_45;
LABEL_44:
              -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("\t"));
              goto LABEL_45;
            }
            v11 = &off_1E4601978;
LABEL_14:
            v10 = v11[a3];
            if ((v9 & 1) == 0)
              goto LABEL_44;
LABEL_45:
            if (v8 > 0x12)
              v12 = 10;
            else
              v12 = dword_1A1A70744[v8];
            -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("%-*s"), v12, -[__CFString UTF8String](v10, "UTF8String"));
            v9 = 0;
            break;
          case 5uLL:
            v10 = CFSTR("Type");
            if ((v9 & 1) != 0)
              goto LABEL_45;
            goto LABEL_44;
          case 6uLL:
            v10 = CFSTR("Name");
            if ((v9 & 1) != 0)
              goto LABEL_45;
            goto LABEL_44;
          case 7uLL:
            v10 = CFSTR("Subsystem");
            if ((v9 & 1) != 0)
              goto LABEL_45;
            goto LABEL_44;
          case 8uLL:
            v10 = CFSTR("Category");
            if ((v9 & 1) != 0)
              goto LABEL_45;
            goto LABEL_44;
          case 9uLL:
            v10 = CFSTR("Process");
            if ((v9 & 1) != 0)
              goto LABEL_45;
            goto LABEL_44;
          case 0xAuLL:
            v10 = CFSTR("Thread");
            if ((v9 & 1) != 0)
              goto LABEL_45;
            goto LABEL_44;
          case 0xBuLL:
            v10 = CFSTR("ID");
            if ((v9 & 1) != 0)
              goto LABEL_45;
            goto LABEL_44;
          case 0xCuLL:
            v10 = CFSTR("Scope");
            if ((v9 & 1) != 0)
              goto LABEL_45;
            goto LABEL_44;
          case 0xDuLL:
            v10 = CFSTR("Telemetry");
            if ((v9 & 1) != 0)
              goto LABEL_45;
            goto LABEL_44;
          case 0xEuLL:
            v10 = CFSTR("Telemetry string1");
            if ((v9 & 1) != 0)
              goto LABEL_45;
            goto LABEL_44;
          case 0xFuLL:
            v10 = CFSTR("Telemetry string2");
            if ((v9 & 1) != 0)
              goto LABEL_45;
            goto LABEL_44;
          case 0x10uLL:
            v10 = CFSTR("Telemetry number1");
            if ((v9 & 1) != 0)
              goto LABEL_45;
            goto LABEL_44;
          case 0x11uLL:
            v10 = CFSTR("Telemetry number2");
            goto LABEL_43;
          case 0x12uLL:
            v10 = CFSTR("Metadata/Message");
            if ((v9 & 1) != 0)
              goto LABEL_45;
            goto LABEL_44;
          default:
LABEL_43:
            if ((v9 & 1) == 0)
              goto LABEL_44;
            goto LABEL_45;
        }
      }
      if (++v8 == 19)
        return v4;
    }
  }
  v4 = &stru_1E4610268;
  return v4;
}

- (id)_descriptionWithTimeFormat:(unint64_t)a3 verbosity:(unsigned __int8)a4 asBegin:(BOOL)a5
{
  void *v6;
  _BOOL8 v7;
  int v8;
  unint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  __CFString *v17;

  if (a4 == 3)
  {
    -[SignpostSupportObject debugDescription](self, "debugDescription", a3, a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = a5;
    v8 = a4;
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = 1;
    do
    {
      if (v8 || v10 <= 0xC)
      {
        -[SignpostSupportObject _descriptionStringForColumn:timeFormat:asBegin:](self, "_descriptionStringForColumn:timeFormat:asBegin:", v10, a3, v7);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        v14 = CFSTR("n/a");
        if (v12)
          v14 = (__CFString *)v12;
        v15 = v14;

        if ((v11 & 1) == 0)
          objc_msgSend(v6, "appendFormat:", CFSTR("\t"));
        if (v10 > 0x12)
          v16 = 10;
        else
          v16 = dword_1A1A70744[v10];
        v17 = objc_retainAutorelease(v15);
        objc_msgSend(v6, "appendFormat:", CFSTR("%-*s"), v16, -[__CFString UTF8String](v17, "UTF8String"));

        v11 = 0;
      }
      ++v10;
    }
    while (v10 != 19);
  }
  return v6;
}

- (id)descriptionWithTimeFormat:(unint64_t)a3 verbosity:(unsigned __int8)a4
{
  return -[SignpostSupportObject _descriptionWithTimeFormat:verbosity:asBegin:](self, "_descriptionWithTimeFormat:verbosity:asBegin:", a3, a4, 1);
}

- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5
{
  void *v5;
  void *v6;
  unint64_t v7;
  float v8;
  double v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  v5 = 0;
  switch(a3)
  {
    case 0uLL:
      if (a4 == 2)
      {
        if (a5)
          -[SignpostSupportObject beginWallTimeStringWithTimeZoneName:](self, "beginWallTimeStringWithTimeZoneName:", 0);
        else
          -[SignpostSupportObject endWallTimeStringWithTimeZoneName:](self, "endWallTimeStringWithTimeZoneName:", 0);
        goto LABEL_24;
      }
      if (a4 == 1)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        if (a5)
          v12 = -[SignpostSupportObject startMachContinuousTime](self, "startMachContinuousTime");
        else
          v12 = -[SignpostSupportObject endMachContinuousTime](self, "endMachContinuousTime");
        goto LABEL_20;
      }
      if (a4)
        goto LABEL_11;
      v6 = (void *)MEMORY[0x1E0CB3940];
      if (a5)
        v7 = -[SignpostSupportObject startNanoseconds](self, "startNanoseconds");
      else
        v7 = -[SignpostSupportObject endNanoseconds](self, "endNanoseconds");
      v9 = (double)v7 / 1000000000.0;
      goto LABEL_23;
    case 1uLL:
      if (a4 == 2)
        goto LABEL_10;
      if (a4 == 1)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = -[SignpostSupportObject durationMachContinuousTime](self, "durationMachContinuousTime");
LABEL_20:
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%llu"), v12);
      }
      else
      {
        if (a4)
        {
LABEL_11:
          -[SignpostSupportObject subsystem](self, "subsystem");
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
LABEL_10:
        v6 = (void *)MEMORY[0x1E0CB3940];
        -[SignpostSupportObject durationSeconds](self, "durationSeconds");
        v9 = v8;
LABEL_23:
        objc_msgSend(v6, "stringWithFormat:", CFSTR("%fs"), *(_QWORD *)&v9);
      }
LABEL_24:
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v5 = (void *)v10;
      return v5;
    case 7uLL:
      goto LABEL_11;
    case 8uLL:
      -[SignpostSupportObject category](self, "category");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    default:
      return v5;
  }
}

- (int64_t)tv_sec
{
  __assert_rtn("-[SignpostSupportObject tv_sec]", "SignpostSupportObject.m", 515, "false");
}

- (int)tv_usec
{
  __assert_rtn("-[SignpostSupportObject tv_usec]", "SignpostSupportObject.m", 521, "false");
}

- (int)tz_minuteswest
{
  __assert_rtn("-[SignpostSupportObject tz_minuteswest]", "SignpostSupportObject.m", 527, "false");
}

- (int)tz_dsttime
{
  __assert_rtn("-[SignpostSupportObject tz_dsttime]", "SignpostSupportObject.m", 533, "false");
}

- (unint64_t)startMachContinuousTime
{
  __assert_rtn("-[SignpostSupportObject startMachContinuousTime]", "SignpostSupportObject.m", 538, "false");
}

- (unint64_t)startNanoseconds
{
  double v3;
  double v4;

  v3 = (double)-[SignpostSupportObject startMachContinuousTime](self, "startMachContinuousTime");
  -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
  return (unint64_t)(v4 * v3);
}

- (unint64_t)endMachContinuousTime
{
  __assert_rtn("-[SignpostSupportObject endMachContinuousTime]", "SignpostSupportObject.m", 548, "false");
}

- (unint64_t)endNanoseconds
{
  double v3;
  double v4;

  v3 = (double)-[SignpostSupportObject endMachContinuousTime](self, "endMachContinuousTime");
  -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
  return (unint64_t)(v4 * v3);
}

- (unint64_t)durationMachContinuousTime
{
  __assert_rtn("-[SignpostSupportObject durationMachContinuousTime]", "SignpostSupportObject.m", 558, "false");
}

- (float)durationSeconds
{
  return (float)-[SignpostSupportObject durationNanoseconds](self, "durationNanoseconds") / 1000000000.0;
}

- (unint64_t)durationNanoseconds
{
  unint64_t v3;

  v3 = -[SignpostSupportObject endNanoseconds](self, "endNanoseconds");
  return v3 - -[SignpostSupportObject startNanoseconds](self, "startNanoseconds");
}

- (double)endSeconds
{
  return (double)-[SignpostSupportObject endNanoseconds](self, "endNanoseconds") / 1000000000.0;
}

- (double)startSeconds
{
  return (double)-[SignpostSupportObject startNanoseconds](self, "startNanoseconds") / 1000000000.0;
}

- (double)startMs
{
  return (double)-[SignpostSupportObject startNanoseconds](self, "startNanoseconds") / 1000000.0;
}

- (double)endMs
{
  return (double)-[SignpostSupportObject endNanoseconds](self, "endNanoseconds") / 1000000.0;
}

- (double)durationMs
{
  return (double)-[SignpostSupportObject durationNanoseconds](self, "durationNanoseconds") / 1000000.0;
}

- (BOOL)_containsMCT:(unint64_t)a3
{
  if (-[SignpostSupportObject startMachContinuousTime](self, "startMachContinuousTime") == a3)
    return 1;
  if (-[SignpostSupportObject startMachContinuousTime](self, "startMachContinuousTime") <= a3)
    return -[SignpostSupportObject endMachContinuousTime](self, "endMachContinuousTime") > a3;
  return 0;
}

- (void)setSubsystem:(id)a3
{
  objc_storeStrong((id *)&self->_subsystem, a3);
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (void)setTimebaseRatio:(double)a3
{
  self->_timebaseRatio = a3;
}

@end
