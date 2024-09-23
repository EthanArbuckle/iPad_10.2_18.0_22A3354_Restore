@implementation _DASCollectTelemetryActivityContext

- (_DASCollectTelemetryActivityContext)init
{
  _DASCollectTelemetryActivityContext *v2;
  _DASCollectTelemetryActivityContext *v3;
  BGSystemTask *task;
  NSDate *prewarmingDataCollectionStartDate;
  NSDate *launchDataCollectionStartDate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASCollectTelemetryActivityContext;
  v2 = -[_DASCollectTelemetryActivityContext init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    task = v2->_task;
    v2->_task = 0;

    prewarmingDataCollectionStartDate = v3->_prewarmingDataCollectionStartDate;
    v3->_prewarmingDataCollectionStartDate = 0;

    launchDataCollectionStartDate = v3->_launchDataCollectionStartDate;
    v3->_launchDataCollectionStartDate = 0;

    v3->_wasDeferred = 0;
  }
  return v3;
}

- (void)updateWithtask:(id)a3 prewarmingStartDate:(id)a4 launchStartDate:(id)a5
{
  BGSystemTask *v8;
  NSDate *v9;
  NSDate *v10;
  BGSystemTask *task;
  BGSystemTask *v12;
  NSDate *prewarmingDataCollectionStartDate;
  NSDate *v14;
  NSDate *launchDataCollectionStartDate;

  v8 = (BGSystemTask *)a3;
  v9 = (NSDate *)a4;
  v10 = (NSDate *)a5;
  task = self->_task;
  self->_task = v8;
  v12 = v8;

  prewarmingDataCollectionStartDate = self->_prewarmingDataCollectionStartDate;
  self->_prewarmingDataCollectionStartDate = v9;
  v14 = v9;

  launchDataCollectionStartDate = self->_launchDataCollectionStartDate;
  self->_launchDataCollectionStartDate = v10;

  self->_wasDeferred = 0;
}

- (id)description
{
  uint64_t v3;
  const __CFString *v4;

  v3 = objc_opt_class(self);
  if (self->_wasDeferred)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@, %@, %@, deferred: %@>"), v3, *(_OWORD *)&self->_task, self->_launchDataCollectionStartDate, v4);
}

- (BGSystemTask)task
{
  return (BGSystemTask *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)prewarmingDataCollectionStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrewarmingDataCollectionStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)launchDataCollectionStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLaunchDataCollectionStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)wasDeferred
{
  return self->_wasDeferred;
}

- (void)setWasDeferred:(BOOL)a3
{
  self->_wasDeferred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchDataCollectionStartDate, 0);
  objc_storeStrong((id *)&self->_prewarmingDataCollectionStartDate, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
