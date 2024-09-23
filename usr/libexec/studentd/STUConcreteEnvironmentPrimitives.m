@implementation STUConcreteEnvironmentPrimitives

- (BOOL)isRunningOnInternalOS
{
  return os_variant_has_internal_ui("com.apple.studentd", a2);
}

@end
