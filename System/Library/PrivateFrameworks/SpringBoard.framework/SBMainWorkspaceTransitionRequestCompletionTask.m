@implementation SBMainWorkspaceTransitionRequestCompletionTask

- (id)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_task, 0);
}

@end
