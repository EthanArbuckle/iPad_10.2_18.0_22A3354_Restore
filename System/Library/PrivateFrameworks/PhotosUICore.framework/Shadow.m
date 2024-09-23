@implementation Shadow

uint64_t ___Shadow_block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0DC1298]);
  v1 = (void *)_Shadow__shadow;
  _Shadow__shadow = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.25);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_Shadow__shadow, "setShadowColor:", v2);

  objc_msgSend((id)_Shadow__shadow, "setShadowOffset:", 0.0, 8.0);
  return objc_msgSend((id)_Shadow__shadow, "setShadowBlurRadius:", 20.0);
}

@end
