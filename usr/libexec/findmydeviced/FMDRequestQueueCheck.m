@implementation FMDRequestQueueCheck

- (FMDRequestQueueCheck)initWithAccount:(id)a3 shutdownActivityPending:(BOOL)a4
{
  _BOOL8 v4;
  FMDRequestQueueCheck *v5;
  FMDRequestQueueCheck *v6;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)FMDRequestQueueCheck;
  v5 = -[FMDRequest initWithAccount:](&v8, "initWithAccount:", a3);
  v6 = v5;
  if (v5)
    -[FMDRequestQueueCheck setShutdownActivityPending:](v5, "setShutdownActivityPending:", v4);
  return v6;
}

- (id)urlTemplateType
{
  return CFSTR("qc");
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDRequestQueueCheck;
  v3 = -[FMDRequest requestBody](&v7, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[FMDRequestQueueCheck shutdownActivityPending](self, "shutdownActivityPending"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDRequestQueueCheck shutdownActivityPending](self, "shutdownActivityPending")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("willShutdownSoon"));

  }
  return v4;
}

- (double)maxRetryInterval
{
  return 3600.0;
}

- (int64_t)maxNonNetworkRelatedRetries
{
  return -1;
}

- (int64_t)maxConsecutiveNetworkNotificationRetries
{
  return -1;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (BOOL)shutdownActivityPending
{
  return self->_shutdownActivityPending;
}

- (void)setShutdownActivityPending:(BOOL)a3
{
  self->_shutdownActivityPending = a3;
}

@end
