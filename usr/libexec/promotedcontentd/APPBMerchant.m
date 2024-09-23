@implementation APPBMerchant

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  PBRepeatedInt32Clear(&self->_supportedPaymentNetworks, a2);
  PBRepeatedInt32Clear(&self->_paymentCapabilities, v3);
  v4.receiver = self;
  v4.super_class = (Class)APPBMerchant;
  -[APPBMerchant dealloc](&v4, "dealloc");
}

- (unint64_t)supportedPaymentNetworksCount
{
  return self->_supportedPaymentNetworks.count;
}

- (int)supportedPaymentNetworks
{
  return self->_supportedPaymentNetworks.list;
}

- (void)clearSupportedPaymentNetworks
{
  PBRepeatedInt32Clear(&self->_supportedPaymentNetworks, a2);
}

- (void)addSupportedPaymentNetworks:(int)a3
{
  PBRepeatedInt32Add(&self->_supportedPaymentNetworks, *(_QWORD *)&a3);
}

- (int)supportedPaymentNetworksAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedPaymentNetworks;
  unint64_t count;
  void *v6;
  void *v7;

  p_supportedPaymentNetworks = &self->_supportedPaymentNetworks;
  count = self->_supportedPaymentNetworks.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_supportedPaymentNetworks->list[a3];
}

- (void)setSupportedPaymentNetworks:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set(&self->_supportedPaymentNetworks, a3, a4);
}

- (id)supportedPaymentNetworksAsString:(int)a3
{
  if (a3 >= 4)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100215318 + a3);
}

- (int)StringAsSupportedPaymentNetworks:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AmericanExpress")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MasterCard")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Visa")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ChinaUnionPay")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)paymentCapabilitiesCount
{
  return self->_paymentCapabilities.count;
}

- (int)paymentCapabilities
{
  return self->_paymentCapabilities.list;
}

- (void)clearPaymentCapabilities
{
  PBRepeatedInt32Clear(&self->_paymentCapabilities, a2);
}

- (void)addPaymentCapabilities:(int)a3
{
  PBRepeatedInt32Add(&self->_paymentCapabilities, *(_QWORD *)&a3);
}

- (int)paymentCapabilitiesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_paymentCapabilities;
  unint64_t count;
  void *v6;
  void *v7;

  p_paymentCapabilities = &self->_paymentCapabilities;
  count = self->_paymentCapabilities.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_paymentCapabilities->list[a3];
}

- (void)setPaymentCapabilities:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set(&self->_paymentCapabilities, a3, a4);
}

- (id)paymentCapabilitiesAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("ThreeDS");
  if (a3 == 1)
    v3 = CFSTR("EMV");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsPaymentCapabilities:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ThreeDS")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("EMV"));

  return v4;
}

- (BOOL)hasPaymentProcessingCertificate
{
  return self->_paymentProcessingCertificate != 0;
}

- (BOOL)hasShippingUpdateURL
{
  return self->_shippingUpdateURL != 0;
}

- (BOOL)hasShippingUpdateCertificate
{
  return self->_shippingUpdateCertificate != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBMerchant;
  v3 = -[APPBMerchant description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBMerchant dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *countryCode;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedPaymentNetworks;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_paymentCapabilities;
  void *v13;
  unint64_t v14;
  int v15;
  __CFString *v16;
  NSString *paymentProcessingURL;
  NSData *paymentProcessingCertificate;
  NSString *shippingUpdateURL;
  NSData *shippingUpdateCertificate;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  countryCode = self->_countryCode;
  if (countryCode)
    objc_msgSend(v4, "setObject:forKey:", countryCode, CFSTR("countryCode"));
  p_supportedPaymentNetworks = &self->_supportedPaymentNetworks;
  if (self->_supportedPaymentNetworks.count)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:"));
    if (self->_supportedPaymentNetworks.count)
    {
      v9 = 0;
      do
      {
        v10 = p_supportedPaymentNetworks->list[v9];
        if (v10 >= 4)
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), p_supportedPaymentNetworks->list[v9]));
        else
          v11 = *(&off_100215318 + v10);
        objc_msgSend(v8, "addObject:", v11);

        ++v9;
      }
      while (v9 < self->_supportedPaymentNetworks.count);
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("supportedPaymentNetworks"));

  }
  p_paymentCapabilities = &self->_paymentCapabilities;
  if (self->_paymentCapabilities.count)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:"));
    if (self->_paymentCapabilities.count)
    {
      v14 = 0;
      do
      {
        v15 = p_paymentCapabilities->list[v14];
        if (v15)
        {
          if (v15 == 1)
            v16 = CFSTR("EMV");
          else
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), p_paymentCapabilities->list[v14]));
        }
        else
        {
          v16 = CFSTR("ThreeDS");
        }
        objc_msgSend(v13, "addObject:", v16);

        ++v14;
      }
      while (v14 < self->_paymentCapabilities.count);
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("paymentCapabilities"));

  }
  paymentProcessingURL = self->_paymentProcessingURL;
  if (paymentProcessingURL)
    objc_msgSend(v4, "setObject:forKey:", paymentProcessingURL, CFSTR("paymentProcessingURL"));
  paymentProcessingCertificate = self->_paymentProcessingCertificate;
  if (paymentProcessingCertificate)
    objc_msgSend(v4, "setObject:forKey:", paymentProcessingCertificate, CFSTR("paymentProcessingCertificate"));
  shippingUpdateURL = self->_shippingUpdateURL;
  if (shippingUpdateURL)
    objc_msgSend(v4, "setObject:forKey:", shippingUpdateURL, CFSTR("shippingUpdateURL"));
  shippingUpdateCertificate = self->_shippingUpdateCertificate;
  if (shippingUpdateCertificate)
    objc_msgSend(v4, "setObject:forKey:", shippingUpdateCertificate, CFSTR("shippingUpdateCertificate"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBMerchantReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *countryCode;
  unint64_t v7;
  unint64_t v8;
  NSString *paymentProcessingURL;
  NSData *paymentProcessingCertificate;
  NSString *shippingUpdateURL;
  NSData *shippingUpdateCertificate;
  void *v13;
  id v14;

  v4 = a3;
  identifier = self->_identifier;
  if (!identifier)
    sub_10017BC44();
  v14 = v4;
  PBDataWriterWriteStringField(v4, identifier, 1);
  countryCode = self->_countryCode;
  if (!countryCode)
    sub_10017BC6C();
  PBDataWriterWriteStringField(v14, countryCode, 2);
  if (self->_supportedPaymentNetworks.count)
  {
    v7 = 0;
    do
      PBDataWriterWriteInt32Field(v14, self->_supportedPaymentNetworks.list[v7++], 3);
    while (v7 < self->_supportedPaymentNetworks.count);
  }
  if (self->_paymentCapabilities.count)
  {
    v8 = 0;
    do
      PBDataWriterWriteInt32Field(v14, self->_paymentCapabilities.list[v8++], 4);
    while (v8 < self->_paymentCapabilities.count);
  }
  paymentProcessingURL = self->_paymentProcessingURL;
  if (!paymentProcessingURL)
    sub_10017BC94();
  PBDataWriterWriteStringField(v14, paymentProcessingURL, 100);
  paymentProcessingCertificate = self->_paymentProcessingCertificate;
  if (paymentProcessingCertificate)
    PBDataWriterWriteDataField(v14, paymentProcessingCertificate, 101);
  shippingUpdateURL = self->_shippingUpdateURL;
  if (shippingUpdateURL)
    PBDataWriterWriteStringField(v14, shippingUpdateURL, 110);
  shippingUpdateCertificate = self->_shippingUpdateCertificate;
  v13 = v14;
  if (shippingUpdateCertificate)
  {
    PBDataWriterWriteDataField(v14, shippingUpdateCertificate, 111);
    v13 = v14;
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "setIdentifier:", self->_identifier);
  objc_msgSend(v11, "setCountryCode:", self->_countryCode);
  if (-[APPBMerchant supportedPaymentNetworksCount](self, "supportedPaymentNetworksCount"))
  {
    objc_msgSend(v11, "clearSupportedPaymentNetworks");
    v4 = -[APPBMerchant supportedPaymentNetworksCount](self, "supportedPaymentNetworksCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v11, "addSupportedPaymentNetworks:", -[APPBMerchant supportedPaymentNetworksAtIndex:](self, "supportedPaymentNetworksAtIndex:", i));
    }
  }
  if (-[APPBMerchant paymentCapabilitiesCount](self, "paymentCapabilitiesCount"))
  {
    objc_msgSend(v11, "clearPaymentCapabilities");
    v7 = -[APPBMerchant paymentCapabilitiesCount](self, "paymentCapabilitiesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v11, "addPaymentCapabilities:", -[APPBMerchant paymentCapabilitiesAtIndex:](self, "paymentCapabilitiesAtIndex:", j));
    }
  }
  objc_msgSend(v11, "setPaymentProcessingURL:", self->_paymentProcessingURL);
  if (self->_paymentProcessingCertificate)
    objc_msgSend(v11, "setPaymentProcessingCertificate:");
  if (self->_shippingUpdateURL)
    objc_msgSend(v11, "setShippingUpdateURL:");
  v10 = v11;
  if (self->_shippingUpdateCertificate)
  {
    objc_msgSend(v11, "setShippingUpdateCertificate:");
    v10 = v11;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[8];
  v5[8] = v6;

  v8 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v9 = (void *)v5[7];
  v5[7] = v8;

  PBRepeatedInt32Copy(v5 + 4, &self->_supportedPaymentNetworks);
  PBRepeatedInt32Copy(v5 + 1, &self->_paymentCapabilities);
  v10 = -[NSString copyWithZone:](self->_paymentProcessingURL, "copyWithZone:", a3);
  v11 = (void *)v5[10];
  v5[10] = v10;

  v12 = -[NSData copyWithZone:](self->_paymentProcessingCertificate, "copyWithZone:", a3);
  v13 = (void *)v5[9];
  v5[9] = v12;

  v14 = -[NSString copyWithZone:](self->_shippingUpdateURL, "copyWithZone:", a3);
  v15 = (void *)v5[12];
  v5[12] = v14;

  v16 = -[NSData copyWithZone:](self->_shippingUpdateCertificate, "copyWithZone:", a3);
  v17 = (void *)v5[11];
  v5[11] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *countryCode;
  NSString *paymentProcessingURL;
  NSData *paymentProcessingCertificate;
  NSString *shippingUpdateURL;
  NSData *shippingUpdateCertificate;
  unsigned __int8 v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[8]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((countryCode = self->_countryCode, !((unint64_t)countryCode | v4[7]))
     || -[NSString isEqual:](countryCode, "isEqual:"))
    && PBRepeatedInt32IsEqual(&self->_supportedPaymentNetworks, v4 + 4)
    && PBRepeatedInt32IsEqual(&self->_paymentCapabilities, v4 + 1)
    && ((paymentProcessingURL = self->_paymentProcessingURL, !((unint64_t)paymentProcessingURL | v4[10]))
     || -[NSString isEqual:](paymentProcessingURL, "isEqual:"))
    && ((paymentProcessingCertificate = self->_paymentProcessingCertificate,
         !((unint64_t)paymentProcessingCertificate | v4[9]))
     || -[NSData isEqual:](paymentProcessingCertificate, "isEqual:"))
    && ((shippingUpdateURL = self->_shippingUpdateURL, !((unint64_t)shippingUpdateURL | v4[12]))
     || -[NSString isEqual:](shippingUpdateURL, "isEqual:")))
  {
    shippingUpdateCertificate = self->_shippingUpdateCertificate;
    if ((unint64_t)shippingUpdateCertificate | v4[11])
      v11 = -[NSData isEqual:](shippingUpdateCertificate, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_countryCode, "hash") ^ v3;
  v5 = PBRepeatedInt32Hash(&self->_supportedPaymentNetworks);
  v6 = v5 ^ PBRepeatedInt32Hash(&self->_paymentCapabilities);
  v7 = v4 ^ v6 ^ -[NSString hash](self->_paymentProcessingURL, "hash");
  v8 = (unint64_t)-[NSData hash](self->_paymentProcessingCertificate, "hash");
  v9 = v8 ^ -[NSString hash](self->_shippingUpdateURL, "hash");
  return v7 ^ v9 ^ (unint64_t)-[NSData hash](self->_shippingUpdateCertificate, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char *v5;
  char *v6;
  char *i;
  char *v8;
  char *v9;
  char *j;
  _QWORD *v11;
  _QWORD *v12;

  v4 = a3;
  v12 = v4;
  if (v4[8])
  {
    -[APPBMerchant setIdentifier:](self, "setIdentifier:");
    v4 = v12;
  }
  if (v4[7])
  {
    -[APPBMerchant setCountryCode:](self, "setCountryCode:");
    v4 = v12;
  }
  v5 = (char *)objc_msgSend(v4, "supportedPaymentNetworksCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[APPBMerchant addSupportedPaymentNetworks:](self, "addSupportedPaymentNetworks:", objc_msgSend(v12, "supportedPaymentNetworksAtIndex:", i));
  }
  v8 = (char *)objc_msgSend(v12, "paymentCapabilitiesCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[APPBMerchant addPaymentCapabilities:](self, "addPaymentCapabilities:", objc_msgSend(v12, "paymentCapabilitiesAtIndex:", j));
  }
  v11 = v12;
  if (v12[10])
  {
    -[APPBMerchant setPaymentProcessingURL:](self, "setPaymentProcessingURL:");
    v11 = v12;
  }
  if (v11[9])
  {
    -[APPBMerchant setPaymentProcessingCertificate:](self, "setPaymentProcessingCertificate:");
    v11 = v12;
  }
  if (v11[12])
  {
    -[APPBMerchant setShippingUpdateURL:](self, "setShippingUpdateURL:");
    v11 = v12;
  }
  if (v11[11])
  {
    -[APPBMerchant setShippingUpdateCertificate:](self, "setShippingUpdateCertificate:");
    v11 = v12;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSString)paymentProcessingURL
{
  return self->_paymentProcessingURL;
}

- (void)setPaymentProcessingURL:(id)a3
{
  objc_storeStrong((id *)&self->_paymentProcessingURL, a3);
}

- (NSData)paymentProcessingCertificate
{
  return self->_paymentProcessingCertificate;
}

- (void)setPaymentProcessingCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_paymentProcessingCertificate, a3);
}

- (NSString)shippingUpdateURL
{
  return self->_shippingUpdateURL;
}

- (void)setShippingUpdateURL:(id)a3
{
  objc_storeStrong((id *)&self->_shippingUpdateURL, a3);
}

- (NSData)shippingUpdateCertificate
{
  return self->_shippingUpdateCertificate;
}

- (void)setShippingUpdateCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_shippingUpdateCertificate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shippingUpdateURL, 0);
  objc_storeStrong((id *)&self->_shippingUpdateCertificate, 0);
  objc_storeStrong((id *)&self->_paymentProcessingURL, 0);
  objc_storeStrong((id *)&self->_paymentProcessingCertificate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
