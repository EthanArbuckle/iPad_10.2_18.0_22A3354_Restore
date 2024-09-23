@implementation TITraceLogParser

- (void)parseTraceLogContent:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3900];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithString:", v5);

  objc_msgSend(v6, "setCharactersToBeSkipped:", 0);
  -[TITraceLogParser parseTraceLogHeaderWithScanner:](self, "parseTraceLogHeaderWithScanner:", v6);
  -[TITraceLogParser parseTraceRecordsWithScanner:](self, "parseTraceRecordsWithScanner:", v6);

}

- (void)parseTraceLogHeaderWithScanner:(id)a3
{
  id v4;
  _BOOL4 v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  if (-[TITraceLogParser parseIntegerHeader:headerValue:withScanner:](self, "parseIntegerHeader:headerValue:withScanner:", CFSTR("Version: "), &v12, v4))
  {
    -[TITraceLogParser setVersion:](self, "setVersion:", v12);
  }
  v5 = -[TITraceLogParser parseStringHeader:headerValue:withScanner:](self, "parseStringHeader:headerValue:withScanner:", CFSTR("Date: "), 0, v4);
  v6 = -[TITraceLogParser version](self, "version");
  v7 = v6;
  if (v5)
  {
    if (v6 <= 1)
      v7 = 1;
    -[TITraceLogParser setVersion:](self, "setVersion:", v7);
    -[TITraceLogParser parseStringHeader:headerValue:withScanner:](self, "parseStringHeader:headerValue:withScanner:", CFSTR("iOS version: "), 0, v4);
  }
  else
  {
    -[TITraceLogParser setVersion:](self, "setVersion:", v6);
  }
  objc_msgSend(v4, "scanUpToString:intoString:", CFSTR("RECORD ID: "), 0);
  -[TITraceLogParser delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TITraceLogParser delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("Version");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TITraceLogParser version](self, "version"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "traceHeaderParsed:", v11);

  }
}

- (BOOL)parseStringHeader:(id)a3 headerValue:(id *)a4 withScanner:(id)a5
{
  id v7;
  int v8;

  v7 = a5;
  v8 = objc_msgSend(v7, "scanString:intoString:", a3, 0);
  if (v8)
  {
    objc_msgSend(v7, "scanUpToString:intoString:", CFSTR("\n"), a4);
    objc_msgSend(v7, "scanString:intoString:", CFSTR("\n"), 0);
  }

  return v8;
}

- (BOOL)parseIntegerHeader:(id)a3 headerValue:(int64_t *)a4 withScanner:(id)a5
{
  id v7;
  int v8;

  v7 = a5;
  v8 = objc_msgSend(v7, "scanString:intoString:", a3, 0);
  if (v8)
  {
    objc_msgSend(v7, "scanInteger:", a4);
    objc_msgSend(v7, "scanString:intoString:", CFSTR("\n"), 0);
  }

  return v8;
}

- (void)parseTraceRecordsWithScanner:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "scanString:intoString:", CFSTR("RECORD ID: "), 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isAtEnd") & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    do
    {
      -[TITraceLogParser parseTraceRecordWithScanner:andPriorContext:](self, "parseTraceRecordWithScanner:andPriorContext:", v6, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "scanString:intoString:", CFSTR("RECORD ID: "), 0);
      v4 = v5;
    }
    while (!objc_msgSend(v6, "isAtEnd"));
  }

}

- (id)extractBeamSearchContextStringFromLogText:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3900];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

  v6 = 0;
  if (objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("CONTEXT: "), 0))
  {
    v8 = 0;
    objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("INPUT NODE:"), &v8);
    v6 = v8;
  }

  return v6;
}

- (id)convertStringToContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  TITraceLogRecordContextEntry *v18;
  void *v19;
  void *v21;
  void *v22;
  id v23;
  id v24;

  v3 = a3;
  if (objc_msgSend(v3, "containsString:", CFSTR("CONTEXT: ")))
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("("));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3900];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scannerWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "scanString:intoString:", CFSTR("CONTEXT: "), 0);
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(")\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3900];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scannerWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isAtEnd") & 1) == 0)
    {
      v21 = v8;
      v22 = v4;
      v14 = 0;
      v15 = 0;
      while ((objc_msgSend(v12, "isAtEnd", v21, v22) & 1) == 0)
      {
        v24 = v15;
        objc_msgSend(v7, "scanUpToString:intoString:", CFSTR(" "), &v24);
        v16 = v24;

        v23 = v14;
        objc_msgSend(v12, "scanUpToString:intoString:", CFSTR(" "), &v23);
        v17 = v23;

        v18 = -[TITraceLogRecordContextEntry initWithToken:wordID:]([TITraceLogRecordContextEntry alloc], "initWithToken:wordID:", v16, v17);
        objc_msgSend(v13, "addObject:", v18);

        v14 = v17;
        v15 = v16;
        if (objc_msgSend(v7, "isAtEnd"))
          goto LABEL_9;
      }
      v16 = v15;
      v17 = v14;
LABEL_9:

      v8 = v21;
      v4 = v22;
    }
    v19 = (void *)objc_msgSend(v13, "copy");

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)parseTraceLogContextFromLogText:(id)a3 andPriorContext:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[TITraceLogParser extractBeamSearchContextStringFromLogText:](self, "extractBeamSearchContextStringFromLogText:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (-[TITraceLogParser convertStringToContext:](self, "convertStringToContext:", v7),
        (v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = v6;
  }

  return v8;
}

- (id)parseTraceRecordWithScanner:(id)a3 andPriorContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  TITraceLogRecord *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;

  v6 = a4;
  v18 = 0;
  v7 = a3;
  objc_msgSend(v7, "scanUpToString:intoString:", CFSTR("\n\n"), &v18);
  v8 = v18;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
  objc_msgSend(v7, "scanString:intoString:", CFSTR("\n\n"), 0);
  v17 = 0;
  objc_msgSend(v7, "scanUpToString:intoString:", CFSTR("RECORD ID: "), &v17);

  v10 = v17;
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "length") - 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v11;
  }
  -[TITraceLogParser parseTraceLogContextFromLogText:andPriorContext:](self, "parseTraceLogContextFromLogText:andPriorContext:", v10, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TITraceLogRecord initWithRecordUUID:context:logText:logVersion:]([TITraceLogRecord alloc], "initWithRecordUUID:context:logText:logVersion:", v9, v12, v10, -[TITraceLogParser version](self, "version"));
  -[TITraceLogParser delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TITraceLogParser delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "traceRecordParsed:", v13);

  }
  return v12;
}

- (TITraceLogParsingDelegate)delegate
{
  return (TITraceLogParsingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
