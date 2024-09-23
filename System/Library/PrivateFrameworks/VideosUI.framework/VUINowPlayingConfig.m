@implementation VUINowPlayingConfig

- (void)setShowsUpNextInHUDForVOD:(BOOL)a3
{
  self->_showsUpNextInHUDForVOD = a3;
}

- (void)setShowsUpNextInHUDForLive:(BOOL)a3
{
  self->_showsUpNextInHUDForLive = a3;
}

- (void)setShowsStillWatchingAlert:(BOOL)a3
{
  self->_showsStillWatchingAlert = a3;
}

- (void)setShowsLozengeForLivePlayback:(BOOL)a3
{
  self->_showsLozengeForLivePlayback = a3;
}

- (void)setShouldSendLiveStreamStartAndEndTimesToAVKit:(BOOL)a3
{
  self->_shouldSendLiveStreamStartAndEndTimesToAVKit = a3;
}

- (void)setShouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime:(BOOL)a3
{
  self->_shouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime = a3;
}

- (void)setShouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime:(BOOL)a3
{
  self->_shouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime = a3;
}

- (void)setRefetchesUpNextDataForVOD:(BOOL)a3
{
  self->_refetchesUpNextDataForVOD = a3;
}

- (void)setRefetchesUpNextDataForLive:(BOOL)a3
{
  self->_refetchesUpNextDataForLive = a3;
}

- (void)setConvertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero:(BOOL)a3
{
  self->_convertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero = a3;
}

- (void)setAllowQOSReportingForiTunesLibraryPlayback:(BOOL)a3
{
  self->_allowQOSReportingForiTunesLibraryPlayback = a3;
}

- (void)setAlertIdleTimeout:(double)a3
{
  self->_alertIdleTimeout = a3;
}

- (VUINowPlayingConfig)init
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VUINowPlayingConfig;
  v2 = -[VUINowPlayingConfig init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2[18] = 0;
    *((_DWORD *)v2 + 2) = 16843009;
    v2[12] = 1;
    *(_OWORD *)(v2 + 24) = xmmword_1DA1C2210;
    v4 = *MEMORY[0x1E0DB1DE0];
    v12[0] = *MEMORY[0x1E0DB1DC8];
    v12[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v3 + 5);
    *((_QWORD *)v3 + 5) = v5;

    *(_WORD *)(v3 + 13) = 257;
    v7 = (void *)*((_QWORD *)v3 + 6);
    *((_QWORD *)v3 + 6) = &unk_1EA0BBA48;

    v8 = (void *)*((_QWORD *)v3 + 8);
    *((_QWORD *)v3 + 8) = &unk_1EA0BBE78;

    v9 = (void *)*((_QWORD *)v3 + 7);
    *((_QWORD *)v3 + 7) = &unk_1EA0BBA60;

    *(_WORD *)(v3 + 15) = 257;
    v3[17] = 1;
    *(_OWORD *)(v3 + 72) = xmmword_1DA1C2220;
    *(_OWORD *)(v3 + 88) = xmmword_1DA1C2230;
  }
  return (VUINowPlayingConfig *)v3;
}

- (double)stillWatchingAlertDuration
{
  void *v3;
  void *v4;
  double v5;
  double stillWatchingAlertDuration;

  +[VUIFeaturesConfiguration defaultsNumberValueForKey:](VUIFeaturesConfiguration, "defaultsNumberValueForKey:", CFSTR("stillWatchingAlertDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    stillWatchingAlertDuration = v5;
  }
  else
  {
    stillWatchingAlertDuration = self->_stillWatchingAlertDuration;
  }

  return stillWatchingAlertDuration;
}

- (BOOL)showsUpNextInHUDForVOD
{
  return self->_showsUpNextInHUDForVOD;
}

- (BOOL)refetchesUpNextDataForLive
{
  return self->_refetchesUpNextDataForLive;
}

- (BOOL)refetchesUpNextDataForVOD
{
  return self->_refetchesUpNextDataForVOD;
}

- (BOOL)showsUpNextInHUDForLive
{
  return self->_showsUpNextInHUDForLive;
}

- (BOOL)showsStillWatchingAlert
{
  return self->_showsStillWatchingAlert;
}

- (void)setStillWatchingAlertDuration:(double)a3
{
  self->_stillWatchingAlertDuration = a3;
}

- (double)alertIdleTimeout
{
  return self->_alertIdleTimeout;
}

- (NSArray)mediaTypesExcludedFromReporting
{
  return self->_mediaTypesExcludedFromReporting;
}

- (void)setMediaTypesExcludedFromReporting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)allowQOSReportingForiTunesLibraryPlayback
{
  return self->_allowQOSReportingForiTunesLibraryPlayback;
}

- (BOOL)convertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero
{
  return self->_convertMainContentRelativeStartTimeOfZeroToAbsoluteStartTimeOfZero;
}

- (NSArray)mediaCharacteristicsToLocalize
{
  return self->_mediaCharacteristicsToLocalize;
}

- (void)setMediaCharacteristicsToLocalize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)audioIDPrefixes
{
  return self->_audioIDPrefixes;
}

- (void)setAudioIDPrefixes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)mediaLocalizationKeyMapping
{
  return self->_mediaLocalizationKeyMapping;
}

- (void)setMediaLocalizationKeyMapping:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)liveSportsStartFromBeginningOffset
{
  return self->_liveSportsStartFromBeginningOffset;
}

- (void)setLiveSportsStartFromBeginningOffset:(double)a3
{
  self->_liveSportsStartFromBeginningOffset = a3;
}

- (BOOL)shouldSendLiveStreamStartAndEndTimesToAVKit
{
  return self->_shouldSendLiveStreamStartAndEndTimesToAVKit;
}

- (BOOL)shouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime
{
  return self->_shouldAdjustLiveStreamStartTimeToMatchSeekableRangeStartTime;
}

- (BOOL)shouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime
{
  return self->_shouldAdjustLiveStreamEndTimeToMatchSeekableRangeEndTime;
}

- (double)liveStreamStartTimeAdjustmentSlopFactor
{
  return self->_liveStreamStartTimeAdjustmentSlopFactor;
}

- (void)setLiveStreamStartTimeAdjustmentSlopFactor:(double)a3
{
  self->_liveStreamStartTimeAdjustmentSlopFactor = a3;
}

- (double)liveStreamStartAndEndTimeBadMetadataCutoff
{
  return self->_liveStreamStartAndEndTimeBadMetadataCutoff;
}

- (void)setLiveStreamStartAndEndTimeBadMetadataCutoff:(double)a3
{
  self->_liveStreamStartAndEndTimeBadMetadataCutoff = a3;
}

- (double)liveStreamOverrunExtension
{
  return self->_liveStreamOverrunExtension;
}

- (void)setLiveStreamOverrunExtension:(double)a3
{
  self->_liveStreamOverrunExtension = a3;
}

- (BOOL)showsLozengeForLivePlayback
{
  return self->_showsLozengeForLivePlayback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLocalizationKeyMapping, 0);
  objc_storeStrong((id *)&self->_audioIDPrefixes, 0);
  objc_storeStrong((id *)&self->_mediaCharacteristicsToLocalize, 0);
  objc_storeStrong((id *)&self->_mediaTypesExcludedFromReporting, 0);
}

@end
