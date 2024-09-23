@implementation PKPaymentMarketCircularGeoFence

- (PKPaymentMarketCircularGeoFence)init
{
  PKPaymentMarketCircularGeoFence *v2;
  uint64_t v3;
  NSUUID *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentMarketCircularGeoFence;
  v2 = -[PKPaymentMarketCircularGeoFence init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

  }
  return v2;
}

- (PKPaymentMarketCircularGeoFence)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKPaymentMarketCircularGeoFence *v9;
  PKPaymentMarketCircularGeoFence *v10;
  id v11;
  double v12;
  CLLocationDegrees v13;
  CLLocationDegrees v14;
  CLLocationCoordinate2D v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  CLCircularRegion *circle;

  v4 = a3;
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("Center"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PKNumberForKey:", CFSTR("Latitude"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PKNumberForKey:", CFSTR("Longitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("Radius"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v6 && v7 && v8)
  {
    v10 = -[PKPaymentMarketCircularGeoFence init](self, "init");
    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0C9E368]);
      objc_msgSend(v6, "doubleValue");
      v13 = v12;
      objc_msgSend(v7, "doubleValue");
      v15 = CLLocationCoordinate2DMake(v13, v14);
      objc_msgSend(v8, "doubleValue");
      v17 = v16;
      -[NSUUID UUIDString](v10->_identifier, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v11, "initWithCenter:radius:identifier:", v18, v15.latitude, v15.longitude, v17);
      circle = v10->_circle;
      v10->_circle = (CLCircularRegion *)v19;

    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (BOOL)containsLocation:(id)a3
{
  CLCircularRegion *circle;

  circle = self->_circle;
  objc_msgSend(a3, "coordinate");
  return -[CLCircularRegion containsCoordinate:](circle, "containsCoordinate:");
}

- (double)distanceFromLocation:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  v4 = (objc_class *)MEMORY[0x1E0C9E3B8];
  v5 = a3;
  v6 = [v4 alloc];
  -[CLCircularRegion center](self->_circle, "center");
  v8 = v7;
  -[CLCircularRegion center](self->_circle, "center");
  v9 = (void *)objc_msgSend(v6, "initWithLatitude:longitude:", v8);
  objc_msgSend(v9, "distanceFromLocation:", v5);
  v11 = v10;

  return v11;
}

- (PKPaymentMarketCircularGeoFence)initWithCoder:(id)a3
{
  id v4;
  PKPaymentMarketCircularGeoFence *v5;
  double v6;
  CLLocationDegrees v7;
  double v8;
  CLLocationDegrees v9;
  double v10;
  double v11;
  uint64_t v12;
  NSUUID *identifier;
  id v14;
  CLLocationCoordinate2D v15;
  void *v16;
  uint64_t v17;
  CLCircularRegion *circle;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentMarketCircularGeoFence;
  v5 = -[PKPaymentMarketCircularGeoFence init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
    v7 = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
    v9 = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("radius"));
    v11 = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v12;

    v14 = objc_alloc(MEMORY[0x1E0C9E368]);
    v15 = CLLocationCoordinate2DMake(v7, v9);
    -[NSUUID UUIDString](v5->_identifier, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "initWithCenter:radius:identifier:", v16, v15.latitude, v15.longitude, v11);
    circle = v5->_circle;
    v5->_circle = (CLCircularRegion *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  double v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  -[CLCircularRegion center](self->_circle, "center");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("latitude"));
  -[CLCircularRegion center](self->_circle, "center");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("longitude"), v5);
  -[CLCircularRegion radius](self->_circle, "radius");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("radius"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_circle, 0);
}

@end
