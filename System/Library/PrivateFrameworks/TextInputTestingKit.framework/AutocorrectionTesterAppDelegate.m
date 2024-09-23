@implementation AutocorrectionTesterAppDelegate

- (AutocorrectionTesterAppDelegate)initWithOptions:(id)a3
{
  id v4;
  AutocorrectionTesterAppDelegate *v5;
  uint64_t v6;
  NSMutableDictionary *options;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AutocorrectionTesterAppDelegate;
  v5 = -[AutocorrectionTesterAppDelegate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (AutocorrectionTesterAppDelegate)initWithLocale:(id)a3 andText:(id)a4
{
  id v6;
  id v7;
  AutocorrectionTesterAppDelegate *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *options;
  objc_super v14;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AutocorrectionTesterAppDelegate;
  v8 = -[AutocorrectionTesterAppDelegate init](&v14, sel_init);
  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDBCED8];
    v15[0] = CFSTR("KEYBOARD_LANGUAGE");
    v15[1] = CFSTR("SENTENCE");
    v16[0] = v6;
    v16[1] = v7;
    v15[2] = CFSTR("USE_PREDICTION");
    v15[3] = CFSTR("MAX_PREDICTIONS_REPORTED");
    v16[2] = MEMORY[0x24BDBD1C8];
    v16[3] = &unk_24FD5F738;
    v15[4] = CFSTR("USE_RETROCORRECTION");
    v15[5] = CFSTR("BASE_KEY_FOR_VARIANTS");
    v16[4] = MEMORY[0x24BDBD1C8];
    v16[5] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithDictionary:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    options = v8->_options;
    v8->_options = (NSMutableDictionary *)v11;

  }
  return v8;
}

- (void)resetOptions:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *options;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  options = self->_options;
  self->_options = v4;

}

- (double)runDslTest:(id)a3 withHarnessClass:(Class)a4 forLanguage:(id)a5 errorMessage:(id)a6
{
  id v10;
  id v11;
  double Current;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t j;
  id v32;
  double v33;
  void *context;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v36 = a6;
  Current = CFAbsoluteTimeGetCurrent();
  v37 = v11;
  NSLog(CFSTR("Current language being tested: %@\n"), v11);
  NSLog(CFSTR("Current DSL file tested: %@\n"), v10);
  context = (void *)MEMORY[0x2348A8D30]();
  objc_msgSend((id)objc_opt_class(), "setupSingletonMocksWithOptions:", self->_options);
  v13 = (void *)objc_msgSend([a4 alloc], "initWithAttributes:", self->_options);
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 2.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "runUntilDate:", v15);

  objc_msgSend(v13, "dslTestDriver");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "consumeTestFile:", v10);

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v13, "dslTestDriver");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "syntaxErrors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(v18);
        v24 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * i);

        v21 = objc_retainAutorelease(v24);
        printf("Syntax Error: %s\n", (const char *)objc_msgSend(v21, "UTF8String"));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v20);

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v13, "dslTestDriver");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "failedTests");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    v30 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(v26);
        v32 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * j);

        v29 = objc_retainAutorelease(v32);
        printf("Failed Test: %s\n", (const char *)objc_msgSend(v29, "UTF8String"));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v28);

  }
  objc_autoreleasePoolPop(context);
  objc_msgSend((id)objc_opt_class(), "teardownSingletonMocks:", self->_options);
  v33 = CFAbsoluteTimeGetCurrent() - Current;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Testing time: %.2f s\n", v33);

  return v33;
}

- (BOOL)runTests:(id)a3 withHarnessClass:(Class)a4 forLanguage:(id)a5 errorMessage:(id)a6 reportObserver:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  double Current;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  int v28;
  CFAbsoluteTime v29;
  BOOL v30;
  void *context;
  id v33;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  Current = CFAbsoluteTimeGetCurrent();
  NSLog(CFSTR("Current language being tested: %@\n"), v13);
  if (v12)
  {
    v33 = v14;
    context = (void *)MEMORY[0x2348A8D30]();
    objc_msgSend((id)objc_opt_class(), "setupSingletonMocksWithOptions:", self->_options);
    objc_msgSend((id)objc_opt_class(), "reporterWithOptions:", self->_options);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend([a4 alloc], "initWithAttributes:", self->_options);
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 2.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "runUntilDate:", v20);

    -[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", CFSTR("NUM_TRIALS"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "intValue");

    if (v22 <= 1)
      v23 = 1;
    else
      v23 = v22;
    -[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", CFSTR("START_INDEX"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "intValue");

    if (v25)
      v26 = v25 - 1;
    else
      v26 = 0;
    -[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", CFSTR("END_INDEX"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "intValue");

    if (!v28)
      v28 = objc_msgSend(v12, "count");
    +[TITester runWithTests:inRange:testHarness:options:reporter:numTrials:reportObserver:](TITester, "runWithTests:inRange:testHarness:options:reporter:numTrials:reportObserver:", v12, v26, v28 - v26, v18, self->_options, v17, v23, v15);

    objc_autoreleasePoolPop(context);
    objc_msgSend((id)objc_opt_class(), "teardownSingletonMocks:", self->_options);
    v29 = CFAbsoluteTimeGetCurrent() - Current;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Testing time: %.2f s\n", v29);
    v30 = v29 != 0.0;
    v14 = v33;
  }
  else
  {
    if (v14)
      NSLog(CFSTR("%@"), v14);
    v30 = 0;
  }

  return v30;
}

- (BOOL)runTestCasesForSource:(id)a3 errorMessage:(id)a4 reportObserver:(id)a5
{
  id v8;
  id v9;
  id v10;
  double Current;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CFAbsoluteTime v17;
  BOOL v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  Current = CFAbsoluteTimeGetCurrent();
  if (v8)
  {
    v12 = Current;
    v13 = (void *)MEMORY[0x2348A8D30]();
    objc_msgSend((id)objc_opt_class(), "setupSingletonMocksWithOptions:", self->_options);
    objc_msgSend((id)objc_opt_class(), "reporterWithOptions:", self->_options);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 2.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "runUntilDate:", v16);

    +[TITester runTestCasesForSource:options:reporter:reportObserver:](TITester, "runTestCasesForSource:options:reporter:reportObserver:", v8, self->_options, v14, v10);
    objc_autoreleasePoolPop(v13);
    objc_msgSend((id)objc_opt_class(), "teardownSingletonMocks:", self->_options);
    v17 = CFAbsoluteTimeGetCurrent() - v12;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Testing time: %.2f s\n", v17);
    v18 = v17 != 0.0;
  }
  else
  {
    if (v9)
      NSLog(CFSTR("%@"), Current, v9);
    v18 = 0;
  }

  return v18;
}

- (BOOL)runAutocorrectionTester:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  char v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const __CFString *v30;
  AutocorrectionTesterAppDelegate *v31;
  id v32;
  uint64_t v33;
  void *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  AutocorrectionTesterAppDelegate *v39;
  void *v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  double v50;
  void *v51;
  double v52;
  char v53;
  void *v54;
  __CFString *v55;
  __CFString *v56;
  uint64_t v57;
  __CFString *v58;
  __CFString *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  uint64_t v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  AutocorrectionTesterAppDelegate *v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t j;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  AutocorrectionTesterAppDelegate *v92;
  void *v93;
  void *v94;
  FILE *v95;
  const char *v96;
  id v97;
  uint64_t v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  int context;
  void *contexta;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  id obj;
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  id v131;
  _QWORD v132[4];
  id v133;
  uint64_t v134;
  _BYTE v135[128];
  void *v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _QWORD v139[3];
  _QWORD v140[5];

  v140[3] = *MEMORY[0x24BDAC8D0];
  v118 = a3;
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("WORDS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("DICTS"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("PLAYBACK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("TEXT"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("TESTCASE"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("TYPOLOGY"));
  v115 = objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("CANDIDATE_SENTENCES"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("USER_DIRECTORY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("CUSTOM_DIALECT_LANGUAGE_MODEL_PATH"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", CFSTR("RUN_DSL_TEST"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("CONVERSATION_TESTS_FILE"));
  v110 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("CONVERSATION_TESTS"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("SENTENCE"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("PREFERS_TRANSLITERATION"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = CFSTR("0");
  v12 = -[__CFString BOOLValue](v10, "BOOLValue");

  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("INPUT_SAMPLES"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v13 = v7;
    -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("CLEAN_USER_DIRECTORY"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");

    if (v15)
      __remakeDirectoryAtPath(v6);
    else
      __createDirectoryAtPath(v6);
    TI_SET_KB_USER_DIRECTORY();
    v7 = v13;
  }
  -[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", CFSTR("KEYBOARD_LANGUAGE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && (isInputModeAvailable() & 1) == 0)
  {
    NSLog(CFSTR("unsupported language '%@'. You must specify a valid language!.\n"), v16);
    v24 = 0;
    v25 = (void *)v115;
LABEL_38:
    v47 = v110;
LABEL_39:
    v46 = v116;
    goto LABEL_40;
  }
  context = v12;
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("TOUCAN_LM_MODE"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = v4;
    v19 = v9;
    v20 = v16;
    v21 = v7;
    -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("TOUCAN_LM_MODE"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "intValue");

    if (v23 > 2)
    {
      -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("TOUCAN_LM_MODE"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("unsupported value for TOUCAN_LM_MODE option '%@'.\n"), v26);

    }
    else
    {
      TI_SET_USING_TOUCAN_LM();
    }
    v7 = v21;
    v16 = v20;
    v9 = v19;
    v4 = v18;
  }
  if (v7)
  {
    TI_SET_IS_USING_CUSTOM_DIALECT_LM();
    TI_SET_DIALECT_LM_PATH();
  }
  v27 = objc_opt_class();
  v25 = (void *)v115;
  if (v115)
    v27 = objc_opt_class();
  v28 = v27;
  if (!v16)
  {
    if (!v116)
      goto LABEL_37;
    contexta = (void *)MEMORY[0x2348A8D30]();
    availableInputModes();
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v135, 16);
    if (v36)
    {
      v37 = v36;
      v38 = v7;
      v39 = self;
      v99 = v9;
      v101 = v38;
      v103 = v4;
      v105 = v5;
      v40 = 0;
      v41 = *(_QWORD *)v120;
      v42 = 0.0;
      do
      {
        v43 = 0;
        v44 = v40;
        do
        {
          if (*(_QWORD *)v120 != v41)
            objc_enumerationMutation(obj);
          v45 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v43);
          -[NSMutableDictionary setObject:forKey:](v39->_options, "setObject:forKey:", v45, CFSTR("INPUT_MODE"));
          read_unigrams_dictionary(v116, v45);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          v42 = v42
              + (double)-[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:](v39, "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:", v40, v28, v45, CFSTR("Unable to read the dictionary file.\n"), v118);
          ++v43;
          v44 = v40;
        }
        while (v37 != v43);
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v135, 16);
      }
      while (v37);

      v4 = v103;
      v46 = v116;
      v5 = v105;
      v25 = (void *)v115;
      v16 = 0;
      v7 = v101;
      v9 = v99;
    }
    else
    {
      v42 = 0.0;
      v46 = v116;
    }
    v50 = v42 / 60.0;
    if (v42 > 0.0)
      v50 = v42;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Total testing time: %.2f s\n", v50);

    objc_autoreleasePoolPop(contexta);
    v24 = 1;
LABEL_47:
    v47 = v110;
    goto LABEL_40;
  }
  if (!isInputModeAvailable())
  {
    NSLog(CFSTR("unsupported language '%@'. You must specify a valid language!.\n"), v16);
    goto LABEL_37;
  }
  -[NSMutableDictionary setObject:forKey:](self->_options, "setObject:forKey:", v16, CFSTR("INPUT_MODE"));
  if (v4)
  {
    read_wordlist((uint64_t)v4);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v30 = CFSTR("Unable to read the word list file.\n");
    v31 = self;
    v32 = v29;
    v33 = v28;
    v34 = v16;
LABEL_24:
    v35 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:](v31, "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:", v32, v33, v34, v30, v118);
    goto LABEL_25;
  }
  v106 = v5;
  if (v116)
  {
    read_unigrams_dictionary(v116, v16);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:](self, "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:", v49, v28, v16, CFSTR("Unable to read the dictionary file.\n"), v118);

    v47 = v110;
    v46 = v116;
    goto LABEL_40;
  }
  if (v8)
  {
    -[NSMutableDictionary setObject:forKey:](self->_options, "setObject:forKey:", CFSTR("YES"), CFSTR("RUN_DSL_TEST"));
    -[NSMutableDictionary valueForKey:](self->_options, "valueForKey:", CFSTR("DSL_TEST_FILE"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionTesterAppDelegate runDslTest:withHarnessClass:forLanguage:errorMessage:](self, "runDslTest:withHarnessClass:forLanguage:errorMessage:", v51, v28, v16, 0);
    v24 = v52 != 0.0;

    v47 = v110;
    v46 = 0;
    goto LABEL_40;
  }
  if (v114)
    v53 = context;
  else
    v53 = 1;
  if ((v53 & 1) == 0)
  {
    +[TTKTestCaseReader loadFromPath:](TTKTestCaseReader, "loadFromPath:", v114);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      NSLog(CFSTR("Could not open: %@"), v114);
      v24 = 0;
      goto LABEL_26;
    }
    -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("KEYSTROKE_SEGMENTATION_MODE"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v61)
      -[NSMutableDictionary setValue:forKey:](self->_options, "setValue:forKey:", CFSTR("alignment"), CFSTR("KEYSTROKE_SEGMENTATION_MODE"));
    v35 = -[AutocorrectionTesterAppDelegate runTestCasesForSource:errorMessage:reportObserver:](self, "runTestCasesForSource:errorMessage:reportObserver:", v29, 0, v118);
LABEL_25:
    v24 = v35;
LABEL_26:

    goto LABEL_38;
  }
  v98 = v28;
  if (context)
  {
    v54 = v7;
    -[NSMutableDictionary setObject:forKey:](self->_options, "setObject:forKey:", CFSTR("YES"), CFSTR("PREFERS_PREDICTION_SELECTION"));
    -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("TEST_SENTENCE_TRANSLITERATION"));
    v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if (!v55)
      v55 = CFSTR("0");
    v57 = -[__CFString BOOLValue](v55, "BOOLValue");

    -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("TRANSLITERATE_WITH_SPACES"));
    v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v59 = v58;
    if (!v58)
      v58 = CFSTR("0");
    v60 = -[__CFString BOOLValue](v58, "BOOLValue");

    v7 = v54;
    if (v112)
    {
      +[PlaybackTest loadFromSentence:withCatenation:](PlaybackTest, "loadFromSentence:withCatenation:", v112, v57);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v4 = 0;
    }
    else
    {
      v4 = 0;
      if (!v113)
        goto LABEL_37;
      +[PlaybackTest loadFromTextInputFile:withCatenation:addWordSpacing:](PlaybackTest, "loadFromTextInputFile:withCatenation:addWordSpacing:", v113, v57, v60);
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    v33 = v98;
    if (v29)
    {
      v31 = self;
      v32 = v29;
      v34 = v16;
      v30 = 0;
      goto LABEL_24;
    }
LABEL_37:
    v24 = 0;
    goto LABEL_38;
  }
  if (v113)
  {
    v134 = 0;
    read_textfile((uint64_t)v113, (uint64_t)&v134);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      v24 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:](self, "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:", v62, v28, v16, 0, v118);
    }
    else
    {
      NSLog(CFSTR("Could not open: %@"), v113);
      v24 = 0;
    }
    v46 = 0;

    goto LABEL_47;
  }
  if (v111)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v132[0] = MEMORY[0x24BDAC760];
    v132[1] = 3221225472;
    v132[2] = __59__AutocorrectionTesterAppDelegate_runAutocorrectionTester___block_invoke;
    v132[3] = &unk_24FD48C48;
    v133 = v63;
    v29 = v63;
    objc_msgSend(v111, "enumerateObjectsUsingBlock:", v132);
    v24 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:](self, "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:", v29, v28, v16, 0, v118);

    goto LABEL_26;
  }
  v104 = v6;
  v102 = v7;
  if (v110)
  {
    v64 = v9;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v65, 4, &v131);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v131;
    if (!v66)
    {
      v95 = (FILE *)*MEMORY[0x24BDAC8D8];
      v96 = (const char *)objc_msgSend(objc_retainAutorelease(v110), "cStringUsingEncoding:", 4);
      objc_msgSend(v67, "localizedDescription");
      v97 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v95, "Error: Unable to parse JSON config file '%s': %s\n\n", v96, (const char *)objc_msgSend(v97, "cStringUsingEncoding:", 4));

      exit(1);
    }
    objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("conversationTests"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    conversationTestsFromJsonArray(v68);
    v69 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v69;
    v25 = (void *)v115;
    v6 = v104;
    v7 = v102;
  }
  if (!v9)
  {
    if (v112)
    {
      v89 = v7;
      +[AutocorrectionTest testWithInput:](AutocorrectionTest, "testWithInput:");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = v90;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v136, 1);
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:](self, "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:", v91, v98, v16, 0, v118);
      v9 = 0;
      v47 = v110;
      v7 = v89;
      v4 = 0;
      goto LABEL_39;
    }
    v92 = self;
    v46 = 0;
    if (v25)
    {
      v25 = (void *)v115;
      read_typologyInfo(v115);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:](v92, "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:", v93, v98, v16, 0, v118);

      v9 = 0;
      v4 = 0;
    }
    else
    {
      if (v109)
      {
        read_candidates((uint64_t)v109);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:](v92, "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:", v94, v98, v16, CFSTR("Unable to read candidates\n"), v118);

        v9 = 0;
      }
      else
      {
        v9 = 0;
        v24 = 0;
      }
      v4 = 0;
      v25 = (void *)v115;
    }
    v7 = v102;
    goto LABEL_47;
  }
  v100 = v16;
  v70 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v139[0] = CFSTR("CONVERSATION_SENDERS_TO_TEST");
  v139[1] = CFSTR("CONVERSATION_ADAPT_TO_SENT_MESSAGES");
  v140[0] = CFSTR("sendersToTest");
  v140[1] = CFSTR("adaptToSentMessages");
  v139[2] = CFSTR("CONVERSATION_ADAPT_TO_RECEIVED_MESSAGES");
  v140[2] = CFSTR("adaptToReceivedMessages");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v140, v139, 3);
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v71 = (id)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v127, v138, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v128;
    do
    {
      for (i = 0; i != v73; ++i)
      {
        if (*(_QWORD *)v128 != v74)
          objc_enumerationMutation(v71);
        v76 = *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        if (v77)
        {
          objc_msgSend(v71, "objectForKeyedSubscript:", v76);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", v76);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setObject:forKeyedSubscript:", v79, v78);

        }
      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v127, v138, 16);
    }
    while (v73);
  }
  v80 = v71;
  v81 = self;
  v82 = v80;

  v83 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v9 = v9;
  v84 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v123, v137, 16);
  if (v84)
  {
    v85 = v84;
    v86 = *(_QWORD *)v124;
    do
    {
      for (j = 0; j != v85; ++j)
      {
        if (*(_QWORD *)v124 != v86)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * j), "overridingJsonKeys:", v70);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "addObject:", v88);

      }
      v85 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v123, v137, 16);
    }
    while (v85);
  }

  v24 = -[AutocorrectionTesterAppDelegate runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:](v81, "runTests:withHarnessClass:forLanguage:errorMessage:reportObserver:", v83, v98, v100, 0, v118);
  v4 = 0;
  v6 = v104;
  v25 = (void *)v115;
  v46 = 0;
  v16 = v100;
  v5 = v106;
  v47 = v110;
  v7 = v102;
LABEL_40:

  return v24;
}

- (BOOL)runWithObserver:(id)a3
{
  void *v4;
  AutocorrectionTesterAppDelegate *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  AutocorrectionTesterAppDelegate *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  int v38;
  int v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
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
  float v54;
  void *v55;
  id v57;
  void *v58;
  void *v59;
  NSMutableDictionary *obj;
  NSMutableDictionary *obja;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("STEP_INDEX"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[TISweepSource sharedInstance](TISweepSource, "sharedInstance");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v5 = self;
    obj = self->_options;
    v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v67 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("[],"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "componentsSeparatedByCharactersInSet:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v13, "count") >= 2)
          {
            objc_msgSend(v13, "objectAtIndex:", 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "floatValue");
            v16 = v15;

            LODWORD(v17) = v16;
            objc_msgSend(v58, "addValue:withValue:", v10, v17);
          }

        }
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      }
      while (v7);
    }

    objc_msgSend(v58, "debugValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      v20 = v57;
      v21 = -[AutocorrectionTesterAppDelegate runAutocorrectionTester:](v5, "runAutocorrectionTester:", v57);

      goto LABEL_33;
    }

    self = v5;
  }
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("STEP_COUNT"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
LABEL_30:
    v20 = v57;
    v21 = -[AutocorrectionTesterAppDelegate runAutocorrectionTester:](self, "runAutocorrectionTester:", v57);
    goto LABEL_33;
  }
  +[TISweepSource sharedInstance](TISweepSource, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("STEP_COUNT"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v23;
  objc_msgSend(v23, "setStepCount:", objc_msgSend(v24, "intValue"));

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v25 = self;
  obja = self->_options;
  v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v63 != v28)
          objc_enumerationMutation(obja);
        v30 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
        -[NSMutableDictionary objectForKey:](self->_options, "objectForKey:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("[],"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "componentsSeparatedByCharactersInSet:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v33, "count") >= 2)
        {
          objc_msgSend(v33, "objectAtIndex:", 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "floatValue");
          v36 = v35;

          objc_msgSend(v33, "objectAtIndex:", 2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "floatValue");
          v39 = v38;

          LODWORD(v40) = v36;
          LODWORD(v41) = v39;
          objc_msgSend(v59, "addValue:withMin:withMax:", v30, v40, v41);
        }

      }
      v27 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v27);
  }

  objc_msgSend(v59, "debugValues");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "count");

  if (!v43)
  {

    self = v25;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "sweepStateHeader");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "appendFormat:", CFSTR("%@results,\n"), v45);

  -[NSMutableDictionary valueForKey:](v25->_options, "valueForKey:", CFSTR("OUTPATH"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v25->_options, "objectForKey:", CFSTR("SWEEP_EXTRACT"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "stringByDeletingLastPathComponent");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "stringByAppendingPathComponent:", v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v49, "stringByAppendingFormat:", CFSTR(" %@ > /tmp/sweep_value.txt"), v46);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("sh %@"), v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v57;
  if ((objc_msgSend(v59, "finished") & 1) != 0)
  {
LABEL_28:
    objc_msgSend(v46, "stringByDeletingPathExtension");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v55, "stringByAppendingString:", CFSTR("_sweep.csv"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 1;
    objc_msgSend(v44, "writeToFile:atomically:encoding:error:", v46, 1, 4, 0);
  }
  else
  {
    while (-[AutocorrectionTesterAppDelegate runAutocorrectionTester:](v25, "runAutocorrectionTester:", v57))
    {
      system((const char *)objc_msgSend(objc_retainAutorelease(v51), "cStringUsingEncoding:", 4));
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", CFSTR("/tmp/sweep_value.txt"), 4, 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "sweepStateValues");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "floatValue");
      objc_msgSend(v44, "appendFormat:", CFSTR("%@%f,\n"), v53, v54);

      objc_msgSend(v59, "advanceSweep");
      if (objc_msgSend(v59, "finished"))
        goto LABEL_28;
    }
    v21 = 0;
  }

LABEL_33:
  return v21;
}

- (BOOL)runAndWriteReport
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__AutocorrectionTesterAppDelegate_runAndWriteReport__block_invoke;
  v3[3] = &unk_24FD48C80;
  v3[4] = self;
  return -[AutocorrectionTesterAppDelegate runWithObserver:](self, "runWithObserver:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

void __52__AutocorrectionTesterAppDelegate_runAndWriteReport__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  FILE **v10;
  id v11;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a2;
  +[TIReporter fileURLForTrial:withOptions:](TIReporter, "fileURLForTrial:withOptions:", a3, v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  TITestTyperWritePropertyListToFile(v5, v11);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("KeystrokeSavingsRatio"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WordAccuracy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "floatValue");
  v9 = 1.0 - v8;

  v10 = (FILE **)MEMORY[0x24BDAC8D8];
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "KSR:\t %.3f\n", v9);
  fprintf(*v10, "Error Rate: %.2f%%\n", (float)(v9 * 100.0));

}

void __59__AutocorrectionTesterAppDelegate_runAutocorrectionTester___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    +[AutocorrectionTest testWithInput:](AutocorrectionTest, "testWithInput:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  else
  {
    NSLog(CFSTR("Error: Unable to parse inputTextSamples"));
    *a4 = 1;
  }

}

+ (void)setupSingletonMocksWithOptions:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  Class v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("NAMEDENTITIES"));
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("PORTRAIT_NAMEDENTITIES"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ADDRESSBOOK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("TEST_AUTO_FILL_FEATURE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  v8 = NSClassFromString(CFSTR("TITransientLexiconManager"));
  if (v5)
  {
    if (!v8)
    {
      read_contactsfile((uint64_t)v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _TIBeginMockingSingletonsWithResources(v9, MEMORY[0x24BDBD1A8], 0, 1, v7);

      goto LABEL_16;
    }
  }
  else if (!(v14 | v4) || !v8)
  {
    _TIBeginMockingSingletonsWithData(0, 0, 0, 0, 0, v7);
    goto LABEL_16;
  }
  if (!v14)
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
    if (v4)
      goto LABEL_8;
LABEL_10:
    v11 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_11;
  }
  read_nefile(v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_10;
LABEL_8:
  read_portrait_nefile((void *)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    read_mock_contactsfile((uint64_t)v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDBD1A8];
  }
  _TIBeginMockingSingletonsWithMockData(v13, v12, MEMORY[0x24BDBD1A8], 0, 0, v7);

LABEL_16:
}

+ (void)teardownSingletonMocks:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "valueForKey:", CFSTR("TEST_AUTO_FILL_FEATURE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  _TIEndMockingSingletonsWithData(v4);
}

+ (id)reporterWithOptions:(id)a3
{
  id v3;
  void *v4;
  TIReporter *v5;

  v3 = a3;
  v4 = (void *)MGCopyAnswer();
  v5 = -[TIReporter initWithBuildVersion:]([TIReporter alloc], "initWithBuildVersion:", v4);
  -[TIReporter setOptions:](v5, "setOptions:", v3);

  return v5;
}

@end
