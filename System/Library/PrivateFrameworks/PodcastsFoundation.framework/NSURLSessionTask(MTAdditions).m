@implementation NSURLSessionTask(MTAdditions)

- (uint64_t)useBackgroundFetch
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("com.apple.podcasts.mtnsurlsessiontask.useBackgroundFetch"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setUseBackgroundFetch:()MTAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("com.apple.podcasts.mtnsurlsessiontask.useBackgroundFetch"), v2, (void *)0x301);

}

- (void)setInteractive:()MTAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("com.apple.podcasts.mtnsurlsessiontask.interactive"), v2, (void *)0x301);

}

- (uint64_t)isInteractive
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("com.apple.podcasts.mtnsurlsessiontask.interactive"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setUserCanceledAuth:()MTAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("com.apple.podcasts.mtnsurlsessiontask.userCanceledAuth"), v2, (void *)0x301);

}

- (uint64_t)userCanceledAuth
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("com.apple.podcasts.mtnsurlsessiontask.userCanceledAuth"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
