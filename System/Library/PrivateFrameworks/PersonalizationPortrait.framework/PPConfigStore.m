@implementation PPConfigStore

+ (id)defaultStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PPConfigStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore__pasOnceToken2 != -1)
    dispatch_once(&defaultStore__pasOnceToken2, block);
  return (id)defaultStore__pasExprOnceResult_8294;
}

void __29__PPConfigStore_defaultStore__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)defaultStore__pasExprOnceResult_8294;
  defaultStore__pasExprOnceResult_8294 = v1;

  objc_autoreleasePoolPop(v0);
}

- (unint64_t)assetVersionWithError:(id *)a3
{
  void *v4;
  unint64_t v5;

  +[PPConfigClient sharedInstance](PPConfigClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assetVersionWithError:", a3);

  return v5;
}

- (id)variantNameWithError:(id *)a3
{
  void *v4;
  void *v5;

  +[PPConfigClient sharedInstance](PPConfigClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "variantNameWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)readableTrialTreatmentsMappingWithError:(id *)a3
{
  void *v4;
  void *v5;

  +[PPConfigClient sharedInstance](PPConfigClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readableTrialTreatmentsMappingWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
