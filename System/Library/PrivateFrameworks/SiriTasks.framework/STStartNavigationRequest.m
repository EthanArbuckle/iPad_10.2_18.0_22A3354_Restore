@implementation STStartNavigationRequest

- (id)_initWithStartLocation:(id)a3 destinationLocation:(id)a4 directionsType:(int64_t)a5 arrivalDate:(id)a6 departureDate:(id)a7 extSessionGuid:(id)a8 extSessionGuidCreatedTimestamp:(id)a9
{
  id v15;
  id v16;
  id v17;
  STStartNavigationRequest *v18;
  STStartNavigationRequest *v19;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)STStartNavigationRequest;
  v18 = -[AFSiriRequest init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startLocation, a3);
    objc_storeStrong((id *)&v19->_destinationLocation, a4);
    v19->_directionsType = a5;
    objc_storeStrong((id *)&v19->_arrivalDate, a6);
    objc_storeStrong((id *)&v19->_departureDate, a7);
    objc_storeStrong((id *)&v19->_extSessionGuid, a8);
    objc_storeStrong((id *)&v19->_extSessionGuidCreatedTimestamp, a9);
  }

  return v19;
}

- (id)startLocation
{
  return self->_startLocation;
}

- (id)destinationLocation
{
  return self->_destinationLocation;
}

- (int64_t)directionsType
{
  return self->_directionsType;
}

- (id)arrivalDate
{
  return self->_arrivalDate;
}

- (id)departureDate
{
  return self->_departureDate;
}

- (id)extSessionGuid
{
  return self->_extSessionGuid;
}

- (id)extSessionGuidCreatedTimestamp
{
  return self->_extSessionGuidCreatedTimestamp;
}

- (id)createResponse
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092F0]), "_initWithRequest:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STStartNavigationRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startLocation, CFSTR("kAFStartNavigationRequestStartLocationKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_destinationLocation, CFSTR("kAFStartNavigationRequestDestinationLocationKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_directionsType, CFSTR("kAFStartNavigationRequestDirectionsTypeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_arrivalDate, CFSTR("kAFStartNavigationRequestArrivalDateKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_departureDate, CFSTR("kAFStartNavigationRequestDepartureDateKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extSessionGuid, CFSTR("kAFStartNavigationRequestExtSessionGuidKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extSessionGuidCreatedTimestamp, CFSTR("kAFStartNavigationRequestExtSessionGuidCreatedTimestampKey"));

}

- (STStartNavigationRequest)initWithCoder:(id)a3
{
  id v4;
  STStartNavigationRequest *v5;
  uint64_t v6;
  STSiriLocation *startLocation;
  uint64_t v8;
  STSiriLocation *destinationLocation;
  uint64_t v10;
  NSDate *arrivalDate;
  uint64_t v12;
  NSDate *departureDate;
  uint64_t v14;
  NSString *extSessionGuid;
  uint64_t v16;
  NSDate *extSessionGuidCreatedTimestamp;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STStartNavigationRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAFStartNavigationRequestStartLocationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    startLocation = v5->_startLocation;
    v5->_startLocation = (STSiriLocation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAFStartNavigationRequestDestinationLocationKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    destinationLocation = v5->_destinationLocation;
    v5->_destinationLocation = (STSiriLocation *)v8;

    v5->_directionsType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kAFStartNavigationRequestDirectionsTypeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAFStartNavigationRequestArrivalDateKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    arrivalDate = v5->_arrivalDate;
    v5->_arrivalDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAFStartNavigationRequestDepartureDateKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    departureDate = v5->_departureDate;
    v5->_departureDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAFStartNavigationRequestExtSessionGuidKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    extSessionGuid = v5->_extSessionGuid;
    v5->_extSessionGuid = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAFStartNavigationRequestExtSessionGuidCreatedTimestampKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    extSessionGuidCreatedTimestamp = v5->_extSessionGuidCreatedTimestamp;
    v5->_extSessionGuidCreatedTimestamp = (NSDate *)v16;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extSessionGuidCreatedTimestamp, 0);
  objc_storeStrong((id *)&self->_extSessionGuid, 0);
  objc_storeStrong((id *)&self->_departureDate, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_destinationLocation, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
