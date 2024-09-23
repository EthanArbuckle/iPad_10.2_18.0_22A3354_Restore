@implementation SPBeaconObservation

- (SPBeaconObservation)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  NSStringFromSelector(sel_initWithBeaconIdentifier_type_date_location_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ requires the use of the initializer: %@"), v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (SPBeaconObservation)initWithBeaconIdentifier:(id)a3 type:(int64_t)a4 date:(id)a5 location:(id)a6
{
  id v11;
  id v12;
  id v13;
  SPBeaconObservation *v14;
  uint64_t v15;
  NSUUID *beaconIdentifier;
  uint64_t v17;
  NSDate *date;
  uint64_t v19;
  SPObservationLocation *location;
  SPBeaconObservation *v21;
  void *v23;
  void *v24;
  objc_super v25;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SPBeaconObservation.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("beaconIdentifier"));

    if (v12)
    {
LABEL_9:
      v21 = 0;
      goto LABEL_6;
    }
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SPBeaconObservation.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

    goto LABEL_9;
  }
  if (!v12)
    goto LABEL_8;
  v25.receiver = self;
  v25.super_class = (Class)SPBeaconObservation;
  v14 = -[SPBeaconObservation init](&v25, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    beaconIdentifier = v14->_beaconIdentifier;
    v14->_beaconIdentifier = (NSUUID *)v15;

    v14->_type = a4;
    v17 = objc_msgSend(v12, "copy");
    date = v14->_date;
    v14->_date = (NSDate *)v17;

    v19 = objc_msgSend(v13, "copy");
    location = v14->_location;
    v14->_location = (SPObservationLocation *)v19;

  }
  self = v14;
  v21 = self;
LABEL_6:

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *beaconIdentifier;
  id v5;

  beaconIdentifier = self->_beaconIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", beaconIdentifier, CFSTR("kSPBeaconObservationSecureCodingBeaconIdentifierKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("kSPBeaconObservationSecureCodingTypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("kSPBeaconObservationSecureCodingDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("kSPBeaconObservationSecureCodingLocationKey"));

}

- (SPBeaconObservation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SPBeaconObservation *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSPBeaconObservationSecureCodingBeaconIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSPBeaconObservationSecureCodingTypeKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSPBeaconObservationSecureCodingDateKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSPBeaconObservationSecureCodingLocationKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SPBeaconObservation initWithBeaconIdentifier:type:date:location:](self, "initWithBeaconIdentifier:type:date:location:", v5, v6, v7, v8);
  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSUUID UUIDString](self->_beaconIdentifier, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SPBeaconObservation, identifier, %@, type, %lld, date, %@, location, %@"), v4, self->_type, self->_date, self->_location);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (NSDate)date
{
  return self->_date;
}

- (SPObservationLocation)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
}

@end
