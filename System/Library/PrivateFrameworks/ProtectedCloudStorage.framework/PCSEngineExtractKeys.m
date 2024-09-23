@implementation PCSEngineExtractKeys

void __PCSEngineExtractKeys_block_invoke(uint64_t a1, uint64_t a2)
{
  PCSMigrationLog(objc_msgSend(*(id *)(a1 + 32), "log"), CFSTR("Invalid escrow identity key: %@"), a2);
}

void __PCSEngineExtractKeys_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v5;

  v5 = (const void *)PCSIdentitySetCopyIdentity(objc_msgSend(*(id *)(a1 + 32), "set"), a2);
  if (v5)
  {
    CFRelease(v5);
  }
  else
  {
    PCSIdentitySetAddIdentity(objc_msgSend(*(id *)(a1 + 32), "set"), a3);
    objc_msgSend(*(id *)(a1 + 32), "setModified:", 1);
  }
}

void __PCSEngineExtractKeys_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v5;

  v5 = (const void *)PCSIdentitySetCopyIdentity(objc_msgSend(*(id *)(a1 + 32), "set"), a2);
  if (v5)
  {
    CFRelease(v5);
  }
  else
  {
    PCSIdentitySetAddIdentity(objc_msgSend(*(id *)(a1 + 32), "set"), a3);
    objc_msgSend(*(id *)(a1 + 32), "setModified:", 1);
  }
}

@end
