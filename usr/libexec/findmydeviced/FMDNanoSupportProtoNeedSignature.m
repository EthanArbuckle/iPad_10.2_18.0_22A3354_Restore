@implementation FMDNanoSupportProtoNeedSignature

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDNanoSupportProtoNeedSignature;
  v3 = -[FMDNanoSupportProtoNeedSignature description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoSupportProtoNeedSignature dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *dsid;
  NSString *udid;
  NSString *serialNumber;
  NSString *productType;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  dsid = self->_dsid;
  if (dsid)
    objc_msgSend(v3, "setObject:forKey:", dsid, CFSTR("dsid"));
  udid = self->_udid;
  if (udid)
    objc_msgSend(v4, "setObject:forKey:", udid, CFSTR("udid"));
  serialNumber = self->_serialNumber;
  if (serialNumber)
    objc_msgSend(v4, "setObject:forKey:", serialNumber, CFSTR("serial_number"));
  productType = self->_productType;
  if (productType)
    objc_msgSend(v4, "setObject:forKey:", productType, CFSTR("product_type"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FMDNanoSupportProtoNeedSignatureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *dsid;
  NSString *udid;
  NSString *serialNumber;
  NSString *productType;
  id v8;

  v8 = a3;
  dsid = self->_dsid;
  if (!dsid)
    sub_10022DF34();
  PBDataWriterWriteStringField(v8, dsid, 1);
  udid = self->_udid;
  if (!udid)
    sub_10022DF5C();
  PBDataWriterWriteStringField(v8, udid, 2);
  serialNumber = self->_serialNumber;
  if (!serialNumber)
    sub_10022DF84();
  PBDataWriterWriteStringField(v8, serialNumber, 3);
  productType = self->_productType;
  if (!productType)
    sub_10022DFAC();
  PBDataWriterWriteStringField(v8, productType, 4);

}

- (void)copyTo:(id)a3
{
  NSString *dsid;
  id v5;

  dsid = self->_dsid;
  v5 = a3;
  objc_msgSend(v5, "setDsid:", dsid);
  objc_msgSend(v5, "setUdid:", self->_udid);
  objc_msgSend(v5, "setSerialNumber:", self->_serialNumber);
  objc_msgSend(v5, "setProductType:", self->_productType);

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

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_dsid, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_udid, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  NSString *dsid;
  NSString *udid;
  NSString *serialNumber;
  NSString *productType;
  unsigned __int8 v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((dsid = self->_dsid, !((unint64_t)dsid | v4[1])) || -[NSString isEqual:](dsid, "isEqual:"))
    && ((udid = self->_udid, !((unint64_t)udid | v4[4])) || -[NSString isEqual:](udid, "isEqual:"))
    && ((serialNumber = self->_serialNumber, !((unint64_t)serialNumber | v4[3]))
     || -[NSString isEqual:](serialNumber, "isEqual:")))
  {
    productType = self->_productType;
    if ((unint64_t)productType | v4[2])
      v10 = -[NSString isEqual:](productType, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_dsid, "hash");
  v4 = -[NSString hash](self->_udid, "hash") ^ v3;
  v5 = -[NSString hash](self->_serialNumber, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_productType, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[FMDNanoSupportProtoNeedSignature setDsid:](self, "setDsid:");
  if (v4[4])
    -[FMDNanoSupportProtoNeedSignature setUdid:](self, "setUdid:");
  if (v4[3])
    -[FMDNanoSupportProtoNeedSignature setSerialNumber:](self, "setSerialNumber:");
  if (v4[2])
    -[FMDNanoSupportProtoNeedSignature setProductType:](self, "setProductType:");

}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_storeStrong((id *)&self->_dsid, a3);
}

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
  objc_storeStrong((id *)&self->_udid, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_udid, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
