@implementation WFNextHourPrecipitation

- (WFNextHourPrecipitation)initWithReadDate:(id)a3 startDate:(id)a4 expirationDate:(id)a5 minutes:(id)a6 conditions:(id)a7 descriptions:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  WFNextHourPrecipitation *v20;
  uint64_t v21;
  NSDate *readDate;
  uint64_t v23;
  NSDate *startDate;
  uint64_t v25;
  NSDate *expirationDate;
  uint64_t v27;
  NSArray *minutes;
  uint64_t v29;
  NSArray *precipitationDescriptions;
  uint64_t v31;
  NSArray *conditions;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)WFNextHourPrecipitation;
  v20 = -[WFNextHourPrecipitation init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    readDate = v20->_readDate;
    v20->_readDate = (NSDate *)v21;

    v23 = objc_msgSend(v15, "copy");
    startDate = v20->_startDate;
    v20->_startDate = (NSDate *)v23;

    v25 = objc_msgSend(v16, "copy");
    expirationDate = v20->_expirationDate;
    v20->_expirationDate = (NSDate *)v25;

    v27 = objc_msgSend(v17, "copy");
    minutes = v20->_minutes;
    v20->_minutes = (NSArray *)v27;

    v29 = objc_msgSend(v19, "copy");
    precipitationDescriptions = v20->_precipitationDescriptions;
    v20->_precipitationDescriptions = (NSArray *)v29;

    v31 = objc_msgSend(v18, "copy");
    conditions = v20->_conditions;
    v20->_conditions = (NSArray *)v31;

  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSDate copy](self->_readDate, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSDate copy](self->_startDate, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSDate copy](self->_expirationDate, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = -[NSArray copy](self->_minutes, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = -[NSArray copy](self->_precipitationDescriptions, "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  v15 = -[NSArray copy](self->_conditions, "copy");
  v16 = (void *)v4[6];
  v4[6] = v15;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[WFNextHourPrecipitation readDate](self, "readDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "readDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[WFNextHourPrecipitation startDate](self, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        -[WFNextHourPrecipitation expirationDate](self, "expirationDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "expirationDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[WFNextHourPrecipitation readDate](self, "readDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFNextHourPrecipitation startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[WFNextHourPrecipitation expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (NSArray)activeMinutes
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  WFNextHourPrecipitationMinute *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  WFNextHourPrecipitationMinute *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", floor(v5 / 60.0) * 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[WFNextHourPrecipitation minutes](self, "minutes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v12, "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", v6);
        v15 = v14;

        if (v15 >= 0.0)
          objc_msgSend(v3, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v9);
  }

  -[WFNextHourPrecipitation minutes](self, "minutes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  v18 = v17 - objc_msgSend(v3, "count");

  -[WFNextHourPrecipitation minutes](self, "minutes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 >= 1)
  {
    v21 = 60;
    do
    {
      objc_msgSend(v20, "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "dateByAddingTimeInterval:", (double)v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = [WFNextHourPrecipitationMinute alloc];
      objc_msgSend(v20, "intensity");
      v26 = v25;
      objc_msgSend(v20, "chance");
      v28 = v27;
      objc_msgSend(v20, "perceivedIntensity");
      v30 = -[WFNextHourPrecipitationMinute initWithIntensity:chance:perceivedIntensity:date:](v24, "initWithIntensity:chance:perceivedIntensity:date:", v23, v26, v28, v29);
      objc_msgSend(v3, "addObject:", v30);

      v21 += 60;
      --v18;
    }
    while (v18);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v31;
}

- (BOOL)isRelevant
{
  NSObject *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  double v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  double v27;
  double v28;
  NSObject *v29;
  __int128 v31;
  uint8_t buf[4];
  __int128 v33;
  _BOOL4 v34;
  __int16 v35;
  NSObject *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21189A000, v3, OS_LOG_TYPE_INFO, "Determining if NextHour data is relevant by examining the conditions.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNextHourPrecipitation startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  if (v7 <= 900.0)
  {
    -[WFNextHourPrecipitation conditions](self, "conditions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v13 = 0;
      v8 = 0;
      *(_QWORD *)&v12 = 67109632;
      v31 = v12;
      while (1)
      {
        -[WFNextHourPrecipitation conditions](self, "conditions", v31);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndex:", v13);
        v15 = objc_claimAutoreleasedReturnValue();

        WFLogForCategory(0);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          LODWORD(v33) = v13;
          WORD2(v33) = 2114;
          *(_QWORD *)((char *)&v33 + 6) = v15;
          _os_log_impl(&dword_21189A000, v16, OS_LOG_TYPE_INFO, "Checking NextHour data condition[%d]=%{public}@", buf, 0x12u);
        }

        v17 = -[NSObject type](v15, "type");
        -[NSObject validUntil](v15, "validUntil");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          -[NSObject validUntil](v15, "validUntil");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "timeIntervalSinceNow");
          v21 = v20 > 0.0;

        }
        else
        {
          v21 = 1;
        }

        if (v17 >= 2 && v21)
          break;
        WFLogForCategory(0);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v31;
          LODWORD(v33) = v13;
          WORD2(v33) = 1024;
          *(_DWORD *)((char *)&v33 + 6) = v17 > 1;
          WORD5(v33) = 1024;
          HIDWORD(v33) = v21;
          _os_log_impl(&dword_21189A000, v22, OS_LOG_TYPE_INFO, "condition[%d] does not have a valid condition precipitation, skipping...isConditionPrecipitation=%d, isConditionUnexpired=%d", buf, 0x14u);
        }

        -[NSObject validUntil](v15, "validUntil");
        v23 = objc_claimAutoreleasedReturnValue();

        ++v13;
        -[WFNextHourPrecipitation conditions](self, "conditions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

        v8 = v23;
        if (v25 <= v13)
          goto LABEL_21;
      }
      WFLogForCategory(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v33) = v13;
        _os_log_impl(&dword_21189A000, v26, OS_LOG_TYPE_INFO, "condition[%d] is valid (it's a precipitation and it's not expired). Now checking if it's relevant", buf, 8u);
      }

      -[NSObject timeIntervalSinceNow](v8, "timeIntervalSinceNow");
      v28 = v27;
      v9 = v27 <= 3000.0;
      WFLogForCategory(0);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109890;
        LODWORD(v33) = v13;
        WORD2(v33) = 2048;
        *(_QWORD *)((char *)&v33 + 6) = 0x4049000000000000;
        HIWORD(v33) = 1024;
        v34 = v28 <= 3000.0;
        v35 = 2114;
        v36 = v8;
        _os_log_impl(&dword_21189A000, v29, OS_LOG_TYPE_INFO, "condition[%d] is relevant only if its preceding condition expires within the next %f minutes. isRelevant=%d, previousConditionValidUntil=%{public}@", buf, 0x22u);
      }

    }
    else
    {
      v23 = 0;
LABEL_21:
      WFLogForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21189A000, v15, OS_LOG_TYPE_INFO, "NextHour data has no relevant condition. Returning isRelevant=NO", buf, 2u);
      }
      v9 = 0;
      v8 = v23;
    }

  }
  else
  {
    WFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&v33 = v7;
      _os_log_impl(&dword_21189A000, v8, OS_LOG_TYPE_INFO, "NextHour data is stale, age=%f. Returning isRelevant=NO", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (WFNextHourPrecipitationDescription)currentDescription
{
  NSObject *v3;
  void *v4;
  NSArray *v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21189A000, v3, OS_LOG_TYPE_INFO, "About to compute the NextHour currentDesription", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_precipitationDescriptions;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v16;
    *(_QWORD *)&v7 = 138543362;
    v14 = v7;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "isValidAtDate:", v4, v14, (_QWORD)v15))
        {
          v6 = v10;
          goto LABEL_15;
        }
        WFLogForCategory(0);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v14;
          v20 = v10;
          _os_log_impl(&dword_21189A000, v11, OS_LOG_TYPE_INFO, "skipping description because it's not valid at this time. description=%{public}@ expired)", buf, 0xCu);
        }

      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_15:

  WFLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    _os_log_impl(&dword_21189A000, v12, OS_LOG_TYPE_INFO, "Looped through NextHour.descriptions and found: currentDescription=%{public}@", buf, 0xCu);
  }

  return (WFNextHourPrecipitationDescription *)v6;
}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD17C8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[WFNextHourPrecipitation minutes](self, "minutes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      v8 = v3;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v10 = (void *)MEMORY[0x24BDD17C8];
        -[WFNextHourPrecipitation minutes](self, "minutes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "indexOfObject:", v9);
        objc_msgSend(v9, "perceivedIntensity");
        objc_msgSend(v10, "stringWithFormat:", CFSTR("\nMinute: %lu - Value: %f"), v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "stringByAppendingString:", v14);
        v3 = (id)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v3;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFNextHourPrecipitation readDate](self, "readDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFNextHourPrecipitationReadDateKey"));

  -[WFNextHourPrecipitation startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("WFNextHourPrecipitationStartDateKey"));

  -[WFNextHourPrecipitation expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WFNextHourPrecipitationExpirationDateKey"));

  -[WFNextHourPrecipitation minutes](self, "minutes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("WFNextHourPrecipitationMinutesKey"));

  -[WFNextHourPrecipitation conditions](self, "conditions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("WFNextHourPrecipitationConditionsKey"));

  -[WFNextHourPrecipitation precipitationDescriptions](self, "precipitationDescriptions");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("WFNextHourPrecipitationPrecipitationDescriptionsKey"));

}

- (WFNextHourPrecipitation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFNextHourPrecipitation *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFNextHourPrecipitationReadDateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFNextHourPrecipitationStartDateKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFNextHourPrecipitationExpirationDateKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (initWithCoder__onceToken != -1)
    dispatch_once(&initWithCoder__onceToken, &__block_literal_global_7);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__classes, CFSTR("WFNextHourPrecipitationMinutesKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__classes, CFSTR("WFNextHourPrecipitationConditionsKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__classes, CFSTR("WFNextHourPrecipitationPrecipitationDescriptionsKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFNextHourPrecipitation initWithReadDate:startDate:expirationDate:minutes:conditions:descriptions:](self, "initWithReadDate:startDate:expirationDate:minutes:conditions:descriptions:", v5, v6, v7, v8, v9, v10);

  return v11;
}

void __41__WFNextHourPrecipitation_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)initWithCoder__classes;
  initWithCoder__classes = v4;

}

- (NSDate)readDate
{
  return self->_readDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSArray)minutes
{
  return self->_minutes;
}

- (NSArray)precipitationDescriptions
{
  return self->_precipitationDescriptions;
}

- (NSArray)conditions
{
  return self->_conditions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_precipitationDescriptions, 0);
  objc_storeStrong((id *)&self->_minutes, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_readDate, 0);
}

@end
