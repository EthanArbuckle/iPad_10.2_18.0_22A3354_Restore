@implementation VKCImageTextSelectionViewAccessibilityElement

- (id)accessibilityIdentifier
{
  return CFSTR("com.apple.visionkit.textElement");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E0CEB170];
}

@end
