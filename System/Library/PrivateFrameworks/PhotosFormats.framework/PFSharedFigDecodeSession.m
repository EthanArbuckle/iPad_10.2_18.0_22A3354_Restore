@implementation PFSharedFigDecodeSession

void __PFSharedFigDecodeSession_block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_source_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v0 = (void *)MEMORY[0x1A1B0CDDC]();
  CMPhotoDecompressionSessionCreate();
  if (PFSharedFigDecodeSession_s_decodeSession)
  {
    dispatch_get_global_queue(0, 0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 2uLL, v1);
    v3 = (void *)PFSharedFigDecodeSession_s_memoryEventSource;
    PFSharedFigDecodeSession_s_memoryEventSource = (uint64_t)v2;

    dispatch_source_set_event_handler((dispatch_source_t)PFSharedFigDecodeSession_s_memoryEventSource, &__block_literal_global_1);
    dispatch_resume((dispatch_object_t)PFSharedFigDecodeSession_s_memoryEventSource);
    v4 = objc_opt_new();
    v5 = (void *)PFSharedFigDecodeSession_s_memoryQueue;
    PFSharedFigDecodeSession_s_memoryQueue = v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationDidEnterBackgroundNotification"), 0, PFSharedFigDecodeSession_s_memoryQueue, &__block_literal_global_5);

  }
  objc_autoreleasePoolPop(v0);
}

uint64_t __PFSharedFigDecodeSession_block_invoke_2()
{
  return CMPhotoDecompressionSessionFlushCachedBuffers();
}

uint64_t __PFSharedFigDecodeSession_block_invoke_3()
{
  return CMPhotoDecompressionSessionFlushCachedBuffers();
}

@end
