@implementation PPSPlatformPolicyManager

+ (BOOL)platformSupportsDataMigrator
{
  return 1;
}

+ (BOOL)snapshottingSupportedForRole:(id)a3
{
  return objc_msgSend(a3, "isEqual:", *MEMORY[0x24BE74D68]);
}

+ (BOOL)proactiveGallerySupportedForRole:(id)a3
{
  return objc_msgSend(a3, "isEqual:", *MEMORY[0x24BE74D68]);
}

@end
