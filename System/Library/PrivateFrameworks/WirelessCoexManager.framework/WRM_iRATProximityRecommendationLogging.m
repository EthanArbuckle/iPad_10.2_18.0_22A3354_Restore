@implementation WRM_iRATProximityRecommendationLogging

- (WRM_iRATProximityRecommendationLogging)init
{
  WRM_iRATProximityRecommendationLogging *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WRM_iRATProximityRecommendationLogging;
  v2 = -[WRM_iRATProximityRecommendationLogging init](&v4, sel_init);
  if (v2)
  {
    -[WRM_iRATProximityRecommendationLogging setUuid:](v2, "setUuid:", objc_alloc_init(MEMORY[0x24BDD1880]));
    -[WRM_iRATProximityRecommendationLogging setBtRSSI:](v2, "setBtRSSI:", 0);
    -[WRM_iRATProximityRecommendationLogging setWifiSNR:](v2, "setWifiSNR:", 0);
    -[WRM_iRATProximityRecommendationLogging setWifiRSSI:](v2, "setWifiRSSI:", 0);
    -[WRM_iRATProximityRecommendationLogging setBeaconPER:](v2, "setBeaconPER:", 0);
    -[WRM_iRATProximityRecommendationLogging setNwType:](v2, "setNwType:", 0);
    -[WRM_iRATProximityRecommendationLogging setWifiCCA:](v2, "setWifiCCA:", 0);
    -[WRM_iRATProximityRecommendationLogging setLsmRecommendationBe:](v2, "setLsmRecommendationBe:", 0);
    -[WRM_iRATProximityRecommendationLogging setExpectedThroughputVIBE:](v2, "setExpectedThroughputVIBE:", 0);
    -[WRM_iRATProximityRecommendationLogging setPacketLifetimeVIBE:](v2, "setPacketLifetimeVIBE:", 0);
    -[WRM_iRATProximityRecommendationLogging setPacketLossRateVIBE:](v2, "setPacketLossRateVIBE:", 0);
    -[WRM_iRATProximityRecommendationLogging setBtRetransmissionRateRx:](v2, "setBtRetransmissionRateRx:", 0);
    -[WRM_iRATProximityRecommendationLogging setBtRetransmissionRateTx:](v2, "setBtRetransmissionRateTx:", 0);
    -[WRM_iRATProximityRecommendationLogging setBtTech:](v2, "setBtTech:", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if (-[WRM_iRATProximityRecommendationLogging Uuid](self, "Uuid"))
  {

    -[WRM_iRATProximityRecommendationLogging setUuid:](self, "setUuid:", 0);
  }
  -[WRM_iRATProximityRecommendationLogging setBtRSSI:](self, "setBtRSSI:", 0);
  -[WRM_iRATProximityRecommendationLogging setWifiSNR:](self, "setWifiSNR:", 0);
  -[WRM_iRATProximityRecommendationLogging setWifiRSSI:](self, "setWifiRSSI:", 0);
  -[WRM_iRATProximityRecommendationLogging setBeaconPER:](self, "setBeaconPER:", 0);
  -[WRM_iRATProximityRecommendationLogging setNwType:](self, "setNwType:", 0);
  -[WRM_iRATProximityRecommendationLogging setWifiCCA:](self, "setWifiCCA:", 0);
  -[WRM_iRATProximityRecommendationLogging setLsmRecommendationBe:](self, "setLsmRecommendationBe:", 0);
  -[WRM_iRATProximityRecommendationLogging setExpectedThroughputVIBE:](self, "setExpectedThroughputVIBE:", 0);
  -[WRM_iRATProximityRecommendationLogging setPacketLifetimeVIBE:](self, "setPacketLifetimeVIBE:", 0);
  -[WRM_iRATProximityRecommendationLogging setPacketLossRateVIBE:](self, "setPacketLossRateVIBE:", 0);
  -[WRM_iRATProximityRecommendationLogging setBtRetransmissionRateRx:](self, "setBtRetransmissionRateRx:", 0);
  -[WRM_iRATProximityRecommendationLogging setBtRetransmissionRateTx:](self, "setBtRetransmissionRateTx:", 0);
  -[WRM_iRATProximityRecommendationLogging setBtTech:](self, "setBtTech:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WRM_iRATProximityRecommendationLogging;
  -[WRM_iRATProximityRecommendationLogging dealloc](&v3, sel_dealloc);
}

- (NSUUID)Uuid
{
  return self->_Uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)btRSSI
{
  return self->_btRSSI;
}

- (void)setBtRSSI:(unint64_t)a3
{
  self->_btRSSI = a3;
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
