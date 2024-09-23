@implementation RMManagedDevice

+ (RMManagedDevice)currentManagedDevice
{
  if (currentManagedDevice_onceToken != -1)
    dispatch_once(&currentManagedDevice_onceToken, &__block_literal_global_4_1);
  return (RMManagedDevice *)(id)currentManagedDevice_currentManagedDevice;
}

void __39__RMManagedDevice_currentManagedDevice__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)currentManagedDevice_currentManagedDevice;
  currentManagedDevice_currentManagedDevice = v0;

}

- (BOOL)isSupervised
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshDetailsFromDisk");
  v3 = objc_msgSend(v2, "isSupervised");

  return v3;
}

- (BOOL)isMDMEnrolled
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshDetailsFromDisk");
  objc_msgSend(v2, "memberQueueManagingProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (NSString)mdmProfileIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshDetailsFromDisk");
  objc_msgSend(v2, "memberQueueManagingProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isSharediPad
{
  return objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad");
}

- (void)refreshState
{
  id v2;

  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshDetailsFromDisk");

}

- (void)setProperty:(id)a3 forKey:(id)a4 scope:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "setPropertyForKey:value:channelType:", v7, v10, a5 != 1);

}

- (id)getPropertyForKey:(id)a3 scope:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BE60D70];
  v6 = a3;
  objc_msgSend(v5, "sharedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getPropertyForKey:channelType:", v6, a4 != 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
