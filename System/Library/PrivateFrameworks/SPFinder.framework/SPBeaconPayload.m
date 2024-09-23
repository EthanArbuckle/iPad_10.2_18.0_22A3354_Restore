@implementation SPBeaconPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconPayload)initWithAdvertisement:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  SPBeaconPayload *v8;
  SPBeaconPayload *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SPBeaconPayload;
  v8 = -[SPBeaconPayload init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SPBeaconPayload setAdvertisement:](v8, "setAdvertisement:", v6);
    -[SPBeaconPayload setLocation:](v9, "setLocation:", v7);
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SPBeaconPayload advertisement](self, "advertisement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("advertisement"));

  -[SPBeaconPayload location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("location"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[SPBeaconPayload observationValue](self, "observationValue"), CFSTR("observationValue"));
  objc_msgSend(v6, "encodeBool:forKey:", -[SPBeaconPayload refreshGeotag](self, "refreshGeotag"), CFSTR("refreshGeotag"));

}

- (SPBeaconPayload)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("advertisement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconPayload setAdvertisement:](self, "setAdvertisement:", v5);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconPayload setLocation:](self, "setLocation:", v6);

  -[SPBeaconPayload setObservationValue:](self, "setObservationValue:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("observationValue")));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("refreshGeotag"));

  -[SPBeaconPayload setRefreshGeotag:](self, "setRefreshGeotag:", v7);
  return self;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SPBeaconPayload advertisement](self, "advertisement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconPayload location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SPBeaconPayload [%@] [%@] value: %ld refreshGeotag: %d"), v4, v5, -[SPBeaconPayload observationValue](self, "observationValue"), -[SPBeaconPayload refreshGeotag](self, "refreshGeotag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SPAdvertisement)advertisement
{
  return self->_advertisement;
}

- (void)setAdvertisement:(id)a3
{
  objc_storeStrong((id *)&self->_advertisement, a3);
}

- (SPEstimatedLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)observationValue
{
  return self->_observationValue;
}

- (void)setObservationValue:(int64_t)a3
{
  self->_observationValue = a3;
}

- (BOOL)refreshGeotag
{
  return self->_refreshGeotag;
}

- (void)setRefreshGeotag:(BOOL)a3
{
  self->_refreshGeotag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
}

@end
