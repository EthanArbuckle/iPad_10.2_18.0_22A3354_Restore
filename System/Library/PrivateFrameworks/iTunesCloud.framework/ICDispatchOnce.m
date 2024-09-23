@implementation ICDispatchOnce

- (ICDispatchOnce)initWithBooleanHandler:(id)a3
{
  id v4;
  ICDispatchOnce *v5;
  uint64_t v6;
  id BOOLeanHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDispatchOnce;
  v5 = -[ICDispatchOnce init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    BOOLeanHandler = v5->_BOOLeanHandler;
    v5->_BOOLeanHandler = (id)v6;

  }
  return v5;
}

- (ICDispatchOnce)initWithObjectHandler:(id)a3
{
  id v4;
  ICDispatchOnce *v5;
  uint64_t v6;
  id objectHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDispatchOnce;
  v5 = -[ICDispatchOnce init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    objectHandler = v5->_objectHandler;
    v5->_objectHandler = (id)v6;

  }
  return v5;
}

- (void)failWithError:(id)a3
{
  id v4;
  atomic_flag *p_didFire;
  unsigned __int8 v6;
  void (**BOOLeanHandler)(id, _QWORD);
  void (**objectHandler)(id, _QWORD, id);
  id v9;

  v4 = a3;
  p_didFire = &self->_didFire;
  do
    v6 = __ldaxr((unsigned __int8 *)p_didFire);
  while (__stlxr(1u, (unsigned __int8 *)p_didFire));
  if ((v6 & 1) == 0)
  {
    BOOLeanHandler = (void (**)(id, _QWORD))self->_BOOLeanHandler;
    v9 = v4;
    if (BOOLeanHandler)
    {
      BOOLeanHandler[2](BOOLeanHandler, 0);
    }
    else
    {
      objectHandler = (void (**)(id, _QWORD, id))self->_objectHandler;
      if (objectHandler)
        objectHandler[2](objectHandler, 0, v4);
    }
    -[ICDispatchOnce _invalidate](self, "_invalidate");
    v4 = v9;
  }

}

- (void)finishWithBooleanResult:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  atomic_flag *p_didFire;
  unsigned __int8 v8;
  void (**BOOLeanHandler)(id, _BOOL8);
  void *v10;
  id v11;

  v4 = a3;
  v6 = a4;
  p_didFire = &self->_didFire;
  do
    v8 = __ldaxr((unsigned __int8 *)p_didFire);
  while (__stlxr(1u, (unsigned __int8 *)p_didFire));
  if ((v8 & 1) == 0)
  {
    BOOLeanHandler = (void (**)(id, _BOOL8))self->_BOOLeanHandler;
    v11 = v6;
    if (BOOLeanHandler)
    {
      BOOLeanHandler[2](BOOLeanHandler, v4);
    }
    else if (self->_objectHandler)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v4);
      (*((void (**)(void))self->_objectHandler + 2))();

    }
    -[ICDispatchOnce _invalidate](self, "_invalidate");
    v6 = v11;
  }

}

- (void)finishWithObjectResult:(id)a3 error:(id)a4
{
  id v6;
  atomic_flag *p_didFire;
  unsigned __int8 v8;
  void (**objectHandler)(id, id, id);
  id v10;

  v10 = a3;
  v6 = a4;
  p_didFire = &self->_didFire;
  do
    v8 = __ldaxr((unsigned __int8 *)p_didFire);
  while (__stlxr(1u, (unsigned __int8 *)p_didFire));
  if ((v8 & 1) == 0)
  {
    objectHandler = (void (**)(id, id, id))self->_objectHandler;
    if (objectHandler)
    {
      objectHandler[2](objectHandler, v10, v6);
    }
    else if (self->_BOOLeanHandler)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v10, "BOOLValue");
      (*((void (**)(void))self->_BOOLeanHandler + 2))();
    }
    -[ICDispatchOnce _invalidate](self, "_invalidate");
  }

}

- (void)startWithTimeout:(double)a3
{
  -[ICDispatchOnce startWithTimeout:queue:](self, "startWithTimeout:queue:", 0, a3);
}

- (void)startWithTimeout:(double)a3 queue:(id)a4
{
  id v6;
  void *v7;
  OS_dispatch_queue *v8;
  NSObject *queue;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *timeoutTimer;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  _QWORD handler[5];

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (OS_dispatch_queue *)v6;
    queue = self->_queue;
    self->_queue = v8;
  }
  else
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    queue = objc_claimAutoreleasedReturnValue();
    v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iTunesCloud.ICDispatchOnce", queue);
    v11 = self->_queue;
    self->_queue = v10;

  }
  objc_storeStrong((id *)&self->_strongSelf, self);
  self->_timeout = a3;
  v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v12;

  v14 = self->_timeoutTimer;
  v15 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v14, v15, (uint64_t)(a3 * 1000000000.0), 0);
  v16 = self->_timeoutTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __41__ICDispatchOnce_startWithTimeout_queue___block_invoke;
  handler[3] = &unk_1E43913D8;
  handler[4] = self;
  dispatch_source_set_event_handler(v16, handler);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);

}

- (void)_invalidate
{
  NSObject *timeoutTimer;
  OS_dispatch_source *v4;
  id BOOLeanHandler;
  id objectHandler;
  OS_dispatch_queue *queue;
  ICDispatchOnce *strongSelf;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel(timeoutTimer);
    v4 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  BOOLeanHandler = self->_BOOLeanHandler;
  self->_BOOLeanHandler = 0;

  objectHandler = self->_objectHandler;
  self->_objectHandler = 0;

  queue = self->_queue;
  self->_queue = 0;

  strongSelf = self->_strongSelf;
  self->_strongSelf = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong(&self->_objectHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_BOOLeanHandler, 0);
}

void __41__ICDispatchOnce_startWithTimeout_queue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7003, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "failWithError:", v2);

}

@end
