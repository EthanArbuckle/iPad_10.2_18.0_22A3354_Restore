@implementation VSCacheUpdateListener

- (VSCacheUpdateListener)init
{
  return 0;
}

- (id)_initShared
{
  VSCacheUpdateListener *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSCacheUpdateListener;
  v2 = -[VSCacheUpdateListener init](&v4, sel_init);
  if (v2)
  {
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v2->_updateRequestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    VSPreferencesInitialize();
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[VSCacheUpdateListener stopListening](self, "stopListening");

  v3.receiver = self;
  v3.super_class = (Class)VSCacheUpdateListener;
  -[VSCacheUpdateListener dealloc](&v3, sel_dealloc);
}

- (void)startListening
{
  NSObject *global_queue;
  _QWORD block[5];

  -[NSLock lock](self->_lock, "lock");
  if (self->_isListening)
  {
    -[NSLock unlock](self->_lock, "unlock");
  }
  else
  {
    self->_isListening = 1;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__spokenLanguageChanged_, CFSTR("com.apple.voiceservices.language"), 0);
    -[NSLock unlock](self->_lock, "unlock");
    if (!self->_dataProviders)
    {
      global_queue = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__VSCacheUpdateListener_startListening__block_invoke;
      block[3] = &unk_1EA8AFFB8;
      block[4] = self;
      dispatch_async(global_queue, block);
    }
  }
}

- (void)stopListening
{
  NSDictionary *dataProviders;

  -[NSLock lock](self->_lock, "lock");
  if (self->_isListening)
  {
    self->_isListening = 0;
    dataProviders = self->_dataProviders;
    self->_dataProviders = 0;
    -[NSLock unlock](self->_lock, "unlock");
    -[NSArray makeObjectsPerformSelector:](-[NSDictionary allValues](dataProviders, "allValues"), "makeObjectsPerformSelector:", sel_stopReportingChanges);

    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("com.apple.voiceservices.language"), 0);
    -[VSCacheUpdateListener _flush](self, "_flush");
  }
  else
  {
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (void)performUpdateForModelIdentifier:(id)a3 classIdentifier:(id)a4
{
  VSCacheUpdateRequest *v5;

  v5 = -[VSCacheUpdateRequest initWithModelIdentifier:classIdentifier:]([VSCacheUpdateRequest alloc], "initWithModelIdentifier:classIdentifier:", a3, a4);
  -[VSCacheUpdateListener _enqueueRequest:](self, "_enqueueRequest:", v5);

}

- (void)_spokenLanguageChanged:(id)a3
{
  -[VSCacheUpdateListener performUpdateForModelIdentifier:classIdentifier:](self, "performUpdateForModelIdentifier:classIdentifier:", 0, 0);
}

- (void)_enqueueRequest:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSMutableArray *updateRequestQueue;
  NSTimer *flushTimer;
  void *v16;
  NSTimer *v17;
  NSObject *v18;
  NSMutableArray *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  if (self->_isListening)
  {
    v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v20 = 138412290;
      v21 = a3;
      _os_log_debug_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_DEBUG, "Enqueuing request: %@", (uint8_t *)&v20, 0xCu);
    }
    v6 = -[NSMutableArray count](self->_updateRequestQueue, "count");
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      v11 = a3;
      while (1)
      {
        v12 = (void *)-[NSMutableArray objectAtIndex:](self->_updateRequestQueue, "objectAtIndex:", v9);
        v13 = (void *)objc_msgSend(v12, "coalescedRequest:", v11);
        if (v13 == v12)
          break;
        a3 = v13;
        if (v13)
        {
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          {
            -[NSMutableArray replaceObjectAtIndex:withObject:](self->_updateRequestQueue, "replaceObjectAtIndex:withObject:", v9, v13);
            v8 = 1;
            v10 = v9;
          }
          else
          {
            updateRequestQueue = self->_updateRequestQueue;
            if (a3 == v11)
            {
              a3 = v11;
            }
            else
            {
              -[NSMutableArray replaceObjectAtIndex:withObject:](updateRequestQueue, "replaceObjectAtIndex:withObject:", v10, a3);
              updateRequestQueue = self->_updateRequestQueue;
            }
            -[NSMutableArray removeObjectAtIndex:](updateRequestQueue, "removeObjectAtIndex:", v9--);
            --v7;
            v8 = 1;
          }
        }
        else
        {
          a3 = v11;
        }
        ++v9;
        v11 = a3;
        if (v9 >= v7)
          goto LABEL_18;
      }
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        -[NSMutableArray removeObjectAtIndex:](self->_updateRequestQueue, "removeObjectAtIndex:", v10);
    }
    else
    {
      v8 = 0;
      v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:
      if (v10 == 0x7FFFFFFFFFFFFFFFLL && (v8 & 1) == 0)
        -[NSMutableArray addObject:](self->_updateRequestQueue, "addObject:", a3);
    }
    flushTimer = self->_flushTimer;
    if (flushTimer)
    {
      -[NSTimer setFireDate:](flushTimer, "setFireDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 3.0));
    }
    else
    {
      self->_flushTimer = (NSTimer *)objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__flush, 0, 0, 3.0);
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      objc_msgSend(v16, "addTimer:forMode:", self->_flushTimer, *MEMORY[0x1E0C99860]);
      v17 = self->_flushTimer;
    }
    v18 = VSGetLogDefault();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = self->_updateRequestQueue;
      v20 = 138412290;
      v21 = v19;
      _os_log_debug_impl(&dword_1DE15E000, v18, OS_LOG_TYPE_DEBUG, "Queue is now:\n%@", (uint8_t *)&v20, 0xCu);
    }
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_flush
{
  NSMutableArray *updateRequestQueue;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  updateRequestQueue = self->_updateRequestQueue;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](updateRequestQueue, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(updateRequestQueue);
        VSRecognitionConfigurationCacheUpdate((const __CFString *)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "modelIdentifier"), (const __CFString *)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "classIdentifier"));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](updateRequestQueue, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[NSMutableArray removeAllObjects](self->_updateRequestQueue, "removeAllObjects");
  -[NSTimer invalidate](self->_flushTimer, "invalidate");

  self->_flushTimer = 0;
  -[NSLock unlock](self->_lock, "unlock");
}

void __39__VSCacheUpdateListener_startListening__block_invoke(uint64_t a1)
{
  const void *v2;
  _QWORD v3[6];

  v2 = VSCopyUpdatableRecognitionModelDataProviderInfos();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__VSCacheUpdateListener_startListening__block_invoke_2;
  v3[3] = &unk_1EA8AF920;
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

BOOL __39__VSCacheUpdateListener_startListening__block_invoke_2(uint64_t a1)
{
  const __CFDictionary *v2;
  uint64_t v3;
  id context;

  context = 0;
  v2 = *(const __CFDictionary **)(a1 + 40);
  if (v2)
  {
    CFDictionaryApplyFunction(v2, (CFDictionaryApplierFunction)_AddDataProviderToArrayFromInfo, &context);
    CFRelease(*(CFTypeRef *)(a1 + 40));
    objc_msgSend((id)objc_msgSend(context, "allValues"), "makeObjectsPerformSelector:", sel_beginReportingChanges);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lock");
    v3 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v3 + 40))
    {
      objc_msgSend(*(id *)(v3 + 8), "unlock");
      objc_msgSend((id)objc_msgSend(context, "allValues"), "makeObjectsPerformSelector:", sel_stopReportingChanges);

      return VSRecognitionConfigurationCacheUpdate(0, 0);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = context;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lock");

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_alloc_init(MEMORY[0x1E0C99D80]);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unlock");
  return VSRecognitionConfigurationCacheUpdate(0, 0);
}

+ (id)sharedListener
{
  if (sharedListener_onceToken != -1)
    dispatch_once(&sharedListener_onceToken, &__block_literal_global_1782);
  return (id)__SharedListener;
}

+ (id)sharedListenerIfExists
{
  return (id)__SharedListener;
}

id __39__VSCacheUpdateListener_sharedListener__block_invoke()
{
  id result;

  result = -[VSCacheUpdateListener _initShared]([VSCacheUpdateListener alloc], "_initShared");
  __SharedListener = (uint64_t)result;
  return result;
}

@end
