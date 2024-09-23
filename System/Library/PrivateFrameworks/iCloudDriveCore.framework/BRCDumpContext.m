@implementation BRCDumpContext

+ (id)highlightedString:(id)a3 type:(int64_t)a4 context:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = v7;
  if (a5)
  {
    objc_msgSend(a5, "highlightedString:type:", v7, a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (id)stringFromThrottleState:(int)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", BRCPrettyPrintEnum());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && a3)
  {
    if (a3 == 1)
      v8 = 7;
    else
      v8 = 3;
    objc_msgSend(v5, "highlightedString:type:", v6, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v6;
  }
  v10 = v9;

  return v10;
}

+ (id)stringFromItemAsString:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = a4;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@>"), v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "highlightedString:type:", v9, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v5;
    v10 = v9;
  }

  return v10;
}

+ (id)nowDateFromContext:(id)a3
{
  if (a3)
    return *((id *)a3 + 3);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)nowFromContext:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a1, "nowDateFromContext:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v4 = brc_interval_to_nsec();

  return v4;
}

+ (id)stringFromItemID:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "debugItemIDStringWithVerbose:", objc_msgSend(v5, "verbose"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[BRCDumpContext stringFromItemAsString:context:](BRCDumpContext, "stringFromItemAsString:context:", v7, v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v7;
  }
  v9 = v8;

  return v9;
}

+ (id)stringFromOperationUUID:(unsigned __int8)a3[16] context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char out[40];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  memset(out, 0, 37);
  uuid_unparse(a3, out);
  if (v5)
  {
    out[8] = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%s)"), out);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCDumpContext highlightedString:type:context:](BRCDumpContext, "highlightedString:type:context:", v6, 5, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", out);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)stringFromErrorString:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    objc_msgSend(a4, "highlightedString:type:", v5, 3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

+ (id)stringFromError:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a4;
  objc_msgSend(a3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "highlightedString:type:", v6, 3);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

+ (id)stringFromDueDate:(id)a3 allowsPast:(BOOL)a4 context:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;

  v5 = a4;
  v8 = a5;
  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(a1, "stringFromDueStamp:allowsPast:context:", brc_interval_to_nsec(), v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)stringFromDueStamp:(int64_t)a3 allowsPast:(BOOL)a4 context:(id)a5
{
  _BOOL4 v5;
  id v7;
  int64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;

  v5 = a4;
  v7 = a5;
  v8 = +[BRCDumpContext nowFromContext:](BRCDumpContext, "nowFromContext:", v7);
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_2:
    v9 = CFSTR("never");
    if (!v7)
      goto LABEL_10;
LABEL_12:
    objc_msgSend(v7, "highlightedString:type:", v9, 6);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (v8 < a3)
  {
    brc_interval_from_nsec();
    +[BRCDumpContext stringFromInterval:context:](BRCDumpContext, "stringFromInterval:context:", v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_10;
    goto LABEL_12;
  }
  if (v5)
  {
    if (!a3)
      goto LABEL_2;
    v10 = (void *)MEMORY[0x24BDD17C8];
    brc_interval_from_nsec();
    +[BRCDumpContext stringFromInterval:context:](BRCDumpContext, "stringFromInterval:context:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ ago"), v11);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_12;
  }
  else
  {
    v9 = CFSTR("ready");
    if (v7)
      goto LABEL_12;
  }
LABEL_10:
  v12 = v9;
LABEL_13:
  v13 = v12;

  return v13;
}

+ (id)stringFromInterval:(double)a3 context:(id)a4
{
  double v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  const __CFString *v8;
  double v9;
  unint64_t v10;
  const __CFString *v11;
  unint64_t v12;
  unint64_t v13;

  v4 = fabs(a3);
  v5 = (unint64_t)v4;
  if ((unint64_t)v4 < 0xE10)
  {
    if (v5 < 0x3C)
    {
      v9 = v4 - (double)(unint64_t)v4;
      v10 = (unint64_t)(v9 * 1000.0);
      v8 = CFSTR("s");
      v11 = CFSTR("us");
      if (v10 <= 0xA)
      {
        v12 = (unint64_t)(v9 * 1000000.0) % 0x3E8;
      }
      else
      {
        v11 = CFSTR("ms");
        v12 = (unint64_t)(v9 * 1000.0);
      }
      if (v10 <= 0xA)
        v13 = 0;
      else
        v13 = (unint64_t)(v9 * 1000000.0) % 0x3E8;
      if (v5)
      {
        v6 = v5;
      }
      else
      {
        v8 = v11;
        v6 = v12;
      }
      if (v5)
        v7 = (unint64_t)(v9 * 1000.0);
      else
        v7 = v13;
    }
    else
    {
      v6 = v5 / 0x3C;
      v7 = (unsigned __int16)(1000 * ((unsigned __int16)v5 % 0x3Cu)) / 0x3Cu;
      v8 = CFSTR("m");
    }
  }
  else
  {
    v6 = v5 / 0xE10;
    v7 = 1000 * (v5 % 0xE10) / 0xE10;
    v8 = CFSTR("h");
  }
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu.%llu%@"), v6, (v7 + 5) / 0xA, v8);
}

+ (id)stringFromCount:(int64_t)a3 showActualCount:(BOOL)a4 suffix:(id)a5 isByteCount:(BOOL)a6 context:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  id v12;
  unint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  unint64_t v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  double v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  void *v29;

  v8 = a6;
  v9 = a4;
  v11 = a5;
  v12 = a7;
  if (a3 >= 0)
    v13 = a3;
  else
    v13 = -a3;
  if (v13 <= 0x3E7)
  {
    if (a3 >= 0)
      v14 = CFSTR("%lld %@");
    else
      v14 = CFSTR("-%lld %@");
    v15 = &stru_24FE4A790;
    if (v8)
      v15 = CFSTR("bytes");
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", v14, v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if (v13 > 0xF423F)
  {
    if (v13 >= 0x3B9ACA00)
    {
      v20 = (void *)MEMORY[0x24BDD16A8];
      if (v13 > 0x2540BE3FFLL)
      {
        if (a3 >= 0)
          v25 = CFSTR("%lld %@");
        else
          v25 = CFSTR("-%lld %@");
        v26 = CFSTR("GB");
        if (!v8)
          v26 = CFSTR("billions");
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", v25, v13 / 0x3B9ACA00, v26);
        goto LABEL_37;
      }
      if (a3 >= 0)
        v21 = CFSTR("%.2f %@");
      else
        v21 = CFSTR("-%.2f %@");
      v22 = (double)(uint64_t)v13 * 0.000000001;
      v23 = CFSTR("billion");
      v24 = CFSTR("GB");
    }
    else
    {
      v20 = (void *)MEMORY[0x24BDD16A8];
      if (a3 >= 0)
        v21 = CFSTR("%.1f %@");
      else
        v21 = CFSTR("-%.1f %@");
      v22 = (float)((float)(uint64_t)v13 * 0.000001);
      v23 = CFSTR("million");
      v24 = CFSTR("MB");
    }
    if (v8)
      v23 = v24;
    objc_msgSend(v20, "stringWithFormat:", v21, *(_QWORD *)&v22, v23);
  }
  else
  {
    if (a3 >= 0)
      v17 = CFSTR("%lld %@");
    else
      v17 = CFSTR("-%lld %@");
    v18 = v13 / 0x3E8uLL;
    v19 = CFSTR("thousand");
    if (v8)
      v19 = CFSTR("KB");
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", v17, v18, v19);
  }
LABEL_37:
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v27;
  if (v9)
    objc_msgSend(v27, "appendFormat:", CFSTR(" (%lld)"), a3);
LABEL_39:
  if (v11)
    objc_msgSend(v16, "appendString:", v11);
  if (v12)
  {
    objc_msgSend(v12, "highlightedString:type:", v16, 2);
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = v16;
  }
  v29 = v28;

  return v29;
}

+ (id)stringFromByteCount:(int64_t)a3 showActualByteCount:(BOOL)a4 suffix:(id)a5 context:(id)a6
{
  return (id)objc_msgSend(a1, "stringFromCount:showActualCount:suffix:isByteCount:context:", a3, a4, a5, 1, a6);
}

+ (id)stringFromByteCount:(int64_t)a3 context:(id)a4
{
  return (id)objc_msgSend(a1, "stringFromCount:showActualCount:suffix:isByteCount:context:", a3, 1, 0, 1, a4);
}

+ (id)stringFromCount:(int64_t)a3 context:(id)a4
{
  return (id)objc_msgSend(a1, "stringFromCount:showActualCount:suffix:isByteCount:context:", a3, 1, 0, 0, a4);
}

- (BRCDumpContext)initWithFile:(__sFILE *)a3 db:(id)a4
{
  id v7;
  BRCDumpContext *v8;
  BRCDumpContext *v9;
  NSString *indentationBaseString;
  uint64_t v11;
  NSDate *nowDate;
  uint64_t v13;
  BRCDumper *dumper;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BRCDumpContext;
  v8 = -[BRCDumpContext init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_fp = a3;
    objc_storeStrong((id *)&v8->_db, a4);
    indentationBaseString = v9->_indentationBaseString;
    v9->_indentationBaseString = (NSString *)CFSTR("    ");

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    nowDate = v9->_nowDate;
    v9->_nowDate = (NSDate *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE175E8]), "initWithFile:forceColor:", a3, 0);
    dumper = v9->_dumper;
    v9->_dumper = (BRCDumper *)v13;

    v9->_newLineAfterWrite = 1;
  }

  return v9;
}

- (BRCDumpContext)initWithDumper:(id)a3
{
  id v5;
  BRCDumpContext *v6;
  BRCDumpContext *v7;
  NSString *indentationBaseString;
  uint64_t v9;
  NSDate *nowDate;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCDumpContext;
  v6 = -[BRCDumpContext init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    indentationBaseString = v6->_indentationBaseString;
    v6->_indentationBaseString = (NSString *)CFSTR("    ");

    objc_storeStrong((id *)&v7->_dumper, a3);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = objc_claimAutoreleasedReturnValue();
    nowDate = v7->_nowDate;
    v7->_nowDate = (NSDate *)v9;

    v7->_newLineAfterWrite = 1;
  }

  return v7;
}

- (BOOL)isCancelled
{
  brc_task_tracker *taskTracker;

  taskTracker = self->_taskTracker;
  if (taskTracker)
    LOBYTE(taskTracker) = brc_task_tracker_is_cancelled(taskTracker);
  return (char)taskTracker;
}

- (void)writeLineWithFormat:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t *v18;
  _BYTE v19[128];
  uint64_t v20;
  uint64_t v21;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0;
  v5 = -[NSString UTF8String](self->_indentationBaseString, "UTF8String");
  v18 = &v21;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v4, &v21);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("\n"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (self->_indentation >= 1)
        {
          v13 = 0;
          do
          {
            fputs(v5, self->_fp);
            ++v13;
          }
          while (v13 < self->_indentation);
        }
        fputs((const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), self->_fp);
        if (self->_newLineAfterWrite)
          fputc(10, self->_fp);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

}

- (void)writeEmptyLine
{
  fputc(10, self->_fp);
}

- (BOOL)shouldKeepDumpingWithItemCount:(unsigned int)a3 includeAllItems:(BOOL)a4
{
  const __CFString *v5;

  if (a3 >= 0x3E9 && !a4)
  {
    v5 = CFSTR("\n- too many items, stopping -\n");
LABEL_7:
    -[BRCDumpContext writeLineWithFormat:](self, "writeLineWithFormat:", v5);
    return 0;
  }
  if (self && -[BRCDumpContext isCancelled](self, "isCancelled"))
  {
    v5 = CFSTR("- cancelled -");
    goto LABEL_7;
  }
  return 1;
}

- (id)highlightedString:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a4 - 1;
  if ((unint64_t)(a4 - 1) > 6)
  {
    v9 = 0;
    v10 = 9;
  }
  else
  {
    v9 = dword_230722DCC[v8];
    v10 = dword_230722DE8[v8];
  }
  -[BRCDumper startStringForFgColor:bgColor:attr:](self->_dumper, "startStringForFgColor:bgColor:attr:", v10, 9, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCDumper stringForReset](self->_dumper, "stringForReset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v7, "appendString:", v11);
  objc_msgSend(v7, "appendString:", v6);
  if (v12)
    objc_msgSend(v7, "appendString:", v12);

  return v7;
}

- (void)pushIndentation
{
  ++self->_indentation;
}

- (void)popIndentation
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: _indentation > 0%@", a5, a6, a7, a8, 2u);
}

- (__sFILE)fp
{
  return self->_fp;
}

- (PQLConnection)db
{
  return self->_db;
}

- (NSString)indentationBaseString
{
  return self->_indentationBaseString;
}

- (void)setIndentationBaseString:(id)a3
{
  objc_storeStrong((id *)&self->_indentationBaseString, a3);
}

- (BOOL)liveDaemon
{
  return self->_liveDaemon;
}

- (void)setLiveDaemon:(BOOL)a3
{
  self->_liveDaemon = a3;
}

- (BOOL)onlyActiveStuff
{
  return self->_onlyActiveStuff;
}

- (void)setOnlyActiveStuff:(BOOL)a3
{
  self->_onlyActiveStuff = a3;
}

- (BOOL)dumpTrackedPendingDownloads
{
  return self->_dumpTrackedPendingDownloads;
}

- (void)setDumpTrackedPendingDownloads:(BOOL)a3
{
  self->_dumpTrackedPendingDownloads = a3;
}

- (brc_task_tracker)taskTracker
{
  return self->_taskTracker;
}

- (void)setTaskTracker:(id)a3
{
  objc_storeStrong((id *)&self->_taskTracker, a3);
}

- (BOOL)newLineAfterWrite
{
  return self->_newLineAfterWrite;
}

- (void)setNewLineAfterWrite:(BOOL)a3
{
  self->_newLineAfterWrite = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_indentationBaseString, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_nowDate, 0);
  objc_storeStrong((id *)&self->_dumper, 0);
}

@end
