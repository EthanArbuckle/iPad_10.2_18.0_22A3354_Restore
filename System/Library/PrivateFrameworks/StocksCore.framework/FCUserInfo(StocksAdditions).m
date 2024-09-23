@implementation FCUserInfo(StocksAdditions)

- (uint64_t)stocks_generateFeldsparIDIfNeeded
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "feldsparID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setFeldsparID:", v4);

  }
  return objc_msgSend(a1, "feldsparID");
}

- (uint64_t)stocks_resetFeldsparID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setFeldsparID:", v3);

  return objc_msgSend(a1, "feldsparID");
}

- (uint64_t)stocks_resetAdsUserID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAdsUserID:", v3);

  return objc_msgSend(a1, "adsUserID");
}

@end
