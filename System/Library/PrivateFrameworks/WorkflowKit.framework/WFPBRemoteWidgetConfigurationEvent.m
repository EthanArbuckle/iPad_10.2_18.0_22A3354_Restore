@implementation WFPBRemoteWidgetConfigurationEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("SetupRemoteWidgetConfigurationEvent");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (BOOL)hasWidgetIdentifier
{
  return self->_widgetIdentifier != 0;
}

- (BOOL)hasSizeClass
{
  return self->_sizeClass != 0;
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
  v8.super_class = (Class)WFPBRemoteWidgetConfigurationEvent;
  -[WFPBRemoteWidgetConfigurationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBRemoteWidgetConfigurationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *bundleIdentifier;
  NSString *widgetIdentifier;
  NSString *sizeClass;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  widgetIdentifier = self->_widgetIdentifier;
  if (widgetIdentifier)
    objc_msgSend(v4, "setObject:forKey:", widgetIdentifier, CFSTR("widgetIdentifier"));
  sizeClass = self->_sizeClass;
  if (sizeClass)
    objc_msgSend(v4, "setObject:forKey:", sizeClass, CFSTR("sizeClass"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBRemoteWidgetConfigurationEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_widgetIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sizeClass)
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
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v5, "setBundleIdentifier:");
    v4 = v5;
  }
  if (self->_widgetIdentifier)
  {
    objc_msgSend(v5, "setWidgetIdentifier:");
    v4 = v5;
  }
  if (self->_sizeClass)
  {
    objc_msgSend(v5, "setSizeClass:");
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
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_widgetIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSString copyWithZone:](self->_sizeClass, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  NSString *bundleIdentifier;
  NSString *widgetIdentifier;
  NSString *sizeClass;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((key = self->_key, !((unint64_t)key | v4[2])) || -[NSString isEqual:](key, "isEqual:"))
    && ((bundleIdentifier = self->_bundleIdentifier, !((unint64_t)bundleIdentifier | v4[1]))
     || -[NSString isEqual:](bundleIdentifier, "isEqual:"))
    && ((widgetIdentifier = self->_widgetIdentifier, !((unint64_t)widgetIdentifier | v4[4]))
     || -[NSString isEqual:](widgetIdentifier, "isEqual:")))
  {
    sizeClass = self->_sizeClass;
    if ((unint64_t)sizeClass | v4[3])
      v9 = -[NSString isEqual:](sizeClass, "isEqual:");
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
  v4 = -[NSString hash](self->_bundleIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_widgetIdentifier, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_sizeClass, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[WFPBRemoteWidgetConfigurationEvent setKey:](self, "setKey:");
  if (v4[1])
    -[WFPBRemoteWidgetConfigurationEvent setBundleIdentifier:](self, "setBundleIdentifier:");
  if (v4[4])
    -[WFPBRemoteWidgetConfigurationEvent setWidgetIdentifier:](self, "setWidgetIdentifier:");
  if (v4[3])
    -[WFPBRemoteWidgetConfigurationEvent setSizeClass:](self, "setSizeClass:");

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (void)setWidgetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_widgetIdentifier, a3);
}

- (NSString)sizeClass
{
  return self->_sizeClass;
}

- (void)setSizeClass:(id)a3
{
  objc_storeStrong((id *)&self->_sizeClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
