@implementation ContactResolver

void ___ContactResolver_block_invoke()
{
  void *v0;
  PKContactResolver *v1;
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C97298]);
  +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys](PKPeerPaymentCounterpartHandleFormatter, "requiredContactKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = -[PKContactResolver initWithContactStore:keysToFetch:]([PKContactResolver alloc], "initWithContactStore:keysToFetch:", v3, v0);
  v2 = (void *)qword_1EE1DB5B8;
  qword_1EE1DB5B8 = (uint64_t)v1;

}

@end
