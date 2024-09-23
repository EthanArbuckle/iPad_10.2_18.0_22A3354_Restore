@implementation SPLocationFetchResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationsByBeaconIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPLocationFetchResult)initWithCoder:(id)a3
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
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("locationsByBeaconIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPLocationFetchResult setLocationsByBeaconIdentifier:](self, "setLocationsByBeaconIdentifier:", v8);
  return self;
}

- (SPLocationFetchResult)initWithResults:(id)a3
{
  id v4;
  SPLocationFetchResult *v5;
  SPLocationFetchResult *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SPLocationFetchResult;
  v5 = -[SPLocationFetchResult init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SPLocationFetchResult setLocationsByBeaconIdentifier:](v5, "setLocationsByBeaconIdentifier:", v4);

  return v6;
}

- (void)setLocationsByBeaconIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPLocationFetchResult locationsByBeaconIdentifier](self, "locationsByBeaconIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("locationsByBeaconIdentifier"));

}

- (NSDictionary)locationsByBeaconIdentifier
{
  return self->_locationsByBeaconIdentifier;
}

@end
