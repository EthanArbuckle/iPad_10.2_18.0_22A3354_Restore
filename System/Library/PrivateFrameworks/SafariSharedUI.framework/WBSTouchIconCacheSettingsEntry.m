@implementation WBSTouchIconCacheSettingsEntry

- (BOOL)isIconInCache
{
  return self->_iconInCache;
}

- (int64_t)transparencyAnalysisResult
{
  return self->_transparencyAnalysisResult;
}

- (NSString)host
{
  return self->_host;
}

- (WBSTouchIconCacheSettingsEntry)initWithSQLiteRow:(id)a3
{
  id v4;
  void *v5;
  WBSTouchIconCacheSettingsEntry *v6;
  void *v7;
  uint64_t v8;
  NSDate *lastRequestDate;
  char v10;
  uint64_t v11;
  NSString *UUIDString;
  WBSTouchIconCacheSettingsEntry *v13;

  v4 = a3;
  objc_msgSend(v4, "stringAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBSTouchIconCacheSettingsEntry initWithHost:](self, "initWithHost:", v5);
  if (v6)
  {
    v6->_databaseID = objc_msgSend(v4, "int64AtIndex:", 0);
    v7 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "doubleAtIndex:", 2);
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    v8 = objc_claimAutoreleasedReturnValue();
    lastRequestDate = v6->_lastRequestDate;
    v6->_lastRequestDate = (NSDate *)v8;

    v6->_lastRequestWasInUserLoadedWebpage = objc_msgSend(v4, "BOOLAtIndex:", 3);
    v6->_requestCount = objc_msgSend(v4, "int64AtIndex:", 4);
    v6->_iconInCache = objc_msgSend(v4, "BOOLAtIndex:", 5);
    v10 = objc_msgSend(v4, "int64AtIndex:", 6);
    v6->_requestDidSucceed = v10 & 1;
    v6->_higherPriorityIconDownloadFailedDueToNetworkError = (v10 & 2) != 0;
    v6->_transparencyAnalysisResult = objc_msgSend(v4, "int64AtIndex:", 8);
    objc_msgSend(v4, "stringAtIndex:", 9);
    v11 = objc_claimAutoreleasedReturnValue();
    UUIDString = v6->_UUIDString;
    v6->_UUIDString = (NSString *)v11;

    v6->_lastResponseStatusCode = objc_msgSend(v4, "int64AtIndex:", 10);
    v13 = v6;
  }

  return v6;
}

- (WBSTouchIconCacheSettingsEntry)initWithHost:(id)a3
{
  id v4;
  WBSTouchIconCacheSettingsEntry *v5;
  uint64_t v6;
  NSString *host;
  WBSTouchIconCacheSettingsEntry *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSTouchIconCacheSettingsEntry;
  v5 = -[WBSTouchIconCacheSettingsEntry init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    host = v5->_host;
    v5->_host = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

+ (id)entryWithHost:(id)a3 lastRequestDate:(id)a4 lastRequestWasInUserLoadedWebpage:(BOOL)a5 requestCount:(int64_t)a6 iconInCache:(BOOL)a7 requestDidSucceed:(BOOL)a8 lastResponseStatusCode:(int64_t)a9 transparencyAnalysisResult:(int64_t)a10 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a11 UUIDString:(id)a12
{
  _BOOL8 v12;
  _BOOL8 v14;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;
  _BOOL4 v23;

  v23 = a8;
  v12 = a7;
  v14 = a5;
  v17 = a3;
  v18 = a4;
  v19 = a12;
  LOBYTE(v22) = a11;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithHost:lastRequestDate:lastRequestWasInUserLoadedWebpage:requestCount:iconInCache:requestDidSucceed:lastResponseStatusCode:transparencyAnalysisResult:higherPriorityIconDownloadFailedDueToNetworkError:UUIDString:", v17, v18, v14, a6, v12, v23, a9, a10, v22, v19);

  return v20;
}

- (WBSTouchIconCacheSettingsEntry)init
{
  return -[WBSTouchIconCacheSettingsEntry initWithHost:](self, "initWithHost:", &stru_1E5449658);
}

- (WBSTouchIconCacheSettingsEntry)initWithHost:(id)a3 lastRequestDate:(id)a4 lastRequestWasInUserLoadedWebpage:(BOOL)a5 requestCount:(int64_t)a6 iconInCache:(BOOL)a7 requestDidSucceed:(BOOL)a8 lastResponseStatusCode:(int64_t)a9 transparencyAnalysisResult:(int64_t)a10 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a11 UUIDString:(id)a12
{
  id v18;
  id v19;
  WBSTouchIconCacheSettingsEntry *v20;
  WBSTouchIconCacheSettingsEntry *v21;
  uint64_t v22;
  NSString *UUIDString;
  WBSTouchIconCacheSettingsEntry *v24;
  id v26;

  v18 = a3;
  v26 = a4;
  v19 = a12;
  v20 = -[WBSTouchIconCacheSettingsEntry initWithHost:](self, "initWithHost:", v18);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_lastRequestDate, a4);
    v21->_lastRequestWasInUserLoadedWebpage = a5;
    v21->_iconInCache = a7;
    v21->_requestDidSucceed = a8;
    v21->_requestCount = a6;
    v21->_transparencyAnalysisResult = a10;
    v21->_higherPriorityIconDownloadFailedDueToNetworkError = a11;
    v22 = objc_msgSend(v19, "copy");
    UUIDString = v21->_UUIDString;
    v21->_UUIDString = (NSString *)v22;

    v21->_lastResponseStatusCode = a9;
    v24 = v21;
  }

  return v21;
}

- (WBSTouchIconCacheSettingsEntry)entryWithDatabaseID:(int64_t)a3
{
  id v5;
  _QWORD *v6;
  uint64_t v8;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_higherPriorityIconDownloadFailedDueToNetworkError;
  v6 = (_QWORD *)objc_msgSend(v5, "initWithHost:lastRequestDate:lastRequestWasInUserLoadedWebpage:requestCount:iconInCache:requestDidSucceed:lastResponseStatusCode:transparencyAnalysisResult:higherPriorityIconDownloadFailedDueToNetworkError:UUIDString:", self->_host, self->_lastRequestDate, self->_lastRequestWasInUserLoadedWebpage, self->_requestCount, self->_iconInCache, self->_requestDidSucceed, self->_lastResponseStatusCode, self->_transparencyAnalysisResult, v8, self->_UUIDString);
  v6[2] = a3;
  return (WBSTouchIconCacheSettingsEntry *)v6;
}

- (unint64_t)downloadStatusFlags
{
  if (self->_higherPriorityIconDownloadFailedDueToNetworkError)
    return self->_requestDidSucceed | 2;
  else
    return self->_requestDidSucceed;
}

- (id)entryByAddingRequestInUserLoadedWebPage:(BOOL)a3 isIconInCache:(BOOL)a4 requestDidSucceed:(BOOL)a5 lastResponseStatusCode:(int64_t)a6 transparencyAnalysisResult:(int64_t)a7 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a8 UUIDString:(id)a9
{
  _BOOL8 v12;
  _BOOL8 v13;
  id v15;
  id v16;
  NSString *host;
  void *v18;
  _QWORD *v19;
  uint64_t v21;
  _BOOL4 v22;

  v22 = a5;
  v12 = a4;
  v13 = a3;
  v15 = a9;
  v16 = objc_alloc((Class)objc_opt_class());
  host = self->_host;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = a8;
  v19 = (_QWORD *)objc_msgSend(v16, "initWithHost:lastRequestDate:lastRequestWasInUserLoadedWebpage:requestCount:iconInCache:requestDidSucceed:lastResponseStatusCode:transparencyAnalysisResult:higherPriorityIconDownloadFailedDueToNetworkError:UUIDString:", host, v18, v13, self->_requestCount + 1, v12, v22, a6, a7, v21, v15);

  v19[2] = self->_databaseID;
  return v19;
}

- (WBSTouchIconCacheSettingsEntry)entryWithTransparencyAnalysisResult:(int64_t)a3
{
  id v5;
  _QWORD *v6;
  uint64_t v8;

  v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_higherPriorityIconDownloadFailedDueToNetworkError;
  v6 = (_QWORD *)objc_msgSend(v5, "initWithHost:lastRequestDate:lastRequestWasInUserLoadedWebpage:requestCount:iconInCache:requestDidSucceed:lastResponseStatusCode:transparencyAnalysisResult:higherPriorityIconDownloadFailedDueToNetworkError:UUIDString:", self->_host, self->_lastRequestDate, self->_lastRequestWasInUserLoadedWebpage, self->_requestCount, self->_iconInCache, self->_requestDidSucceed, self->_lastResponseStatusCode, a3, v8, self->_UUIDString);
  v6[2] = self->_databaseID;
  return (WBSTouchIconCacheSettingsEntry *)v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_host, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  int64_t databaseID;
  NSString *host;
  void *v10;
  NSDate *lastRequestDate;
  void *v12;
  int lastRequestWasInUserLoadedWebpage;
  int64_t requestCount;
  int iconInCache;
  unint64_t v16;
  int64_t transparencyAnalysisResult;
  int64_t lastResponseStatusCode;
  BOOL v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if ((!(v6 | (uint64_t)self->_UUIDString) || (objc_msgSend((id)v6, "isEqualToString:") & 1) != 0)
      && (databaseID = self->_databaseID, databaseID == objc_msgSend(v5, "databaseID")))
    {
      host = self->_host;
      objc_msgSend(v5, "host");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](host, "isEqualToString:", v10))
      {
        lastRequestDate = self->_lastRequestDate;
        objc_msgSend(v5, "lastRequestDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSDate isEqualToDate:](lastRequestDate, "isEqualToDate:", v12)
          && (lastRequestWasInUserLoadedWebpage = self->_lastRequestWasInUserLoadedWebpage,
              lastRequestWasInUserLoadedWebpage == objc_msgSend(v5, "lastRequestWasInUserLoadedWebpage"))
          && (requestCount = self->_requestCount,
              requestCount == -[WBSTouchIconCacheSettingsEntry requestCount](self, "requestCount"))
          && (iconInCache = self->_iconInCache, iconInCache == objc_msgSend(v5, "isIconInCache"))
          && (v16 = -[WBSTouchIconCacheSettingsEntry downloadStatusFlags](self, "downloadStatusFlags"),
              v16 == objc_msgSend(v5, "downloadStatusFlags"))
          && (transparencyAnalysisResult = self->_transparencyAnalysisResult,
              transparencyAnalysisResult == objc_msgSend(v5, "transparencyAnalysisResult")))
        {
          lastResponseStatusCode = self->_lastResponseStatusCode;
          v19 = lastResponseStatusCode == objc_msgSend(v5, "lastResponseStatusCode");
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; Host = \"%@\"; Last request date = %@; User loaded page = %d; Request count = %zd; Icon in cache = %d; Request did succeed = %d; Download status code = %zd; Higher priority icon download failed = %d; UUID = %@>"),
                       objc_opt_class(),
                       self,
                       self->_host,
                       self->_lastRequestDate,
                       self->_lastRequestWasInUserLoadedWebpage,
                       self->_requestCount,
                       self->_iconInCache,
                       self->_requestDidSucceed,
                       self->_lastResponseStatusCode,
                       self->_higherPriorityIconDownloadFailedDueToNetworkError,
                       self->_UUIDString);
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (NSDate)lastRequestDate
{
  return self->_lastRequestDate;
}

- (BOOL)lastRequestWasInUserLoadedWebpage
{
  return self->_lastRequestWasInUserLoadedWebpage;
}

- (int64_t)requestCount
{
  return self->_requestCount;
}

- (BOOL)requestDidSucceed
{
  return self->_requestDidSucceed;
}

- (BOOL)higherPriorityIconDownloadFailedDueToNetworkError
{
  return self->_higherPriorityIconDownloadFailedDueToNetworkError;
}

- (int64_t)lastResponseStatusCode
{
  return self->_lastResponseStatusCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRequestDate, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
