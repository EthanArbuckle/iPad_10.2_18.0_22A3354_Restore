@implementation _UIEventSessionKeyCommandAction

- (id)typeEncoding
{
  return CFSTR("Command");
}

- (int64_t)actionType
{
  return 27;
}

@end
