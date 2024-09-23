@implementation EligibleImage

void ___EligibleImage_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _ImageWithSymbolName((uint64_t)CFSTR("6.circle"), v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_EligibleImage__image;
  _EligibleImage__image = v0;

}

@end
