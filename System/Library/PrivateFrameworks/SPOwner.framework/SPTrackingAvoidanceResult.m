@implementation SPTrackingAvoidanceResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPTrackingAvoidanceResult)initWithIdentifier:(id)a3 type:(int64_t)a4 policies:(id)a5
{
  id v8;
  id v9;
  SPTrackingAvoidanceResult *v10;
  SPTrackingAvoidanceResult *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SPTrackingAvoidanceResult;
  v10 = -[SPTrackingAvoidanceResult init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[SPTrackingAvoidanceResult setIdentifier:](v10, "setIdentifier:", v8);
    -[SPTrackingAvoidanceResult setType:](v11, "setType:", a4);
    -[SPTrackingAvoidanceResult setPolicies:](v11, "setPolicies:", v9);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPTrackingAvoidanceResult *v4;
  void *v5;
  int64_t v6;
  void *v7;
  SPTrackingAvoidanceResult *v8;

  v4 = [SPTrackingAvoidanceResult alloc];
  -[SPTrackingAvoidanceResult identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPTrackingAvoidanceResult type](self, "type");
  -[SPTrackingAvoidanceResult policies](self, "policies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SPTrackingAvoidanceResult initWithIdentifier:type:policies:](v4, "initWithIdentifier:type:policies:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SPTrackingAvoidanceResult *v4;
  NSUUID *identifier;
  void *v6;
  char v7;

  v4 = (SPTrackingAvoidanceResult *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      identifier = self->_identifier;
      -[SPTrackingAvoidanceResult identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSUUID isEqual:](identifier, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_policies, CFSTR("policies"));

}

- (SPTrackingAvoidanceResult)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *identifier;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *policies;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  self->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v7 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("policies"));
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();

  policies = self->_policies;
  self->_policies = v10;

  return self;
}

- (id)description
{
  unint64_t type;
  __CFString *v3;

  type = self->_type;
  if (type > 5)
    v3 = 0;
  else
    v3 = off_1E5E16BF0[type];
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Result: %@ %@"), self->_identifier, v3);
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

- (NSArray)policies
{
  return self->_policies;
}

- (void)setPolicies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
