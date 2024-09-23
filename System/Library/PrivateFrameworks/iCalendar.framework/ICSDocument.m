@implementation ICSDocument

- (ICSDocument)initWithICSString:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  ICSDocument *v9;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICSDocument initWithData:options:error:](self, "initWithData:options:error:", v8, a4, a5);

  return v9;
}

- (ICSDocument)initWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  ICSDocument *v9;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[ICSDocument initWithData:options:error:](self, "initWithData:options:error:", v8, a4, a5);
    self = v9;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (ICSDocument)initWithData:(id)a3 encoding:(unint64_t)a4 options:(unint64_t)a5 error:(id *)a6
{
  return -[ICSDocument initWithData:encoding:options:delegate:error:](self, "initWithData:encoding:options:delegate:error:", a3, a4, a5, 0, a6);
}

- (ICSDocument)initWithData:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return -[ICSDocument initWithData:encoding:options:delegate:error:](self, "initWithData:encoding:options:delegate:error:", a3, 4, a4, 0, a5);
}

- (ICSDocument)initWithData:(id)a3 encoding:(unint64_t)a4 options:(unint64_t)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  uint64_t v19;
  ICSDocument *v20;

  v11 = a3;
  v12 = a6;
  if (a4 != 4)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, a4);
    objc_msgSend(v13, "dataUsingEncoding:allowLossyConversion:", 4, 1);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v14;
  }
  +[ICSParser entitiesFromNSData:options:](ICSParser, "entitiesFromNSData:options:", v11, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "objectAtIndex:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v18 = 0;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v15, "objectAtIndex:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v18 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "documentParsedCalendar:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  if ((a5 & 0x100) == 0)
    -[ICSDocument validateParsedCalendar:](self, "validateParsedCalendar:", v18);
  v20 = -[ICSDocument initWithCalendar:](self, "initWithCalendar:", v18);

  return v20;
}

- (void)validateParsedCalendar:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v3, "components");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v4)
  {
    v5 = v4;
    v22 = v3;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
        }
        v28 = 0;
        v12 = objc_msgSend(v11, "validate:", &v28);
        v13 = v28;
        if ((v12 & 1) == 0)
        {
          +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, 0, CFSTR("Invalid component, discarding: %@\n%@"), v13, v11);
          if (!v8)
          {
            v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
            objc_msgSend(v22, "parsingErrors");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "mutableCopy");

            v7 = (id)v15;
          }
          objc_msgSend(v8, "addIndex:", v6 + i);
          objc_msgSend(v7, "addObject:", v13);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v6 += i;
    }
    while (v5);

    if (!v8)
    {
      v3 = v22;
      goto LABEL_27;
    }
    v3 = v22;
    objc_msgSend(v22, "components");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "removeObjectsAtIndexes:", v8);
    obj = v17;
    objc_msgSend(v22, "setComponents:", v17);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v7;
    v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v7);
          objc_msgSend(v22, "addParsingError:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
        }
        v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v19);
    }

  }
  else
  {
    v8 = 0;
    v7 = 0;
  }

LABEL_27:
}

- (ICSDocument)initWithCalendar:(id)a3
{
  id v5;
  ICSDocument *v6;
  ICSDocument *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSDocument;
  v6 = -[ICSDocument init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_calendar, a3);

  return v7;
}

- (id)calendar
{
  return self->_calendar;
}

- (id)ICSDataWithOptions:(unint64_t)a3
{
  void *v4;
  void *v5;

  if (self->_calendar)
  {
    -[ICSDocument ICSStringWithOptions:](self, "ICSStringWithOptions:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      NSLog(CFSTR("dataWithCalendar failed (will retry with lossy conversion) for %@"), self->_calendar);
      objc_msgSend(v4, "dataUsingEncoding:allowLossyConversion:", 4, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
        NSLog(CFSTR("dataWithCalendar failed (even with lossy conversion)"));
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)ICSStringWithOptions:(unint64_t)a3
{
  ICSStringWriter *v5;
  void *v6;

  if (self->_calendar)
  {
    v5 = objc_alloc_init(ICSStringWriter);
    -[ICSComponent ICSStringWithOptions:appendingToString:](self->_calendar, "ICSStringWithOptions:appendingToString:", a3, v5);
  }
  else
  {
    v5 = 0;
  }
  -[ICSStringWriter result](v5, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ICSCompressedDataWithOptions:(unint64_t)a3
{
  ICSZStringWriter *v5;
  void *v6;

  if (self->_calendar)
  {
    v5 = objc_alloc_init(ICSZStringWriter);
    -[ICSComponent ICSStringWithOptions:appendingToString:](self->_calendar, "ICSStringWithOptions:appendingToString:", a3, v5);
  }
  else
  {
    v5 = 0;
  }
  -[ICSZStringWriter zResult](v5, "zResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)validate:(id *)a3
{
  return -[ICSComponent validate:](self->_calendar, "validate:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
