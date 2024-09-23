@implementation TUIInputAccessoryViewInvisibleTraits

- (id)inputAccessoryViewBackdropEffects
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)inputAccessoryViewBackdropColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

@end
