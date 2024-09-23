@implementation PGGraphDateNode

- (PGGraphDateNode)initWithName:(id)a3
{
  id v5;
  PGGraphDateNode *v6;
  PGGraphDateNode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphDateNode;
  v6 = -[PGGraphNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

- (PGGraphDateNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  void *v6;
  PGGraphDateNode *v7;

  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("name"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGGraphDateNode initWithName:](self, "initWithName:", v6);

  return v7;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = !v6 || objc_msgSend(v6, "isEqual:", self->_name);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)propertyDictionary
{
  NSString *name;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  name = self->_name;
  v4 = CFSTR("name");
  v5[0] = name;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)propertyForKey:(id)a3
{
  id v4;
  NSString *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("name")))
  {
    v5 = self->_name;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphDateNode.", (uint8_t *)&v7, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphDateNode (%@)"), self->_name);
}

- (PGGraphDateNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphDateNodeCollection alloc], "initWithNode:", self);
}

- (MANodeFilter)uniquelyIdentifyingFilter
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D42A50]);
  -[PGGraphDateNode propertyDictionary](self, "propertyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithLabel:domain:properties:", CFSTR("Date"), 400, v4);

  return (MANodeFilter *)v5;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Date");
  return CFSTR("Date");
}

- (unsigned)domain
{
  return 400;
}

- (PGGraphCalendarUnitNode)yearNode
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphDateNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "yearNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphCalendarUnitNode *)v4;
}

- (PGGraphCalendarUnitNode)monthDayNode
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphDateNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "monthDayNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphCalendarUnitNode *)v4;
}

- (PGGraphCalendarUnitNode)monthNode
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphDateNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "monthNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphCalendarUnitNode *)v4;
}

- (PGGraphCalendarUnitNode)dayNode
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphDateNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dayNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphCalendarUnitNode *)v4;
}

- (PGGraphCalendarUnitNode)weekOfYearNode
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphDateNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "weekOfYearNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphCalendarUnitNode *)v4;
}

- (PGGraphCalendarUnitNode)weekOfMonthNode
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphDateNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "weekOfMonthNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphCalendarUnitNode *)v4;
}

- (int64_t)year
{
  void *v2;
  int64_t v3;

  -[PGGraphDateNode yearNode](self, "yearNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "calendarUnitValue");

  return v3;
}

- (int64_t)monthDay
{
  void *v2;
  int64_t v3;

  -[PGGraphDateNode monthDayNode](self, "monthDayNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "calendarUnitValue");

  return v3;
}

- (int64_t)month
{
  void *v2;
  int64_t v3;

  -[PGGraphDateNode monthNode](self, "monthNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "calendarUnitValue");

  return v3;
}

- (int64_t)day
{
  void *v2;
  int64_t v3;

  -[PGGraphDateNode dayNode](self, "dayNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "calendarUnitValue");

  return v3;
}

- (void)enumerateHolidayEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("HOLIDAY"), 401, a3);
}

- (void)enumerateHolidayNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("HOLIDAY"), 401, a3);
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("DATE"), 400, a3);
}

- (PGGraphSeasonNode)seasonNode
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint8_t buf[4];
  PGGraphDateNode *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__44712;
  v13 = __Block_byref_object_dispose__44713;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__PGGraphDateNode_seasonNode__block_invoke;
  v8[3] = &unk_1E842F080;
  v8[4] = &v9;
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("SEASON"), 400, v8);
  v3 = (void *)v10[5];
  if (!v3)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggingConnection");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "Date Node %@ is not linked to any season node", buf, 0xCu);
    }

    v3 = (void *)v10[5];
  }
  v6 = v3;
  _Block_object_dispose(&v9, 8);

  return (PGGraphSeasonNode *)v6;
}

- (id)localDate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PGGraphDateNode dayNode](self, "dayNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphDateNode monthNode](self, "monthNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphDateNode yearNode](self, "yearNode");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3 && v4 && v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v7, "setDay:", objc_msgSend(v3, "calendarUnitValue"));
    objc_msgSend(v7, "setMonth:", objc_msgSend(v4, "calendarUnitValue"));
    objc_msgSend(v7, "setYear:", objc_msgSend(v6, "calendarUnitValue"));
    objc_msgSend(MEMORY[0x1E0D4B130], "dateFromComponents:inTimeZone:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[PGGraphDateNode description](self, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138413058;
      v14 = v12;
      v15 = 2048;
      v16 = v3;
      v17 = 2048;
      v18 = v4;
      v19 = 2048;
      v20 = v6;
      _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "Cannot create localDate from DateNode \"%@\". dayNode %p, monthNode %p, yearNode %p", (uint8_t *)&v13, 0x2Au);

    }
    v8 = 0;
  }

  return v8;
}

- (id)sameWeekDateNodes
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[MANode siblingNodesThroughEdgesWithLabel:domain:](self, "siblingNodesThroughEdgesWithLabel:domain:", CFSTR("WEEKYEAR"), 400);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphDateNode weekOfYearNode](self, "weekOfYearNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "calendarUnitValue");
  if (v6 == 1 || v6 > 51)
  {
    -[PGGraphDateNode localDate](self, "localDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v15, "localDate", (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "timeIntervalSinceDate:", v16);
          if (v17 < 0.0)
            v17 = -v17;
          if (v17 <= 604800.0)
            objc_msgSend(v8, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

  }
  else
  {
    -[MANode siblingNodesThroughEdgesWithLabel:domain:](self, "siblingNodesThroughEdgesWithLabel:domain:", CFSTR("YEAR"), 400);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intersectSet:", v7);

    v8 = v4;
  }

  return v8;
}

- (id)lastWeekDateNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = (void *)MEMORY[0x1E0D4B130];
  -[PGGraphDateNode localDate](self, "localDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingWeeksOfYear:toDate:", -1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 25088, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWeekday:", 1);
  v7 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(MEMORY[0x1E0D4B130], "dateFromComponents:inTimeZone:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "yearFromDate:", v8);

  if (objc_msgSend(v6, "weekOfYear") < 2 || (v10 = v9, objc_msgSend(v6, "weekOfYear") >= 52))
  {
    objc_msgSend(v6, "setWeekday:", 7);
    v11 = (void *)MEMORY[0x1E0D4B130];
    objc_msgSend(MEMORY[0x1E0D4B130], "dateFromComponents:inTimeZone:", v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "yearFromDate:", v12);

  }
  -[MANode graph](self, "graph");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v10)
  {
    v14 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v13, "dateNodesForWeekOfYear:", objc_msgSend(v6, "weekOfYear"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "dateNodesForYear:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "intersectSet:", v17);
  }
  else
  {
    objc_msgSend(v13, "dateNodesForWeekOfYear:", objc_msgSend(v6, "weekOfYear"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateNodesForYear:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "intersectSet:", v18);

    objc_msgSend(v13, "dateNodesForMonth:", 12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "intersectSet:", v19);

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateNodesForYear:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "intersectSet:", v21);

    objc_msgSend(v13, "dateNodesForMonth:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "intersectSet:", v22);

    objc_msgSend(v16, "unionSet:", v20);
  }

  return v16;
}

- (id)associatedNodesForRemoval
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__PGGraphDateNode_associatedNodesForRemoval__block_invoke;
  v15[3] = &unk_1E8433B30;
  v5 = v3;
  v16 = v5;
  -[PGGraphDateNode enumerateHolidayNodesUsingBlock:](self, "enumerateHolidayNodesUsingBlock:", v15);
  -[PGGraphDateNode seasonNode](self, "seasonNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "edgesCount");

  if (v7 == 1)
  {
    -[PGGraphDateNode seasonNode](self, "seasonNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  if (associatedNodesForRemoval_onceToken != -1)
    dispatch_once(&associatedNodesForRemoval_onceToken, &__block_literal_global_44705);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __44__PGGraphDateNode_associatedNodesForRemoval__block_invoke_3;
  v13[3] = &unk_1E84366E8;
  v9 = v5;
  v14 = v9;
  -[MANode enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:](self, "enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:", v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

void __44__PGGraphDateNode_associatedNodesForRemoval__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "countOfEdgesWithLabel:domain:", CFSTR("HOLIDAY"), 401) == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __44__PGGraphDateNode_associatedNodesForRemoval__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "domain") == 400)
  {
    v6 = (void *)associatedNodesForRemoval_sDateEdgeLabels;
    objc_msgSend(v8, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7);

    if ((_DWORD)v6)
    {
      if (objc_msgSend(v5, "edgesCount") == 1)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    }
  }

}

void __44__PGGraphDateNode_associatedNodesForRemoval__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("YEAR"), CFSTR("MONTH"), CFSTR("WEEKMONTH"), CFSTR("DAY"), CFSTR("WEEKYEAR"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)associatedNodesForRemoval_sDateEdgeLabels;
  associatedNodesForRemoval_sDateEdgeLabels = v0;

}

void __29__PGGraphDateNode_seasonNode__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Date"), 400);
}

+ (id)dateNodeForDayNode:(id)a3 monthNode:(id)a4 yearNode:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__44712;
  v22 = __Block_byref_object_dispose__44713;
  v23 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__PGGraphDateNode_dateNodeForDayNode_monthNode_yearNode___block_invoke;
  v14[3] = &unk_1E842F058;
  v10 = v8;
  v15 = v10;
  v11 = v9;
  v16 = v11;
  v17 = &v18;
  objc_msgSend(v7, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("DAY"), 400, v14);
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12;
}

+ (id)filterWithDateNames:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D42A50];
  v4 = a3;
  v5 = [v3 alloc];
  v9 = CFSTR("name");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithLabel:domain:properties:", CFSTR("Date"), 400, v6);
  return v7;
}

+ (MARelation)seasonOfDate
{
  void *v2;
  void *v3;

  +[PGGraphSeasonEdge filter](PGGraphSeasonEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)yearOfDate
{
  void *v2;
  void *v3;

  +[PGGraphCalendarUnitEdge yearFilter](PGGraphCalendarUnitEdge, "yearFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)monthDayOfDate
{
  void *v2;
  void *v3;

  +[PGGraphCalendarUnitEdge monthDayFilter](PGGraphCalendarUnitEdge, "monthDayFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (id)monthOfDate
{
  void *v2;
  void *v3;

  +[PGGraphCalendarUnitEdge monthFilter](PGGraphCalendarUnitEdge, "monthFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)dayOfDate
{
  void *v2;
  void *v3;

  +[PGGraphCalendarUnitEdge dayFilter](PGGraphCalendarUnitEdge, "dayFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (MARelation)dayOfWeekOfDate
{
  void *v2;
  void *v3;

  +[PGGraphDayOfWeekEdge filter](PGGraphDayOfWeekEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (id)weekOfYearOfDate
{
  void *v2;
  void *v3;

  +[PGGraphCalendarUnitEdge weekOfYearFilter](PGGraphCalendarUnitEdge, "weekOfYearFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)weekOfMonthOfDate
{
  void *v2;
  void *v3;

  +[PGGraphCalendarUnitEdge weekOfMonthFilter](PGGraphCalendarUnitEdge, "weekOfMonthFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (MARelation)momentOfDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphDateEdge filter](PGGraphDateEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (id)holidayOfDate
{
  void *v2;
  void *v3;

  +[PGGraphHolidayEdge filter](PGGraphHolidayEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __57__PGGraphDateNode_dateNodeForDayNode_monthNode_yearNode___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "monthNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSameNodeAsNode:", a1[4]);

  if (v7)
  {
    objc_msgSend(v10, "yearNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isSameNodeAsNode:", a1[5]);

    if (v9)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
      *a3 = 1;
    }
  }

}

@end
