@implementation PKPaymentSetupProductRegionDataCoordinate

- (PKPaymentSetupProductRegionDataCoordinate)initWithCoordinatePair:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKPaymentSetupProductRegionDataCoordinate *v7;
  PKPaymentSetupProductRegionDataCoordinate *v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("longitude"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("latitude"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)PKPaymentSetupProductRegionDataCoordinate;
    v8 = -[PKPaymentSetupProductRegionDataCoordinate init](&v12, sel_init);
    if (v8)
    {
      objc_msgSend(v5, "doubleValue");
      v8->_longitude = v9;
      objc_msgSend(v6, "doubleValue");
      v8->_latitude = v10;
    }
    self = v8;
    v7 = self;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[PKPaymentSetupProductRegionDataCoordinate init](+[PKPaymentSetupProductRegionDataCoordinate allocWithZone:](PKPaymentSetupProductRegionDataCoordinate, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_latitude;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_longitude;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupProductRegionDataCoordinate)initWithCoder:(id)a3
{
  id v4;
  PKPaymentSetupProductRegionDataCoordinate *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupProductRegionDataCoordinate;
  v5 = -[PKPaymentSetupProductRegionDataCoordinate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
    v5->_longitude = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
    v5->_latitude = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double longitude;
  id v5;

  longitude = self->_longitude;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longitude"), longitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("latitude"), self->_latitude);

}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

@end
