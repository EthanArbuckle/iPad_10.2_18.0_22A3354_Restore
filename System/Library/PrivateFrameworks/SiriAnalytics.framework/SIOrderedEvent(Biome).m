@implementation SIOrderedEvent(Biome)

- (uint64_t)dataVersion
{
  return 2;
}

+ (id)eventWithData:()Biome dataVersion:
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0D9A3A0];
  v6 = a3;
  if (a4 == 1)
  {
    objc_msgSend(v5, "deserializeFromData:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_msgSend(objc_alloc((Class)v5), "initWithData:", v6);
  }
  v8 = (void *)v7;

  return v8;
}

@end
