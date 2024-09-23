@implementation WFPBEditShortcutEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("EditShortcut");
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

- (void)setNumberOfShownSuggestions:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numberOfShownSuggestions = a3;
}

- (void)setHasNumberOfShownSuggestions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumberOfShownSuggestions
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setNumberOfEngagedSuggestions:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numberOfEngagedSuggestions = a3;
}

- (void)setHasNumberOfEngagedSuggestions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfEngagedSuggestions
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNumberOfRejectedSuggestions:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numberOfRejectedSuggestions = a3;
}

- (void)setHasNumberOfRejectedSuggestions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumberOfRejectedSuggestions
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNumberOfManuallyAddedActions:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_numberOfManuallyAddedActions = a3;
}

- (void)setHasNumberOfManuallyAddedActions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumberOfManuallyAddedActions
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setStartingActionCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_startingActionCount = a3;
}

- (void)setHasStartingActionCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStartingActionCount
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)WFPBEditShortcutEvent;
  -[WFPBEditShortcutEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBEditShortcutEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

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
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfShownSuggestions);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("numberOfShownSuggestions"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 8) == 0)
        goto LABEL_14;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfEngagedSuggestions);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("numberOfEngagedSuggestions"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      goto LABEL_15;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfManuallyAddedActions);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("numberOfManuallyAddedActions"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v4;
    goto LABEL_16;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfRejectedSuggestions);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("numberOfRejectedSuggestions"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_21;
LABEL_15:
  if ((has & 0x20) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_startingActionCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("startingActionCount"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBEditShortcutEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
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
  if (self->_shortcutSource)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 8) == 0)
        goto LABEL_14;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      goto LABEL_15;
LABEL_21:
    PBDataWriterWriteUint32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_21;
LABEL_15:
  if ((has & 0x20) != 0)
  {
LABEL_16:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_17:

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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_actionCount;
    *((_BYTE *)v4 + 68) |= 1u;
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
  if (self->_shortcutSource)
  {
    objc_msgSend(v6, "setShortcutSource:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_numberOfShownSuggestions;
    *((_BYTE *)v4 + 68) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 8) == 0)
        goto LABEL_14;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 10) = self->_numberOfEngagedSuggestions;
  *((_BYTE *)v4 + 68) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 4) == 0)
      goto LABEL_15;
LABEL_21:
    *((_DWORD *)v4 + 11) = self->_numberOfManuallyAddedActions;
    *((_BYTE *)v4 + 68) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_20:
  *((_DWORD *)v4 + 12) = self->_numberOfRejectedSuggestions;
  *((_BYTE *)v4 + 68) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_21;
LABEL_15:
  if ((has & 0x20) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 16) = self->_startingActionCount;
    *((_BYTE *)v4 + 68) |= 0x20u;
  }
LABEL_17:

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
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_actionCount;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_addToSiriBundleIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_galleryIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_shortcutSource, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v12;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_numberOfShownSuggestions;
    *(_BYTE *)(v5 + 68) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v5 + 40) = self->_numberOfEngagedSuggestions;
  *(_BYTE *)(v5 + 68) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
LABEL_13:
    *(_DWORD *)(v5 + 44) = self->_numberOfManuallyAddedActions;
    *(_BYTE *)(v5 + 68) |= 4u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return (id)v5;
    goto LABEL_8;
  }
LABEL_12:
  *(_DWORD *)(v5 + 48) = self->_numberOfRejectedSuggestions;
  *(_BYTE *)(v5 + 68) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_13;
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 64) = self->_startingActionCount;
    *(_BYTE *)(v5 + 68) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *addToSiriBundleIdentifier;
  NSString *galleryIdentifier;
  NSString *shortcutSource;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_actionCount != *((_DWORD *)v4 + 2))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_39:
    v9 = 0;
    goto LABEL_40;
  }
  addToSiriBundleIdentifier = self->_addToSiriBundleIdentifier;
  if ((unint64_t)addToSiriBundleIdentifier | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](addToSiriBundleIdentifier, "isEqual:"))
  {
    goto LABEL_39;
  }
  galleryIdentifier = self->_galleryIdentifier;
  if ((unint64_t)galleryIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](galleryIdentifier, "isEqual:"))
      goto LABEL_39;
  }
  shortcutSource = self->_shortcutSource;
  if ((unint64_t)shortcutSource | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](shortcutSource, "isEqual:"))
      goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x10) == 0 || self->_numberOfShownSuggestions != *((_DWORD *)v4 + 13))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_numberOfEngagedSuggestions != *((_DWORD *)v4 + 10))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 8) == 0 || self->_numberOfRejectedSuggestions != *((_DWORD *)v4 + 12))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 68) & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_numberOfManuallyAddedActions != *((_DWORD *)v4 + 11))
      goto LABEL_39;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_39;
  }
  v9 = (*((_BYTE *)v4 + 68) & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x20) == 0 || self->_startingActionCount != *((_DWORD *)v4 + 16))
      goto LABEL_39;
    v9 = 1;
  }
LABEL_40:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[NSString hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_actionCount;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_addToSiriBundleIdentifier, "hash");
  v6 = -[NSString hash](self->_galleryIdentifier, "hash");
  v7 = -[NSString hash](self->_shortcutSource, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v8 = 2654435761 * self->_numberOfShownSuggestions;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_6:
      v9 = 2654435761 * self->_numberOfEngagedSuggestions;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v10 = 2654435761 * self->_numberOfRejectedSuggestions;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_8;
LABEL_13:
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_9;
LABEL_14:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_12:
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_13;
LABEL_8:
  v11 = 2654435761 * self->_numberOfManuallyAddedActions;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_9:
  v12 = 2654435761 * self->_startingActionCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  char v5;
  unsigned int *v6;

  v4 = (unsigned int *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[WFPBEditShortcutEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  if ((v4[17] & 1) != 0)
  {
    self->_actionCount = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBEditShortcutEvent setAddToSiriBundleIdentifier:](self, "setAddToSiriBundleIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBEditShortcutEvent setGalleryIdentifier:](self, "setGalleryIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[WFPBEditShortcutEvent setShortcutSource:](self, "setShortcutSource:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 0x10) != 0)
  {
    self->_numberOfShownSuggestions = v4[13];
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 68);
    if ((v5 & 2) == 0)
    {
LABEL_13:
      if ((v5 & 8) == 0)
        goto LABEL_14;
      goto LABEL_20;
    }
  }
  else if ((v4[17] & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_numberOfEngagedSuggestions = v4[10];
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 8) == 0)
  {
LABEL_14:
    if ((v5 & 4) == 0)
      goto LABEL_15;
LABEL_21:
    self->_numberOfManuallyAddedActions = v4[11];
    *(_BYTE *)&self->_has |= 4u;
    if ((v4[17] & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_20:
  self->_numberOfRejectedSuggestions = v4[12];
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 68);
  if ((v5 & 4) != 0)
    goto LABEL_21;
LABEL_15:
  if ((v5 & 0x20) != 0)
  {
LABEL_16:
    self->_startingActionCount = v4[16];
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_17:

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

- (unsigned)numberOfShownSuggestions
{
  return self->_numberOfShownSuggestions;
}

- (unsigned)numberOfEngagedSuggestions
{
  return self->_numberOfEngagedSuggestions;
}

- (unsigned)numberOfRejectedSuggestions
{
  return self->_numberOfRejectedSuggestions;
}

- (unsigned)numberOfManuallyAddedActions
{
  return self->_numberOfManuallyAddedActions;
}

- (unsigned)startingActionCount
{
  return self->_startingActionCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, 0);
}

@end
