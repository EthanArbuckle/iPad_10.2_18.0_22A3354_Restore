@implementation WFPBShowWidgetConfigurationEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("ShowWidgetConfigurationEvent");
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

- (BOOL)hasSizeClass
{
  return self->_sizeClass != 0;
}

- (void)setIsInteractive:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isInteractive = a3;
}

- (void)setHasIsInteractive:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsInteractive
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)WFPBShowWidgetConfigurationEvent;
  -[WFPBShowWidgetConfigurationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBShowWidgetConfigurationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *sizeClass;
  void *v9;

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
  sizeClass = self->_sizeClass;
  if (sizeClass)
    objc_msgSend(v4, "setObject:forKey:", sizeClass, CFSTR("sizeClass"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInteractive);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("isInteractive"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBShowWidgetConfigurationEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_sizeClass)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

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
  if (self->_sizeClass)
  {
    objc_msgSend(v5, "setSizeClass:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[40] = self->_isInteractive;
    v4[44] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_appBundleIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_intentType, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_sizeClass, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_isInteractive;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *appBundleIdentifier;
  NSString *intentType;
  NSString *sizeClass;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_12;
  }
  appBundleIdentifier = self->_appBundleIdentifier;
  if ((unint64_t)appBundleIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](appBundleIdentifier, "isEqual:"))
      goto LABEL_12;
  }
  intentType = self->_intentType;
  if ((unint64_t)intentType | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](intentType, "isEqual:"))
      goto LABEL_12;
  }
  sizeClass = self->_sizeClass;
  if ((unint64_t)sizeClass | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sizeClass, "isEqual:"))
      goto LABEL_12;
  }
  v9 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0)
    {
LABEL_12:
      v9 = 0;
      goto LABEL_13;
    }
    if (self->_isInteractive)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_12;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_12;
    }
    v9 = 1;
  }
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_appBundleIdentifier, "hash");
  v5 = -[NSString hash](self->_intentType, "hash");
  v6 = -[NSString hash](self->_sizeClass, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_isInteractive;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBShowWidgetConfigurationEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[WFPBShowWidgetConfigurationEvent setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBShowWidgetConfigurationEvent setIntentType:](self, "setIntentType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[WFPBShowWidgetConfigurationEvent setSizeClass:](self, "setSizeClass:");
    v4 = v5;
  }
  if (v4[44])
  {
    self->_isInteractive = v4[40];
    *(_BYTE *)&self->_has |= 1u;
  }

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

- (NSString)sizeClass
{
  return self->_sizeClass;
}

- (void)setSizeClass:(id)a3
{
  objc_storeStrong((id *)&self->_sizeClass, a3);
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
