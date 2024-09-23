@implementation _HKSPQueueBackedScheduler

- (_HKSPQueueBackedScheduler)initWithQueue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _HKSPQueueBackedScheduler *v7;

  v4 = (void *)MEMORY[0x1E0D519E8];
  v5 = a3;
  objc_msgSend(v4, "schedulerWithDispatchQueue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_HKSPQueueBackedScheduler initWithScheduler:queue:](self, "initWithScheduler:queue:", v6, v5);

  return v7;
}

- (_HKSPQueueBackedScheduler)initWithScheduler:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  _HKSPQueueBackedScheduler *v9;
  _HKSPQueueBackedScheduler *v10;
  _HKSPQueueBackedScheduler *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_HKSPQueueBackedScheduler;
  v9 = -[_HKSPQueueBackedScheduler init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scheduler, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    v11 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return (id)-[NAScheduler afterDelay:performBlock:](self->_scheduler, "afterDelay:performBlock:", a4, a3);
}

- (void)performBlock:(id)a3
{
  -[NAScheduler performBlock:](self->_scheduler, "performBlock:", a3);
}

- (id)performCancelableBlock:(id)a3
{
  return (id)-[NAScheduler performCancelableBlock:](self->_scheduler, "performCancelableBlock:", a3);
}

- (void)suspend
{
  dispatch_suspend((dispatch_object_t)self->_queue);
}

- (void)resume
{
  dispatch_resume((dispatch_object_t)self->_queue);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NAScheduler)scheduler
{
  return self->_scheduler;
}

@end
