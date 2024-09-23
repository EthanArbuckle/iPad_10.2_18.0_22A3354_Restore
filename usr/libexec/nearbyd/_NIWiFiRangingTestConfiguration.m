@implementation _NIWiFiRangingTestConfiguration

- (_NIWiFiRangingTestConfiguration)initWithDiscoveryToken:(id)a3 wifiRangingParameters:(id)a4 regions:(id)a5
{
  id v9;
  id v10;
  id v11;
  id *v12;
  _NIWiFiRangingTestConfiguration *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_NIWiFiRangingTestConfiguration;
  v12 = -[NIConfiguration initInternal](&v15, "initInternal");
  v13 = (_NIWiFiRangingTestConfiguration *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 4, a3);
    objc_storeStrong((id *)&v13->_parameters, a4);
    objc_storeStrong((id *)&v13->_monitoredRegions, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSDictionary *v8;
  void *v9;
  NSArray *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_NIWiFiRangingTestConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v13, "copyWithZone:");
  v6 = -[NIDiscoveryToken copyWithZone:](self->_peerDiscoveryToken, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  if (self->_parameters)
  {
    v8 = -[NSDictionary initWithDictionary:copyItems:](+[NSDictionary allocWithZone:](NSDictionary, "allocWithZone:", a3), "initWithDictionary:copyItems:", self->_parameters, 1);
    v9 = (void *)v5[5];
    v5[5] = v8;

  }
  if (self->_monitoredRegions)
  {
    v10 = -[NSArray initWithArray:copyItems:](+[NSArray allocWithZone:](NSArray, "allocWithZone:", a3), "initWithArray:copyItems:", self->_monitoredRegions, 1);
    v11 = (void *)v5[6];
    v5[6] = v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_NIWiFiRangingTestConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_peerDiscoveryToken, CFSTR("peerDiscoveryToken"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_parameters, CFSTR("parameters"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_monitoredRegions, CFSTR("monitoredRegions"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NIWiFiRangingTestConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  NSSet *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _NIWiFiRangingTestConfiguration *v21;
  id v22;
  uint64_t v23;
  NIDiscoveryToken *peerDiscoveryToken;
  uint64_t v25;
  NSDictionary *parameters;
  objc_super v28;
  _QWORD v29[2];

  v4 = a3;
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSString, v5), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_opt_class(NSString, v8);
  v11 = objc_opt_class(NSNumber, v10);
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v11, objc_opt_class(NSData, v12), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v29[0] = objc_opt_class(NSArray, v15);
  v29[1] = objc_opt_class(NIRegionPredicate, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("monitoredRegions")));

  v28.receiver = self;
  v28.super_class = (Class)_NIWiFiRangingTestConfiguration;
  v21 = -[NIConfiguration initWithCoder:](&v28, "initWithCoder:", v4);
  if (v21)
  {
    v22 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NIDiscoveryToken, v20), CFSTR("peerDiscoveryToken"));
    v23 = objc_claimAutoreleasedReturnValue(v22);
    peerDiscoveryToken = v21->_peerDiscoveryToken;
    v21->_peerDiscoveryToken = (NIDiscoveryToken *)v23;

    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v7, v14, CFSTR("parameters")));
    parameters = v21->_parameters;
    v21->_parameters = (NSDictionary *)v25;

    objc_storeStrong((id *)&v21->_monitoredRegions, v19);
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _NIWiFiRangingTestConfiguration *v7;
  _NIWiFiRangingTestConfiguration *v8;
  NSDictionary *parameters;
  void *v10;
  NIDiscoveryToken *peerDiscoveryToken;
  void *v12;
  NSArray *monitoredRegions;
  void *v14;
  unsigned __int8 v15;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (_NIWiFiRangingTestConfiguration *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v15 = 1;
    }
    else
    {
      parameters = self->_parameters;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration parameters](v7, "parameters"));
      if (-[NSDictionary isEqual:](parameters, "isEqual:", v10))
      {
        peerDiscoveryToken = self->_peerDiscoveryToken;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration peerDiscoveryToken](v8, "peerDiscoveryToken"));
        if (-[NIDiscoveryToken isEqual:](peerDiscoveryToken, "isEqual:", v12))
        {
          monitoredRegions = self->_monitoredRegions;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration monitoredRegions](v8, "monitoredRegions"));
          v15 = -[NSArray isEqual:](monitoredRegions, "isEqual:", v14);

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
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
  unint64_t v3;

  v3 = -[NIDiscoveryToken hash](self->_peerDiscoveryToken, "hash");
  return (unint64_t)-[NSDictionary hash](self->_parameters, "hash") ^ v3;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_NIWiFiRangingTestConfiguration descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  id v3;
  NIDiscoveryToken *peerDiscoveryToken;
  void *v5;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", &stru_10081D5E0);
  peerDiscoveryToken = self->_peerDiscoveryToken;
  if (peerDiscoveryToken)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](peerDiscoveryToken, "descriptionInternal"));
    objc_msgSend(v3, "appendFormat:", CFSTR("Peer Token: %@"), v5);

  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR("Peer Token: null"));
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(", WiFi Ranging Parameters: %@"), self->_parameters);
  objc_msgSend(v3, "appendFormat:", CFSTR(", Regions: %@"), self->_monitoredRegions);
  return v3;
}

- (NIDiscoveryToken)peerDiscoveryToken
{
  return self->_peerDiscoveryToken;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSArray)monitoredRegions
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMonitoredRegions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredRegions, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_peerDiscoveryToken, 0);
}

@end
