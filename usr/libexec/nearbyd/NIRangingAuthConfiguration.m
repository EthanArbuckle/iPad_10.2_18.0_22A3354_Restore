@implementation NIRangingAuthConfiguration

- (id)initAsResponder:(BOOL)a3 macAddress:(id)a4 key:(id)a5
{
  id v9;
  id v10;
  id *v11;
  id *v12;
  id v13;
  void *v14;
  void *Data;
  NIDiscoveryToken *v16;
  id v17;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NIRangingAuthConfiguration;
  v11 = -[NIConfiguration initInternal](&v19, "initInternal");
  v12 = v11;
  if (v11)
  {
    *((_BYTE *)v11 + 32) = a3;
    objc_storeStrong(v11 + 6, a4);
    objc_storeStrong(v12 + 7, a5);
    v20[0] = &off_10082C2C8;
    v13 = v12[6];
    v20[1] = &off_10082C2E0;
    v21[0] = v13;
    v21[1] = v12[7];
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    Data = (void *)OPACKEncoderCreateData(v14, 8, 0);
    v16 = -[NIDiscoveryToken initWithBytes:]([NIDiscoveryToken alloc], "initWithBytes:", Data);
    v17 = v12[5];
    v12[5] = v16;

  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NIRangingAuthConfiguration;
  v4 = -[NIConfiguration copyWithZone:](&v12, "copyWithZone:", a3);
  v4[32] = self->_isResponder;
  v5 = -[NIDiscoveryToken copy](self->_peerToken, "copy");
  v6 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = v5;

  v7 = -[NSData copy](self->_macAddress, "copy");
  v8 = (void *)*((_QWORD *)v4 + 6);
  *((_QWORD *)v4 + 6) = v7;

  v9 = -[NSData copy](self->_secureKey, "copy");
  v10 = (void *)*((_QWORD *)v4 + 7);
  *((_QWORD *)v4 + 7) = v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NIRangingAuthConfiguration;
  -[NIConfiguration encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isResponder, CFSTR("isResponder"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_macAddress, CFSTR("macAddress"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_secureKey, CFSTR("secureKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_peerToken, CFSTR("peerToken"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NIRangingAuthConfiguration)initWithCoder:(id)a3
{
  id v4;
  NIRangingAuthConfiguration *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NIRangingAuthConfiguration *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NIRangingAuthConfiguration;
  v5 = -[NIConfiguration initWithCoder:](&v19, "initWithCoder:", v4);
  if (v5)
  {
    v5->_isResponder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isResponder"));
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v6), CFSTR("macAddress"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v9), CFSTR("secureKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NIDiscoveryToken, v12), CFSTR("peerToken"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v15 && (v16 = objc_opt_class(NIDiscoveryToken, v14), (objc_opt_isKindOfClass(v15, v16) & 1) == 0))
    {
      v17 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v5->_macAddress, v8);
      objc_storeStrong((id *)&v5->_secureKey, v11);
      objc_storeStrong((id *)&v5->_peerToken, v15);
      v17 = v5;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NIRangingAuthConfiguration *v7;
  NIRangingAuthConfiguration *v8;
  int isResponder;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned __int8 v14;
  unint64_t peerToken;
  BOOL v16;
  unsigned __int8 v17;
  unsigned int v18;
  char v19;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIRangingAuthConfiguration *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v19 = 1;
    }
    else
    {
      isResponder = self->_isResponder;
      v10 = -[NIRangingAuthConfiguration isResponder](v7, "isResponder");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIRangingAuthConfiguration macAddress](v8, "macAddress"));
      v12 = objc_msgSend(v11, "isEqualToData:", self->_macAddress);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIRangingAuthConfiguration secureKey](v8, "secureKey"));
      v14 = objc_msgSend(v13, "isEqualToData:", self->_secureKey);

      peerToken = (unint64_t)v8->_peerToken;
      v16 = (peerToken | (unint64_t)self->_peerToken) == 0;
      v17 = objc_msgSend((id)peerToken, "isEqual:");
      if (isResponder == v10)
        v18 = v12;
      else
        v18 = 0;
      if (v18 == 1)
        v19 = v14 & (v16 | v17);
      else
        v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  _BOOL8 isResponder;
  unint64_t v4;
  unint64_t v5;

  isResponder = self->_isResponder;
  v4 = (unint64_t)-[NSData hash](self->_macAddress, "hash") ^ isResponder;
  v5 = (unint64_t)-[NSData hash](self->_secureKey, "hash");
  return v4 ^ v5 ^ -[NIDiscoveryToken hash](self->_peerToken, "hash");
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIRangingAuthConfiguration descriptionInternal](self, "descriptionInternal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@>"), v5, v6));

  return v7;
}

- (id)descriptionInternal
{
  const __CFString *v2;
  void *v3;
  void *v4;

  if (self->_isResponder)
    v2 = CFSTR("Yes");
  else
    v2 = CFSTR("No");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_peerToken, "descriptionInternal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(", isResponder: %@, peerToken: %@"), v2, v3));

  return v4;
}

- (BOOL)isResponder
{
  return self->_isResponder;
}

- (NIDiscoveryToken)peerToken
{
  return self->_peerToken;
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (NSData)secureKey
{
  return self->_secureKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureKey, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_peerToken, 0);
}

@end
