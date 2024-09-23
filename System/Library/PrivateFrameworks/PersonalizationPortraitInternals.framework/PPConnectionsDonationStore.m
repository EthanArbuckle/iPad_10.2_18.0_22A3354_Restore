@implementation PPConnectionsDonationStore

- (id)recentLocationDonationsSinceDate:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v4 = a3;
  +[PPConnectionsDuetSource sharedInstance](PPConnectionsDuetSource, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70AE8]), "initWithLocationField:bundleIdentifier:", 1, 0);
  v7 = (void *)objc_opt_new();
  LOWORD(v10) = 1;
  objc_msgSend(v5, "locationItemsWithCriteria:earliest:latest:limit:duetLimit:consumer:richLocationItems:resolveEKLocations:explanationSet:", v6, v4, v7, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, 0, v10, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)defaultStore
{
  if (defaultStore__pasOnceToken2 != -1)
    dispatch_once(&defaultStore__pasOnceToken2, &__block_literal_global_2546);
  return (id)defaultStore__pasExprOnceResult;
}

void __42__PPConnectionsDonationStore_defaultStore__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_opt_new();
  v2 = (void *)defaultStore__pasExprOnceResult;
  defaultStore__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
