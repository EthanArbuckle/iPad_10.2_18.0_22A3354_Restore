@implementation WFWorkflowDescriptor(WorkflowReferenceConvertible)

+ (void)getObjectsFromReferences:()WorkflowReferenceConvertible databaseProvider:completion:
{
  void (**v6)(id, id, _QWORD);
  id v7;

  v6 = a5;
  objc_msgSend(a3, "if_map:", &__block_literal_global_654);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, 0);

}

@end
