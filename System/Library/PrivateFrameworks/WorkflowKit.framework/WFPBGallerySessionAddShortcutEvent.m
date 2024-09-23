@implementation WFPBGallerySessionAddShortcutEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("GallerySessionAddShortcut");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (BOOL)hasShortcutIdentifier
{
  return self->_shortcutIdentifier != 0;
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
  v8.super_class = (Class)WFPBGallerySessionAddShortcutEvent;
  -[WFPBGallerySessionAddShortcutEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBGallerySessionAddShortcutEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *sessionIdentifier;
  NSString *shortcutIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  shortcutIdentifier = self->_shortcutIdentifier;
  if (shortcutIdentifier)
    objc_msgSend(v4, "setObject:forKey:", shortcutIdentifier, CFSTR("shortcutIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBGallerySessionAddShortcutEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_sessionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_shortcutIdentifier)
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
  if (self->_sessionIdentifier)
  {
    objc_msgSend(v5, "setSessionIdentifier:");
    v4 = v5;
  }
  if (self->_shortcutIdentifier)
  {
    objc_msgSend(v5, "setShortcutIdentifier:");
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
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_sessionIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_shortcutIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  NSString *sessionIdentifier;
  NSString *shortcutIdentifier;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:"))
    && ((sessionIdentifier = self->_sessionIdentifier, !((unint64_t)sessionIdentifier | v4[2]))
     || -[NSString isEqual:](sessionIdentifier, "isEqual:")))
  {
    shortcutIdentifier = self->_shortcutIdentifier;
    if ((unint64_t)shortcutIdentifier | v4[3])
      v8 = -[NSString isEqual:](shortcutIdentifier, "isEqual:");
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

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_sessionIdentifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_shortcutIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[WFPBGallerySessionAddShortcutEvent setKey:](self, "setKey:");
  if (v4[2])
    -[WFPBGallerySessionAddShortcutEvent setSessionIdentifier:](self, "setSessionIdentifier:");
  if (v4[3])
    -[WFPBGallerySessionAddShortcutEvent setShortcutIdentifier:](self, "setShortcutIdentifier:");

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)setShortcutIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
