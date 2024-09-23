@implementation TLAudioQueue

+ (TLAudioQueue)sharedAudioQueue
{
  if (sharedAudioQueue__TLAudioQueueSharedInstanceOnceToken != -1)
    dispatch_once(&sharedAudioQueue__TLAudioQueueSharedInstanceOnceToken, &__block_literal_global_6);
  return (TLAudioQueue *)(id)sharedAudioQueue__TLAudioQueueSharedInstance;
}

void __32__TLAudioQueue_sharedAudioQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[TLAudioQueue _init]([TLAudioQueue alloc], "_init");
  v1 = (void *)sharedAudioQueue__TLAudioQueueSharedInstance;
  sharedAudioQueue__TLAudioQueueSharedInstance = (uint64_t)v0;

}

- (id)_init
{
  TLAudioQueue *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *serialQueue;
  uint64_t v12;
  NSString *assumeRunningOnAudioQueueThreadLocalStorageKey;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TLAudioQueue;
  v2 = -[TLAudioQueue init](&v15, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_retainAutorelease(v8);
    v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), v4, CFSTR("AssumeRunningOnAudioQueue"));
    assumeRunningOnAudioQueueThreadLocalStorageKey = v2->_assumeRunningOnAudioQueueThreadLocalStorageKey;
    v2->_assumeRunningOnAudioQueueThreadLocalStorageKey = (NSString *)v12;

  }
  return v2;
}

- (void)performTaskWithBlock:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_serialQueue, a3);
}

- (void)performSynchronousTaskWithBlock:(id)a3
{
  -[TLAudioQueue performSynchronousTaskWithOptions:block:](self, "performSynchronousTaskWithOptions:block:", 0, a3);
}

- (void)performSynchronousTaskWithOptions:(unint64_t)a3 block:(id)a4
{
  NSObject *serialQueue;
  void *v6;
  void (**v7)(_QWORD);
  void *v8;
  NSString *v9;
  void *v10;
  id v11;

  if ((a3 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB3978];
    v7 = (void (**)(_QWORD))a4;
    objc_msgSend(v6, "currentThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "threadDictionary");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v9 = self->_assumeRunningOnAudioQueueThreadLocalStorageKey;
    objc_msgSend(v11, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", MEMORY[0x1E0C9AAB0], v9);
    v7[2](v7);

    objc_msgSend(v11, "setValue:forKey:", v10, v9);
  }
  else
  {
    serialQueue = self->_serialQueue;
    v11 = a4;
    dispatch_sync(serialQueue, v11);
  }

}

- (void)assertRunningOnAudioQueue
{
  if (!-[TLAudioQueue _shouldAssumeRunningOnAudioQueue](self, "_shouldAssumeRunningOnAudioQueue"))
    dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
}

- (void)assertNotRunningOnAudioQueue
{
  OUTLINED_FUNCTION_5(&dword_1D33D5000, a1, a3, "Expected to be running outside of the audio queue from within a task executed with the option: TLAudioTaskOptionAssumeRunningOnAudioQueue.", a5, a6, a7, a8, 0);
}

- (OS_dispatch_queue)_underlyingSerialQueue
{
  return self->_serialQueue;
}

- (BOOL)_shouldAssumeRunningOnAudioQueue
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", self->_assumeRunningOnAudioQueueThreadLocalStorageKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");

  return (char)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_assumeRunningOnAudioQueueThreadLocalStorageKey, 0);
}

@end
