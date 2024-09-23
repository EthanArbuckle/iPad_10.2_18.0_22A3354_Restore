@implementation NISystemState

- (NISystemState)init
{
  NISystemState *v3;

  v3 = -[NISystemState initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:]([NISystemState alloc], "initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:", 0, 0);

  return v3;
}

- (NISystemState)initWithUWBPreciseDistanceAvailability:(unint64_t)a3 uwbExtendedDistanceAvailability:(unint64_t)a4
{
  NISystemState *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NISystemState;
  result = -[NISystemState init](&v7, "init");
  if (result)
  {
    result->_uwbPreciseDistanceAvailability = a3;
    result->_uwbExtendedDistanceAvailability = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NISystemState initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:](+[NISystemState allocWithZone:](NISystemState, "allocWithZone:", a3), "initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:", self->_uwbPreciseDistanceAvailability, self->_uwbExtendedDistanceAvailability);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_uwbPreciseDistanceAvailability, CFSTR("uwbPreciseDistanceAvailability"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_uwbExtendedDistanceAvailability, CFSTR("uwbExtendedDistanceAvailability"));

}

- (NISystemState)initWithCoder:(id)a3
{
  id v4;
  NISystemState *v5;

  v4 = a3;
  v5 = -[NISystemState initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:]([NISystemState alloc], "initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("uwbPreciseDistanceAvailability")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("uwbExtendedDistanceAvailability")));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NISystemState *v7;
  NISystemState *v8;
  id v9;
  unint64_t uwbPreciseDistanceAvailability;
  id v11;
  BOOL v13;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NISystemState *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v13 = 1;
    }
    else
    {
      v9 = -[NISystemState uwbPreciseDistanceAvailability](v7, "uwbPreciseDistanceAvailability");
      uwbPreciseDistanceAvailability = self->_uwbPreciseDistanceAvailability;
      v11 = -[NISystemState uwbExtendedDistanceAvailability](v8, "uwbExtendedDistanceAvailability");
      v13 = v9 == (id)uwbPreciseDistanceAvailability && v11 == (id)self->_uwbExtendedDistanceAvailability;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_uwbPreciseDistanceAvailability ^ self->_uwbExtendedDistanceAvailability ^ 0x1F;
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NISystemState descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIUtils NISystemResourceAvailabilityToString:](NIUtils, "NISystemResourceAvailabilityToString:", self->_uwbPreciseDistanceAvailability));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NIUtils NISystemResourceAvailabilityToString:](NIUtils, "NISystemResourceAvailabilityToString:", self->_uwbExtendedDistanceAvailability));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<UWB [precise distance: %@, extended distance: %@]>"), v3, v4));

  return v5;
}

- (unint64_t)uwbPreciseDistanceAvailability
{
  return self->_uwbPreciseDistanceAvailability;
}

- (void)setUwbPreciseDistanceAvailability:(unint64_t)a3
{
  self->_uwbPreciseDistanceAvailability = a3;
}

- (unint64_t)uwbExtendedDistanceAvailability
{
  return self->_uwbExtendedDistanceAvailability;
}

- (void)setUwbExtendedDistanceAvailability:(unint64_t)a3
{
  self->_uwbExtendedDistanceAvailability = a3;
}

@end
