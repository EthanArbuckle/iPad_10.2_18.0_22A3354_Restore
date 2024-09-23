@implementation _ICLLClientInfoCommand

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLClientInfoCommand;
  -[_ICLLClientInfoCommand description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLClientInfoCommand dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sharedSessionToken;
  NSString *externalId;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sharedSessionToken = self->_sharedSessionToken;
  if (sharedSessionToken)
    objc_msgSend(v3, "setObject:forKey:", sharedSessionToken, CFSTR("sharedSessionToken"));
  externalId = self->_externalId;
  if (externalId)
    objc_msgSend(v4, "setObject:forKey:", externalId, CFSTR("externalId"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLClientInfoCommandReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sharedSessionToken)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_externalId)
  {
    PBDataWriterWriteStringField();
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sharedSessionToken, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_externalId, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *sharedSessionToken;
  NSString *externalId;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((sharedSessionToken = self->_sharedSessionToken, !((unint64_t)sharedSessionToken | v4[2]))
     || -[NSString isEqual:](sharedSessionToken, "isEqual:")))
  {
    externalId = self->_externalId;
    if ((unint64_t)externalId | v4[1])
      v7 = -[NSString isEqual:](externalId, "isEqual:");
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

  v3 = -[NSString hash](self->_sharedSessionToken, "hash");
  return -[NSString hash](self->_externalId, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedSessionToken, 0);
  objc_storeStrong((id *)&self->_externalId, 0);
}

- (void)setSharedSessionToken:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setExternalId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

@end
