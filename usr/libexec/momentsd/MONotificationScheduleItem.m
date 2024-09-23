@implementation MONotificationScheduleItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MONotificationScheduleItem)initWithHour:(id)a3 minute:(id)a4 weekdays:(id)a5
{
  id v9;
  id v10;
  id v11;
  MONotificationScheduleItem *v12;
  MONotificationScheduleItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MONotificationScheduleItem;
  v12 = -[MONotificationScheduleItem init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_hour, a3);
    objc_storeStrong((id *)&v13->_minute, a4);
    objc_storeStrong((id *)&v13->_weekdays, a5);
  }

  return v13;
}

- (id)initScheduleWithHour:(id)a3 minute:(id)a4 weekdays:(id)a5
{
  id v9;
  id v10;
  id v11;
  MONotificationScheduleItem *v12;
  id *p_isa;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MONotificationScheduleItem;
  v12 = -[MONotificationScheduleItem init](&v25, "init");
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_hour, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    if (objc_msgSend(v9, "intValue") > 0x17 || objc_msgSend(v10, "intValue") > 0x3B)
    {
LABEL_15:
      v19 = 0;
      goto LABEL_16;
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v18), "intValue", (_QWORD)v21)
             - 8 < 0xFFFFFFF9)
          {

            goto LABEL_15;
          }
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v16)
          continue;
        break;
      }
    }

  }
  v19 = p_isa;
LABEL_16:

  return v19;
}

- (MONotificationScheduleItem)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MONotificationScheduleItem *v6;
  id v7;
  uint64_t v8;
  NSNumber *hour;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSNumber *minute;
  unsigned int v14;
  NSMutableArray *v15;
  uint64_t v16;
  void *v17;
  NSArray *v18;
  NSArray *weekdays;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MONotificationScheduleItem;
  v6 = -[MONotificationScheduleItem init](&v21, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v5), CFSTR("hour"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    hour = v6->_hour;
    v6->_hour = (NSNumber *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v10), CFSTR("minute"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    minute = v6->_minute;
    v6->_minute = (NSNumber *)v12;

    v14 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("weekdays"));
    v15 = objc_opt_new(NSMutableArray);
    v16 = 1;
    do
    {
      if (((v14 >> (v16 - 1)) & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v16));
        -[NSMutableArray addObject:](v15, "addObject:", v17);

      }
      v16 = (v16 + 1);
    }
    while ((_DWORD)v16 != 8);
    v18 = (NSArray *)-[NSMutableArray copy](v15, "copy");
    weekdays = v6->_weekdays;
    v6->_weekdays = v18;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  char v7;
  uint64_t v8;
  void *i;
  unsigned __int8 v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_hour, CFSTR("hour"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_minute, CFSTR("minute"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_weekdays;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "intValue", (_QWORD)v12);
        v11 = 1 << ((v10 & 7) - 1);
        if ((v10 & 7) == 0)
          LOBYTE(v11) = 0;
        v7 |= v11;
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
    v6 = (id)(v7 & 0x7F);
  }

  objc_msgSend(v4, "encodeInt:forKey:", v6, CFSTR("weekdays"));
}

- (NSNumber)hour
{
  return self->_hour;
}

- (void)setHour:(id)a3
{
  objc_storeStrong((id *)&self->_hour, a3);
}

- (NSNumber)minute
{
  return self->_minute;
}

- (void)setMinute:(id)a3
{
  objc_storeStrong((id *)&self->_minute, a3);
}

- (NSArray)weekdays
{
  return self->_weekdays;
}

- (void)setWeekdays:(id)a3
{
  objc_storeStrong((id *)&self->_weekdays, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekdays, 0);
  objc_storeStrong((id *)&self->_minute, 0);
  objc_storeStrong((id *)&self->_hour, 0);
}

@end
