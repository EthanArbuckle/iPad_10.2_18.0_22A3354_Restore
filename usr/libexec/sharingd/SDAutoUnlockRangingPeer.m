@implementation SDAutoUnlockRangingPeer

- (_NIRangingPeer)niRangingPeer
{
  return self->_niRangingPeer;
}

- (void)setNiRangingPeer:(id)a3
{
  objc_storeStrong((id *)&self->_niRangingPeer, a3);
}

- (NSData)macAddressData
{
  return self->_macAddressData;
}

- (void)setMacAddressData:(id)a3
{
  objc_storeStrong((id *)&self->_macAddressData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macAddressData, 0);
  objc_storeStrong((id *)&self->_niRangingPeer, 0);
}

@end
