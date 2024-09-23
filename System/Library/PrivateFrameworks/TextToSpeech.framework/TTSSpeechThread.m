@implementation TTSSpeechThread

- (TTSSpeechThread)init
{
  TTSSpeechThread *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  TTSSpeechThread *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TTSSpeechThread;
  v2 = -[TTSSpeechThread init](&v12, sel_init);
  v6 = v2;
  if (v2)
  {
    objc_msgSend_setName_(v2, v3, (uint64_t)CFSTR("AXSpeech"), v4, v5);
    v7 = (void *)voucher_copy();
    objc_msgSend_setVoucher_(v6, v8, (uint64_t)v7, v9, v10);

  }
  return v6;
}

- (void)main
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSRunLoop *v11;
  NSRunLoop *threadRunLoop;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSPort *v32;
  NSPort *machPort;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSRunLoop *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  id v49;

  objc_msgSend_voucher(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_voucher(self, v7, v8, v9, v10);
    objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_currentRunLoop(MEMORY[0x1E0C99E58], v7, v8, v9, v10);
  v11 = (NSRunLoop *)objc_claimAutoreleasedReturnValue();
  threadRunLoop = self->_threadRunLoop;
  self->_threadRunLoop = v11;

  objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processName(v17, v18, v19, v20, v21);
  v49 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_isEqualToString_(v49, v22, (uint64_t)CFSTR("com.apple.accessibility.AccessibilityUIServer"), v23, v24) & 1) != 0|| objc_msgSend_isEqualToString_(v49, v25, (uint64_t)CFSTR("com.apple.AccessibilityUIServer"), v26, v27))
  {
    AXSetThreadPriority();
  }
  objc_msgSend_port(MEMORY[0x1E0C99DD0], v28, v29, v30, v31);
  v32 = (NSPort *)objc_claimAutoreleasedReturnValue();
  machPort = self->_machPort;
  self->_machPort = v32;

  v34 = *MEMORY[0x1E0C99748];
  objc_msgSend_addPort_forMode_(self->_threadRunLoop, v35, (uint64_t)self->_machPort, *MEMORY[0x1E0C99748], v36);
  do
  {
    if ((objc_msgSend_isCancelled(self, v37, v38, v39, v40) & 1) != 0)
      break;
    v45 = self->_threadRunLoop;
    objc_msgSend_distantFuture(MEMORY[0x1E0C99D68], v41, v42, v43, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v45) = objc_msgSend_runMode_beforeDate_(v45, v47, v34, (uint64_t)v46, v48);

  }
  while ((v45 & 1) != 0);

}

- (void)cancel
{
  NSLog(CFSTR("%@ Don't call -cancel to stop an AXSpeechThread, call -stop instead."), a2, self);
}

- (void)stop
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  TTSSpeechThread *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFRunLoop *CFRunLoop;
  objc_super v12;

  objc_msgSend_currentThread(MEMORY[0x1E0CB3978], a2, v2, v3, v4);
  v6 = (TTSSpeechThread *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    v12.receiver = self;
    v12.super_class = (Class)TTSSpeechThread;
    -[TTSSpeechThread cancel](&v12, sel_cancel);
    CFRunLoop = (__CFRunLoop *)objc_msgSend_getCFRunLoop(self->_threadRunLoop, v7, v8, v9, v10);
    CFRunLoopStop(CFRunLoop);
  }
}

- (OS_voucher)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_voucher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_threadRunLoop, 0);
  objc_storeStrong((id *)&self->_machPort, 0);
}

@end
