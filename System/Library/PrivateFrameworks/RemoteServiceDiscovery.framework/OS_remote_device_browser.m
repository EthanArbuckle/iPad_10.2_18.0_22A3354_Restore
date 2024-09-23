@implementation OS_remote_device_browser

- (void)dealloc
{
  _os_crash();
  __break(1u);
}

- (unsigned)device_type
{
  return self->_device_type;
}

- (void)setDevice_type:(unsigned int)a3
{
  self->_device_type = a3;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)cbq
{
  return self->_cbq;
}

- (void)setCbq:(id)a3
{
  objc_storeStrong((id *)&self->_cbq, a3);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (BOOL)canceling
{
  return self->_canceling;
}

- (void)setCanceling:(BOOL)a3
{
  self->_canceling = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_cbq, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
