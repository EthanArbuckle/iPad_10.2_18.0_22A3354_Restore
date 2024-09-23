@implementation WFPBRunActionEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("RunAction");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)runSource
{
  if (self->_runSource)
    return self->_runSource;
  else
    return (NSString *)CFSTR("unknown");
}

- (BOOL)hasRunSource
{
  return self->_runSource != 0;
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

- (BOOL)hasActionIdentifier
{
  return self->_actionIdentifier != 0;
}

- (BOOL)hasShortcutSource
{
  return self->_shortcutSource != 0;
}

- (BOOL)hasAutomationType
{
  return self->_automationType != 0;
}

- (void)setDidRunRemotely:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_didRunRemotely = a3;
}

- (void)setHasDidRunRemotely:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDidRunRemotely
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsInvalidatedSystemAction:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isInvalidatedSystemAction = a3;
}

- (void)setHasIsInvalidatedSystemAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsInvalidatedSystemAction
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasGalleryIdentifier
{
  return self->_galleryIdentifier != 0;
}

- (BOOL)hasExternalBundleIdentifier
{
  return self->_externalBundleIdentifier != 0;
}

- (BOOL)hasExternalActionIdentifier
{
  return self->_externalActionIdentifier != 0;
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
  v8.super_class = (Class)WFPBRunActionEvent;
  -[WFPBRunActionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBRunActionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *runSource;
  void *v7;
  NSString *actionIdentifier;
  NSString *shortcutSource;
  NSString *automationType;
  char has;
  void *v12;
  void *v13;
  NSString *galleryIdentifier;
  NSString *externalBundleIdentifier;
  NSString *externalActionIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  runSource = self->_runSource;
  if (runSource)
    objc_msgSend(v4, "setObject:forKey:", runSource, CFSTR("runSource"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_completed);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("completed"));

  }
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", actionIdentifier, CFSTR("actionIdentifier"));
  shortcutSource = self->_shortcutSource;
  if (shortcutSource)
    objc_msgSend(v4, "setObject:forKey:", shortcutSource, CFSTR("shortcutSource"));
  automationType = self->_automationType;
  if (automationType)
    objc_msgSend(v4, "setObject:forKey:", automationType, CFSTR("automationType"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didRunRemotely);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("didRunRemotely"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInvalidatedSystemAction);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("isInvalidatedSystemAction"));

  }
  galleryIdentifier = self->_galleryIdentifier;
  if (galleryIdentifier)
    objc_msgSend(v4, "setObject:forKey:", galleryIdentifier, CFSTR("galleryIdentifier"));
  externalBundleIdentifier = self->_externalBundleIdentifier;
  if (externalBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", externalBundleIdentifier, CFSTR("externalBundleIdentifier"));
  externalActionIdentifier = self->_externalActionIdentifier;
  if (externalActionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", externalActionIdentifier, CFSTR("externalActionIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBRunActionEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_runSource)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_actionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_shortcutSource)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_automationType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_galleryIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_externalBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_externalActionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  v6 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v6;
  }
  if (self->_runSource)
  {
    objc_msgSend(v6, "setRunSource:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[72] = self->_completed;
    v4[76] |= 1u;
  }
  if (self->_actionIdentifier)
  {
    objc_msgSend(v6, "setActionIdentifier:");
    v4 = v6;
  }
  if (self->_shortcutSource)
  {
    objc_msgSend(v6, "setShortcutSource:");
    v4 = v6;
  }
  if (self->_automationType)
  {
    objc_msgSend(v6, "setAutomationType:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[73] = self->_didRunRemotely;
    v4[76] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[74] = self->_isInvalidatedSystemAction;
    v4[76] |= 4u;
  }
  if (self->_galleryIdentifier)
  {
    objc_msgSend(v6, "setGalleryIdentifier:");
    v4 = v6;
  }
  if (self->_externalBundleIdentifier)
  {
    objc_msgSend(v6, "setExternalBundleIdentifier:");
    v4 = v6;
  }
  if (self->_externalActionIdentifier)
  {
    objc_msgSend(v6, "setExternalActionIdentifier:");
    v4 = v6;
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
  uint64_t v14;
  void *v15;
  char has;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_runSource, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 72) = self->_completed;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_actionIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  v12 = -[NSString copyWithZone:](self->_shortcutSource, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[NSString copyWithZone:](self->_automationType, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 73) = self->_didRunRemotely;
    *(_BYTE *)(v5 + 76) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 74) = self->_isInvalidatedSystemAction;
    *(_BYTE *)(v5 + 76) |= 4u;
  }
  v17 = -[NSString copyWithZone:](self->_galleryIdentifier, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v17;

  v19 = -[NSString copyWithZone:](self->_externalBundleIdentifier, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v19;

  v21 = -[NSString copyWithZone:](self->_externalActionIdentifier, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *runSource;
  NSString *actionIdentifier;
  NSString *shortcutSource;
  NSString *automationType;
  NSString *galleryIdentifier;
  NSString *externalBundleIdentifier;
  NSString *externalActionIdentifier;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_42;
  }
  runSource = self->_runSource;
  if ((unint64_t)runSource | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](runSource, "isEqual:"))
      goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0)
      goto LABEL_42;
    if (self->_completed)
    {
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_42;
    }
    else if (*((_BYTE *)v4 + 72))
    {
      goto LABEL_42;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_42;
  }
  actionIdentifier = self->_actionIdentifier;
  if ((unint64_t)actionIdentifier | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](actionIdentifier, "isEqual:"))
  {
    goto LABEL_42;
  }
  shortcutSource = self->_shortcutSource;
  if ((unint64_t)shortcutSource | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](shortcutSource, "isEqual:"))
      goto LABEL_42;
  }
  automationType = self->_automationType;
  if ((unint64_t)automationType | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](automationType, "isEqual:"))
      goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0)
      goto LABEL_42;
    if (self->_didRunRemotely)
    {
      if (!*((_BYTE *)v4 + 73))
        goto LABEL_42;
    }
    else if (*((_BYTE *)v4 + 73))
    {
      goto LABEL_42;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) != 0)
    {
      if (self->_isInvalidatedSystemAction)
      {
        if (!*((_BYTE *)v4 + 74))
          goto LABEL_42;
        goto LABEL_36;
      }
      if (!*((_BYTE *)v4 + 74))
        goto LABEL_36;
    }
LABEL_42:
    v13 = 0;
    goto LABEL_43;
  }
  if ((*((_BYTE *)v4 + 76) & 4) != 0)
    goto LABEL_42;
LABEL_36:
  galleryIdentifier = self->_galleryIdentifier;
  if ((unint64_t)galleryIdentifier | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](galleryIdentifier, "isEqual:"))
  {
    goto LABEL_42;
  }
  externalBundleIdentifier = self->_externalBundleIdentifier;
  if ((unint64_t)externalBundleIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](externalBundleIdentifier, "isEqual:"))
      goto LABEL_42;
  }
  externalActionIdentifier = self->_externalActionIdentifier;
  if ((unint64_t)externalActionIdentifier | *((_QWORD *)v4 + 3))
    v13 = -[NSString isEqual:](externalActionIdentifier, "isEqual:");
  else
    v13 = 1;
LABEL_43:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_runSource, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_completed;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_actionIdentifier, "hash");
  v7 = -[NSString hash](self->_shortcutSource, "hash");
  v8 = -[NSString hash](self->_automationType, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v9 = 2654435761 * self->_didRunRemotely;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v10 = 2654435761 * self->_isInvalidatedSystemAction;
LABEL_9:
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v12 = v10 ^ -[NSString hash](self->_galleryIdentifier, "hash");
  v13 = v12 ^ -[NSString hash](self->_externalBundleIdentifier, "hash");
  return v11 ^ v13 ^ -[NSString hash](self->_externalActionIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;
  BOOL *v6;

  v4 = (BOOL *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[WFPBRunActionEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[WFPBRunActionEvent setRunSource:](self, "setRunSource:");
    v4 = v6;
  }
  if (v4[76])
  {
    self->_completed = v4[72];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[WFPBRunActionEvent setActionIdentifier:](self, "setActionIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[WFPBRunActionEvent setShortcutSource:](self, "setShortcutSource:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBRunActionEvent setAutomationType:](self, "setAutomationType:");
    v4 = v6;
  }
  v5 = v4[76];
  if ((v5 & 2) != 0)
  {
    self->_didRunRemotely = v4[73];
    *(_BYTE *)&self->_has |= 2u;
    v5 = v4[76];
  }
  if ((v5 & 4) != 0)
  {
    self->_isInvalidatedSystemAction = v4[74];
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[WFPBRunActionEvent setGalleryIdentifier:](self, "setGalleryIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[WFPBRunActionEvent setExternalBundleIdentifier:](self, "setExternalBundleIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBRunActionEvent setExternalActionIdentifier:](self, "setExternalActionIdentifier:");
    v4 = v6;
  }

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (void)setRunSource:(id)a3
{
  objc_storeStrong((id *)&self->_runSource, a3);
}

- (BOOL)completed
{
  return self->_completed;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_actionIdentifier, a3);
}

- (NSString)shortcutSource
{
  return self->_shortcutSource;
}

- (void)setShortcutSource:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutSource, a3);
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setAutomationType:(id)a3
{
  objc_storeStrong((id *)&self->_automationType, a3);
}

- (BOOL)didRunRemotely
{
  return self->_didRunRemotely;
}

- (BOOL)isInvalidatedSystemAction
{
  return self->_isInvalidatedSystemAction;
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_galleryIdentifier, a3);
}

- (NSString)externalBundleIdentifier
{
  return self->_externalBundleIdentifier;
}

- (void)setExternalBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_externalBundleIdentifier, a3);
}

- (NSString)externalActionIdentifier
{
  return self->_externalActionIdentifier;
}

- (void)setExternalActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_externalActionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutSource, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_externalBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_externalActionIdentifier, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end
