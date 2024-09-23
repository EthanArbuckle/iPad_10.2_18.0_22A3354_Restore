@implementation BRCSubscriber

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak(&self->_object, a3);
}

- (NSArray)keys
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)callback
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_destroyWeak(&self->_object);
}

@end
