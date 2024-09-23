@implementation ISOperation(SUScriptPost)

- (uint64_t)sendCompletionCallback:()SUScriptPost
{
  return WebThreadRun();
}

@end
