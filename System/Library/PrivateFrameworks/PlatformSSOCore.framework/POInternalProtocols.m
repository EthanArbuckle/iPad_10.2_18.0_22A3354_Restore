@implementation POInternalProtocols

+ (id)interfaceWithInternalProtocol:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (interfaceWithInternalProtocol__onceToken != -1)
    dispatch_once(&interfaceWithInternalProtocol__onceToken, &__block_literal_global);
  objc_msgSend((id)interfaceWithInternalProtocol__protocolCache, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)interfaceWithInternalProtocol__protocolCache, "setObject:forKey:", v4, v3);
  }
  v5 = v4;

  return v5;
}

void __53__POInternalProtocols_interfaceWithInternalProtocol___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)interfaceWithInternalProtocol__protocolCache;
  interfaceWithInternalProtocol__protocolCache = v0;

}

@end
