@implementation PPSTimeSeries

- (id)countWithBlock:(id)a3
{
  return +[PPSCountGenerator countWithTimeSeries:block:](PPSCountGenerator, "countWithTimeSeries:block:", self, a3);
}

- (id)countMapWithBlock:(id)a3 groupingDimensions:(id)a4
{
  return +[PPSCountGenerator countMapWithTimeSeries:block:groupingDimensions:](PPSCountGenerator, "countMapWithTimeSeries:block:groupingDimensions:", self, a3, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PPSTimeSeries initWithEvents:](+[PPSTimeSeries allocWithZone:](PPSTimeSeries, "allocWithZone:", a3), "initWithEvents:", self->_events);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[PPSTimeSeries _guaranteeSortedness](self, "_guaranteeSortedness");
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSorted, CFSTR("isSorted"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sortHint, CFSTR("sortHint"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_events, CFSTR("events"));

}

- (PPSTimeSeries)initWithCoder:(id)a3
{
  id v4;
  PPSTimeSeries *v5;
  uint64_t v6;
  NSData *sortHint;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *events;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PPSTimeSeries;
  v5 = -[PPSTimeSeries init](&v14, sel_init);
  if (v5)
  {
    v5->_isSorted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSorted"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sortHint"));
    v6 = objc_claimAutoreleasedReturnValue();
    sortHint = v5->_sortHint;
    v5->_sortHint = (NSData *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("events"));
    v11 = objc_claimAutoreleasedReturnValue();
    events = v5->_events;
    v5->_events = (NSMutableArray *)v11;

    -[PPSTimeSeries _guaranteeSortedness](v5, "_guaranteeSortedness");
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  -[PPSTimeSeries _guaranteeSortedness](self, "_guaranteeSortedness");
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_events, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4;

  v4 = a3;
  -[PPSTimeSeries _guaranteeSortedness](self, "_guaranteeSortedness");
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_events, "enumerateObjectsUsingBlock:", v4);

}

- (id)objectEnumerator
{
  -[PPSTimeSeries _guaranteeSortedness](self, "_guaranteeSortedness");
  return (id)-[NSMutableArray objectEnumerator](self->_events, "objectEnumerator");
}

- (id)reverseObjectEnumerator
{
  -[PPSTimeSeries _guaranteeSortedness](self, "_guaranteeSortedness");
  return (id)-[NSMutableArray reverseObjectEnumerator](self->_events, "reverseObjectEnumerator");
}

- (PPSTimeSeries)init
{
  PPSTimeSeries *v2;
  uint64_t v3;
  NSMutableArray *events;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPSTimeSeries;
  v2 = -[PPSTimeSeries init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    events = v2->_events;
    v2->_events = (NSMutableArray *)v3;

    v2->_isSorted = 1;
  }
  return v2;
}

- (PPSTimeSeries)initWithEvents:(id)a3
{
  id v4;
  PPSTimeSeries *v5;
  uint64_t v6;
  NSMutableArray *events;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPSTimeSeries;
  v5 = -[PPSTimeSeries init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    events = v5->_events;
    v5->_events = (NSMutableArray *)v6;

    v5->_isSorted = 0;
    -[PPSTimeSeries _guaranteeSortedness](v5, "_guaranteeSortedness");
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned __int8 v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v6 = -[PPSTimeSeries isEqualToTimeSeries:](self, "isEqualToTimeSeries:", v4);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PPSTimeSeries;
    v6 = -[PPSTimeSeries isEqual:](&v9, sel_isEqual_, v4);
  }
  v7 = v6;

  return v7;
}

- (BOOL)isEqualToTimeSeries:(id)a3
{
  _QWORD *v4;
  NSMutableArray *events;
  void *v6;
  void *v7;

  if (self == a3)
    return 1;
  v4 = a3;
  -[PPSTimeSeries _guaranteeSortedness](self, "_guaranteeSortedness");
  events = self->_events;
  v6 = (void *)v4[4];

  v7 = (void *)objc_msgSend(v6, "copy");
  LOBYTE(events) = -[NSMutableArray isEqualToArray:](events, "isEqualToArray:", v7);

  return (char)events;
}

- (NSArray)allTimestamps
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[PPSTimeSeries _guaranteeSortedness](self, "_guaranteeSortedness");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](self->_events, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_events;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "monotonicTimestamp", (_QWORD)v13);
        objc_msgSend(v9, "numberWithDouble:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v11;
}

- (NSArray)array
{
  -[PPSTimeSeries _guaranteeSortedness](self, "_guaranteeSortedness");
  return (NSArray *)(id)-[NSMutableArray copy](self->_events, "copy");
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_events, "count");
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> count=%lu"), v5, self, -[PPSTimeSeries count](self, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[PPSTimeSeries _guaranteeSortedness](self, "_guaranteeSortedness");
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("("));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_events;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n%@,"), v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("\n)"));
  return v3;
}

- (PPSEvent)firstObject
{
  -[PPSTimeSeries _guaranteeSortedness](self, "_guaranteeSortedness");
  return (PPSEvent *)-[NSMutableArray firstObject](self->_events, "firstObject");
}

- (unint64_t)hash
{
  -[PPSTimeSeries _guaranteeSortedness](self, "_guaranteeSortedness");
  return -[NSMutableArray hash](self->_events, "hash");
}

- (PPSEvent)lastObject
{
  -[PPSTimeSeries _guaranteeSortedness](self, "_guaranteeSortedness");
  return (PPSEvent *)-[NSMutableArray lastObject](self->_events, "lastObject");
}

- (id)JSONRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x2494FEED8](self, a2);
  -[PPSTimeSeries _guaranteeSortedness](self, "_guaranteeSortedness");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[PPSTimeSeries count](self, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_events;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "dictionaryRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 1, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  if (v12)
  {
    PPSReaderLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PPSTimeSeries JSONRepresentation].cold.1((uint64_t)v12, v13);

  }
  objc_autoreleasePoolPop(v3);
  return v11;
}

- (void)addEvent:(id)a3
{
  -[NSMutableArray addObject:](self->_events, "addObject:", a3);
  self->_isSorted = 0;
}

- (BOOL)containsEvent:(id)a3
{
  return -[NSMutableArray containsObject:](self->_events, "containsObject:", a3);
}

- (id)filteredTimeSeriesUsingPredicate:(id)a3
{
  void *v3;
  PPSTimeSeries *v4;

  -[NSMutableArray filteredArrayUsingPredicate:](self->_events, "filteredArrayUsingPredicate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PPSTimeSeries initWithEvents:]([PPSTimeSeries alloc], "initWithEvents:", v3);

  return v4;
}

- (void)mergeWithTimeSeries:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableArray addObject:](self->_events, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  self->_isSorted = 0;

}

- (id)metricValuesForKey:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSMutableArray count](self->_events, "count"))
  {
    -[PPSTimeSeries _guaranteeSortedness](self, "_guaranteeSortedness");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_events;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "metricValueForKey:", v4, (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v5, "addObject:", v12);
            v9 = 1;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v13);

          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);

      if ((v9 & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v5, "copy");
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {

    }
    v14 = 0;
    goto LABEL_17;
  }
  v14 = 0;
LABEL_18:

  return v14;
}

- (void)removeAllEvents
{
  -[NSMutableArray removeAllObjects](self->_events, "removeAllObjects");
}

- (void)removeEvent:(id)a3
{
  -[NSMutableArray removeObject:](self->_events, "removeObject:", a3);
}

- (void)_guaranteeSortedness
{
  void *v3;
  NSMutableArray *events;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSData *v8;
  NSData *sortHint;

  if (!self->_isSorted)
  {
    v3 = (void *)MEMORY[0x2494FEED8]();
    events = self->_events;
    if (self->_sortHint)
      -[NSMutableArray sortedArrayUsingFunction:context:hint:](events, "sortedArrayUsingFunction:context:hint:", _eventSortComparator, 0);
    else
      -[NSMutableArray sortedArrayUsingSelector:](events, "sortedArrayUsingSelector:", sel_compare_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSMutableArray *)objc_msgSend(v5, "mutableCopy");
    v7 = self->_events;
    self->_events = v6;

    -[NSMutableArray sortedArrayHint](self->_events, "sortedArrayHint");
    v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    sortHint = self->_sortHint;
    self->_sortHint = v8;

    self->_isSorted = 1;
    objc_autoreleasePoolPop(v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_sortHint, 0);
}

- (void)JSONRepresentation
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2439D9000, a2, OS_LOG_TYPE_DEBUG, "Error while parsing JSON data: %@", (uint8_t *)&v2, 0xCu);
}

@end
