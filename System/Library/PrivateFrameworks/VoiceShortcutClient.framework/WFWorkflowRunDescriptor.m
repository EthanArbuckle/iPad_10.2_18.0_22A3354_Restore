@implementation WFWorkflowRunDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)kind
{
  return (NSString *)CFSTR("Unknown");
}

@end
