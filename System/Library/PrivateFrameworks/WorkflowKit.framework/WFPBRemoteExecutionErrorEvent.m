@implementation WFPBRemoteExecutionErrorEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("RemoteExecutionError");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (BOOL)hasDestinationType
{
  return self->_destinationType != 0;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFPBRemoteExecutionErrorEvent;
  -[WFPBRemoteExecutionErrorEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBRemoteExecutionErrorEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  NSString *source;
  NSString *destinationType;
  NSString *errorDomain;
  NSString *errorCode;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  source = self->_source;
  if (source)
    objc_msgSend(v4, "setObject:forKey:", source, CFSTR("source"));
  destinationType = self->_destinationType;
  if (destinationType)
    objc_msgSend(v4, "setObject:forKey:", destinationType, CFSTR("destinationType"));
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v4, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  errorCode = self->_errorCode;
  if (errorCode)
    objc_msgSend(v4, "setObject:forKey:", errorCode, CFSTR("errorCode"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBRemoteExecutionErrorEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_destinationType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_errorCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v5;
  }
  if (self->_source)
  {
    objc_msgSend(v5, "setSource:");
    v4 = v5;
  }
  if (self->_destinationType)
  {
    objc_msgSend(v5, "setDestinationType:");
    v4 = v5;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v5, "setErrorDomain:");
    v4 = v5;
  }
  if (self->_errorCode)
  {
    objc_msgSend(v5, "setErrorCode:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_source, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v10 = -[NSString copyWithZone:](self->_destinationType, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[NSString copyWithZone:](self->_errorCode, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  NSString *source;
  NSString *destinationType;
  NSString *errorDomain;
  NSString *errorCode;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((key = self->_key, !((unint64_t)key | v4[4])) || -[NSString isEqual:](key, "isEqual:"))
    && ((source = self->_source, !((unint64_t)source | v4[5]))
     || -[NSString isEqual:](source, "isEqual:"))
    && ((destinationType = self->_destinationType, !((unint64_t)destinationType | v4[1]))
     || -[NSString isEqual:](destinationType, "isEqual:"))
    && ((errorDomain = self->_errorDomain, !((unint64_t)errorDomain | v4[3]))
     || -[NSString isEqual:](errorDomain, "isEqual:")))
  {
    errorCode = self->_errorCode;
    if ((unint64_t)errorCode | v4[2])
      v10 = -[NSString isEqual:](errorCode, "isEqual:");
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
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_source, "hash") ^ v3;
  v5 = -[NSString hash](self->_destinationType, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_errorDomain, "hash");
  return v6 ^ -[NSString hash](self->_errorCode, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[4])
    -[WFPBRemoteExecutionErrorEvent setKey:](self, "setKey:");
  if (v4[5])
    -[WFPBRemoteExecutionErrorEvent setSource:](self, "setSource:");
  if (v4[1])
    -[WFPBRemoteExecutionErrorEvent setDestinationType:](self, "setDestinationType:");
  if (v4[3])
    -[WFPBRemoteExecutionErrorEvent setErrorDomain:](self, "setErrorDomain:");
  if (v4[2])
    -[WFPBRemoteExecutionErrorEvent setErrorCode:](self, "setErrorCode:");

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSString)destinationType
{
  return self->_destinationType;
}

- (void)setDestinationType:(id)a3
{
  objc_storeStrong((id *)&self->_destinationType, a3);
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_errorCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_destinationType, 0);
}

@end
