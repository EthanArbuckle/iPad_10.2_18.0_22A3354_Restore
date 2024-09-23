@implementation SmartRoutingStats

- (BOOL)autoConnectForXR
{
  return self->_autoConnectForXR;
}

- (void)setAutoConnectForXR:(BOOL)a3
{
  self->_autoConnectForXR = a3;
}

- (NSString)bannerAction
{
  return self->_bannerAction;
}

- (void)setBannerAction:(id)a3
{
  objc_storeStrong((id *)&self->_bannerAction, a3);
}

- (NSString)bannerTrigger
{
  return self->_bannerTrigger;
}

- (void)setBannerTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_bannerTrigger, a3);
}

- (BOOL)callConnected
{
  return self->_callConnected;
}

- (void)setCallConnected:(BOOL)a3
{
  self->_callConnected = a3;
}

- (OS_dispatch_source)falseRouteCheckForceDisconnectTimer
{
  return self->_falseRouteCheckForceDisconnectTimer;
}

- (void)setFalseRouteCheckForceDisconnectTimer:(id)a3
{
  objc_storeStrong((id *)&self->_falseRouteCheckForceDisconnectTimer, a3);
}

- (OS_dispatch_source)falseRouteCheckHijackTimer
{
  return self->_falseRouteCheckHijackTimer;
}

- (void)setFalseRouteCheckHijackTimer:(id)a3
{
  objc_storeStrong((id *)&self->_falseRouteCheckHijackTimer, a3);
}

- (OS_dispatch_source)falseRouteCheckHijackAwayTimer
{
  return self->_falseRouteCheckHijackAwayTimer;
}

- (void)setFalseRouteCheckHijackAwayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_falseRouteCheckHijackAwayTimer, a3);
}

- (OS_dispatch_source)falseRouteCheckOnDemandTimer
{
  return self->_falseRouteCheckOnDemandTimer;
}

- (void)setFalseRouteCheckOnDemandTimer:(id)a3
{
  objc_storeStrong((id *)&self->_falseRouteCheckOnDemandTimer, a3);
}

- (OS_dispatch_source)falseRouteCheckOwnLostTimer
{
  return self->_falseRouteCheckOwnLostTimer;
}

- (void)setFalseRouteCheckOwnLostTimer:(id)a3
{
  objc_storeStrong((id *)&self->_falseRouteCheckOwnLostTimer, a3);
}

- (OS_dispatch_source)falseRouteCheckProactiveRoutingTimer
{
  return self->_falseRouteCheckProactiveRoutingTimer;
}

- (void)setFalseRouteCheckProactiveRoutingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_falseRouteCheckProactiveRoutingTimer, a3);
}

- (NSString)falseRouteCheckReason
{
  return self->_falseRouteCheckReason;
}

- (void)setFalseRouteCheckReason:(id)a3
{
  objc_storeStrong((id *)&self->_falseRouteCheckReason, a3);
}

- (unint64_t)firstPipeMessageRTT
{
  return self->_firstPipeMessageRTT;
}

- (void)setFirstPipeMessageRTT:(unint64_t)a3
{
  self->_firstPipeMessageRTT = a3;
}

- (NSString)hijackAnswer
{
  return self->_hijackAnswer;
}

- (void)setHijackAnswer:(id)a3
{
  objc_storeStrong((id *)&self->_hijackAnswer, a3);
}

- (unint64_t)hijackContinuousTimeoutCount
{
  return self->_hijackContinuousTimeoutCount;
}

- (void)setHijackContinuousTimeoutCount:(unint64_t)a3
{
  self->_hijackContinuousTimeoutCount = a3;
}

- (unint64_t)hijackAmbientTick
{
  return self->_hijackAmbientTick;
}

- (void)setHijackAmbientTick:(unint64_t)a3
{
  self->_hijackAmbientTick = a3;
}

- (unint64_t)hijackCallTick
{
  return self->_hijackCallTick;
}

- (void)setHijackCallTick:(unint64_t)a3
{
  self->_hijackCallTick = a3;
}

- (unint64_t)hijackInputTick
{
  return self->_hijackInputTick;
}

- (void)setHijackInputTick:(unint64_t)a3
{
  self->_hijackInputTick = a3;
}

- (unint64_t)hijackMediaTick
{
  return self->_hijackMediaTick;
}

- (void)setHijackMediaTick:(unint64_t)a3
{
  self->_hijackMediaTick = a3;
}

- (NSString)hijackPlayingApp
{
  return self->_hijackPlayingApp;
}

- (void)setHijackPlayingApp:(id)a3
{
  objc_storeStrong((id *)&self->_hijackPlayingApp, a3);
}

- (NSString)hijackPlayingCategory
{
  return self->_hijackPlayingCategory;
}

- (void)setHijackPlayingCategory:(id)a3
{
  objc_storeStrong((id *)&self->_hijackPlayingCategory, a3);
}

- (BOOL)hijackRelaySent
{
  return self->_hijackRelaySent;
}

- (void)setHijackRelaySent:(BOOL)a3
{
  self->_hijackRelaySent = a3;
}

- (unint64_t)hijackRoundTripTime
{
  return self->_hijackRoundTripTime;
}

- (void)setHijackRoundTripTime:(unint64_t)a3
{
  self->_hijackRoundTripTime = a3;
}

- (int)hijackScore
{
  return self->_hijackScore;
}

- (void)setHijackScore:(int)a3
{
  self->_hijackScore = a3;
}

- (int)hijackAwayLocalScore
{
  return self->_hijackAwayLocalScore;
}

- (void)setHijackAwayLocalScore:(int)a3
{
  self->_hijackAwayLocalScore = a3;
}

- (int)hijackAwayRemoteScore
{
  return self->_hijackAwayRemoteScore;
}

- (void)setHijackAwayRemoteScore:(int)a3
{
  self->_hijackAwayRemoteScore = a3;
}

- (int)hijackActiveRemoteScore
{
  return self->_hijackActiveRemoteScore;
}

- (void)setHijackActiveRemoteScore:(int)a3
{
  self->_hijackActiveRemoteScore = a3;
}

- (NSString)hijackVersion
{
  return self->_hijackVersion;
}

- (void)setHijackVersion:(id)a3
{
  objc_storeStrong((id *)&self->_hijackVersion, a3);
}

- (NSNumber)localAudioScore
{
  return self->_localAudioScore;
}

- (void)setLocalAudioScore:(id)a3
{
  objc_storeStrong((id *)&self->_localAudioScore, a3);
}

- (NSString)manualConnect
{
  return self->_manualConnect;
}

- (void)setManualConnect:(id)a3
{
  objc_storeStrong((id *)&self->_manualConnect, a3);
}

- (OS_dispatch_source)manualRouteChangeDetectionTimer
{
  return self->_manualRouteChangeDetectionTimer;
}

- (void)setManualRouteChangeDetectionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_manualRouteChangeDetectionTimer, a3);
}

- (NSString)manualRouteDestination
{
  return self->_manualRouteDestination;
}

- (void)setManualRouteDestination:(id)a3
{
  objc_storeStrong((id *)&self->_manualRouteDestination, a3);
}

- (NSString)manualRouteInputOutput
{
  return self->_manualRouteInputOutput;
}

- (void)setManualRouteInputOutput:(id)a3
{
  objc_storeStrong((id *)&self->_manualRouteInputOutput, a3);
}

- (OS_dispatch_source)manualRouteSpeakerTimer
{
  return self->_manualRouteSpeakerTimer;
}

- (void)setManualRouteSpeakerTimer:(id)a3
{
  objc_storeStrong((id *)&self->_manualRouteSpeakerTimer, a3);
}

- (NSString)manualRouteUISource
{
  return self->_manualRouteUISource;
}

- (void)setManualRouteUISource:(id)a3
{
  objc_storeStrong((id *)&self->_manualRouteUISource, a3);
}

- (BOOL)mediaPlaying
{
  return self->_mediaPlaying;
}

- (void)setMediaPlaying:(BOOL)a3
{
  self->_mediaPlaying = a3;
}

- (BOOL)nearbyBannerActionConnect
{
  return self->_nearbyBannerActionConnect;
}

- (void)setNearbyBannerActionConnect:(BOOL)a3
{
  self->_nearbyBannerActionConnect = a3;
}

- (NSString)onDemandCategory
{
  return self->_onDemandCategory;
}

- (void)setOnDemandCategory:(id)a3
{
  objc_storeStrong((id *)&self->_onDemandCategory, a3);
}

- (BOOL)setupSupportsTipiv2
{
  return self->_setupSupportsTipiv2;
}

- (void)setSetupSupportsTipiv2:(BOOL)a3
{
  self->_setupSupportsTipiv2 = a3;
}

- (NSString)proactiveRoutingTrigger
{
  return self->_proactiveRoutingTrigger;
}

- (void)setProactiveRoutingTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveRoutingTrigger, a3);
}

- (int)proactiveRoutingWxRSSI
{
  return self->_proactiveRoutingWxRSSI;
}

- (void)setProactiveRoutingWxRSSI:(int)a3
{
  self->_proactiveRoutingWxRSSI = a3;
}

- (unint64_t)pipeStartTime
{
  return self->_pipeStartTime;
}

- (void)setPipeStartTime:(unint64_t)a3
{
  self->_pipeStartTime = a3;
}

- (NSString)reverseRouteReason
{
  return self->_reverseRouteReason;
}

- (void)setReverseRouteReason:(id)a3
{
  objc_storeStrong((id *)&self->_reverseRouteReason, a3);
}

- (OS_dispatch_source)routeCheckHijackTimer
{
  return self->_routeCheckHijackTimer;
}

- (void)setRouteCheckHijackTimer:(id)a3
{
  objc_storeStrong((id *)&self->_routeCheckHijackTimer, a3);
}

- (OS_dispatch_source)routeCheckInUseBannerTimer
{
  return self->_routeCheckInUseBannerTimer;
}

- (void)setRouteCheckInUseBannerTimer:(id)a3
{
  objc_storeStrong((id *)&self->_routeCheckInUseBannerTimer, a3);
}

- (OS_dispatch_source)routeCheckOnDemandTimer
{
  return self->_routeCheckOnDemandTimer;
}

- (void)setRouteCheckOnDemandTimer:(id)a3
{
  objc_storeStrong((id *)&self->_routeCheckOnDemandTimer, a3);
}

- (OS_dispatch_source)routeCheckOwnLostTimer
{
  return self->_routeCheckOwnLostTimer;
}

- (void)setRouteCheckOwnLostTimer:(id)a3
{
  objc_storeStrong((id *)&self->_routeCheckOwnLostTimer, a3);
}

- (NSNumber)snapshotLocalDeviceAudioScore
{
  return self->_snapshotLocalDeviceAudioScore;
}

- (void)setSnapshotLocalDeviceAudioScore:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotLocalDeviceAudioScore, a3);
}

- (NSNumber)snapshotRemoteDeviceAudioScore
{
  return self->_snapshotRemoteDeviceAudioScore;
}

- (void)setSnapshotRemoteDeviceAudioScore:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotRemoteDeviceAudioScore, a3);
}

- (NSString)snapshotLocalPlayingApp
{
  return self->_snapshotLocalPlayingApp;
}

- (void)setSnapshotLocalPlayingApp:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotLocalPlayingApp, a3);
}

- (NSString)snapshotLocalRoute
{
  return self->_snapshotLocalRoute;
}

- (void)setSnapshotLocalRoute:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotLocalRoute, a3);
}

- (NSNumber)snapshotLocalNumOfApps
{
  return self->_snapshotLocalNumOfApps;
}

- (void)setSnapshotLocalNumOfApps:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotLocalNumOfApps, a3);
}

- (NSString)wxStreamState
{
  return self->_wxStreamState;
}

- (void)setWxStreamState:(id)a3
{
  objc_storeStrong((id *)&self->_wxStreamState, a3);
}

- (unsigned)wxTipiScore1
{
  return self->_wxTipiScore1;
}

- (void)setWxTipiScore1:(unsigned __int8)a3
{
  self->_wxTipiScore1 = a3;
}

- (unsigned)wxTipiScore2
{
  return self->_wxTipiScore2;
}

- (void)setWxTipiScore2:(unsigned __int8)a3
{
  self->_wxTipiScore2 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wxStreamState, 0);
  objc_storeStrong((id *)&self->_snapshotLocalNumOfApps, 0);
  objc_storeStrong((id *)&self->_snapshotLocalRoute, 0);
  objc_storeStrong((id *)&self->_snapshotLocalPlayingApp, 0);
  objc_storeStrong((id *)&self->_snapshotRemoteDeviceAudioScore, 0);
  objc_storeStrong((id *)&self->_snapshotLocalDeviceAudioScore, 0);
  objc_storeStrong((id *)&self->_routeCheckOwnLostTimer, 0);
  objc_storeStrong((id *)&self->_routeCheckOnDemandTimer, 0);
  objc_storeStrong((id *)&self->_routeCheckInUseBannerTimer, 0);
  objc_storeStrong((id *)&self->_routeCheckHijackTimer, 0);
  objc_storeStrong((id *)&self->_reverseRouteReason, 0);
  objc_storeStrong((id *)&self->_proactiveRoutingTrigger, 0);
  objc_storeStrong((id *)&self->_onDemandCategory, 0);
  objc_storeStrong((id *)&self->_manualRouteUISource, 0);
  objc_storeStrong((id *)&self->_manualRouteSpeakerTimer, 0);
  objc_storeStrong((id *)&self->_manualRouteInputOutput, 0);
  objc_storeStrong((id *)&self->_manualRouteDestination, 0);
  objc_storeStrong((id *)&self->_manualRouteChangeDetectionTimer, 0);
  objc_storeStrong((id *)&self->_manualConnect, 0);
  objc_storeStrong((id *)&self->_localAudioScore, 0);
  objc_storeStrong((id *)&self->_hijackVersion, 0);
  objc_storeStrong((id *)&self->_hijackPlayingCategory, 0);
  objc_storeStrong((id *)&self->_hijackPlayingApp, 0);
  objc_storeStrong((id *)&self->_hijackAnswer, 0);
  objc_storeStrong((id *)&self->_falseRouteCheckReason, 0);
  objc_storeStrong((id *)&self->_falseRouteCheckProactiveRoutingTimer, 0);
  objc_storeStrong((id *)&self->_falseRouteCheckOwnLostTimer, 0);
  objc_storeStrong((id *)&self->_falseRouteCheckOnDemandTimer, 0);
  objc_storeStrong((id *)&self->_falseRouteCheckHijackAwayTimer, 0);
  objc_storeStrong((id *)&self->_falseRouteCheckHijackTimer, 0);
  objc_storeStrong((id *)&self->_falseRouteCheckForceDisconnectTimer, 0);
  objc_storeStrong((id *)&self->_bannerTrigger, 0);
  objc_storeStrong((id *)&self->_bannerAction, 0);
}

@end
