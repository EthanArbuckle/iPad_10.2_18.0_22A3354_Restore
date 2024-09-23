@implementation NSError(TSUIO)

+ (id)tsu_userInfoWithErrorType:()TSUIO userInfo:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v5, "count") + 1);
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "addEntriesFromDictionary:", v5);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("TSUIOErrorType"));

  return v7;
}

+ (id)tsu_fileReadUnknownErrorWithUserInfo:()TSUIO
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD0B88];
  objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 256, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)tsu_fileReadCorruptedFileErrorWithUserInfo:()TSUIO
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD0B88];
  objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 259, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)tsu_fileReadPOSIXErrorWithNumber:()TSUIO userInfo:
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD1128];
  v5 = a3;
  objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)tsu_fileWriteUnknownErrorWithUserInfo:()TSUIO
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD0B88];
  objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 512, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)tsu_fileWritePOSIXErrorWithNumber:()TSUIO userInfo:
{
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x24BDD1540];
  v7 = a4;
  v8 = [v6 alloc];
  v9 = *MEMORY[0x24BDD1128];
  objc_msgSend(a1, "tsu_userInfoWithErrorType:userInfo:", 2, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, a3, v10);
  return v11;
}

- (uint64_t)tsu_isReadError
{
  return objc_msgSend(a1, "tsu_isErrorPassingTest:", &__block_literal_global_27);
}

- (uint64_t)tsu_isCorruptedError
{
  return objc_msgSend(a1, "tsu_isErrorPassingTest:", &__block_literal_global_5_1);
}

- (uint64_t)tsu_isWriteError
{
  return objc_msgSend(a1, "tsu_isErrorPassingTest:", &__block_literal_global_6_2);
}

@end
