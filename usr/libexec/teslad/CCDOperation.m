@implementation CCDOperation

- (CCDOperation)init
{
  CCDOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCDOperation;
  result = -[CCDOperation init](&v3, "init");
  if (result)
    result->_operationReady = 1;
  return result;
}

- (void)setOperationReady:(BOOL)a3
{
  if (self->_operationReady != a3)
  {
    -[CCDOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("ready"));
    self->_operationReady = a3;
    -[CCDOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("ready"));
  }
}

- (void)setOperationExecuting:(BOOL)a3
{
  if (self->_operationExecuting != a3)
  {
    -[CCDOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("executing"));
    self->_operationExecuting = a3;
    -[CCDOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("executing"));
  }
}

- (void)setOperationFinished:(BOOL)a3
{
  if (self->_operationFinished != a3)
  {
    -[CCDOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("finished"));
    self->_operationFinished = a3;
    -[CCDOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("finished"));
  }
}

- (void)endOperation
{
  -[CCDOperation setOperationExecuting:](self, "setOperationExecuting:", 0);
  -[CCDOperation setOperationFinished:](self, "setOperationFinished:", 1);
}

- (BOOL)isFinished
{
  return self->_operationFinished;
}

- (BOOL)isExecuting
{
  return self->_operationExecuting;
}

- (BOOL)isReady
{
  return self->_operationReady;
}

- (BOOL)operationExecuting
{
  return self->_operationExecuting;
}

- (BOOL)operationFinished
{
  return self->_operationFinished;
}

- (BOOL)operationReady
{
  return self->_operationReady;
}

@end
