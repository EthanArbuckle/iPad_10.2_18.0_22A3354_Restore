@implementation WFWorkflowRunDescriptor(Conversion)

- (uint64_t)workflowReferenceWithDatabase:()Conversion error:
{
  return 0;
}

- (uint64_t)createWorkflowWithEnvironment:()Conversion database:completionHandler:
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a5 + 16))(a5, 0, 0);
}

- (uint64_t)donateRunInteractionWithDatabase:()Conversion workflowReference:completionHandler:
{
  return (*(uint64_t (**)(uint64_t))(a5 + 16))(a5);
}

@end
