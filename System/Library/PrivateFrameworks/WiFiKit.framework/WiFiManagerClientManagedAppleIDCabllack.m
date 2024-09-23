@implementation WiFiManagerClientManagedAppleIDCabllack

uint64_t ___WiFiManagerClientManagedAppleIDCabllack_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_managedAppleIDStateDidChange:", *(_BYTE *)(a1 + 40) != 0);
}

@end
