@implementation UIMutableApplicationSceneSettings(PGTransientLocal)

- (uint64_t)pg_hasVisiblePIPContent
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "transientLocalSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 4821);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setPg_hasVisiblePIPContent:()PGTransientLocal
{
  void *v4;
  id v5;

  objc_msgSend(a1, "transientLocalSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 4821);

}

@end
