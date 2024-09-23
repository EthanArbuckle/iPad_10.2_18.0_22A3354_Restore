@implementation WFREPBError

- (BOOL)hasLocalizedDescription
{
  return self->_localizedDescription != 0;
}

- (BOOL)hasLocalizedFailureReason
{
  return self->_localizedFailureReason != 0;
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
  v8.super_class = (Class)WFREPBError;
  -[WFREPBError description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBError dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *domain;
  void *v6;
  NSString *localizedDescription;
  NSString *localizedFailureReason;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  domain = self->_domain;
  if (domain)
    objc_msgSend(v3, "setObject:forKey:", domain, CFSTR("domain"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_code);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("code"));

  localizedDescription = self->_localizedDescription;
  if (localizedDescription)
    objc_msgSend(v4, "setObject:forKey:", localizedDescription, CFSTR("localizedDescription"));
  localizedFailureReason = self->_localizedFailureReason;
  if (localizedFailureReason)
    objc_msgSend(v4, "setObject:forKey:", localizedFailureReason, CFSTR("localizedFailureReason"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_domain)
    __assert_rtn("-[WFREPBError writeTo:]", "WFREPBError.m", 109, "nil != self->_domain");
  v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt64Field();
  if (self->_localizedDescription)
    PBDataWriterWriteStringField();
  if (self->_localizedFailureReason)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  void *v4;
  _QWORD *v5;

  v5 = a3;
  objc_msgSend(v5, "setDomain:", self->_domain);
  v4 = v5;
  v5[1] = self->_code;
  if (self->_localizedDescription)
  {
    objc_msgSend(v5, "setLocalizedDescription:");
    v4 = v5;
  }
  if (self->_localizedFailureReason)
  {
    objc_msgSend(v5, "setLocalizedFailureReason:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_code;
  v8 = -[NSString copyWithZone:](self->_localizedDescription, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_localizedFailureReason, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *domain;
  NSString *localizedDescription;
  NSString *localizedFailureReason;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((domain = self->_domain, !((unint64_t)domain | v4[2]))
     || -[NSString isEqual:](domain, "isEqual:"))
    && self->_code == v4[1]
    && ((localizedDescription = self->_localizedDescription, !((unint64_t)localizedDescription | v4[3]))
     || -[NSString isEqual:](localizedDescription, "isEqual:")))
  {
    localizedFailureReason = self->_localizedFailureReason;
    if ((unint64_t)localizedFailureReason | v4[4])
      v8 = -[NSString isEqual:](localizedFailureReason, "isEqual:");
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
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_domain, "hash");
  v4 = 2654435761 * self->_code;
  v5 = v3 ^ -[NSString hash](self->_localizedDescription, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_localizedFailureReason, "hash");
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;

  v4 = (int64_t *)a3;
  if (v4[2])
    -[WFREPBError setDomain:](self, "setDomain:");
  self->_code = v4[1];
  if (v4[3])
    -[WFREPBError setLocalizedDescription:](self, "setLocalizedDescription:");
  if (v4[4])
    -[WFREPBError setLocalizedFailureReason:](self, "setLocalizedFailureReason:");

}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDescription, a3);
}

- (NSString)localizedFailureReason
{
  return self->_localizedFailureReason;
}

- (void)setLocalizedFailureReason:(id)a3
{
  objc_storeStrong((id *)&self->_localizedFailureReason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedFailureReason, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
