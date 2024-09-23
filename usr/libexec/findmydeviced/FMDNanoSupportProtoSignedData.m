@implementation FMDNanoSupportProtoSignedData

- (BOOL)hasSignedData
{
  return self->_signedData != 0;
}

- (BOOL)hasUdid
{
  return self->_udid != 0;
}

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (BOOL)hasTimeStampMillis
{
  return self->_timeStampMillis != 0;
}

- (BOOL)hasImei
{
  return self->_imei != 0;
}

- (BOOL)hasMeid
{
  return self->_meid != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDNanoSupportProtoSignedData;
  v3 = -[FMDNanoSupportProtoSignedData description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoSupportProtoSignedData dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *signedData;
  NSString *udid;
  NSString *serialNumber;
  NSString *productType;
  NSString *timeStampMillis;
  NSString *imei;
  NSString *meid;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_errorOccurred));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("error_occurred"));

  signedData = self->_signedData;
  if (signedData)
    objc_msgSend(v3, "setObject:forKey:", signedData, CFSTR("signed_data"));
  udid = self->_udid;
  if (udid)
    objc_msgSend(v3, "setObject:forKey:", udid, CFSTR("udid"));
  serialNumber = self->_serialNumber;
  if (serialNumber)
    objc_msgSend(v3, "setObject:forKey:", serialNumber, CFSTR("serial_number"));
  productType = self->_productType;
  if (productType)
    objc_msgSend(v3, "setObject:forKey:", productType, CFSTR("product_type"));
  timeStampMillis = self->_timeStampMillis;
  if (timeStampMillis)
    objc_msgSend(v3, "setObject:forKey:", timeStampMillis, CFSTR("time_stamp_millis"));
  imei = self->_imei;
  if (imei)
    objc_msgSend(v3, "setObject:forKey:", imei, CFSTR("imei"));
  meid = self->_meid;
  if (meid)
    objc_msgSend(v3, "setObject:forKey:", meid, CFSTR("meid"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FMDNanoSupportProtoSignedDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSData *signedData;
  NSString *udid;
  NSString *serialNumber;
  void *v7;
  NSString *productType;
  NSString *timeStampMillis;
  NSString *imei;
  NSString *meid;
  id v12;

  v12 = a3;
  PBDataWriterWriteBOOLField();
  signedData = self->_signedData;
  if (signedData)
    PBDataWriterWriteDataField(v12, signedData, 2);
  udid = self->_udid;
  if (udid)
    PBDataWriterWriteStringField(v12, udid, 3);
  serialNumber = self->_serialNumber;
  v7 = v12;
  if (serialNumber)
  {
    PBDataWriterWriteStringField(v12, serialNumber, 4);
    v7 = v12;
  }
  productType = self->_productType;
  if (productType)
  {
    PBDataWriterWriteStringField(v12, productType, 5);
    v7 = v12;
  }
  timeStampMillis = self->_timeStampMillis;
  if (timeStampMillis)
  {
    PBDataWriterWriteStringField(v12, timeStampMillis, 6);
    v7 = v12;
  }
  imei = self->_imei;
  if (imei)
  {
    PBDataWriterWriteStringField(v12, imei, 7);
    v7 = v12;
  }
  meid = self->_meid;
  if (meid)
  {
    PBDataWriterWriteStringField(v12, meid, 8);
    v7 = v12;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v4[64] = self->_errorOccurred;
  v5 = v4;
  if (self->_signedData)
  {
    objc_msgSend(v4, "setSignedData:");
    v4 = v5;
  }
  if (self->_udid)
  {
    objc_msgSend(v5, "setUdid:");
    v4 = v5;
  }
  if (self->_serialNumber)
  {
    objc_msgSend(v5, "setSerialNumber:");
    v4 = v5;
  }
  if (self->_productType)
  {
    objc_msgSend(v5, "setProductType:");
    v4 = v5;
  }
  if (self->_timeStampMillis)
  {
    objc_msgSend(v5, "setTimeStampMillis:");
    v4 = v5;
  }
  if (self->_imei)
  {
    objc_msgSend(v5, "setImei:");
    v4 = v5;
  }
  if (self->_meid)
  {
    objc_msgSend(v5, "setMeid:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
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
  id v18;
  void *v19;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5[64] = self->_errorOccurred;
  v6 = -[NSData copyWithZone:](self->_signedData, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v6;

  v8 = -[NSString copyWithZone:](self->_udid, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v5 + 7);
  *((_QWORD *)v5 + 7) = v8;

  v10 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v11 = (void *)*((_QWORD *)v5 + 4);
  *((_QWORD *)v5 + 4) = v10;

  v12 = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);
  v13 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v12;

  v14 = -[NSString copyWithZone:](self->_timeStampMillis, "copyWithZone:", a3);
  v15 = (void *)*((_QWORD *)v5 + 6);
  *((_QWORD *)v5 + 6) = v14;

  v16 = -[NSString copyWithZone:](self->_imei, "copyWithZone:", a3);
  v17 = (void *)*((_QWORD *)v5 + 1);
  *((_QWORD *)v5 + 1) = v16;

  v18 = -[NSString copyWithZone:](self->_meid, "copyWithZone:", a3);
  v19 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSData *signedData;
  NSString *udid;
  NSString *serialNumber;
  NSString *productType;
  NSString *timeStampMillis;
  NSString *imei;
  NSString *meid;
  unsigned __int8 v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_20;
  if (self->_errorOccurred)
  {
    if (!*((_BYTE *)v4 + 64))
      goto LABEL_20;
  }
  else if (*((_BYTE *)v4 + 64))
  {
LABEL_20:
    v13 = 0;
    goto LABEL_21;
  }
  signedData = self->_signedData;
  if ((unint64_t)signedData | *((_QWORD *)v4 + 5) && !-[NSData isEqual:](signedData, "isEqual:"))
    goto LABEL_20;
  udid = self->_udid;
  if ((unint64_t)udid | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](udid, "isEqual:"))
      goto LABEL_20;
  }
  serialNumber = self->_serialNumber;
  if ((unint64_t)serialNumber | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](serialNumber, "isEqual:"))
      goto LABEL_20;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](productType, "isEqual:"))
      goto LABEL_20;
  }
  timeStampMillis = self->_timeStampMillis;
  if ((unint64_t)timeStampMillis | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](timeStampMillis, "isEqual:"))
      goto LABEL_20;
  }
  imei = self->_imei;
  if ((unint64_t)imei | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](imei, "isEqual:"))
      goto LABEL_20;
  }
  meid = self->_meid;
  if ((unint64_t)meid | *((_QWORD *)v4 + 2))
    v13 = -[NSString isEqual:](meid, "isEqual:");
  else
    v13 = 1;
LABEL_21:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;

  v3 = 2654435761 * self->_errorOccurred;
  v4 = (unint64_t)-[NSData hash](self->_signedData, "hash");
  v5 = v4 ^ -[NSString hash](self->_udid, "hash");
  v6 = v5 ^ -[NSString hash](self->_serialNumber, "hash");
  v7 = v6 ^ -[NSString hash](self->_productType, "hash") ^ v3;
  v8 = -[NSString hash](self->_timeStampMillis, "hash");
  v9 = v8 ^ -[NSString hash](self->_imei, "hash");
  return v7 ^ v9 ^ -[NSString hash](self->_meid, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _QWORD *v5;

  v4 = a3;
  self->_errorOccurred = v4[64];
  v5 = v4;
  if (*((_QWORD *)v4 + 5))
    -[FMDNanoSupportProtoSignedData setSignedData:](self, "setSignedData:");
  if (v5[7])
    -[FMDNanoSupportProtoSignedData setUdid:](self, "setUdid:");
  if (v5[4])
    -[FMDNanoSupportProtoSignedData setSerialNumber:](self, "setSerialNumber:");
  if (v5[3])
    -[FMDNanoSupportProtoSignedData setProductType:](self, "setProductType:");
  if (v5[6])
    -[FMDNanoSupportProtoSignedData setTimeStampMillis:](self, "setTimeStampMillis:");
  if (v5[1])
    -[FMDNanoSupportProtoSignedData setImei:](self, "setImei:");
  if (v5[2])
    -[FMDNanoSupportProtoSignedData setMeid:](self, "setMeid:");

}

- (BOOL)errorOccurred
{
  return self->_errorOccurred;
}

- (void)setErrorOccurred:(BOOL)a3
{
  self->_errorOccurred = a3;
}

- (NSData)signedData
{
  return self->_signedData;
}

- (void)setSignedData:(id)a3
{
  objc_storeStrong((id *)&self->_signedData, a3);
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

- (NSString)timeStampMillis
{
  return self->_timeStampMillis;
}

- (void)setTimeStampMillis:(id)a3
{
  objc_storeStrong((id *)&self->_timeStampMillis, a3);
}

- (NSString)imei
{
  return self->_imei;
}

- (void)setImei:(id)a3
{
  objc_storeStrong((id *)&self->_imei, a3);
}

- (NSString)meid
{
  return self->_meid;
}

- (void)setMeid:(id)a3
{
  objc_storeStrong((id *)&self->_meid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_udid, 0);
  objc_storeStrong((id *)&self->_timeStampMillis, 0);
  objc_storeStrong((id *)&self->_signedData, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_meid, 0);
  objc_storeStrong((id *)&self->_imei, 0);
}

@end
