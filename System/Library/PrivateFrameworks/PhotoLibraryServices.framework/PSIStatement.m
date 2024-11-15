@implementation PSIStatement

- (PSIStatement)initWithSQLite3Stmt:(sqlite3_stmt *)a3
{
  PSIStatement *result;
  objc_super v5;

  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PSIStatement;
    result = -[PSIStatement init](&v5, sel_init);
    if (result)
      result->_stmt = a3;
  }
  else
  {

    return 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint8_t buf[4];
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_stmt && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v5 = CFSTR("finalizze not called before statement deallocation");
    _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
  v3.receiver = self;
  v3.super_class = (Class)PSIStatement;
  -[PSIStatement dealloc](&v3, sel_dealloc);
}

- (void)finalizze
{
  sqlite3_stmt *stmt;
  int v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  stmt = self->_stmt;
  if (!stmt)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = CFSTR("finalizze called multiple times on statement");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v5, 0xCu);
      stmt = self->_stmt;
    }
    else
    {
      stmt = 0;
    }
  }
  v4 = sqlite3_finalize(stmt);
  self->_stmt = 0;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = CFSTR("Failed to finalize statement");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)bindText:(id)a3 atIndex:(unint64_t)a4
{
  int v4;
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dataUsingEncoding:allowLossyConversion:", 4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v8 = (char *)malloc_type_malloc(v7 + 1, 0x8EC3DB34uLL);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v6, "getBytes:range:", v8, 0, v7);
    v9[v7] = 0;
    if (sqlite3_bind_text(self->_stmt, v4, v9, v7 + 1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v10, 0xCu);
    }
    free(v9);
  }

}

- (void)bindDouble:(double)a3 atIndex:(unint64_t)a4
{
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (sqlite3_bind_double(self->_stmt, a4, a3))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)bindInt64:(int64_t)a3 atIndex:(unint64_t)a4
{
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (sqlite3_bind_int64(self->_stmt, a4, a3))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = CFSTR("Failed to bind parameter");
      _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed statement check: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (id)textAtColumn:(unint64_t)a3
{
  void *v3;

  v3 = (void *)sqlite3_column_text(self->_stmt, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (double)doubleAtColumn:(unint64_t)a3
{
  return sqlite3_column_double(self->_stmt, a3);
}

- (int64_t)int64AtColumn:(unint64_t)a3
{
  return sqlite3_column_int64(self->_stmt, a3);
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

@end
