@implementation VCSEvent

- (unint64_t)entityType
{
  return 2;
}

- (VCSDate)startDate
{
  void *v2;
  void *v3;
  void *v4;

  -[VCSEntity propertyForName:](self, "propertyForName:", CFSTR("DTSTART"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "singleValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (VCSDate *)v4;
}

- (void)setStartDate:(id)a3
{
  id v4;
  VCSProperty *v5;

  v4 = a3;
  v5 = -[VCSProperty initWithName:rawValue:type:]([VCSProperty alloc], "initWithName:rawValue:type:", CFSTR("DTSTART"), v4, 7);

  -[VCSEntity setProperty:](self, "setProperty:", v5);
}

- (VCSDate)endDate
{
  void *v2;
  void *v3;
  void *v4;

  -[VCSEntity propertyForName:](self, "propertyForName:", CFSTR("DTEND"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "singleValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (VCSDate *)v4;
}

- (void)setEndDate:(id)a3
{
  id v4;
  VCSProperty *v5;

  v4 = a3;
  v5 = -[VCSProperty initWithName:rawValue:type:]([VCSProperty alloc], "initWithName:rawValue:type:", CFSTR("DTEND"), v4, 7);

  -[VCSEntity setProperty:](self, "setProperty:", v5);
}

- (void)ensureDurationAlarms
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[VCSEntity alarms](self, "alarms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[VCSEvent startDate](self, "startDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ensureRelativeAlarmWithStartDate:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (BOOL)isValidStatus:(unint64_t)a3
{
  return (a3 < 9) & (0x183u >> a3);
}

- (BOOL)fullDayEvent
{
  return self->_fullDayEvent;
}

- (void)setFullDayEvent:(BOOL)a3
{
  self->_fullDayEvent = a3;
}

@end
