@implementation PLDataArrayInputStream

- (PLDataArrayInputStream)initWithDataArray:(id)a3
{
  PLDataArrayInputStream *v4;
  NSArray *dataArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PLDataArrayInputStream;
  v4 = -[PLDataArrayInputStream init](&v16, sel_init);
  if (v4)
  {
    v4->_dataArray = (NSArray *)a3;
    v4->_dataLength = 0;
    v4->_dataCount = -[NSArray count](v4->_dataArray, "count");
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    dataArray = v4->_dataArray;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](dataArray, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(dataArray);
          v4->_dataLength += objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "length");
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](dataArray, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }
    if (v4->_dataCount)
      v10 = objc_msgSend(-[NSArray objectAtIndex:](v4->_dataArray, "objectAtIndex:", 0), "length");
    else
      v10 = 0;
    v4->_currentLength = v10;
  }
  return v4;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (void)dealloc
{
  __CFRunLoopSource *rls;
  void (*release)(void *, SEL);
  objc_super v5;

  rls = self->_rls;
  if (rls)
  {
    CFRunLoopSourceInvalidate(rls);
    CFRelease(self->_rls);
  }
  release = (void (*)(void *, SEL))self->_clientContext.release;
  if (release)
    release(self->_clientContext.info, a2);

  v5.receiver = self;
  v5.super_class = (Class)PLDataArrayInputStream;
  -[PLDataArrayInputStream dealloc](&v5, sel_dealloc);
}

- (void)_streamEventTrigger
{
  PLDataArrayInputStream *v4;
  _BOOL4 openEventSent;
  unint64_t dataOffset;
  unint64_t dataLength;
  void (*clientCallback)(PLDataArrayInputStream *, uint64_t, void *);
  void *info;
  PLDataArrayInputStream *v10;
  uint64_t v11;
  void (*v12)(PLDataArrayInputStream *, uint64_t, void *);
  id v13;
  PLDataArrayInputStream *v14;
  uint64_t v15;
  PLDataArrayInputStream *v16;

  v4 = self;
  openEventSent = self->_openEventSent;
  if (self->_openEventSent)
  {
    dataOffset = self->_dataOffset;
    dataLength = self->_dataLength;
    if (dataOffset >= dataLength || self->_streamStatus == 6)
    {
      if (dataOffset != dataLength)
        goto LABEL_17;
      self->_streamStatus = 5;
      clientCallback = (void (*)(PLDataArrayInputStream *, uint64_t, void *))self->_clientCallback;
      if (clientCallback)
      {
        info = self->_clientContext.info;
        v10 = self;
        v11 = 16;
LABEL_11:
        clientCallback(v10, v11, info);
        goto LABEL_17;
      }
      v13 = -[PLDataArrayInputStream delegate](self, "delegate");
      v14 = self;
      v15 = 16;
    }
    else
    {
      clientCallback = (void (*)(PLDataArrayInputStream *, uint64_t, void *))self->_clientCallback;
      if (clientCallback)
      {
        info = self->_clientContext.info;
        v10 = self;
        v11 = 2;
        goto LABEL_11;
      }
      v13 = -[PLDataArrayInputStream delegate](self, "delegate");
      v14 = self;
      v15 = 2;
    }
    objc_msgSend(v13, "stream:handleEvent:", v14, v15);
  }
  else
  {
    v12 = (void (*)(PLDataArrayInputStream *, uint64_t, void *))self->_clientCallback;
    if (v12)
      v12(self, 1, self->_clientContext.info);
    else
      objc_msgSend(-[PLDataArrayInputStream delegate](self, "delegate"), "stream:handleEvent:", self, 1);
    self->_openEventSent = 1;
  }
LABEL_17:
  if (self->_dataOffset > self->_dataLength)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDataArrayInputStream.m"), 90, CFSTR("sanity check for stream data"));
    if (openEventSent)
      goto LABEL_20;
    goto LABEL_19;
  }
  if (!openEventSent)
LABEL_19:
    -[PLDataArrayInputStream _scheduleCallback](self, "_scheduleCallback");
LABEL_20:
  v16 = self;
}

- (void)_scheduleCallback
{
  CFRunLoopSourceSignal(self->_rls);
}

- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
  __CFRunLoopSource *rls;
  CFRunLoopSourceContext v9;

  rls = self->_rls;
  if (!rls)
  {
    v9.version = 0;
    memset(&v9.retain, 0, 56);
    v9.info = self;
    v9.perform = (void (__cdecl *)(void *))_streamEventTrigger;
    rls = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v9);
    self->_rls = rls;
    if (!rls)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDataArrayInputStream.m"), 122, CFSTR("should be able to make run loop source"));
      rls = self->_rls;
    }
  }
  CFRunLoopAddSource(a3, rls, a4);
}

- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
  CFRunLoopRemoveSource(a3, self->_rls, a4);
}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  $3FA37093598C0C5E3447A96743C089CD *p_clientContext;
  __int128 v8;
  __int128 v9;
  void (*retain)(void *, SEL, unint64_t);
  void (*release)(void *, SEL, unint64_t);

  p_clientContext = &self->_clientContext;
  if (a5)
  {
    v8 = *(_OWORD *)&a5->var0;
    v9 = *(_OWORD *)&a5->var2;
    self->_clientContext.copyDescription = a5->var4;
    *(_OWORD *)&p_clientContext->version = v8;
    *(_OWORD *)&self->_clientContext.retain = v9;
    retain = (void (*)(void *, SEL, unint64_t))self->_clientContext.retain;
    if (retain)
      retain(self->_clientContext.info, a2, a3);
  }
  else
  {
    release = (void (*)(void *, SEL, unint64_t))self->_clientContext.release;
    if (release)
      release(self->_clientContext.info, a2, a3);
    p_clientContext->copyDescription = 0;
    *(_OWORD *)&p_clientContext->version = 0u;
    *(_OWORD *)&p_clientContext->retain = 0u;
  }
  self->_clientCallback = a4;
  return 1;
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  -[PLDataArrayInputStream _scheduleInCFRunLoop:forMode:](self, "_scheduleInCFRunLoop:forMode:", objc_msgSend(a3, "getCFRunLoop"), a4);
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  -[PLDataArrayInputStream _unscheduleFromCFRunLoop:forMode:](self, "_unscheduleFromCFRunLoop:forMode:", objc_msgSend(a3, "getCFRunLoop"), a4);
}

- (void)open
{
  -[PLDataArrayInputStream _scheduleCallback](self, "_scheduleCallback");
  self->_streamStatus = 2;
}

- (void)close
{
  __CFRunLoopSource *rls;

  rls = self->_rls;
  if (rls)
    CFRunLoopSourceInvalidate(rls);
  self->_streamStatus = 6;
}

- (id)streamError
{
  return 0;
}

- (unint64_t)streamStatus
{
  return self->_streamStatus;
}

- (void)_updateProgress
{
  PLDataArrayInputStreamProgressDelegate *progressDelegate;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateProgress, 0);
  progressDelegate = self->_progressDelegate;
  if (progressDelegate)
    -[PLDataArrayInputStreamProgressDelegate dataArrayInputStreamBytesWereRead:](progressDelegate, "dataArrayInputStreamBytesWereRead:", self);
}

- (void)_scheduleProgressUpdate
{
  if (self->_progressDelegate)
    -[PLDataArrayInputStream performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__updateProgress, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99860]), 0.5);
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  unint64_t v6;
  id v8;
  size_t v9;
  unint64_t dataOffset;
  unint64_t v11;

  bzero(a3, a4);
  v6 = 0;
  if (self->_dataOffset < self->_dataLength && a4 != 0)
  {
    do
    {
      if (self->_currentIndex >= self->_dataCount || self->_currentOffset >= self->_currentLength)
        break;
      v8 = -[NSArray objectAtIndex:](self->_dataArray, "objectAtIndex:");
      if (a4 - v6 >= self->_currentLength - self->_currentOffset)
        v9 = self->_currentLength - self->_currentOffset;
      else
        v9 = a4 - v6;
      memcpy(&a3[v6], (const void *)(objc_msgSend(v8, "bytes") + self->_currentOffset), v9);
      self->_currentOffset += v9;
      dataOffset = self->_dataOffset + v9;
      self->_dataOffset = dataOffset;
      if (self->_currentOffset == self->_currentLength)
      {
        v11 = 0;
        ++self->_currentIndex;
        self->_currentOffset = 0;
        if (self->_currentIndex < self->_dataCount)
          v11 = objc_msgSend(-[NSArray objectAtIndex:](self->_dataArray, "objectAtIndex:"), "length");
        self->_currentLength = v11;
        dataOffset = self->_dataOffset;
      }
      v6 += v9;
    }
    while (dataOffset < self->_dataLength && v6 < a4);
  }
  -[PLDataArrayInputStream _scheduleProgressUpdate](self, "_scheduleProgressUpdate");
  -[PLDataArrayInputStream _scheduleCallback](self, "_scheduleCallback");
  return v6;
}

- (unint64_t)totalBytes
{
  return self->_dataLength;
}

- (unint64_t)bytesRead
{
  return self->_dataOffset;
}

- (BOOL)hasBytesAvailable
{
  return self->_dataOffset < self->_dataLength;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (PLDataArrayInputStreamProgressDelegate)progressDelegate
{
  return self->_progressDelegate;
}

- (void)setProgressDelegate:(id)a3
{
  self->_progressDelegate = (PLDataArrayInputStreamProgressDelegate *)a3;
}

@end
