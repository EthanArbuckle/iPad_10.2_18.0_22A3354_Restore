@implementation MusicCapabilities

+ (MusicCapabilities)sharedCapabilities
{
  if (sharedCapabilities_sOnceToken != -1)
    dispatch_once(&sharedCapabilities_sOnceToken, &__block_literal_global);
  return (MusicCapabilities *)(id)sharedCapabilities_sSharedCapabilities;
}

void __39__MusicCapabilities_sharedCapabilities__block_invoke(id a1)
{
  MusicCapabilities *v1;
  void *v2;

  v1 = objc_alloc_init(MusicCapabilities);
  v2 = (void *)sharedCapabilities_sSharedCapabilities;
  sharedCapabilities_sSharedCapabilities = (uint64_t)v1;

}

- (MusicCapabilities)init
{
  MusicCapabilities *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MusicCapabilities;
  v2 = -[MusicCapabilities init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Music.MusicCapabilities.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (BOOL)hasCellularDataCapability
{
  if (hasCellularDataCapability_sOnceToken != -1)
    dispatch_once(&hasCellularDataCapability_sOnceToken, &__block_literal_global_5);
  return hasCellularDataCapability_sHasCellularDataCapability;
}

void __46__MusicCapabilities_hasCellularDataCapability__block_invoke(id a1)
{
  hasCellularDataCapability_sHasCellularDataCapability = MGGetBoolAnswer(CFSTR("cellular-data"));
}

- (BOOL)hasWAPICapability
{
  if (hasWAPICapability_sOnceToken != -1)
    dispatch_once(&hasWAPICapability_sOnceToken, &__block_literal_global_8);
  return hasWAPICapability_sHasWAPICapability;
}

void __38__MusicCapabilities_hasWAPICapability__block_invoke(id a1)
{
  hasWAPICapability_sHasWAPICapability = MGGetBoolAnswer(CFSTR("wapi"));
}

- (BOOL)isInternalInstall
{
  if (isInternalInstall_sOnceToken != -1)
    dispatch_once(&isInternalInstall_sOnceToken, &__block_literal_global_11);
  return isInternalInstall_sIsInternalInstall;
}

void __38__MusicCapabilities_isInternalInstall__block_invoke(id a1)
{
  isInternalInstall_sIsInternalInstall = MGGetBoolAnswer(CFSTR("apple-internal-install"));
}

- (BOOL)hasWatchCompanionCapability
{
  if (hasWatchCompanionCapability_sOnceToken != -1)
    dispatch_once(&hasWatchCompanionCapability_sOnceToken, &__block_literal_global_14);
  return hasWatchCompanionCapability_sHasWatchCompanionCapability;
}

void __48__MusicCapabilities_hasWatchCompanionCapability__block_invoke(id a1)
{
  hasWatchCompanionCapability_sHasWatchCompanionCapability = MGGetBoolAnswer(CFSTR("watch-companion"));
}

- (int64_t)deviceType
{
  unsigned int v2;

  v2 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0) - 1;
  if (v2 > 6)
    return 0;
  else
    return qword_168FD8[v2];
}

- (NSDictionary)diskUsage
{
  return (NSDictionary *)(id)MGCopyAnswer(CFSTR("DiskUsage"), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
