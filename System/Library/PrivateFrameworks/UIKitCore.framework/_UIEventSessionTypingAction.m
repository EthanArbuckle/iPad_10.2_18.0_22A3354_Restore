@implementation _UIEventSessionTypingAction

- (id)typeEncoding
{
  return CFSTR("Type");
}

- (int64_t)actionType
{
  return 25;
}

@end
