@implementation SPBeaconPayload

- (BOOL)isEqualToPayload:(id)a3
{
  unsigned int v5;

  if (a3)
  {
    v5 = objc_msgSend(-[SPBeaconPayload advertisement](self, "advertisement"), "isEqualToAdvertisement:", objc_msgSend(a3, "advertisement"));
    if (v5)
    {
      if (-[SPBeaconPayload location](self, "location"))
        LOBYTE(v5) = _objc_msgSend(-[SPBeaconPayload location](self, "location"), "isEqualToEstimatedLocation:", objc_msgSend(a3, "location"));
      else
        LOBYTE(v5) = objc_msgSend(a3, "location") == 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

@end
