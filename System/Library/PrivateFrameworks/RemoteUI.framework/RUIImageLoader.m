@implementation RUIImageLoader

+ (id)sharedImageLoader
{
  void *v2;
  RUIImageLoader *v3;
  void *v4;

  v2 = (void *)sharedImageLoader_sharedImageLoader;
  if (!sharedImageLoader_sharedImageLoader)
  {
    v3 = objc_alloc_init(RUIImageLoader);
    v4 = (void *)sharedImageLoader_sharedImageLoader;
    sharedImageLoader_sharedImageLoader = (uint64_t)v3;

    v2 = (void *)sharedImageLoader_sharedImageLoader;
  }
  return v2;
}

- (RUIImageLoader)init
{
  RUIImageLoader *v2;
  NSLock *v3;
  NSLock *queueLock;
  NSLock *v5;
  NSLock *cacheLock;
  NSMutableArray *v7;
  NSMutableArray *loadQueue;
  NSMutableSet *v9;
  NSMutableSet *loadsInProgress;
  uint64_t v11;
  NSMutableDictionary *imageCache;
  uint64_t v13;
  NSMutableArray *imageCacheLRU;
  uint64_t v15;
  NSMutableDictionary *loadCompletions;
  RUIImageLoader *v17;
  objc_super v19;
  pthread_mutexattr_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)RUIImageLoader;
  v2 = -[RUIImageLoader init](&v19, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    queueLock = v2->_queueLock;
    v2->_queueLock = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    cacheLock = v2->_cacheLock;
    v2->_cacheLock = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    loadQueue = v2->_loadQueue;
    v2->_loadQueue = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    loadsInProgress = v2->_loadsInProgress;
    v2->_loadsInProgress = v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 100);
    imageCache = v2->_imageCache;
    v2->_imageCache = (NSMutableDictionary *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 100);
    imageCacheLRU = v2->_imageCacheLRU;
    v2->_imageCacheLRU = (NSMutableArray *)v13;

    v15 = objc_opt_new();
    loadCompletions = v2->_loadCompletions;
    v2->_loadCompletions = (NSMutableDictionary *)v15;

    v20.__sig = 0;
    *(_QWORD *)v20.__opaque = 0;
    pthread_mutexattr_init(&v20);
    pthread_mutexattr_settype(&v20, 0);
    pthread_mutex_init(&v2->_startupLock, &v20);
    pthread_mutexattr_destroy(&v20);
    pthread_cond_init(&v2->_startupCondition, 0);
    pthread_mutex_lock(&v2->_startupLock);
    objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel__startLoader, v2, 0);
    pthread_cond_wait(&v2->_startupCondition, &v2->_startupLock);
    pthread_mutex_unlock(&v2->_startupLock);
    v17 = v2;
  }

  return v2;
}

- (BOOL)isLoadingImages
{
  BOOL v3;

  -[NSLock lock](self->_queueLock, "lock");
  if (-[NSMutableArray count](self->_loadQueue, "count"))
    v3 = 1;
  else
    v3 = -[NSMutableSet count](self->_loadsInProgress, "count") != 0;
  -[NSLock unlock](self->_queueLock, "unlock");
  return v3;
}

- (void)imageForURL:(id)a3 scale:(double)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  void (**v17)(id, void *, _QWORD);
  double v18;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a5;
  if (v8)
  {
    -[NSLock lock](self->_cacheLock, "lock");
    v10 = -[NSMutableDictionary objectForKey:](self->_imageCache, "objectForKey:", v8);
    if (v10)
    {
      v11 = v10;
      -[NSMutableArray removeObject:](self->_imageCacheLRU, "removeObject:", v8);
      -[NSMutableArray addObject:](self->_imageCacheLRU, "addObject:", v8);
      -[NSLock unlock](self->_cacheLock, "unlock");
      objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v11, 0, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v12, 0);

    }
    else
    {
      v13 = MEMORY[0x24BDAC760];
      v14 = 3221225472;
      v15 = __47__RUIImageLoader_imageForURL_scale_completion___block_invoke;
      v16 = &unk_24C297838;
      v18 = a4;
      v17 = v9;
      -[RUIImageLoader _loadImageURL:completion:](self, "_loadImageURL:completion:", v8, &v13);

      -[NSLock unlock](self->_cacheLock, "unlock", v13, v14, v15, v16);
    }
  }

}

void __47__RUIImageLoader_imageForURL_scale_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", a2, 0, *(double *)(a1 + 40));
    a2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a2)
    v5 = 0;
  else
    v5 = v6;
  (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, v5);

}

- (CGImage)imageForURL:(id)a3 loadIfAbsent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CGImage *v7;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    -[NSLock lock](self->_cacheLock, "lock");
    v7 = (CGImage *)-[NSMutableDictionary objectForKey:](self->_imageCache, "objectForKey:", v6);
    if (v7)
    {
      -[NSMutableArray removeObject:](self->_imageCacheLRU, "removeObject:", v6);
      -[NSMutableArray addObject:](self->_imageCacheLRU, "addObject:", v6);
    }
    else if (v4)
    {
      -[RUIImageLoader _loadImageURL:completion:](self, "_loadImageURL:completion:", v6, 0);
    }
    -[NSLock unlock](self->_cacheLock, "unlock");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)notificationCenter
{
  NSNotificationCenter *notificationCenter;
  NSNotificationCenter *v4;
  NSNotificationCenter *v5;

  notificationCenter = self->_notificationCenter;
  if (!notificationCenter)
  {
    v4 = (NSNotificationCenter *)objc_alloc_init(MEMORY[0x24BDD16D0]);
    v5 = self->_notificationCenter;
    self->_notificationCenter = v4;

    notificationCenter = self->_notificationCenter;
  }
  return notificationCenter;
}

- (void)_mainThread_postLoadingStatusChanged
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", RUIImageLoaderLoadingStatusDidChangeNotification, self);

}

- (void)_postLoadingStatusChanged
{
  NSTimer *loadStatusNotificationTimer;

  -[NSTimer invalidate](self->_loadStatusNotificationTimer, "invalidate");
  loadStatusNotificationTimer = self->_loadStatusNotificationTimer;
  self->_loadStatusNotificationTimer = 0;

  -[RUIImageLoader performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__mainThread_postLoadingStatusChanged, 0, 0);
}

- (void)_loadingStatusChanged
{
  NSTimer *v3;
  NSTimer *loadStatusNotificationTimer;

  if (!self->_loadStatusNotificationTimer)
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__postLoadingStatusChanged, 0, 0, 0.0);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    loadStatusNotificationTimer = self->_loadStatusNotificationTimer;
    self->_loadStatusNotificationTimer = v3;

  }
}

- (void)_startLoader
{
  __CFRunLoopSource *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  CFRunLoopSourceContext v7;

  self->_loaderRunLoop = CFRunLoopGetCurrent();
  v7.version = 0;
  memset(&v7.retain, 0, 56);
  v7.info = self;
  v7.perform = (void (__cdecl *)(void *))_loadImages;
  v3 = CFRunLoopSourceCreate(0, 0, &v7);
  self->_loaderSource = v3;
  v4 = (const __CFString *)*MEMORY[0x24BDBD5A0];
  CFRunLoopAddSource(self->_loaderRunLoop, v3, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  pthread_mutex_lock(&self->_startupLock);
  pthread_cond_signal(&self->_startupCondition);
  v5 = pthread_mutex_unlock(&self->_startupLock);
  while (1)
  {
    v6 = (void *)MEMORY[0x20BD1D54C](v5);
    CFRunLoopRunInMode(v4, 6.31139904e10, 1u);
    objc_autoreleasePoolPop(v6);
  }
}

- (BOOL)_locked_URLIsLoading:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;

  v4 = a3;
  -[NSMutableSet objectEnumerator](self->_loadsInProgress, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  while (1)
  {
    v7 = v6;
    objc_msgSend(v5, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      break;
    objc_msgSend(v6, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v4);

    if ((v9 & 1) != 0)
    {
      v10 = 1;
      goto LABEL_9;
    }
  }
  -[NSMutableArray objectEnumerator](self->_loadQueue, "objectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  do
  {
    v12 = v6;
    objc_msgSend(v11, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v6 != 0;
    if (!v6)
      break;
    objc_msgSend(v6, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", v4);

  }
  while (!v14);
  v5 = v11;
LABEL_9:

  return v10;
}

- (void)_locked_loadImageForURL:(id)a3
{
  id v4;
  RUIImageLoad *v5;

  v4 = a3;
  v5 = objc_alloc_init(RUIImageLoad);
  -[RUIImageLoad setURL:](v5, "setURL:", v4);

  -[NSMutableArray addObject:](self->_loadQueue, "addObject:", v5);
}

- (void)_loadImageURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[NSLock lock](self->_queueLock, "lock");
  v7 = v10;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_loadCompletions, "objectForKey:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = (void *)objc_opt_new();
      -[NSMutableDictionary setObject:forKey:](self->_loadCompletions, "setObject:forKey:", v8, v10);
    }
    v9 = _Block_copy(v6);
    objc_msgSend(v8, "addObject:", v9);

    v7 = v10;
  }
  if (-[RUIImageLoader _locked_URLIsLoading:](self, "_locked_URLIsLoading:", v7))
  {
    -[NSLock unlock](self->_queueLock, "unlock");
  }
  else
  {
    -[RUIImageLoader _locked_loadImageForURL:](self, "_locked_loadImageForURL:", v10);
    -[NSLock unlock](self->_queueLock, "unlock");
    CFRunLoopSourceSignal(self->_loaderSource);
    CFRunLoopWakeUp(self->_loaderRunLoop);
  }

}

- (void)_callCompletionsForURL:(id)a3 image:(CGImage *)a4 error:(id)a5
{
  id v8;
  NSMutableDictionary *loadCompletions;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  CGImage *v17;

  v8 = a5;
  loadCompletions = self->_loadCompletions;
  v10 = a3;
  -[NSMutableDictionary objectForKey:](loadCompletions, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__RUIImageLoader__callCompletionsForURL_image_error___block_invoke;
  block[3] = &unk_24C297860;
  v16 = v8;
  v17 = a4;
  v15 = v11;
  v12 = v8;
  v13 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  -[NSMutableDictionary removeObjectForKey:](self->_loadCompletions, "removeObjectForKey:", v10);

}

void __53__RUIImageLoader__callCompletionsForURL_image_error___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_setImageData:(id)a3 forURL:(id)a4 error:(id)a5
{
  const __CFData *v9;
  id v10;
  id v11;
  NSObject *v12;
  CGImageSource *v13;
  CGImageSource *v14;
  void *v15;
  CGImage *ImageAtIndex;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = (const __CFData *)a3;
  v10 = a4;
  v11 = a5;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_209E87000, v12, OS_LOG_TYPE_DEFAULT, "Image load for %@ complete, error %@", buf, 0x16u);
    }

  }
  -[NSLock lock](self->_cacheLock, "lock");
  if (!v9)
    goto LABEL_11;
  v13 = CGImageSourceCreateWithData(v9, 0);
  if (!v13)
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@, no image source"), v15);
    goto LABEL_10;
  }
  v14 = v13;
  if (CGImageSourceGetStatus(v13))
  {
    CFRelease(v14);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@, invalid image source"), v15);
LABEL_10:

LABEL_11:
    -[RUIImageLoader _callCompletionsForURL:image:error:](self, "_callCompletionsForURL:image:error:", v10, 0, v11);
    -[NSLock unlock](self->_cacheLock, "unlock");
    goto LABEL_12;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v14, 0, 0);
  CFRelease(v14);
  -[NSMutableDictionary setObject:forKey:](self->_imageCache, "setObject:forKey:", ImageAtIndex, v10);
  -[NSMutableArray addObject:](self->_imageCacheLRU, "addObject:", v10);
  CGImageRelease(ImageAtIndex);
  v17 = -[NSMutableArray count](self->_imageCacheLRU, "count");
  if (v17 >= 0x65)
  {
    v18 = 0;
    v19 = v17 - 100;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_imageCacheLRU, "objectAtIndex:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](self->_imageCache, "removeObjectForKey:", v20);

      ++v18;
    }
    while (v19 != v18);
    -[NSMutableArray removeObjectsInRange:](self->_imageCacheLRU, "removeObjectsInRange:", 0, v19);
  }
  -[RUIImageLoader _callCompletionsForURL:image:error:](self, "_callCompletionsForURL:image:error:", v10, ImageAtIndex, 0);
  -[NSLock unlock](self->_cacheLock, "unlock");
  -[RUIImageLoader performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__postImageLoadedNotification_, v10, 0);
LABEL_12:

}

- (void)_postImageLoadedNotification:(id)a3
{
  NSNotificationCenter *notificationCenter;
  __CFString *v4;
  void *v5;
  id v6;

  notificationCenter = self->_notificationCenter;
  if (notificationCenter)
  {
    v4 = RUIImageLoaderDidLoadImageNotification;
    objc_msgSend(a3, "absoluteString");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNotificationCenter postNotificationName:object:](notificationCenter, "postNotificationName:object:", v5, 0);

  }
}

- (void)_locked_imageLoadStarted:(id)a3
{
  -[NSMutableSet addObject:](self->_loadsInProgress, "addObject:", a3);
}

- (void)_imageLoadFinished:(id)a3
{
  NSLock *queueLock;
  id v5;

  queueLock = self->_queueLock;
  v5 = a3;
  -[NSLock lock](queueLock, "lock");
  -[NSMutableSet removeObject:](self->_loadsInProgress, "removeObject:", v5);

  -[NSLock unlock](self->_queueLock, "unlock");
  -[RUIImageLoader _loadingStatusChanged](self, "_loadingStatusChanged");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadStatusNotificationTimer, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_loadCompletions, 0);
  objc_storeStrong((id *)&self->_imageCacheLRU, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_cacheLock, 0);
  objc_storeStrong((id *)&self->_loadsInProgress, 0);
  objc_storeStrong((id *)&self->_loadQueue, 0);
  objc_storeStrong((id *)&self->_queueLock, 0);
}

@end
