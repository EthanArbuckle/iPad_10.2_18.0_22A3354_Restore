@implementation KeypadBackgroundColor

void ___KeypadBackgroundColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.95, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_KeypadBackgroundColor___color;
  _KeypadBackgroundColor___color = v0;

}

@end
