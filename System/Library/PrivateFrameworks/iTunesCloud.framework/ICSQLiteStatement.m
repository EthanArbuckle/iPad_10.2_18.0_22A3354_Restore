@implementation ICSQLiteStatement

- (ICSQLiteStatement)initWithStatement:(sqlite3_stmt *)a3 connection:(id)a4
{
  id v7;
  ICSQLiteStatement *v8;
  ICSQLiteStatement *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICSQLiteStatement;
  v8 = -[ICSQLiteStatement init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a4);
    v9->_statement = a3;
    objc_storeStrong((id *)&v9->_strongSelf, v9);
  }

  return v9;
}

- (NSDictionary)columnIndexByName
{
  sqlite3_stmt *statement;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  statement = self->_statement;
  if (statement)
  {
    v4 = sqlite3_column_count(statement);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 >= 1)
    {
      v6 = 0;
      do
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v6);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", sqlite3_column_name(self->_statement, v6));
        objc_msgSend(v5, "setObject:forKey:", v7, v8);

        v6 = (v6 + 1);
      }
      while (v4 != (_DWORD)v6);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
    v5 = 0;
  }
  return (NSDictionary *)v5;
}

- (int)finalizeStatement
{
  sqlite3_stmt *statement;
  int v4;
  ICSQLiteStatement *strongSelf;

  statement = self->_statement;
  if (statement)
  {
    v4 = sqlite3_finalize(statement);
    strongSelf = self->_strongSelf;
    self->_statement = 0;
    self->_strongSelf = 0;

    return v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
    return 21;
  }
}

- (BOOL)isReadOnly
{
  sqlite3_stmt *statement;

  statement = self->_statement;
  if (statement)
    return sqlite3_stmt_readonly(statement) != 0;
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
  return 1;
}

- (int)reset
{
  sqlite3_stmt *statement;

  statement = self->_statement;
  if (statement)
    return sqlite3_reset(statement);
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
  return 21;
}

- (NSString)SQL
{
  sqlite3_stmt *statement;
  __CFString *v3;

  statement = self->_statement;
  if (statement)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_sql(statement));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
    v3 = &stru_1E4391778;
  }
  return (NSString *)v3;
}

- (int)step
{
  sqlite3_stmt *statement;

  statement = self->_statement;
  if (statement)
    return sqlite3_step(statement);
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
  return 21;
}

- (void)bindData:(id)a3 atPosition:(int)a4
{
  id v6;
  sqlite3_stmt *statement;
  id v8;
  id v9;

  v6 = a3;
  statement = self->_statement;
  v9 = v6;
  if (statement)
  {
    v8 = objc_retainAutorelease(v6);
    sqlite3_bind_blob(statement, a4, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
  }

}

- (void)bindDataCopy:(id)a3 atPosition:(int)a4
{
  id v6;
  sqlite3_stmt *statement;
  id v8;
  id v9;

  v6 = a3;
  statement = self->_statement;
  v9 = v6;
  if (statement)
  {
    v8 = objc_retainAutorelease(v6);
    sqlite3_bind_blob(statement, a4, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
  }

}

- (void)bindDouble:(double)a3 atPosition:(int)a4
{
  sqlite3_stmt *statement;

  statement = self->_statement;
  if (statement)
    sqlite3_bind_double(statement, a4, a3);
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"), a3);
}

- (void)bindFloat:(float)a3 atPosition:(int)a4
{
  sqlite3_stmt *statement;

  statement = self->_statement;
  if (statement)
    sqlite3_bind_double(statement, a4, a3);
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
}

- (void)bindInt:(int)a3 atPosition:(int)a4
{
  sqlite3_stmt *statement;

  statement = self->_statement;
  if (statement)
    sqlite3_bind_int(statement, a4, a3);
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
}

- (void)bindInt64:(int64_t)a3 atPosition:(int)a4
{
  sqlite3_stmt *statement;

  statement = self->_statement;
  if (statement)
    sqlite3_bind_int64(statement, a4, a3);
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
}

- (void)bindNullAtPosition:(int)a3
{
  sqlite3_stmt *statement;

  statement = self->_statement;
  if (statement)
    sqlite3_bind_null(statement, a3);
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
}

- (void)bindNumber:(id)a3 atPosition:(int)a4
{
  const __CFNumber *v6;
  CFNumberType Type;
  sqlite3_stmt *statement;
  double v9;
  const __CFNumber *v10;

  v6 = (const __CFNumber *)a3;
  v10 = v6;
  if (!self->_statement)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
    goto LABEL_9;
  }
  Type = CFNumberGetType(v6);
  if ((unint64_t)Type > kCFNumberCGFloatType)
  {
LABEL_8:
    sqlite3_bind_int64(self->_statement, a4, -[__CFNumber longLongValue](v10, "longLongValue"));
    goto LABEL_9;
  }
  if (((1 << Type) & 0x38E) == 0)
  {
    if (((1 << Type) & 0x10060) != 0)
    {
      statement = self->_statement;
      -[__CFNumber doubleValue](v10, "doubleValue");
      sqlite3_bind_double(statement, a4, v9);
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  sqlite3_bind_int(self->_statement, a4, -[__CFNumber intValue](v10, "intValue"));
LABEL_9:

}

- (void)bindString:(id)a3 atPosition:(int)a4
{
  const __CFString *v6;
  CFStringEncoding FastestEncoding;
  const char *CStringPtr;
  const char *v9;
  sqlite3_stmt *statement;
  int v11;
  uint64_t v12;
  const UniChar *CharactersPtr;
  const UniChar *v14;
  sqlite3_stmt *v15;
  int Length;
  sqlite3_stmt *v17;
  __CFString *theString;

  v6 = (const __CFString *)a3;
  theString = (__CFString *)v6;
  if (self->_statement)
  {
    FastestEncoding = CFStringGetFastestEncoding(v6);
    if (FastestEncoding != 256)
    {
      if (FastestEncoding == 134217984)
      {
        CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
        if (CStringPtr)
        {
          v9 = CStringPtr;
          statement = self->_statement;
          v11 = a4;
          v12 = 0;
LABEL_10:
          sqlite3_bind_text(statement, v11, v9, -1, (void (__cdecl *)(void *))v12);
          goto LABEL_11;
        }
      }
LABEL_9:
      v17 = self->_statement;
      v9 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(theString), "UTF8String");
      statement = v17;
      v11 = a4;
      v12 = -1;
      goto LABEL_10;
    }
    CharactersPtr = CFStringGetCharactersPtr(theString);
    if (!CharactersPtr)
      goto LABEL_9;
    v14 = CharactersPtr;
    v15 = self->_statement;
    Length = CFStringGetLength(theString);
    sqlite3_bind_text16(v15, a4, v14, 2 * Length, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
  }
LABEL_11:

}

- (void)bindStringCopy:(id)a3 atPosition:(int)a4
{
  sqlite3_stmt *statement;

  statement = self->_statement;
  if (statement)
    sqlite3_bind_text(statement, a4, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
}

- (int)clearBindings
{
  sqlite3_stmt *statement;

  statement = self->_statement;
  if (statement)
    return sqlite3_clear_bindings(statement);
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Statement already finalized"));
  return 21;
}

- (ICSQLiteConnection)connection
{
  return self->_connection;
}

- (sqlite3_stmt)sqlite3_stmt
{
  return self->_statement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
