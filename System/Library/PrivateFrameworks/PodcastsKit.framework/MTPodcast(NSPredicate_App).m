@implementation MTPodcast(NSPredicate_App)

+ (id)predicateForSyncablePodcastsForSyncType:()NSPredicate_App
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE73820], "predicateForSubscriptionSyncType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForSubscriptionSyncType:()NSPredicate_App
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x24BDD1758];
  v5 = *MEMORY[0x24BE73AC0];
  NSPersistentStringForMTDisplayType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSPersistentStringForMTDisplayType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("(%K == %@) || (%K == %@) || (%K == NULL)"), v5, v6, v5, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 1)
  {
    v9 = (void *)MEMORY[0x24BDD1758];
    NSPersistentStringForMTDisplayType();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K == %@"), v5, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v8;
  }

  return v11;
}

@end
