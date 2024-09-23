@implementation WFURLContentItem(WorkflowKit)

+ (id)allURLCoercionsInWorkflowKit
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
