@implementation STSFeedbackReporter

+ (STSFeedbackReporter)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_5);
  return (STSFeedbackReporter *)(id)sharedInstance_sharedInstance;
}

void __37__STSFeedbackReporter_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (void)searchViewDidAppearWithEvent:(unint64_t)a3
{
  void *v4;
  uint8_t v5[16];

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84FA0]), "initWithEvent:", a3);
  -[PARSession reportFeedback:queryId:](self->_parsecSession, "reportFeedback:queryId:", v4, +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Feedback: Seassion started", v5, 2u);
  }

}

- (void)didLoadCategoryResults:(id)a3 recents:(id)a4 queryId:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  objc_msgSend(v7, "sts_map:", &__block_literal_global_5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sts_map:", &__block_literal_global_7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v10 = objc_alloc_init(MEMORY[0x24BE84F68]);
    objc_msgSend(v10, "setBundleIdentifier:", CFSTR("com.apple.hashtagimages.categorylist.recents"));
    objc_msgSend(v10, "setResults:", v7);
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v16, "count"))
  {
    v11 = objc_alloc_init(MEMORY[0x24BE84F68]);
    objc_msgSend(v11, "setBundleIdentifier:", CFSTR("com.apple.hashtagimages.categorylist.categories"));
    objc_msgSend(v11, "setResults:", v16);
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v8, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84FC8]), "initWithResults:section:localSectionPosition:personalizationScore:", v8, v10, objc_msgSend(v12, "count"), 0.0);
    objc_msgSend(v12, "addObject:", v13);

  }
  if (objc_msgSend(v9, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84FC8]), "initWithResults:section:localSectionPosition:personalizationScore:", v9, v11, objc_msgSend(v12, "count"), 0.0);
    objc_msgSend(v12, "addObject:", v14);

  }
  if (objc_msgSend(v12, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84F40]), "initWithSections:blendingDuration:", v12, 0.0);
    -[PARSession reportFeedback:queryId:](self->_parsecSession, "reportFeedback:queryId:", v15, +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));

  }
}

id __62__STSFeedbackReporter_didLoadCategoryResults_recents_queryId___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x24BE84F60];
  v5 = a2;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithResult:hiddenResults:duplicateResults:localResultPosition:", v5, 0, 0, a3);

  return v6;
}

id __62__STSFeedbackReporter_didLoadCategoryResults_recents_queryId___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x24BE84F60];
  v5 = a2;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithResult:hiddenResults:duplicateResults:localResultPosition:", v5, 0, 0, a3);

  return v6;
}

- (void)didLoadResults:(id)a3 indexPaths:(id)a4 queryId:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __57__STSFeedbackReporter_didLoadResults_indexPaths_queryId___block_invoke;
  v18[3] = &unk_24E7468B8;
  v19 = v7;
  v8 = v7;
  v9 = a3;
  objc_msgSend(v9, "sts_map:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BE84F68]);
  objc_msgSend(v9, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sectionBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBundleIdentifier:", v13);

  objc_msgSend(v11, "setResults:", v9);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84FC8]), "initWithResults:section:localSectionPosition:personalizationScore:", v10, v11, 0, 0.0);
  v15 = objc_alloc(MEMORY[0x24BE84F40]);
  v20[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithSections:blendingDuration:", v16, 0.0);

  -[PARSession reportFeedback:queryId:](self->_parsecSession, "reportFeedback:queryId:", v17, +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
}

id __57__STSFeedbackReporter_didLoadResults_indexPaths_queryId___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x24BE84F60];
  v6 = a2;
  v7 = [v5 alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithResult:hiddenResults:duplicateResults:localResultPosition:", v6, 0, 0, objc_msgSend(v8, "row"));

  return v9;
}

- (void)didShowResults:(id)a3 scrolling:(BOOL)a4
{
  uint64_t v5;
  objc_class *v6;
  id v7;
  id v8;

  if (a4)
    v5 = 2;
  else
    v5 = 1;
  v6 = (objc_class *)MEMORY[0x24BE85058];
  v7 = a3;
  v8 = (id)objc_msgSend([v6 alloc], "initWithResults:triggerEvent:", v7, v5);

  -[PARSession reportFeedback:queryId:](self->_parsecSession, "reportFeedback:queryId:", v8, +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
}

- (void)didShowResults:(id)a3 trigger:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;

  v6 = (objc_class *)MEMORY[0x24BE85058];
  v7 = a3;
  v8 = (id)objc_msgSend([v6 alloc], "initWithResults:triggerEvent:", v7, a4);

  -[PARSession reportFeedback:queryId:](self->_parsecSession, "reportFeedback:queryId:", v8, +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
}

- (void)didPreviewResult:(id)a3 peek:(BOOL)a4
{
  _BOOL4 v4;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x24BE84F50];
  v7 = a3;
  v8 = [v6 alloc];
  if (v4)
    v9 = 5;
  else
    v9 = 6;
  v10 = (id)objc_msgSend(v8, "initWithResult:triggerEvent:destination:", v7, v9, 3);

  -[PARSession reportFeedback:queryId:](self->_parsecSession, "reportFeedback:queryId:", v10, +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
}

- (void)didPreviewResultLongPress:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BE84F50];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithResult:triggerEvent:destination:", v5, 7, 3);

  -[PARSession reportFeedback:queryId:](self->_parsecSession, "reportFeedback:queryId:", v6, +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
}

- (void)didShowProactiveSuggestions:(id)a3 conversationId:(id)a4
{
  __CFString *v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a4;
  v7 = a3;
  -[STSFeedbackReporter didShowQuerySuggestions:queryId:](self, "didShowQuerySuggestions:queryId:", v7, 0);
  v8 = &stru_24E7469D8;
  if (v6)
    v8 = v6;
  v9 = v8;

  objc_msgSend(v7, "sts_map:", &__block_literal_global_22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = CFSTR("name");
  v20[1] = CFSTR("predictions");
  v11 = (void *)MEMORY[0x24BDBD1A8];
  if (v10)
    v11 = v10;
  v21[0] = CFSTR("com.apple.suggestd.predictionsshowed");
  v21[1] = v11;
  v20[2] = CFSTR("conversationId");
  v21[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84DF8]), "initWithType:jsonFeedback:", 0, v12);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v14 = -[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = 136315394;
    v17 = v14;
    v18 = 2080;
    v19 = objc_msgSend(v15, "UTF8String");
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Feedback: Showed predictions(%s): %s", (uint8_t *)&v16, 0x16u);

  }
}

uint64_t __66__STSFeedbackReporter_didShowProactiveSuggestions_conversationId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)didShowQuerySuggestions:(id)a3 queryId:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "sts_map:", &__block_literal_global_36);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sts_map:", &__block_literal_global_49);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BE84F68]);
  objc_msgSend(v8, "setBundleIdentifier:", CFSTR("com.apple.hashtagimages.querysuggestions"));
  objc_msgSend(v8, "setResults:", v6);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84FC8]), "initWithResults:section:localSectionPosition:personalizationScore:", v7, v8, 0, 0.0);
  v10 = objc_alloc(MEMORY[0x24BE84F40]);
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithSections:blendingDuration:", v11, 0.0);

  -[PARSession reportFeedback:queryId:](self->_parsecSession, "reportFeedback:queryId:", v12, a4);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE85058]), "initWithResults:triggerEvent:", v6, 1);
  -[PARSession reportFeedback:queryId:](self->_parsecSession, "reportFeedback:queryId:", v13, +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));

}

id __55__STSFeedbackReporter_didShowQuerySuggestions_queryId___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = a2;
  objc_msgSend(v2, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BE84F90]);
  v8 = (void *)MEMORY[0x24BE85018];
  objc_msgSend(v2, "suggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v10);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("msgs-sug:%@"), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v11);

  objc_msgSend(v2, "fbr");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFbr:", v12);
  objc_msgSend(v7, "setSectionBundleIdentifier:", CFSTR("com.apple.hashtagimages.querysuggestions"));
  objc_msgSend(v7, "setResultBundleId:", CFSTR("com.apple.hashtagimages.querysuggestions.suggestion"));
  objc_msgSend(v7, "setType:", 1);

  return v7;
}

id __55__STSFeedbackReporter_didShowQuerySuggestions_queryId___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x24BE84F60];
  v5 = a2;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithResult:hiddenResults:duplicateResults:localResultPosition:", v5, 0, 0, a3);

  return v6;
}

- (void)didShowProactiveCategories:(id)a3 conversationId:(id)a4
{
  __CFString *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v5 = (__CFString *)a4;
  objc_msgSend(a3, "sts_map:", &__block_literal_global_50);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v18[0] = CFSTR("name");
  v18[1] = CFSTR("categories");
  v8 = MEMORY[0x24BDBD1A8];
  if (v6)
    v8 = v6;
  v19[0] = CFSTR("com.apple.suggestd.categoriesshowed");
  v19[1] = v8;
  v18[2] = CFSTR("conversationId");
  if (v5)
    v9 = v5;
  else
    v9 = &stru_24E7469D8;
  v19[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84DF8]), "initWithType:jsonFeedback:", 0, v10);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v12 = -[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = 136315394;
    v15 = v12;
    v16 = 2080;
    v17 = objc_msgSend(v13, "UTF8String");
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Feedback: Showed categories(%s): %s", (uint8_t *)&v14, 0x16u);

  }
}

__CFString *__65__STSFeedbackReporter_didShowProactiveCategories_conversationId___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a2, "prediction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("unknown");
  v5 = v3;

  return v5;
}

- (void)didSearchWithCustomQuery:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Feedback: Search custom query: %s", (uint8_t *)&v5, 0xCu);
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84FF0]), "initWithInput:triggerEvent:", v3, 2);
  ADClientAddValueForScalarKey();

}

- (void)didSearchWithSuggestedQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE85008]), "initWithSuggestion:", v4);
  objc_msgSend(v4, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("_"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BE84F90]);
  v11 = (void *)MEMORY[0x24BE85018];
  objc_msgSend(v4, "suggestion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v13);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("msgs-sug:%@"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIdentifier:", v14);

  objc_msgSend(v4, "fbr");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFbr:", v15);

  objc_msgSend(v10, "setSectionBundleIdentifier:", CFSTR("com.apple.hashtagimages.querysuggestions"));
  objc_msgSend(v10, "setResultBundleId:", CFSTR("com.apple.hashtagimages.querysuggestions.suggestion"));
  objc_msgSend(v10, "setType:", 1);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84F50]), "initWithResult:triggerEvent:destination:", v10, 2, 0);
  objc_msgSend(v16, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  -[PARSession reportEvent:](self->_parsecSession, "reportEvent:", v16);
  ADClientAddValueForScalarKey();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "suggestion");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315138;
    v19 = objc_msgSend(v17, "UTF8String");
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Feedback: Search suggestion %s", buf, 0xCu);

  }
}

- (void)didEngageResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84F50]), "initWithResult:triggerEvent:destination:", v4, 2, 4);
  objc_msgSend(v5, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  -[PARSession reportEvent:](self->_parsecSession, "reportEvent:", v5);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = 136315138;
    v9 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Feedback: Engaged result %s", (uint8_t *)&v8, 0xCu);

  }
}

- (void)didEngageCategoryResult:(id)a3 suggestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84F50]), "initWithResult:triggerEvent:destination:", v6, 2, 0);
  objc_msgSend(v8, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  -[PARSession reportEvent:](self->_parsecSession, "reportEvent:", v8);
  objc_msgSend(v7, "prediction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "prediction");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "text");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = 136315138;
    v14 = objc_msgSend(v12, "UTF8String");
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Feedback: Engaged category %s", (uint8_t *)&v13, 0xCu);

  }
}

- (void)didEngageProviderLogo
{
  id v3;
  id v4;
  void *v5;
  uint8_t v6[16];

  v3 = objc_alloc_init(MEMORY[0x24BE84F38]);
  objc_msgSend(v3, "setLabel:", CFSTR("non_parsec_result"));
  v4 = objc_alloc_init(MEMORY[0x24BE84F90]);
  objc_msgSend(v4, "setIdentifier:", CFSTR("com.apple.other:search_web"));
  objc_msgSend(v4, "setPunchout:", v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84F50]), "initWithResult:triggerEvent:destination:", v4, 2, 2);
  objc_msgSend(v5, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  -[PARSession reportEvent:](self->_parsecSession, "reportEvent:", v5);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Feedback: Engaged provider logo", v6, 2u);
  }

}

- (void)searchBarDidCancel
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE84FA8]), "initWithEvent:", 4);
  objc_msgSend(v3, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  -[PARSession searchViewDidDisappear:](self->_parsecSession, "searchViewDidDisappear:", v3);

}

- (void)searchViewDidDisappear
{
  void *v3;
  uint8_t v4[16];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84FA8]), "initWithEvent:", 11);
  objc_msgSend(v3, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  -[PARSession searchViewDidDisappear:](self->_parsecSession, "searchViewDidDisappear:", v3);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Feedback: Session ended", v4, 2u);
  }

}

- (id)didStartNetworkRequest:(id)a3 query:(id)a4 queryId:(unint64_t)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (objc_class *)MEMORY[0x24BE84FE8];
  v8 = a4;
  v9 = a3;
  v10 = [v7 alloc];
  objc_msgSend(v9, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v10, "initWithInput:url:headers:triggerEvent:endpoint:", v8, v11, MEMORY[0x24BDBD1B8], 15, 7);
  objc_msgSend(v12, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  -[PARSession didStartSearch:](self->_parsecSession, "didStartSearch:", v12);
  return v12;
}

- (void)didEndNetworkRequest:(id)a3 infoDict:(id)a4
{
  PARSession *parsecSession;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  parsecSession = self->_parsecSession;
  v7 = a3;
  -[PARSession bag](parsecSession, "bag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "imageTimingFeedbackEnabled"))
  {
    objc_msgSend(v15, "objectForKey:", CFSTR("STSImageDownloadOperationTimingData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  v10 = objc_alloc(MEMORY[0x24BE84E28]);
  objc_msgSend(v15, "objectForKey:", CFSTR("STSImageDownloadOperationSize"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (int)objc_msgSend(v11, "intValue");
  objc_msgSend(v15, "objectForKey:", CFSTR("STSImageDownloadOperationStatusCode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithStartSearch:responseSize:statusCode:networkTimingData:", v7, v12, (int)objc_msgSend(v13, "intValue"), v9);

  objc_msgSend(v14, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  -[PARSession didEndSearch:](self->_parsecSession, "didEndSearch:", v14);

}

- (void)didClearRecents
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BE84F68]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84FB8]), "initWithSection:triggerEvent:", v4, 4);
  objc_msgSend(v3, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  -[PARSession reportEvent:](self->_parsecSession, "reportEvent:", v3);

}

- (void)didClearSearchBarInput
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE84DB0]), "initWithEvent:", 1);
  objc_msgSend(v3, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  -[PARSession reportEvent:](self->_parsecSession, "reportEvent:", v3);

}

- (void)didGoToSearch:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BE84E10];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithInput:endpoint:", v5, 6);

  objc_msgSend(v6, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  -[PARSession reportEvent:](self->_parsecSession, "reportEvent:", v6);

}

- (void)didReportConcern:(id)a3 punchout:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x24BE85048];
  v7 = a4;
  v8 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithSelection:result:cardSection:resultSections:uploadedDataIdentifier:userReportRequestType:", v7, v8, 0, 0, 0, 2);

  objc_msgSend(v9, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  -[PARSession reportEvent:](self->_parsecSession, "reportEvent:", v9);

}

- (PARSession)parsecSession
{
  return self->_parsecSession;
}

- (void)setParsecSession:(id)a3
{
  objc_storeStrong((id *)&self->_parsecSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsecSession, 0);
}

@end
