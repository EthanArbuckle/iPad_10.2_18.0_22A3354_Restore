@implementation NSLayoutConstraint(Workflow)

- (void)wf_withPriority:()Workflow
{
  objc_msgSend(a1, "setPriority:");
  return a1;
}

@end
