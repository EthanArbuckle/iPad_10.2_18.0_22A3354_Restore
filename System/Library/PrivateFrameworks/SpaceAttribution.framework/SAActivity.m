@implementation SAActivity

- (SAActivity)initWithActivity:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  SAActivity *v9;
  SAActivity *v10;
  uint64_t v11;
  id completionHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SAActivity;
  v9 = -[SAActivity init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activity, a3);
    v11 = MEMORY[0x249583868](v8);
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = (id)v11;

    *(_WORD *)&v10->_shouldStop = 0;
  }

  return v10;
}

+ (id)newWithActivity:(id)a3 andCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithActivity:completionHandler:", v7, v6);

  return v8;
}

- (void)setActivityResult:(int64_t)a3
{
  void (**completionHandler)(id, int64_t);

  completionHandler = (void (**)(id, int64_t))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, a3);
}

- (BOOL)shouldDefer
{
  SAActivity *v2;
  NSBackgroundActivityScheduler *activity;
  BOOL deferActivity;

  v2 = self;
  objc_sync_enter(v2);
  activity = v2->_activity;
  if (activity)
    deferActivity = -[NSBackgroundActivityScheduler shouldDefer](activity, "shouldDefer");
  else
    deferActivity = v2->_deferActivity;
  objc_sync_exit(v2);

  return deferActivity;
}

- (BOOL)shouldStop
{
  SAActivity *v2;
  BOOL shouldStop;

  v2 = self;
  objc_sync_enter(v2);
  shouldStop = v2->_shouldStop;
  objc_sync_exit(v2);

  return shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  SAActivity *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_shouldStop = a3;
  objc_sync_exit(obj);

}

- (BOOL)deferActivity
{
  return self->_deferActivity;
}

- (void)setDeferActivity:(BOOL)a3
{
  self->_deferActivity = a3;
}

- (NSBackgroundActivityScheduler)activity
{
  return (NSBackgroundActivityScheduler *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
