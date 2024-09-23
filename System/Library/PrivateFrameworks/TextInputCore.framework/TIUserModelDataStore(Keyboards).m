@implementation TIUserModelDataStore(Keyboards)

+ (id)sharedUserModelDataStore
{
  if (__testingInstance_3443)
    return (id)__testingInstance_3443;
  objc_msgSend(MEMORY[0x1E0DBDDC0], "singletonInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)setSharedTIUserModelDataStore:()Keyboards
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)__testingInstance_3443 != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&__testingInstance_3443, a3);
    v4 = v5;
  }

}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken != -1)
    dispatch_once(&singletonInstance_onceToken, &__block_literal_global_3440);
  return (id)singletonInstance_singletonInstance;
}

@end
