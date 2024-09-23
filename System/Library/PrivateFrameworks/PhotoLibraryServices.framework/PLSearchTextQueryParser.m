@implementation PLSearchTextQueryParser

+ (void)enumerateDatesForString:(id)a3 resultsHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  id v16;
  _QWORD v17[3];
  char v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v8 = (void *)getQPQueryParserManagerClass_softClass;
  v23 = getQPQueryParserManagerClass_softClass;
  v9 = MEMORY[0x1E0C809B0];
  if (!getQPQueryParserManagerClass_softClass)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __getQPQueryParserManagerClass_block_invoke;
    v19[3] = &unk_1E3677580;
    v19[4] = &v20;
    __getQPQueryParserManagerClass_block_invoke((uint64_t)v19);
    v8 = (void *)v21[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v10, "photosParserManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __81__PLSearchTextQueryParser_NLDateParsing__enumerateDatesForString_resultsHandler___block_invoke;
  v13[3] = &unk_1E3664720;
  v15 = v17;
  v16 = a1;
  v12 = v7;
  v14 = v12;
  objc_msgSend(v11, "enumerateParseResultsForString:options:withBlock:", v6, 0, v13);

  _Block_object_dispose(v17, 8);
}

+ (id)_dateFilterWithQPDateInfo:(id)a3
{
  id v3;
  _QWORD *v4;
  void *ParserLibrary;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PSIDateFilter *v21;
  _QWORD *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  PSIDateFilter *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  PSIDateFilter *v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  id result;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;

  v3 = a3;
  if (!v3)
  {
    v21 = 0;
LABEL_63:

    return v21;
  }
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v4 = (_QWORD *)getQPParseAttributeValueDateComponentsKeySymbolLoc_ptr;
  v49 = getQPParseAttributeValueDateComponentsKeySymbolLoc_ptr;
  if (!getQPParseAttributeValueDateComponentsKeySymbolLoc_ptr)
  {
    ParserLibrary = QueryParserLibrary();
    v4 = dlsym(ParserLibrary, "QPParseAttributeValueDateComponentsKey");
    v47[3] = (uint64_t)v4;
    getQPParseAttributeValueDateComponentsKeySymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v46, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getQPParseAttributeValueDateComponentsKey(void)");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("PLSearchTextQueryParser+NLDateParsing.m"), 27, CFSTR("%s"), dlerror());
    goto LABEL_70;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v22 = (_QWORD *)getQPParseAttributeValueDateStartComponentsKeySymbolLoc_ptr;
    v49 = getQPParseAttributeValueDateStartComponentsKeySymbolLoc_ptr;
    if (!getQPParseAttributeValueDateStartComponentsKeySymbolLoc_ptr)
    {
      v23 = QueryParserLibrary();
      v22 = dlsym(v23, "QPParseAttributeValueDateStartComponentsKey");
      v47[3] = (uint64_t)v22;
      getQPParseAttributeValueDateStartComponentsKeySymbolLoc_ptr = (uint64_t)v22;
    }
    _Block_object_dispose(&v46, 8);
    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getQPParseAttributeValueDateStartComponentsKey(void)");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("PLSearchTextQueryParser+NLDateParsing.m"), 30, CFSTR("%s"), dlerror());
      goto LABEL_70;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", *v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v24 = (_QWORD *)getQPParseAttributeValueDateEndComponentsKeySymbolLoc_ptr;
    v49 = getQPParseAttributeValueDateEndComponentsKeySymbolLoc_ptr;
    if (!getQPParseAttributeValueDateEndComponentsKeySymbolLoc_ptr)
    {
      v25 = QueryParserLibrary();
      v24 = dlsym(v25, "QPParseAttributeValueDateEndComponentsKey");
      v47[3] = (uint64_t)v24;
      getQPParseAttributeValueDateEndComponentsKeySymbolLoc_ptr = (uint64_t)v24;
    }
    _Block_object_dispose(&v46, 8);
    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getQPParseAttributeValueDateEndComponentsKey(void)");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("PLSearchTextQueryParser+NLDateParsing.m"), 31, CFSTR("%s"), dlerror());
      goto LABEL_70;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", *v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_54;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v8 = (_QWORD *)getQPParseAttributeValueDateTypeKeySymbolLoc_ptr;
  v49 = getQPParseAttributeValueDateTypeKeySymbolLoc_ptr;
  if (!getQPParseAttributeValueDateTypeKeySymbolLoc_ptr)
  {
    v9 = QueryParserLibrary();
    v8 = dlsym(v9, "QPParseAttributeValueDateTypeKey");
    v47[3] = (uint64_t)v8;
    getQPParseAttributeValueDateTypeKeySymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v46, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getQPParseAttributeValueDateTypeKey(void)");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("PLSearchTextQueryParser+NLDateParsing.m"), 28, CFSTR("%s"), dlerror());
    goto LABEL_70;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  v12 = 0;
  if (v11 <= 47)
  {
    if (v11 == 12)
    {
      objc_msgSend(v7, "dateFromComponents:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, 6, v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        goto LABEL_37;
      goto LABEL_32;
    }
    v13 = 0;
    v14 = 0;
    v15 = 0;
    if (v11 != 47)
      goto LABEL_39;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v7, "component:fromDate:", 512, v16);

    objc_msgSend(v6, "setWeekday:", v17);
    objc_msgSend(v7, "dateFromComponents:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, -1, v18, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v7;
    v20 = 1;
    goto LABEL_35;
  }
  if (v11 == 48)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v7, "component:fromDate:", 16, v29);

    objc_msgSend(v6, "setDay:", v30);
    objc_msgSend(v7, "dateFromComponents:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, -3, v18, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v7;
    v20 = 3;
LABEL_35:
    objc_msgSend(v19, "dateByAddingUnit:value:toDate:options:", 16, v20, v18, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  v13 = 0;
  v14 = 0;
  v15 = 0;
  if (v11 != 49)
    goto LABEL_39;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 24, v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMonth:", objc_msgSend(v18, "month"));
  objc_msgSend(v6, "setDay:", objc_msgSend(v18, "day"));
  objc_msgSend(v7, "dateFromComponents:", v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, -3, v28, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, 3, v28, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_36:
  if (v12)
  {
LABEL_37:
    objc_msgSend(v7, "components:fromDate:", 28, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_38;
LABEL_33:
    v15 = 0;
    goto LABEL_39;
  }
LABEL_32:
  v14 = 0;
  if (!v13)
    goto LABEL_33;
LABEL_38:
  objc_msgSend(v7, "components:fromDate:", 28, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v31 = (_QWORD *)getQPParseAttributeValueDateTemporalModifierKeySymbolLoc_ptr;
  v49 = getQPParseAttributeValueDateTemporalModifierKeySymbolLoc_ptr;
  if (!getQPParseAttributeValueDateTemporalModifierKeySymbolLoc_ptr)
  {
    v32 = QueryParserLibrary();
    v31 = dlsym(v32, "QPParseAttributeValueDateTemporalModifierKey");
    v47[3] = (uint64_t)v31;
    getQPParseAttributeValueDateTemporalModifierKeySymbolLoc_ptr = (uint64_t)v31;
  }
  _Block_object_dispose(&v46, 8);
  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getQPParseAttributeValueDateTemporalModifierKey(void)");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("PLSearchTextQueryParser+NLDateParsing.m"), 29, CFSTR("%s"), dlerror());
    goto LABEL_70;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "integerValue");

  if (v34 == 2)
  {
    if (v14)
      v37 = v14;
    else
      v37 = v6;
    v38 = v37;

    v36 = 0;
    v14 = v38;
  }
  else
  {
    if (v34 != 1)
      goto LABEL_53;

    if (v15)
      v35 = v15;
    else
      v35 = v6;
    v36 = v35;
    v14 = 0;
  }

  v15 = v36;
LABEL_53:

  if (v14)
  {
LABEL_54:
    v39 = [PSIDateFilter alloc];
    if (v15)
      v26 = -[PSIDateFilter initWithStartDateComponents:endDateComponents:](v39, "initWithStartDateComponents:endDateComponents:", v14, v15);
    else
      v26 = -[PSIDateFilter initWithStartDateComponents:](v39, "initWithStartDateComponents:", v14);
    goto LABEL_58;
  }
LABEL_21:
  if (v15)
  {
    v26 = -[PSIDateFilter initWithEndDateComponents:]([PSIDateFilter alloc], "initWithEndDateComponents:", v15);
LABEL_58:
    v21 = v26;
    goto LABEL_59;
  }
  if (v6
    && (objc_msgSend(v6, "day") != 0x7FFFFFFFFFFFFFFFLL
     || objc_msgSend(v6, "month") != 0x7FFFFFFFFFFFFFFFLL
     || objc_msgSend(v6, "year") != 0x7FFFFFFFFFFFFFFFLL))
  {
    v26 = -[PSIDateFilter initWithSingleDateComponents:]([PSIDateFilter alloc], "initWithSingleDateComponents:", v6);
    goto LABEL_58;
  }
  v21 = 0;
LABEL_59:
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v40 = (_QWORD *)getQPParseAttributeValueDateDisplayKeySymbolLoc_ptr;
  v49 = getQPParseAttributeValueDateDisplayKeySymbolLoc_ptr;
  if (!getQPParseAttributeValueDateDisplayKeySymbolLoc_ptr)
  {
    v41 = QueryParserLibrary();
    v40 = dlsym(v41, "QPParseAttributeValueDateDisplayKey");
    v47[3] = (uint64_t)v40;
    getQPParseAttributeValueDateDisplayKeySymbolLoc_ptr = (uint64_t)v40;
  }
  _Block_object_dispose(&v46, 8);
  if (v40)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSIDateFilter setDisplayString:](v21, "setDisplayString:", v42);

    goto LABEL_63;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getQPParseAttributeValueDateDisplayKey(void)");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("PLSearchTextQueryParser+NLDateParsing.m"), 32, CFSTR("%s"), dlerror());
LABEL_70:

  __break(1u);
  return result;
}

void __81__PLSearchTextQueryParser_NLDateParsing__enumerateDatesForString_resultsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
  }
  else
  {
    v5 = a2;
    v6 = objc_msgSend(v5, "length");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__PLSearchTextQueryParser_NLDateParsing__enumerateDatesForString_resultsHandler___block_invoke_2;
    v9[3] = &unk_1E36646F8;
    v12 = *(_QWORD *)(a1 + 48);
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = v7;
    v11 = v8;
    objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v9);

  }
}

void __81__PLSearchTextQueryParser_NLDateParsing__enumerateDatesForString_resultsHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *ParserLibrary;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  if (!objc_msgSend(v3, "count"))
  {
LABEL_8:

    return;
  }
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v4 = (_QWORD *)getQPParseAttributeDateKeySymbolLoc_ptr;
  v13 = getQPParseAttributeDateKeySymbolLoc_ptr;
  if (!getQPParseAttributeDateKeySymbolLoc_ptr)
  {
    ParserLibrary = QueryParserLibrary();
    v4 = dlsym(ParserLibrary, "QPParseAttributeDateKey");
    v11[3] = (uint64_t)v4;
    getQPParseAttributeDateKeySymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v10, 8);
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_dateFilterWithQPDateInfo:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getQPParseAttributeDateKey(void)");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PLSearchTextQueryParser+NLDateParsing.m"), 26, CFSTR("%s"), dlerror());

  __break(1u);
}

- (PLSearchTextQueryParser)initWithDatabase:(id)a3
{
  id v5;
  PLSearchTextQueryParser *v6;
  PLSearchTextQueryParser *v7;
  PSITokenizer *v8;
  void *v9;
  uint64_t v10;
  PSITokenizer *psiTokenizer;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLSearchTextQueryParser;
  v6 = -[PLSearchTextQueryParser init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_db, a3);
    v8 = [PSITokenizer alloc];
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PSITokenizer initWithLocale:useCache:](v8, "initWithLocale:useCache:", v9, 0);
    psiTokenizer = v7->_psiTokenizer;
    v7->_psiTokenizer = (PSITokenizer *)v10;

  }
  return v7;
}

- (id)parseText:(id)a3
{
  id v4;
  uint64_t v5;
  PSITokenizer *psiTokenizer;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFSet *v15;
  CFIndex Count;
  const void **v17;
  id v18;
  const void **i;
  uint64_t v20;
  PSIQueryToken *v21;
  void *v22;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  PLSearchTextQueryParser *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30 = (void *)objc_opt_new();
  v27 = v4;
  -[PSITokenizer normalizeString:](self->_psiTokenizer, "normalizeString:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v29 = self;
  psiTokenizer = self->_psiTokenizer;
  v35 = 0;
  v36 = 0;
  v26 = (void *)v5;
  v7 = -[PSITokenizer newTokensFromString:withOptions:outCopyRanges:error:](psiTokenizer, "newTokensFromString:withOptions:outCopyRanges:error:");
  v25 = v36;
  v24 = v35;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v9)
  {
    v10 = v9;
    v28 = *(_QWORD *)v32;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
        objc_msgSend(v8, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[PSITokenizer fts5StringFromString:useWildcard:](PSITokenizer, "fts5StringFromString:useWildcard:", v12, v12 == v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (const __CFSet *)-[PSIQueryDelegate groupIdsMatchingString:categories:textIsSearchable:](v29->_db, "groupIdsMatchingString:categories:textIsSearchable:", v14, 0, 1);
        Count = CFSetGetCount(v15);
        v17 = (const void **)malloc_type_malloc(8 * Count, 0x100004000313F17uLL);
        CFSetGetValues(v15, v17);
        v18 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        for (i = v17; Count; --Count)
        {
          v20 = (uint64_t)*i++;
          objc_msgSend(v18, "addIndex:", v20);
        }
        free(v17);
        v21 = -[PSIQueryToken initWithText:normalizedText:userCategory:matchType:]([PSIQueryToken alloc], "initWithText:normalizedText:userCategory:matchType:", v12, v12, 0, v12 != v13);
        objc_msgSend(v30, "addObject:", v21);

        ++v11;
      }
      while (v11 != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v10);
  }

  v22 = (void *)objc_msgSend(v30, "copy");
  return v22;
}

- (PSIQueryDelegate)db
{
  return self->_db;
}

- (void)setDb:(id)a3
{
  objc_storeStrong((id *)&self->_db, a3);
}

- (PSITokenizer)psiTokenizer
{
  return self->_psiTokenizer;
}

- (void)setPsiTokenizer:(id)a3
{
  objc_storeStrong((id *)&self->_psiTokenizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_psiTokenizer, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
