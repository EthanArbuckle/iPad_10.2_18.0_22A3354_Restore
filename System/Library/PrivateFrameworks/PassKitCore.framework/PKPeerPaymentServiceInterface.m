@implementation PKPeerPaymentServiceInterface

void __PKPeerPaymentServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE277590);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF22100;
  qword_1ECF22100 = v0;

}

@end
