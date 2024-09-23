@implementation WFLinkCopyEntityAction

- (id)verb
{
  return CFSTR("copy");
}

- (id)entityParameterName
{
  return CFSTR("entity");
}

@end
