@implementation SPBeaconTaskInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconTaskInformation)initWithName:(id)a3 lastUpdated:(id)a4 error:(id)a5 state:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  SPBeaconTaskInformation *v13;
  SPBeaconTaskInformation *v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SPBeaconTaskInformation;
  v13 = -[SPBeaconTaskInformation init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[SPBeaconTaskInformation setName:](v13, "setName:", v10);
    -[SPBeaconTaskInformation setLastUpdated:](v14, "setLastUpdated:", v11);
    -[SPBeaconTaskInformation setError:](v14, "setError:", v12);
    -[SPBeaconTaskInformation setState:](v14, "setState:", a6);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPBeaconTaskInformation setCommandIdentifier:](v14, "setCommandIdentifier:", v15);

  }
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPBeaconTaskInformation *v4;
  void *v5;
  void *v6;
  void *v7;
  SPBeaconTaskInformation *v8;
  void *v9;

  v4 = [SPBeaconTaskInformation alloc];
  -[SPBeaconTaskInformation name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconTaskInformation lastUpdated](self, "lastUpdated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconTaskInformation error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SPBeaconTaskInformation initWithName:lastUpdated:error:state:](v4, "initWithName:lastUpdated:error:state:", v5, v6, v7, -[SPBeaconTaskInformation state](self, "state"));

  -[SPBeaconTaskInformation commandIdentifier](self, "commandIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconTaskInformation setCommandIdentifier:](v8, "setCommandIdentifier:", v9);

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
  -[SPBeaconTaskInformation name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[SPBeaconTaskInformation lastUpdated](self, "lastUpdated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("lastUpdated"));

  -[SPBeaconTaskInformation error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("error"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPBeaconTaskInformation state](self, "state"), CFSTR("state"));
  -[SPBeaconTaskInformation commandIdentifier](self, "commandIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("commandIdentifier"));

}

- (SPBeaconTaskInformation)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  NSDate *v7;
  NSDate *lastUpdated;
  NSError *v9;
  NSError *error;
  NSUUID *v11;
  NSUUID *commandIdentifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdated = self->_lastUpdated;
  self->_lastUpdated = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v9 = (NSError *)objc_claimAutoreleasedReturnValue();
  error = self->_error;
  self->_error = v9;

  self->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commandIdentifier"));
  v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();

  commandIdentifier = self->_commandIdentifier;
  self->_commandIdentifier = v11;

  return self;
}

- (id)debugDescription
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[SPBeaconTaskInformation state](self, "state");
  if ((unint64_t)(v3 + 1) > 6)
    v4 = 0;
  else
    v4 = *((_QWORD *)&off_1E5E16608 + v3 + 1);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[SPBeaconTaskInformation name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconTaskInformation commandIdentifier](self, "commandIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconTaskInformation error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p %@ %@ state: %@ error: %@>"), v6, self, v7, v8, v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  SPBeaconTaskInformation *v4;
  SPBeaconTaskInformation *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SPBeaconTaskInformation *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SPBeaconTaskInformation commandIdentifier](self, "commandIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPBeaconTaskInformation commandIdentifier](v5, "commandIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SPBeaconTaskInformation commandIdentifier](self, "commandIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSUUID)commandIdentifier
{
  return self->_commandIdentifier;
}

- (void)setCommandIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
