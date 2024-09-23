@implementation SyndicationStateIncompatible

void ___SyndicationStateIncompatible_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _ImageWithSymbolName((uint64_t)CFSTR("1.circle"), v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_SyndicationStateIncompatible__image;
  _SyndicationStateIncompatible__image = v0;

}

@end
