@implementation VisionCoreE5RTExecutionPrewarmedState

- (VisionCoreE5RTExecutionPrewarmedState)initWithExecutionStreamOperation:(e5rt_execution_stream_operation *)a3
{
  VisionCoreE5RTExecutionPrewarmedState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VisionCoreE5RTExecutionPrewarmedState;
  result = -[VisionCoreE5RTExecutionPrewarmedState init](&v5, sel_init);
  if (result)
    result->_executionStreamOperationHandle = a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_executionStreamOperationHandle)
    e5rt_execution_stream_operation_release();
  v3.receiver = self;
  v3.super_class = (Class)VisionCoreE5RTExecutionPrewarmedState;
  -[VisionCoreE5RTExecutionPrewarmedState dealloc](&v3, sel_dealloc);
}

- (e5rt_execution_stream_operation)acquireExecutionStreamOperationHandle
{
  e5rt_execution_stream_operation *executionStreamOperationHandle;

  executionStreamOperationHandle = self->_executionStreamOperationHandle;
  self->_executionStreamOperationHandle = 0;
  return executionStreamOperationHandle;
}

@end
