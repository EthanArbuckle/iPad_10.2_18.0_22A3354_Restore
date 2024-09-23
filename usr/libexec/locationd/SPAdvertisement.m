@implementation SPAdvertisement

- (BOOL)isEqualToAdvertisement:(id)a3
{
  unsigned int v5;
  unsigned int v6;

  if (a3)
  {
    if (self == a3)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v5 = objc_msgSend(-[SPAdvertisement address](self, "address"), "isEqualToData:", objc_msgSend(a3, "address"));
      if (v5)
      {
        v5 = objc_msgSend(-[SPAdvertisement advertisementData](self, "advertisementData"), "isEqualToData:", objc_msgSend(a3, "advertisementData"));
        if (v5)
        {
          v6 = -[SPAdvertisement status](self, "status");
          LOBYTE(v5) = v6 == objc_msgSend(a3, "status");
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

@end
