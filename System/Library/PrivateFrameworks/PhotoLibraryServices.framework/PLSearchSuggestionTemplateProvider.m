@implementation PLSearchSuggestionTemplateProvider

- (PLSearchSuggestionTemplateProvider)initWithLocale:(id)a3
{
  id v5;
  PLSearchSuggestionTemplateProvider *v6;
  PLSearchSuggestionTemplateProvider *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSCalendar *calendar;
  NSDate *v12;
  NSDate *todayDate;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLSearchSuggestionTemplateProvider;
  v6 = -[PLSearchSuggestionTemplateProvider init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locale, a3);
    v8 = (void *)MEMORY[0x1E0C99D48];
    objc_msgSend(v5, "calendarIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "calendarWithIdentifier:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    calendar = v7->_calendar;
    v7->_calendar = (NSCalendar *)v10;

    v12 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    todayDate = v7->_todayDate;
    v7->_todayDate = v12;

  }
  return v7;
}

- (NSArray)allTemplates
{
  NSArray *allTemplates;
  PLSearchSuggestionTemplateGenerator *v4;
  void *v5;
  void *v6;
  void *v7;
  PLSearchSuggestionTemplateGenerator *v8;
  NSArray *v9;
  NSArray *v10;

  allTemplates = self->_allTemplates;
  if (!allTemplates)
  {
    v4 = [PLSearchSuggestionTemplateGenerator alloc];
    -[PLSearchSuggestionTemplateProvider calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSearchSuggestionTemplateProvider todayDate](self, "todayDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSearchSuggestionTemplateProvider locale](self, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PLSearchSuggestionTemplateGenerator initWithCalendar:todayDate:locale:](v4, "initWithCalendar:todayDate:locale:", v5, v6, v7);

    -[PLSearchSuggestionTemplateGenerator allTemplates](v8, "allTemplates");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_allTemplates;
    self->_allTemplates = v9;

    allTemplates = self->_allTemplates;
  }
  return allTemplates;
}

- (NSArray)limitedTemplates
{
  NSArray *limitedTemplates;
  PLSearchSuggestionTemplateGenerator *v4;
  void *v5;
  void *v6;
  void *v7;
  PLSearchSuggestionTemplateGenerator *v8;
  NSArray *v9;
  NSArray *v10;

  limitedTemplates = self->_limitedTemplates;
  if (!limitedTemplates)
  {
    v4 = [PLSearchSuggestionTemplateGenerator alloc];
    -[PLSearchSuggestionTemplateProvider calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSearchSuggestionTemplateProvider todayDate](self, "todayDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSearchSuggestionTemplateProvider locale](self, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PLSearchSuggestionTemplateGenerator initWithCalendar:todayDate:locale:](v4, "initWithCalendar:todayDate:locale:", v5, v6, v7);

    -[PLSearchSuggestionTemplateGenerator limitedTemplates](v8, "limitedTemplates");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_limitedTemplates;
    self->_limitedTemplates = v9;

    limitedTemplates = self->_limitedTemplates;
  }
  return limitedTemplates;
}

- (NSArray)allTemplatesKeys
{
  NSArray *allTemplatesKeys;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  allTemplatesKeys = self->_allTemplatesKeys;
  if (!allTemplatesKeys)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[PLSearchSuggestionTemplateProvider allTemplates](self, "allTemplates", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "suggestionTemplateKey");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    v11 = (NSArray *)objc_msgSend(v4, "copy");
    v12 = self->_allTemplatesKeys;
    self->_allTemplatesKeys = v11;

    allTemplatesKeys = self->_allTemplatesKeys;
  }
  return allTemplatesKeys;
}

- (NSArray)dateOnlyTemplates
{
  NSArray *dateOnlyTemplates;
  NSArray *v4;
  NSArray *v5;

  dateOnlyTemplates = self->_dateOnlyTemplates;
  if (!dateOnlyTemplates)
  {
    -[PLSearchSuggestionTemplateProvider _dateOnlyTemplates](self, "_dateOnlyTemplates");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dateOnlyTemplates;
    self->_dateOnlyTemplates = v4;

    dateOnlyTemplates = self->_dateOnlyTemplates;
  }
  return dateOnlyTemplates;
}

- (NSIndexSet)nonIdentifierBasedSupportedSearchEntityTypes
{
  NSIndexSet *nonIdentifierBasedSupportedSearchEntityTypes;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  NSIndexSet *v13;
  NSIndexSet *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  nonIdentifierBasedSupportedSearchEntityTypes = self->_nonIdentifierBasedSupportedSearchEntityTypes;
  if (!nonIdentifierBasedSupportedSearchEntityTypes)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[PLSearchSuggestionTemplateProvider allTemplates](self, "allTemplates", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "length");

          if (!v12)
          {
            if (objc_msgSend(v10, "firstIndexCategory"))
              objc_msgSend(v4, "addIndex:", objc_msgSend(v10, "firstIndexCategory"));
            if (objc_msgSend(v10, "secondIndexCategory"))
              objc_msgSend(v4, "addIndex:", objc_msgSend(v10, "secondIndexCategory"));
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v13 = (NSIndexSet *)objc_msgSend(v4, "copy");
    v14 = self->_nonIdentifierBasedSupportedSearchEntityTypes;
    self->_nonIdentifierBasedSupportedSearchEntityTypes = v13;

    nonIdentifierBasedSupportedSearchEntityTypes = self->_nonIdentifierBasedSupportedSearchEntityTypes;
  }
  return nonIdentifierBasedSupportedSearchEntityTypes;
}

- (NSArray)supportedIdentifiers
{
  NSArray *supportedIdentifiers;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;

  supportedIdentifiers = self->_supportedIdentifiers;
  if (!supportedIdentifiers)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[PLSearchSuggestionSceneUtility supportedSceneIdentifiers](PLSearchSuggestionSceneUtility, "supportedSceneIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

    +[PLSearchSuggestionMeaningUtility supportedMeaningIdentifiers](PLSearchSuggestionMeaningUtility, "supportedMeaningIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

    +[PLSearchSuggestionSeasonUtility supportedSeasonIdentifiers](PLSearchSuggestionSeasonUtility, "supportedSeasonIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v7);

    v8 = (NSArray *)objc_msgSend(v4, "copy");
    v9 = self->_supportedIdentifiers;
    self->_supportedIdentifiers = v8;

    supportedIdentifiers = self->_supportedIdentifiers;
  }
  return supportedIdentifiers;
}

- (NSArray)allDateFilters
{
  NSArray *allDateFilters;
  NSArray *v4;
  NSArray *v5;

  allDateFilters = self->_allDateFilters;
  if (!allDateFilters)
  {
    -[PLSearchSuggestionTemplateProvider _allDateFilters](self, "_allDateFilters");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_allDateFilters;
    self->_allDateFilters = v4;

    allDateFilters = self->_allDateFilters;
  }
  return allDateFilters;
}

- (id)templatesForSearchIndexCategory:(unint64_t)a3 secondIndexCategory:(unint64_t)a4 limitedTemplates:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  _BOOL4 v20;
  _BOOL4 v21;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionTemplateProvider.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstIndexCategory != PLSearchIndexCategoryNone"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionTemplateProvider.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondIndexCategory != PLSearchIndexCategoryNone"));

LABEL_3:
  if (objc_msgSend(v9, "count"))
  {
    v10 = v9;
  }
  else
  {
    -[PLSearchSuggestionTemplateProvider allTemplates](self, "allTemplates");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "templateType");
        if ((~v19 & 3) != 0)
        {
          if ((v19 & 1) != 0
            && (objc_msgSend(v18, "firstIndexCategory") == a3 || objc_msgSend(v18, "firstIndexCategory") == a4))
          {
            goto LABEL_23;
          }
        }
        else
        {
          v20 = objc_msgSend(v18, "firstIndexCategory") == a3 && objc_msgSend(v18, "secondIndexCategory") == a4;
          v21 = objc_msgSend(v18, "secondIndexCategory") == a3 && objc_msgSend(v18, "firstIndexCategory") == a4;
          if (v20 || v21)
          {
LABEL_23:
            objc_msgSend(v12, "addObject:", v18);
            continue;
          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  v22 = (void *)objc_msgSend(v12, "copy");
  return v22;
}

- (id)_allDateFilters
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PLSearchSuggestionDateUtility allTemplateDateTypes](PLSearchSuggestionDateUtility, "allTemplateDateTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__PLSearchSuggestionTemplateProvider__allDateFilters__block_invoke;
  v9[3] = &unk_1E3675358;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (id)dateFilterForSearchSuggestionTemplateDateType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  PLInitialSuggestionDateFilter *v8;

  -[PLSearchSuggestionTemplateProvider calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSearchSuggestionTemplateProvider todayDate](self, "todayDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSearchSuggestionDateUtility dateFilterForSearchSuggestionTemplateDateType:calendar:relativeDate:](PLSearchSuggestionDateUtility, "dateFilterForSearchSuggestionTemplateDateType:calendar:relativeDate:", a3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[PLInitialSuggestionDateFilter initWithTemplateDateType:psiDateFilter:]([PLInitialSuggestionDateFilter alloc], "initWithTemplateDateType:psiDateFilter:", a3, v7);
  else
    v8 = 0;

  return v8;
}

- (id)_dateOnlyTemplates
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PLSearchSuggestionTemplateProvider allTemplates](self, "allTemplates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isDateOnlyTemplate", (_QWORD)v12))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (void)setAllTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_allTemplates, a3);
}

- (void)setLimitedTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_limitedTemplates, a3);
}

- (void)setAllTemplatesKeys:(id)a3
{
  objc_storeStrong((id *)&self->_allTemplatesKeys, a3);
}

- (void)setDateOnlyTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_dateOnlyTemplates, a3);
}

- (void)setNonIdentifierBasedSupportedSearchEntityTypes:(id)a3
{
  objc_storeStrong((id *)&self->_nonIdentifierBasedSupportedSearchEntityTypes, a3);
}

- (void)setSupportedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_supportedIdentifiers, a3);
}

- (void)setAllDateFilters:(id)a3
{
  objc_storeStrong((id *)&self->_allDateFilters, a3);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)todayDate
{
  return self->_todayDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todayDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_allDateFilters, 0);
  objc_storeStrong((id *)&self->_supportedIdentifiers, 0);
  objc_storeStrong((id *)&self->_nonIdentifierBasedSupportedSearchEntityTypes, 0);
  objc_storeStrong((id *)&self->_dateOnlyTemplates, 0);
  objc_storeStrong((id *)&self->_allTemplatesKeys, 0);
  objc_storeStrong((id *)&self->_limitedTemplates, 0);
  objc_storeStrong((id *)&self->_allTemplates, 0);
}

void __53__PLSearchSuggestionTemplateProvider__allDateFilters__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dateFilterForSearchSuggestionTemplateDateType:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

+ (id)limitedTemplateKeys
{
  return &unk_1E37639C8;
}

+ (id)templateForRankedGroup:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  PLSearchSuggestionTemplate *v11;
  void *v12;
  PLSearchSuggestionTemplate *v13;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "searchIndexingCategory");
  if (objc_msgSend(v5, "isMePerson"))
    v8 = 17;
  else
    v8 = 1;
  if (v7 > 1329)
  {
    if (v7 <= 1599)
    {
      if (v7 == 1330)
      {
        v9 = 0;
        v10 = 7;
        goto LABEL_26;
      }
      if (v7 != 1500)
        goto LABEL_25;
    }
    else
    {
      if (v7 == 1600)
      {
        objc_msgSend(v5, "lookupIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 |= 8uLL;
        v10 = 5;
        goto LABEL_26;
      }
      if (v7 == 1610)
      {
        v9 = 0;
        v10 = 6;
        goto LABEL_26;
      }
      if (v7 != 2600)
        goto LABEL_25;
    }
    objc_msgSend(v5, "lookupIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 |= 8uLL;
    v10 = 8;
    goto LABEL_26;
  }
  if (v7 > 1103)
  {
    if (v7 == 1104)
    {
      objc_msgSend(v5, "lookupIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 |= 8uLL;
      v10 = 2;
      goto LABEL_26;
    }
    if (v7 == 1300)
    {
      v9 = 0;
      v10 = 9;
      goto LABEL_26;
    }
LABEL_25:
    v9 = 0;
    v10 = 1;
    goto LABEL_26;
  }
  if ((unint64_t)(v7 - 1100) >= 2)
  {
    if (v7 == 1103)
    {
      v9 = 0;
      v10 = 3;
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  v9 = 0;
  v10 = 4;
LABEL_26:
  v11 = [PLSearchSuggestionTemplate alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PLSearchSuggestionTemplate initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:](v11, "initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:", 0, v7, 0, v8, v10, 0, 1, v9, v12, v6);

  return v13;
}

+ (unint64_t)localeSupportTypeForTemplateWithKey:(id)a3 locale:(id)a4
{
  return 3;
}

@end
