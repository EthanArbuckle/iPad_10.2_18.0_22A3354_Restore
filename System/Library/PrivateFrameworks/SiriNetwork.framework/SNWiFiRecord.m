@implementation SNWiFiRecord

- (int64_t)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (int64_t)snr
{
  return self->_snr;
}

- (void)setSnr:(int64_t)a3
{
  self->_snr = a3;
}

- (int64_t)cca
{
  return self->_cca;
}

- (void)setCca:(int64_t)a3
{
  self->_cca = a3;
}

- (NSString)channelInfo
{
  return self->_channelInfo;
}

- (void)setChannelInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)phyMode
{
  return self->_phyMode;
}

- (void)setPhyMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isCaptive
{
  return self->_isCaptive;
}

- (void)setIsCaptive:(BOOL)a3
{
  self->_isCaptive = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_phyMode, 0);
  objc_storeStrong((id *)&self->_channelInfo, 0);
}

@end
