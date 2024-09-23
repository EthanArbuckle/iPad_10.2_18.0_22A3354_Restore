@implementation SUIBOrchestrationTaskMutation

- (NSUUID)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(id)a3
{
  objc_storeStrong((id *)&self->_taskId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskId, 0);
}

@end
