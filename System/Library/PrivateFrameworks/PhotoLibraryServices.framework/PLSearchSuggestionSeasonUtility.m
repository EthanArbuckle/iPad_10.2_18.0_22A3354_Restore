@implementation PLSearchSuggestionSeasonUtility

+ (id)supportedSeasonIdentifiers
{
  id v2;
  uint64_t i;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 1; i != 5; ++i)
  {
    +[PLSearchSuggestionSeasonUtility seasonIdentifierForSeasonTemplateType:](PLSearchSuggestionSeasonUtility, "seasonIdentifierForSeasonTemplateType:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v2, "addObject:", v4);

  }
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

+ (id)seasonIdentifierForSeasonTemplateType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 - 1 > 3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%lu"), CFSTR("season"), qword_199B9BB60[a3 - 1], v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)generateSeasonBasedTemplateWithSeasonTemplateType:(unint64_t)a3 seasonTemplateSubType:(unint64_t)a4 calendar:(id)a5 todayDate:(id)a6 locale:(id)a7
{
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  PLSearchSuggestionTemplate *v21;
  NSObject *v22;
  uint8_t buf[4];
  __CFString *v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (a4 == 2)
  {
    objc_msgSend(a1, "_templateKeySubstringForSeasonTemplateType:", a3);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = 1104;
    v17 = 1101;
    v15 = CFSTR("_YEAR");
  }
  else if (a4 == 1)
  {
    objc_msgSend(a1, "_templateKeySubstringForSeasonTemplateType:", a3);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = 5;
    v17 = 1104;
    v18 = CFSTR("CITY_IN_THE_");
  }
  else
  {
    v17 = 0;
    v16 = 0;
    v15 = 0;
    v18 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "seasonIdentifierForSeasonTemplateType:", a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v18, "length") && -[__CFString length](v15, "length") && objc_msgSend(v20, "length"))
  {
    v21 = -[PLSearchSuggestionTemplate initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:]([PLSearchSuggestionTemplate alloc], "initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:", v19, v16, v17, 11, 2, 0, 0, v20, v13, v14);
  }
  else
  {
    PLSearchBackendInitialSuggestionsGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      v26 = 2048;
      v27 = a3;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Unable to generate scene template for key: %@, scene template type: %tu", buf, 0x16u);
    }

    v21 = 0;
  }

  return v21;
}

+ (id)_templateKeySubstringForSeasonTemplateType:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 0;
  else
    return off_1E366AB10[a3 - 1];
}

@end
