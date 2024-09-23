@implementation PLSearchSuggestionTemplateGenerator

- (PLSearchSuggestionTemplateGenerator)initWithCalendar:(id)a3 todayDate:(id)a4 locale:(id)a5
{
  id v10;
  id v11;
  id v12;
  PLSearchSuggestionTemplateGenerator *v13;
  PLSearchSuggestionTemplateGenerator *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionTemplateGenerator.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("calendar"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestionTemplateGenerator.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("todayDate"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PLSearchSuggestionTemplateGenerator;
  v13 = -[PLSearchSuggestionTemplateGenerator init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_calendar, a3);
    objc_storeStrong((id *)&v14->_todayDate, a4);
    objc_storeStrong((id *)&v14->_locale, a5);
  }

  return v14;
}

- (id)allTemplates
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PLSearchSuggestionTemplateGenerator allPersonTemplates](self, "allPersonTemplates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v14);
  -[PLSearchSuggestionTemplateGenerator allPetTemplates](self, "allPetTemplates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);
  -[PLSearchSuggestionTemplateGenerator allSceneTemplates](self, "allSceneTemplates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);
  -[PLSearchSuggestionTemplateGenerator allHolidayTemplates](self, "allHolidayTemplates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);
  -[PLSearchSuggestionTemplateGenerator allSeasonTemplates](self, "allSeasonTemplates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);
  -[PLSearchSuggestionTemplateGenerator allMiscellaneousTemplates](self, "allMiscellaneousTemplates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v8);
  -[PLSearchSuggestionTemplateGenerator allDateTemplates](self, "allDateTemplates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);
  -[PLSearchSuggestionTemplateGenerator allMeaningTemplates](self, "allMeaningTemplates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v10);
  -[PLSearchSuggestionTemplateGenerator allTripTemplates](self, "allTripTemplates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (id)limitedTemplates
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[PLSearchSuggestionTemplateProvider limitedTemplateKeys](PLSearchSuggestionTemplateProvider, "limitedTemplateKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PLSearchSuggestionTemplateGenerator allTemplates](self, "allTemplates", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "suggestionTemplateKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "containsObject:", v11);

        if (v12)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (id)allPersonTemplates
{
  uint64_t i;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PLSearchSuggestionTemplate *v9;
  void *v10;
  void *v11;
  PLSearchSuggestionTemplate *v12;
  void *v13;
  id v15;

  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i != 10; ++i)
  {
    v4 = off_1E3668B80[i];
    v5 = qword_199B9B738[i];
    v6 = qword_199B9B788[i];
    v7 = qword_199B9B7D8[i];
    v8 = qword_199B9B828[i];
    v9 = [PLSearchSuggestionTemplate alloc];
    -[PLSearchSuggestionTemplateGenerator todayDate](self, "todayDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSearchSuggestionTemplateGenerator locale](self, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PLSearchSuggestionTemplate initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:](v9, "initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:", v4, v7, v8, v5, 9, v6, 0, 0, v10, v11);

    if (v12)
      objc_msgSend(v15, "addObject:", v12);

  }
  v13 = (void *)objc_msgSend(v15, "copy");

  return v13;
}

- (id)allPetTemplates
{
  id v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  PLSearchSuggestionTemplate *v9;
  void *v10;
  void *v11;
  PLSearchSuggestionTemplate *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i != 3; ++i)
  {
    v5 = qword_199B9B8A8[i];
    v6 = qword_199B9B890[i];
    v7 = qword_199B9B878[i];
    v8 = off_1E3668BD0[i];
    v9 = [PLSearchSuggestionTemplate alloc];
    -[PLSearchSuggestionTemplateGenerator todayDate](self, "todayDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSearchSuggestionTemplateGenerator locale](self, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PLSearchSuggestionTemplate initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:](v9, "initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:", v8, v6, v5, v7, 7, 0, 0, 0, v10, v11);

    if (v12)
      objc_msgSend(v3, "addObject:", v12);

  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (id)allSceneTemplates
{
  id v3;
  uint64_t i;
  uint64_t j;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 1; i != 53; ++i)
  {
    for (j = 1; j != 7; ++j)
    {
      -[PLSearchSuggestionTemplateGenerator calendar](self, "calendar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSearchSuggestionTemplateGenerator todayDate](self, "todayDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSearchSuggestionTemplateGenerator locale](self, "locale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLSearchSuggestionSceneUtility generateSceneBasedTemplateWithSceneTemplateType:sceneTemplateSubType:calendar:todayDate:locale:](PLSearchSuggestionSceneUtility, "generateSceneBasedTemplateWithSceneTemplateType:sceneTemplateSubType:calendar:todayDate:locale:", i, j, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v3, "addObject:", v9);

    }
  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (id)allHolidayTemplates
{
  id v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  PLSearchSuggestionTemplate *v9;
  void *v10;
  void *v11;
  PLSearchSuggestionTemplate *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i != 3; ++i)
  {
    v5 = qword_199B9B8F0[i];
    v6 = qword_199B9B8D8[i];
    v7 = qword_199B9B8C0[i];
    v8 = off_1E3668BE8[i];
    v9 = [PLSearchSuggestionTemplate alloc];
    -[PLSearchSuggestionTemplateGenerator todayDate](self, "todayDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSearchSuggestionTemplateGenerator locale](self, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PLSearchSuggestionTemplate initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:](v9, "initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:", v8, 1103, v5, v7, 3, v6, 0, 0, v10, v11);

    if (v12)
      objc_msgSend(v3, "addObject:", v12);

  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (id)allSeasonTemplates
{
  id v3;
  uint64_t i;
  char v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 1; i != 5; ++i)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      v7 = v5;
      -[PLSearchSuggestionTemplateGenerator calendar](self, "calendar");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSearchSuggestionTemplateGenerator todayDate](self, "todayDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSearchSuggestionTemplateGenerator locale](self, "locale");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLSearchSuggestionSeasonUtility generateSeasonBasedTemplateWithSeasonTemplateType:seasonTemplateSubType:calendar:todayDate:locale:](PLSearchSuggestionSeasonUtility, "generateSeasonBasedTemplateWithSeasonTemplateType:seasonTemplateSubType:calendar:todayDate:locale:", i, v6, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        objc_msgSend(v3, "addObject:", v11);

      v5 = 1;
      v6 = 2;
    }
    while ((v7 & 1) == 0);
  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (id)allMiscellaneousTemplates
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)allDateTemplates
{
  id v3;
  uint64_t i;
  void *v5;
  PLSearchSuggestionTemplate *v6;
  void *v7;
  void *v8;
  PLSearchSuggestionTemplate *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 1; i != 10; ++i)
  {
    if (i != 4 && (i & 0x7FFFFFFFFFFFFFFELL) != 2)
    {
      +[PLSearchSuggestionDateUtility templateKeyForDateTemplateType:](PLSearchSuggestionDateUtility, "templateKeyForDateTemplateType:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = [PLSearchSuggestionTemplate alloc];
      -[PLSearchSuggestionTemplateGenerator todayDate](self, "todayDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSearchSuggestionTemplateGenerator locale](self, "locale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PLSearchSuggestionTemplate initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:](v6, "initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:", v5, 0, 0, 4, 4, i, 0, 0, v7, v8);

      if (v9)
        objc_msgSend(v3, "addObject:", v9);

    }
  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (id)allTripTemplates
{
  id v3;
  PLSearchSuggestionTemplate *v4;
  void *v5;
  void *v6;
  PLSearchSuggestionTemplate *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = [PLSearchSuggestionTemplate alloc];
  -[PLSearchSuggestionTemplateGenerator todayDate](self, "todayDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSearchSuggestionTemplateGenerator locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLSearchSuggestionTemplate initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:](v4, "initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:", CFSTR("TRIPS_IN_YEAR"), 1610, 1101, 3, 6, 0, 0, 0, v5, v6);

  if (v7)
    objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)objc_msgSend(v3, "copy");
  return v8;
}

- (id)allMeaningTemplates
{
  id v3;
  uint64_t i;
  uint64_t j;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 1; i != 4; ++i)
  {
    for (j = 1; j != 6; ++j)
    {
      -[PLSearchSuggestionTemplateGenerator calendar](self, "calendar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSearchSuggestionTemplateGenerator todayDate](self, "todayDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSearchSuggestionTemplateGenerator locale](self, "locale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLSearchSuggestionMeaningUtility generateMeaningBasedTemplateWithMeaningTemplateType:meaningTemplateSubType:calendar:todayDate:locale:](PLSearchSuggestionMeaningUtility, "generateMeaningBasedTemplateWithMeaningTemplateType:meaningTemplateSubType:calendar:todayDate:locale:", i, j, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v3, "addObject:", v9);

    }
  }
  v10 = (void *)objc_msgSend(v3, "copy");

  return v10;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)todayDate
{
  return self->_todayDate;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_todayDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
