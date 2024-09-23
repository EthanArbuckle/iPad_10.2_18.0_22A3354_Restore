@implementation TSURemotePropertyList

- (TSURemotePropertyList)init
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSURemotePropertyList init]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSURemoteDefaults.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 41, 0, "Do not call method");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[TSURemotePropertyList init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (TSURemotePropertyList)initWithRemoteURL:(id)a3 localURL:(id)a4
{
  id v6;
  id v7;
  TSURemotePropertyList *v8;
  uint64_t v9;
  NSURL *remoteURL;
  uint64_t v11;
  NSURL *localURL;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *propertyList;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *accessQueue;
  objc_class *v23;
  void *v24;
  void *v25;
  id v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *checkQueue;
  void *v29;
  uint64_t v30;
  objc_super v32;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)TSURemotePropertyList;
  v8 = -[TSURemotePropertyList init](&v32, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    remoteURL = v8->_remoteURL;
    v8->_remoteURL = (NSURL *)v9;

    v11 = objc_msgSend(v7, "copy");
    localURL = v8->_localURL;
    v8->_localURL = (NSURL *)v11;

    if (v7)
    {
      if ((objc_msgSend(v7, "isFileURL") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSURemotePropertyList initWithRemoteURL:localURL:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSURemoteDefaults.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 52, 0, "Local URL should be a file URL.");

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      }
      v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:", v7);
      propertyList = v8->_propertyList;
      v8->_propertyList = (NSDictionary *)v15;

    }
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingString:", CFSTR(".Access"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_retainAutorelease(v19);
    v21 = dispatch_queue_create((const char *)objc_msgSend(v20, "UTF8String"), 0);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v21;

    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingString:", CFSTR(".Check"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_retainAutorelease(v25);
    v27 = dispatch_queue_create((const char *)objc_msgSend(v26, "UTF8String"), 0);
    checkQueue = v8->_checkQueue;
    v8->_checkQueue = (OS_dispatch_queue *)v27;

    -[TSURemotePropertyList startUpdateTimer](v8, "startUpdateTimer");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *MEMORY[0x24BDF7510];
    objc_msgSend(v29, "addObserver:selector:name:object:", v8, sel_processWillSuspend_, *MEMORY[0x24BDF75D8], 0);
    objc_msgSend(v29, "addObserver:selector:name:object:", v8, sel_processDidResume_, v30, 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  dispatch_source_cancel((dispatch_source_t)self->_updateTimer);
  v4.receiver = self;
  v4.super_class = (Class)TSURemotePropertyList;
  -[TSURemotePropertyList dealloc](&v4, sel_dealloc);
}

- (void)startUpdateTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *updateTimer;
  double v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_checkQueue);
  updateTimer = self->_updateTimer;
  self->_updateTimer = v3;

  -[TSURemotePropertyList timeIntervalUntilNextUpdate](self, "timeIntervalUntilNextUpdate");
  dispatch_source_set_timer((dispatch_source_t)self->_updateTimer, (unint64_t)(v5 * 1000000000.0), 0x4E94914F0000uLL, 0x34630B8A000uLL);
  objc_initWeak(&location, self);
  v6 = self->_updateTimer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__TSURemotePropertyList_startUpdateTimer__block_invoke;
  v7[3] = &unk_24F39C1B8;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_updateTimer);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __41__TSURemotePropertyList_startUpdateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "checkForUpdateWithCompletionHandler:", 0);

}

- (void)processWillSuspend:(id)a3
{
  NSObject *updateTimer;
  OS_dispatch_source *v5;

  updateTimer = self->_updateTimer;
  if (updateTimer)
  {
    dispatch_source_cancel(updateTimer);
    v5 = self->_updateTimer;
    self->_updateTimer = 0;

  }
}

- (void)processDidResume:(id)a3
{
  if (!self->_updateTimer)
    -[TSURemotePropertyList startUpdateTimer](self, "startUpdateTimer", a3);
}

- (void)updateIfNeededWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *checkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  checkQueue = self->_checkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__TSURemotePropertyList_updateIfNeededWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F39BDD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(checkQueue, v7);

}

_BYTE *__61__TSURemotePropertyList_updateIfNeededWithCompletionHandler___block_invoke(uint64_t a1)
{
  _BYTE *result;
  uint64_t v3;

  result = *(_BYTE **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (!result[56])
    return (_BYTE *)objc_msgSend(result, "checkForUpdateWithCompletionHandler:", v3);
  if (v3)
    return (_BYTE *)(*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  return result;
}

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__TSURemotePropertyList_objectForKey___block_invoke;
  block[3] = &unk_24F39B4B0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __38__TSURemotePropertyList_objectForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)stringForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_opt_class();
  -[TSURemotePropertyList objectForKey:](self, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  TSUDynamicCast(v5, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)URLForKey:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;

  -[TSURemotePropertyList objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  TSUDynamicCast(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 1;
  else
    v6 = v3 == 0;
  if (!v6)
  {
    v7 = objc_opt_class();
    TSUDynamicCast(v7, (uint64_t)v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_opt_class();
  -[TSURemotePropertyList objectForKey:](self, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  TSUDynamicCast(v5, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_opt_class();
  -[TSURemotePropertyList objectForKey:](self, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  TSUDynamicCast(v5, (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)checkForUpdateWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, void *);
  void *v16;
  TSURemotePropertyList *v17;
  id v18;
  id v19;
  uint64_t v20;

  v4 = a3;
  -[TSURemotePropertyList URLRequest](self, "URLRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_suspend((dispatch_object_t)self->_checkQueue);
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "beginBackgroundTaskWithExpirationHandler:", 0);
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __61__TSURemotePropertyList_checkForUpdateWithCompletionHandler___block_invoke;
  v16 = &unk_24F39C7A8;
  v17 = self;
  v18 = v6;
  v19 = v4;
  v20 = v7;
  v8 = v4;
  v9 = v6;
  v10 = _Block_copy(&v13);
  objc_msgSend(MEMORY[0x24BDD1850], "sharedSession", v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v5, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "resume");
}

void __61__TSURemotePropertyList_checkForUpdateWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v7 = a3;
  v8 = a2;
  v9 = (objc_class *)objc_opt_class();
  TSUCheckedDynamicCast(v9, (uint64_t)v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "processResponse:data:error:", v10, v8, v12);
  objc_msgSend(*(id *)(a1 + 40), "endBackgroundTask:", *(_QWORD *)(a1 + 56));
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v12);

}

- (id)validateUserDefaultsDownloadURL:(id)a3
{
  return a3;
}

- (double)timeIntervalUntilNextUpdate
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  objc_class *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("NextUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0.0;
  if (v6)
  {
    v8 = (objc_class *)objc_opt_class();
    TSUCheckedDynamicCast(v8, (uint64_t)v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceDate:", v10);
      v12 = v11;

      v7 = fmax(v12, 0.0);
    }
  }

  return v7;
}

- (id)URLRequest
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSURL *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("DownloadURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length")
    || (objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7), (v8 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v9 = (void *)v8,
        -[TSURemotePropertyList validateUserDefaultsDownloadURL:](self, "validateUserDefaultsDownloadURL:", v8),
        v10 = (NSURL *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    v10 = self->_remoteURL;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v10);
  objc_msgSend(v11, "setTimeoutInterval:", 20.0);
  objc_msgSend(v11, "setCachePolicy:", 1);
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", CFSTR("ETag"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "length"))
    objc_msgSend(v11, "setValue:forHTTPHeaderField:", v15, CFSTR("If-None-Match"));

  return v11;
}

- (void)processResponse:(id)a3 data:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "statusCode");
  v12 = v11;
  if (v11 == 304 || v11 == 200)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 86400.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingString:", CFSTR("NextUpdate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, v17);

    if (v12 == 200 && objc_msgSend(v9, "length"))
    {
      v25 = 0;
      -[TSURemotePropertyList deserializePropertyListData:error:](self, "deserializePropertyListData:error:", v9, &v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v25;

      if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[TSURemotePropertyList processPropertyList:](self, "processPropertyList:", v18);
        objc_msgSend(v8, "allHeaderFields");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", CFSTR("Etag"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByAppendingString:", CFSTR("ETag"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v21, v24);

        self->_didUpdateAtLeastOnce = 1;
      }
      else if (TSUDefaultCat_init_token != -1)
      {
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_35);
      }

      v10 = v19;
    }

  }
}

void __52__TSURemotePropertyList_processResponse_data_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (id)deserializePropertyListData:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, a4);
}

- (void)processPropertyList:(id)a3
{
  id v4;
  void *v5;
  NSURL *localURL;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = v4;
  localURL = self->_localURL;
  if (localURL
    && (objc_msgSend(v4, "writeToURL:atomically:", localURL, 0) & 1) == 0
    && TSUDefaultCat_init_token != -1)
  {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_40_0);
  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__TSURemotePropertyList_processPropertyList___block_invoke_2;
  v9[3] = &unk_24F39B500;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(accessQueue, v9);

}

void __45__TSURemotePropertyList_processPropertyList___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __45__TSURemotePropertyList_processPropertyList___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_checkQueue, 0);
  objc_storeStrong((id *)&self->_propertyList, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
}

@end
