@implementation PPSDataIngesterCommonUtilities

+ (id)columnNamesForFilepath:(id)a3 dataSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  PPSSQLiteDatabase *v8;
  void *v9;
  uint64_t v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x2494FEED8]();
  v8 = -[PPSSQLiteDatabase initWithDatabaseURL:]([PPSSQLiteDatabase alloc], "initWithDatabaseURL:", v5);
  v11 = 0;
  -[PPSSQLiteDatabase openForReadingWithError:](v8, "openForReadingWithError:", &v11);
  -[PPSSQLiteDatabase columnNamesForTable:](v8, "columnNamesForTable:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSQLiteDatabase close](v8, "close");

  objc_autoreleasePoolPop(v7);
  return v9;
}

+ (unint64_t)directionalityForMetricDefinition:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  unint64_t v6;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "directionality") - 3, v5 <= 3))
    v6 = qword_243A6D640[v5];
  else
    v6 = 0;

  return v6;
}

+ (id)dataSourceForMetricDefinition:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = a3;
    objc_msgSend(v4, "subsystem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "category");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v4, "timeToLive"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = objc_msgSend(v4, "storage");

    objc_msgSend(v8, "numberWithInt:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%@_%@_%@"), v5, v6, v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (id)allTableNamesForMetadataHistory:(id)a3 withEntryKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    v12 = 0x24BDD1000uLL;
    v24 = v7;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "auxiliaryType") == 2)
        {
          objc_msgSend(*(id *)(v12 + 1992), "stringWithFormat:", CFSTR("%@_Dynamic"), v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
          objc_msgSend(v7, "addObject:", v16);

          goto LABEL_11;
        }
        if (objc_msgSend(v15, "auxiliaryType") == 3 && !objc_msgSend(v15, "fixedArraySize"))
        {
          v17 = *(void **)(v12 + 1992);
          objc_msgSend(v15, "name");
          v18 = v12;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@_Array_%@"), v6, v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v18;
          v7 = v24;
          goto LABEL_8;
        }
LABEL_11:

        ++v13;
      }
      while (v10 != v13);
      v20 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v10 = v20;
    }
    while (v20);
  }

  objc_msgSend(v7, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");

  return v22;
}

+ (int64_t)fileTypeForFilepath:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EPSQL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CESQL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("XCSQL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BGSQL")) & 1) != 0)
  {
    v4 = 5;
  }
  else
  {
    v4 = (objc_msgSend(v3, "isEqualToString:", CFSTR("PLSQL")) & 1) != 0
      || objc_msgSend(v3, "isEqualToString:", CFSTR("powerlog"));
  }

  return v4;
}

+ (BOOL)isMetricStorageFilepath:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLSQL")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("EPSQL")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("CESQL")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("XCSQL")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("BGSQL")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("powerlog"));
  }

  return v4;
}

@end
