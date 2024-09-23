@implementation NISpatialBrowsingConfiguration

+ (id)responderConfigurationWithIdentifier:(id)a3
{
  id v5;
  NISpatialBrowsingConfiguration *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NISpatialBrowsingConfiguration.mm"), 24, CFSTR("deviceIdentifier cannot be nil."));

  }
  v6 = objc_alloc_init(NISpatialBrowsingConfiguration);
  -[NISpatialBrowsingConfiguration setResponder:](v6, "setResponder:", 1);
  -[NISpatialBrowsingConfiguration setDeviceIdentifier:](v6, "setDeviceIdentifier:", v5);

  return v6;
}

- (NISpatialBrowsingConfiguration)init
{
  NISpatialBrowsingConfiguration *v2;
  NISpatialBrowsingConfiguration *v3;
  NSString *deviceIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NISpatialBrowsingConfiguration;
  v2 = -[NIConfiguration initInternal](&v6, "initInternal");
  v3 = v2;
  if (v2)
  {
    v2->_responder = 0;
    v2->_updatesPolicy = 1;
    deviceIdentifier = v2->_deviceIdentifier;
    v2->_deviceIdentifier = 0;

    v3->_maxNearbyObjectAge = 10.0;
  }
  return v3;
}

+ (id)new
{
  return objc_alloc_init(NISpatialBrowsingConfiguration);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NISpatialBrowsingConfiguration;
  v4 = -[NIConfiguration copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setResponder:", self->_responder);
  objc_msgSend(v4, "setDeviceIdentifier:", self->_deviceIdentifier);
  objc_msgSend(v4, "setUpdatesPolicy:", self->_updatesPolicy);
  objc_msgSend(v4, "setMaxNearbyObjectAge:", self->_maxNearbyObjectAge);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NISpatialBrowsingConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_responder, CFSTR("responder"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("deviceIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_updatesPolicy, CFSTR("updatesPolicy"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maxNearbyObjectAge"), self->_maxNearbyObjectAge);

}

- (NISpatialBrowsingConfiguration)initWithCoder:(id)a3
{
  id v4;
  NISpatialBrowsingConfiguration *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  unsigned __int8 v10;
  double v11;
  double v12;
  NSString *deviceIdentifier;
  NISpatialBrowsingConfiguration *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NISpatialBrowsingConfiguration;
  v5 = -[NIConfiguration initWithCoder:](&v16, "initWithCoder:", v4);
  if (v5 && (v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("updatesPolicy")), (unint64_t)v7 < 2))
  {
    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v6), CFSTR("deviceIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("responder"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxNearbyObjectAge"));
    v12 = v11;
    v5->_responder = v10;
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v9;

    v5->_updatesPolicy = (int64_t)v7;
    v5->_maxNearbyObjectAge = v12;
    v14 = v5;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NISpatialBrowsingConfiguration *v7;
  NISpatialBrowsingConfiguration *v8;
  unsigned int v9;
  int responder;
  id v11;
  int64_t updatesPolicy;
  void *v13;
  BOOL v14;
  char v15;
  void *v16;
  unsigned __int8 v17;
  double v18;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NISpatialBrowsingConfiguration *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v15 = 1;
    }
    else
    {
      v9 = -[NISpatialBrowsingConfiguration isResponder](v7, "isResponder");
      responder = self->_responder;
      v11 = -[NISpatialBrowsingConfiguration updatesPolicy](v8, "updatesPolicy");
      updatesPolicy = self->_updatesPolicy;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NISpatialBrowsingConfiguration deviceIdentifier](v8, "deviceIdentifier"));
      if (v13)
        v14 = 0;
      else
        v14 = self->_deviceIdentifier == 0;

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NISpatialBrowsingConfiguration deviceIdentifier](v8, "deviceIdentifier"));
      v17 = objc_msgSend(v16, "isEqualToString:", self->_deviceIdentifier);

      -[NISpatialBrowsingConfiguration maxNearbyObjectAge](v8, "maxNearbyObjectAge");
      v15 = 0;
      if (responder == v9 && v11 == (id)updatesPolicy)
      {
        if (v18 == self->_maxNearbyObjectAge)
          v15 = v14 | v17;
        else
          v15 = 0;
      }
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  _BOOL8 responder;
  int64_t updatesPolicy;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_deviceIdentifier, "hash");
  responder = self->_responder;
  updatesPolicy = self->_updatesPolicy;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_maxNearbyObjectAge));
  v7 = v3 ^ responder ^ updatesPolicy ^ (unint64_t)objc_msgSend(v6, "hash");

  return v7;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NISpatialBrowsingConfiguration descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  const __CFString *v2;
  const __CFString *v3;

  if (self->_responder)
    v2 = CFSTR("Yes");
  else
    v2 = CFSTR("No");
  if (self->_updatesPolicy == 1)
    v3 = CFSTR("SignificantChanges");
  else
    v3 = CFSTR("Stream");
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<maxNearbyObjectAge: %0.2fsec, isResponder: %@, deviceIdentifier: %@, updatesPolicy: %@>"), *(_QWORD *)&self->_maxNearbyObjectAge, v2, self->_deviceIdentifier, v3));
}

- (int64_t)updatesPolicy
{
  return self->_updatesPolicy;
}

- (void)setUpdatesPolicy:(int64_t)a3
{
  self->_updatesPolicy = a3;
}

- (BOOL)isResponder
{
  return self->_responder;
}

- (void)setResponder:(BOOL)a3
{
  self->_responder = a3;
}

- (NSString)deviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (double)maxNearbyObjectAge
{
  return self->_maxNearbyObjectAge;
}

- (void)setMaxNearbyObjectAge:(double)a3
{
  self->_maxNearbyObjectAge = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
