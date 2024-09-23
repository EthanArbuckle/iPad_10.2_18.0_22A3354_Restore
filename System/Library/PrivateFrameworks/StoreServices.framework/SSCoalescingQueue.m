@implementation SSCoalescingQueue

- (SSCoalescingQueue)initWithBlock:(id)a3
{
  id v4;
  id v5;
  dispatch_queue_t v6;
  void *v7;
  dispatch_source_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SSCoalescingQueue;
  v5 = -[SSCoalescingQueue init](&v11, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.StoreServices.SSCoalescingQueue", 0);
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    v8 = dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, *((dispatch_queue_t *)v5 + 1));
    v9 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v8;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v5 + 2), v4);
    dispatch_resume(*((dispatch_object_t *)v5 + 2));
  }

  return (SSCoalescingQueue *)v5;
}

- (void)executeBlock
{
  NSObject *v2;

  -[SSCoalescingQueue source](self, "source");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_source_merge_data(v2, 1uLL);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
