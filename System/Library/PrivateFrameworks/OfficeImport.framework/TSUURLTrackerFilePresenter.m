@implementation TSUURLTrackerFilePresenter

- (TSUURLTrackerFilePresenter)init
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUURLTrackerFilePresenter init]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUURLTracker.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 194, 0, "Do not call method");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[TSUURLTrackerFilePresenter init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (TSUURLTrackerFilePresenter)initWithURL:(id)a3 bookmarkData:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  TSUURLTrackerFilePresenter *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *accessQueue;
  uint64_t v14;
  NSURL *URLIfAvailable;
  uint64_t v16;
  NSData *bookmarkDataIfAvailable;
  void *v18;
  void *v19;
  uint64_t v20;
  NSOperationQueue *presentedItemOperationQueue;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TSUURLTrackerFilePresenter;
  v11 = -[TSUURLTrackerFilePresenter init](&v23, sel_init);
  if (v11)
  {
    v12 = dispatch_queue_create("TSUURLTrackerFilePresenter.access", 0);
    accessQueue = v11->_accessQueue;
    v11->_accessQueue = (OS_dispatch_queue *)v12;

    v14 = objc_msgSend(v8, "copy");
    URLIfAvailable = v11->_URLIfAvailable;
    v11->_URLIfAvailable = (NSURL *)v14;

    v16 = objc_msgSend(v9, "copy");
    bookmarkDataIfAvailable = v11->_bookmarkDataIfAvailable;
    v11->_bookmarkDataIfAvailable = (NSData *)v16;

    v18 = (void *)MEMORY[0x24BDD1710];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TSUURLTrackerFilePresenter-%p"), v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "tsu_newSerialOperationQueueWithName:", v19);
    presentedItemOperationQueue = v11->_presentedItemOperationQueue;
    v11->_presentedItemOperationQueue = (NSOperationQueue *)v20;

    objc_storeWeak((id *)&v11->_delegate, v10);
  }

  return v11;
}

- (id)URLAndReturnError:(id *)a3
{
  NSObject *accessQueue;
  void *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__10;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__10;
  v13 = __Block_byref_object_dispose__10;
  v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__TSUURLTrackerFilePresenter_URLAndReturnError___block_invoke;
  block[3] = &unk_24F39B8A8;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(accessQueue, block);
  v5 = (void *)v10[5];
  if (a3 && !v5)
  {
    *a3 = objc_retainAutorelease((id)v16[5]);
    v5 = (void *)v10[5];
  }
  v6 = v5;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __48__TSUURLTrackerFilePresenter_URLAndReturnError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_URLAndReturnError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_URLAndReturnError:(id *)a3
{
  NSURL *URLIfAvailable;
  NSURL *v5;
  NSData *bookmarkDataIfAvailable;
  void *v8;
  NSURL *v9;
  NSURL *v10;
  NSURL *v11;
  NSURL *v12;
  NSURL *v13;
  NSURL *v14;
  _QWORD v16[7];
  id obj;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__10;
  v23 = __Block_byref_object_dispose__10;
  v24 = 0;
  URLIfAvailable = self->_URLIfAvailable;
  if (!URLIfAvailable)
  {
    bookmarkDataIfAvailable = self->_bookmarkDataIfAvailable;
    if (bookmarkDataIfAvailable)
    {
      v18 = 0;
      obj = 0;
      objc_msgSend(MEMORY[0x24BDBCF48], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", bookmarkDataIfAvailable, 768, 0, &v18, &obj);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(&v24, obj);
      v9 = (NSURL *)objc_msgSend(v8, "copy");
      v10 = self->_URLIfAvailable;
      self->_URLIfAvailable = v9;

      v11 = self->_URLIfAvailable;
      if (v11)
      {
        if (v18)
        {
          v16[0] = MEMORY[0x24BDAC760];
          v16[1] = 3221225472;
          v16[2] = __49__TSUURLTrackerFilePresenter__URLAndReturnError___block_invoke;
          v16[3] = &unk_24F39B8F0;
          v16[4] = self;
          v16[5] = &v19;
          v16[6] = 0;
          -[NSURL tsu_performSecurityScopedResourceAccessUsingBlock:](v11, "tsu_performSecurityScopedResourceAccessUsingBlock:", v16);
        }
      }
      else
      {
        objc_storeStrong((id *)&self->_latestError, (id)v20[5]);
      }
      v12 = self->_URLIfAvailable;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;
    v5 = v13;
    if (!a3 || v13)
    {
      if (v13)
        goto LABEL_19;
    }
    else
    {
      *a3 = objc_retainAutorelease(self->_latestError);
    }
    if (self->_bookmarkDataIfAvailable)
    {
      if (TSUDefaultCat_init_token == -1)
      {
        v5 = 0;
        goto LABEL_19;
      }
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_86_0);
    }
    v5 = 0;
    goto LABEL_19;
  }
  v5 = URLIfAvailable;
LABEL_19:
  if (!self->_hasStarted && self->_bookmarkDataIfAvailable)
  {
    v14 = self->_URLIfAvailable;
    self->_URLIfAvailable = 0;

  }
  _Block_object_dispose(&v19, 8);

  return v5;
}

void __49__TSUURLTrackerFilePresenter__URLAndReturnError___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 24);
  v4 = a1[6];
  v5 = *(_QWORD *)(v2 + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v3, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", v4, 0, 0, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    v7 = objc_msgSend(v6, "copy");
    v8 = a1[4];
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = v7;

  }
  else if (TSUDefaultCat_init_token != -1)
  {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_21);
  }

}

void __49__TSUURLTrackerFilePresenter__URLAndReturnError___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __49__TSUURLTrackerFilePresenter__URLAndReturnError___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (NSData)bookmarkData
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__TSUURLTrackerFilePresenter_bookmarkData__block_invoke;
  v5[3] = &unk_24F39B4D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __42__TSUURLTrackerFilePresenter_bookmarkData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_bookmarkData");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_bookmarkData
{
  void *v3;
  id v4;
  NSURL *URLIfAvailable;
  id v7;

  v7 = 0;
  -[TSUURLTrackerFilePresenter _bookmarkDataAndReturnError:](self, "_bookmarkDataAndReturnError:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (!v3 && self->_URLIfAvailable && TSUDefaultCat_init_token != -1)
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_87);
  if (!self->_hasStarted && self->_bookmarkDataIfAvailable)
  {
    URLIfAvailable = self->_URLIfAvailable;
    self->_URLIfAvailable = 0;

  }
  return v3;
}

void __43__TSUURLTrackerFilePresenter__bookmarkData__block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (void)startOrResume
{
  NSObject *accessQueue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__TSUURLTrackerFilePresenter_startOrResume__block_invoke;
  v4[3] = &unk_24F39B958;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(accessQueue, v4);
  if (*((_BYTE *)v6 + 24))
    objc_msgSend(MEMORY[0x24BDD1570], "addFilePresenter:", self);
  _Block_object_dispose(&v5, 8);
}

void __43__TSUURLTrackerFilePresenter_startOrResume__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 16) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_URLAndReturnError:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    else
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;

  }
}

- (void)pause
{
  NSObject *accessQueue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__TSUURLTrackerFilePresenter_pause__block_invoke;
  v4[3] = &unk_24F39B958;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(accessQueue, v4);
  if (*((_BYTE *)v6 + 24))
    objc_msgSend(MEMORY[0x24BDD1570], "removeFilePresenter:", self);
  _Block_object_dispose(&v5, 8);
}

id __35__TSUURLTrackerFilePresenter_pause__block_invoke(id result)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = *((_QWORD *)result + 4);
  if (*(_BYTE *)(v1 + 16))
  {
    v2 = result;
    *(_BYTE *)(v1 + 16) = 0;
    result = (id)objc_msgSend(*((id *)result + 4), "_bookmarkData");
    *(_BYTE *)(*(_QWORD *)(v2[5] + 8) + 24) = 1;
  }
  return result;
}

- (void)stop
{
  NSObject *accessQueue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__TSUURLTrackerFilePresenter_stop__block_invoke;
  v4[3] = &unk_24F39B958;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(accessQueue, v4);
  if (*((_BYTE *)v6 + 24))
    objc_msgSend(MEMORY[0x24BDD1570], "removeFilePresenter:", self);
  _Block_object_dispose(&v5, 8);
}

uint64_t __34__TSUURLTrackerFilePresenter_stop__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 16) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (id)bookmarkDataAndReturnError:(id *)a3
{
  NSObject *accessQueue;
  void *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__10;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__10;
  v13 = __Block_byref_object_dispose__10;
  v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__TSUURLTrackerFilePresenter_bookmarkDataAndReturnError___block_invoke;
  block[3] = &unk_24F39B8A8;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(accessQueue, block);
  v5 = (void *)v10[5];
  if (a3 && !v5)
  {
    *a3 = objc_retainAutorelease((id)v16[5]);
    v5 = (void *)v10[5];
  }
  v6 = v5;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __57__TSUURLTrackerFilePresenter_bookmarkDataAndReturnError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_bookmarkDataAndReturnError:", &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)_bookmarkDataAndReturnError:(id *)a3
{
  NSData *bookmarkDataIfAvailable;
  NSURL *URLIfAvailable;
  NSData *v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  NSData *v15;

  bookmarkDataIfAvailable = self->_bookmarkDataIfAvailable;
  if (!bookmarkDataIfAvailable)
  {
    URLIfAvailable = self->_URLIfAvailable;
    if (URLIfAvailable)
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x3032000000;
      v13 = __Block_byref_object_copy__10;
      v14 = __Block_byref_object_dispose__10;
      v15 = 0;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __58__TSUURLTrackerFilePresenter__bookmarkDataAndReturnError___block_invoke;
      v9[3] = &unk_24F39B8F0;
      v9[5] = &v10;
      v9[6] = 0;
      v9[4] = self;
      -[NSURL tsu_performSecurityScopedResourceAccessUsingBlock:](URLIfAvailable, "tsu_performSecurityScopedResourceAccessUsingBlock:", v9);
      if (!self->_bookmarkDataIfAvailable)
        objc_storeStrong((id *)&self->_latestError, (id)v11[5]);
      _Block_object_dispose(&v10, 8);
      bookmarkDataIfAvailable = v15;
      goto LABEL_8;
    }
  }
  if (self->_latestError)
  {
    self->_bookmarkDataIfAvailable = 0;
LABEL_8:

  }
  v7 = self->_bookmarkDataIfAvailable;
  if (a3 && !v7)
  {
    *a3 = objc_retainAutorelease(self->_latestError);
    v7 = self->_bookmarkDataIfAvailable;
  }
  return v7;
}

void __58__TSUURLTrackerFilePresenter__bookmarkDataAndReturnError___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = a1[5];
  v3 = *(void **)(a1[4] + 24);
  v4 = a1[6];
  v5 = *(_QWORD *)(v2 + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v3, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", v4, 0, 0, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = objc_msgSend(v6, "copy");
  v8 = a1[4];
  v9 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v7;

}

- (NSURL)presentedItemURL
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__TSUURLTrackerFilePresenter_presentedItemURL__block_invoke;
  v5[3] = &unk_24F39B4D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __46__TSUURLTrackerFilePresenter_presentedItemURL__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)relinquishPresentedItemToWriter:(id)a3
{
  id WeakRetained;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "relinquishPresentedItemToWriter:", v5);
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }

}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  id WeakRetained;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  -[TSUURLTrackerFilePresenter stop](self, "stop");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "accommodatePresentedItemDeletionWithCompletionHandler:", v5);
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }

}

- (void)presentedItemDidMoveToURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *accessQueue;
  id v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  TSUURLTrackerFilePresenter *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  accessQueue = self->_accessQueue;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __56__TSUURLTrackerFilePresenter_presentedItemDidMoveToURL___block_invoke;
  v12 = &unk_24F39B500;
  v13 = self;
  v7 = v5;
  v14 = v7;
  dispatch_async(accessQueue, &v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "presentedItemDidMoveToURL:", v4, v9, v10, v11, v12, v13);

}

void __56__TSUURLTrackerFilePresenter_presentedItemDidMoveToURL___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (void)presentedItemDidChangeUbiquityAttributes:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSUURLTrackerFilePresenter presentedItemURL](self, "presentedItemURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tsu_removeCachedResourceValueForKeys:", v6);

    objc_msgSend(WeakRetained, "presentedItemDidChangeUbiquityAttributes:", v7);
  }

}

- (id)_description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p URL=%@>"), v5, self, self->_URLIfAvailable);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)description
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__TSUURLTrackerFilePresenter_description__block_invoke;
  v5[3] = &unk_24F39B4D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __41__TSUURLTrackerFilePresenter_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_description");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestError, 0);
  objc_storeStrong((id *)&self->_bookmarkDataIfAvailable, 0);
  objc_storeStrong((id *)&self->_URLIfAvailable, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
