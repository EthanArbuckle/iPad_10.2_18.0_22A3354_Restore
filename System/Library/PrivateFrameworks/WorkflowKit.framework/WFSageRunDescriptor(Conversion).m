@implementation WFSageRunDescriptor(Conversion)

- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:
{
  void (**v6)(id, id, _QWORD);
  WFWorkflow *v7;
  void *v8;
  WFWorkflow *v9;

  v6 = a5;
  v7 = [WFWorkflow alloc];
  v8 = (void *)objc_opt_new();
  v9 = -[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:](v7, "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v8, 0, 0, 0, a3, 0);

  v6[2](v6, v9, 0);
}

@end
