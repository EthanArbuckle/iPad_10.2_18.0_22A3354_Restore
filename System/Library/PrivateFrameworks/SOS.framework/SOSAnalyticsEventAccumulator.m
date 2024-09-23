@implementation SOSAnalyticsEventAccumulator

- (SOSAnalyticsEventAccumulator)initWithName:(id)a3
{
  id v5;
  SOSAnalyticsEventAccumulator *v6;
  uint64_t v7;
  NSMutableDictionary *accumulatedEventsDict;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SOSAnalyticsEventAccumulator;
  v6 = -[SOSAnalyticsEventAccumulator init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    accumulatedEventsDict = v6->_accumulatedEventsDict;
    v6->_accumulatedEventsDict = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v6;
}

- (unint64_t)_countForEventName:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_accumulatedEventsDict, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongValue");

  return v4;
}

- (void)noteEvent:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sos_aea_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[SOSAnalyticsEventAccumulator name](self, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("-");
    if (v6)
      v8 = (const __CFString *)v6;
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_INFO, "noteEvent [%{public}@]: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[SOSAnalyticsEventAccumulator _countForEventName:](self, "_countForEventName:", v4) + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_accumulatedEventsDict, "setObject:forKeyedSubscript:", v9, v4);

}

- (void)_addSummaryKeys:(id)a3 toAnalyticsDict:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  -[NSMutableDictionary allValues](self->_accumulatedEventsDict, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("@sum.unsignedIntegerValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v6, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKeyPath:", CFSTR("@sum.unsignedIntegerValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AllEventsKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v13);

  }
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("KnownEventsKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v15);

  }
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("UnknownEventsKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9 - v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, v17);

  }
}

- (id)analyticsDataDictForAccumulatedKeys:(id)a3 outputKeyPrefix:(id)a4 summaryKeysDict:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v20 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count") + objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
        if (objc_msgSend(v9, "length"))
        {
          objc_msgSend(v9, "stringByAppendingString:", v15);
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = v15;
        }
        v17 = v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[SOSAnalyticsEventAccumulator _countForEventName:](self, "_countForEventName:", v15));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  -[SOSAnalyticsEventAccumulator _addSummaryKeys:toAnalyticsDict:](self, "_addSummaryKeys:toAnalyticsDict:", v20, v10);
  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accumulatedEventsDict, 0);
}

@end
