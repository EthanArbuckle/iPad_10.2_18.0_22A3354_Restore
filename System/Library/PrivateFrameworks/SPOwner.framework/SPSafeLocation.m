@implementation SPSafeLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPSafeLocation)initWithIdentifier:(id)a3 type:(int64_t)a4 name:(id)a5 location:(id)a6 associatedBeacons:(id)a7 approvalState:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  SPSafeLocation *v18;
  SPSafeLocation *v19;
  objc_super v22;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SPSafeLocation;
  v18 = -[SPSafeLocation init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    v19->_type = a4;
    objc_storeStrong((id *)&v19->_name, a5);
    objc_storeStrong((id *)&v19->_location, a6);
    v19->_approvalState = a8;
    objc_storeStrong((id *)&v19->_associatedBeacons, a7);
  }

  return v19;
}

- (SPSafeLocation)initWithType:(int64_t)a3 name:(id)a4 location:(id)a5 approvalState:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  SPSafeLocation *v14;

  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  v14 = -[SPSafeLocation initWithIdentifier:type:name:location:associatedBeacons:approvalState:](self, "initWithIdentifier:type:name:location:associatedBeacons:approvalState:", v12, a3, v11, v10, v13, a6);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  SPSafeLocation *v4;
  SPSafeLocation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int64_t v17;
  BOOL v18;
  int64_t v20;
  void *v21;

  v4 = (SPSafeLocation *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SPSafeLocation identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPSafeLocation identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[SPSafeLocation name](self, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPSafeLocation name](v5, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          -[SPSafeLocation location](self, "location");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SPSafeLocation location](v5, "location");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "distanceFromLocation:", v11);
          if (v12 == 0.0)
          {
            -[SPSafeLocation associatedBeacons](self, "associatedBeacons");
            v13 = objc_claimAutoreleasedReturnValue();
            -[SPSafeLocation associatedBeacons](v5, "associatedBeacons");
            v14 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v13;
            v15 = (void *)v13;
            v16 = (void *)v14;
            if (objc_msgSend(v15, "isEqual:", v14)
              && (v20 = -[SPSafeLocation type](self, "type"), v20 == -[SPSafeLocation type](v5, "type")))
            {
              v17 = -[SPSafeLocation approvalState](self, "approvalState");
              v18 = v17 == -[SPSafeLocation approvalState](v5, "approvalState");
            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;

  -[SPSafeLocation identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SPSafeLocation name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SPSafeLocation associatedBeacons](self, "associatedBeacons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[SPSafeLocation type](self, "type");
  v10 = v9 ^ -[SPSafeLocation approvalState](self, "approvalState");

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPSafeLocation *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  SPSafeLocation *v10;

  v4 = [SPSafeLocation alloc];
  -[SPSafeLocation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPSafeLocation type](self, "type");
  -[SPSafeLocation name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSafeLocation location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSafeLocation associatedBeacons](self, "associatedBeacons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SPSafeLocation initWithIdentifier:type:name:location:associatedBeacons:approvalState:](v4, "initWithIdentifier:type:name:location:associatedBeacons:approvalState:", v5, v6, v7, v8, v9, -[SPSafeLocation approvalState](self, "approvalState"));

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SPSafeLocation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPSafeLocation type](self, "type"), CFSTR("type"));
  -[SPSafeLocation name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

  -[SPSafeLocation location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("location"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPSafeLocation approvalState](self, "approvalState"), CFSTR("approvalState"));
  -[SPSafeLocation associatedBeacons](self, "associatedBeacons");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("associatedBeacons"));

}

- (SPSafeLocation)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *identifier;
  NSString *v7;
  NSString *name;
  CLLocation *v9;
  CLLocation *location;
  void *v11;
  void *v12;
  void *v13;
  NSSet *v14;
  NSSet *associatedBeacons;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  self->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
  v9 = (CLLocation *)objc_claimAutoreleasedReturnValue();
  location = self->_location;
  self->_location = v9;

  self->_approvalState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("approvalState"));
  v11 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("associatedBeacons"));
  v14 = (NSSet *)objc_claimAutoreleasedReturnValue();

  associatedBeacons = self->_associatedBeacons;
  self->_associatedBeacons = v14;

  return self;
}

- (id)mutableSafeLocation
{
  SPMutableSafeLocation *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  SPMutableSafeLocation *v9;

  v3 = [SPMutableSafeLocation alloc];
  -[SPSafeLocation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SPSafeLocation type](self, "type");
  -[SPSafeLocation name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSafeLocation location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSafeLocation associatedBeacons](self, "associatedBeacons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SPSafeLocation initWithIdentifier:type:name:location:associatedBeacons:approvalState:](v3, "initWithIdentifier:type:name:location:associatedBeacons:approvalState:", v4, v5, v6, v7, v8, -[SPSafeLocation approvalState](self, "approvalState"));

  return v9;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPSafeLocation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSafeLocation location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinate");
  v8 = v7;
  -[SPSafeLocation location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinate");
  v11 = v10;
  -[SPSafeLocation location](self, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "horizontalAccuracy");
  v14 = v13;
  -[SPSafeLocation name](self, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSafeLocation associatedBeacons](self, "associatedBeacons");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ loc: %f,%f (%f) n:%@ b:%@ a:%ld>"), v4, self, v5, v8, v11, v14, v15, v16, -[SPSafeLocation approvalState](self, "approvalState"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (double)latitude
{
  void *v2;
  double v3;
  double v4;

  -[SPSafeLocation location](self, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinate");
  v4 = v3;

  return v4;
}

- (double)longitude
{
  void *v2;
  double v3;
  double v4;

  -[SPSafeLocation location](self, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinate");
  v4 = v3;

  return v4;
}

- (double)horizontalAccuracy
{
  void *v2;
  double v3;
  double v4;

  -[SPSafeLocation location](self, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "horizontalAccuracy");
  v4 = v3;

  return v4;
}

- (double)altitude
{
  void *v2;
  double v3;
  double v4;

  -[SPSafeLocation location](self, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "altitude");
  v4 = v3;

  return v4;
}

- (double)verticalAccuracy
{
  void *v2;
  double v3;
  double v4;

  -[SPSafeLocation location](self, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "verticalAccuracy");
  v4 = v3;

  return v4;
}

- (double)speed
{
  void *v2;
  double v3;
  double v4;

  -[SPSafeLocation location](self, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speed");
  v4 = v3;

  return v4;
}

- (double)speedAccuracy
{
  void *v2;
  double v3;
  double v4;

  -[SPSafeLocation location](self, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speedAccuracy");
  v4 = v3;

  return v4;
}

- (double)course
{
  void *v2;
  double v3;
  double v4;

  -[SPSafeLocation location](self, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "course");
  v4 = v3;

  return v4;
}

- (double)courseAccuracy
{
  void *v2;
  double v3;
  double v4;

  -[SPSafeLocation location](self, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "courseAccuracy");
  v4 = v3;

  return v4;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)approvalState
{
  return self->_approvalState;
}

- (void)setApprovalState:(int64_t)a3
{
  self->_approvalState = a3;
}

- (NSSet)associatedBeacons
{
  return self->_associatedBeacons;
}

- (void)setAssociatedBeacons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedBeacons, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
