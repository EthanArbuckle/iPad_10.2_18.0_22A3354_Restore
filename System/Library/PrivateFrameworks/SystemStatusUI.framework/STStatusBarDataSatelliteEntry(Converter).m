@implementation STStatusBarDataSatelliteEntry(Converter)

- (uint64_t)initFromData:()Converter type:
{
  int v5;
  void *v6;
  uint64_t v7;

  v5 = *(unsigned __int8 *)(a3 + a4);
  v6 = (void *)objc_opt_class();
  if (v5)
    objc_msgSend(v6, "entryWithConnectionStatus:", 1);
  else
    objc_msgSend(v6, "disabledEntry");
  v7 = objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
