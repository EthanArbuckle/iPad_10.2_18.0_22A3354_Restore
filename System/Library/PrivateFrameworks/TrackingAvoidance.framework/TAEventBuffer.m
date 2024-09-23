@implementation TAEventBuffer

BOOL __32__TAEventBuffer_purgeWithClock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  _BOOL8 v8;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "getDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "bufferTimeIntervalOfRetention");
  v8 = v6 > v7;

  return v8;
}

- (id)getAllTAEventsBetween:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateForTAEventsInDateInterval:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TAEventBuffer getAllTAEventsMatchingCompoundPredicate:](self, "getAllTAEventsMatchingCompoundPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getAllTAEventsMatchingCompoundPredicate:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_latestExpiredElements;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_latestExpiredElements, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "filterUsingPredicate:", v4);
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_4);
  -[TACircularBuffer objectsMatchingPredicate:](self->_eventBuffer, "objectsMatchingPredicate:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)purgeWithClock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  TAEventBuffer *v18;

  v4 = a3;
  -[TACircularBuffer firstObject](self->_eventBuffer, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v6);
  v8 = v7;
  -[TAEventBufferSettings bufferTimeIntervalOfRetention](self->_settings, "bufferTimeIntervalOfRetention");
  v10 = v9;

  if (v8 >= v10)
  {
    v11 = (void *)MEMORY[0x24BDD1758];
    v12 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __32__TAEventBuffer_purgeWithClock___block_invoke;
    v16[3] = &unk_24D815640;
    v17 = v4;
    v18 = self;
    objc_msgSend(v11, "predicateWithBlock:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TACircularBuffer removeUntilFirstPredicateFail:](self->_eventBuffer, "removeUntilFirstPredicateFail:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __32__TAEventBuffer_purgeWithClock___block_invoke_2;
    v15[3] = &unk_24D8156F8;
    v15[4] = self;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);

  }
}

- (void)ingestTAEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TACircularBuffer lastObject](self->_eventBuffer, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5
    || (objc_msgSend(v5, "getDate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "getDate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "compare:", v8),
        v8,
        v7,
        v9 != 1))
  {
    v19 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v4, "description");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = 136380675;
      v24 = objc_msgSend(v21, "UTF8String");
      _os_log_impl(&dword_217877000, v20, OS_LOG_TYPE_DEFAULT, "#TAStore adding:%{private}s", (uint8_t *)&v23, 0xCu);

    }
    -[TACircularBuffer add:](self->_eventBuffer, "add:", v4);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[TACircularBuffer bufferCopy](self->_eventBuffer, "bufferCopy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TACircularBuffer bufferCopy](self->_eventBuffer, "bufferCopy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v11, "count"), 1024, &__block_literal_global_28);

  -[TACircularBuffer bufferCopy](self->_eventBuffer, "bufferCopy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  v15 = (void *)TAStatusLog;
  if (v12 < v14)
  {
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v4, "description");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = 136380675;
      v24 = objc_msgSend(v17, "UTF8String");
      _os_log_impl(&dword_217877000, v16, OS_LOG_TYPE_DEFAULT, "#TAStore inserting OOO event:%{private}s", (uint8_t *)&v23, 0xCu);

    }
    -[TACircularBuffer insert:at:](self->_eventBuffer, "insert:at:", v4, v12);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v22 = (void *)v18;
    if (v18)
    {
      -[TAEventBuffer updateLatestExpiredElements:](self, "updateLatestExpiredElements:", v18);

    }
    goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    -[TAEventBuffer ingestTAEvent:].cold.1(v15, v4);
LABEL_14:
  -[TAEventBuffer _updateLatestElement:](self, "_updateLatestElement:", v4);

}

- (void)_updateLatestElement:(id)a3
{
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      +[TAEventBuffer getExpiredElementKeyForClass:andEventSubtype:](TAEventBuffer, "getExpiredElementKeyForClass:andEventSubtype:", objc_opt_class(), objc_msgSend(v8, "getEventSubtype"));
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        -[TAEventBuffer _updateLatestElement:withKey:](self, "_updateLatestElement:withKey:", v8, v6);

      }
    }
    -[TAEventBuffer _updateLatestElement:withKey:](self, "_updateLatestElement:withKey:", v8, v5);

  }
}

- (void)_updateLatestElement:(id)a3 withKey:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *latestElements;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_latestElements, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  latestElements = self->_latestElements;
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](latestElements, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "compare:", v11);

    if (v12 == -1)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_latestElements, "setObject:forKeyedSubscript:", v13, v6);

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](latestElements, "setObject:forKeyedSubscript:", v13, v6);
  }

}

uint64_t __32__TAEventBuffer_purgeWithClock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLatestExpiredElements:", a2);
}

- (void)updateLatestExpiredElements:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      +[TAEventBuffer getExpiredElementKeyForClass:andEventSubtype:](TAEventBuffer, "getExpiredElementKeyForClass:andEventSubtype:", objc_opt_class(), objc_msgSend(v7, "getEventSubtype"));
    }
    else
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[NSMutableDictionary setValue:forKey:](self->_latestExpiredElements, "setValue:forKey:", v7, v6);

    v4 = v7;
  }

}

- (TAEventBuffer)initWithSettings:(id)a3
{
  id v5;
  TAEventBuffer *v6;
  TAEventBuffer *v7;
  TACircularBuffer *v8;
  TACircularBuffer *eventBuffer;
  NSMutableDictionary *v10;
  NSMutableDictionary *latestExpiredElements;
  NSMutableDictionary *v12;
  NSMutableDictionary *latestElements;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TAEventBuffer;
  v6 = -[TAEventBuffer init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    v8 = -[TACircularBuffer initWithCapacity:]([TACircularBuffer alloc], "initWithCapacity:", -[TAEventBufferSettings bufferCapacity](v7->_settings, "bufferCapacity"));
    eventBuffer = v7->_eventBuffer;
    v7->_eventBuffer = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    latestExpiredElements = v7->_latestExpiredElements;
    v7->_latestExpiredElements = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    latestElements = v7->_latestElements;
    v7->_latestElements = v12;

  }
  return v7;
}

+ (id)getExpiredElementKeyForClass:(Class)a3 andEventSubtype:(unint64_t)a4
{
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%lu"), v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getAllTAEventsOf:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateForTAEventsClass:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TAEventBuffer getAllTAEventsMatchingCompoundPredicate:](self, "getAllTAEventsMatchingCompoundPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getAllTAEventsOf:(Class)a3 andEventSubtype:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateForTAEventsClass:andEventSubtype:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TAEventBuffer getAllTAEventsMatchingCompoundPredicate:](self, "getAllTAEventsMatchingCompoundPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getAllTAEventsOf:(Class)a3 between:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateForTAEventsInDateInterval:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateForTAEventsClass:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[TAEventBuffer getAllTAEventsMatchingCompoundPredicate:](self, "getAllTAEventsMatchingCompoundPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)getAllTAEventsOf:(Class)a3 andEventSubtype:(unint64_t)a4 between:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateForTAEventsInDateInterval:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateForTAEventsClass:andEventSubtype:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[TAEventBuffer getAllTAEventsMatchingCompoundPredicate:](self, "getAllTAEventsMatchingCompoundPredicate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __57__TAEventBuffer_getAllTAEventsMatchingCompoundPredicate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "getDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __31__TAEventBuffer_ingestTAEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "getDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)getEarliestEventDate
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableDictionary count](self->_latestExpiredElements, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = self->_latestExpiredElements;
    v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v3);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_latestExpiredElements, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "getDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v6)
          {
            objc_msgSend(v6, "earlierDate:", v10);
            v12 = objc_claimAutoreleasedReturnValue();

            v6 = (id)v12;
          }
          else
          {
            v6 = v10;
          }

        }
        v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

    return v6;
  }
  else if (-[TACircularBuffer count](self->_eventBuffer, "count"))
  {
    -[TACircularBuffer firstObject](self->_eventBuffer, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    return v14;
  }
  else
  {
    return 0;
  }
}

- (id)getLatestElementOf:(Class)a3
{
  objc_class *v4;
  void *v5;
  void *v6;

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_latestElements, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)getLatestElementOf:(Class)a3 andEventSubtype:(unint64_t)a4
{
  void *v5;
  void *v6;

  +[TAEventBuffer getExpiredElementKeyForClass:andEventSubtype:](TAEventBuffer, "getExpiredElementKeyForClass:andEventSubtype:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_latestElements, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestElements, 0);
  objc_storeStrong((id *)&self->_latestExpiredElements, 0);
  objc_storeStrong((id *)&self->_eventBuffer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)ingestTAEvent:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "description");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = 136380675;
  v6 = objc_msgSend(v4, "UTF8String");
  _os_log_fault_impl(&dword_217877000, v3, OS_LOG_TYPE_FAULT, "#TAStore unreacheable state; in-order TAEvent should be added already: %{private}s",
    (uint8_t *)&v5,
    0xCu);

}

@end
