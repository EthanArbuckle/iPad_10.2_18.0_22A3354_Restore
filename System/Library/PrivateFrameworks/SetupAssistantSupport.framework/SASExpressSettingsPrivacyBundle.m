@implementation SASExpressSettingsPrivacyBundle

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SASExpressSettingsPrivacyBundle;
  -[SASExpressSettingsPrivacyBundle description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASExpressSettingsPrivacyBundle dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_contentVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("contentVersion"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SASExpressSettingsPrivacyBundleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_identifier)
    -[SASExpressSettingsPrivacyBundle writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  NSString *identifier;
  _QWORD *v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "setIdentifier:", identifier);
  v5[1] = self->_contentVersion;

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_contentVersion;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[2]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && self->_contentVersion == v4[1];

  return v6;
}

- (unint64_t)hash
{
  return (2654435761u * self->_contentVersion) ^ -[NSString hash](self->_identifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;

  v4 = (unint64_t *)a3;
  if (v4[2])
  {
    v5 = v4;
    -[SASExpressSettingsPrivacyBundle setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  self->_contentVersion = v4[1];

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)contentVersion
{
  return self->_contentVersion;
}

- (void)setContentVersion:(unint64_t)a3
{
  self->_contentVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SASExpressSettingsPrivacyBundle writeTo:]", "SASExpressSettingsPrivacyBundle.m", 79, "nil != self->_identifier");
}

@end
