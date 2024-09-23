@implementation KeypadForegroundColor

void ___KeypadForegroundColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.5, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_KeypadForegroundColor___color;
  _KeypadForegroundColor___color = v0;

}

@end
