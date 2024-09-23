@implementation NSXPCConnection(PGMenuItemWSupport)

- (uint64_t)PG_hasMenuItemProviderEntitlement
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.pegasus.menuitemprovider"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToNumber:", MEMORY[0x1E0C9AAB0]);

  return v2;
}

@end
