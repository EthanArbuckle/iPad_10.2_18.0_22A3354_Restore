@implementation TUSearchModuleManager

+ (NSArray)recentsModuleClasses
{
  if (recentsModuleClasses_onceToken != -1)
    dispatch_once(&recentsModuleClasses_onceToken, &__block_literal_global_49);
  return (NSArray *)(id)recentsModuleClasses_sRecentClasses;
}

void __45__TUSearchModuleManager_recentsModuleClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)recentsModuleClasses_sRecentClasses;
  recentsModuleClasses_sRecentClasses = v0;

}

+ (NSArray)searchModuleClasses
{
  if (searchModuleClasses_onceToken != -1)
    dispatch_once(&searchModuleClasses_onceToken, &__block_literal_global_2_1);
  return (NSArray *)(id)searchModuleClasses_sSearchClasses;
}

void __44__TUSearchModuleManager_searchModuleClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)searchModuleClasses_sSearchClasses;
  searchModuleClasses_sSearchClasses = v0;

}

@end
