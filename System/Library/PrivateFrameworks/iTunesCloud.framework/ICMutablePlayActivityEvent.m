@implementation ICMutablePlayActivityEvent

- (Class)_mutableCopyClass
{
  objc_opt_class();
  return (Class)objc_claimAutoreleasedReturnValue();
}

- (void)setAutoPlayMode:(unint64_t)a3
{
  self->super._autoPlayMode = a3;
}

- (void)setBuildFeatures:(id)a3
{
  NSArray *v4;
  NSArray *buildFeatures;

  if (self->super._buildFeatures != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    buildFeatures = self->super._buildFeatures;
    self->super._buildFeatures = v4;

  }
}

- (void)setBuildVersion:(id)a3
{
  NSString *v4;
  NSString *buildVersion;

  if (self->super._buildVersion != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    buildVersion = self->super._buildVersion;
    self->super._buildVersion = v4;

  }
}

- (void)setContainerID:(id)a3
{
  NSString *v4;
  NSString *containerID;

  if (self->super._containerID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    containerID = self->super._containerID;
    self->super._containerID = v4;

  }
}

- (void)setContainerIDs:(id)a3
{
  ICPlayActivityEventContainerIDs *v4;
  ICPlayActivityEventContainerIDs *containerIDs;

  if (self->super._containerIDs != a3)
  {
    v4 = (ICPlayActivityEventContainerIDs *)objc_msgSend(a3, "copy");
    containerIDs = self->super._containerIDs;
    self->super._containerIDs = v4;

  }
}

- (void)setContainerType:(unint64_t)a3
{
  self->super._containerType = a3;
}

- (void)setContinuityCameraUsed:(BOOL)a3
{
  self->super._continuityCameraUsed = a3;
}

- (void)setDeviceName:(id)a3
{
  NSString *v4;
  NSString *deviceName;

  if (self->super._deviceName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    deviceName = self->super._deviceName;
    self->super._deviceName = v4;

  }
}

- (void)setDisplayType:(unint64_t)a3
{
  self->super._displayType = a3;
}

- (void)setEndReasonType:(unint64_t)a3
{
  self->super._endReasonType = a3;
}

- (void)setEnqueuerProperties:(id)a3
{
  ICPlayActivityEnqueuerProperties *v4;
  ICPlayActivityEnqueuerProperties *enqueuerProperties;

  if (self->super._enqueuerProperties != a3)
  {
    v4 = (ICPlayActivityEnqueuerProperties *)objc_msgSend(a3, "copy");
    enqueuerProperties = self->super._enqueuerProperties;
    self->super._enqueuerProperties = v4;

  }
}

- (void)setEventDate:(id)a3
{
  NSDate *v4;
  NSDate *eventDate;

  if (self->super._eventDate != a3)
  {
    v4 = (NSDate *)objc_msgSend(a3, "copy");
    eventDate = self->super._eventDate;
    self->super._eventDate = v4;

  }
}

- (void)setEventTimeZone:(id)a3
{
  NSTimeZone *v4;
  NSTimeZone *eventTimeZone;

  if (self->super._eventTimeZone != a3)
  {
    v4 = (NSTimeZone *)objc_msgSend(a3, "copy");
    eventTimeZone = self->super._eventTimeZone;
    self->super._eventTimeZone = v4;

  }
}

- (void)setEventType:(unint64_t)a3
{
  self->super._eventType = a3;
}

- (void)setExternalID:(id)a3
{
  NSString *v4;
  NSString *externalID;

  if (self->super._externalID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    externalID = self->super._externalID;
    self->super._externalID = v4;

  }
}

- (void)setFeatureName:(id)a3
{
  NSString *v4;
  NSString *featureName;

  if (self->super._featureName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    featureName = self->super._featureName;
    self->super._featureName = v4;

  }
}

- (void)setHouseholdID:(id)a3
{
  NSString *v4;
  NSString *householdID;

  if (self->super._householdID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    householdID = self->super._householdID;
    self->super._householdID = v4;

  }
}

- (void)setInternalBuild:(BOOL)a3
{
  int64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->super._systemReleaseType = v3;
}

- (void)setItemIDs:(id)a3
{
  ICPlayActivityEventItemIDs *v4;
  ICPlayActivityEventItemIDs *itemIDs;

  if (self->super._itemIDs != a3)
  {
    v4 = (ICPlayActivityEventItemIDs *)objc_msgSend(a3, "copy");
    itemIDs = self->super._itemIDs;
    self->super._itemIDs = v4;

  }
}

- (void)setItemDuration:(double)a3
{
  self->super._itemDuration = a3;
}

- (void)setItemEndTime:(double)a3
{
  self->super._itemEndTime = a3;
}

- (void)setItemStartTime:(double)a3
{
  self->super._itemStartTime = a3;
}

- (void)setItemType:(unint64_t)a3
{
  self->super._itemType = a3;
}

- (void)setLyricsDisplayedCharacterCount:(unint64_t)a3
{
  self->super._lyricsDisplayedCharacterCount = a3;
}

- (void)setLyricsLanguage:(id)a3
{
  NSString *v4;
  NSString *lyricsLanguage;

  if (self->super._lyricsLanguage != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    lyricsLanguage = self->super._lyricsLanguage;
    self->super._lyricsLanguage = v4;

  }
}

- (void)setMediaType:(unint64_t)a3
{
  self->super._mediaType = a3;
}

- (void)setOffline:(BOOL)a3
{
  self->super._offline = a3;
}

- (void)setPersistentID:(int64_t)a3
{
  self->super._persistentID = a3;
}

- (void)setPersonalizedContainerID:(id)a3
{
  NSString *v4;
  NSString *personalizedContainerID;

  if (self->super._personalizedContainerID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    personalizedContainerID = self->super._personalizedContainerID;
    self->super._personalizedContainerID = v4;

  }
}

- (void)setPrivateListeningEnabled:(id)a3
{
  NSNumber *v4;
  NSNumber *privateListeningEnabled;

  if (self->super._privateListeningEnabled != a3)
  {
    v4 = (NSNumber *)objc_msgSend(a3, "copy");
    privateListeningEnabled = self->super._privateListeningEnabled;
    self->super._privateListeningEnabled = v4;

  }
}

- (void)setQueueGroupingID:(id)a3
{
  NSString *v4;
  NSString *queueGroupingID;

  if (self->super._queueGroupingID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    queueGroupingID = self->super._queueGroupingID;
    self->super._queueGroupingID = v4;

  }
}

- (void)setReasonHintType:(unint64_t)a3
{
  self->super._reasonHintType = a3;
}

- (void)setRecommendationData:(id)a3
{
  NSData *v4;
  NSData *recommendationData;

  if (self->super._recommendationData != a3)
  {
    v4 = (NSData *)objc_msgSend(a3, "copy");
    recommendationData = self->super._recommendationData;
    self->super._recommendationData = v4;

  }
}

- (void)setRepeatPlayMode:(unint64_t)a3
{
  self->super._repeatPlayMode = a3;
}

- (void)setRequestingBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *requestingBundleIdentifier;

  if (self->super._requestingBundleIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    requestingBundleIdentifier = self->super._requestingBundleIdentifier;
    self->super._requestingBundleIdentifier = v4;

  }
}

- (void)setRequestingBundleVersion:(id)a3
{
  NSString *v4;
  NSString *requestingBundleVersion;

  if (self->super._requestingBundleVersion != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    requestingBundleVersion = self->super._requestingBundleVersion;
    self->super._requestingBundleVersion = v4;

  }
}

- (void)setSBEnabled:(BOOL)a3
{
  self->super._SBEnabled = a3;
}

- (void)setShufflePlayMode:(unint64_t)a3
{
  self->super._shufflePlayMode = a3;
}

- (void)setSiriInitiated:(id)a3
{
  NSNumber *v4;
  NSNumber *siriInitiated;

  if (self->super._siriInitiated != a3)
  {
    v4 = (NSNumber *)objc_msgSend(a3, "copy");
    siriInitiated = self->super._siriInitiated;
    self->super._siriInitiated = v4;

  }
}

- (void)setSourceType:(unint64_t)a3
{
  self->super._sourceType = a3;
}

- (void)setStoreAccountID:(unint64_t)a3
{
  self->super._storeAccountID = a3;
}

- (void)setStoreFrontID:(id)a3
{
  NSString *v4;
  NSString *storeFrontID;

  if (self->super._storeFrontID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    storeFrontID = self->super._storeFrontID;
    self->super._storeFrontID = v4;

  }
}

- (void)setStoreID:(id)a3
{
  NSString *v4;
  NSString *storeID;

  if (self->super._storeID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    storeID = self->super._storeID;
    self->super._storeID = v4;

  }
}

- (void)setSystemReleaseType:(int64_t)a3
{
  self->super._systemReleaseType = a3;
}

- (void)setTimedMetadata:(id)a3
{
  NSData *v4;
  NSData *timedMetadata;

  if (self->super._timedMetadata != a3)
  {
    v4 = (NSData *)objc_msgSend(a3, "copy");
    timedMetadata = self->super._timedMetadata;
    self->super._timedMetadata = v4;

  }
}

- (void)setTrackInfo:(id)a3
{
  NSData *v4;
  NSData *trackInfo;

  if (self->super._trackInfo != a3)
  {
    v4 = (NSData *)objc_msgSend(a3, "copy");
    trackInfo = self->super._trackInfo;
    self->super._trackInfo = v4;

  }
}

- (void)setAudioQualityPreference:(unint64_t)a3
{
  self->super._audioQualityPreference = a3;
}

- (void)setPlaybackFormatPreference:(unint64_t)a3
{
  self->super._playbackFormatPreference = a3;
}

- (void)setTargetedAudioQuality:(id)a3
{
  ICPlayActivityAudioQualityProperties *v4;
  ICPlayActivityAudioQualityProperties *targetedAudioQuality;

  if (self->super._targetedAudioQuality != a3)
  {
    v4 = (ICPlayActivityAudioQualityProperties *)objc_msgSend(a3, "copy");
    targetedAudioQuality = self->super._targetedAudioQuality;
    self->super._targetedAudioQuality = v4;

  }
}

- (void)setProvidedAudioQuality:(id)a3
{
  ICPlayActivityAudioQualityProperties *v4;
  ICPlayActivityAudioQualityProperties *providedAudioQuality;

  if (self->super._providedAudioQuality != a3)
  {
    v4 = (ICPlayActivityAudioQualityProperties *)objc_msgSend(a3, "copy");
    providedAudioQuality = self->super._providedAudioQuality;
    self->super._providedAudioQuality = v4;

  }
}

- (void)setSharedActivityGroupSizeCurrent:(unint64_t)a3
{
  self->super._sharedActivityGroupSizeCurrent = a3;
}

- (void)setSharedActivityGroupSizeMax:(unint64_t)a3
{
  self->super._sharedActivityGroupSizeMax = a3;
}

- (void)setSharedActivityType:(int64_t)a3
{
  self->super._sharedActivityType = a3;
}

- (void)setCollaborativePlaylist:(BOOL)a3
{
  self->super._collaborativePlaylist = a3;
}

- (void)setVocalAttenuationAvailability:(unint64_t)a3
{
  self->super._vocalAttenuationAvailability = a3;
}

- (void)setVocalAttenuationDuration:(double)a3
{
  self->super._vocalAttenuationDuration = a3;
}

@end
