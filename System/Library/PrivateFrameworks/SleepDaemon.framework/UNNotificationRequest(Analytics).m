@implementation UNNotificationRequest(Analytics)

- (uint64_t)hksp_shouldSubmitAnalytics
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEA9338]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categoryIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEA97F0]) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(a1, "content");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "categoryIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEA93C8]);

    }
  }

  return v4;
}

- (uint64_t)hksp_analyticsSleepNotificationType
{
  void *v1;
  void *v2;
  unsigned int v3;

  objc_msgSend(a1, "content");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "categoryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BEA93C8]);

  return v3;
}

@end
