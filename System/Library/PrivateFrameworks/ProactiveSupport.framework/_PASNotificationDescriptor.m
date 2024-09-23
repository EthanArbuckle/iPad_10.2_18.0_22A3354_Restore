@implementation _PASNotificationDescriptor

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
