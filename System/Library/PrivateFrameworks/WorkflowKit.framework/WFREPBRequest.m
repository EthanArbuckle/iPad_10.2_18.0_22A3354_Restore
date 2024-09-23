@implementation WFREPBRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFREPBRequest;
  -[WFREPBRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  void *v6;
  NSData *message;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_version);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("version"));

  message = self->_message;
  if (message)
    objc_msgSend(v4, "setObject:forKey:", message, CFSTR("message"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_identifier)
    __assert_rtn("-[WFREPBRequest writeTo:]", "WFREPBRequest.m", 90, "nil != self->_identifier");
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (!self->_message)
    __assert_rtn("-[WFREPBRequest writeTo:]", "WFREPBRequest.m", 99, "nil != self->_message");
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  NSString *identifier;
  _DWORD *v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "setIdentifier:", identifier);
  v5[6] = self->_version;
  objc_msgSend(v5, "setMessage:", self->_message);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_DWORD *)(v5 + 24) = self->_version;
  v8 = -[NSData copyWithZone:](self->_message, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSData *message;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && self->_version == *((_DWORD *)v4 + 6))
  {
    message = self->_message;
    if ((unint64_t)message | v4[2])
      v7 = -[NSData isEqual:](message, "isEqual:");
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
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = 2654435761 * self->_version;
  return v4 ^ v3 ^ -[NSData hash](self->_message, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[WFREPBRequest setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  self->_version = v4[6];
  if (*((_QWORD *)v4 + 2))
  {
    -[WFREPBRequest setMessage:](self, "setMessage:");
    v4 = v5;
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

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (NSData)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
