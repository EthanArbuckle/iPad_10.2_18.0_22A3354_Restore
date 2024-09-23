@implementation NSString(UserNotificationsUIKit)

- (BOOL)unui_containsExcessiveLineHeightCharacters
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0DC1350], "unui_excessiveLineHeightChars");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v2) != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

@end
