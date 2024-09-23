@implementation PGTitleGeneratorDateMatching

- (PGTitleGeneratorDateMatching)initWithType:(int64_t)a3 referenceDateInterval:(id)a4 momentNodes:(id)a5 lineBreakBehavior:(unint64_t)a6 isForHighlight:(BOOL)a7 titleGenerationContext:(id)a8
{
  PGTitleGeneratorDateMatching *result;

  result = -[PGTitleGeneratorDateMatching initWithType:referenceDateInterval:momentNodes:titleGenerationContext:holidayName:isForHighlight:](self, "initWithType:referenceDateInterval:momentNodes:titleGenerationContext:holidayName:isForHighlight:", a3, a4, a5, a8, 0, a7);
  if (result)
    result->_lineBreakBehavior = a6;
  return result;
}

- (PGTitleGeneratorDateMatching)initWithType:(int64_t)a3 referenceDateInterval:(id)a4 highlightNode:(id)a5 titleGenerationContext:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  PGTitleGeneratorDateMatching *v15;

  v10 = a4;
  v11 = a6;
  objc_msgSend(a5, "collection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "momentNodes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "temporarySet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[PGTitleGeneratorDateMatching initWithType:referenceDateInterval:momentNodes:titleGenerationContext:](self, "initWithType:referenceDateInterval:momentNodes:titleGenerationContext:", a3, v10, v14, v11);

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (PGTitleGeneratorDateMatching)initWithType:(int64_t)a3 referenceDateInterval:(id)a4 momentNodes:(id)a5 titleGenerationContext:(id)a6
{
  return -[PGTitleGeneratorDateMatching initWithType:referenceDateInterval:momentNodes:titleGenerationContext:holidayName:isForHighlight:](self, "initWithType:referenceDateInterval:momentNodes:titleGenerationContext:holidayName:isForHighlight:", a3, a4, a5, a6, 0, 0);
}

- (PGTitleGeneratorDateMatching)initWithType:(int64_t)a3 referenceDateInterval:(id)a4 momentNodes:(id)a5 titleGenerationContext:(id)a6 holidayName:(id)a7 isForHighlight:(BOOL)a8
{
  id v15;
  id v16;
  PGTitleGeneratorDateMatching *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSSet *dateNodes;
  PGTitleGeneratorDateMatching *v22;
  _BOOL4 v24;
  NSSet *v25;
  void *v26;
  uint64_t v27;
  _BOOL4 v28;
  id v29;
  id v30;
  void *v31;
  NSSet *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;
  uint8_t buf[4];
  NSSet *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v36 = a4;
  v15 = a5;
  v35 = a6;
  v16 = a7;
  v38.receiver = self;
  v38.super_class = (Class)PGTitleGeneratorDateMatching;
  v17 = -[PGTitleGeneratorDateMatching init](&v38, sel_init);
  if (!v17)
    goto LABEL_9;
  if (!objc_msgSend(v15, "count"))
  {
    v22 = 0;
    goto LABEL_11;
  }
  v33 = v16;
  objc_msgSend(v15, "anyObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "graph");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v19;
  objc_storeStrong((id *)&v17->_graph, v19);
  objc_storeStrong((id *)&v17->_referenceDateInterval, a4);
  objc_storeStrong((id *)&v17->_momentNodes, a5);
  +[PGCommonTitleUtility dateNodesFromMomentNodes:](PGCommonTitleUtility, "dateNodesFromMomentNodes:", v15);
  v20 = objc_claimAutoreleasedReturnValue();
  dateNodes = v17->_dateNodes;
  v17->_dateNodes = (NSSet *)v20;

  objc_storeStrong((id *)&v17->_titleGenerationContext, a6);
  objc_storeStrong((id *)&v17->_holidayName, a7);
  v17->_isForHighlight = a8;
  if (-[NSSet count](v17->_dateNodes, "count") != 1 || v17->_holidayName)
  {
    v16 = v33;
    goto LABEL_6;
  }
  v24 = +[PGUserDefaults isAlwaysShowingHolidayCalendarEvents](PGUserDefaults, "isAlwaysShowingHolidayCalendarEvents");
  v25 = v17->_dateNodes;
  v16 = v33;
  if (!v24)
  {
    v37 = 0;
    v28 = +[PGCommonTitleUtility containsCelebrationForDateNodes:holidayName:titleGenerationContext:graph:](PGCommonTitleUtility, "containsCelebrationForDateNodes:holidayName:titleGenerationContext:graph:", v25, &v37, v17->_titleGenerationContext, v17->_graph);
    v29 = v37;
    v30 = v37;
    v31 = v30;
    if (v28)
    {
      if (v30)
      {
        objc_storeStrong((id *)&v17->_holidayName, v29);
        a3 = 4;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          v32 = v17->_dateNodes;
          *(_DWORD *)buf = 138412290;
          v40 = v32;
          _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Date %@ contains celebration but holiday name is nil", buf, 0xCu);
        }
        a3 = -[PGTitleGeneratorDateMatching _findBestType](v17, "_findBestType");
      }
    }

    goto LABEL_6;
  }
  +[PGCommonTitleUtility holidayNameForDateNodes:](PGCommonTitleUtility, "holidayNameForDateNodes:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (!v27)
  {
LABEL_6:
    if (!a3)
      a3 = -[PGTitleGeneratorDateMatching _findBestType](v17, "_findBestType");
    goto LABEL_8;
  }
  a3 = 4;
LABEL_8:
  v17->_type = a3;

LABEL_9:
  v22 = v17;
LABEL_11:

  return v22;
}

- (PGTitle)title
{
  void *v3;
  void *v4;
  int64_t type;
  NSString *v6;
  id v7;
  char v8;
  void *v9;
  unint64_t lineBreakBehavior;
  char v11;
  void *v12;
  PGTitleSpecArgumentEvaluationContext *v13;
  void *v14;
  void *v15;
  PGTitleSpecArgumentEvaluationContext *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGRelativeDateTitleOnThisDay"), CFSTR("PGRelativeDateTitleOnThisDay"), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  type = self->_type;
  if ((unint64_t)(type - 1) < 2)
  {
LABEL_11:
    v7 = v4;
    v8 = 1;
    if (!v7)
      goto LABEL_9;
    goto LABEL_12;
  }
  if (type == 3)
    goto LABEL_29;
  if (type != 4)
    goto LABEL_25;
  if (+[PGUserDefaults isAlwaysShowingHolidayCalendarEvents](PGUserDefaults, "isAlwaysShowingHolidayCalendarEvents"))
  {
    +[PGCommonTitleUtility holidayNameForDateNodes:](PGCommonTitleUtility, "holidayNameForDateNodes:", self->_dateNodes);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!+[PGUserDefaults isShowingHolidayCalendarEvents](PGUserDefaults, "isShowingHolidayCalendarEvents"))
  {
LABEL_29:
    if (-[PGTitleGeneratorDateMatching _dateNodeIntersectsWithReferenceDateIntervalByIgnoringYear](self, "_dateNodeIntersectsWithReferenceDateIntervalByIgnoringYear"))
    {
      goto LABEL_11;
    }
LABEL_25:
    v9 = 0;
    v7 = 0;
    goto LABEL_26;
  }
  v6 = self->_holidayName;
LABEL_8:
  v7 = v6;
  v8 = 0;
  if (!v6)
  {
LABEL_9:
    v9 = 0;
    goto LABEL_26;
  }
LABEL_12:
  lineBreakBehavior = self->_lineBreakBehavior;
  if (self->_isForHighlight)
    v11 = v8;
  else
    v11 = 1;
  if ((v11 & 1) == 0)
  {
    +[PGHighlightsTitleSpecFactory titleSpecForHolidayEventIncludingLocationIfPossible:](PGHighlightsTitleSpecFactory, "titleSpecForHolidayEventIncludingLocationIfPossible:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInsertNonBreakableSpace:", (lineBreakBehavior >> 1) & 1);
    v13 = [PGTitleSpecArgumentEvaluationContext alloc];
    -[PGTitleGenerationContext locationHelper](self->_titleGenerationContext, "locationHelper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleGenerationContext serviceManager](self->_titleGenerationContext, "serviceManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PGTitleSpecArgumentEvaluationContext initWithLocationHelper:serviceManager:](v13, "initWithLocationHelper:serviceManager:", v14, v15);

    objc_msgSend(v12, "titleWithMomentNodes:argumentEvaluationContext:", self->_momentNodes, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v18 = objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      +[PGHighlightsTitleSpecFactory titleSpecForHolidayEventIncludingLocationIfPossible:](PGHighlightsTitleSpecFactory, "titleSpecForHolidayEventIncludingLocationIfPossible:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setInsertNonBreakableSpace:", (lineBreakBehavior >> 1) & 1);
      objc_msgSend(v19, "titleWithMomentNodes:argumentEvaluationContext:", self->_momentNodes, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringValue");
      v18 = objc_claimAutoreleasedReturnValue();

    }
    v7 = (id)v18;
  }
  if ((lineBreakBehavior & 1) != 0)
    v21 = v8;
  else
    v21 = 1;
  if ((v21 & 1) == 0)
  {
    +[PGCommonTitleUtility titleWithLineBreakForTitle:](PGCommonTitleUtility, "titleWithLineBreakForTitle:", v7);
    v22 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v22;
  }
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v7, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return (PGTitle *)v9;
}

- (unint64_t)allowedTimeTitleFormats
{
  int64_t type;

  type = self->_type;
  if (!type)
    return 3;
  if (type == 4
    && (+[PGUserDefaults isShowingHolidayCalendarEvents](PGUserDefaults, "isShowingHolidayCalendarEvents")
     || +[PGUserDefaults isAlwaysShowingHolidayCalendarEvents](PGUserDefaults, "isAlwaysShowingHolidayCalendarEvents")))
  {
    return 4;
  }
  return 1;
}

- (BOOL)_dateNodeIntersectsWithReferenceDateIntervalByIgnoringYear
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (self->_referenceDateInterval)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v3 = self->_dateNodes;
    v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = 0;
      v8 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "localDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v7 || objc_msgSend(v7, "compare:", v10) == 1)
          {
            v11 = v10;

            v7 = v11;
          }
          if (!v6 || objc_msgSend(v6, "compare:", v10) == -1)
          {
            v12 = v10;

            v6 = v12;
          }

        }
        v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v5);

      if (!v7)
      {
        v28 = 0;
        goto LABEL_31;
      }
      -[NSDateInterval startDate](self->_referenceDateInterval, "startDate");
      v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 24, v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D4B130];
      -[NSDateInterval endDate](self->_referenceDateInterval, "endDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "components:fromDate:", 24, v15);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      while (2)
      {

        v16 = v7;
        objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 24, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 24, v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v16;
        do
        {
          v19 = objc_msgSend(v13, "day", v30);
          if (v19 == objc_msgSend(v17, "day"))
          {
            v20 = objc_msgSend(v13, "month");
            if (v20 == objc_msgSend(v17, "month"))
            {
              LOBYTE(v7) = 1;
              goto LABEL_28;
            }
          }
          objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", 1, v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 24, v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = objc_msgSend(v21, "day");
          if (v22 > objc_msgSend(v18, "day"))
            break;
          v23 = objc_msgSend(v21, "month");
          v17 = v21;
          v16 = v15;
        }
        while (v23 <= objc_msgSend(v18, "month"));
        objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", 1, v3);
        v24 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 24, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = objc_msgSend(v25, "day");
        if (v26 <= objc_msgSend(v31, "day"))
        {
          v27 = objc_msgSend(v25, "month");
          if (v27 <= objc_msgSend(v31, "month"))
          {

            v13 = v25;
            v3 = (NSSet *)v24;
            continue;
          }
        }
        break;
      }
      LOBYTE(v7) = 0;
      v17 = v21;
      v3 = (NSSet *)v24;
      v16 = v15;
      v13 = v25;
LABEL_28:

      v28 = v30;
    }
    else
    {
      v28 = 0;
      v6 = 0;
      LOBYTE(v7) = 0;
    }

LABEL_31:
    return (char)v7;
  }
  LOBYTE(v7) = 0;
  return (char)v7;
}

- (int64_t)_findBestType
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  int64_t v9;
  int64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_referenceDateInterval)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_dateNodes;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = -[PGTitleGeneratorDateMatching _matchingTypeForDateNode:](self, "_matchingTypeForDateNode:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        if (v9)
        {
          v10 = v9;
          if (objc_msgSend((id)objc_opt_class(), "type:isBetterThanType:", v9, v6))
            v6 = v10;
        }
      }
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)_matchingTypeForDateNode:(id)a3
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  PGGraph *v8;
  NSSet *v9;
  NSDateInterval *v10;
  void *v11;
  void *v12;
  NSSet *v13;
  PGGraph *v14;
  NSDateInterval *v15;
  int v16;
  id obj;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  NSSet *v22;
  void *v23;
  PGGraph *v24;
  NSDateInterval *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  objc_msgSend((id)objc_opt_class(), "_typeMatchings");
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v5)
  {
    v19 = *(_QWORD *)v32;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v19)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v6);
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v30 = 0;
      v8 = self->_graph;
      v9 = self->_momentNodes;
      v10 = self->_referenceDateInterval;
      objc_msgSend(v20, "collection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "momentNodes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __57__PGTitleGeneratorDateMatching__matchingTypeForDateNode___block_invoke;
      v21[3] = &unk_1E842BAD8;
      v13 = v9;
      v26 = &v27;
      v22 = v13;
      v23 = v7;
      v14 = v8;
      v24 = v14;
      v15 = v10;
      v25 = v15;
      objc_msgSend(v12, "enumerateNodesUsingBlock:", v21);

      v16 = *((unsigned __int8 *)v28 + 24);
      if (*((_BYTE *)v28 + 24))
        v4 = objc_msgSend(v7, "type");

      _Block_object_dispose(&v27, 8);
      if (v16)
        break;
      if (v5 == ++v6)
      {
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  return v4;
}

- (PGGraph)graph
{
  return self->_graph;
}

- (void)setGraph:(id)a3
{
  objc_storeStrong((id *)&self->_graph, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (NSDateInterval)referenceDateInterval
{
  return self->_referenceDateInterval;
}

- (NSSet)dateNodes
{
  return self->_dateNodes;
}

- (void)setDateNodes:(id)a3
{
  objc_storeStrong((id *)&self->_dateNodes, a3);
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (BOOL)isForHighlight
{
  return self->_isForHighlight;
}

- (unint64_t)lineBreakBehavior
{
  return self->_lineBreakBehavior;
}

- (void)setLineBreakBehavior:(unint64_t)a3
{
  self->_lineBreakBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_dateNodes, 0);
  objc_storeStrong((id *)&self->_referenceDateInterval, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_holidayName, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
}

void __57__PGTitleGeneratorDateMatching__matchingTypeForDateNode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_msgSend(*(id *)(a1 + 40), "eventEvaluationBlock");
    v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = ((uint64_t (**)(_QWORD, _QWORD, _QWORD, id))v5)[2](v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v6);

    *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }

}

+ (BOOL)type:(int64_t)a3 isBetterThanType:(int64_t)a4
{
  BOOL v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = 0;
  v22 = *MEMORY[0x1E0C80C00];
  if (a3 && a3 != a4)
  {
    objc_msgSend((id)objc_opt_class(), "_typeMatchings");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v14, "type") == a3)
            v12 = v9 + i;
          if (objc_msgSend(v14, "type") == a4)
            v11 = v9 + i;
        }
        v9 += v8;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }
    else
    {
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v4 = v12 < v11;

  }
  return v4;
}

+ (id)_typeMatchings
{
  if (_typeMatchings_onceToken != -1)
    dispatch_once(&_typeMatchings_onceToken, &__block_literal_global_26657);
  return (id)_typeMatchings_typeMatchingBlocks;
}

void __46__PGTitleGeneratorDateMatching__typeMatchings__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  +[PGTitleGeneratorTypeMatching typeMatchingWithType:eventEvaluationBlock:](PGTitleGeneratorTypeMatching, "typeMatchingWithType:eventEvaluationBlock:", 8, &__block_literal_global_183);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  +[PGTitleGeneratorTypeMatching typeMatchingWithType:eventEvaluationBlock:](PGTitleGeneratorTypeMatching, "typeMatchingWithType:eventEvaluationBlock:", 9, &__block_literal_global_186);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_typeMatchings_typeMatchingBlocks;
  _typeMatchings_typeMatchingBlocks = v2;

}

BOOL __46__PGTitleGeneratorDateMatching__typeMatchings__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL8 v16;
  id v18;
  double v19;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0D4B148], "dateIntervalIntersectsWeekend:", v5))
  {
    v18 = 0;
    v19 = 0.0;
    v7 = (void *)MEMORY[0x1E0D4B148];
    objc_msgSend(v5, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nextWeekendLocalStartDate:interval:options:afterDate:", &v18, &v19, 4, v8);
    v9 = v18;

    objc_msgSend(v9, "timeIntervalSince1970");
    v11 = v10;

    v12 = v11 + v19;
    objc_msgSend(v6, "timestampUTCStart");
    v14 = v13;
    objc_msgSend(v6, "timestampUTCEnd");
    v16 = v14 < v12 && v15 > v11;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __46__PGTitleGeneratorDateMatching__typeMatchings__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v20;
  double v21;

  v5 = a3;
  v6 = a4;
  v20 = 0;
  v21 = 0.0;
  v7 = (void *)MEMORY[0x1E0D4B148];
  objc_msgSend(v5, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "nextWeekendLocalStartDate:interval:options:afterDate:", &v20, &v21, 0, v8);
  v10 = v20;

  if ((_DWORD)v9)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3588]);
    v12 = (void *)objc_msgSend(v11, "initWithStartDate:duration:", v10, v21);
    if (objc_msgSend(v5, "intersectsDateInterval:", v12))
    {
      objc_msgSend(v10, "timeIntervalSince1970");
      v14 = v13;
      v15 = v13 + v21;
      objc_msgSend(v6, "timestampUTCStart");
      v17 = v16;
      objc_msgSend(v6, "timestampUTCEnd");
      v9 = v17 < v15 && v18 > v14;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

@end
