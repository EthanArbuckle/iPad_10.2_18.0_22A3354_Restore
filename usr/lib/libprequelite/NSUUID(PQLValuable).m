@implementation NSUUID(PQLValuable)

- (uint64_t)sqliteBind:()PQLValuable index:
{
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v7[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v7);
  return sqlite3_bind_blob(a3, a4, v7, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  const void *v6;
  const unsigned __int8 *v8;
  uuid_t uu;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (sqlite3_column_type(a3, iCol) == 4)
  {
    v6 = sqlite3_column_blob(a3, iCol);
    if (sqlite3_column_bytes(a3, iCol) == 16)
      return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v6);
  }
  else if (sqlite3_column_type(a3, iCol) == 3)
  {
    v8 = sqlite3_column_text(a3, iCol);
    memset(uu, 0, sizeof(uu));
    if (!uuid_parse((const char *)v8, uu))
      return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
  }
  return 0;
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  const void *v4;
  const unsigned __int8 *v6;
  uuid_t uu;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (sqlite3_value_type(a3) == 4)
  {
    v4 = sqlite3_value_blob(a3);
    if (sqlite3_value_bytes(a3) == 16)
      return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v4);
  }
  else if (sqlite3_value_type(a3) == 3)
  {
    v6 = sqlite3_value_text(a3);
    memset(uu, 0, sizeof(uu));
    if (!uuid_parse((const char *)v6, uu))
      return objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
  }
  return 0;
}

@end
