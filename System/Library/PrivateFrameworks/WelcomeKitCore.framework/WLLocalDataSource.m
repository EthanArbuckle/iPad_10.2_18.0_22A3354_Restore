@implementation WLLocalDataSource

+ (id)_localSourceDataPath
{
  if (_localSourceDataPath_onceToken != -1)
    dispatch_once(&_localSourceDataPath_onceToken, &__block_literal_global_0);
  return (id)_localSourceDataPath_localSourceDataPath;
}

void __41__WLLocalDataSource__localSourceDataPath__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  NSHomeDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("/Library/WelcomeKit/LocalSourceData/"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_localSourceDataPath_localSourceDataPath;
  _localSourceDataPath_localSourceDataPath = v0;

}

+ (BOOL)localDataExists
{
  void *v3;
  void *v4;
  char v5;
  char v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_localSourceDataPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, &v7);

  if (v7)
    return v5;
  else
    return 0;
}

- (void)accountsDataForMigrator:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  const __CFString *v33;
  id v34;
  const __CFString *v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v29 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[WLLocalDataSource _localSourceDataPath](WLLocalDataSource, "_localSourceDataPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  v30 = v5;
  objc_msgSend(v5, "contentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@/accounts"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v28 = (void *)v11;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDBCC60];
  v37[0] = *MEMORY[0x24BDBCC60];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v12;
  objc_msgSend(v13, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "nextObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    do
    {
      v31 = 0;
      v32 = 0;
      objc_msgSend(v18, "getResourceValue:forKey:error:", &v32, v14, &v31, v26);
      v19 = v32;
      v20 = v31;
      v21 = v20;
      if (v20)
      {
        v26 = v20;
        _WLLog();
      }
      else if (objc_msgSend(v19, "BOOLValue"))
      {
        v35 = CFSTR("itemID");
        objc_msgSend(v18, "lastPathComponent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v23);

      }
      objc_msgSend(v16, "nextObject");
      v24 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v24;
    }
    while (v24);
  }
  if (v29)
  {
    v33 = CFSTR("dataItemSummaries");
    v34 = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD, double))v29 + 2))(v29, v25, 0, 0, 0.0);

  }
}

- (void)summariesDataForAccount:(id)a3 migrator:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  const __CFString *v49;
  id v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[4];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v39 = a5;
  v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v40 = v8;
  v41 = v7;
  +[WLLocalDataSource _relativePathForAccount:migrator:](WLLocalDataSource, "_relativePathForAccount:migrator:", v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  +[WLLocalDataSource _localSourceDataPath](WLLocalDataSource, "_localSourceDataPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v9;
  objc_msgSend(v10, "stringByAppendingPathComponent:", v9);
  v11 = objc_claimAutoreleasedReturnValue();

  v38 = (void *)v11;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDBCC60];
  v15 = *MEMORY[0x24BDBCC48];
  v53[0] = *MEMORY[0x24BDBCC60];
  v53[1] = v15;
  v42 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)v12;
  objc_msgSend(v13, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, v16, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "nextObject");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    do
    {
      v47 = 0;
      v48 = 0;
      objc_msgSend(v19, "getResourceValue:forKey:error:", &v48, v14, &v47);
      v20 = v48;
      v21 = v47;
      v22 = v21;
      if (v21)
      {
        v36 = (uint64_t)v21;
        _WLLog();
      }
      if ((objc_msgSend(v20, "BOOLValue", v36) & 1) != 0)
      {
        v23 = v22;
      }
      else
      {
        objc_msgSend(v19, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "rangeOfString:", v43);
        v27 = v26;

        objc_msgSend(v19, "path");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "substringFromIndex:", v27 + v25 + 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = 0;
        v46 = 0;
        objc_msgSend(v19, "getResourceValue:forKey:error:", &v46, v42, &v45);
        v30 = v46;
        v23 = v45;

        if (v23)
        {
          v36 = (uint64_t)v23;
          _WLLog();
        }
        v31 = (void *)MEMORY[0x24BDD17C8];
        v36 = objc_msgSend(v30, "unsignedIntegerValue", v36);
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%lu"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = CFSTR("itemID");
        v51[1] = CFSTR("itemSize");
        v52[0] = v29;
        v52[1] = v32;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v33);

      }
      objc_msgSend(v17, "nextObject");
      v34 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v34;
    }
    while (v34);
  }
  if (v39)
  {
    v49 = CFSTR("dataItemSummaries");
    v50 = v44;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD, double))v39 + 2))(v39, v35, 0, 0, 0.0);

  }
}

- (void)fileForSummary:(id)a3 migrator:(id)a4 fileAccessor:(id)a5 completion:(id)a6
{
  void (**v9)(id, void *);
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v9 = (void (**)(id, void *))a6;
  v10 = (void (**)(id, void *))a5;
  +[WLLocalDataSource _relativePathForSummary:migrator:](WLLocalDataSource, "_relativePathForSummary:migrator:", a3, a4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  +[WLLocalDataSource _localSourceDataPath](WLLocalDataSource, "_localSourceDataPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v9[2](v9, v14);
}

- (void)dataForSummary:(id)a3 migrator:(id)a4 completion:(id)a5
{
  void (**v7)(id, void *, id);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v7 = (void (**)(id, void *, id))a5;
  +[WLLocalDataSource _relativePathForSummary:migrator:](WLLocalDataSource, "_relativePathForSummary:migrator:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLLocalDataSource _localSourceDataPath](WLLocalDataSource, "_localSourceDataPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v11, 1, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v14;
  if (v13 || !v12)
    _WLLog();
  v7[2](v7, v12, v13);

}

- (void)dataSegmentForSummary:(id)a3 byteRange:(_NSRange)a4 migrator:(id)a5 completion:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  NSUInteger v15;
  NSUInteger v16;

  length = a4.length;
  location = a4.location;
  v11 = a6;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__WLLocalDataSource_dataSegmentForSummary_byteRange_migrator_completion___block_invoke;
  v13[3] = &unk_24E375900;
  v15 = location;
  v16 = length;
  v14 = v11;
  v12 = v11;
  -[WLLocalDataSource dataForSummary:migrator:completion:](self, "dataForSummary:migrator:completion:", a3, a5, v13);

}

void __73__WLLocalDataSource_dataSegmentForSummary_byteRange_migrator_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v9 = a2;
  v5 = a3;
  v6 = v9;
  v7 = v5;
  if (v9 && !v5)
  {
    objc_msgSend(v9, "subdataWithRange:", a1[5], a1[6]);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  v10 = v6;
  (*(void (**)(void))(a1[4] + 16))();

}

- (void)updateUIWithProgress:(double)a3 remainingTime:(double)a4 logString:(id)a5 completion:(id)a6
{
  (*((void (**)(id, _QWORD, double, double))a6 + 2))(a6, 0, a3, a4);
}

- (void)itemSizeForSummary:(id)a3 migrator:(id)a4 completion:(id)a5
{
  id v7;

  v7 = a5;
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(v7, objc_msgSend(a3, "itemSize"), 0);

}

+ (void)deleteLocalData
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLLocalDataSource _localSourceDataPath](WLLocalDataSource, "_localSourceDataPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "removeItemAtPath:error:", v3, &v5);
  v4 = v5;

  if (v4)
    _WLLog();

}

+ (id)_relativePathForAccount:(id)a3 migrator:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "accountBased"))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "contentType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/accounts/%@"), v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "contentType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)_relativePathForSummary:(id)a3 migrator:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "accountBased"))
  {
    objc_msgSend(v5, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "contentType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@/accounts/%@/%@"), v15, v13, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "contentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@/%@"), v13, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

+ (void)stashFileForSummary:(id)a3 migrator:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  id v21;

  v6 = (void *)MEMORY[0x24BDBCF48];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "dataFilePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:isDirectory:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_relativePathForSummary:migrator:", v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[WLLocalDataSource _localSourceDataPath](WLLocalDataSource, "_localSourceDataPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByDeletingLastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v17 = objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v21);
  v18 = v21;

  if (v17 && !v18)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v19, "copyItemAtURL:toURL:error:", v10, v14, &v20);
    v18 = v20;

  }
  _WLLog();

}

+ (void)stashData:(id)a3 forSummary:(id)a4 migrator:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  BOOL v17;
  void *v18;
  id v19;
  id v20;

  v8 = a3;
  objc_msgSend(a1, "_relativePathForSummary:migrator:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLLocalDataSource _localSourceDataPath](WLLocalDataSource, "_localSourceDataPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByDeletingLastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v15 = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v20);
  v16 = v20;

  if (v15)
    v17 = v16 == 0;
  else
    v17 = 0;
  if (v17)
  {
    v19 = 0;
    objc_msgSend(v8, "writeToURL:options:error:", v12, 1, &v19);
    v16 = v19;
  }
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

  }
  else
  {
    _WLLog();
  }

}

@end
