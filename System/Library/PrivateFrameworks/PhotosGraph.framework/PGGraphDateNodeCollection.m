@implementation PGGraphDateNodeCollection

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphDateNode momentOfDate](PGGraphDateNode, "momentOfDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphYearNodeCollection)yearNodes
{
  void *v3;
  void *v4;

  +[PGGraphDateNode yearOfDate](PGGraphDateNode, "yearOfDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphYearNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphYearNodeCollection *)v4;
}

- (PGGraphMonthDayNodeCollection)monthDayNodes
{
  void *v3;
  void *v4;

  +[PGGraphDateNode monthDayOfDate](PGGraphDateNode, "monthDayOfDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMonthDayNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMonthDayNodeCollection *)v4;
}

- (PGGraphMonthNodeCollection)monthNodes
{
  void *v3;
  void *v4;

  +[PGGraphDateNode monthOfDate](PGGraphDateNode, "monthOfDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMonthNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMonthNodeCollection *)v4;
}

- (PGGraphDayNodeCollection)dayNodes
{
  void *v3;
  void *v4;

  +[PGGraphDateNode dayOfDate](PGGraphDateNode, "dayOfDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphDayNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphDayNodeCollection *)v4;
}

- (PGGraphWeekOfYearNodeCollection)weekOfYearNodes
{
  void *v3;
  void *v4;

  +[PGGraphDateNode weekOfYearOfDate](PGGraphDateNode, "weekOfYearOfDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphWeekOfYearNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphWeekOfYearNodeCollection *)v4;
}

- (PGGraphWeekOfMonthNodeCollection)weekOfMonthNodes
{
  void *v3;
  void *v4;

  +[PGGraphDateNode weekOfMonthOfDate](PGGraphDateNode, "weekOfMonthOfDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphWeekOfMonthNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphWeekOfMonthNodeCollection *)v4;
}

- (PGGraphSeasonNodeCollection)seasonNodes
{
  void *v3;
  void *v4;

  +[PGGraphDateNode seasonOfDate](PGGraphDateNode, "seasonOfDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphSeasonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphSeasonNodeCollection *)v4;
}

- (PGGraphHolidayNodeCollection)holidayNodes
{
  void *v3;
  void *v4;

  +[PGGraphDateNode holidayOfDate](PGGraphDateNode, "holidayOfDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHolidayNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHolidayNodeCollection *)v4;
}

- (NSDateInterval)localDateInterval
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[MAElementCollection array](self, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v2;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        v10 = v4;
        v11 = v3;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "localDate", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "earlierDate:", v12);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "laterDate:", v12);
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          ++v9;
          v10 = v4;
          v11 = v3;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v3, v4);
  }
  else
  {
    v13 = 0;
  }

  return (NSDateInterval *)v13;
}

- (NSArray)dateNames
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__PGGraphDateNodeCollection_dateNames__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("name"), v6);

  return (NSArray *)v4;
}

uint64_t __38__PGGraphDateNodeCollection_dateNames__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)dateNodesForLocalDates:(id)a3 inGraph:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "dateNodeNameWithLocalDate:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  +[PGGraphDateNode filterWithDateNames:](PGGraphDateNode, "filterWithDateNames:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphDateNodeCollection, "nodesMatchingFilter:inGraph:", v14, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
