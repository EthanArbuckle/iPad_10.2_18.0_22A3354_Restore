@implementation WFLowPowerModeTrigger(BiomeContext)

- (id)publisherWithScheduler:()BiomeContext
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Power");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "LowPowerMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "DSLPublisher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeOn:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  void *v7;
  void *v8;
  id v9;
  int v10;
  int v11;
  uint64_t v12;
  void (**v13)(id, uint64_t);

  v13 = a5;
  objc_msgSend(a3, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v10 = objc_msgSend(v9, "starting");
  if (v10 == objc_msgSend(a1, "onEnable"))
  {
    v12 = 1;
  }
  else
  {
    v11 = objc_msgSend(v9, "starting");
    v12 = v11 ^ objc_msgSend(a1, "onDisable");
  }
  v13[2](v13, v12);

}

@end
