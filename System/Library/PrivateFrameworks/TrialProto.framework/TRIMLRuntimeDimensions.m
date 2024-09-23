@implementation TRIMLRuntimeDimensions

- (BOOL)hasUnderlyingDomainCode
{
  return self->_underlyingDomainCode != 0;
}

- (BOOL)hasPluginId
{
  return self->_pluginId != 0;
}

- (BOOL)hasCrashPrefixHash
{
  return self->_crashPrefixHash != 0;
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
  v8.super_class = (Class)TRIMLRuntimeDimensions;
  -[TRIMLRuntimeDimensions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIMLRuntimeDimensions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *underlyingDomainCode;
  NSString *pluginId;
  NSString *crashPrefixHash;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  underlyingDomainCode = self->_underlyingDomainCode;
  if (underlyingDomainCode)
    objc_msgSend(v3, "setObject:forKey:", underlyingDomainCode, CFSTR("underlying_domain_code"));
  pluginId = self->_pluginId;
  if (pluginId)
    objc_msgSend(v4, "setObject:forKey:", pluginId, CFSTR("plugin_id"));
  crashPrefixHash = self->_crashPrefixHash;
  if (crashPrefixHash)
    objc_msgSend(v4, "setObject:forKey:", crashPrefixHash, CFSTR("crash_prefix_hash"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRIMLRuntimeDimensionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_underlyingDomainCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_pluginId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_crashPrefixHash)
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
  if (self->_underlyingDomainCode)
  {
    objc_msgSend(v4, "setUnderlyingDomainCode:");
    v4 = v5;
  }
  if (self->_pluginId)
  {
    objc_msgSend(v5, "setPluginId:");
    v4 = v5;
  }
  if (self->_crashPrefixHash)
  {
    objc_msgSend(v5, "setCrashPrefixHash:");
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
  v6 = -[NSString copyWithZone:](self->_underlyingDomainCode, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_pluginId, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_crashPrefixHash, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *underlyingDomainCode;
  NSString *pluginId;
  NSString *crashPrefixHash;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((underlyingDomainCode = self->_underlyingDomainCode, !((unint64_t)underlyingDomainCode | v4[3]))
     || -[NSString isEqual:](underlyingDomainCode, "isEqual:"))
    && ((pluginId = self->_pluginId, !((unint64_t)pluginId | v4[2]))
     || -[NSString isEqual:](pluginId, "isEqual:")))
  {
    crashPrefixHash = self->_crashPrefixHash;
    if ((unint64_t)crashPrefixHash | v4[1])
      v8 = -[NSString isEqual:](crashPrefixHash, "isEqual:");
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
  NSUInteger v4;

  v3 = -[NSString hash](self->_underlyingDomainCode, "hash");
  v4 = -[NSString hash](self->_pluginId, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_crashPrefixHash, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[TRIMLRuntimeDimensions setUnderlyingDomainCode:](self, "setUnderlyingDomainCode:");
  if (v4[2])
    -[TRIMLRuntimeDimensions setPluginId:](self, "setPluginId:");
  if (v4[1])
    -[TRIMLRuntimeDimensions setCrashPrefixHash:](self, "setCrashPrefixHash:");

}

- (NSString)underlyingDomainCode
{
  return self->_underlyingDomainCode;
}

- (void)setUnderlyingDomainCode:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingDomainCode, a3);
}

- (NSString)pluginId
{
  return self->_pluginId;
}

- (void)setPluginId:(id)a3
{
  objc_storeStrong((id *)&self->_pluginId, a3);
}

- (NSString)crashPrefixHash
{
  return self->_crashPrefixHash;
}

- (void)setCrashPrefixHash:(id)a3
{
  objc_storeStrong((id *)&self->_crashPrefixHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDomainCode, 0);
  objc_storeStrong((id *)&self->_pluginId, 0);
  objc_storeStrong((id *)&self->_crashPrefixHash, 0);
}

@end
