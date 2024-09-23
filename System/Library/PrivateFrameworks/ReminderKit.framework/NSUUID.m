@implementation NSUUID

void __33__NSUUID_NSUUIDAdditions__TTZero__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &_block_invoke_zeroBytes_0);
  v1 = (void *)TTZero_zero;
  TTZero_zero = v0;

}

void __33__NSUUID_CRDT_Additions__CR_zero__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &_block_invoke_zeroBytes);
  v1 = (void *)CR_zero_zero;
  CR_zero_zero = v0;

}

@end
