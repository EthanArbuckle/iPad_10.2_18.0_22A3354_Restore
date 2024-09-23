@implementation PROPlugInManager

+ (id)sharedPlugInManager
{
  id result;

  result = (id)sharedPlugInManager_sharedInstance;
  if (!sharedPlugInManager_sharedInstance)
  {
    result = objc_alloc_init((Class)a1);
    sharedPlugInManager_sharedInstance = (uint64_t)result;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_class *v4;

  v4 = (objc_class *)a1;
  if ((id)objc_opt_class() == a1)
    v4 = (objc_class *)objc_opt_class();
  return NSAllocateObject(v4, 0, a3);
}

- (id)delegate
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (void)setDelegate:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
}

- (BOOL)requiresProtocolsToBePresentWhenLoading
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (void)setRequiresProtocolsToBePresentWhenLoading:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
}

- (void)addPlugInSearchDirectory:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
}

- (void)setPlugInSearchDirectories:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
}

- (id)plugInSearchDirectories
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (void)scanForPlugInsInDirectory:(id)a3 deferralNotification:(id)a4
{
  void *v4;
  uint64_t v5;
  NSString *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(a2);
  objc_msgSend(v4, "raise:format:", v5, CFSTR("*** Bad news! %@ send to abstract class %@!"), v6, objc_opt_class());
}

- (void)scanForPlugInsInDirectory:(id)a3 actuallyLoad:(BOOL)a4 deferralNotification:(id)a5
{
  void *v5;
  uint64_t v6;
  NSString *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  v7 = NSStringFromSelector(a2);
  objc_msgSend(v5, "raise:format:", v6, CFSTR("*** Bad news! %@ send to abstract class %@!"), v7, objc_opt_class());
}

- (void)scanForPlugInsInBundle:(id)a3 deferralNotification:(id)a4
{
  void *v4;
  uint64_t v5;
  NSString *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(a2);
  objc_msgSend(v4, "raise:format:", v5, CFSTR("*** Bad news! %@ send to abstract class %@!"), v6, objc_opt_class());
}

- (void)scanForPlugInsInBundle:(id)a3 withPluginKitPlugIn:(id)a4 deferralNotification:(id)a5
{
  void *v5;
  uint64_t v6;
  NSString *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  v7 = NSStringFromSelector(a2);
  objc_msgSend(v5, "raise:format:", v6, CFSTR("*** Bad news! %@ send to abstract class %@!"), v7, objc_opt_class());
}

- (void)removeAllPlugIns
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
}

- (void)addDeferredPluginBundle:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
}

- (void)loadDeferredPlugins
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
}

- (void)loadDeferredPlugin:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
}

- (id)deferredPluginKitPlugs
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (void)removeDeferredPluginBundle:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
}

- (void)removePlugin:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
}

- (BOOL)bundleIsDeferred:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
  return 0;
}

- (void)addLibraryBlockedPlugin:(id)a3 bundleName:(id)a4 pluginName:(id)a5 version:(id)a6
{
  void *v6;
  uint64_t v7;
  NSString *v8;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99778];
  v8 = NSStringFromSelector(a2);
  objc_msgSend(v6, "raise:format:", v7, CFSTR("*** Bad news! %@ send to abstract class %@!"), v8, objc_opt_class());
}

- (void)addDocumentBlockedPlugin:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
}

- (id)loadBlockPluginList:(__CFString *)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
  return 0;
}

- (BOOL)checkPluginVersionAgainstBlockList:(id)a3 blockDict:(id)a4
{
  void *v4;
  uint64_t v5;
  NSString *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(a2);
  objc_msgSend(v4, "raise:format:", v5, CFSTR("*** Bad news! %@ send to abstract class %@!"), v6, objc_opt_class());
  return 0;
}

- (BOOL)checkIfShouldBlockPlugin:(id)a3 returnPluginDictionary:(id *)a4
{
  void *v4;
  uint64_t v5;
  NSString *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(a2);
  objc_msgSend(v4, "raise:format:", v5, CFSTR("*** Bad news! %@ send to abstract class %@!"), v6, objc_opt_class());
  return 0;
}

- (void)getNameOverrides:(id)a3 pluginName:(id *)a4 bundleName:(id *)a5
{
  void *v5;
  uint64_t v6;
  NSString *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  v7 = NSStringFromSelector(a2);
  objc_msgSend(v5, "raise:format:", v6, CFSTR("*** Bad news! %@ send to abstract class %@!"), v7, objc_opt_class());
}

- (void)removeAllBlockedDocumentPlugins
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
}

- (id)plugInGroups
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)plugInGroupsMutable
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)plugIns
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)blockedLibraryPlugins
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)blockedDocumentPlugins
{
  void *v2;
  uint64_t v3;
  NSString *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  v4 = NSStringFromSelector(a2);
  objc_msgSend(v2, "raise:format:", v3, CFSTR("*** Bad news! %@ send to abstract class %@!"), v4, objc_opt_class());
  return 0;
}

- (id)plugInsForProtocol:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
  return 0;
}

- (id)plugInsForProtocols:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
  return 0;
}

- (id)plugInWithUUID:(__CFUUID *)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
  return 0;
}

- (id)plugInWithClassName:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
  return 0;
}

- (id)plugInGroupWithUUID:(__CFUUID *)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
  return 0;
}

- (void)registerAPIObject:(id)a3 forProtocol:(id)a4 version:(unsigned int)a5
{
  void *v5;
  uint64_t v6;
  NSString *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  v7 = NSStringFromSelector(a2);
  objc_msgSend(v5, "raise:format:", v6, CFSTR("*** Bad news! %@ send to abstract class %@!"), v7, objc_opt_class());
}

- (void)unregisterAPIForProtocol:(id)a3 version:(unsigned int)a4
{
  void *v4;
  uint64_t v5;
  NSString *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(a2);
  objc_msgSend(v4, "raise:format:", v5, CFSTR("*** Bad news! %@ send to abstract class %@!"), v6, objc_opt_class());
}

- (void)unregisterAPIForProtocol:(id)a3
{
  void *v3;
  uint64_t v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = NSStringFromSelector(a2);
  objc_msgSend(v3, "raise:format:", v4, CFSTR("*** Bad news! %@ send to abstract class %@!"), v5, objc_opt_class());
}

@end
