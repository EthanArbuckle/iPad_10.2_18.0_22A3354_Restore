@implementation NSError(PQLAdditions)

+ (uint64_t)errorForDB:()PQLAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorForDB:SQL:", a3, 0);
}

+ (id)errorForDB:()PQLAdditions stmt:
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_sql(pStmt));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorForDB:SQL:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)errorForDB:()PQLAdditions SQL:
{
  id v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;

  v5 = a4;
  v6 = sqlite3_errcode(a3);
  v7 = sqlite3_extended_errcode(a3);
  v15 = 0;
  if (v5)
    v8 = 4;
  else
    v8 = 3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C9AFB0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("SqliteExtendedCode"));

  if (a3 && !sqlite3_file_control(a3, 0, 4, &v15) && v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v15, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB3388]);

  }
  if (v5)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("SqliteSQL"));
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SqliteErrorDomain"), v6, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)errorWithSqliteCode:()PQLAdditions andMessage:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = *MEMORY[0x1E0C9AFB0];
  v11[1] = CFSTR("SqliteExtendedCode");
  v12[0] = a4;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  objc_msgSend(v5, "numberWithInt:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SqliteErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)extendedSqliteCode
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SqliteExtendedCode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = objc_msgSend(a1, "code");
  v5 = v4;

  return v5;
}

- (id)sqliteStatement
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("SqliteSQL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)isSqliteErrorCode:()PQLAdditions
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("SqliteErrorDomain")))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

@end
