@implementation WQADefaultTintColor

void __WQADefaultTintColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WQADefaultTintColor_DefaultTintColor;
  WQADefaultTintColor_DefaultTintColor = v0;

}

@end
