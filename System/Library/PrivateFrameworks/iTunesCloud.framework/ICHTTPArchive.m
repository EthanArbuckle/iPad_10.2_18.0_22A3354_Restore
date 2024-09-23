@implementation ICHTTPArchive

uint64_t __42__ICHTTPArchive__loadExistingArchivePaths__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_arrayFromHeaderDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = CFSTR("name");
        v18[1] = CFSTR("value");
        v19[0] = v9;
        v19[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  return v4;
}

void __101__ICHTTPArchive_initWithArchiveDirectoryPath_maxArchiveFiles_maxArchiveBodyLength_flushDelaySeconds___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  uint64_t v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  +[ICClientInfo defaultInfo](ICClientInfo, "defaultInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  MSVMediaLoggingDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  v19[1] = CFSTR("HTTPArchives");
  objc_msgSend(v2, "clientIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E4391778;
  if (v5)
    v7 = (const __CFString *)v5;
  v19[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathWithComponents:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = v9;

  v12 = *(void **)(a1 + 40);
  if (v12)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v12);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  if (objc_msgSend(v13, "fileExistsAtPath:isDirectory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), &v16)
    && !v16)
  {
    objc_msgSend(v13, "removeItemAtPath:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), 0);
  }
  objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), 1, 0, 0);
  if (objc_msgSend(v13, "fileExistsAtPath:isDirectory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), &v16)
    && v16)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  }
  else
  {
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      *(_DWORD *)buf = 138543362;
      v18 = v15;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_ERROR, "ICHTTPArchive directory '%{public}@' is not a directory! Disabling archiving", buf, 0xCu);
    }

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "_loadExistingArchivePaths");
  objc_msgSend(*(id *)(a1 + 32), "_pruneOldArchives");

}

- (void)_onQueueFlush
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *currentArchiveFileName;
  NSDateFormatter *v8;
  NSDateFormatter *dateFormatter;
  void *v10;
  void *v11;
  void *v12;
  NSDateFormatter *v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableArray *archiveFilePaths;
  void *v22;
  NSString *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_loggedEvents, "count"))
  {
    v3 = (void *)MEMORY[0x1A1AFA708]();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", CFSTR("1.2"), CFSTR("version"));
    -[ICHTTPArchive _archiveCreator](self, "_archiveCreator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("creator"));

    objc_msgSend(v4, "setObject:forKey:", self->_loggedEvents, CFSTR("entries"));
    v24 = CFSTR("log");
    v25[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    currentArchiveFileName = self->_currentArchiveFileName;
    if (!currentArchiveFileName)
    {
      if (!self->_dateFormatter)
      {
        v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
        dateFormatter = self->_dateFormatter;
        self->_dateFormatter = v8;

        -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm-ss-SSSS"));
      }
      +[ICClientInfo defaultInfo](ICClientInfo, "defaultInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "clientIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_dateFormatter;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](v13, "stringFromDate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_%@.har"), v12, v15);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      v17 = self->_currentArchiveFileName;
      self->_currentArchiveFileName = v16;

      currentArchiveFileName = self->_currentArchiveFileName;
    }
    -[NSString stringByAppendingPathComponent:](self->_archiveDirectoryPath, "stringByAppendingPathComponent:", currentArchiveFileName);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      objc_msgSend(v19, "writeToFile:atomically:", v18, 0);
    archiveFilePaths = self->_archiveFilePaths;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray insertObject:atIndex:](archiveFilePaths, "insertObject:atIndex:", v22, 0);

    -[ICHTTPArchive _pruneOldArchives](self, "_pruneOldArchives");
    if ((unint64_t)-[NSMutableArray count](self->_loggedEvents, "count") >= 2)
    {
      -[NSMutableArray removeAllObjects](self->_loggedEvents, "removeAllObjects");
      v23 = self->_currentArchiveFileName;
      self->_currentArchiveFileName = 0;

    }
    objc_autoreleasePoolPop(v3);
  }
}

- (void)_pruneOldArchives
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((self->_maxArchiveFiles & 0x8000000000000000) == 0)
  {
    while ((unint64_t)-[NSMutableArray count](self->_archiveFilePaths, "count") > self->_maxArchiveFiles)
    {
      -[NSMutableArray lastObject](self->_archiveFilePaths, "lastObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeItemAtURL:error:", v3, 0);
      -[NSMutableArray removeLastObject](self->_archiveFilePaths, "removeLastObject");

    }
  }

}

- (void)_loadExistingArchivePaths
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *archiveFilePaths;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_archiveDirectoryPath, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, MEMORY[0x1E0C9AA60], 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_79);
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  archiveFilePaths = self->_archiveFilePaths;
  self->_archiveFilePaths = v6;

}

- (id)_archiveCreator
{
  NSDictionary *creatorDictionary;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  NSDictionary *v13;
  NSDictionary *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  creatorDictionary = self->_creatorDictionary;
  if (!creatorDictionary)
  {
    +[ICClientInfo defaultInfo](ICClientInfo, "defaultInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("com.apple.itunescloud");
    if (v5)
      v7 = (__CFString *)v5;
    v8 = v7;

    objc_msgSend(v4, "clientVersion");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("1.0");
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    v16[0] = CFSTR("name");
    v16[1] = CFSTR("version");
    v17[0] = v8;
    v17[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v14 = self->_creatorDictionary;
    self->_creatorDictionary = v13;

    creatorDictionary = self->_creatorDictionary;
  }
  return creatorDictionary;
}

void __77__ICHTTPArchive_archiveRequest_withResponse_responseData_performanceMetrics___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  id v17;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[72])
  {
    objc_msgSend(v2, "_archiveForRequest:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v17 = v3;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("request"));
      v5 = *(_QWORD *)(a1 + 48);
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "_archiveForResponse:responseData:", v5, *(_QWORD *)(a1 + 56));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("response"));

      }
      v7 = *(void **)(a1 + 64);
      if (v7)
      {
        v8 = (void *)MEMORY[0x1E0CB36A8];
        v9 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v7, "requestStartTime");
        objc_msgSend(v9, "dateWithTimeIntervalSince1970:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringFromDate:timeZone:formatOptions:", v10, v11, 1907);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setValue:forKey:", v12, CFSTR("startedDateTime"));

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", v4);
      v13 = *(_QWORD *)(a1 + 32);
      if (*(uint64_t *)(v13 + 96) >= 1
        && (v14 = objc_msgSend(*(id *)(v13 + 8), "count"), v13 = *(_QWORD *)(a1 + 32), v14 < 2))
      {
        v15 = *(NSObject **)(v13 + 24);
        v16 = dispatch_time(0, 1000000000 * *(_QWORD *)(v13 + 96));
        dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      }
      else
      {
        objc_msgSend((id)v13, "_onQueueFlush");
      }

      v3 = v17;
    }

  }
}

- (id)_archiveForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "HTTPMethod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "HTTPMethod");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("method"));

  }
  objc_msgSend(v5, "setObject:forKey:", CFSTR("HTTP/1.1"), CFSTR("httpVersion"));
  objc_msgSend(v4, "allHTTPHeaderFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHTTPArchive _arrayFromHeaderDictionary:](self, "_arrayFromHeaderDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("headers"));

  objc_msgSend(v5, "setObject:forKey:", &unk_1E43E65F8, CFSTR("headersSize"));
  objc_msgSend(v4, "HTTPBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 4);
    if (!v11)
    {
      objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v11, "length"))
    {
      v19 = CFSTR("text");
      v20[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("postData"));

    }
  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "HTTPBody");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("bodySize"));

  objc_msgSend(v4, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "absoluteString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("url"));

  return v5;
}

- (id)_archiveForResponse:(id)a3 responseData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "statusCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("status"));

    objc_msgSend(MEMORY[0x1E0C92C18], "localizedStringForStatusCode:", objc_msgSend(v9, "statusCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("statusText"));
    objc_msgSend(v8, "setObject:forKey:", CFSTR("HTTP/1.1"), CFSTR("httpVersion"));
    objc_msgSend(v9, "allHeaderFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICHTTPArchive _arrayFromHeaderDictionary:](self, "_arrayFromHeaderDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("headers"));

    objc_msgSend(v8, "setObject:forKey:", &unk_1E43E65F8, CFSTR("headersSize"));
    if (v7
      && (self->_maxArchiveBodyLength < 0 || (unint64_t)objc_msgSend(v7, "length") < self->_maxArchiveBodyLength))
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v9, "MIMEType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("mimeType"));
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
      if (!v16)
      {
        objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v16, "length"))
      {
        objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("text"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "length"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("bodySize"));

      }
      objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("content"));

    }
  }

  return v8;
}

- (void)archiveRequest:(id)a3 withResponse:(id)a4 responseData:(id)a5 performanceMetrics:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *accessQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ICHTTPArchive_archiveRequest_withResponse_responseData_performanceMetrics___block_invoke;
  block[3] = &unk_1E438B000;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_sync(accessQueue, block);

}

+ (ICHTTPArchive)sharedArchive
{
  if (sharedArchive_sOnceToken != -1)
    dispatch_once(&sharedArchive_sOnceToken, &__block_literal_global_7401);
  return (ICHTTPArchive *)(id)sharedArchive_sSharedArchive;
}

void __30__ICHTTPArchive_sharedArchive__block_invoke()
{
  ICHTTPArchive *v0;
  void *v1;

  v0 = objc_alloc_init(ICHTTPArchive);
  v1 = (void *)sharedArchive_sSharedArchive;
  sharedArchive_sSharedArchive = (uint64_t)v0;

}

- (ICHTTPArchive)init
{
  return -[ICHTTPArchive initWithArchiveDirectoryPath:maxArchiveFiles:maxArchiveBodyLength:flushDelaySeconds:](self, "initWithArchiveDirectoryPath:maxArchiveFiles:maxArchiveBodyLength:flushDelaySeconds:", 0, 25, 204800, 10);
}

- (ICHTTPArchive)initWithArchiveDirectoryPath:(id)a3 maxArchiveFiles:(int64_t)a4 maxArchiveBodyLength:(int64_t)a5 flushDelaySeconds:(int64_t)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  dispatch_source_t *v19;
  dispatch_source_t v20;
  dispatch_source_t v21;
  NSObject *v22;
  _QWORD handler[4];
  id v25;
  id location;
  _QWORD block[4];
  dispatch_source_t *v28;
  id v29;
  int64_t v30;
  int64_t v31;
  int64_t v32;
  objc_super v33;

  v10 = a3;
  v33.receiver = self;
  v33.super_class = (Class)ICHTTPArchive;
  v11 = -[ICHTTPArchive init](&v33, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v11 + 1);
    *((_QWORD *)v11 + 1) = v12;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.itunescloud.ICHTTPArchive.accessQueue", v14);
    v16 = (void *)*((_QWORD *)v11 + 2);
    *((_QWORD *)v11 + 2) = v15;

    v17 = *((_QWORD *)v11 + 2);
    v18 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__ICHTTPArchive_initWithArchiveDirectoryPath_maxArchiveFiles_maxArchiveBodyLength_flushDelaySeconds___block_invoke;
    block[3] = &unk_1E438AFD8;
    v19 = (dispatch_source_t *)v11;
    v28 = v19;
    v29 = v10;
    v30 = a4;
    v31 = a5;
    v32 = a6;
    dispatch_async(v17, block);
    v20 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v11 + 2));
    v21 = v19[3];
    v19[3] = v20;

    objc_initWeak(&location, v19);
    v22 = v19[3];
    handler[0] = v18;
    handler[1] = 3221225472;
    handler[2] = __101__ICHTTPArchive_initWithArchiveDirectoryPath_maxArchiveFiles_maxArchiveBodyLength_flushDelaySeconds___block_invoke_10;
    handler[3] = &unk_1E4391400;
    objc_copyWeak(&v25, &location);
    dispatch_source_set_event_handler(v22, handler);
    dispatch_source_set_timer(v19[3], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_resume(v19[3]);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  return (ICHTTPArchive *)v11;
}

- (id)initUnboundedArchiveWithDirectoryPath:(id)a3
{
  return -[ICHTTPArchive initWithArchiveDirectoryPath:maxArchiveFiles:maxArchiveBodyLength:flushDelaySeconds:](self, "initWithArchiveDirectoryPath:maxArchiveFiles:maxArchiveBodyLength:flushDelaySeconds:", a3, -1, -1, 0);
}

- (void)dealloc
{
  NSObject *accessQueue;
  NSObject *flushTimer;
  objc_super v5;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__ICHTTPArchive_dealloc__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  flushTimer = self->_flushTimer;
  if (flushTimer)
    dispatch_source_cancel(flushTimer);
  v5.receiver = self;
  v5.super_class = (Class)ICHTTPArchive;
  -[ICHTTPArchive dealloc](&v5, sel_dealloc);
}

- (void)archiveRequest:(id)a3 withResponse:(id)a4 responseData:(id)a5
{
  -[ICHTTPArchive archiveRequest:withResponse:responseData:performanceMetrics:](self, "archiveRequest:withResponse:responseData:performanceMetrics:", a3, a4, a5, 0);
}

- (void)flush
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__ICHTTPArchive_flush__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveFilePaths, 0);
  objc_storeStrong((id *)&self->_archiveDirectoryPath, 0);
  objc_storeStrong((id *)&self->_creatorDictionary, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_currentArchiveFileName, 0);
  objc_storeStrong((id *)&self->_flushTimer, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_loggedEvents, 0);
}

uint64_t __22__ICHTTPArchive_flush__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueFlush");
}

uint64_t __24__ICHTTPArchive_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueFlush");
}

void __101__ICHTTPArchive_initWithArchiveDirectoryPath_maxArchiveFiles_maxArchiveBodyLength_flushDelaySeconds___block_invoke_10(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_onQueueFlush");

}

@end
