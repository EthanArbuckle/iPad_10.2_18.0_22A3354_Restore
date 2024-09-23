@implementation _UICellAccessoryConfigurationCheckmark

- (int64_t)_systemType
{
  return 1;
}

- (id)_identifier
{
  return CFSTR("Checkmark");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
