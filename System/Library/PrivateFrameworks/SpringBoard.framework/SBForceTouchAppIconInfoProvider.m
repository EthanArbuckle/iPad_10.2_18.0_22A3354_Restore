@implementation SBForceTouchAppIconInfoProvider

- (NSString)location
{
  return (NSString *)(id)*MEMORY[0x1E0DAA9E8];
}

- (BOOL)isHighlighted
{
  return 0;
}

- (SBIconContinuityItem)continuityItem
{
  return 0;
}

- (NSCopying)overrideBadgeNumberOrString
{
  return 0;
}

@end
