@implementation NSError(PBFSQLiteDatabaseConnectionAdditions)

+ (id)pbf_sqliteDatabaseErrorWithCode:()PBFSQLiteDatabaseConnectionAdditions errorMessage:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errstr(a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);

  if (v5)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB2D68]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.posterboard.sqlite"), a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
