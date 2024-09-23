@implementation PBBProtoHandleActivationData

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoHandleActivationData;
  -[PBBProtoHandleActivationData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoHandleActivationData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *activationData;
  NSData *responseHeaders;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  activationData = self->_activationData;
  if (activationData)
    objc_msgSend(v3, "setObject:forKey:", activationData, CFSTR("activationData"));
  responseHeaders = self->_responseHeaders;
  if (responseHeaders)
    objc_msgSend(v4, "setObject:forKey:", responseHeaders, CFSTR("responseHeaders"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoHandleActivationDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteDataField();
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  NSData *activationData;
  id v5;

  activationData = self->_activationData;
  v5 = a3;
  objc_msgSend(v5, "setActivationData:", activationData);
  objc_msgSend(v5, "setResponseHeaders:", self->_responseHeaders);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_activationData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_responseHeaders, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *activationData;
  NSData *responseHeaders;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((activationData = self->_activationData, !((unint64_t)activationData | v4[1]))
     || -[NSData isEqual:](activationData, "isEqual:")))
  {
    responseHeaders = self->_responseHeaders;
    if ((unint64_t)responseHeaders | v4[2])
      v7 = -[NSData isEqual:](responseHeaders, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSData hash](self->_activationData, "hash");
  return -[NSData hash](self->_responseHeaders, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[PBBProtoHandleActivationData setActivationData:](self, "setActivationData:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[PBBProtoHandleActivationData setResponseHeaders:](self, "setResponseHeaders:");
    v4 = v5;
  }

}

- (NSData)activationData
{
  return self->_activationData;
}

- (void)setActivationData:(id)a3
{
  objc_storeStrong((id *)&self->_activationData, a3);
}

- (NSData)responseHeaders
{
  return self->_responseHeaders;
}

- (void)setResponseHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_responseHeaders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_activationData, 0);
}

@end
