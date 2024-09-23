@implementation WFRemoteExecutionRunRequestWorkflow

- (NSString)workflowID
{
  return self->_workflowID;
}

- (void)setWorkflowID:(id)a3
{
  objc_storeStrong((id *)&self->_workflowID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowID, 0);
}

@end
