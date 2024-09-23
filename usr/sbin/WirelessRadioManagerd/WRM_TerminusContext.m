@implementation WRM_TerminusContext

- (WRM_TerminusContext)init
{
  WRM_TerminusContext *v2;
  WRM_TerminusContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WRM_TerminusContext;
  v2 = -[WRM_Mobility_Context init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[WRM_TerminusContext setMAppLinkPreference:](v2, "setMAppLinkPreference:", 0);
    -[WRM_TerminusContext setMCurrentActiveLink:](v3, "setMCurrentActiveLink:", 2);
    -[WRM_TerminusContext setMTerminusIsRegistered:](v3, "setMTerminusIsRegistered:", 0);
    -[WRM_TerminusContext setMBtLinkIsRecommended:](v3, "setMBtLinkIsRecommended:", 1);
    -[WRM_TerminusContext setMCompanionWifiLinkIsRecommended:](v3, "setMCompanionWifiLinkIsRecommended:", 1);
    -[WRM_TerminusContext setMDirectWifiLinkIsRecommended:](v3, "setMDirectWifiLinkIsRecommended:", 1);
    -[WRM_TerminusContext setMDirectWifiLinkRecommendationUpdateNeeded:](v3, "setMDirectWifiLinkRecommendationUpdateNeeded:", 0);
    -[WRM_TerminusContext setMBtLinkRecommendationUpdateNeeded:](v3, "setMBtLinkRecommendationUpdateNeeded:", 0);
    -[WRM_TerminusContext setMDirectWifiLinkRecommendationUpdateNeeded:](v3, "setMDirectWifiLinkRecommendationUpdateNeeded:", 0);
    -[WRM_TerminusContext setMForceUpdateNeeded:](v3, "setMForceUpdateNeeded:", 0);
    -[WRM_TerminusContext setMClientSubscriptionValid:](v3, "setMClientSubscriptionValid:", 0);
    -[WRM_TerminusContext setMIsRetry:](v3, "setMIsRetry:", 0);
    -[WRM_TerminusContext setIsGizmoNearbyOverBt:](v3, "setIsGizmoNearbyOverBt:", 1);
    -[WRM_TerminusContext setBtMovingAvgRSSI:](v3, "setBtMovingAvgRSSI:", 0);
    -[WRM_TerminusContext setWifiRSSI:](v3, "setWifiRSSI:", 0);
    -[WRM_TerminusContext setWifiSNR:](v3, "setWifiSNR:", 0);
    -[WRM_TerminusContext setBeaconPER:](v3, "setBeaconPER:", 0);
    -[WRM_TerminusContext setNwType:](v3, "setNwType:", 0);
    -[WRM_TerminusContext setWifiCCA:](v3, "setWifiCCA:", 0);
    -[WRM_TerminusContext setLsmRecommendationBe:](v3, "setLsmRecommendationBe:", 0);
    -[WRM_TerminusContext setExpectedThroughputVIBE:](v3, "setExpectedThroughputVIBE:", 0);
    -[WRM_TerminusContext setPacketLifetimeVIBE:](v3, "setPacketLifetimeVIBE:", 0);
    -[WRM_TerminusContext setBtRetransmissionRateTx:](v3, "setBtRetransmissionRateTx:", 0);
    -[WRM_TerminusContext setBtRetransmissionRateRx:](v3, "setBtRetransmissionRateRx:", 0);
    -[WRM_TerminusContext setBtTech:](v3, "setBtTech:", 0);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[WRM_TerminusContext setMAppLinkPreference:](self, "setMAppLinkPreference:", 0);
  -[WRM_TerminusContext setMCurrentActiveLink:](self, "setMCurrentActiveLink:", 2);
  -[WRM_TerminusContext setMTerminusIsRegistered:](self, "setMTerminusIsRegistered:", 0);
  -[WRM_TerminusContext setMBtLinkIsRecommended:](self, "setMBtLinkIsRecommended:", 1);
  -[WRM_TerminusContext setMCompanionWifiLinkIsRecommended:](self, "setMCompanionWifiLinkIsRecommended:", 1);
  -[WRM_TerminusContext setMDirectWifiLinkIsRecommended:](self, "setMDirectWifiLinkIsRecommended:", 1);
  -[WRM_TerminusContext setMDirectWifiLinkRecommendationUpdateNeeded:](self, "setMDirectWifiLinkRecommendationUpdateNeeded:", 0);
  -[WRM_TerminusContext setMBtLinkRecommendationUpdateNeeded:](self, "setMBtLinkRecommendationUpdateNeeded:", 0);
  -[WRM_TerminusContext setMDirectWifiLinkRecommendationUpdateNeeded:](self, "setMDirectWifiLinkRecommendationUpdateNeeded:", 0);
  -[WRM_TerminusContext setMForceUpdateNeeded:](self, "setMForceUpdateNeeded:", 0);
  -[WRM_TerminusContext setMClientSubscriptionValid:](self, "setMClientSubscriptionValid:", 0);
  -[WRM_TerminusContext setMIsRetry:](self, "setMIsRetry:", 0);
  -[WRM_TerminusContext setIsGizmoNearbyOverBt:](self, "setIsGizmoNearbyOverBt:", 1);
  -[WRM_TerminusContext setBtMovingAvgRSSI:](self, "setBtMovingAvgRSSI:", 0);
  -[WRM_TerminusContext setWifiRSSI:](self, "setWifiRSSI:", 0);
  -[WRM_TerminusContext setWifiSNR:](self, "setWifiSNR:", 0);
  -[WRM_TerminusContext setBeaconPER:](self, "setBeaconPER:", 0);
  -[WRM_TerminusContext setNwType:](self, "setNwType:", 0);
  -[WRM_TerminusContext setWifiCCA:](self, "setWifiCCA:", 0);
  -[WRM_TerminusContext setLsmRecommendationBe:](self, "setLsmRecommendationBe:", 0);
  -[WRM_TerminusContext setExpectedThroughputVIBE:](self, "setExpectedThroughputVIBE:", 0);
  -[WRM_TerminusContext setPacketLifetimeVIBE:](self, "setPacketLifetimeVIBE:", 0);
  -[WRM_TerminusContext setBtRetransmissionRateTx:](self, "setBtRetransmissionRateTx:", 0);
  -[WRM_TerminusContext setBtRetransmissionRateRx:](self, "setBtRetransmissionRateRx:", 0);
  -[WRM_TerminusContext setBtTech:](self, "setBtTech:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WRM_TerminusContext;
  -[WRM_Mobility_Context dealloc](&v3, "dealloc");
}

- (int)mAppLinkPreference
{
  return self->_mAppLinkPreference;
}

- (void)setMAppLinkPreference:(int)a3
{
  self->_mAppLinkPreference = a3;
}

- (int)mCurrentActiveLink
{
  return self->_mCurrentActiveLink;
}

- (void)setMCurrentActiveLink:(int)a3
{
  self->_mCurrentActiveLink = a3;
}

- (BOOL)mTerminusIsRegistered
{
  return self->_mTerminusIsRegistered;
}

- (void)setMTerminusIsRegistered:(BOOL)a3
{
  self->_mTerminusIsRegistered = a3;
}

- (BOOL)mForceUpdateNeeded
{
  return self->_mForceUpdateNeeded;
}

- (void)setMForceUpdateNeeded:(BOOL)a3
{
  self->_mForceUpdateNeeded = a3;
}

- (BOOL)mClientSubscriptionValid
{
  return self->_mClientSubscriptionValid;
}

- (void)setMClientSubscriptionValid:(BOOL)a3
{
  self->_mClientSubscriptionValid = a3;
}

- (BOOL)mIsRetry
{
  return self->_mIsRetry;
}

- (void)setMIsRetry:(BOOL)a3
{
  self->_mIsRetry = a3;
}

- (BOOL)mBtLinkRecommendationUpdateNeeded
{
  return self->_mBtLinkRecommendationUpdateNeeded;
}

- (void)setMBtLinkRecommendationUpdateNeeded:(BOOL)a3
{
  self->_mBtLinkRecommendationUpdateNeeded = a3;
}

- (BOOL)mCompanionWifiLinkRecommendationUpdateNeeded
{
  return self->_mCompanionWifiLinkRecommendationUpdateNeeded;
}

- (void)setMCompanionWifiLinkRecommendationUpdateNeeded:(BOOL)a3
{
  self->_mCompanionWifiLinkRecommendationUpdateNeeded = a3;
}

- (BOOL)mDirectWifiLinkRecommendationUpdateNeeded
{
  return self->_mDirectWifiLinkRecommendationUpdateNeeded;
}

- (void)setMDirectWifiLinkRecommendationUpdateNeeded:(BOOL)a3
{
  self->_mDirectWifiLinkRecommendationUpdateNeeded = a3;
}

- (BOOL)mBtLinkIsRecommended
{
  return self->_mBtLinkIsRecommended;
}

- (void)setMBtLinkIsRecommended:(BOOL)a3
{
  self->_mBtLinkIsRecommended = a3;
}

- (BOOL)mCompanionWifiLinkIsRecommended
{
  return self->_mCompanionWifiLinkIsRecommended;
}

- (void)setMCompanionWifiLinkIsRecommended:(BOOL)a3
{
  self->_mCompanionWifiLinkIsRecommended = a3;
}

- (BOOL)mDirectWifiLinkIsRecommended
{
  return self->_mDirectWifiLinkIsRecommended;
}

- (void)setMDirectWifiLinkIsRecommended:(BOOL)a3
{
  self->_mDirectWifiLinkIsRecommended = a3;
}

- (BOOL)isGizmoNearbyOverBt
{
  return self->_isGizmoNearbyOverBt;
}

- (void)setIsGizmoNearbyOverBt:(BOOL)a3
{
  self->_isGizmoNearbyOverBt = a3;
}

- (unint64_t)btMovingAvgRSSI
{
  return self->_btMovingAvgRSSI;
}

- (void)setBtMovingAvgRSSI:(unint64_t)a3
{
  self->_btMovingAvgRSSI = a3;
}

- (int64_t)wifiRSSI
{
  return self->_wifiRSSI;
}

- (void)setWifiRSSI:(int64_t)a3
{
  self->_wifiRSSI = a3;
}

- (int64_t)wifiSNR
{
  return self->_wifiSNR;
}

- (void)setWifiSNR:(int64_t)a3
{
  self->_wifiSNR = a3;
}

- (int)beaconPER
{
  return self->_beaconPER;
}

- (void)setBeaconPER:(int)a3
{
  self->_beaconPER = a3;
}

- (char)nwType
{
  return self->_nwType;
}

- (void)setNwType:(char)a3
{
  self->_nwType = a3;
}

- (int64_t)wifiCCA
{
  return self->_wifiCCA;
}

- (void)setWifiCCA:(int64_t)a3
{
  self->_wifiCCA = a3;
}

- (int64_t)lsmRecommendationBe
{
  return self->_lsmRecommendationBe;
}

- (void)setLsmRecommendationBe:(int64_t)a3
{
  self->_lsmRecommendationBe = a3;
}

- (int64_t)expectedThroughputVIBE
{
  return self->_expectedThroughputVIBE;
}

- (void)setExpectedThroughputVIBE:(int64_t)a3
{
  self->_expectedThroughputVIBE = a3;
}

- (int64_t)packetLifetimeVIBE
{
  return self->_packetLifetimeVIBE;
}

- (void)setPacketLifetimeVIBE:(int64_t)a3
{
  self->_packetLifetimeVIBE = a3;
}

- (int64_t)packetLossRateVIBE
{
  return self->_packetLossRateVIBE;
}

- (void)setPacketLossRateVIBE:(int64_t)a3
{
  self->_packetLossRateVIBE = a3;
}

- (int64_t)btRetransmissionRateTx
{
  return self->_btRetransmissionRateTx;
}

- (void)setBtRetransmissionRateTx:(int64_t)a3
{
  self->_btRetransmissionRateTx = a3;
}

- (int64_t)btRetransmissionRateRx
{
  return self->_btRetransmissionRateRx;
}

- (void)setBtRetransmissionRateRx:(int64_t)a3
{
  self->_btRetransmissionRateRx = a3;
}

- (int64_t)btTech
{
  return self->_btTech;
}

- (void)setBtTech:(int64_t)a3
{
  self->_btTech = a3;
}

@end
