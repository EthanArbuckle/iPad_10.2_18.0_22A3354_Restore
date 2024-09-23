@implementation WFLoggerCircularBuffer

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6
{
  NSString *v7;
  const __CFAllocator *v8;
  const __CFString *v9;
  CFDataRef ExternalRepresentation;
  NSObject *dispatchQueue;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char v17[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  *(_OWORD *)v17 = 0u;
  v18 = 0u;
  if (self->_wiFiLoggingLogBufferRef)
  {
    __vsnprintf_chk(v17, 0xA0uLL, 0, 0xA0uLL, a5, a6);
    v7 = -[NSDateFormatter stringFromDate:](self->_tsFormatter, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v9 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ %s\n"), v7, v17);
    if (v9)
    {
      ExternalRepresentation = CFStringCreateExternalRepresentation(v8, v9, 0x8000100u, 0x3Fu);
      v14[3] = (uint64_t)ExternalRepresentation;
      if (ExternalRepresentation)
      {
        dispatchQueue = self->_dispatchQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __55__WFLoggerCircularBuffer_WFLog_privacy_message_valist___block_invoke;
        block[3] = &unk_1E881DB30;
        block[4] = self;
        block[5] = &v13;
        dispatch_async(dispatchQueue, block);
      }
      CFRelease(v9);
    }
  }
  _Block_object_dispose(&v13, 8);
}

void __55__WFLoggerCircularBuffer_WFLog_privacy_message_valist___block_invoke(uint64_t a1)
{
  CFIndex v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  CFIndex Length;
  void *v9;
  const UInt8 *BytePtr;
  const void *v11;

  if (CFDataGetLength(*(CFDataRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) >= 1)
  {
    v2 = 0;
    do
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(v3 + 40);
      v5 = *(_QWORD *)(v3 + 48);
      v6 = v4 % v5;
      v7 = v5 - v4 % v5;
      Length = CFDataGetLength(*(CFDataRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      if (Length - v2 < v7)
        v7 = Length - v2;
      v9 = (void *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + v6);
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      memcpy(v9, &BytePtr[v2], v7);
      v2 += v7;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) += v7;
    }
    while (v2 < CFDataGetLength(*(CFDataRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)));
  }
  v11 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v11)
  {
    CFRelease(v11);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5
{
  const __CFAllocator *v6;
  const __CFString *v7;
  CFDataRef ExternalRepresentation;
  NSObject *dispatchQueue;
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (self->_wiFiLoggingLogBufferRef)
  {
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v7 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@ \n"), a4, a5);
    if (v7)
    {
      ExternalRepresentation = CFStringCreateExternalRepresentation(v6, v7, 0x8000100u, 0x3Fu);
      v12[3] = (uint64_t)ExternalRepresentation;
      if (ExternalRepresentation)
      {
        dispatchQueue = self->_dispatchQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__WFLoggerCircularBuffer_WFLog_privacy_cfStrMsg___block_invoke;
        block[3] = &unk_1E881DB30;
        block[4] = self;
        block[5] = &v11;
        dispatch_async(dispatchQueue, block);
      }
      CFRelease(v7);
    }
  }
  _Block_object_dispose(&v11, 8);
}

void __49__WFLoggerCircularBuffer_WFLog_privacy_cfStrMsg___block_invoke(uint64_t a1)
{
  CFIndex v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  CFIndex Length;
  void *v9;
  const UInt8 *BytePtr;
  const void *v11;

  if (CFDataGetLength(*(CFDataRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) >= 1)
  {
    v2 = 0;
    do
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(v3 + 40);
      v5 = *(_QWORD *)(v3 + 48);
      v6 = v4 % v5;
      v7 = v5 - v4 % v5;
      Length = CFDataGetLength(*(CFDataRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      if (Length - v2 < v7)
        v7 = Length - v2;
      v9 = (void *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + v6);
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      memcpy(v9, &BytePtr[v2], v7);
      v2 += v7;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) += v7;
    }
    while (v2 < CFDataGetLength(*(CFDataRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)));
  }
  v11 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v11)
  {
    CFRelease(v11);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)dealloc
{
  NSDateFormatter *tsFormatter;
  NSObject *dispatchQueue;
  objc_super v5;

  tsFormatter = self->_tsFormatter;
  if (tsFormatter)
  {
    CFRelease(tsFormatter);
    self->_tsFormatter = 0;
  }
  free(self->_wiFiLoggingLogBufferRef);
  self->_wiFiLoggingLogBufferRef = 0;
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);
  v5.receiver = self;
  v5.super_class = (Class)WFLoggerCircularBuffer;
  -[WFLoggerCircularBuffer dealloc](&v5, sel_dealloc);
}

- (WFLoggerCircularBuffer)init
{
  WFLoggerCircularBuffer *v2;
  WFLoggerCircularBuffer *v3;
  char *v4;
  NSDateFormatter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFLoggerCircularBuffer;
  v2 = -[WFLoggerCircularBuffer init](&v7, sel_init);
  v3 = v2;
  if (v2
    && (v2->_wiFiLoggingLogBufferIndex = 0,
        v2->_wiFiLoggingLogBufferMaxSize = 307200,
        v2->_dumpId = 0,
        v4 = (char *)malloc_type_calloc(0x4B000uLL, 1uLL, 0x826D0A5CuLL),
        (v3->_wiFiLoggingLogBufferRef = v4) != 0)
    && (v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]), (v3->_tsFormatter = v5) != 0))
  {
    -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", CFSTR("MM/dd/yyyy HH:mm:ss.SSS"));
    v3->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wfloggercircularbuffer", 0);
  }
  else
  {

    return 0;
  }
  return v3;
}

- (void)dump
{
  uint64_t v3;
  NSObject *dispatchQueue;
  _QWORD v5[6];

  v3 = os_transaction_create();
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__WFLoggerCircularBuffer_dump__block_invoke;
  v5[3] = &unk_1E881DB58;
  v5[4] = v3;
  v5[5] = self;
  dispatch_async(dispatchQueue, v5);
}

void __30__WFLoggerCircularBuffer_dump__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  FILE *v6;
  FILE *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  stat v11;

  memset(&v11, 0, sizeof(v11));
  if (stat("/var/mobile/Library/Logs/CrashReporter/WiFi", &v11) != -1
    || !mkdir("/var/mobile/Library/Logs/CrashReporter/WiFi", 0x1FDu))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v2, "setDateFormat:", CFSTR("MM-dd-yyyy__HH:mm:ss.SSS"));
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(unsigned int *)(v3 + 56);
    v5 = (void *)MEMORY[0x1E0CB3940];
    *(_DWORD *)(v3 + 56) = v4 + 1;
    v6 = fopen((const char *)objc_msgSend((id)objc_msgSend(v5, "stringWithFormat:", CFSTR("/var/mobile/Library/Logs/CrashReporter/WiFi/wifi-buf-%d-%@.log"), v4, objc_msgSend(v2, "stringFromDate:", objc_msgSend(MEMORY[0x1E0C99D68], "date"))), "cStringUsingEncoding:", 4), "wb");
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(v8 + 40);
      v10 = *(_QWORD *)(v8 + 48);
      if (v9 >= v10)
      {
        v9 %= v10;
        fwrite((const void *)(*(_QWORD *)(v8 + 32) + v9), v10 - v9, 1uLL, v6);
        v8 = *(_QWORD *)(a1 + 40);
      }
      fwrite(*(const void **)(v8 + 32), v9, 1uLL, v7);
      bzero(*(void **)(*(_QWORD *)(a1 + 40) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = 0;
      fflush(v7);
      fclose(v7);
    }

  }
}

@end
