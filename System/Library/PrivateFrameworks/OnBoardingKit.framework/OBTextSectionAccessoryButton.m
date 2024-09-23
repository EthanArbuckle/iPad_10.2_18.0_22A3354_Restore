@implementation OBTextSectionAccessoryButton

- (OBTextSectionAccessoryButton)init
{
  OBTextSectionAccessoryButton *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBTextSectionAccessoryButton;
  objc_msgSend(-[OBTextSectionAccessoryButton class](&v5, sel_class), "accessoryButton");
  v3 = (OBTextSectionAccessoryButton *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)accessoryButton
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x1E0DC4A88];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___OBTextSectionAccessoryButton;
  objc_msgSendSuper2(&v4, sel_accessoryButtonWithTextStyle_, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
