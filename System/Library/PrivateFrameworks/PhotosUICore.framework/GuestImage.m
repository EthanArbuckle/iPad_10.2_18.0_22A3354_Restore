@implementation GuestImage

void ___GuestImage_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _ImageWithSymbolName((uint64_t)CFSTR("7.circle"), v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_GuestImage__image;
  _GuestImage__image = v0;

}

@end
