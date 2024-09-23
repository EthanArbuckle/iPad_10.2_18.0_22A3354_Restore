@implementation WFPBShareShortcutEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("ShareShortcut");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (int)source
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_source;
  else
    return -1;
}

- (void)setSource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)sourceAsString:(int)a3
{
  if ((a3 + 1) < 0xE)
    return off_1E7AF73C0[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutSourceUnknown")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutSourceOnDevice")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutSourceGallery")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutSourceAddToSiri")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutSourceCloudLink")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutSourceDefaultShortcut")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutSourceSiriTopLevelShortcut")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutSourceAutomatorMigration")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutSourceFilePublic")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutSourceFileKnownContacts")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutSourceFilePersonal")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutSourceEditorDocumentMenu")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutSourceAppShortcut")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ShortcutSourceActiveStarterShortcut")))
  {
    v4 = 12;
  }
  else
  {
    v4 = -1;
  }

  return v4;
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

- (BOOL)hasSharingDestinationBundleIdentifier
{
  return self->_sharingDestinationBundleIdentifier != 0;
}

- (NSString)sharingMode
{
  if (self->_sharingMode)
    return self->_sharingMode;
  else
    return (NSString *)CFSTR("ShortcutSharingModeUnknown");
}

- (BOOL)hasSharingMode
{
  return self->_sharingMode != 0;
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
  v8.super_class = (Class)WFPBShareShortcutEvent;
  -[WFPBShareShortcutEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBShareShortcutEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  unsigned int v7;
  __CFString *v8;
  void *v9;
  NSString *addToSiriBundleIdentifier;
  NSString *galleryIdentifier;
  NSString *sharingDestinationBundleIdentifier;
  NSString *sharingMode;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = self->_source + 1;
    if (v7 >= 0xE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_source);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E7AF73C0[v7];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("source"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_actionCount);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("actionCount"));

  }
  addToSiriBundleIdentifier = self->_addToSiriBundleIdentifier;
  if (addToSiriBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", addToSiriBundleIdentifier, CFSTR("addToSiriBundleIdentifier"));
  galleryIdentifier = self->_galleryIdentifier;
  if (galleryIdentifier)
    objc_msgSend(v4, "setObject:forKey:", galleryIdentifier, CFSTR("galleryIdentifier"));
  sharingDestinationBundleIdentifier = self->_sharingDestinationBundleIdentifier;
  if (sharingDestinationBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", sharingDestinationBundleIdentifier, CFSTR("sharingDestinationBundleIdentifier"));
  sharingMode = self->_sharingMode;
  if (sharingMode)
    objc_msgSend(v4, "setObject:forKey:", sharingMode, CFSTR("sharingMode"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBShareShortcutEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_addToSiriBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_galleryIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_sharingDestinationBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_sharingMode)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_source;
    *((_BYTE *)v4 + 60) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_actionCount;
    *((_BYTE *)v4 + 60) |= 1u;
  }
  if (self->_addToSiriBundleIdentifier)
  {
    objc_msgSend(v6, "setAddToSiriBundleIdentifier:");
    v4 = v6;
  }
  if (self->_galleryIdentifier)
  {
    objc_msgSend(v6, "setGalleryIdentifier:");
    v4 = v6;
  }
  if (self->_sharingDestinationBundleIdentifier)
  {
    objc_msgSend(v6, "setSharingDestinationBundleIdentifier:");
    v4 = v6;
  }
  if (self->_sharingMode)
  {
    objc_msgSend(v6, "setSharingMode:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_source;
    *(_BYTE *)(v5 + 60) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_actionCount;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_addToSiriBundleIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v11 = -[NSString copyWithZone:](self->_galleryIdentifier, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[NSString copyWithZone:](self->_sharingDestinationBundleIdentifier, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  v15 = -[NSString copyWithZone:](self->_sharingMode, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *addToSiriBundleIdentifier;
  NSString *galleryIdentifier;
  NSString *sharingDestinationBundleIdentifier;
  NSString *sharingMode;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_source != *((_DWORD *)v4 + 14))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
LABEL_22:
    v10 = 0;
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_actionCount != *((_DWORD *)v4 + 2))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_22;
  }
  addToSiriBundleIdentifier = self->_addToSiriBundleIdentifier;
  if ((unint64_t)addToSiriBundleIdentifier | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](addToSiriBundleIdentifier, "isEqual:"))
  {
    goto LABEL_22;
  }
  galleryIdentifier = self->_galleryIdentifier;
  if ((unint64_t)galleryIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](galleryIdentifier, "isEqual:"))
      goto LABEL_22;
  }
  sharingDestinationBundleIdentifier = self->_sharingDestinationBundleIdentifier;
  if ((unint64_t)sharingDestinationBundleIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](sharingDestinationBundleIdentifier, "isEqual:"))
      goto LABEL_22;
  }
  sharingMode = self->_sharingMode;
  if ((unint64_t)sharingMode | *((_QWORD *)v4 + 6))
    v10 = -[NSString isEqual:](sharingMode, "isEqual:");
  else
    v10 = 1;
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_source;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_actionCount;
LABEL_6:
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_addToSiriBundleIdentifier, "hash");
  v7 = -[NSString hash](self->_galleryIdentifier, "hash");
  v8 = v7 ^ -[NSString hash](self->_sharingDestinationBundleIdentifier, "hash");
  return v6 ^ v8 ^ -[NSString hash](self->_sharingMode, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[WFPBShareShortcutEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 2) != 0)
  {
    self->_source = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 60);
  }
  if ((v5 & 1) != 0)
  {
    self->_actionCount = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBShareShortcutEvent setAddToSiriBundleIdentifier:](self, "setAddToSiriBundleIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBShareShortcutEvent setGalleryIdentifier:](self, "setGalleryIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[WFPBShareShortcutEvent setSharingDestinationBundleIdentifier:](self, "setSharingDestinationBundleIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[WFPBShareShortcutEvent setSharingMode:](self, "setSharingMode:");
    v4 = v6;
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

- (NSString)sharingDestinationBundleIdentifier
{
  return self->_sharingDestinationBundleIdentifier;
}

- (void)setSharingDestinationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharingDestinationBundleIdentifier, a3);
}

- (void)setSharingMode:(id)a3
{
  objc_storeStrong((id *)&self->_sharingMode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingMode, 0);
  objc_storeStrong((id *)&self->_sharingDestinationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, 0);
}

@end
