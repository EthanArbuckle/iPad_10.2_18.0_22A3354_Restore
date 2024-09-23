@implementation DOCSourceObserverInfos

- (DOCConfiguration)configuration
{
  return (DOCConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (DOCSourceObserverToken)token
{
  return (DOCSourceObserverToken *)objc_getProperty(self, a2, 16, 1);
}

- (void)setToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)block
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
