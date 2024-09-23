@implementation WFToolInvocationOptions

- (int64_t)lnInteractionMode
{
  return ToolInvocationOptionsBox.lnInteractionMode.getter();
}

- (WFToolInvocationOptions)init
{
  ToolInvocationOptionsBox.init()();
}

@end
