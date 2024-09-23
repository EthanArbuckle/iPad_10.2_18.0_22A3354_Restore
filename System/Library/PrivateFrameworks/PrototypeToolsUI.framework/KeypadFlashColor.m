@implementation KeypadFlashColor

void ___KeypadFlashColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.75, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_KeypadFlashColor___color;
  _KeypadFlashColor___color = v0;

}

@end
