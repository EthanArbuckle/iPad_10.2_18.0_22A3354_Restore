@implementation PLSearchSuggestionMeaningUtility

+ (id)supportedMeaningIdentifiers
{
  id v2;
  uint64_t i;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 1; i != 4; ++i)
  {
    +[PLSearchSuggestionMeaningUtility meaningIdentifierForMeaningTemplateType:](PLSearchSuggestionMeaningUtility, "meaningIdentifierForMeaningTemplateType:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v2, "addObject:", v4);

  }
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

+ (id)meaningIdentifierForMeaningTemplateType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 - 1 > 2)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%lu"), CFSTR("meaning"), a3 + 35, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)generateMeaningBasedTemplateWithMeaningTemplateType:(unint64_t)a3 meaningTemplateSubType:(unint64_t)a4 calendar:(id)a5 todayDate:(id)a6 locale:(id)a7
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  PLSearchSuggestionTemplate *v20;
  NSObject *v21;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a7;
  +[PLSearchSuggestionMeaningUtility _templateKeyPrefixForMeaningTemplateType:](PLSearchSuggestionMeaningUtility, "_templateKeyPrefixForMeaningTemplateType:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = a4 - 1;
  if (a4 - 1 > 4)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
  }
  else
  {
    v14 = qword_199B9F5B8[v13];
    v15 = qword_199B9F5E0[v13];
    v16 = qword_199B9F608[v13];
    v17 = (uint64_t)*(&off_1E366EB30 + v13);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v12, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSearchSuggestionMeaningUtility meaningIdentifierForMeaningTemplateType:](PLSearchSuggestionMeaningUtility, "meaningIdentifierForMeaningTemplateType:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length") && objc_msgSend(v12, "length") && objc_msgSend(v19, "length"))
  {
    v20 = -[PLSearchSuggestionTemplate initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:]([PLSearchSuggestionTemplate alloc], "initWithSuggestionTemplateKey:firstIndexCategory:secondIndexCategory:templateType:templateContentType:templateDateType:styleType:identifier:todayDate:locale:", v18, 1600, v15, v16, 5, v14, 0, v19, v10, v11);
  }
  else
  {
    PLSearchBackendInitialSuggestionsGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v12;
      v25 = 2048;
      v26 = a3;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Unable to generate scene template for key: %@, scene template type: %tu", buf, 0x16u);
    }

    v20 = 0;
  }

  return v20;
}

+ (id)_templateKeyPrefixForMeaningTemplateType:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return *(&off_1E366EB58 + a3 - 1);
}

@end
