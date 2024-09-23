@implementation SASelfLoggerMWTMusicMetadata

- (SASelfLoggerMWTMusicMetadata)init
{
  return (SASelfLoggerMWTMusicMetadata *)SiriAudioSelfLogger.MWTMusicMetadata.init()();
}

- (int)musicDomain
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_musicDomain);
  swift_beginAccess();
  return *v2;
}

- (void)setMusicDomain:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_musicDomain);
  swift_beginAccess();
  *v4 = a3;
}

- (int)queueType
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_queueType);
  swift_beginAccess();
  return *v2;
}

- (void)setQueueType:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_queueType);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)queueSize
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_queueSize);
  swift_beginAccess();
  return *v2;
}

- (void)setQueueSize:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_queueSize);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isShuffled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isShuffled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsShuffled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isShuffled;
  swift_beginAccess();
  *v4 = a3;
}

- (int)prefetchedMetadataSource
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_prefetchedMetadataSource);
  swift_beginAccess();
  return *v2;
}

- (void)setPrefetchedMetadataSource:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_prefetchedMetadataSource);
  swift_beginAccess();
  *v4 = a3;
}

- (int)assetEndPoint
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_assetEndPoint);
  swift_beginAccess();
  return *v2;
}

- (void)setAssetEndPoint:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_assetEndPoint);
  swift_beginAccess();
  *v4 = a3;
}

- (int)streamingContentType
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_streamingContentType);
  swift_beginAccess();
  return *v2;
}

- (void)setStreamingContentType:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_streamingContentType);
  swift_beginAccess();
  *v4 = a3;
}

- (int)formatCodec
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatCodec);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatCodec:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatCodec);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)formatBitrate
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatBitrate);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatBitrate:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatBitrate);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)formatBitDepth
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatBitDepth);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatBitDepth:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatBitDepth);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)formatChannels
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatChannels);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatChannels:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatChannels);
  swift_beginAccess();
  *v4 = a3;
}

- (int)formatLayout
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatLayout);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatLayout:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatLayout);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)formatSampleRate
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatSampleRate);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatSampleRate:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatSampleRate);
  swift_beginAccess();
  *v4 = a3;
}

- (int)formatTier
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatTier);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatTier:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatTier);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)numberOfSpeakers
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_numberOfSpeakers);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfSpeakers:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_numberOfSpeakers);
  swift_beginAccess();
  *v4 = a3;
}

- (int)routeConfiguration
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_routeConfiguration);
  swift_beginAccess();
  return *v2;
}

- (void)setRouteConfiguration:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_routeConfiguration);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isAccountDataReady
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isAccountDataReady;
  swift_beginAccess();
  return *v2;
}

- (void)setIsAccountDataReady:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isAccountDataReady;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isStoreBagReady
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isStoreBagReady;
  swift_beginAccess();
  return *v2;
}

- (void)setIsStoreBagReady:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isStoreBagReady;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isLeaseReady
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isLeaseReady;
  swift_beginAccess();
  return *v2;
}

- (void)setIsLeaseReady:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isLeaseReady;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isOnlineKeyReady
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isOnlineKeyReady;
  swift_beginAccess();
  return *v2;
}

- (void)setIsOnlineKeyReady:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isOnlineKeyReady;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isOfflineKeyReady
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isOfflineKeyReady;
  swift_beginAccess();
  return *v2;
}

- (void)setIsOfflineKeyReady:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isOfflineKeyReady;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isHlsKeysReady
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isHlsKeysReady;
  swift_beginAccess();
  return *v2;
}

- (void)setIsHlsKeysReady:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isHlsKeysReady;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isInterruptingPlayback
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isInterruptingPlayback;
  swift_beginAccess();
  return *v2;
}

- (void)setIsInterruptingPlayback:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isInterruptingPlayback;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isRemoteSetQueue
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isRemoteSetQueue;
  swift_beginAccess();
  return *v2;
}

- (void)setIsRemoteSetQueue:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isRemoteSetQueue;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isDelegatedPlayback
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isDelegatedPlayback;
  swift_beginAccess();
  return *v2;
}

- (void)setIsDelegatedPlayback:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isDelegatedPlayback;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isNonDefaultUser
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isNonDefaultUser;
  swift_beginAccess();
  return *v2;
}

- (void)setIsNonDefaultUser:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isNonDefaultUser;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isAutoPlay
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isAutoPlay;
  swift_beginAccess();
  return *v2;
}

- (void)setIsAutoPlay:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isAutoPlay;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isFirstPlayAfterAppLaunch
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isFirstPlayAfterAppLaunch;
  swift_beginAccess();
  return *v2;
}

- (void)setIsFirstPlayAfterAppLaunch:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isFirstPlayAfterAppLaunch;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isMiniSinfAvailable
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isMiniSinfAvailable;
  swift_beginAccess();
  return *v2;
}

- (void)setIsMiniSinfAvailable:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isMiniSinfAvailable;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isSharePlayPlayback
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isSharePlayPlayback;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSharePlayPlayback:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isSharePlayPlayback;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isSuzeLease
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isSuzeLease;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSuzeLease:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isSuzeLease;
  swift_beginAccess();
  *v4 = a3;
}

- (int)networkConnectionType
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_networkConnectionType);
  swift_beginAccess();
  return *v2;
}

- (void)setNetworkConnectionType:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_networkConnectionType);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)wasMediaLibraryDatabaseUpgraded
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_wasMediaLibraryDatabaseUpgraded;
  swift_beginAccess();
  return *v2;
}

- (void)setWasMediaLibraryDatabaseUpgraded:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_wasMediaLibraryDatabaseUpgraded;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isPrimaryUser
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isPrimaryUser;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPrimaryUser:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_isPrimaryUser;
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)errorResolutionType
{
  return (NSString *)sub_229798FD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SASelfLoggerMWTMusicMetadata_errorResolutionType);
}

- (void)setErrorResolutionType:(id)a3
{
  sub_2297990B0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___SASelfLoggerMWTMusicMetadata_errorResolutionType);
}

- (int)endPointType
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_endPointType);
  swift_beginAccess();
  return *v2;
}

- (void)setEndPointType:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_endPointType);
  swift_beginAccess();
  *v4 = a3;
}

- (int)routeType
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_routeType);
  swift_beginAccess();
  return *v2;
}

- (void)setRouteType:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_routeType);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)formatLayoutValue
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatLayoutValue);
  swift_beginAccess();
  return *v2;
}

- (void)setFormatLayoutValue:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_formatLayoutValue);
  swift_beginAccess();
  *v4 = a3;
}

- (int)assetSource
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_assetSource);
  swift_beginAccess();
  return *v2;
}

- (void)setAssetSource:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_assetSource);
  swift_beginAccess();
  *v4 = a3;
}

- (int)assetLocation
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_assetLocation);
  swift_beginAccess();
  return *v2;
}

- (void)setAssetLocation:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_assetLocation);
  swift_beginAccess();
  *v4 = a3;
}

- (int)subscriptionType
{
  int *v2;

  v2 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_subscriptionType);
  swift_beginAccess();
  return *v2;
}

- (void)setSubscriptionType:(int)a3
{
  int *v4;

  v4 = (int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_subscriptionType);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)hasLookupWaitTime
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasLookupWaitTime;
  swift_beginAccess();
  return *v2;
}

- (void)setHasLookupWaitTime:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasLookupWaitTime;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)hasBagWaitTime
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasBagWaitTime;
  swift_beginAccess();
  return *v2;
}

- (void)setHasBagWaitTime:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasBagWaitTime;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)hasLeaseWaitTime
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasLeaseWaitTime;
  swift_beginAccess();
  return *v2;
}

- (void)setHasLeaseWaitTime:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasLeaseWaitTime;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)hasSuzeLeaseWaitTime
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasSuzeLeaseWaitTime;
  swift_beginAccess();
  return *v2;
}

- (void)setHasSuzeLeaseWaitTime:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasSuzeLeaseWaitTime;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)hasSubscriptionAssetLoadWaitTime
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasSubscriptionAssetLoadWaitTime;
  swift_beginAccess();
  return *v2;
}

- (void)setHasSubscriptionAssetLoadWaitTime:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasSubscriptionAssetLoadWaitTime;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)hasMediaRedownloadWaitTime
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasMediaRedownloadWaitTime;
  swift_beginAccess();
  return *v2;
}

- (void)setHasMediaRedownloadWaitTime:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_hasMediaRedownloadWaitTime;
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)cmInitialStartupItemCreationToReadyToPlayDurationInMs
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_cmInitialStartupItemCreationToReadyToPlayDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setCmInitialStartupItemCreationToReadyToPlayDurationInMs:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_cmInitialStartupItemCreationToReadyToPlayDurationInMs);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)cmInitialStartupItemCreationToLtluDurationInMs
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_cmInitialStartupItemCreationToLtluDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setCmInitialStartupItemCreationToLtluDurationInMs:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_cmInitialStartupItemCreationToLtluDurationInMs);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)primaryPlaylistConnectionTlsHandshakeDurationInMs
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_primaryPlaylistConnectionTlsHandshakeDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setPrimaryPlaylistConnectionTlsHandshakeDurationInMs:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_primaryPlaylistConnectionTlsHandshakeDurationInMs);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)primaryPlaylistRequestDurationInMs
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_primaryPlaylistRequestDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setPrimaryPlaylistRequestDurationInMs:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_primaryPlaylistRequestDurationInMs);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)subPlaylistConnectionTlsHandshakeDurationInMs
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_subPlaylistConnectionTlsHandshakeDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setSubPlaylistConnectionTlsHandshakeDurationInMs:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self
                      + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_subPlaylistConnectionTlsHandshakeDurationInMs);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)subPlaylistRequestDurationInMs
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_subPlaylistRequestDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setSubPlaylistRequestDurationInMs:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_subPlaylistRequestDurationInMs);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)contentConnectionTlsHandshakeDurationInMs
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_contentConnectionTlsHandshakeDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setContentConnectionTlsHandshakeDurationInMs:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_contentConnectionTlsHandshakeDurationInMs);
  swift_beginAccess();
  *v4 = a3;
}

- (unsigned)contentFirstSegmentDurationInMs
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_contentFirstSegmentDurationInMs);
  swift_beginAccess();
  return *v2;
}

- (void)setContentFirstSegmentDurationInMs:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SASelfLoggerMWTMusicMetadata_contentFirstSegmentDurationInMs);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)audioQueueType
{
  return (NSString *)sub_229798FD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SASelfLoggerMWTMusicMetadata_audioQueueType);
}

- (void)setAudioQueueType:(id)a3
{
  sub_2297990B0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___SASelfLoggerMWTMusicMetadata_audioQueueType);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
