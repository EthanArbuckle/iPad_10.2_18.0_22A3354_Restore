@implementation SVXQueuePerformer

- (NSString)description
{
  id v3;
  void *v4;
  OS_dispatch_queue *queue;
  NSString *identifier;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v10.receiver = self;
  v10.super_class = (Class)SVXQueuePerformer;
  -[SVXQueuePerformer description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  identifier = self->_identifier;
  SVXPerformingOptionsGetNames(self->_options);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {identifier = %@, queue = %@, options = (%@)}"), v4, identifier, queue, v7);

  return (NSString *)v8;
}

- (SVXQueuePerformer)initWithIdentifier:(id)a3 qosClass:(unsigned int)a4 relativePriority:(int)a5 options:(unint64_t)a6
{
  id v10;
  const char *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  SVXQueuePerformer *v15;

  v10 = objc_retainAutorelease(a3);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v12, (dispatch_qos_class_t)a4, a5);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = dispatch_queue_create(v11, v13);
  dispatch_queue_set_specific(v14, (const void *)SVXQueuePerformerIdentityKey, self, 0);
  v15 = -[SVXQueuePerformer _initWithIdentifier:queue:options:](self, "_initWithIdentifier:queue:options:", v10, v14, a6);

  return v15;
}

- (void)performBlock:(id)a3
{
  if (a3)
    -[SVXQueuePerformer _performBlock:withOptions:](self, "_performBlock:withOptions:", a3, self->_options);
}

- (void)performBlock:(id)a3 afterDelay:(double)a4
{
  id v6;
  void *v7;
  dispatch_time_t v8;
  dispatch_block_t block;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    block = v6;
    if (a4 == 0.0)
    {
      -[SVXQueuePerformer _performBlock:withOptions:](self, "_performBlock:withOptions:", v6, self->_options);
    }
    else
    {
      v8 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      dispatch_after(v8, (dispatch_queue_t)self->_queue, block);
    }
    v7 = block;
  }

}

- (void)performBlock:(id)a3 withOptions:(unint64_t)a4
{
  if (a3)
    -[SVXQueuePerformer _performBlock:withOptions:](self, "_performBlock:withOptions:", a3, a4);
}

- (void)performBlock:(id)a3 afterGroup:(id)a4
{
  NSObject *v6;
  dispatch_block_t block;

  block = a3;
  v6 = a4;
  if (block)
  {
    if ((self->_options & 2) != 0 && !dispatch_group_wait(v6, 0))
      -[SVXQueuePerformer _performBlock:withOptions:](self, "_performBlock:withOptions:", block, self->_options);
    else
      dispatch_group_notify(v6, (dispatch_queue_t)self->_queue, block);
  }

}

- (void)performBlockSync:(id)a3
{
  if (a3)
    -[SVXQueuePerformer _performBlockSync:withOptions:](self, "_performBlockSync:withOptions:", a3, self->_options);
}

- (id)_initWithIdentifier:(id)a3 queue:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  SVXQueuePerformer *v10;
  uint64_t v11;
  NSString *identifier;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SVXQueuePerformer;
  v10 = -[SVXQueuePerformer init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v10->_queue, a4);
    v10->_options = a5;
  }

  return v10;
}

- (void)_performBlock:(id)a3 withOptions:(unint64_t)a4
{
  char v4;
  void (**v6)(void);
  _BOOL8 v7;
  void *v8;
  NSObject *queue;
  void (**v10)(void);

  v4 = a4;
  v6 = (void (**)(void))a3;
  v10 = v6;
  if ((v4 & 2) != 0 && (v7 = -[SVXQueuePerformer _isExecutingInContext](self, "_isExecutingInContext"), v6 = v10, v7))
  {
    v8 = (void *)MEMORY[0x2199D9374](v7, v10);
    v10[2]();
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    queue = self->_queue;
    if ((v4 & 1) != 0)
      dispatch_sync(queue, v6);
    else
      dispatch_async(queue, v6);
  }

}

- (void)_performBlockSync:(id)a3 withOptions:(unint64_t)a4
{
  char v4;
  void (**v6)(void);
  _BOOL8 v7;
  void *v8;
  void (**v9)(void);

  v4 = a4;
  v6 = (void (**)(void))a3;
  v9 = v6;
  if ((v4 & 2) != 0 && (v7 = -[SVXQueuePerformer _isExecutingInContext](self, "_isExecutingInContext"), v6 = v9, v7))
  {
    v8 = (void *)MEMORY[0x2199D9374](v7, v9);
    v9[2]();
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    dispatch_sync((dispatch_queue_t)self->_queue, v6);
  }

}

- (BOOL)_isExecutingInContext
{
  return dispatch_get_specific((const void *)SVXQueuePerformerIdentityKey) == self;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)sharedMainQueuePerformer
{
  if (sharedMainQueuePerformer_onceToken != -1)
    dispatch_once(&sharedMainQueuePerformer_onceToken, &__block_literal_global_6319);
  return (id)sharedMainQueuePerformer_sharedMainQueuePerformer;
}

void __45__SVXQueuePerformer_sharedMainQueuePerformer__block_invoke()
{
  _SVXMainQueuePerformer *v0;
  uint64_t v1;
  void *v2;

  v0 = [_SVXMainQueuePerformer alloc];
  v1 = -[SVXQueuePerformer _initWithIdentifier:queue:options:](v0, "_initWithIdentifier:queue:options:", CFSTR("Main Queue Performer"), MEMORY[0x24BDAC9B8], 0);
  v2 = (void *)sharedMainQueuePerformer_sharedMainQueuePerformer;
  sharedMainQueuePerformer_sharedMainQueuePerformer = v1;

}

@end
