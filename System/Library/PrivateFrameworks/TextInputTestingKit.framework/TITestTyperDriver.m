@implementation TITestTyperDriver

- (TITestTyperDriver)init
{
  return -[TITestTyperDriver initWithTestTyper:](self, "initWithTestTyper:", 0);
}

- (TITestTyperDriver)initWithTestTyper:(id)a3
{
  id v5;
  TITestTyperDriver *v6;
  TITestTyperDriver *v7;
  NSMutableArray *v8;
  NSMutableArray *failedTests;
  NSMutableArray *v10;
  NSMutableArray *syntaxErrors;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TITestTyperDriver;
  v6 = -[TITestTyperDriver init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_testTyper, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    failedTests = v7->_failedTests;
    v7->_failedTests = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    syntaxErrors = v7->_syntaxErrors;
    v7->_syntaxErrors = v10;

  }
  return v7;
}

- (BOOL)consumeTestFile:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    actDslin = (uint64_t)fopen((const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), "r");
    yy_start = 1;
    stringLen = 0;
    actDslparse(self);
    fclose((FILE *)actDslin);
  }
  else
  {
    actDslin = *MEMORY[0x24BDAC8E0];
    self->_debug = 1;
    printf("\n\n****** UNIT TEST CONSOLE *****\n\n==>");
    fflush((FILE *)*MEMORY[0x24BDAC8E8]);
    yy_start = 1;
    stringLen = 0;
    actDslparse(self);
  }
  actDslin = 0;

  return 1;
}

- (BOOL)consumeTextString:(id)a3
{
  TIKeyboardTyper *testTyper;
  id v5;
  id v6;
  char *v7;
  int v8;
  char *v9;
  uint64_t v10;
  BOOL result;

  testTyper = self->_testTyper;
  v5 = a3;
  -[TIKeyboardTyper reset](testTyper, "reset");
  yy_start = 1;
  stringLen = 0;
  v6 = objc_retainAutorelease(v5);
  v7 = (char *)objc_msgSend(v6, "UTF8String");

  v8 = strlen(v7);
  v9 = actDsl_scan_bytes(v7, v8);
  actDslparse(self);
  actDsl_delete_buffer((void **)v9);
  v10 = -[NSMutableArray count](self->_failedTests, "count");
  result = 0;
  if (!v10)
    return -[NSMutableArray count](self->_syntaxErrors, "count") == 0;
  return result;
}

- (void)reportFailedTest:(id)a3 lineNumber:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("line:%d, %@"), v4, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_debug)
    NSLog(CFSTR("failed test: %@\n"), v7);
  else
    -[NSMutableArray addObject:](self->_failedTests, "addObject:", v6);

}

- (void)reportSyntaxErrors:(id)a3 lineNumber:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("line:%d, %@"), v4, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_debug)
    NSLog(CFSTR("error: %@\n"), v7);
  else
    -[NSMutableArray addObject:](self->_syntaxErrors, "addObject:", v6);

}

- (void)handleTyping:(id)a3
{
  -[TIKeyboardTyper attemptToTypeText:](self->_testTyper, "attemptToTypeText:", a3);
}

- (void)handleNewLine
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  -[TIKeyboardTyper text](self->_testTyper, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (self->_debug)
  {
    if (objc_msgSend(v3, "length"))
    {
      v4 = objc_retainAutorelease(v7);
      printf("text: %s\n", (const char *)objc_msgSend(v4, "UTF8String"));
      if ((objc_msgSend(v4, "hasSuffix:", CFSTR(" ")) & 1) == 0)
      {
        -[TIKeyboardTyper autocorrection](self->_testTyper, "autocorrection");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "candidate");
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        printf("corr: %s\n", (const char *)objc_msgSend(v6, "UTF8String"));

      }
    }
    -[TIKeyboardTyper reset](self->_testTyper, "reset");
    printf("==> ");
  }
  else
  {
    -[TITestTyperDriver handleTyping:](self, "handleTyping:", CFSTR("\n"));
  }

}

- (void)handleDocumentMatch:(id)a3 lineNumber:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  -[TIKeyboardTyper text](self->_testTyper, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasSuffix:", v8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expected text '%@' got '%@'"), v8, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITestTyperDriver reportFailedTest:lineNumber:](self, "reportFailedTest:lineNumber:", v7, v4);

  }
}

- (void)handlePredictionMatch:(id)a3 lineNumber:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  if (!-[TIKeyboardTyper hasPrediction:](self->_testTyper, "hasPrediction:"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expected prediction '%@'"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITestTyperDriver reportFailedTest:lineNumber:](self, "reportFailedTest:lineNumber:", v6, v4);

  }
}

- (void)handleCorrectionMatch:(id)a3 lineNumber:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = *(_QWORD *)&a4;
  v13 = a3;
  -[TIKeyboardTyper autocorrection](self->_testTyper, "autocorrection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v13);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[TIKeyboardTyper autocorrection](self->_testTyper, "autocorrection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "candidate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("expected autocorrection '%@' got '%@'"), v13, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITestTyperDriver reportFailedTest:lineNumber:](self, "reportFailedTest:lineNumber:", v12, v4);

  }
}

- (void)handleCommand:(id)a3 withValue:(id)a4 lineNumber:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  v10 = a3;
  v8 = a4;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("shift")))
  {
    -[TIKeyboardTyper attemptToShift](self->_testTyper, "attemptToShift");
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("delete")))
  {
    -[TIKeyboardTyper attemptToDelete](self->_testTyper, "attemptToDelete");
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("reset")))
  {
    -[TIKeyboardTyper reset](self->_testTyper, "reset");
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("reject")))
  {
    -[TIKeyboardTyper rejectAutocorrection](self->_testTyper, "rejectAutocorrection");
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("accept")))
  {
    -[TIKeyboardTyper acceptAutocorrection](self->_testTyper, "acceptAutocorrection");
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("sync")))
  {
    -[TIKeyboardTyper syncToEmptyDocument](self->_testTyper, "syncToEmptyDocument");
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("print")))
  {
    -[TITestTyperDriver printDebugInfo:lineNumber:](self, "printDebugInfo:lineNumber:", v8, v5);
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("select")))
  {
    -[TITestTyperDriver selectFromPredictionBar:lineNumber:](self, "selectFromPredictionBar:lineNumber:", v8, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown command %@"), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITestTyperDriver reportSyntaxErrors:lineNumber:](self, "reportSyntaxErrors:lineNumber:", v9, v5);

  }
}

- (BOOL)handleBoolConfig:(id)a3 withValue:(BOOL)a4 lineNumber:(int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v8;
  BOOL v9;
  void *v11;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("wordLearningEnabled")))
  {
    -[TIKeyboardTyper setWordLearningEnabled:](self->_testTyper, "setWordLearningEnabled:", v6);
LABEL_6:
    -[TIKeyboardTyper reset](self->_testTyper, "reset");
    goto LABEL_7;
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("usesPrediction")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("generateMultipleCandidates")))
  {
    -[TIKeyboardTyper setUsesPrediction:](self->_testTyper, "setUsesPrediction:", v6);
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("usesAutocapitalization")))
  {
    -[TIKeyboardTyper setUsesAutocapitalization:](self->_testTyper, "setUsesAutocapitalization:", v6);
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("hardwareKeyboardMode")))
  {
    -[TIKeyboardTyper setHardwareKeyboardMode:](self->_testTyper, "setHardwareKeyboardMode:", v6);
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("usesAutocorrection")))
  {
    -[TIKeyboardTyper setUsesAutocorrection:](self->_testTyper, "setUsesAutocorrection:", v6);
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("shouldSkipCandidateSelection")))
  {
    -[TIKeyboardTyper setShouldSkipCandidateSelection:](self->_testTyper, "setShouldSkipCandidateSelection:", v6);
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("bisonDebug")))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("line:%d, %@ is not recognized BOOLean configuration"), v5, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_syntaxErrors, "addObject:", v11);

      v9 = 0;
      goto LABEL_8;
    }
    actDsldebug = v6;
  }
LABEL_7:
  v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)handleIntConfig:(id)a3 withValue:(int)a4 lineNumber:(int)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("line:%d, %@ is not recognized integer configuration"), *(_QWORD *)&a4, *(_QWORD *)&a5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_syntaxErrors, "addObject:", v6);

  return 0;
}

- (BOOL)handleStringConfig:(id)a3 withValue:(id)a4 lineNumber:(int)a5
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("line:%d, %@ is not recognized string configuration"), a4, *(_QWORD *)&a5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_syntaxErrors, "addObject:", v6);

  return 0;
}

- (void)printDebugInfo:(id)a3 lineNumber:(int)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!v5 || (objc_msgSend(v5, "isEqualToString:", CFSTR("all")) & 1) != 0)
  {
    -[TIKeyboardTyper text](self->_testTyper, "text");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("text: %s\n", (const char *)objc_msgSend(v7, "UTF8String"));

    -[TIKeyboardTyper autocorrection](self->_testTyper, "autocorrection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidate");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("autocorrection: %s\n", (const char *)objc_msgSend(v9, "UTF8String"));

LABEL_4:
    printf("predictions: ");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[TIKeyboardTyper predictions](self->_testTyper, "predictions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "candidate");
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          printf("%s, ", (const char *)objc_msgSend(v15, "UTF8String"));

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    putchar(10);
    goto LABEL_12;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("text")) & 1) != 0)
  {
    -[TIKeyboardTyper text](self->_testTyper, "text");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("text: %s\n", (const char *)objc_msgSend(v16, "UTF8String"));

  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("correction")))
  {
    -[TIKeyboardTyper autocorrection](self->_testTyper, "autocorrection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "candidate");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("autocorrection: %s\n", (const char *)objc_msgSend(v18, "UTF8String"));

  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("predictions")))
    goto LABEL_4;
LABEL_12:

}

- (void)selectFromPredictionBar:(id)a3 lineNumber:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[TIKeyboardTyper predictions](self->_testTyper, "predictions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "candidate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v6);

        if (v14)
        {
          -[TIKeyboardTyper acceptPredictiveCandidate:](self->_testTyper, "acceptPredictiveCandidate:", v12);
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unable to select prediction '%@'"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITestTyperDriver reportFailedTest:lineNumber:](self, "reportFailedTest:lineNumber:", v7, v4);
LABEL_11:

}

- (TIKeyboardTyper)testTyper
{
  return self->_testTyper;
}

- (void)setTestTyper:(id)a3
{
  objc_storeStrong((id *)&self->_testTyper, a3);
}

- (NSMutableArray)failedTests
{
  return self->_failedTests;
}

- (NSMutableArray)syntaxErrors
{
  return self->_syntaxErrors;
}

- (BOOL)isDebug
{
  return self->_debug;
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntaxErrors, 0);
  objc_storeStrong((id *)&self->_failedTests, 0);
  objc_storeStrong((id *)&self->_testTyper, 0);
}

@end
