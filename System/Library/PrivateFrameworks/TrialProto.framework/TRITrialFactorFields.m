@implementation TRITrialFactorFields

- (BOOL)hasClientFactorPackId
{
  return self->_clientFactorPackId != 0;
}

- (BOOL)hasNamespaceName
{
  return self->_namespaceName != 0;
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
  v8.super_class = (Class)TRITrialFactorFields;
  -[TRITrialFactorFields description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRITrialFactorFields dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientFactorPackId;
  NSString *namespaceName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientFactorPackId = self->_clientFactorPackId;
  if (clientFactorPackId)
    objc_msgSend(v3, "setObject:forKey:", clientFactorPackId, CFSTR("client_factor_pack_id"));
  namespaceName = self->_namespaceName;
  if (namespaceName)
    objc_msgSend(v4, "setObject:forKey:", namespaceName, CFSTR("namespace_name"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRITrialFactorFieldsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_clientFactorPackId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_namespaceName)
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
  if (self->_clientFactorPackId)
  {
    objc_msgSend(v4, "setClientFactorPackId:");
    v4 = v5;
  }
  if (self->_namespaceName)
  {
    objc_msgSend(v5, "setNamespaceName:");
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
  v6 = -[NSString copyWithZone:](self->_clientFactorPackId, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_namespaceName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *clientFactorPackId;
  NSString *namespaceName;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((clientFactorPackId = self->_clientFactorPackId, !((unint64_t)clientFactorPackId | v4[1]))
     || -[NSString isEqual:](clientFactorPackId, "isEqual:")))
  {
    namespaceName = self->_namespaceName;
    if ((unint64_t)namespaceName | v4[2])
      v7 = -[NSString isEqual:](namespaceName, "isEqual:");
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

  v3 = -[NSString hash](self->_clientFactorPackId, "hash");
  return -[NSString hash](self->_namespaceName, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[TRITrialFactorFields setClientFactorPackId:](self, "setClientFactorPackId:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[TRITrialFactorFields setNamespaceName:](self, "setNamespaceName:");
    v4 = v5;
  }

}

- (NSString)clientFactorPackId
{
  return self->_clientFactorPackId;
}

- (void)setClientFactorPackId:(id)a3
{
  objc_storeStrong((id *)&self->_clientFactorPackId, a3);
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (void)setNamespaceName:(id)a3
{
  objc_storeStrong((id *)&self->_namespaceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_clientFactorPackId, 0);
}

@end
