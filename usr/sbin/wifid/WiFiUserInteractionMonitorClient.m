@implementation WiFiUserInteractionMonitorClient

- (void)context
{
  return self->_context;
}

- (id)callback
{
  return self->_callback;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

@end
