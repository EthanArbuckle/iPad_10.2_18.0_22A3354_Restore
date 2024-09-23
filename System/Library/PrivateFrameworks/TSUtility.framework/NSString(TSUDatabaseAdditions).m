@implementation NSString(TSUDatabaseAdditions)

- (uint64_t)initWithSqlStatement:()TSUDatabaseAdditions columnIndex:
{
  return objc_msgSend(a1, "initWithUTF8String:", sqlite3_column_text(a3, iCol));
}

- (uint64_t)bindToSqlStatement:()TSUDatabaseAdditions index:error:
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;

  v9 = objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4);
  if (HIDWORD(v9))
    return 0;
  if (!sqlite3_bind_text(a3, a4, (const char *)objc_msgSend(a1, "UTF8String"), v9, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))return 1;
  TSULogErrorInFunction((uint64_t)"-[NSString(TSUDatabaseAdditions) bindToSqlStatement:index:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m", 445, (uint64_t)CFSTR("Couldn't bind string to SQL statement"), v10, v11, v12, v13, v16);
  if (!a5 || *a5)
    return 0;
  v15 = objc_msgSend(MEMORY[0x24BDD1540], "tsuErrorWithCode:", 0);
  result = 0;
  *a5 = v15;
  return result;
}

+ (const)stringWithSqlStatement:()TSUDatabaseAdditions columnIndex:
{
  const unsigned __int8 *result;

  result = sqlite3_column_text(a3, iCol);
  if (result)
    return (const unsigned __int8 *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithSqlStatement:columnIndex:", a3, iCol);
  return result;
}

@end
