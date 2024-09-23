@implementation PKAsyncFactoryOperationContainer

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

@end
