@implementation TSDImageProviderPool

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSDImageProviderPool;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedPool
{
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  result = (id)sharedPool_sSingletonInstance;
  if (!sharedPool_sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!sharedPool_sSingletonInstance)
    {
      v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      sharedPool_sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDImageProviderPool sharedPool]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProviderPool.m"), 50, CFSTR("Couldn't create singleton instance of %@"), a1);
      }
    }
    objc_sync_exit(a1);
    return (id)sharedPool_sSingletonInstance;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDImageProviderPool allocWithZone:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProviderPool.m"), 50, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (TSDImageProviderPool)init
{
  TSDImageProviderPool *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDImageProviderPool;
  v2 = -[TSDImageProviderPool init](&v5, sel_init);
  if (v2)
  {
    v2->mImageDataToImageProviderMap = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x24BEB3CE0]);
    -[TSDImageProviderPool p_updateFileDescriptorLimit](v2, "p_updateFileDescriptorLimit");
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_p_didReceiveMemoryWarning_, *MEMORY[0x24BDF7538], objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"));
    +[TSPData addCullingListener:](TSPData, "addCullingListener:", v2);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[TSPData removeCullingListener:](TSPData, "removeCullingListener:", self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = (void *)-[TSUPointerKeyDictionary objectEnumerator](self->mImageDataToImageProviderMap, "objectEnumerator");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeOwner");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)TSDImageProviderPool;
  -[TSDImageProviderPool dealloc](&v8, sel_dealloc);
}

- (id)providerForData:(id)a3 shouldValidate:(BOOL)a4
{
  return -[TSDImageProviderPool p_providerForData:temporary:shouldValidate:](self, "p_providerForData:temporary:shouldValidate:", a3, 0, a4);
}

- (id)temporaryProviderForData:(id)a3 shouldValidate:(BOOL)a4
{
  return -[TSDImageProviderPool p_providerForData:temporary:shouldValidate:](self, "p_providerForData:temporary:shouldValidate:", a3, 1, a4);
}

+ (Class)p_providerClassForData:(id)a3
{
  char v4;
  objc_class *v5;
  __CFString *v6;
  BOOL v8;
  CGImage *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  int v15;
  char v16;

  v4 = objc_msgSend(a3, "isLengthLikelyToBeGreaterThan:", TSDImageMaxAllowedDataLength());
  v5 = 0;
  if (+[TSPData null](TSPData, "null") == a3 || (v4 & 1) != 0)
    return v5;
  v6 = (__CFString *)objc_msgSend(a3, "type");
  if (UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x24BDC1810]))
    return 0;
  if (!-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("com.adobe.illustrator.ai-image"))
    && !UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x24BDC17A0])
    && !UTTypeConformsTo(v6, (CFStringRef)objc_msgSend((id)*MEMORY[0x24BDF84E0], "identifier")))
  {
    v16 = 0;
    v15 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __47__TSDImageProviderPool_p_providerClassForData___block_invoke;
    v10[3] = &unk_24D82C028;
    v10[4] = &v11;
    v10[5] = &v15;
    objc_msgSend(a3, "performInputStreamReadWithAccessor:", v10);
    if (*((_BYTE *)v12 + 24) && (v15 == 1178882085 ? (v8 = v16 == 45) : (v8 = 0), v8))
    {
      v5 = (objc_class *)objc_opt_class();
    }
    else
    {
      v9 = (CGImage *)objc_msgSend(a3, "newCGImage");
      if (v9)
      {
        v5 = (objc_class *)objc_opt_class();
        CGImageRelease(v9);
      }
      else
      {
        v5 = 0;
      }
    }
    _Block_object_dispose(&v11, 8);
    return v5;
  }
  return (Class)objc_opt_class();
}

uint64_t __47__TSDImageProviderPool_p_providerClassForData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = 5;
  while (1)
  {
    result = objc_msgSend(a2, "readToBuffer:size:", v4, v5);
    v5 -= result;
    if (v5 == 5)
      break;
    v4 += v5;
    if (!v5)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      return result;
    }
  }
  return result;
}

- (id)p_providerForData:(id)a3 temporary:(BOOL)a4 shouldValidate:(BOOL)a5
{
  _BOOL4 v5;
  id v6;
  _BOOL4 v8;
  TSDErrorImageProvider *v9;
  unint64_t mOpenFileDescriptorLimit;
  TSDErrorImageProvider *v11;
  uint64_t v12;
  objc_class *v14;
  TSDErrorImageProvider *v15;
  TSDErrorImageProvider *v16;

  v5 = a5;
  v6 = a3;
  if (!a3)
  {
    v9 = 0;
    goto LABEL_5;
  }
  v8 = a4;
  if ((objc_msgSend(a3, "needsDownload") & 1) != 0)
  {
    v9 = 0;
    v6 = 0;
LABEL_5:
    mOpenFileDescriptorLimit = 0;
    goto LABEL_11;
  }
  objc_sync_enter(self);
  mOpenFileDescriptorLimit = self->mOpenFileDescriptorLimit;
  v11 = (TSDErrorImageProvider *)-[TSUPointerKeyDictionary objectForKey:](self->mImageDataToImageProviderMap, "objectForKey:", v6);
  v9 = v11;
  if (!v11)
  {
    objc_sync_exit(self);
    objc_sync_enter(self);
    v11 = (TSDErrorImageProvider *)-[TSUPointerKeyDictionary objectForKey:](self->mImageDataToImageProviderMap, "objectForKey:", v6);
    v9 = v11;
    if (!v11)
    {
      v14 = (objc_class *)objc_msgSend((id)objc_opt_class(), "p_providerClassForData:", v6);
      if (v14)
      {
        v15 = (TSDErrorImageProvider *)objc_msgSend([v14 alloc], "initWithImageData:", v6);
        v9 = v15;
        if (v15)
        {
          if (v8)
          {
            v16 = v15;
          }
          else
          {
            -[TSDImageProvider addOwner](v15, "addOwner");
            -[TSUPointerKeyDictionary setObject:forUncopiedKey:](self->mImageDataToImageProviderMap, "setObject:forUncopiedKey:", v9, v6);
            -[TSDImageProvider ownerAccess](v9, "ownerAccess");

          }
          v12 = -[TSUPointerKeyDictionary count](self->mImageDataToImageProviderMap, "count");
          goto LABEL_9;
        }
      }
      else
      {
        v9 = 0;
      }
      v6 = 0;
      goto LABEL_10;
    }
  }
  -[TSDImageProvider ownerAccess](v11, "ownerAccess");
  v12 = -[TSUPointerKeyDictionary count](self->mImageDataToImageProviderMap, "count");
LABEL_9:
  v6 = (id)v12;
LABEL_10:
  objc_sync_exit(self);
LABEL_11:
  -[TSDImageProvider addInterest](v9, "addInterest");
  -[TSUPointerKeyDictionary count](self->mImageDataToImageProviderMap, "count");
  -[TSDImageProviderPool p_didReceiveMemoryWarning:](self, "p_didReceiveMemoryWarning:", 0);
  -[TSDImageProvider removeInterest](v9, "removeInterest");
  if (v9)
  {
    if (!v5)
      goto LABEL_17;
  }
  else
  {
    v9 = +[TSDErrorImageProvider sharedInstance](TSDErrorImageProvider, "sharedInstance");
    if (!v5)
      goto LABEL_17;
  }
  if (!-[TSDErrorImageProvider isValid](v9, "isValid"))
    v9 = +[TSDErrorImageProvider sharedInstance](TSDErrorImageProvider, "sharedInstance");
LABEL_17:
  if ((unint64_t)v6 > -[TSDImageProviderPool p_providerLimitForFileDescriptorLimit:](self, "p_providerLimitForFileDescriptorLimit:", mOpenFileDescriptorLimit))-[TSDImageProviderPool p_freeFileDescriptorsWithProviderCount:](self, "p_freeFileDescriptorsWithProviderCount:", v6);
  return v9;
}

- (void)addInterestInProviderForData:(id)a3
{
  void *v3;
  uint64_t v4;

  if (a3)
  {
    objc_msgSend(-[TSDImageProviderPool providerForData:shouldValidate:](self, "providerForData:shouldValidate:", a3, 0), "addInterest");
  }
  else
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageProviderPool addInterestInProviderForData:]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProviderPool.m"), 267, CFSTR("invalid nil value for '%s'"), "imageData");
  }
}

- (void)removeInterestInProviderForData:(id)a3
{
  void *v5;
  uint64_t v6;

  if (a3)
  {
    objc_sync_enter(self);
    objc_msgSend((id)-[TSUPointerKeyDictionary objectForKey:](self->mImageDataToImageProviderMap, "objectForKey:", a3), "removeInterest");
    objc_sync_exit(self);
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageProviderPool removeInterestInProviderForData:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProviderPool.m"), 276, CFSTR("invalid nil value for '%s'"), "imageData");
  }
}

- (void)willCloseDocumentContext:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = (void *)-[TSUPointerKeyDictionary objectEnumerator](self->mImageDataToImageProviderMap, "objectEnumerator");
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(v10, "imageData");
        if (v11 && (id)objc_msgSend(v11, "context") == a3)
        {
          if (!v6)
            v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v6, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
        objc_msgSend(v15, "removeOwner");
        v16 = objc_msgSend(v15, "imageData");
        if (v16)
          -[TSUPointerKeyDictionary removeObjectForKey:](self->mImageDataToImageProviderMap, "removeObjectForKey:", v16);
      }
      v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  objc_sync_exit(self);
}

- (void)flushImageProviders
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)-[TSUPointerKeyDictionary objectEnumerator](self->mImageDataToImageProviderMap, "objectEnumerator", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "flush");
        objc_msgSend(v7, "removeOwner");
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  self->mImageDataToImageProviderMap = 0;
  objc_sync_exit(self);
}

+ (BOOL)isValidImageData:(id)a3
{
  return objc_msgSend(a1, "p_providerClassForData:", a3) != 0;
}

- (void)willCullData:(id)a3
{
  void *v5;

  objc_sync_enter(self);
  v5 = (void *)-[TSUPointerKeyDictionary objectForKey:](self->mImageDataToImageProviderMap, "objectForKey:", a3);
  if (v5)
  {
    objc_msgSend(v5, "removeOwner");
    -[TSUPointerKeyDictionary removeObjectForKey:](self->mImageDataToImageProviderMap, "removeObjectForKey:", a3);
  }
  +[TSDBitmapImageProvider clearCacheForData:](TSDBitmapImageProvider, "clearCacheForData:", a3);
  objc_sync_exit(self);
}

- (unint64_t)p_providerLimitForFileDescriptorLimit:(unint64_t)a3
{
  return a3 >> 2;
}

- (void)p_freeFileDescriptorsWithProviderCount:(unint64_t)a3
{
  unint64_t v5;
  rlim_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  TSDImageProviderPool *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  rlimit v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  obj = self;
  -[TSDImageProviderPool p_updateFileDescriptorLimit](self, "p_updateFileDescriptorLimit");
  v5 = -[TSDImageProviderPool p_providerLimitForFileDescriptorLimit:](self, "p_providerLimitForFileDescriptorLimit:", self->mOpenFileDescriptorLimit);
  if (v5 < a3)
    a3 -= -[TSDImageProviderPool p_removeProvidersWithZeroInterest](self, "p_removeProvidersWithZeroInterest");
  if (a3 > v5 && !self->mHaveRaisedFileDescriptorLimit && self->mOpenFileDescriptorLimit <= 0x7FF)
  {
    v6 = 2048;
    do
    {
      v32.rlim_cur = 0;
      v32.rlim_max = 0;
      if (getrlimit(8, &v32) || v32.rlim_cur >= v6)
        break;
      v32.rlim_cur = 2048;
      if (setrlimit(8, &v32))
      {
        v6 -= 256;
      }
      else
      {
        self->mOpenFileDescriptorLimit = v32.rlim_cur;
        v5 = -[TSDImageProviderPool p_providerLimitForFileDescriptorLimit:](self, "p_providerLimitForFileDescriptorLimit:");
      }
    }
    while (self->mOpenFileDescriptorLimit < v6);
    self->mHaveRaisedFileDescriptorLimit = 1;
  }
  if (a3 > v5)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = (void *)-[TSUPointerKeyDictionary objectEnumerator](self->mImageDataToImageProviderMap, "objectEnumerator");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v9)
    {
      v10 = a3 - ((3 * v5) >> 2);
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v14 = objc_msgSend(v7, "count");
          v15 = v14;
          if (v14 >= v10)
          {
            if (v14)
            {
              v16 = 0;
              do
              {
                v17 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", v16), "interest");
                if (v17 > (int)objc_msgSend(v13, "interest"))
                  objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v16, v13);
                ++v16;
              }
              while (v15 != v16);
            }
          }
          else
          {
            objc_msgSend(v7, "addObject:", v13);
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v9);
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v7);
          v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          objc_msgSend(v21, "removeOwner");
          v22 = objc_msgSend(v21, "imageData");
          if (v22)
            -[TSUPointerKeyDictionary removeObjectForKey:](obj->mImageDataToImageProviderMap, "removeObjectForKey:", v22);
        }
        v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v18);
    }

  }
  objc_sync_exit(obj);
}

- (unint64_t)p_removeProvidersWithZeroInterest
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = (void *)-[TSUPointerKeyDictionary objectEnumerator](self->mImageDataToImageProviderMap, "objectEnumerator");
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((int)objc_msgSend(v8, "interest") <= 0)
        {
          if (!v4)
            v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v4, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
        objc_msgSend(v12, "removeOwner");
        v13 = objc_msgSend(v12, "imageData");
        if (v13)
          -[TSUPointerKeyDictionary removeObjectForKey:](self->mImageDataToImageProviderMap, "removeObjectForKey:", v13);
      }
      v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v9);
  }
  v14 = objc_msgSend(v4, "count");

  objc_sync_exit(self);
  return v14;
}

- (void)p_updateFileDescriptorLimit
{
  void *v3;
  uint64_t v4;
  rlim_t rlim_cur;
  rlimit v6;

  v6.rlim_cur = 0;
  v6.rlim_max = 0;
  if (getrlimit(8, &v6))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageProviderPool p_updateFileDescriptorLimit]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageProviderPool.m"), 512, CFSTR("Failed to get fd limit: getrlimit set errno to %d. Assuming limit of 256."), *__error());
    rlim_cur = 256;
  }
  else
  {
    rlim_cur = v6.rlim_cur;
  }
  self->mOpenFileDescriptorLimit = rlim_cur;
}

@end
