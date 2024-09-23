@implementation TRITaskQueueOperation

- (TRITask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (void)setInProgress:(BOOL)a3
{
  self->_inProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
}

@end
