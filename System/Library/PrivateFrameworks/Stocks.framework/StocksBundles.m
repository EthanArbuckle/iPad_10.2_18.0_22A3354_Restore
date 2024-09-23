@implementation StocksBundles

+ (id)getBundle:(int)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)getBundle__bundles[a3];
  if (!v3)
  {
    v4 = a3;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", identifiers[a3]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)getBundle__bundles[v4];
    getBundle__bundles[v4] = v5;

    v3 = (void *)getBundle__bundles[v4];
  }
  return v3;
}

@end
