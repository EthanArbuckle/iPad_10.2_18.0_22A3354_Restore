@implementation NSData(PQLValuable)

- (uint64_t)sqliteBind:()PQLValuable index:
{
  id v6;
  uint64_t v7;
  const char *v8;

  v6 = objc_retainAutorelease(a1);
  v7 = objc_msgSend(v6, "bytes");
  if (v7)
    v8 = (const char *)v7;
  else
    v8 = "";
  return sqlite3_bind_blob(a3, a4, v8, objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  const void *v7;

  if (sqlite3_column_type(a3, iCol) == 5)
    return 0;
  v7 = sqlite3_column_blob(a3, iCol);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, sqlite3_column_bytes(a3, iCol));
  return objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  const void *v5;

  if (sqlite3_value_type(a3) == 5)
    return 0;
  v5 = sqlite3_value_blob(a3);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, sqlite3_value_bytes(a3));
  return objc_claimAutoreleasedReturnValue();
}

@end
