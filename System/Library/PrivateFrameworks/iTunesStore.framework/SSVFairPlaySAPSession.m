@implementation SSVFairPlaySAPSession

void __67__SSVFairPlaySAPSession_ISFairPlaySAPSession__sharedDefaultSession__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x24BEB2028]);
  ISFairPlaySAPSessionURLBag();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithURLBag:SAPVersion:", v3, 0);
  v2 = (void *)sharedDefaultSession_sSession;
  sharedDefaultSession_sSession = v1;

}

void __65__SSVFairPlaySAPSession_ISFairPlaySAPSession__sharedPrimeSession__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x24BEB2028]);
  ISFairPlaySAPSessionURLBag();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithURLBag:SAPVersion:", v3, 1);
  v2 = (void *)sharedPrimeSession_sSession;
  sharedPrimeSession_sSession = v1;

}

@end
