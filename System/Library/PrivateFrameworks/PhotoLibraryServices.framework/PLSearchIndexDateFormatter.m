@implementation PLSearchIndexDateFormatter

- (PLSearchIndexDateFormatter)init
{
  PLSearchIndexDateFormatter *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLSearchIndexDateFormatter;
  v2 = -[PLSearchIndexDateFormatter init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create(0, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)_arrangedMonthSymbols
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _QWORD v54[8];

  v54[6] = *MEMORY[0x1E0C80C00];
  -[NSDateFormatter monthSymbols](self->_dateFormatter, "monthSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v3;
  -[NSDateFormatter shortMonthSymbols](self->_dateFormatter, "shortMonthSymbols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v4;
  -[NSDateFormatter veryShortMonthSymbols](self->_dateFormatter, "veryShortMonthSymbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v5;
  -[NSDateFormatter standaloneMonthSymbols](self->_dateFormatter, "standaloneMonthSymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v6;
  -[NSDateFormatter shortStandaloneMonthSymbols](self->_dateFormatter, "shortStandaloneMonthSymbols");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54[4] = v7;
  -[NSDateFormatter veryShortStandaloneMonthSymbols](self->_dateFormatter, "veryShortStandaloneMonthSymbols");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v54[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_97993);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v37 = v11;
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v35 = v13;
  if (v13)
  {
    v14 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array", v35);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v16 = v37;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v48;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v48 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v20), "objectAtIndexedSubscript:", v14);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v21);

            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        }
        while (v18);
      }
      v38 = v14;

      objc_msgSend(v15, "sortUsingComparator:", &__block_literal_global_9);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v23 = v15;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v44;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v44 != v26)
              objc_enumerationMutation(v23);
            v28 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v27);
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v29 = v22;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v40;
              while (2)
              {
                v33 = 0;
                do
                {
                  if (*(_QWORD *)v40 != v32)
                    objc_enumerationMutation(v29);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v33), "hasPrefix:", v28) & 1) != 0)
                  {

                    goto LABEL_25;
                  }
                  ++v33;
                }
                while (v31 != v33);
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
                if (v31)
                  continue;
                break;
              }
            }

            objc_msgSend(v29, "addObject:", v28);
LABEL_25:
            ++v27;
          }
          while (v27 != v25);
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        }
        while (v25);
      }

      objc_msgSend(v36, "addObject:", v22);
      v14 = v38 + 1;
    }
    while (v38 + 1 != v35);
  }

  return v36;
}

- (void)_inqSetupDateFormatter
{
  NSDateFormatter *v3;
  NSDateFormatter *dateFormatter;
  PLDateRangeFormatter *v5;
  PLDateRangeFormatter *dateRangeFormatter;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *yearFormat;
  NSString *v13;
  NSString *monthFormat;
  NSString *v15;
  NSString *displayFormat;
  NSString *v17;
  NSString *parseFormat;
  NSArray *v19;
  NSArray *monthSymbols;
  id v21;

  if (!self->_dateFormatter)
  {
    v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v3;

  }
  if (!self->_dateRangeFormatter)
  {
    v5 = -[PLDateRangeFormatter initWithPreset:]([PLDateRangeFormatter alloc], "initWithPreset:", 2);
    dateRangeFormatter = self->_dateRangeFormatter;
    self->_dateRangeFormatter = v5;

  }
  if (!self->_didSetupLocaleAndFormats)
  {
    +[PLSearchIndexConfiguration locale](PLSearchIndexConfiguration, "locale");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](self->_dateFormatter, "setLocale:", v21);
    -[PLDateRangeFormatter setLocale:](self->_dateRangeFormatter, "setLocale:", v21);
    objc_msgSend((id)objc_opt_class(), "yearFormatForLocale:", v21);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "monthFormatForLocale:", v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("LLLLy"), 0, v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v8, CFSTR("-"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSString *)objc_msgSend(v7, "copy");
    yearFormat = self->_yearFormat;
    self->_yearFormat = v11;

    v13 = (NSString *)objc_msgSend(v8, "copy");
    monthFormat = self->_monthFormat;
    self->_monthFormat = v13;

    v15 = (NSString *)objc_msgSend(v9, "copy");
    displayFormat = self->_displayFormat;
    self->_displayFormat = v15;

    v17 = (NSString *)objc_msgSend(v10, "copy");
    parseFormat = self->_parseFormat;
    self->_parseFormat = v17;

    -[PLSearchIndexDateFormatter _arrangedMonthSymbols](self, "_arrangedMonthSymbols");
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    monthSymbols = self->_monthSymbols;
    self->_monthSymbols = v19;

    self->_didSetupLocaleAndFormats = 1;
  }
}

- (void)_inqUpdateDateFormat:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchIndexDateFormatter.m"), 148, CFSTR("expect valid format"));

  }
  -[NSDateFormatter dateFormat](self->_dateFormatter, "dateFormat");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v7 && (objc_msgSend(v5, "isEqualToString:", v7) & 1) == 0)
    -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", v7);

}

- (id)localizedMonthStringsFromDate:(id)a3
{
  id v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__97972;
  v10 = __Block_byref_object_dispose__97973;
  v11 = 0;
  v5 = a3;
  pl_dispatch_sync();
  v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)newLocalizedComponentsFromDate:(id)a3 includeMonth:(BOOL)a4
{
  id v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__97972;
  v11 = __Block_byref_object_dispose__97973;
  v12 = 0;
  v6 = a3;
  pl_dispatch_sync();
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)_inqNewLocalizedStringFromDate:(id)a3
{
  NSString *displayFormat;
  id v5;
  void *v6;
  void *v7;

  displayFormat = self->_displayFormat;
  v5 = a3;
  -[PLSearchIndexDateFormatter _inqUpdateDateFormat:](self, "_inqUpdateDateFormat:", displayFormat);
  -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (id)newLocalizedStringFromDate:(id)a3
{
  id v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__97972;
  v10 = __Block_byref_object_dispose__97973;
  v11 = 0;
  v5 = a3;
  pl_dispatch_sync();
  v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)newLocalizedStringFromYear:(id)a3 month:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a3;
  v6 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__97972;
  v15 = __Block_byref_object_dispose__97973;
  v16 = 0;
  v9 = v5;
  v10 = v6;
  pl_dispatch_sync();
  v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthSymbols, 0);
  objc_storeStrong((id *)&self->_parseFormat, 0);
  objc_storeStrong((id *)&self->_displayFormat, 0);
  objc_storeStrong((id *)&self->_monthFormat, 0);
  objc_storeStrong((id *)&self->_yearFormat, 0);
  objc_storeStrong((id *)&self->_dateRangeFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __63__PLSearchIndexDateFormatter_newLocalizedStringFromYear_month___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(*(id *)(a1 + 32), "_inqSetupDateFormatter");
  v2 = *(void **)(a1 + 48);
  if (!*(_QWORD *)(a1 + 40))
  {
    if (!v2)
      return;
LABEL_12:
    v13 = objc_msgSend(v2, "copy");
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    return;
  }
  if (!v2)
  {
    v2 = *(void **)(a1 + 40);
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "_inqUpdateDateFormat:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "dateFromString:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_inqUpdateDateFormat:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "dateFromString:", *(_QWORD *)(a1 + 48));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v16 = 0;
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getEra:year:month:day:fromDate:", 0, &v17, 0, 0, v3);
    objc_msgSend(v7, "getEra:year:month:day:fromDate:", 0, 0, &v16, 0, v5);
    v8 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v8, "setYear:", v17);
    objc_msgSend(v8, "setMonth:", v16);
    objc_msgSend(v7, "dateFromComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(*(id *)(a1 + 32), "_inqNewLocalizedStringFromDate:", v9);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

void __57__PLSearchIndexDateFormatter_newLocalizedStringFromDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_inqNewLocalizedStringFromDate:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __74__PLSearchIndexDateFormatter_newLocalizedComponentsFromDate_includeMonth___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_inqSetupDateFormatter");
  objc_msgSend(*(id *)(a1 + 32), "_inqUpdateDateFormat:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stringFromDate:", *(_QWORD *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("-"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") != 2)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;
    goto LABEL_5;
  }
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "subarrayWithRange:", 1, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
LABEL_5:

  }
}

void __60__PLSearchIndexDateFormatter_localizedMonthStringsFromDate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_inqSetupDateFormatter");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "component:fromDate:", 8, *(_QWORD *)(a1 + 40));

  if (v3 >= 1 && v3 - 1 < (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectAtIndex:", v3 - 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

uint64_t __51__PLSearchIndexDateFormatter__arrangedMonthSymbols__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "length");
  if (v6 <= objc_msgSend(v5, "length"))
  {
    v8 = objc_msgSend(v4, "length");
    v7 = v8 < objc_msgSend(v5, "length");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

BOOL __51__PLSearchIndexDateFormatter__arrangedMonthSymbols__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = a2;
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(v3, "count");

  return v5 == v6;
}

+ (id)yearFormatForLocale:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("y"), 0, a3);
}

+ (id)monthFormatForLocale:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("LLLL"), 0, a3);
}

@end
