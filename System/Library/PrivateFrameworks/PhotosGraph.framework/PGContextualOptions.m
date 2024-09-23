@implementation PGContextualOptions

- (PGContextualOptions)initWithGraph:(id)a3 photoLibrary:(id)a4 curationManager:(id)a5 options:(id)a6 loggingConnection:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PGContextualOptions *v17;
  PGBirthdayContextualRule *v18;
  PGHolidayContextualRule *v19;
  PGPublicEventContextualRule *v20;
  PGOnThisDayContextualRule *v21;
  uint64_t v22;
  NSArray *contextualRules;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSDate *localToday;
  void *v29;
  double v30;
  uint64_t v31;
  NSDateComponents *localTodayComponents;
  objc_super v34;
  _QWORD v35[5];

  v35[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v34.receiver = self;
  v34.super_class = (Class)PGContextualOptions;
  v17 = -[PGContextualOptions init](&v34, sel_init);
  if (v17)
  {
    v18 = -[PGBirthdayContextualRule initWithGraph:photoLibrary:curationManager:loggingConnection:]([PGBirthdayContextualRule alloc], "initWithGraph:photoLibrary:curationManager:loggingConnection:", v12, v13, v14, v16);
    v35[0] = v18;
    v19 = -[PGHolidayContextualRule initWithGraph:photoLibrary:loggingConnection:]([PGHolidayContextualRule alloc], "initWithGraph:photoLibrary:loggingConnection:", v12, v13, v16);
    v35[1] = v19;
    v20 = -[PGPublicEventContextualRule initWithGraph:photoLibrary:loggingConnection:]([PGPublicEventContextualRule alloc], "initWithGraph:photoLibrary:loggingConnection:", v12, v13, v16);
    v35[2] = v20;
    v21 = objc_alloc_init(PGOnThisDayContextualRule);
    v35[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
    v22 = objc_claimAutoreleasedReturnValue();
    contextualRules = v17->_contextualRules;
    v17->_contextualRules = (NSArray *)v22;

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D72090]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_storeStrong((id *)&v17->_localToday, v25);
      objc_msgSend(v24, "timeZone");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
      v27 = objc_claimAutoreleasedReturnValue();
      localToday = v17->_localToday;
      v17->_localToday = (NSDate *)v27;

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSinceDate:", v17->_localToday);
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", (uint64_t)v30);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v24, "componentsInTimeZone:fromDate:", v26, v17->_localToday);
    v31 = objc_claimAutoreleasedReturnValue();
    localTodayComponents = v17->_localTodayComponents;
    v17->_localTodayComponents = (NSDateComponents *)v31;

  }
  return v17;
}

- (id)availableContextualRules
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_contextualRules;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "canProvideContextualKeyAssetsWithOptions:", self, (_QWORD)v11))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSDate)localToday
{
  return self->_localToday;
}

- (void)setLocalToday:(id)a3
{
  objc_storeStrong((id *)&self->_localToday, a3);
}

- (NSDateComponents)localTodayComponents
{
  return self->_localTodayComponents;
}

- (void)setLocalTodayComponents:(id)a3
{
  objc_storeStrong((id *)&self->_localTodayComponents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localTodayComponents, 0);
  objc_storeStrong((id *)&self->_localToday, 0);
  objc_storeStrong((id *)&self->_contextualRules, 0);
}

@end
