@implementation WFPBDeleteShortcutEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("DeleteShortcut");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setActionCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_actionCount = a3;
}

- (void)setHasActionCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAddToSiriBundleIdentifier
{
  return self->_addToSiriBundleIdentifier != 0;
}

- (BOOL)hasGalleryIdentifier
{
  return self->_galleryIdentifier != 0;
}

- (BOOL)hasShortcutSource
{
  return self->_shortcutSource != 0;
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
  v8.super_class = (Class)WFPBDeleteShortcutEvent;
  -[WFPBDeleteShortcutEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBDeleteShortcutEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSString *addToSiriBundleIdentifier;
  NSString *galleryIdentifier;
  NSString *shortcutSource;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_actionCount);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("actionCount"));

  }
  addToSiriBundleIdentifier = self->_addToSiriBundleIdentifier;
  if (addToSiriBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", addToSiriBundleIdentifier, CFSTR("addToSiriBundleIdentifier"));
  galleryIdentifier = self->_galleryIdentifier;
  if (galleryIdentifier)
    objc_msgSend(v4, "setObject:forKey:", galleryIdentifier, CFSTR("galleryIdentifier"));
  shortcutSource = self->_shortcutSource;
  if (shortcutSource)
    objc_msgSend(v4, "setObject:forKey:", shortcutSource, CFSTR("shortcutSource"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBDeleteShortcutEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_addToSiriBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_galleryIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_shortcutSource)
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_actionCount;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_addToSiriBundleIdentifier)
  {
    objc_msgSend(v5, "setAddToSiriBundleIdentifier:");
    v4 = v5;
  }
  if (self->_galleryIdentifier)
  {
    objc_msgSend(v5, "setGalleryIdentifier:");
    v4 = v5;
  }
  if (self->_shortcutSource)
  {
    objc_msgSend(v5, "setShortcutSource:");
    v4 = v5;
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
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_actionCount;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_addToSiriBundleIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_galleryIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_shortcutSource, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *addToSiriBundleIdentifier;
  NSString *galleryIdentifier;
  NSString *shortcutSource;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_actionCount != *((_DWORD *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  addToSiriBundleIdentifier = self->_addToSiriBundleIdentifier;
  if ((unint64_t)addToSiriBundleIdentifier | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](addToSiriBundleIdentifier, "isEqual:"))
  {
    goto LABEL_15;
  }
  galleryIdentifier = self->_galleryIdentifier;
  if ((unint64_t)galleryIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](galleryIdentifier, "isEqual:"))
      goto LABEL_15;
  }
  shortcutSource = self->_shortcutSource;
  if ((unint64_t)shortcutSource | *((_QWORD *)v4 + 5))
    v9 = -[NSString isEqual:](shortcutSource, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_actionCount;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSString hash](self->_addToSiriBundleIdentifier, "hash");
  v7 = v5 ^ v6 ^ -[NSString hash](self->_galleryIdentifier, "hash");
  return v7 ^ -[NSString hash](self->_shortcutSource, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v4 = (unsigned int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[WFPBDeleteShortcutEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if ((v4[12] & 1) != 0)
  {
    self->_actionCount = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBDeleteShortcutEvent setAddToSiriBundleIdentifier:](self, "setAddToSiriBundleIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBDeleteShortcutEvent setGalleryIdentifier:](self, "setGalleryIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[WFPBDeleteShortcutEvent setShortcutSource:](self, "setShortcutSource:");
    v4 = v5;
  }

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (unsigned)actionCount
{
  return self->_actionCount;
}

- (NSString)addToSiriBundleIdentifier
{
  return self->_addToSiriBundleIdentifier;
}

- (void)setAddToSiriBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, a3);
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_galleryIdentifier, a3);
}

- (NSString)shortcutSource
{
  return self->_shortcutSource;
}

- (void)setShortcutSource:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, 0);
}

@end
