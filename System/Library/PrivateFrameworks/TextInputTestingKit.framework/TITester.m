@implementation TITester

- (TITester)initWithTests:(id)a3
{
  id v5;
  TITester *v6;
  TITester *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITester;
  v6 = -[TITester init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tests, a3);

  return v7;
}

- (void)runTestsInRange:(_NSRange)a3 options:(id)a4 trialID:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  BOOL v15;
  unint64_t v16;
  void *v17;
  NSUInteger v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSUInteger v38;
  NSUInteger v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  length = a3.length;
  location = a3.location;
  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  -[TITester reporter](self, "reporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginLogTrial");

  v39 = -[NSArray count](self->_tests, "count");
  objc_msgSend(v8, "valueForKey:", CFSTR("TEST_AUTO_FILL_FEATURE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = CFSTR("NO");
  if (v11)
    v12 = CFSTR("YES");
  NSLog(CFSTR("Are we going to test AutoFillFeature = %@"), v12);
  if (v11)
  {
    -[TITester createAutofillTestHarnessInstance:](self, "createAutofillTestHarnessInstance:", v8);
    if (!v39)
    {
      -[AutofillTestHarness runAutofillTestWithoutTyping:testHarness:trialID:](self->_autofillTestHarness, "runAutofillTestWithoutTyping:testHarness:trialID:", v8, self->testHarness, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TITester reporter](self, "reporter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logResult:", v13);

    }
  }
  v38 = location + length;
  v15 = location >= location + length;
  v16 = a5;
  if (!v15)
  {
    v36 = v8;
    do
    {
      v17 = (void *)MEMORY[0x2348A8D30]();
      v18 = location + 1;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Testing line: %lu/%lu\n", location + 1, v39);
      -[NSArray objectAtIndexedSubscript:](self->_tests, "objectAtIndexedSubscript:", location);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[TITester testHarness](self, "testHarness");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "runConversationTest:trialID:withError:", v19, v16, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v41 != v25)
                objc_enumerationMutation(v22);
              v27 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
              -[TITester reporter](self, "reporter");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "logResult:", v27);

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          }
          while (v24);
          v29 = v22;
          v8 = v36;
          v16 = a5;
        }
        else
        {
          v29 = v22;
        }
      }
      else
      {
        -[TITester runTestBasedOnTestType:options:trialID:withError:](self, "runTestBasedOnTestType:options:trialID:withError:", v19, v8, v16, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TITester reporter](self, "reporter");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "logResult:", v29);
      }

      -[TITester testHarness](self, "testHarness");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_opt_respondsToSelector();

      if ((v31 & 1) != 0)
      {
        -[TITester testHarness](self, "testHarness");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "performSelector:withObject:", sel_reset, 0);

      }
      objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.05);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "runUntilDate:", v34);

      objc_autoreleasePoolPop(v17);
      location = v18;
    }
    while (v18 != v38);
  }
  fputc(10, (FILE *)*MEMORY[0x24BDAC8D8]);
  -[TITester reporter](self, "reporter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "endLogTrial");

}

- (id)runTestBasedOnTestType:(id)a3 options:(id)a4 trialID:(unint64_t)a5 withError:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v9 = a4;
  if (self->_autofillTestHarness)
  {
    v10 = (objc_class *)MEMORY[0x24BDBCE30];
    v11 = a3;
    v12 = objc_alloc_init(v10);
    -[AutofillTestHarness configureAutofillAndGetAutocorrectionsOrCandidatesBeforeTyping:](self->_autofillTestHarness, "configureAutofillAndGetAutocorrectionsOrCandidatesBeforeTyping:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[TITester testHarness](self, "testHarness");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "runTest:trialID:withError:", v11, a5, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[AutofillTestHarness updateResultForAutoFill:predictionCandidatesWithoutTyping:](self->_autofillTestHarness, "updateResultForAutoFill:predictionCandidatesWithoutTyping:", v15, v13);
  }
  else
  {
    v15 = a3;
    -[TITester testHarness](self, "testHarness");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "runTest:trialID:withError:", v15, a5, 0);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)createAutofillTestHarnessInstance:(id)a3
{
  id v4;
  TITestHarness *v5;
  void *v6;
  objc_class *v7;
  AutofillTestHarness *v8;
  AutofillTestHarness *autofillTestHarness;
  id v10;

  v4 = a3;
  if (!self->_autofillTestHarness)
  {
    v10 = v4;
    v5 = self->testHarness;
    -[TITestHarness testTyper](v5, "testTyper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = NSClassFromString(CFSTR("AutofillTestHarness"));
    if (!v7)
    {
      fwrite("Error: Unable to load 'AutofillTestHarness' class\n\n", 0x33uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      exit(1);
    }
    v8 = (AutofillTestHarness *)objc_msgSend([v7 alloc], "initWithOptionsAndTestTyper:testTyper:", v10, v6);
    autofillTestHarness = self->_autofillTestHarness;
    self->_autofillTestHarness = v8;

    v4 = v10;
  }

}

- (TIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (NSArray)tests
{
  return self->_tests;
}

- (TITestHarness)testHarness
{
  return self->testHarness;
}

- (void)setTestHarness:(id)a3
{
  objc_storeStrong((id *)&self->testHarness, a3);
}

- (AutofillTestHarness)autofillTestHarness
{
  return (AutofillTestHarness *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAutofillTestHarness:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autofillTestHarness, 0);
  objc_storeStrong((id *)&self->testHarness, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_tests, 0);
}

+ (void)runWithTests:(id)a3 inRange:(_NSRange)a4 testHarness:(id)a5 options:(id)a6 reporter:(id)a7 numTrials:(unint64_t)a8 reportObserver:(id)a9
{
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, void *, _QWORD);
  void *v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *context;
  void *v25;
  id v26;
  NSUInteger length;

  length = a4.length;
  location = a4.location;
  v26 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void (**)(id, void *, _QWORD))a9;
  context = (void *)MEMORY[0x2348A8D30]();
  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTests:", v26);
  v25 = v16;
  objc_msgSend(v18, "setReporter:", v16);
  objc_msgSend(v18, "setTestHarness:", v14);
  if (a8)
  {
    for (i = 0; i != a8; ++i)
    {
      v20 = fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Beginning trial %lu\n", i);
      v21 = (void *)MEMORY[0x2348A8D30](v20);
      objc_msgSend(v18, "runTestsInRange:options:trialID:", location, length, v15, i);
      if (objc_msgSend(v14, "requiresMaintenance"))
      {
        objc_msgSend(MEMORY[0x24BEB53E0], "flushDynamicLearningCaches");
        objc_msgSend(MEMORY[0x24BEB53E0], "performMaintenance");
      }
      objc_msgSend(v18, "reporter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "reportForTrial:", i);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        v17[2](v17, v23, i);

      objc_autoreleasePoolPop(v21);
    }
  }

  objc_autoreleasePoolPop(context);
}

+ (id)stringByReplacingCurlyQuotesWithStraightQuotes:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("‘"), CFSTR("'"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("“"), CFSTR("\"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("”"), CFSTR("\"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)runTestCasesForSource:(id)a3 options:(id)a4 reporter:(id)a5 reportObserver:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char isKindOfClass;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  __CFString *v50;
  __CFString *v51;
  void *v52;
  FILE *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;
  AutocorrectionTestHarness *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  id v74;
  uint64_t v75;
  FILE *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void (**v84)(id, void *, _QWORD);
  id v85;
  id v86;
  __CFString *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint8_t buf[4];
  uint64_t v108;
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v84 = (void (**)(id, void *, _QWORD))a6;
  objc_msgSend(v10, "valueForKey:", CFSTR("START_INDEX"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  if (v13)
    v14 = v13 - 1;
  else
    v14 = 0;
  objc_msgSend(v10, "valueForKey:", CFSTR("END_INDEX"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "intValue");

  v91 = v11;
  objc_msgSend(v11, "beginLogTrial");
  objc_msgSend(v9, "getNextTestCase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v95 = v16;
    v18 = v14;
    v19 = 0;
    v85 = v10;
    v86 = v9;
    v93 = v18;
    do
    {
      v20 = v19++;
      if (v20 >= v18)
      {
        objc_msgSend(v17, "records");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          v23 = (void *)MEMORY[0x2348A8D30]();
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Test case: %lu\n", v19);
          v24 = (void *)objc_msgSend(v10, "mutableCopy");
          objc_msgSend(v24, "setObject:forKey:", CFSTR("ACTRecordedActionStream"), CFSTR("UserActionStream"));
          objc_msgSend(v24, "setObject:forKey:", v17, CFSTR("TTKTestCase"));
          objc_msgSend(v24, "objectForKey:", CFSTR("USE_RETROCORRECTION"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v25)
            objc_msgSend(v24, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("USE_RETROCORRECTION"));
          objc_msgSend(v24, "objectForKey:", CFSTR("USE_PREDICTION"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v26)
            objc_msgSend(v24, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("USE_PREDICTION"));
          v105 = 0u;
          v106 = 0u;
          v103 = 0u;
          v104 = 0u;
          objc_msgSend(v17, "records");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
          if (v28)
          {
            v29 = v28;
            v97 = v20;
            v98 = v24;
            v96 = v23;
            v94 = v19;
            v30 = *(_QWORD *)v104;
LABEL_14:
            v31 = 0;
            while (1)
            {
              if (*(_QWORD *)v104 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v31);
              objc_msgSend(v32, "layoutName");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
                break;
              if (v29 == ++v31)
              {
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
                if (v29)
                  goto LABEL_14;
                v35 = 2;
                v18 = v93;
                v19 = v94;
                v23 = v96;
                v20 = v97;
                v24 = v98;
                goto LABEL_53;
              }
            }
            objc_msgSend(v32, "layoutName");
            v36 = objc_claimAutoreleasedReturnValue();

            v24 = v98;
            if (!v36)
            {
              v35 = 2;
              v18 = v93;
              v19 = v94;
              v23 = v96;
              v20 = v97;
              goto LABEL_54;
            }
            v37 = (void *)v36;
            objc_msgSend(v9, "layouts");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v37;
            objc_msgSend(v38, "objectForKey:", v37);
            v39 = objc_claimAutoreleasedReturnValue();

            v92 = (void *)v39;
            objc_msgSend(v98, "setObject:forKey:", v39, CFSTR("TTKKeyboardPlane"));
            objc_msgSend(v17, "metadata");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "objectForKey:", CFSTR("displayWidth"));
            v41 = objc_claimAutoreleasedReturnValue();
            v18 = v93;
            v23 = v96;
            v20 = v97;
            if (v41)
            {
              v42 = (void *)v41;
              objc_msgSend(v17, "metadata");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "objectForKey:", CFSTR("displayHeight"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44)
              {
                objc_msgSend(v17, "metadata");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKey:", CFSTR("displayWidth"));
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v17, "metadata");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "objectForKey:", CFSTR("displayHeight"));
                v48 = (void *)objc_claimAutoreleasedReturnValue();

                v49 = objc_msgSend(v46, "compare:", v48);
                v50 = CFSTR("Portrait");
                if (v49 == 1)
                  v50 = CFSTR("Landscape");
                v51 = v50;

LABEL_32:
                objc_msgSend(v98, "setObject:forKey:", v46, CFSTR("KEYBOARD_WIDTH"));
                objc_msgSend(v98, "setObject:forKey:", v51, CFSTR("KEYBOARD_ORIENTATION"));
                v53 = (FILE *)*MEMORY[0x24BDAC8D8];
                v88 = v46;
                v54 = objc_msgSend(v46, "intValue");
                v87 = objc_retainAutorelease(v51);
                fprintf(v53, "width = %d orientation = %s\n", v54, (const char *)-[__CFString UTF8String](v87, "UTF8String"));
                v55 = (void *)objc_opt_new();
                v56 = (void *)objc_opt_new();
                v99 = 0u;
                v100 = 0u;
                v101 = 0u;
                v102 = 0u;
                v90 = v17;
                objc_msgSend(v17, "records");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
                if (v58)
                {
                  v59 = v58;
                  v60 = *(_QWORD *)v100;
                  do
                  {
                    for (i = 0; i != v59; ++i)
                    {
                      if (*(_QWORD *)v100 != v60)
                        objc_enumerationMutation(v57);
                      v62 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
                      v63 = (void *)objc_opt_class();
                      objc_msgSend(v62, "primaryIntendedText");
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v63, "stringByReplacingCurlyQuotesWithStraightQuotes:", v64);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v55, "addObject:", v65);
                      objc_msgSend(v62, "layoutName");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      v67 = objc_msgSend(v56, "containsObject:", v66);

                      if ((v67 & 1) == 0)
                      {
                        objc_msgSend(v62, "layoutName");
                        v68 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v68, "description");
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v56, "addObject:", v69);

                      }
                    }
                    v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
                  }
                  while (v59);
                }

                v70 = -[AutocorrectionTestHarness initWithAttributes:]([AutocorrectionTestHarness alloc], "initWithAttributes:", v98);
                objc_msgSend(v90, "metadata");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = (void *)objc_msgSend(v71, "mutableCopy");

                objc_msgSend(v72, "setValue:forKey:", v56, CFSTR("layouts"));
                TTKLogFacility();
                v73 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("recordIdentifier"));
                  v74 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v75 = objc_msgSend(v74, "cStringUsingEncoding:", 4);
                  *(_DWORD *)buf = 136315138;
                  v108 = v75;
                  _os_log_impl(&dword_22FA56000, v73, OS_LOG_TYPE_INFO, "Running test case with recordIdentifier: %s", buf, 0xCu);

                }
                v76 = (FILE *)*MEMORY[0x24BDAC8E8];
                objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("recordIdentifier"));
                v77 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                fprintf(v76, "Running test case with recordIdentifier: %s\n", (const char *)objc_msgSend(v77, "cStringUsingEncoding:", 4));

                +[AutocorrectionTest testWithInput:expectedOutput:sourceMetadata:withTouches:andCorpusId:](AutocorrectionTest, "testWithInput:expectedOutput:sourceMetadata:withTouches:andCorpusId:", &stru_24FD49B78, v55, v72, 0, 0);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = v97;
                -[AutocorrectionTestHarness runTest:trialID:withError:](v70, "runTest:trialID:withError:", v78, v97, 0);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "logResult:", v79);
                v18 = v93;
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  -[AutocorrectionTestHarness performSelector:withObject:](v70, "performSelector:withObject:", sel_reset, 0);
                objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.05);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "runUntilDate:", v81);

                if (-[AutocorrectionTestHarness requiresMaintenance](v70, "requiresMaintenance"))
                {
                  objc_msgSend(MEMORY[0x24BEB53E0], "flushDynamicLearningCaches");
                  v20 = v97;
                  objc_msgSend(MEMORY[0x24BEB53E0], "performMaintenance");
                }

                v35 = 0;
                v10 = v85;
                v9 = v86;
                v27 = v89;
                v17 = v90;
                v19 = v94;
                v23 = v96;
                v24 = v98;
                goto LABEL_52;
              }
            }
            else
            {

            }
            if (v92)
            {
              v52 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v92, "keyboardWidth");
              objc_msgSend(v52, "numberWithFloat:");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "keyboardOrientation");
              v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
              goto LABEL_32;
            }
            objc_opt_class();
            v27 = v89;
            v19 = v94;
            v24 = v98;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              fwrite("Unable to find keyboard layout-- layoutName is null\n", 0x34uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
            else
              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Unable to find keyboard layout for name='%s'\n", (const char *)objc_msgSend(objc_retainAutorelease(v89), "UTF8String"));
            v35 = 2;
LABEL_52:

            goto LABEL_53;
          }
          v35 = 2;
LABEL_53:

LABEL_54:
          objc_autoreleasePoolPop(v23);
          if (!v35 && (int)v95 >= 1 && v20 >= v95)
            break;
        }
      }
      objc_msgSend(v9, "getNextTestCase");
      v82 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v82;
    }
    while (v82);
  }
  objc_msgSend(v91, "endLogTrial");
  objc_msgSend(v91, "reportForTrial:", 0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v84)
    v84[2](v84, v83, 0);

}

@end
