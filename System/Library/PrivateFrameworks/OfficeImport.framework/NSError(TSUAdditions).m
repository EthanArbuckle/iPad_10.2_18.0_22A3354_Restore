@implementation NSError(TSUAdditions)

+ (id)tsu_errorWithDomain:()TSUAdditions code:description:recoverySuggestion:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  v14 = v13;
  if (v11)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD0FC8]);
  if (v12)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDD0FF0]);
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", v10, a4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)tsu_errorWithCode:()TSUAdditions userInfo:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[NSError(TSUAdditions) tsu_errorWithCode:userInfo:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSError_TSUAdditions.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 42, 0, "Bad error code");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iWork.TSUtility"), a3, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)tsu_errorWithDomain:()TSUAdditions code:alertTitle:alertMessage:
{
  return objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:userInfo:", a3, a4, a5, a6, 0);
}

+ (id)tsu_errorWithDomain:()TSUAdditions code:alertTitle:alertMessage:userInfo:
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v15, "count") + 4);
  v17 = v16;
  if (v15)
    objc_msgSend(v16, "addEntriesFromDictionary:", v15);
  if (v13)
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD0FC8]);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, CFSTR("TSULocalizedErrorAlertTitle"));
  }
  if (v14)
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDD0FF0]);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("TSULocalizedErrorAlertMessage"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDD0FD8]);
  }
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", v12, a4, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)tsu_errorWithDomain:()TSUAdditions code:description:underlyingError:
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a6;
  v12 = (objc_class *)MEMORY[0x24BDBCED8];
  v13 = a5;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithCapacity:", 2);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD0FC8]);

  if (v11)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD1398]);
  objc_msgSend(a1, "errorWithDomain:code:userInfo:", v10, a4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)tsu_errorWithError:()TSUAdditions alertTitle:alertMessage:additionalUserInfo:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v10 = a6;
  if (a3)
  {
    v11 = a5;
    v12 = a4;
    v13 = a3;
    objc_msgSend(v13, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v14, "count") + objc_msgSend(v10, "count") + 1);
    v16 = v15;
    if (v14)
      objc_msgSend(v15, "addEntriesFromDictionary:", v14);
    if (v10)
      objc_msgSend(v16, "addEntriesFromDictionary:", v10);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD1398]);
    objc_msgSend(v13, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v13, "code");

    objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:userInfo:", v17, v18, v12, v11, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)tsu_errorPreservingAlertTitle
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("TSULocalizedErrorAlertTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && !objc_msgSend(v5, "isEqualToString:", v4))
    {
      v8 = (void *)objc_msgSend(v2, "mutableCopy");
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v3);
      v9 = (void *)objc_opt_class();
      objc_msgSend(a1, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(a1, "code"), v8);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }

  }
  v7 = a1;
LABEL_7:

  return v7;
}

- (id)tsu_errorPreservingCancel
{
  id v1;
  void *v2;
  uint64_t v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "tsu_isCancelError"))
  {
    if (objc_msgSend(v1, "code") == 3072)
    {
      objc_msgSend(v1, "domain");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = *MEMORY[0x24BDD0B88];
      v4 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD0B88]);

      if ((v4 & 1) != 0)
        return v1;
    }
    else
    {
      v3 = *MEMORY[0x24BDD0B88];
    }
    v5 = (void *)objc_opt_class();
    v9 = *MEMORY[0x24BDD1398];
    v10[0] = v1;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v3, 3072, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v7;
  }
  return v1;
}

- (id)tsu_localizedAlertTitle
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("TSULocalizedErrorAlertTitle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)tsu_localizedAlertMessage
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("TSULocalizedErrorAlertMessage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FF0]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (uint64_t)tsu_isOutOfSpaceError
{
  return objc_msgSend(a1, "tsu_isErrorPassingTest:", &__block_literal_global_26);
}

- (uint64_t)tsu_isCancelError
{
  return objc_msgSend(a1, "tsu_isErrorPassingTest:", &__block_literal_global_17_2);
}

- (uint64_t)tsu_isNoSuchFileError
{
  return objc_msgSend(a1, "tsu_isErrorPassingTest:", &__block_literal_global_18);
}

- (uint64_t)tsu_isErrorPassingTest:()TSUAdditions
{
  uint64_t (**v4)(id, void *, uint64_t, void *);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v5 = a1;
    if (v5)
    {
      v6 = *MEMORY[0x24BDD1398];
      while (1)
      {
        objc_msgSend((id)v5, "userInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v5, "domain");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v4[2](v4, v8, objc_msgSend((id)v5, "code"), v7);

        if ((v9 & 1) != 0)
          break;
        objc_msgSend(v7, "objectForKeyedSubscript:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 != (void *)v5)
        {
          v12 = v10;

          v5 = (uint64_t)v12;
        }

        if (!v5)
          goto LABEL_11;
      }

      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_11:

  return v5;
}

@end
