@implementation _UIButtonFeedbackGeneratorConfiguration

- (int64_t)requiredSupportLevel
{
  return 2;
}

+ (id)defaultConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("default"), &__block_literal_global_183);
}

+ (id)prominentConfiguration
{
  return (id)objc_msgSend(a1, "_configurationWithKey:preparationBlock:", CFSTR("prominent"), &__block_literal_global_29);
}

@end
