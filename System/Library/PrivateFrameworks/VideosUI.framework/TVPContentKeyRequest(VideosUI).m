@implementation TVPContentKeyRequest(VideosUI)

- (uint64_t)offlineKeyRenewalPolicy
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("OfflineKeyRenewalPolicyKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setOfflineKeyRenewalPolicy:()VideosUI
{
  void *v4;
  id v5;

  objc_msgSend(a1, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("OfflineKeyRenewalPolicyKey"));

}

@end
