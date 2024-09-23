@implementation WiFiSoftErrorContext

- (WiFiSoftErrorContext)initWithErrorType:(int)a3 deviceContext:(void *)a4
{
  WiFiSoftErrorContext *v6;
  WiFiSoftErrorContext *v7;
  uint64_t v8;
  NSMutableArray *v9;
  NSMutableArray *errorContextData;
  NSMutableArray *v11;
  NSMutableArray *statsRecordData;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WiFiSoftErrorContext;
  v6 = -[WiFiSoftErrorContext init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    v6->_errorType = a3;
    v6->_errorState = 0;
    v8 = 24;
    if (a3 == 1)
      v8 = 16;
    *(Class *)((char *)&v6->super.isa + v8) = (Class)a4;
    v6->_triggerTime = CFAbsoluteTimeGetCurrent();
    v7->_detectionTime = 0.0;
    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    errorContextData = v7->_errorContextData;
    v7->_errorContextData = v9;

    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    statsRecordData = v7->_statsRecordData;
    v7->_statsRecordData = v11;

  }
  else
  {
    v14 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: super-init failed!", "-[WiFiSoftErrorContext initWithErrorType:deviceContext:]");
    objc_autoreleasePoolPop(v14);
  }
  return v7;
}

- (void)addStatsRecord:(id)a3
{
  NSMutableArray *statsRecordData;

  statsRecordData = self->_statsRecordData;
  if (statsRecordData)
    -[NSMutableArray addObject:](statsRecordData, "addObject:", a3);
}

- (id)fetchSoftErrorContextData
{
  NSMutableArray *errorContextData;
  NSMutableArray *v4;
  NSMutableArray *v5;
  void *v7;
  void *context;

  errorContextData = self->_errorContextData;
  if (!errorContextData)
  {
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v5 = self->_errorContextData;
    self->_errorContextData = v4;

    errorContextData = self->_errorContextData;
    if (!errorContextData)
    {
      v7 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
      {
        context = v7;
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Couldn't allocate contextData", "-[WiFiSoftErrorContext fetchSoftErrorContextData]");
        v7 = context;
      }
      objc_autoreleasePoolPop(v7);
      errorContextData = self->_errorContextData;
    }
  }
  return errorContextData;
}

- (int)errorState
{
  return self->_errorState;
}

- (void)setErrorState:(int)a3
{
  self->_errorState = a3;
}

- (double)detectionTime
{
  return self->_detectionTime;
}

- (void)setDetectionTime:(double)a3
{
  self->_detectionTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsRecordData, 0);
  objc_storeStrong((id *)&self->_errorContextData, 0);
}

@end
