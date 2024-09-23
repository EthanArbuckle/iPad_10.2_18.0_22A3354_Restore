@implementation _RECallbackAndPreviousStatus

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (id)invalidationCallback
{
  return self->_invalidationCallback;
}

- (void)setInvalidationCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_invalidationCallback, 0);
}

@end
