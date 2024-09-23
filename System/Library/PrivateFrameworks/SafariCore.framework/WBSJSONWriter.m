@implementation WBSJSONWriter

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", "\n", 1, 0);
  v3 = (void *)newLineData;
  newLineData = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", "null", 4, 0);
  v5 = (void *)nullLiteralData;
  nullLiteralData = v4;

}

- (WBSJSONWriter)initWithOutputStream:(id)a3
{
  return -[WBSJSONWriter initWithOutputStream:options:](self, "initWithOutputStream:options:", a3, 0);
}

- (WBSJSONWriter)initWithOutputStream:(id)a3 options:(unint64_t)a4
{
  id v7;
  WBSJSONWriter *v8;
  WBSJSONWriter *v9;
  uint64_t v10;
  NSMutableArray *stateStack;
  WBSJSONWriter *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSJSONWriter;
  v8 = -[WBSJSONWriter init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_outputStream, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    stateStack = v9->_stateStack;
    v9->_stateStack = (NSMutableArray *)v10;

    v9->_options = a4;
    v12 = v9;
  }

  return v9;
}

- (WBSJSONWriter)initWithFileHandle:(id)a3
{
  return -[WBSJSONWriter initWithFileHandle:options:](self, "initWithFileHandle:options:", a3, 0);
}

- (WBSJSONWriter)initWithFileHandle:(id)a3 options:(unint64_t)a4
{
  id v7;
  WBSJSONWriter *v8;
  WBSJSONWriter *v9;
  uint64_t v10;
  NSMutableArray *stateStack;
  WBSJSONWriter *v12;
  objc_super v14;

  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSJSONWriter;
  v8 = -[WBSJSONWriter init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fileHandle, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    stateStack = v9->_stateStack;
    v9->_stateStack = (NSMutableArray *)v10;

    v9->_options = a4;
    v12 = v9;
  }

  return v9;
}

- (int64_t)currentDepth
{
  return -[NSMutableArray count](self->_stateStack, "count");
}

- (int64_t)currentEntryKind
{
  void *v3;
  int64_t v4;
  id v6;

  if (!-[NSMutableArray count](self->_stateStack, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("No entry"), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  -[NSMutableArray lastObject](self->_stateStack, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "kind");

  return v4;
}

- (BOOL)beginObjectWithError:(id *)a3
{
  _BOOL4 v5;
  NSMutableArray *stateStack;
  _WBSJSONEntryState *v7;

  v5 = -[WBSJSONWriter _checkHasNoRootWithError:](self, "_checkHasNoRootWithError:");
  if (v5)
  {
    v5 = -[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", "{", a3);
    if (v5)
    {
      stateStack = self->_stateStack;
      v7 = -[_WBSJSONEntryState initWithKind:]([_WBSJSONEntryState alloc], "initWithKind:", 0);
      -[NSMutableArray addObject:](stateStack, "addObject:", v7);

      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)addEntry:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  -[WBSJSONWriter _currentEntryStateOfKind:error:](self, "_currentEntryStateOfKind:error:", 0, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && -[WBSJSONWriter _checkCurrentState:doesNotContainKey:error:](self, "_checkCurrentState:doesNotContainKey:error:", v10, v9, a5))
  {
    -[WBSJSONWriter _dataForJSONObject:error:](self, "_dataForJSONObject:error:", v8, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && -[WBSJSONWriter _writeCommaIfNeededForState:error:](self, "_writeCommaIfNeededForState:error:", v10, a5))
    {
      if ((self->_options & 1) != 0)
      {
        if (-[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", "\n", a5))
        {
          -[WBSJSONWriter _prefixStringForCurrentDepth](self, "_prefixStringForCurrentDepth");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[WBSJSONWriter _writeString:error:](self, "_writeString:error:", v13, a5)
            && -[WBSJSONWriter _writeObjectKey:error:](self, "_writeObjectKey:error:", v9, a5)
            && -[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", " : ", a5))
          {
            objc_msgSend(v10, "addKey:", v9);
            v12 = -[WBSJSONWriter _writePrettyPrintedData:forEntry:error:](self, "_writePrettyPrintedData:forEntry:error:", v11, v8, a5);
          }
          else
          {
            v12 = 0;
          }

          goto LABEL_16;
        }
      }
      else if (-[WBSJSONWriter _writeObjectKey:error:](self, "_writeObjectKey:error:", v9, a5)
             && -[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", ":", a5))
      {
        objc_msgSend(v10, "addKey:", v9);
        v12 = -[WBSJSONWriter _writeData:error:](self, "_writeData:error:", v11, a5);
LABEL_16:

        goto LABEL_17;
      }
    }
    v12 = 0;
    goto LABEL_16;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)beginObjectForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  BOOL v9;
  char *v11;
  NSMutableArray *stateStack;
  _WBSJSONEntryState *v13;

  v6 = a3;
  -[WBSJSONWriter _currentEntryStateOfKind:error:](self, "_currentEntryStateOfKind:error:", 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && -[WBSJSONWriter _checkCurrentState:doesNotContainKey:error:](self, "_checkCurrentState:doesNotContainKey:error:", v7, v6, a4)&& -[WBSJSONWriter _writeCommaIfNeededForState:error:](self, "_writeCommaIfNeededForState:error:", v7, a4))
  {
    if ((self->_options & 1) != 0)
    {
      objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", (2 * -[WBSJSONWriter currentDepth](self, "currentDepth")) | 1, CFSTR(" "), 0);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!-[WBSJSONWriter _writeString:error:](self, "_writeString:error:", v8, a4))
        goto LABEL_15;
    }
    else
    {
      v8 = &stru_1E64A2498;
    }
    if (-[WBSJSONWriter _writeObjectKey:error:](self, "_writeObjectKey:error:", v6, a4))
    {
      v11 = (self->_options & 1) != 0 ? " : {" : ":{";
      if (-[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", v11, a4))
      {
        objc_msgSend(v7, "addKey:", v6);
        stateStack = self->_stateStack;
        v13 = -[_WBSJSONEntryState initWithKind:]([_WBSJSONEntryState alloc], "initWithKind:", 0);
        -[NSMutableArray addObject:](stateStack, "addObject:", v13);

        v9 = 1;
LABEL_16:

        goto LABEL_7;
      }
    }
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (BOOL)beginArrayForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  NSMutableArray *stateStack;
  BOOL v10;
  _WBSJSONEntryState *v11;
  void *v12;
  _BOOL4 v13;

  v6 = a3;
  -[WBSJSONWriter _currentEntryStateOfKind:error:](self, "_currentEntryStateOfKind:error:", 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && -[WBSJSONWriter _checkCurrentState:doesNotContainKey:error:](self, "_checkCurrentState:doesNotContainKey:error:", v7, v6, a4)&& -[WBSJSONWriter _writeCommaIfNeededForState:error:](self, "_writeCommaIfNeededForState:error:", v7, a4)&& ((self->_options & 1) == 0|| -[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", "\n", a4)&& (-[WBSJSONWriter _prefixStringForCurrentDepth](self, "_prefixStringForCurrentDepth"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v13 = -[WBSJSONWriter _writeString:error:](self, "_writeString:error:", v12, a4), v12, v13))&& -[WBSJSONWriter _writeObjectKey:error:](self, "_writeObjectKey:error:", v6, a4)&& ((self->_options & 1) != 0 ? (v8 = " : [") : (v8 = ":["), -[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", v8, a4)))
  {
    objc_msgSend(v7, "addKey:", v6);
    stateStack = self->_stateStack;
    v10 = 1;
    v11 = -[_WBSJSONEntryState initWithKind:]([_WBSJSONEntryState alloc], "initWithKind:", 1);
    -[NSMutableArray addObject:](stateStack, "addObject:", v11);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)beginArrayWithError:(id *)a3
{
  NSMutableArray *stateStack;
  BOOL v6;
  _WBSJSONEntryState *v7;

  if (!-[WBSJSONWriter _checkHasNoRootWithError:](self, "_checkHasNoRootWithError:")
    || !-[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", "[", a3))
  {
    return 0;
  }
  stateStack = self->_stateStack;
  v6 = 1;
  v7 = -[_WBSJSONEntryState initWithKind:]([_WBSJSONEntryState alloc], "initWithKind:", 1);
  -[NSMutableArray addObject:](stateStack, "addObject:", v7);

  return v6;
}

- (BOOL)appendEntry:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;

  v6 = a3;
  -[WBSJSONWriter _currentEntryStateOfKind:error:](self, "_currentEntryStateOfKind:error:", 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[WBSJSONWriter _dataForJSONObject:error:](self, "_dataForJSONObject:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && -[WBSJSONWriter _writeCommaIfNeededForState:error:](self, "_writeCommaIfNeededForState:error:", v7, a4))
    {
      if ((self->_options & 1) == 0)
      {
        objc_msgSend(v7, "addEntry");
        v9 = -[WBSJSONWriter _writeData:error:](self, "_writeData:error:", v8, a4);
LABEL_9:
        v10 = v9;
LABEL_11:

        goto LABEL_12;
      }
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[WBSJSONWriter _prefixStringForCurrentDepth](self, "_prefixStringForCurrentDepth");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("\n%@"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[WBSJSONWriter _writeString:error:](self, "_writeString:error:", v13, a4);

      if (v14)
      {
        objc_msgSend(v7, "addEntry");
        v9 = -[WBSJSONWriter _writePrettyPrintedData:forEntry:error:](self, "_writePrettyPrintedData:forEntry:error:", v8, v6, a4);
        goto LABEL_9;
      }
    }
    v10 = 0;
    goto LABEL_11;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (BOOL)appendAndBeginObjectWithError:(id *)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSMutableArray *stateStack;
  _WBSJSONEntryState *v9;
  BOOL v10;

  -[WBSJSONWriter _currentEntryStateOfKind:error:](self, "_currentEntryStateOfKind:error:", 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && -[WBSJSONWriter _writeCommaIfNeededForState:error:](self, "_writeCommaIfNeededForState:error:", v5, a3)
    && ((self->_options & 1) == 0
     || -[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", "\n", a3)
     && (-[WBSJSONWriter _prefixStringForCurrentDepth](self, "_prefixStringForCurrentDepth"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v7 = -[WBSJSONWriter _writeString:error:](self, "_writeString:error:", v6, a3),
         v6,
         v7))
    && -[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", "{", a3))
  {
    objc_msgSend(v5, "addEntry");
    stateStack = self->_stateStack;
    v9 = -[_WBSJSONEntryState initWithKind:]([_WBSJSONEntryState alloc], "initWithKind:", 0);
    -[NSMutableArray addObject:](stateStack, "addObject:", v9);

    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)appendAndBeginArrayWithError:(id *)a3
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSMutableArray *stateStack;
  BOOL v9;
  _WBSJSONEntryState *v10;

  -[WBSJSONWriter _currentEntryStateOfKind:error:](self, "_currentEntryStateOfKind:error:", 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && -[WBSJSONWriter _writeCommaIfNeededForState:error:](self, "_writeCommaIfNeededForState:error:", v5, a3)
    && ((self->_options & 1) == 0
     || -[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", "\n", a3)
     && (-[WBSJSONWriter _prefixStringForCurrentDepth](self, "_prefixStringForCurrentDepth"),
         v6 = (void *)objc_claimAutoreleasedReturnValue(),
         v7 = -[WBSJSONWriter _writeString:error:](self, "_writeString:error:", v6, a3),
         v6,
         v7))
    && -[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", "[", a3))
  {
    objc_msgSend(v5, "addEntry");
    stateStack = self->_stateStack;
    v9 = 1;
    v10 = -[_WBSJSONEntryState initWithKind:]([_WBSJSONEntryState alloc], "initWithKind:", 1);
    -[NSMutableArray addObject:](stateStack, "addObject:", v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)closeCurrentEntryWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray lastObject](self->_stateStack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((self->_options & 1) != 0)
    {
      if (!objc_msgSend(v5, "numberOfEntries")
        && !-[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", "\n", a3))
      {
        goto LABEL_16;
      }
      if (!-[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", "\n", a3))
        goto LABEL_16;
      -[NSMutableArray removeLastObject](self->_stateStack, "removeLastObject");
      -[WBSJSONWriter _prefixStringForCurrentDepth](self, "_prefixStringForCurrentDepth");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_stateStack, "addObject:", v6);
      v12 = -[WBSJSONWriter _writeString:error:](self, "_writeString:error:", v11, a3);

      if (!v12)
        goto LABEL_16;
    }
    v7 = objc_msgSend(v6, "kind");
    if (v7)
    {
      if (v7 == 1
        && !-[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", "]", a3))
      {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    if (-[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", "}", a3))
    {
LABEL_15:
      -[NSMutableArray removeLastObject](self->_stateStack, "removeLastObject");
      LOBYTE(a3) = 1;
      goto LABEL_17;
    }
LABEL_16:
    LOBYTE(a3) = 0;
    goto LABEL_17;
  }
  if (a3)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D80];
    v14[0] = *MEMORY[0x1E0CB2D50];
    v14[1] = v9;
    v15[0] = CFSTR("JSON serialization was not started");
    v15[1] = CFSTR("Call -beginObjectWithError: or -beginArrayWithError: first.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Safari.Core.WBSJSONWriterErrorDomain"), 1, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
LABEL_17:

  return (char)a3;
}

- (BOOL)finishEncodingWithError:(id *)a3
{
  _BOOL4 v5;

  do
    v5 = -[WBSJSONWriter closeCurrentEntryWithError:](self, "closeCurrentEntryWithError:", a3);
  while (v5 && -[NSMutableArray count](self->_stateStack, "count"));
  return v5;
}

- (BOOL)_checkHasNoRootWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = -[NSMutableArray count](self->_stateStack, "count");
  v5 = v4;
  if (a3 && v4)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = CFSTR("JSON serialization has already started");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Safari.Core.WBSJSONWriterErrorDomain"), 2, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5 == 0;
}

- (BOOL)_checkCurrentState:(id)a3 doesNotContainKey:(id)a4 error:(id *)a5
{
  id v7;
  int v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = objc_msgSend(a3, "containsKey:", v7);
  v9 = v8;
  if (a5 && v8)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' was already added to the current object"), v7, *MEMORY[0x1E0CB2D50]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Safari.Core.WBSJSONWriterErrorDomain"), 5, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 ^ 1;
}

- (id)_currentEntryStateOfKind:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  -[NSMutableArray lastObject](self->_stateStack, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    if (!a4)
      goto LABEL_13;
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D80];
    v22[0] = *MEMORY[0x1E0CB2D50];
    v22[1] = v9;
    v23[0] = CFSTR("JSON serialization was not started");
    v23[1] = CFSTR("Call -beginObjectWithError: or -beginArrayWithError: first.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    v12 = 1;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "kind") != a3)
  {
    if (!a4)
      goto LABEL_13;
    if (a3)
    {
      if (a3 != 1)
      {
LABEL_12:
        a4 = 0;
        goto LABEL_13;
      }
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2D80];
      v20[0] = *MEMORY[0x1E0CB2D50];
      v20[1] = v14;
      v21[0] = CFSTR("Expecting an object entry and got an array entry");
      v21[1] = CFSTR("Call -addEntry:forKey:error: or -beginObjectForKey:error:, or -beginArrayForKey:error: instead.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v13;
      v12 = 4;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D80];
      v18[0] = *MEMORY[0x1E0CB2D50];
      v18[1] = v16;
      v19[0] = CFSTR("Expecting an array entry and got an object entry");
      v19[1] = CFSTR("Call -appendEntry:error: or -appendAndBeginObjectWithError:, or -appendAndBeginArrayWithError: instead.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;
      v12 = 3;
    }
LABEL_11:
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Safari.Core.WBSJSONWriterErrorDomain"), v12, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  a4 = v7;
LABEL_13:

  return a4;
}

- (BOOL)_writeCommaIfNeededForState:(id)a3 error:(id *)a4
{
  return !objc_msgSend(a3, "numberOfEntries")
      || -[WBSJSONWriter _writeConstantASCIIString:error:](self, "_writeConstantASCIIString:error:", ",", a4);
}

- (id)_prefixStringForCurrentDepth
{
  int64_t v2;
  CFIndex v3;
  __CFString *Mutable;

  v2 = -[WBSJSONWriter currentDepth](self, "currentDepth");
  if (v2)
  {
    v3 = 2 * v2;
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2 * v2);
    CFStringPad(Mutable, CFSTR(" "), v3, 0);
  }
  else
  {
    Mutable = &stru_1E64A2498;
  }
  return Mutable;
}

- (BOOL)_writePrettyPrintedData:(id)a3 forEntry:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  BOOL v21;

  v8 = a3;
  v9 = a4;
  -[WBSJSONWriter _prefixStringForCurrentDepth](self, "_prefixStringForCurrentDepth");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v9, "count"))
    {
      v11 = objc_msgSend(v8, "length");
      if (v11)
      {
        v12 = 0;
        while (1)
        {
          v13 = objc_msgSend(v8, "rangeOfData:options:range:", newLineData, 0, v12, v11);
          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
            break;
          v15 = v13 + v14;
          objc_msgSend(v8, "subdataWithRange:", v12, v13 + v14 - v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[WBSJSONWriter _writeData:error:](self, "_writeData:error:", v16, a5);

          if (!v17 || !-[WBSJSONWriter _writeString:error:](self, "_writeString:error:", v10, a5))
          {
            v19 = 0;
            goto LABEL_20;
          }
          v18 = objc_msgSend(v8, "length");
          v12 = v15;
          v11 = v18 - v15;
          if (v18 == v15)
            goto LABEL_18;
        }
        v15 = v12;
      }
      else
      {
        v15 = 0;
      }
LABEL_18:
      objc_msgSend(v8, "subdataWithRange:", v15, v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[WBSJSONWriter _writeData:error:](self, "_writeData:error:", v20, a5);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[\n\n%@]"), v10);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{\n\n%@}"), v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[WBSJSONWriter _writeString:error:](self, "_writeString:error:", v20, a5);
    }
    v19 = v21;

  }
  else
  {
    v19 = -[WBSJSONWriter _writeData:error:](self, "_writeData:error:", v8, a5);
  }
LABEL_20:

  return v19;
}

- (id)_dataForJSONObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  id v10;
  id v12[4];

  v12[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1B5E27154]();
    v8 = self->_options | 4;
    v12[0] = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, v8, v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v12[0];
    objc_autoreleasePoolPop(v7);
    if (a4)
      *a4 = objc_retainAutorelease(v10);

  }
  else
  {
    v9 = (id)nullLiteralData;
  }

  return v9;
}

- (BOOL)_writeObjectKey:(id)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;

  -[WBSJSONWriter _dataForJSONObject:error:](self, "_dataForJSONObject:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[WBSJSONWriter _writeData:error:](self, "_writeData:error:", v6, a4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)_writeString:(id)a3 error:(id *)a4
{
  __CFString *v6;
  const char *CStringPtr;
  BOOL v8;
  CFDataRef ExternalRepresentation;

  v6 = (__CFString *)a3;
  CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
  if (CStringPtr || (CStringPtr = CFStringGetCStringPtr(v6, 0x8000100u)) != 0)
  {
    v8 = -[WBSJSONWriter _writeBuffer:length:error:](self, "_writeBuffer:length:error:", CStringPtr, strlen(CStringPtr), a4);
  }
  else
  {
    ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, 0x8000100u, 0);
    v8 = -[WBSJSONWriter _writeData:error:](self, "_writeData:error:", ExternalRepresentation, a4);

  }
  return v8;
}

- (BOOL)_writeConstantASCIIString:(const char *)a3 error:(id *)a4
{
  return -[WBSJSONWriter _writeBuffer:length:error:](self, "_writeBuffer:length:error:", a3, strlen(a3), a4);
}

- (BOOL)_writeData:(id)a3 error:(id *)a4
{
  NSFileHandle *fileHandle;
  id v6;
  BOOL v7;
  id v10;
  uint64_t v11;
  uint64_t v12;

  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    v6 = a3;
    v7 = -[NSFileHandle writeData:error:](fileHandle, "writeData:error:", v6, a4);

    return v7;
  }
  else
  {
    v10 = objc_retainAutorelease(a3);
    v11 = objc_msgSend(v10, "bytes");
    v12 = objc_msgSend(v10, "length");

    return -[WBSJSONWriter _writeBuffer:length:error:](self, "_writeBuffer:length:error:", v11, v12, a4);
  }
}

- (BOOL)_writeBuffer:(const char *)a3 length:(int64_t)a4 error:(id *)a5
{
  int64_t v6;
  const char *v7;
  NSFileHandle *fileHandle;
  id v10;
  BOOL result;
  NSInteger v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v6 = a4;
  v7 = a3;
  v17[1] = *MEMORY[0x1E0C80C00];
  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    if (write(-[NSFileHandle fileDescriptor](fileHandle, "fileDescriptor"), a3, a4) == -1)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 512, 0);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        result = 0;
        *a5 = v10;
        return result;
      }
      return 0;
    }
    return 1;
  }
  if (!a4)
    return 1;
  while (-[NSOutputStream hasSpaceAvailable](self->_outputStream, "hasSpaceAvailable"))
  {
    v12 = -[NSOutputStream write:maxLength:](self->_outputStream, "write:maxLength:", v7, v6);
    v7 += v12;
    v6 -= v12;
    if (!v6)
      return 1;
  }
  if (a5)
  {
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("Cannot write more data to the output stream");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    -[NSOutputStream streamError](self->_outputStream, "streamError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CB3388]);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Safari.Core.WBSJSONWriterErrorDomain"), 6, v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateStack, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
}

@end
