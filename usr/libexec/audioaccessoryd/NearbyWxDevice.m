@implementation NearbyWxDevice

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)audioState
{
  return self->_audioState;
}

- (void)setAudioState:(int64_t)a3
{
  self->_audioState = a3;
}

- (double)batteryLeft
{
  return self->_batteryLeft;
}

- (void)setBatteryLeft:(double)a3
{
  self->_batteryLeft = a3;
}

- (double)batteryRight
{
  return self->_batteryRight;
}

- (void)setBatteryRight:(double)a3
{
  self->_batteryRight = a3;
}

- (double)batteryMain
{
  return self->_batteryMain;
}

- (void)setBatteryMain:(double)a3
{
  self->_batteryMain = a3;
}

- (NSData)lastConnectHost
{
  return self->_lastConnectHost;
}

- (void)setLastConnectHost:(id)a3
{
  objc_storeStrong((id *)&self->_lastConnectHost, a3);
}

- (unint64_t)lastConnectionTicks
{
  return self->_lastConnectionTicks;
}

- (void)setLastConnectionTicks:(unint64_t)a3
{
  self->_lastConnectionTicks = a3;
}

- (unint64_t)lastWxAdvTicks
{
  return self->_lastWxAdvTicks;
}

- (void)setLastWxAdvTicks:(unint64_t)a3
{
  self->_lastWxAdvTicks = a3;
}

- (BOOL)lidClosed
{
  return self->_lidClosed;
}

- (void)setLidClosed:(BOOL)a3
{
  self->_lidClosed = a3;
}

- (double)lowestBudBatteryInfo
{
  return self->_lowestBudBatteryInfo;
}

- (void)setLowestBudBatteryInfo:(double)a3
{
  self->_lowestBudBatteryInfo = a3;
}

- (BOOL)icloudSignedIn
{
  return self->_icloudSignedIn;
}

- (void)setIcloudSignedIn:(BOOL)a3
{
  self->_icloudSignedIn = a3;
}

- (unsigned)idleTime
{
  return self->_idleTime;
}

- (void)setIdleTime:(unsigned __int8)a3
{
  self->_idleTime = a3;
}

- (BOOL)isInEar
{
  return self->_isInEar;
}

- (void)setIsInEar:(BOOL)a3
{
  self->_isInEar = a3;
}

- (BOOL)isUTPConnected
{
  return self->_isUTPConnected;
}

- (void)setIsUTPConnected:(BOOL)a3
{
  self->_isUTPConnected = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)nearbyBannerShown
{
  return self->_nearbyBannerShown;
}

- (void)setNearbyBannerShown:(BOOL)a3
{
  self->_nearbyBannerShown = a3;
}

- (unsigned)outOfCaseTime
{
  return self->_outOfCaseTime;
}

- (void)setOutOfCaseTime:(unsigned __int8)a3
{
  self->_outOfCaseTime = a3;
}

- (NSData)oneSourceLastRouteHost
{
  return self->_oneSourceLastRouteHost;
}

- (void)setOneSourceLastRouteHost:(id)a3
{
  objc_storeStrong((id *)&self->_oneSourceLastRouteHost, a3);
}

- (BOOL)paired
{
  return self->_paired;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (BOOL)preemptiveBannerShown
{
  return self->_preemptiveBannerShown;
}

- (void)setPreemptiveBannerShown:(BOOL)a3
{
  self->_preemptiveBannerShown = a3;
}

- (BOOL)firstPreemptiveBannerShown
{
  return self->_firstPreemptiveBannerShown;
}

- (void)setFirstPreemptiveBannerShown:(BOOL)a3
{
  self->_firstPreemptiveBannerShown = a3;
}

- (BOOL)primaryInCase
{
  return self->_primaryInCase;
}

- (void)setPrimaryInCase:(BOOL)a3
{
  self->_primaryInCase = a3;
}

- (BOOL)primaryInEar
{
  return self->_primaryInEar;
}

- (void)setPrimaryInEar:(BOOL)a3
{
  self->_primaryInEar = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
}

- (BOOL)secondaryInCase
{
  return self->_secondaryInCase;
}

- (void)setSecondaryInCase:(BOOL)a3
{
  self->_secondaryInCase = a3;
}

- (BOOL)secondaryInEar
{
  return self->_secondaryInEar;
}

- (void)setSecondaryInEar:(BOOL)a3
{
  self->_secondaryInEar = a3;
}

- (unsigned)sourceCount
{
  return self->_sourceCount;
}

- (void)setSourceCount:(unsigned int)a3
{
  self->_sourceCount = a3;
}

- (NSData)zeroSourceLastRouteHost
{
  return self->_zeroSourceLastRouteHost;
}

- (void)setZeroSourceLastRouteHost:(id)a3
{
  objc_storeStrong((id *)&self->_zeroSourceLastRouteHost, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroSourceLastRouteHost, 0);
  objc_storeStrong((id *)&self->_oneSourceLastRouteHost, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lastConnectHost, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
