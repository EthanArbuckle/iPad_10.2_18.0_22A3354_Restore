@implementation NSString(PQLValuable)

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  const unsigned __int8 *v7;

  if (sqlite3_column_type(a3, iCol) == 5)
    return 0;
  v7 = sqlite3_column_text(a3, iCol);
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v7, sqlite3_column_bytes(a3, iCol), 4);
}

- (uint64_t)sqliteBind:()PQLValuable index:
{
  return sqlite3_bind_text(a3, a4, (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  const unsigned __int8 *v5;

  if (sqlite3_value_type(a3) == 5)
    return 0;
  v5 = sqlite3_value_text(a3);
  return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v5, sqlite3_value_bytes(a3), 4);
}

@end
