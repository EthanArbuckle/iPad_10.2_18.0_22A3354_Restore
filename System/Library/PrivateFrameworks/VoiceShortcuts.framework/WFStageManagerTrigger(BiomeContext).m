@implementation WFStageManagerTrigger(BiomeContext)

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
  objc_msgSend(v4, "SpringBoard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "WindowManagement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "StageManagerMode");
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
  int v8;
  int v9;
  uint64_t v10;
  void (**v11)(id, uint64_t);

  v11 = a5;
  objc_msgSend(a3, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "starting");
  if (v8 == objc_msgSend(a1, "onEnable"))
  {
    v10 = 1;
  }
  else
  {
    v9 = objc_msgSend(v7, "starting");
    v10 = v9 ^ objc_msgSend(a1, "onDisable");
  }
  v11[2](v11, v10);

}

@end
