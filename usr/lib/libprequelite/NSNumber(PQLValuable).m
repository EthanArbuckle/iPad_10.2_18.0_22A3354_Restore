@implementation NSNumber(PQLValuable)

+ (uint64_t)newFromSqliteStatement:()PQLValuable atIndex:
{
  int v6;

  v6 = sqlite3_column_type(a3, iCol);
  if (v6 == 5)
    return 0;
  if (v6 == 2)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_column_double(a3, iCol));
  else
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(a3, iCol));
  return objc_claimAutoreleasedReturnValue();
}

- (uint64_t)sqliteBind:()PQLValuable index:
{
  id v6;
  double v7;

  v6 = objc_retainAutorelease(a1);
  if ((*(unsigned __int8 *)objc_msgSend(v6, "objCType") | 2) != 0x66)
    return sqlite3_bind_int64(a3, a4, objc_msgSend(v6, "longLongValue"));
  objc_msgSend(v6, "doubleValue");
  return sqlite3_bind_double(a3, a4, v7);
}

+ (uint64_t)newFromSqliteValue:()PQLValuable
{
  int v4;

  v4 = sqlite3_value_type(a3);
  if (v4 == 5)
    return 0;
  if (v4 == 2)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_value_double(a3));
  else
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_value_int64(a3));
  return objc_claimAutoreleasedReturnValue();
}

@end
