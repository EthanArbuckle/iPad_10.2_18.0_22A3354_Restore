@implementation REDispatchQueuePool

- (id)nextAvailableQueue
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSArray *queues;
  unint64_t v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSArray objectAtIndexedSubscript:](self->_queues, "objectAtIndexedSubscript:", self->_currentIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  queues = self->_queues;
  v6 = self->_currentIndex + 1;
  self->_currentIndex = v6;
  if (v6 >= -[NSArray count](queues, "count"))
    self->_currentIndex = 0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (REDispatchQueuePool)initWithQueueCount:(unint64_t)a3 prefix:(id)a4
{
  id v6;
  REDispatchQueuePool *v7;
  REDispatchQueuePool *v8;
  void *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  uint64_t v15;
  NSArray *queues;
  objc_super v18;

  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)REDispatchQueuePool;
  v7 = -[REDispatchQueuePool init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_currentIndex = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v10 = 0;
      do
      {
        objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%ld"), v10);
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v12 = (const char *)objc_msgSend(v11, "UTF8String");
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = dispatch_queue_create(v12, v13);
        objc_msgSend(v9, "addObject:", v14);

        ++v10;
      }
      while (a3 != v10);
    }
    v15 = objc_msgSend(v9, "copy");
    queues = v8->_queues;
    v8->_queues = (NSArray *)v15;

    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queues, 0);
}

@end
