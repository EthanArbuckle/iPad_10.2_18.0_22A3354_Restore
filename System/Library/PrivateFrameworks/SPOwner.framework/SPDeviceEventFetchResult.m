@implementation SPDeviceEventFetchResult

- (SPDeviceEventFetchResult)initWithResults:(id)a3
{
  id v4;
  SPDeviceEventFetchResult *v5;
  SPDeviceEventFetchResult *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SPDeviceEventFetchResult;
  v5 = -[SPDeviceEventFetchResult init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SPDeviceEventFetchResult setBeaconEventByBeaconIdentifier:](v5, "setBeaconEventByBeaconIdentifier:", v4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPDeviceEventFetchResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("beaconEventByBeaconIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPDeviceEventFetchResult setBeaconEventByBeaconIdentifier:](self, "setBeaconEventByBeaconIdentifier:", v8);
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPDeviceEventFetchResult beaconEventByBeaconIdentifier](self, "beaconEventByBeaconIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("beaconEventByBeaconIdentifier"));

}

- (NSDictionary)beaconEventByBeaconIdentifier
{
  return self->_beaconEventByBeaconIdentifier;
}

- (void)setBeaconEventByBeaconIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beaconEventByBeaconIdentifier, 0);
}

@end
