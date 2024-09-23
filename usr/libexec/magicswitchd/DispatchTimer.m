@implementation DispatchTimer

- (DispatchTimer)initWithIdentifier:(id)a3 delay:(double)a4 gracePeriod:(double)a5 handlerBlock:(id)a6
{
  id v11;
  id v12;
  DispatchTimer *v13;
  DispatchTimer *v14;
  id v15;
  id handlerBlock;
  objc_super v18;

  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)DispatchTimer;
  v13 = -[DispatchTimer init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    v14->_delay = a4;
    v14->_gracePeriod = a5;
    v15 = objc_retainBlock(v12);
    handlerBlock = v14->_handlerBlock;
    v14->_handlerBlock = v15;

    -[DispatchTimer scheduleTimer](v14, "scheduleTimer");
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidated)
    -[DispatchTimer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)DispatchTimer;
  -[DispatchTimer dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  NSObject *timerSource;
  OS_dispatch_source *v4;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    timerSource = self->_timerSource;
    if (timerSource)
    {
      dispatch_source_cancel(timerSource);
      v4 = self->_timerSource;
      self->_timerSource = 0;

    }
  }
}

- (BOOL)isWaking
{
  return 0;
}

- (void)scheduleTimer
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  OS_dispatch_source *timerSource;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workQueue"));
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);

  v6 = dispatch_time(0, (uint64_t)(self->_delay * 1000000000.0));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000AC04;
  v9[3] = &unk_1000184D0;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v5, v9);
  timerSource = self->_timerSource;
  self->_timerSource = (OS_dispatch_source *)v5;
  v8 = v5;

  dispatch_resume(v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)fireTimer
{
  OS_dispatch_source *timerSource;

  timerSource = self->_timerSource;
  self->_timerSource = 0;

  self->_invalidated = 1;
  (*((void (**)(void))self->_handlerBlock + 2))();
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
  objc_storeStrong((id *)&self->_timerSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
