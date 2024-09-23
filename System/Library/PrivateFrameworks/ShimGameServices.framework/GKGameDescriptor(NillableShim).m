@implementation GKGameDescriptor(NillableShim)

+ (id)gameDescriptorWithAdamID:()NillableShim bundleID:platform:shortBundleVersion:
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;

  if (!(a3 | a4))
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("adamID and bundleID can't both be nil"));
    v12 = objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (adamID || bundleID)\n[%s (%s:%d)]"), v11, "+[GKGameDescriptor(NillableShim) gameDescriptorWithAdamID:bundleID:platform:shortBundleVersion:]", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter_GameServicesShims/Frameworks/GameServices/ShimGameServices/Modules/GameCenterFoundation_Shims/GCF+NillableShims.m"), "lastPathComponent"), "UTF8String"), 18);
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
  }
  v13 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v13, "setNumberStyle:", 0);
  v14 = objc_alloc_init(MEMORY[0x24BE3A1B0]);
  if (a3)
    objc_msgSend(v14, "setAdamID:", objc_msgSend(v13, "numberFromString:", a3));
  objc_msgSend(v14, "setBundleIdentifier:", a4);
  if (a5)
    objc_msgSend(v14, "setPlatform:", objc_msgSend((id)objc_opt_class(), "gamePlatformFromServerGameDescriptorString:", a5));
  objc_msgSend(v14, "setShortBundleVersion:", a6);
  return v14;
}

@end
