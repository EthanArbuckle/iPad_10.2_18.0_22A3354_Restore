@implementation WLKSchedule

- (WLKSchedule)initWithDictionary:(id)a3
{
  id v4;
  WLKSchedule *v5;
  NSMutableArray *v6;
  void *v7;
  WLKEvent *v8;
  WLKSchedule *v9;
  NSMutableArray *mutableEvents;
  NSMutableArray *v11;
  void *v12;
  uint64_t v13;
  NSString *serviceID;
  void *v15;
  uint64_t v16;
  NSDate *startDate;
  void *v18;
  uint64_t v19;
  NSDate *endDate;
  uint64_t v21;
  NSDictionary *dictionary;
  _QWORD v24[4];
  WLKEvent *v25;
  objc_super v26;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v26.receiver = self;
    v26.super_class = (Class)WLKSchedule;
    v5 = -[WLKSchedule init](&v26, sel_init);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "wlk_arrayForKey:", CFSTR("schedule"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __34__WLKSchedule_initWithDictionary___block_invoke;
        v24[3] = &unk_1E68A8738;
        v25 = v6;
        objc_msgSend(v7, "enumerateObjectsUsingBlock:", v24);
        v8 = v25;
      }
      else
      {
        v8 = -[WLKEvent initWithDictionary:]([WLKEvent alloc], "initWithDictionary:", v4);
        if (v8)
          -[NSMutableArray addObject:](v6, "addObject:", v8);
      }

      mutableEvents = v5->_mutableEvents;
      v5->_mutableEvents = v6;
      v11 = v6;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("serviceId"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      serviceID = v5->_serviceID;
      v5->_serviceID = (NSString *)v13;

      objc_msgSend(v4, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("scheduleStartTime"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      startDate = v5->_startDate;
      v5->_startDate = (NSDate *)v16;

      objc_msgSend(v4, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("scheduleEndTime"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");
      endDate = v5->_endDate;
      v5->_endDate = (NSDate *)v19;

      v21 = objc_msgSend(v4, "copy");
      dictionary = v5->_dictionary;
      v5->_dictionary = (NSDictionary *)v21;

    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __34__WLKSchedule_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WLKEvent *v4;
  WLKEvent *v5;

  v3 = a2;
  v5 = -[WLKEvent initWithDictionary:]([WLKEvent alloc], "initWithDictionary:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

- (NSArray)events
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableEvents, "copy");
}

- (id)eventForDate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_mutableEvents;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "startDate", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "endDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[WLKSchedule _isDate:containedByDate:andDate:](self, "_isDate:containedByDate:andDate:", v4, v11, v12);

        if (v13)
        {
          v14 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)eventForDate:(id)a3 fuzziness:(double)a4
{
  id v6;
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_mutableEvents;
  v8 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = objc_alloc(MEMORY[0x1E0CB3588]);
        v13 = (void *)objc_msgSend(v12, "initWithStartDate:duration:", v6, a4, (_QWORD)v17);
        objc_msgSend(v11, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "containsDate:", v14);

        if (v15)
        {
          v8 = v11;

          goto LABEL_11;
        }

      }
      v8 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)adjacentEventsForDate:(id)a3 fuzziness:(double)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = self->_mutableEvents;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", -a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "endDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dateByAddingTimeInterval:", a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[WLKSchedule _isDate:containedByDate:andDate:](self, "_isDate:containedByDate:andDate:", v6, v14, v16))
          objc_msgSend(v19, "addObject:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v17 = (void *)objc_msgSend(v19, "copy");
  return v17;
}

- (id)eventAfterDate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_mutableEvents;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "startDate", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "compare:", v4);

        if (v11 == 1)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)prune
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_mutableEvents, "count"))
  {
    v4 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_mutableEvents, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v3, "compare:", v6);

      if (v7 == 1)
        objc_msgSend(v8, "addIndex:", v4);

      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_mutableEvents, "count"));
  }
  -[NSMutableArray removeObjectsAtIndexes:](self->_mutableEvents, "removeObjectsAtIndexes:", v8);

}

- (BOOL)_isDate:(id)a3 containedByDate:(id)a4 andDate:(id)a5
{
  id v7;
  id v8;
  BOOL v9;

  v7 = a3;
  v8 = a5;
  v9 = (unint64_t)objc_msgSend(v7, "compare:", a4) <= 1
    && (unint64_t)(objc_msgSend(v7, "compare:", v8) + 1) < 2;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WLKSchedule *v4;
  BOOL v5;

  v4 = (WLKSchedule *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSDictionary isEqualToDictionary:](self->_dictionary, "isEqualToDictionary:", v4->_dictionary);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_dictionary, "hash");
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_mutableEvents, 0);
}

@end
