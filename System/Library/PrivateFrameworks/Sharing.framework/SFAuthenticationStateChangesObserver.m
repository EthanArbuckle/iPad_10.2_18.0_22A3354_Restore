@implementation SFAuthenticationStateChangesObserver

- (SFAuthenticationStateChangesObserver)initWithObserver:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  SFAuthenticationStateChangesObserver *v8;
  void *v9;
  id observer;
  NSUUID *v11;
  NSUUID *identifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SFAuthenticationStateChangesObserver;
  v8 = -[SFAuthenticationStateChangesObserver init](&v14, sel_init);
  if (v8)
  {
    v9 = _Block_copy(v6);
    observer = v8->_observer;
    v8->_observer = v9;

    objc_storeStrong((id *)&v8->_queue, a4);
    v11 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    identifier = v8->_identifier;
    v8->_identifier = v11;

  }
  return v8;
}

- (void)stateDidChange
{
  void *v3;
  void *v4;
  NSObject *queue;

  -[SFAuthenticationStateChangesObserver observer](self, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SFAuthenticationStateChangesObserver queue](self, "queue");
    queue = objc_claimAutoreleasedReturnValue();
    -[SFAuthenticationStateChangesObserver observer](self, "observer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(queue, v4);

  }
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)observer
{
  return self->_observer;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
