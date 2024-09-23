@implementation WFCloudKitAsyncOperation

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)finishExecuting
{
  -[WFCloudKitAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[WFCloudKitAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[WFCloudKitAsyncOperation setIsExecuting:](self, "setIsExecuting:", 0);
  -[WFCloudKitAsyncOperation setIsFinished:](self, "setIsFinished:", 1);
  -[WFCloudKitAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[WFCloudKitAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

- (void)startExecuting
{
  -[WFCloudKitAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[WFCloudKitAsyncOperation setIsExecuting:](self, "setIsExecuting:", 1);
  -[WFCloudKitAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

@end
