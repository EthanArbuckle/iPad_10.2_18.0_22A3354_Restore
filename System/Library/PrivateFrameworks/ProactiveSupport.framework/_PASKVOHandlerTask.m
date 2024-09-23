@implementation _PASKVOHandlerTask

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSObject)object
{
  return objc_loadWeakRetained((id *)&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak((id *)&self->_object, a3);
}

- (id)afterBlock
{
  return self->_afterBlock;
}

- (void)setAfterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)beforeAndAfterBlock
{
  return self->_beforeAndAfterBlock;
}

- (void)setBeforeAndAfterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_beforeAndAfterBlock, 0);
  objc_storeStrong(&self->_afterBlock, 0);
  objc_destroyWeak((id *)&self->_object);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
