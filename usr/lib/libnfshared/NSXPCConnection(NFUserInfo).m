@implementation NSXPCConnection(NFUserInfo)

- (uint64_t)NF_presentmentIntentSuppressionHolder
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("PresentmentIntentSuppressionHolder"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)NF_setPresentmentIntentSuppressionHolder
{
  id v1;

  objc_msgSend(a1, "userInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("PresentmentIntentSuppressionHolder"));

}

- (void)NF_clearPresentmentIntentSuppressionHolder
{
  id v1;

  objc_msgSend(a1, "userInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", CFSTR("PresentmentIntentSuppressionHolder"));

}

- (uint64_t)NF_fdPresentmentIntentSuppressionHolder
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("FDPresentmentIntentSuppressionHolder"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)NF_setFDPresentmentIntentSuppressionHolder
{
  id v1;

  objc_msgSend(a1, "userInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("FDPresentmentIntentSuppressionHolder"));

}

- (void)NF_clearFDPresentmentIntentSuppressionHolder
{
  id v1;

  objc_msgSend(a1, "userInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", CFSTR("FDPresentmentIntentSuppressionHolder"));

}

@end
