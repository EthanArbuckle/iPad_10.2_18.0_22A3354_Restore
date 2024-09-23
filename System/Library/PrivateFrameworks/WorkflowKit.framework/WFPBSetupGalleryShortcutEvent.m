@implementation WFPBSetupGalleryShortcutEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("SetupGalleryShortcut");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasGalleryCategoryIdentifier
{
  return self->_galleryCategoryIdentifier != 0;
}

- (BOOL)hasGalleryIdentifier
{
  return self->_galleryIdentifier != 0;
}

- (BOOL)hasAddToSiriBundleIdentifier
{
  return self->_addToSiriBundleIdentifier != 0;
}

- (void)setCompleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_completed = a3;
}

- (void)setHasCompleted:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompleted
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
  v8.super_class = (Class)WFPBSetupGalleryShortcutEvent;
  -[WFPBSetupGalleryShortcutEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBSetupGalleryShortcutEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *galleryCategoryIdentifier;
  NSString *galleryIdentifier;
  NSString *addToSiriBundleIdentifier;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  galleryCategoryIdentifier = self->_galleryCategoryIdentifier;
  if (galleryCategoryIdentifier)
    objc_msgSend(v4, "setObject:forKey:", galleryCategoryIdentifier, CFSTR("galleryCategoryIdentifier"));
  galleryIdentifier = self->_galleryIdentifier;
  if (galleryIdentifier)
    objc_msgSend(v4, "setObject:forKey:", galleryIdentifier, CFSTR("galleryIdentifier"));
  addToSiriBundleIdentifier = self->_addToSiriBundleIdentifier;
  if (addToSiriBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", addToSiriBundleIdentifier, CFSTR("addToSiriBundleIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_completed);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("completed"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBSetupGalleryShortcutEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_galleryCategoryIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_galleryIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_addToSiriBundleIdentifier)
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
  if (self->_galleryCategoryIdentifier)
  {
    objc_msgSend(v5, "setGalleryCategoryIdentifier:");
    v4 = v5;
  }
  if (self->_galleryIdentifier)
  {
    objc_msgSend(v5, "setGalleryIdentifier:");
    v4 = v5;
  }
  if (self->_addToSiriBundleIdentifier)
  {
    objc_msgSend(v5, "setAddToSiriBundleIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[40] = self->_completed;
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
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_galleryCategoryIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_galleryIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_addToSiriBundleIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_completed;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *galleryCategoryIdentifier;
  NSString *galleryIdentifier;
  NSString *addToSiriBundleIdentifier;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_12;
  }
  galleryCategoryIdentifier = self->_galleryCategoryIdentifier;
  if ((unint64_t)galleryCategoryIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](galleryCategoryIdentifier, "isEqual:"))
      goto LABEL_12;
  }
  galleryIdentifier = self->_galleryIdentifier;
  if ((unint64_t)galleryIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](galleryIdentifier, "isEqual:"))
      goto LABEL_12;
  }
  addToSiriBundleIdentifier = self->_addToSiriBundleIdentifier;
  if ((unint64_t)addToSiriBundleIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](addToSiriBundleIdentifier, "isEqual:"))
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
    if (self->_completed)
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
  v4 = -[NSString hash](self->_galleryCategoryIdentifier, "hash");
  v5 = -[NSString hash](self->_galleryIdentifier, "hash");
  v6 = -[NSString hash](self->_addToSiriBundleIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_completed;
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
  if (*((_QWORD *)v4 + 4))
  {
    -[WFPBSetupGalleryShortcutEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBSetupGalleryShortcutEvent setGalleryCategoryIdentifier:](self, "setGalleryCategoryIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBSetupGalleryShortcutEvent setGalleryIdentifier:](self, "setGalleryIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[WFPBSetupGalleryShortcutEvent setAddToSiriBundleIdentifier:](self, "setAddToSiriBundleIdentifier:");
    v4 = v5;
  }
  if (v4[44])
  {
    self->_completed = v4[40];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)galleryCategoryIdentifier
{
  return self->_galleryCategoryIdentifier;
}

- (void)setGalleryCategoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_galleryCategoryIdentifier, a3);
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_galleryIdentifier, a3);
}

- (NSString)addToSiriBundleIdentifier
{
  return self->_addToSiriBundleIdentifier;
}

- (void)setAddToSiriBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, a3);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_galleryCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, 0);
}

@end
