@implementation FMDNanoSupportProtoNeedSignatureV4

- (BOOL)hasActivationLockRequestUUIDString
{
  return self->_activationLockRequestUUIDString != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDNanoSupportProtoNeedSignatureV4;
  v3 = -[FMDNanoSupportProtoNeedSignatureV4 description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoSupportProtoNeedSignatureV4 dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *requestJsonData;
  NSString *activationLockRequestUUIDString;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  requestJsonData = self->_requestJsonData;
  if (requestJsonData)
    objc_msgSend(v3, "setObject:forKey:", requestJsonData, CFSTR("request_json_data"));
  activationLockRequestUUIDString = self->_activationLockRequestUUIDString;
  if (activationLockRequestUUIDString)
    objc_msgSend(v4, "setObject:forKey:", activationLockRequestUUIDString, CFSTR("activationLockRequestUUIDString"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FMDNanoSupportProtoNeedSignatureV4ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *requestJsonData;
  NSString *activationLockRequestUUIDString;
  id v7;

  v4 = a3;
  requestJsonData = self->_requestJsonData;
  if (!requestJsonData)
    sub_10022DEE4();
  v7 = v4;
  PBDataWriterWriteDataField(v4, requestJsonData, 1);
  activationLockRequestUUIDString = self->_activationLockRequestUUIDString;
  if (activationLockRequestUUIDString)
    PBDataWriterWriteStringField(v7, activationLockRequestUUIDString, 2);

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setRequestJsonData:", self->_requestJsonData);
  if (self->_activationLockRequestUUIDString)
    objc_msgSend(v4, "setActivationLockRequestUUIDString:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_requestJsonData, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_activationLockRequestUUIDString, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  NSData *requestJsonData;
  NSString *activationLockRequestUUIDString;
  unsigned __int8 v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((requestJsonData = self->_requestJsonData, !((unint64_t)requestJsonData | v4[2]))
     || -[NSData isEqual:](requestJsonData, "isEqual:")))
  {
    activationLockRequestUUIDString = self->_activationLockRequestUUIDString;
    if ((unint64_t)activationLockRequestUUIDString | v4[1])
      v8 = -[NSString isEqual:](activationLockRequestUUIDString, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = (unint64_t)-[NSData hash](self->_requestJsonData, "hash");
  return -[NSString hash](self->_activationLockRequestUUIDString, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[FMDNanoSupportProtoNeedSignatureV4 setRequestJsonData:](self, "setRequestJsonData:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[FMDNanoSupportProtoNeedSignatureV4 setActivationLockRequestUUIDString:](self, "setActivationLockRequestUUIDString:");
    v4 = v5;
  }

}

- (NSData)requestJsonData
{
  return self->_requestJsonData;
}

- (void)setRequestJsonData:(id)a3
{
  objc_storeStrong((id *)&self->_requestJsonData, a3);
}

- (NSString)activationLockRequestUUIDString
{
  return self->_activationLockRequestUUIDString;
}

- (void)setActivationLockRequestUUIDString:(id)a3
{
  objc_storeStrong((id *)&self->_activationLockRequestUUIDString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestJsonData, 0);
  objc_storeStrong((id *)&self->_activationLockRequestUUIDString, 0);
}

@end
