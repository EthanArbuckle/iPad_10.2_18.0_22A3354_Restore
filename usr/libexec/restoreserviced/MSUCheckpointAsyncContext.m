@implementation MSUCheckpointAsyncContext

- (MSUCheckpointAsyncContext)init
{
  MSUCheckpointAsyncContext *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MSUCheckpointAsyncContext;
  v2 = -[MSUCheckpointAsyncContext init](&v4, "init");
  if (v2)
    -[MSUCheckpointAsyncContext setContextUUID:](v2, "setContextUUID:", -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString"));
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSUCheckpointAsyncContext;
  -[MSUCheckpointAsyncContext dealloc](&v3, "dealloc");
}

- (void)runForCheckpoint:(void *)a3
{
  -[NSException raise](+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("MSUCheckpointAsyncContext is a abstract class."), 0), "raise");
}

- (void)runSynchronousForCheckpoint:(void *)a3
{
  -[NSException raise](+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("MSUCheckpointAsyncContext is a abstract class."), 0), "raise");
}

- (BOOL)wait
{
  -[NSException raise](+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("MSUCheckpointAsyncContext is a abstract class."), 0), "raise");
  return 0;
}

- (BOOL)waitUntilDate:(id)a3
{
  -[NSException raise](+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("MSUCheckpointAsyncContext is a abstract class."), 0), "raise");
  return 0;
}

- (NSString)contextUUID
{
  return self->_contextUUID;
}

- (void)setContextUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)result
{
  return self->_result;
}

- (void)setResult:(int)a3
{
  self->_result = a3;
}

- (void)checkpoint_closure_context
{
  return self->_checkpoint_closure_context;
}

- (void)setCheckpoint_closure_context:(void *)a3
{
  self->_checkpoint_closure_context = a3;
}

@end
