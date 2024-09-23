@implementation WakingTimer

- (WakingTimer)initWithIdentifier:(id)a3 delay:(double)a4 gracePeriod:(double)a5 handlerBlock:(id)a6
{
  id v11;
  id v12;
  WakingTimer *v13;
  WakingTimer *v14;
  id v15;
  id handlerBlock;
  void *v17;
  objc_super v19;

  v11 = a3;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WakingTimer;
  v13 = -[WakingTimer init](&v19, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    v14->_delay = a4;
    v14->_gracePeriod = a5;
    v15 = objc_retainBlock(v12);
    handlerBlock = v14->_handlerBlock;
    v14->_handlerBlock = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[WakingTimerScheduler sharedInstance](WakingTimerScheduler, "sharedInstance"));
    objc_msgSend(v17, "scheduleTimer:", v14);

  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[WakingTimer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WakingTimer;
  -[WakingTimer dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  id v3;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    v3 = (id)objc_claimAutoreleasedReturnValue(+[WakingTimerScheduler sharedInstance](WakingTimerScheduler, "sharedInstance"));
    objc_msgSend(v3, "cancelTimer:", self);

  }
}

- (BOOL)isWaking
{
  return 1;
}

- (void)fireTimer
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    (*((void (**)(void))self->_handlerBlock + 2))();
  }
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (unint64_t)earliestFireTime
{
  return self->_earliestFireTime;
}

- (void)setEarliestFireTime:(unint64_t)a3
{
  self->_earliestFireTime = a3;
}

- (unint64_t)deadline
{
  return self->_deadline;
}

- (void)setDeadline:(unint64_t)a3
{
  self->_deadline = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

- (id)handlerBlock
{
  return self->_handlerBlock;
}

- (void)setHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
