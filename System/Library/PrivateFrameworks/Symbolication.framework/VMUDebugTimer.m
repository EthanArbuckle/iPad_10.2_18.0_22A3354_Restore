@implementation VMUDebugTimer

+ (id)sharedTimerIfCreated
{
  return (id)sharedTimer;
}

+ (id)sharedTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__VMUDebugTimer_sharedTimer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedTimer_onceToken != -1)
    dispatch_once(&sharedTimer_onceToken, block);
  return (id)sharedTimer;
}

void __28__VMUDebugTimer_sharedTimer__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedTimer;
  sharedTimer = (uint64_t)v1;

}

- (VMUDebugTimer)init
{
  VMUDebugTimer *v2;
  NSDate *v3;
  NSDate *programStartTime;
  os_log_t v5;
  OS_os_log *logHandle;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VMUDebugTimer;
  v2 = -[VMUDebugTimer init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    programStartTime = v2->_programStartTime;
    v2->_programStartTime = v3;

    v5 = os_log_create("com.apple.Symbolication", "Memory Scanning");
    logHandle = v2->_logHandle;
    v2->_logHandle = (OS_os_log *)v5;

    kVMUPrintArchivingTiming = 1;
  }
  return v2;
}

- (void)startWithMessage:(const char *)a3
{
  -[VMUDebugTimer startWithCategory:message:](self, "startWithCategory:message:", ", a3);
  self->_signpostID = 0;
}

- (void)startWithCategory:(const char *)a3 message:(const char *)a4
{
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *categoryMessage;
  NSString *eventMessage;
  NSString *v12;
  NSDate *v13;
  NSDate *eventStartTime;

  if (*(_OWORD *)&self->_eventStartTime != 0)
    -[VMUDebugTimer endEvent:](self, "endEvent:", a3);
  if (a3)
  {
    if (*a3)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s - %s"), a3, a4);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    eventMessage = self->_eventMessage;
    self->_eventMessage = v7;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    categoryMessage = self->_categoryMessage;
    self->_categoryMessage = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_eventMessage;
    self->_eventMessage = v8;

    categoryMessage = self->_categoryMessage;
    self->_categoryMessage = 0;
  }

  fprintf((FILE *)*MEMORY[0x1E0C80C10], "TIMING:  %s\n", -[NSString UTF8String](self->_eventMessage, "UTF8String"));
  v13 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  eventStartTime = self->_eventStartTime;
  self->_eventStartTime = v13;

  self->_signpostID = os_signpost_id_generate((os_log_t)self->_logHandle);
}

- (void)endEvent:(const char *)a3
{
  NSDate *eventStartTime;
  __CFString *v5;
  id v6;
  FILE *v7;
  double v8;
  double v9;
  double v10;
  NSString *eventMessage;

  eventStartTime = self->_eventStartTime;
  if (eventStartTime && self->_eventMessage)
  {
    if (self->_signpostID)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = &stru_1E4E04720;
      }

    }
    v6 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v7 = (FILE *)*MEMORY[0x1E0C80C10];
    objc_msgSend(v6, "timeIntervalSinceDate:", self->_programStartTime);
    v9 = v8;
    objc_msgSend(v6, "timeIntervalSinceDate:", self->_eventStartTime);
    fprintf(v7, "TIMING (%.02f elapsed):  %.02f seconds for %s\n\n", v9, v10, -[NSString UTF8String](self->_eventMessage, "UTF8String"));

    eventStartTime = self->_eventStartTime;
  }
  self->_eventStartTime = 0;

  eventMessage = self->_eventMessage;
  self->_eventMessage = 0;

  self->_signpostID = 0;
}

- (void)stop
{
  NSString *categoryMessage;
  uint64_t v4;
  NSDate *v5;
  NSDate *programStartTime;

  categoryMessage = self->_categoryMessage;
  if (categoryMessage)
    v4 = -[NSString UTF8String](categoryMessage, "UTF8String");
  else
    v4 = 0;
  -[VMUDebugTimer endEvent:](self, "endEvent:", v4);
  v5 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  programStartTime = self->_programStartTime;
  self->_programStartTime = v5;

}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_categoryMessage, 0);
  objc_storeStrong((id *)&self->_eventMessage, 0);
  objc_storeStrong((id *)&self->_eventStartTime, 0);
  objc_storeStrong((id *)&self->_programStartTime, 0);
}

@end
