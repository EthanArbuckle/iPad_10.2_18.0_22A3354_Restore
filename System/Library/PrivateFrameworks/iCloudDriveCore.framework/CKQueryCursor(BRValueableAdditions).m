@implementation CKQueryCursor(BRValueableAdditions)

+ (uint64_t)newFromSqliteValue:()BRValueableAdditions
{
  void *v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  NSObject *v12;

  if (sqlite3_value_type(a3) == 4)
  {
    v4 = (void *)MEMORY[0x24BDD1620];
    v5 = objc_opt_class();
    v6 = (void *)MEMORY[0x24BDBCE50];
    v7 = sqlite3_value_blob(a3);
    objc_msgSend(v6, "dataWithBytes:length:", v7, sqlite3_value_bytes(a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (sqlite3_value_type(a3) != 5)
    {
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        +[CKRecordID(BRCItemAdditions) newFromSqliteValue:].cold.1();

    }
    return 0;
  }
  return v9;
}

+ (uint64_t)newFromSqliteStatement:()BRValueableAdditions atIndex:
{
  void *v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  NSObject *v14;

  if (sqlite3_column_type(a3, iCol) == 4)
  {
    v6 = (void *)MEMORY[0x24BDD1620];
    v7 = objc_opt_class();
    v8 = (void *)MEMORY[0x24BDBCE50];
    v9 = sqlite3_column_blob(a3, iCol);
    objc_msgSend(v8, "dataWithBytes:length:", v9, sqlite3_column_bytes(a3, iCol));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v7, v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (sqlite3_column_type(a3, iCol) != 5)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        +[CKRecordID(BRCItemAdditions) newFromSqliteStatement:atIndex:].cold.1();

    }
    return 0;
  }
  return v11;
}

- (void)sqliteBind:()BRValueableAdditions index:
{
  id v6;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, 0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_blob(a3, a4, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

}

@end
