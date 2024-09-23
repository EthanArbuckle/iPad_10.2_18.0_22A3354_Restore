@implementation ICQNetworkReachability

+ (BOOL)isNetworkReachable
{
  id v3;
  void *v4;
  char v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CFA9B8]);
  if (objc_msgSend(v3, "airplaneMode") && !objc_msgSend(a1, "isWifiEnabled"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isNetworkReachable");

  }
  return v5;
}

+ (BOOL)isWifiEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWiFiEnabled");

  return v3;
}

@end
