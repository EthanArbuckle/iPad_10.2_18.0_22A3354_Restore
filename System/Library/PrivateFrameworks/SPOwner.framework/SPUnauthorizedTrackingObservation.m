@implementation SPUnauthorizedTrackingObservation

- (SPUnauthorizedTrackingObservation)initWithCurrentAdvertisementAndLocationHistory:(id)a3 observedLocations:(id)a4
{
  id v6;
  id v7;
  SPUnauthorizedTrackingObservation *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SPUnauthorizedTrackingObservation;
  v8 = -[SPUnauthorizedTrackingObservation init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUnauthorizedTrackingObservation setIdentifier:](v8, "setIdentifier:", v9);

    -[SPUnauthorizedTrackingObservation setAction:](v8, "setAction:", 1);
    -[SPUnauthorizedTrackingObservation setType:](v8, "setType:", 0);
    -[SPUnauthorizedTrackingObservation setTrackingIdentifier:](v8, "setTrackingIdentifier:", v6);
    -[SPUnauthorizedTrackingObservation setObservedLocations:](v8, "setObservedLocations:", v7);
    objc_msgSend(v7, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUnauthorizedTrackingObservation setObservedAt:](v8, "setObservedAt:", v11);

  }
  return v8;
}

- (SPUnauthorizedTrackingObservation)initWithAction:(int64_t)a3 type:(int64_t)a4 trackingIdentifier:(id)a5 observedLocations:(id)a6
{
  id v10;
  id v11;
  SPUnauthorizedTrackingObservation *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v10 = a5;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SPUnauthorizedTrackingObservation;
  v12 = -[SPUnauthorizedTrackingObservation init](&v17, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUnauthorizedTrackingObservation setIdentifier:](v12, "setIdentifier:", v13);

    -[SPUnauthorizedTrackingObservation setAction:](v12, "setAction:", a3);
    -[SPUnauthorizedTrackingObservation setType:](v12, "setType:", a4);
    -[SPUnauthorizedTrackingObservation setTrackingIdentifier:](v12, "setTrackingIdentifier:", v10);
    -[SPUnauthorizedTrackingObservation setObservedLocations:](v12, "setObservedLocations:", v11);
    objc_msgSend(v11, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUnauthorizedTrackingObservation setObservedAt:](v12, "setObservedAt:", v15);

  }
  return v12;
}

- (SPUnauthorizedTrackingObservation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnauthorizedTrackingObservation setIdentifier:](self, "setIdentifier:", v5);

  -[SPUnauthorizedTrackingObservation setAction:](self, "setAction:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("action")));
  -[SPUnauthorizedTrackingObservation setType:](self, "setType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnauthorizedTrackingObservation setTrackingIdentifier:](self, "setTrackingIdentifier:", v6);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("observedLocations"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnauthorizedTrackingObservation setObservedLocations:](self, "setObservedLocations:", v11);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("observedAt"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPUnauthorizedTrackingObservation setObservedAt:](self, "setObservedAt:", v12);
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SPUnauthorizedTrackingObservation *v4;
  SPUnauthorizedTrackingObservation *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (SPUnauthorizedTrackingObservation *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SPUnauthorizedTrackingObservation action](self, "action");
      if (v6 == -[SPUnauthorizedTrackingObservation action](v5, "action"))
      {
        -[SPUnauthorizedTrackingObservation trackingIdentifier](self, "trackingIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPUnauthorizedTrackingObservation trackingIdentifier](v5, "trackingIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqual:", v8))
        {
          -[SPUnauthorizedTrackingObservation observedLocations](self, "observedLocations");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPUnauthorizedTrackingObservation observedLocations](v5, "observedLocations");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "isEqualToArray:", v10))
          {
            -[SPUnauthorizedTrackingObservation observedAt](self, "observedAt");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPUnauthorizedTrackingObservation observedAt](v5, "observedAt");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqualToDate:", v12);

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[SPUnauthorizedTrackingObservation trackingIdentifier](self, "trackingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SPUnauthorizedTrackingObservation observedLocations](self, "observedLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SPUnauthorizedTrackingObservation observedAt](self, "observedAt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SPUnauthorizedTrackingObservation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPUnauthorizedTrackingObservation action](self, "action"), CFSTR("action"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SPUnauthorizedTrackingObservation type](self, "type"), CFSTR("type"));
  -[SPUnauthorizedTrackingObservation trackingIdentifier](self, "trackingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("trackingIdentifier"));

  -[SPUnauthorizedTrackingObservation observedLocations](self, "observedLocations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("observedLocations"));

  -[SPUnauthorizedTrackingObservation observedAt](self, "observedAt");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("observedAt"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SPUnauthorizedTrackingObservation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnauthorizedTrackingObservation trackingIdentifier](self, "trackingIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "advertisementData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fm_hexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SPUnauthorizedTrackingIdentifier %@ %@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (SPUnauthorizedTrackingAdvertisement)trackingIdentifier
{
  return self->_trackingIdentifier;
}

- (void)setTrackingIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_trackingIdentifier, a3);
}

- (NSArray)observedLocations
{
  return self->_observedLocations;
}

- (void)setObservedLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)observedAt
{
  return self->_observedAt;
}

- (void)setObservedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedAt, 0);
  objc_storeStrong((id *)&self->_observedLocations, 0);
  objc_storeStrong((id *)&self->_trackingIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
