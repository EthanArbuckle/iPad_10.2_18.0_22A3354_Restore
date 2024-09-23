@implementation PRUISModalEntryPointAmbientEditingSwitcher

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (id)_BSXPCSecureCodingEntryPointTypeString
{
  return CFSTR("AmbientEditingSwitcher");
}

@end
