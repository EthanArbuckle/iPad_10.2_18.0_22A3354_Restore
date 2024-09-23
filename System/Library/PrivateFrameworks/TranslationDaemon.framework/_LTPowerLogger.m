@implementation _LTPowerLogger

- (_LTPowerLogger)init
{
  _LTPowerLogger *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *loggerQueue;
  uint64_t v5;
  NSOrderedSet *requestTypeSet;
  _LTPowerLogger *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_LTPowerLogger;
  v2 = -[_LTPowerLogger init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.translation.powerlog", 0);
    loggerQueue = v2->_loggerQueue;
    v2->_loggerQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObjects:", CFSTR("sentence"), CFSTR("singleParagraph"), CFSTR("paragraphs"), CFSTR("tts"), CFSTR("text-to-speech"), CFSTR("speech"), CFSTR("preheat"), CFSTR("text-LID"), 0);
    v5 = objc_claimAutoreleasedReturnValue();
    requestTypeSet = v2->_requestTypeSet;
    v2->_requestTypeSet = (NSOrderedSet *)v5;

    v7 = v2;
  }

  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_22);
  return (id)sharedInstance_sharedInstance;
}

- (void)logTranslateRequestEvent:(id)a3 requestType:(id)a4 routeType:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *loggerQueue;
  _QWORD block[4];
  id v12;
  _LTPowerLogger *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  if (-[_LTPowerLogger _shouldLogRequest:](self, "_shouldLogRequest:", a5))
  {
    loggerQueue = self->_loggerQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65___LTPowerLogger_logTranslateRequestEvent_requestType_routeType___block_invoke;
    block[3] = &unk_251A12DD0;
    v12 = v8;
    v13 = self;
    v14 = v9;
    dispatch_async(loggerQueue, block);

  }
}

- (id)_maskForRequestType:(id)a3
{
  NSUInteger v3;

  v3 = -[NSOrderedSet indexOfObject:](self->_requestTypeSet, "indexOfObject:", a3);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return &unk_251A50B60;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_shouldLogRequest:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (OS_dispatch_queue)loggerQueue
{
  return self->_loggerQueue;
}

- (void)setLoggerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_loggerQueue, a3);
}

- (NSOrderedSet)requestTypeSet
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequestTypeSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTypeSet, 0);
  objc_storeStrong((id *)&self->_loggerQueue, 0);
}

@end
