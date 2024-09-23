@implementation TRINotificationCallback

- (unint64_t)id
{
  return self->_id;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TRINotificationCallback)init
{
  TRINotificationCallback *result;
  signed int v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TRINotificationCallback;
  result = -[TRINotificationCallback init](&v4, sel_init);
  if (result)
  {
    do
      v3 = __ldaxr((unsigned int *)&init_objCount);
    while (__stlxr(v3 + 1, (unsigned int *)&init_objCount));
    result->_id = v3;
  }
  return result;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
