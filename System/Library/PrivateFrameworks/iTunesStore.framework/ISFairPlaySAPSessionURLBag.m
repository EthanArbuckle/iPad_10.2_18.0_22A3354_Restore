@implementation ISFairPlaySAPSessionURLBag

void __ISFairPlaySAPSessionURLBag_block_invoke()
{
  ISSSURLBag *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = -[SSURLBag initWithURLBagContext:]([ISSSURLBag alloc], "initWithURLBagContext:", v2);
  v1 = (void *)ISFairPlaySAPSessionURLBag_sBag;
  ISFairPlaySAPSessionURLBag_sBag = (uint64_t)v0;

}

@end
