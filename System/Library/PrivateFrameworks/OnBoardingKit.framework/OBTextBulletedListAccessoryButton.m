@implementation OBTextBulletedListAccessoryButton

+ (id)accessoryButton
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x1E0DC4B10];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___OBTextBulletedListAccessoryButton;
  objc_msgSendSuper2(&v4, sel_accessoryButtonWithTextStyle_, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
