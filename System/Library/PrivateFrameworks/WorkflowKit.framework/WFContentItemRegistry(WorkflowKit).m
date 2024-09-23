@implementation WFContentItemRegistry(WorkflowKit)

+ (id)allContentItemClassesInWorkflowKit
{
  _QWORD v1[7];

  v1[6] = *MEMORY[0x1E0C80C00];
  v1[0] = objc_opt_class();
  v1[1] = objc_opt_class();
  v1[2] = objc_opt_class();
  v1[3] = objc_opt_class();
  v1[4] = objc_opt_class();
  v1[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
