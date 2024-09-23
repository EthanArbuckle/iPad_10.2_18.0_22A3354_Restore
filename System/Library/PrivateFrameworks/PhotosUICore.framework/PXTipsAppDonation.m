@implementation PXTipsAppDonation

+ (void)donateSignalForEvent:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "_eventIdentifierForEvent:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01FF0]), "initWithContentIdentifier:context:osBuild:userInfo:", v8, CFSTR("com.apple.mobileslideshow"), 0, 0);
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Discoverability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Signals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sendEvent:", v3);
}

+ (id)_eventIdentifierForEvent:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("com.apple.mobileslideshow.trashed-photo");
  else
    return off_1E5148120[a3 - 1];
}

@end
