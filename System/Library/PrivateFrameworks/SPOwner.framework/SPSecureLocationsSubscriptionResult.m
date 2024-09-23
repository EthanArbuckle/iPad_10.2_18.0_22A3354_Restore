@implementation SPSecureLocationsSubscriptionResult

- (SPSecureLocationsSubscriptionResult)init
{
  SPSecureLocationsSubscriptionResult *v2;
  SPSecureLocationsSubscriptionResult *v3;
  NSArray *locations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPSecureLocationsSubscriptionResult;
  v2 = -[SPSecureLocationsSubscriptionResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    locations = v2->_locations;
    v2->_locations = (NSArray *)MEMORY[0x1E0C9AA60];

    v3->_expiresIn = 0.0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPSecureLocationsSubscriptionResult *v4;
  void *v5;

  v4 = objc_alloc_init(SPSecureLocationsSubscriptionResult);
  -[SPSecureLocationsSubscriptionResult locations](self, "locations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSecureLocationsSubscriptionResult setLocations:](v4, "setLocations:", v5);

  -[SPSecureLocationsSubscriptionResult expiresIn](self, "expiresIn");
  -[SPSecureLocationsSubscriptionResult setExpiresIn:](v4, "setExpiresIn:");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *locations;
  id v5;

  locations = self->_locations;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", locations, CFSTR("locations"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("expiresIn"), self->_expiresIn);

}

- (SPSecureLocationsSubscriptionResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *locations;
  double v10;
  double v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("locations"));
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  locations = self->_locations;
  self->_locations = v8;

  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("expiresIn"));
  v11 = v10;

  self->_expiresIn = v11;
  return self;
}

- (SPSecureLocationsSubscriptionResult)initWithExpiryTime:(double)a3 locations:(id)a4
{
  objc_storeStrong((id *)&self->_locations, a4);
  self->_expiresIn = a3;
  return self;
}

- (NSArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)expiresIn
{
  return self->_expiresIn;
}

- (void)setExpiresIn:(double)a3
{
  self->_expiresIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
}

@end
