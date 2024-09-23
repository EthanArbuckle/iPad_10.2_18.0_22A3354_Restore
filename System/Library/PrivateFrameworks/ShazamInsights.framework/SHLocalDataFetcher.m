@implementation SHLocalDataFetcher

- (void)fetchClusterURL:(id)a3 forCurrentStorefront:(id)a4 cachedUniqueHash:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, SHDataFetcherFileInfo *);
  void *v12;
  void *v13;
  int v14;
  SHDataFetcherFileInfo *v15;
  SHDataFetcherFileInfo *v16;
  SHDataFetcherFileInfo *v17;
  void *v18;
  id v19;

  v19 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, _QWORD, SHDataFetcherFileInfo *))a6;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

  if (v14)
  {
    +[SHFileChecksum checksumForFile:withError:](SHFileChecksum, "checksumForFile:withError:", v19, 0);
    v15 = (SHDataFetcherFileInfo *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && -[SHDataFetcherFileInfo isEqualToString:](v15, "isEqualToString:", v10))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ShazamInsightsDataFetcher"), 100, 0);
      v17 = (SHDataFetcherFileInfo *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0, v17);
    }
    else
    {
      v17 = -[SHDataFetcherFileInfo initWithDataURL:]([SHDataFetcherFileInfo alloc], "initWithDataURL:", v19);
      -[SHDataFetcherFileInfo setStorefront:](v17, "setStorefront:", v9);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHDataFetcherFileInfo setCreationDate:](v17, "setCreationDate:", v18);

      -[SHDataFetcherFileInfo setUniqueHash:](v17, "setUniqueHash:", v16);
      ((void (**)(id, SHDataFetcherFileInfo *, SHDataFetcherFileInfo *))v11)[2](v11, v17, 0);
    }

  }
  else
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 200, 0);
    v16 = (SHDataFetcherFileInfo *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v16);
  }

}

- (void)clusterDataAtURL:(id)a3 forLocation:(id)a4 date:(id)a5 completionHandler:(id)a6
{
  void *v8;
  void (**v9)(id, SHDataFetcherFileInfo *, void *);
  id v10;
  id v11;
  void *v12;
  SHDataFetcherFileInfo *v13;
  id v14;

  v8 = (void *)MEMORY[0x24BDBCE50];
  v9 = (void (**)(id, SHDataFetcherFileInfo *, void *))a6;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v8, "dataWithContentsOfURL:", v11);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v12 = 0;
  }
  else
  {
    +[SHInsightsError errorWithCode:underlyingError:](SHInsightsError, "errorWithCode:underlyingError:", 200, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = -[SHDataFetcherFileInfo initWithDataURL:]([SHDataFetcherFileInfo alloc], "initWithDataURL:", v11);

  -[SHDataFetcherFileInfo setCreationDate:](v13, "setCreationDate:", v10);
  v9[2](v9, v13, v12);

}

@end
