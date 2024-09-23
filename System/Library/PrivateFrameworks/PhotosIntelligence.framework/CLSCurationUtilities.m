@implementation CLSCurationUtilities

+ (id)blockedImportedByBundleIdentifiers
{
  if (blockedImportedByBundleIdentifiers_onceToken[0] != -1)
    dispatch_once(blockedImportedByBundleIdentifiers_onceToken, &__block_literal_global_1704);
  return (id)blockedImportedByBundleIdentifiers_blocklist;
}

+ (BOOL)isBlocklistedImportedByBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "blockedImportedByBundleIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isRiskyFileFormatWithAsset:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isAnimatedGIF") & 1) != 0
    || (objc_msgSend(v3, "isPDF") & 1) != 0
    || (objc_msgSend(v3, "isPNG") & 1) != 0
    || (objc_msgSend(v3, "isPSD") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isHEICSequence");
  }

  return v4;
}

void __58__CLSCurationUtilities_blockedImportedByBundleIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("com.baidu.baidumobile"), CFSTR("com.google.chrome.ios"), CFSTR("com.douban.frodo"), CFSTR("com.facebook.facebook"), CFSTR("com.facebook.messenger"), CFSTR("org.mozilla.ios.firefox"), CFSTR("com.google.gmail"), CFSTR("com.burbn.instagram"), CFSTR("com.iwilab.kakaotalk"), CFSTR("jp.naver.line"), CFSTR("com.apple.mobilemail"), CFSTR("com.microsoft.office.outlook"), CFSTR("com.tencent.mqq"), CFSTR("com.reddit.reddit"), CFSTR("com.apple.mobilesafari"), CFSTR("com.toyopagroup.picaboo"), CFSTR("ph.telegra.telegraph"),
         CFSTR("com.zhiliaoapp.musically"),
         CFSTR("com.atebits.tweetie2"),
         CFSTR("com.viber"),
         CFSTR("com.vk.vkclient"),
         CFSTR("com.vk.vkhd"),
         CFSTR("com.tencent.xin"),
         CFSTR("com.sina.weibo"),
         CFSTR("net.whatsapp.whatsapp"),
         0);
  v1 = (void *)blockedImportedByBundleIdentifiers_blocklist;
  blockedImportedByBundleIdentifiers_blocklist = v0;

}

@end
