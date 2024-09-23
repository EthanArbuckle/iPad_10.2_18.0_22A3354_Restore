@implementation PLBatteryUIResponseTypeUsageTimes

- (id)dependencies
{
  return 0;
}

- (void)configure:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUsageTimes setStart:](self, "setStart:", v11);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUsageTimes setEnd:](self, "setEnd:", v12);

  -[PLBatteryUIResponseTypeUsageTimes start](self, "start");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUsageTimes end](self, "end");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  v16 = v15;
  objc_msgSend(v14, "timeIntervalSince1970");
  v18 = v17 - v16;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bucket"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "doubleValue");
  -[PLBatteryUIResponseTypeUsageTimes setBucketSize:](self, "setBucketSize:");

  +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("ScreenOn"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUsageTimes responderService](self, "responderService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "storage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "entriesForKey:inTimeRange:withFilters:", v23, 0, v16 + -1800.0, v18 + 1800.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUsageTimes setAggregateEntries:](self, "setAggregateEntries:", v22);

}

- (void)run
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "Number of buckets requested: %d", (uint8_t *)v2, 8u);
}

- (id)result
{
  -[PLBatteryUIResponseTypeUsageTimes setAggregateEntries:](self, "setAggregateEntries:", 0);
  return -[PLBatteryUIResponseTypeUsageTimes resultDictionary](self, "resultDictionary");
}

- (id)entriesInRange:(_PLTimeIntervalRange)a3 fromEntries:(id)a4
{
  double length;
  double location;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  length = a3.length;
  location = a3.location;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v12 = location + length;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "entryDate", (_QWORD)v21);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = v15;
          objc_msgSend(v15, "timeIntervalSince1970");
          v18 = v17;

          if (location <= v18 && v18 < v12)
            objc_msgSend(v7, "addObject:", v14);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v7;
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponderService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)bucketSize
{
  return self->_bucketSize;
}

- (void)setBucketSize:(double)a3
{
  self->_bucketSize = a3;
}

- (NSArray)aggregateEntries
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAggregateEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)resultDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setResultDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDictionary, 0);
  objc_storeStrong((id *)&self->_aggregateEntries, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end
