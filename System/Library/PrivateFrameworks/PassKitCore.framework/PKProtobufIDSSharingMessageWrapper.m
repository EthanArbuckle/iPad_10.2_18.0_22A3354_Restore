@implementation PKProtobufIDSSharingMessageWrapper

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufIDSSharingMessageWrapper;
  -[PKProtobufIDSSharingMessageWrapper description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufIDSSharingMessageWrapper dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sessionIdentifier;
  NSData *underlyingMessageData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  underlyingMessageData = self->_underlyingMessageData;
  if (underlyingMessageData)
    objc_msgSend(v3, "setObject:forKey:", underlyingMessageData, CFSTR("underlyingMessageData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufIDSSharingMessageWrapperReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteStringField();
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  NSString *sessionIdentifier;
  id v5;

  *((_DWORD *)a3 + 6) = self->_version;
  sessionIdentifier = self->_sessionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "setSessionIdentifier:", sessionIdentifier);
  objc_msgSend(v5, "setUnderlyingMessageData:", self->_underlyingMessageData);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_version;
  v6 = -[NSString copyWithZone:](self->_sessionIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSData copyWithZone:](self->_underlyingMessageData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *sessionIdentifier;
  NSData *underlyingMessageData;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_version == *((_DWORD *)v4 + 6)
    && ((sessionIdentifier = self->_sessionIdentifier, !((unint64_t)sessionIdentifier | v4[1]))
     || -[NSString isEqual:](sessionIdentifier, "isEqual:")))
  {
    underlyingMessageData = self->_underlyingMessageData;
    if ((unint64_t)underlyingMessageData | v4[2])
      v7 = -[NSData isEqual:](underlyingMessageData, "isEqual:");
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
  NSUInteger v4;

  v3 = 2654435761 * self->_version;
  v4 = -[NSString hash](self->_sessionIdentifier, "hash");
  return v4 ^ -[NSData hash](self->_underlyingMessageData, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  self->_version = v4[6];
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[PKProtobufIDSSharingMessageWrapper setSessionIdentifier:](self, "setSessionIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[PKProtobufIDSSharingMessageWrapper setUnderlyingMessageData:](self, "setUnderlyingMessageData:");
    v4 = v5;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (NSData)underlyingMessageData
{
  return self->_underlyingMessageData;
}

- (void)setUnderlyingMessageData:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingMessageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingMessageData, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
