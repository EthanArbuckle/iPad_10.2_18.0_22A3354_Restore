@implementation SVXTaskTracker

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "taskTrackerDidEnd:", self);

  v4.receiver = self;
  v4.super_class = (Class)SVXTaskTracker;
  -[SVXTaskTracker dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v7.receiver = self;
  v7.super_class = (Class)SVXTaskTracker;
  -[SVXTaskTracker description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {context = %@, instrumentationContext = %@}"), v4, self->_context, self->_instrumentationContext);

  return (NSString *)v5;
}

- (SVXTaskTracker)initWithContext:(id)a3 instrumentationContext:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  SVXTaskTracker *v11;
  uint64_t v12;
  SVXTaskContext *context;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SVXTaskTracker;
  v11 = -[SVXTaskTracker init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    context = v11->_context;
    v11->_context = (SVXTaskContext *)v12;

    objc_storeStrong((id *)&v11->_instrumentationContext, a4);
    objc_storeWeak((id *)&v11->_delegate, v10);
  }

  return v11;
}

- (id)beginChildWithContext:(id)a3
{
  id v4;
  id v5;
  AFAnalyticsTurnBasedInstrumentationContext *instrumentationContext;
  id WeakRetained;
  id *v8;
  id v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  instrumentationContext = self->_instrumentationContext;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = (id *)objc_msgSend(v5, "initWithContext:instrumentationContext:delegate:", v4, instrumentationContext, WeakRetained);

  objc_storeStrong(v8 + 3, self);
  v9 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v9, "taskTracker:childWillBegin:", self, v8);

  return v8;
}

- (int64_t)origin
{
  SVXTaskTracker *v2;
  SVXTaskTracker *v3;
  void *v4;
  int64_t v5;

  v2 = self;
  do
  {
    v3 = v2;
    -[SVXTaskTracker context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "origin");

    -[SVXTaskTracker parent](v3, "parent");
    v2 = (SVXTaskTracker *)objc_claimAutoreleasedReturnValue();

  }
  while (v2 && !v5);

  return v5;
}

- (unint64_t)timestamp
{
  SVXTaskTracker *v2;
  SVXTaskTracker *v3;
  void *v4;
  unint64_t v5;

  v2 = self;
  do
  {
    v3 = v2;
    -[SVXTaskTracker context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "timestamp");

    -[SVXTaskTracker parent](v3, "parent");
    v2 = (SVXTaskTracker *)objc_claimAutoreleasedReturnValue();

  }
  while (v2 && !v5);

  return v5;
}

- (NSUUID)sessionUUID
{
  SVXTaskTracker *v2;
  SVXTaskTracker *v3;
  void *v4;
  void *v5;

  v2 = self;
  do
  {
    v3 = v2;
    -[SVXTaskTracker context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SVXTaskTracker parent](v3, "parent");
    v2 = (SVXTaskTracker *)objc_claimAutoreleasedReturnValue();

  }
  while (v2 && !v5);

  return (NSUUID *)v5;
}

- (NSUUID)requestUUID
{
  SVXTaskTracker *v2;
  SVXTaskTracker *v3;
  void *v4;
  void *v5;

  v2 = self;
  do
  {
    v3 = v2;
    -[SVXTaskTracker context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SVXTaskTracker parent](v3, "parent");
    v2 = (SVXTaskTracker *)objc_claimAutoreleasedReturnValue();

  }
  while (v2 && !v5);

  return (NSUUID *)v5;
}

- (NSString)aceId
{
  SVXTaskTracker *v2;
  SVXTaskTracker *v3;
  void *v4;
  void *v5;

  v2 = self;
  do
  {
    v3 = v2;
    -[SVXTaskTracker context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SVXTaskTracker parent](v3, "parent");
    v2 = (SVXTaskTracker *)objc_claimAutoreleasedReturnValue();

  }
  while (v2 && !v5);

  return (NSString *)v5;
}

- (NSString)refId
{
  SVXTaskTracker *v2;
  SVXTaskTracker *v3;
  void *v4;
  void *v5;

  v2 = self;
  do
  {
    v3 = v2;
    -[SVXTaskTracker context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SVXTaskTracker parent](v3, "parent");
    v2 = (SVXTaskTracker *)objc_claimAutoreleasedReturnValue();

  }
  while (v2 && !v5);

  return (NSString *)v5;
}

- (NSString)dialogIdentifier
{
  SVXTaskTracker *v2;
  SVXTaskTracker *v3;
  void *v4;
  void *v5;

  v2 = self;
  do
  {
    v3 = v2;
    -[SVXTaskTracker context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialogIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SVXTaskTracker parent](v3, "parent");
    v2 = (SVXTaskTracker *)objc_claimAutoreleasedReturnValue();

  }
  while (v2 && !v5);

  return (NSString *)v5;
}

- (NSString)dialogPhase
{
  SVXTaskTracker *v2;
  SVXTaskTracker *v3;
  void *v4;
  void *v5;

  v2 = self;
  do
  {
    v3 = v2;
    -[SVXTaskTracker context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialogPhase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SVXTaskTracker parent](v3, "parent");
    v2 = (SVXTaskTracker *)objc_claimAutoreleasedReturnValue();

  }
  while (v2 && !v5);

  return (NSString *)v5;
}

- (BOOL)isUUFR
{
  SVXTaskTracker *v2;
  SVXTaskTracker *v3;
  void *v4;
  int v5;

  v2 = self;
  do
  {
    v3 = v2;
    -[SVXTaskTracker context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isUUFR");

    -[SVXTaskTracker parent](v3, "parent");
    v2 = (SVXTaskTracker *)objc_claimAutoreleasedReturnValue();

  }
  while (v2 && !v5);

  return v5;
}

- (BOOL)listensAfterSpeaking
{
  SVXTaskTracker *v2;
  SVXTaskTracker *v3;
  void *v4;
  int v5;

  v2 = self;
  do
  {
    v3 = v2;
    -[SVXTaskTracker context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "listensAfterSpeaking");

    -[SVXTaskTracker parent](v3, "parent");
    v2 = (SVXTaskTracker *)objc_claimAutoreleasedReturnValue();

  }
  while (v2 && !v5);

  return v5;
}

- (SAUIListenAfterSpeakingBehavior)listenAfterSpeakingBehavior
{
  SVXTaskTracker *v2;
  SVXTaskTracker *v3;
  void *v4;
  void *v5;

  v2 = self;
  do
  {
    v3 = v2;
    -[SVXTaskTracker context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listenAfterSpeakingBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SVXTaskTracker parent](v3, "parent");
    v2 = (SVXTaskTracker *)objc_claimAutoreleasedReturnValue();

  }
  while (v2 && !v5);

  return (SAUIListenAfterSpeakingBehavior *)v5;
}

- (SVXActivationContext)activationContext
{
  SVXTaskTracker *v2;
  SVXTaskTracker *v3;
  void *v4;
  void *v5;

  v2 = self;
  do
  {
    v3 = v2;
    -[SVXTaskTracker context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SVXTaskTracker parent](v3, "parent");
    v2 = (SVXTaskTracker *)objc_claimAutoreleasedReturnValue();

  }
  while (v2 && !v5);

  return (SVXActivationContext *)v5;
}

- (SVXDeactivationContext)deactivationContext
{
  SVXTaskTracker *v2;
  SVXTaskTracker *v3;
  void *v4;
  void *v5;

  v2 = self;
  do
  {
    v3 = v2;
    -[SVXTaskTracker context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SVXTaskTracker parent](v3, "parent");
    v2 = (SVXTaskTracker *)objc_claimAutoreleasedReturnValue();

  }
  while (v2 && !v5);

  return (SVXDeactivationContext *)v5;
}

- (NSError)error
{
  SVXTaskTracker *v2;
  SVXTaskTracker *v3;
  void *v4;
  void *v5;

  v2 = self;
  do
  {
    v3 = v2;
    -[SVXTaskTracker context](v2, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SVXTaskTracker parent](v3, "parent");
    v2 = (SVXTaskTracker *)objc_claimAutoreleasedReturnValue();

  }
  while (v2 && !v5);

  return (NSError *)v5;
}

- (SVXTaskContext)context
{
  return self->_context;
}

- (SVXTaskTracking)parent
{
  return self->_parent;
}

- (AFAnalyticsTurnBasedInstrumentationContext)instrumentationContext
{
  return self->_instrumentationContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationContext, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
