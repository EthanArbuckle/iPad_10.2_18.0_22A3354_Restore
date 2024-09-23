@implementation WBSSQLiteRow

- (int64_t)int64AtIndex:(unint64_t)a3
{
  return sqlite3_column_int64(self->_handle, a3);
}

- (WBSSQLiteRow)initWithStatement:(id)a3
{
  id v4;
  WBSSQLiteRow *v5;
  WBSSQLiteRow *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WBSSQLiteRow;
  v5 = -[WBSSQLiteRow init](&v8, sel_init);
  if (v5)
  {
    v5->_handle = (sqlite3_stmt *)objc_msgSend(v4, "handle");
    v6 = v5;
  }

  return v5;
}

- (WBSSQLiteRow)initWithCurrentRowOfEnumerator:(id)a3
{
  void *v4;
  WBSSQLiteRow *v5;

  objc_msgSend(a3, "statement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WBSSQLiteRow initWithStatement:](self, "initWithStatement:", v4);

  return v5;
}

- (double)doubleAtIndex:(unint64_t)a3
{
  return sqlite3_column_double(self->_handle, a3);
}

- (id)stringAtIndex:(unint64_t)a3
{
  int v3;
  __CFString *v5;
  sqlite3_stmt *handle;
  const unsigned __int8 *v7;
  int v8;

  v3 = a3;
  if (-[WBSSQLiteRow _isNullAtIndex:](self, "_isNullAtIndex:"))
  {
    v5 = 0;
  }
  else
  {
    handle = self->_handle;
    v7 = sqlite3_column_text(handle, v3);
    v8 = sqlite3_column_bytes(handle, v3);
    v5 = (__CFString *)CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7, v8, 0x8000100u, 0);
  }
  return v5;
}

- (BOOL)_isNullAtIndex:(unint64_t)a3
{
  return sqlite3_column_type(self->_handle, a3) == 5;
}

- (BOOL)BOOLAtIndex:(unint64_t)a3
{
  return -[WBSSQLiteRow intAtIndex:](self, "intAtIndex:", a3) != 0;
}

- (int)intAtIndex:(unint64_t)a3
{
  return sqlite3_column_int(self->_handle, a3);
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;

  switch(sqlite3_column_type(self->_handle, a3))
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(self->_handle, a3));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(self->_handle, a3));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[WBSSQLiteRow stringAtIndex:](self, "stringAtIndex:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[WBSSQLiteRow dataAtIndex:](self, "dataAtIndex:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (WBSSQLiteRow)init
{

  return 0;
}

- (id)dataAtIndex:(unint64_t)a3
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = 0;
  v6 = 0;
  v7 = 0;
  -[WBSSQLiteRow uncopiedRawDataAtIndex:](self, "uncopiedRawDataAtIndex:", a3);
  v3 = 0;
  if (!(_BYTE)v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, (int)v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)uncopiedDataAtIndex:(unint64_t)a3
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = 0;
  v6 = 0;
  v7 = 0;
  -[WBSSQLiteRow uncopiedRawDataAtIndex:](self, "uncopiedRawDataAtIndex:", a3);
  v3 = 0;
  if (!(_BYTE)v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v6, (int)v7, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (RawData)uncopiedRawDataAtIndex:(SEL)a3
{
  int v4;
  RawData *result;
  sqlite3_stmt *handle;
  RawData *v9;

  v4 = a4;
  result = (RawData *)-[WBSSQLiteRow _isNullAtIndex:](self, "_isNullAtIndex:");
  if ((_DWORD)result)
  {
    *(_QWORD *)&retstr->var0 = 0;
    retstr->var1 = 0;
    *(_QWORD *)&retstr->var2 = 0;
    retstr->var0 = 1;
  }
  else
  {
    handle = self->_handle;
    result = (RawData *)sqlite3_column_blob(handle, v4);
    if (result)
    {
      v9 = result;
      result = (RawData *)sqlite3_column_bytes(handle, v4);
      retstr->var0 = 0;
      retstr->var1 = v9;
      retstr->var2 = (int)result;
    }
    else
    {
      *(_QWORD *)&retstr->var0 = 0;
      retstr->var1 = 0;
      *(_QWORD *)&retstr->var2 = 0;
    }
  }
  return result;
}

- (id)debugDictionaryRepresentationWithStatement:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  objc_msgSend(a3, "columnNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__WBSSQLiteRow_debugDictionaryRepresentationWithStatement___block_invoke;
  v10[3] = &unk_1E64A0138;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __59__WBSSQLiteRow_debugDictionaryRepresentationWithStatement___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  switch(sqlite3_column_type(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 8), a3))
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "int64AtIndex:", a3));
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      v6 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "doubleAtIndex:", a3);
      objc_msgSend(v6, "numberWithDouble:");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "stringAtIndex:", a3);
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(*(id *)(a1 + 32), "dataAtIndex:", a3);
      v5 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v7 = (void *)v5;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v8);

}

@end
