@implementation VUIDebugMetricsEvent

- (VUIDebugMetricsEvent)initWithEventDictionary:(id)a3 termCollater:(id)a4
{
  id v6;
  VUIDebugMetricsEvent *v7;
  uint64_t v8;
  NSDictionary *rawData;
  NSArray *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  NSArray *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSArray *sortedPrimaryKeys;
  NSArray *v55;
  NSArray *sortedPageKeys;
  NSArray *v57;
  NSArray *eventData;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSArray *v65;
  NSArray *v66;
  id v67;
  _QWORD v68[4];
  id v69;
  objc_super v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[4];

  v84[2] = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v6 = a4;
  v70.receiver = self;
  v70.super_class = (Class)VUIDebugMetricsEvent;
  v7 = -[VUIDebugMetricsEvent init](&v70, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v67, "copy");
    rawData = v7->_rawData;
    v7->_rawData = (NSDictionary *)v8;

    v10 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0DB1840], "app");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryForKey:", kVUIBagKeyMetrics);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = v12;
    objc_msgSend(v12, "valueForKey:", CFSTR("metricsBase"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryTerms");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKey:", CFSTR("page"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDebugMetricsEvent _sortKeys:](v7, "_sortKeys:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    -[VUIDebugMetricsEvent eventType](v7, "eventType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("page"));

    if ((v17 & 1) != 0)
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(v6, "primaryTerms");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDebugMetricsEvent eventType](v7, "eventType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "valueForKey:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[VUIDebugMetricsEvent _sortKeys:](v7, "_sortKeys:", v21);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      -[VUIDebugMetricsEvent eventType](v7, "eventType");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = objc_msgSend(v22, "isEqualToString:", CFSTR("pageRender"));

      if ((_DWORD)v20)
      {
        v23 = (void *)objc_msgSend(v21, "mutableCopy");
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = __61__VUIDebugMetricsEvent_initWithEventDictionary_termCollater___block_invoke;
        v68[3] = &unk_1E9FA1D38;
        v69 = v67;
        objc_msgSend(v23, "sortUsingComparator:", v68);
        v24 = objc_msgSend(v23, "copy");

        v18 = (NSArray *)v24;
      }

    }
    v66 = v10;
    objc_msgSend(v67, "allKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "allKeys");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "indexesOfObjectsPassingTest:", &__block_literal_global_125);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectsAtIndexes:", v27);
    v28 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "baseTerms");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDebugMetricsEvent _sortKeys:](v7, "_sortKeys:", v29);
    v30 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "metricsKitTerms");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDebugMetricsEvent _sortKeys:](v7, "_sortKeys:", v31);
    v32 = objc_claimAutoreleasedReturnValue();

    v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v34 = v33;
    if (v18)
      objc_msgSend(v33, "addObjectsFromArray:", v18);
    v65 = (NSArray *)v15;
    objc_msgSend(v34, "addObjectsFromArray:", v15);
    v64 = (void *)v28;
    objc_msgSend(v34, "addObjectsFromArray:", v28);
    v63 = (void *)v30;
    objc_msgSend(v34, "addObjectsFromArray:", v30);
    v60 = (void *)v32;
    objc_msgSend(v34, "addObjectsFromArray:", v32);
    v35 = v62;
    objc_msgSend(v62, "allKeys");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObjectsFromArray:", v36);

    v37 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v67, "allKeys");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObjectsFromArray:", v38);

    objc_msgSend(v37, "minusSet:", v34);
    v39 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "filteredTerms");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setWithArray:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "minusSet:", v41);

    objc_msgSend(v37, "allObjects");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0x1E0C99000;
    if (v18 && -[NSArray count](v18, "count"))
    {
      v83[0] = CFSTR("header");
      -[VUIDebugMetricsEvent eventType](v7, "eventType");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringByAppendingString:", CFSTR(" fields"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v83[1] = CFSTR("keys");
      v84[0] = v45;
      v84[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v66, "addObject:", v46);

      v43 = 0x1E0C99000uLL;
      v35 = v62;

    }
    if (-[NSArray count](v65, "count"))
    {
      v81[0] = CFSTR("header");
      v81[1] = CFSTR("keys");
      v82[0] = CFSTR("page fields");
      v82[1] = v65;
      objc_msgSend(*(id *)(v43 + 3456), "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v66, "addObject:", v47);

    }
    if (objc_msgSend(v42, "count"))
    {
      v79[0] = CFSTR("header");
      v79[1] = CFSTR("keys");
      v80[0] = CFSTR("uncategorized fields");
      v80[1] = v42;
      objc_msgSend(*(id *)(v43 + 3456), "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v66, "addObject:", v48);

    }
    if (objc_msgSend(v64, "count"))
    {
      v77[0] = CFSTR("header");
      v77[1] = CFSTR("keys");
      v78[0] = CFSTR("UTS fields");
      v78[1] = v64;
      objc_msgSend(*(id *)(v43 + 3456), "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v66, "addObject:", v49);

    }
    if (objc_msgSend(v63, "count"))
    {
      v75[0] = CFSTR("header");
      v75[1] = CFSTR("keys");
      v76[0] = CFSTR("base fields");
      v76[1] = v63;
      objc_msgSend(*(id *)(v43 + 3456), "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v66, "addObject:", v50);

    }
    if (objc_msgSend(v35, "count"))
    {
      v73[0] = CFSTR("header");
      v73[1] = CFSTR("keys");
      v74[0] = CFSTR("bag metrics fields");
      objc_msgSend(v35, "allKeys");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v51;
      objc_msgSend(*(id *)(v43 + 3456), "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v66, "addObject:", v52);

    }
    if (objc_msgSend(v60, "count"))
    {
      v71[0] = CFSTR("header");
      v71[1] = CFSTR("keys");
      v72[0] = CFSTR("metricsKit fields");
      v72[1] = v60;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v66, "addObject:", v53);

    }
    sortedPrimaryKeys = v7->_sortedPrimaryKeys;
    v7->_sortedPrimaryKeys = v18;
    v55 = v18;

    sortedPageKeys = v7->_sortedPageKeys;
    v7->_sortedPageKeys = v65;
    v57 = v65;

    eventData = v7->_eventData;
    v7->_eventData = v66;

  }
  return v7;
}

uint64_t __61__VUIDebugMetricsEvent_initWithEventDictionary_termCollater___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "valueForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v7)
      v10 = -1;
    else
      v10 = v8 != 0;
  }
  else
  {
    v10 = objc_msgSend(v7, "compare:", v8);
  }

  return v10;
}

uint64_t __61__VUIDebugMetricsEvent_initWithEventDictionary_termCollater___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("data.uts")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("\"data.uts"));

  return v3;
}

- (id)_sortKeys:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__VUIDebugMetricsEvent__sortKeys___block_invoke;
  v7[3] = &unk_1E9F99A60;
  v7[4] = self;
  v3 = a3;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __34__VUIDebugMetricsEvent__sortKeys___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "rawData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  return v6;
}

- (NSDate)eventDate
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;

  -[VUIDebugMetricsEvent rawData](self, "rawData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("eventTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v4, "dateWithTimeIntervalSince1970:", v5 / 1000.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (NSDate *)v6;
}

- (NSString)eventType
{
  void *v2;
  void *v3;

  -[VUIDebugMetricsEvent rawData](self, "rawData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("eventType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)pageContext
{
  void *v2;
  void *v3;

  -[VUIDebugMetricsEvent rawData](self, "rawData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("pageContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  char v13;

  v4 = a3;
  -[VUIDebugMetricsEvent rawData](self, "rawData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v4, "containsString:", CFSTR("Time"));
  if (!(_DWORD)v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "stringValue");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v6, "isEqual:", v12);

      if ((v13 & 1) != 0)
      {
        v10 = CFSTR("Null");
        goto LABEL_10;
      }
      v11 = v6;
    }
    v10 = v11;
    goto LABEL_10;
  }
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7 / 1000.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v9, "setDateFormat:", CFSTR("dd/MM HH:mm:ss.SS"));
  objc_msgSend(v9, "stringFromDate:", v8);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v10;
}

- (NSArray)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
  objc_storeStrong((id *)&self->_eventData, a3);
}

- (NSDictionary)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
  objc_storeStrong((id *)&self->_rawData, a3);
}

- (NSArray)sortedPageKeys
{
  return self->_sortedPageKeys;
}

- (void)setSortedPageKeys:(id)a3
{
  objc_storeStrong((id *)&self->_sortedPageKeys, a3);
}

- (NSArray)sortedPrimaryKeys
{
  return self->_sortedPrimaryKeys;
}

- (void)setSortedPrimaryKeys:(id)a3
{
  objc_storeStrong((id *)&self->_sortedPrimaryKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedPrimaryKeys, 0);
  objc_storeStrong((id *)&self->_sortedPageKeys, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
}

@end
