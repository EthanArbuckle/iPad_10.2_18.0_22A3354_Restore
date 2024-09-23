@implementation SKBaseManager

+ (id)sharedManager
{
  Class v2;

  v2 = NSClassFromString(CFSTR("SKDaemonManager"));
  if (!v2)
    v2 = (Class)SKManager;
  -[objc_class sharedManager](v2, "sharedManager");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SKBaseManager)init
{
  SKBaseManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKBaseManager;
  v2 = -[SKBaseManager init](&v5, sel_init);
  v3 = (void *)objc_opt_new();
  +[SKAnalyticsHub addSink:](_TtC10StorageKit14SKAnalyticsHub, "addSink:", v3);

  return v2;
}

- (id)allDisks
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("com.apple.storagekit.notimplemented"), CFSTR("A required method is not implemented"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise");

  return 0;
}

+ (id)defaultVisibleRoles
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("com.apple.storagekit.notimplemented"), CFSTR("A required method is not implemented"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise");

  return 0;
}

- (id)knownDiskForDictionary:(id)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("com.apple.storagekit.notimplemented"), CFSTR("A required method is not implemented"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise");

  return 0;
}

- (id)wholeDiskForDisk:(id)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("com.apple.storagekit.notimplemented"), CFSTR("A required method is not implemented"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise");

  return 0;
}

- (id)formatableFileSystems
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("com.apple.storagekit.notimplemented"), CFSTR("A required method is not implemented"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise");

  return 0;
}

- (void)logEvent:(id)a3 eventPayloadBuilder:(id)a4
{
  +[SKAnalyticsHub sendEventWithName:eventPayloadBuilder:](_TtC10StorageKit14SKAnalyticsHub, "sendEventWithName:eventPayloadBuilder:", a3, a4);
}

- (BOOL)supportsCocoa
{
  return self->_supportsCocoa;
}

@end
