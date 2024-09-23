@implementation WFPBShowFocusConfigurationEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("ShowFocusConfigurationEvent");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
}

- (BOOL)hasIntentType
{
  return self->_intentType != 0;
}

- (BOOL)hasSystemFilterType
{
  return self->_systemFilterType != 0;
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
  v8.super_class = (Class)WFPBShowFocusConfigurationEvent;
  -[WFPBShowFocusConfigurationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBShowFocusConfigurationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *appBundleIdentifier;
  NSString *intentType;
  NSString *systemFilterType;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  appBundleIdentifier = self->_appBundleIdentifier;
  if (appBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", appBundleIdentifier, CFSTR("appBundleIdentifier"));
  intentType = self->_intentType;
  if (intentType)
    objc_msgSend(v4, "setObject:forKey:", intentType, CFSTR("intentType"));
  systemFilterType = self->_systemFilterType;
  if (systemFilterType)
    objc_msgSend(v4, "setObject:forKey:", systemFilterType, CFSTR("systemFilterType"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBShowFocusConfigurationEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_appBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_intentType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_systemFilterType)
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
  if (self->_appBundleIdentifier)
  {
    objc_msgSend(v5, "setAppBundleIdentifier:");
    v4 = v5;
  }
  if (self->_intentType)
  {
    objc_msgSend(v5, "setIntentType:");
    v4 = v5;
  }
  if (self->_systemFilterType)
  {
    objc_msgSend(v5, "setSystemFilterType:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_appBundleIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_intentType, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_systemFilterType, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  NSString *appBundleIdentifier;
  NSString *intentType;
  NSString *systemFilterType;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((key = self->_key, !((unint64_t)key | v4[3])) || -[NSString isEqual:](key, "isEqual:"))
    && ((appBundleIdentifier = self->_appBundleIdentifier, !((unint64_t)appBundleIdentifier | v4[1]))
     || -[NSString isEqual:](appBundleIdentifier, "isEqual:"))
    && ((intentType = self->_intentType, !((unint64_t)intentType | v4[2]))
     || -[NSString isEqual:](intentType, "isEqual:")))
  {
    systemFilterType = self->_systemFilterType;
    if ((unint64_t)systemFilterType | v4[4])
      v9 = -[NSString isEqual:](systemFilterType, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_appBundleIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_intentType, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_systemFilterType, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[WFPBShowFocusConfigurationEvent setKey:](self, "setKey:");
  if (v4[1])
    -[WFPBShowFocusConfigurationEvent setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
  if (v4[2])
    -[WFPBShowFocusConfigurationEvent setIntentType:](self, "setIntentType:");
  if (v4[4])
    -[WFPBShowFocusConfigurationEvent setSystemFilterType:](self, "setSystemFilterType:");

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, a3);
}

- (NSString)intentType
{
  return self->_intentType;
}

- (void)setIntentType:(id)a3
{
  objc_storeStrong((id *)&self->_intentType, a3);
}

- (NSString)systemFilterType
{
  return self->_systemFilterType;
}

- (void)setSystemFilterType:(id)a3
{
  objc_storeStrong((id *)&self->_systemFilterType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemFilterType, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
