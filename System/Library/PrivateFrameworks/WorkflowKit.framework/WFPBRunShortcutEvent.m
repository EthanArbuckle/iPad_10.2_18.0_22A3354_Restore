@implementation WFPBRunShortcutEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("RunShortcut");
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

- (BOOL)hasAutomationType
{
  return self->_automationType != 0;
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

- (void)setCompleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_completed = a3;
}

- (void)setHasCompleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCompleted
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDidRunRemotely:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_didRunRemotely = a3;
}

- (void)setHasDidRunRemotely:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDidRunRemotely
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasShortcutSource
{
  return self->_shortcutSource != 0;
}

- (BOOL)hasGalleryIdentifier
{
  return self->_galleryIdentifier != 0;
}

- (void)setNumberOfDialogsPresented:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numberOfDialogsPresented = a3;
}

- (void)setHasNumberOfDialogsPresented:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumberOfDialogsPresented
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDidPresentShareSheet:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_didPresentShareSheet = a3;
}

- (void)setHasDidPresentShareSheet:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDidPresentShareSheet
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsFromAutomationSuggestion:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isFromAutomationSuggestion = a3;
}

- (void)setHasIsFromAutomationSuggestion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsFromAutomationSuggestion
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasAutomationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier != 0;
}

- (BOOL)hasScriptingRunBundleIdentifier
{
  return self->_scriptingRunBundleIdentifier != 0;
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
  v8.super_class = (Class)WFPBRunShortcutEvent;
  -[WFPBRunShortcutEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBRunShortcutEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *automationType;
  char has;
  void *v9;
  NSString *shortcutSource;
  NSString *galleryIdentifier;
  char v12;
  void *v13;
  NSString *automationSuggestionsTrialIdentifier;
  NSString *scriptingRunBundleIdentifier;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  runSource = self->_runSource;
  if (runSource)
    objc_msgSend(v4, "setObject:forKey:", runSource, CFSTR("runSource"));
  automationType = self->_automationType;
  if (automationType)
    objc_msgSend(v4, "setObject:forKey:", automationType, CFSTR("automationType"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_actionCount);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("actionCount"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_completed);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("completed"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didRunRemotely);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("didRunRemotely"));

  }
LABEL_11:
  shortcutSource = self->_shortcutSource;
  if (shortcutSource)
    objc_msgSend(v4, "setObject:forKey:", shortcutSource, CFSTR("shortcutSource"));
  galleryIdentifier = self->_galleryIdentifier;
  if (galleryIdentifier)
    objc_msgSend(v4, "setObject:forKey:", galleryIdentifier, CFSTR("galleryIdentifier"));
  v12 = (char)self->_has;
  if ((v12 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numberOfDialogsPresented);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("numberOfDialogsPresented"));

    v12 = (char)self->_has;
    if ((v12 & 8) == 0)
    {
LABEL_17:
      if ((v12 & 0x20) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didPresentShareSheet);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("didPresentShareSheet"));

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFromAutomationSuggestion);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("isFromAutomationSuggestion"));

  }
LABEL_19:
  automationSuggestionsTrialIdentifier = self->_automationSuggestionsTrialIdentifier;
  if (automationSuggestionsTrialIdentifier)
    objc_msgSend(v4, "setObject:forKey:", automationSuggestionsTrialIdentifier, CFSTR("automationSuggestionsTrialIdentifier"));
  scriptingRunBundleIdentifier = self->_scriptingRunBundleIdentifier;
  if (scriptingRunBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", scriptingRunBundleIdentifier, CFSTR("scriptingRunBundleIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBRunShortcutEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_runSource)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_automationType)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v7;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
LABEL_11:
  if (self->_shortcutSource)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_galleryIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v7;
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_17:
      if ((v6 & 0x20) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_18:
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }
LABEL_19:
  if (self->_automationSuggestionsTrialIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_scriptingRunBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v7;
  }
  if (self->_runSource)
  {
    objc_msgSend(v7, "setRunSource:");
    v4 = v7;
  }
  if (self->_automationType)
  {
    objc_msgSend(v7, "setAutomationType:");
    v4 = v7;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_actionCount;
    *((_BYTE *)v4 + 84) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_BYTE *)v4 + 80) = self->_completed;
  *((_BYTE *)v4 + 84) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    *((_BYTE *)v4 + 82) = self->_didRunRemotely;
    *((_BYTE *)v4 + 84) |= 0x10u;
  }
LABEL_11:
  if (self->_shortcutSource)
  {
    objc_msgSend(v7, "setShortcutSource:");
    v4 = v7;
  }
  if (self->_galleryIdentifier)
  {
    objc_msgSend(v7, "setGalleryIdentifier:");
    v4 = v7;
  }
  v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_numberOfDialogsPresented;
    *((_BYTE *)v4 + 84) |= 2u;
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_17:
      if ((v6 & 0x20) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_17;
  }
  *((_BYTE *)v4 + 81) = self->_didPresentShareSheet;
  *((_BYTE *)v4 + 84) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_18:
    *((_BYTE *)v4 + 83) = self->_isFromAutomationSuggestion;
    *((_BYTE *)v4 + 84) |= 0x20u;
  }
LABEL_19:
  if (self->_automationSuggestionsTrialIdentifier)
  {
    objc_msgSend(v7, "setAutomationSuggestionsTrialIdentifier:");
    v4 = v7;
  }
  if (self->_scriptingRunBundleIdentifier)
  {
    objc_msgSend(v7, "setScriptingRunBundleIdentifier:");
    v4 = v7;
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
  char has;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_runSource, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSString copyWithZone:](self->_automationType, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_actionCount;
    *(_BYTE *)(v5 + 84) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 80) = self->_completed;
  *(_BYTE *)(v5 + 84) |= 4u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 82) = self->_didRunRemotely;
    *(_BYTE *)(v5 + 84) |= 0x10u;
  }
LABEL_5:
  v13 = -[NSString copyWithZone:](self->_shortcutSource, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v13;

  v15 = -[NSString copyWithZone:](self->_galleryIdentifier, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  v17 = (char)self->_has;
  if ((v17 & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
LABEL_14:
    *(_BYTE *)(v5 + 81) = self->_didPresentShareSheet;
    *(_BYTE *)(v5 + 84) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 48) = self->_numberOfDialogsPresented;
  *(_BYTE *)(v5 + 84) |= 2u;
  v17 = (char)self->_has;
  if ((v17 & 8) != 0)
    goto LABEL_14;
LABEL_7:
  if ((v17 & 0x20) != 0)
  {
LABEL_8:
    *(_BYTE *)(v5 + 83) = self->_isFromAutomationSuggestion;
    *(_BYTE *)(v5 + 84) |= 0x20u;
  }
LABEL_9:
  v18 = -[NSString copyWithZone:](self->_automationSuggestionsTrialIdentifier, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;

  v20 = -[NSString copyWithZone:](self->_scriptingRunBundleIdentifier, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *runSource;
  NSString *automationType;
  NSString *shortcutSource;
  NSString *galleryIdentifier;
  NSString *automationSuggestionsTrialIdentifier;
  NSString *scriptingRunBundleIdentifier;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_58;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_58;
  }
  runSource = self->_runSource;
  if ((unint64_t)runSource | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](runSource, "isEqual:"))
      goto LABEL_58;
  }
  automationType = self->_automationType;
  if ((unint64_t)automationType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](automationType, "isEqual:"))
      goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_actionCount != *((_DWORD *)v4 + 2))
      goto LABEL_58;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 4) == 0)
      goto LABEL_58;
    if (self->_completed)
    {
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_58;
    }
    else if (*((_BYTE *)v4 + 80))
    {
      goto LABEL_58;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 4) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 0x10) == 0)
      goto LABEL_58;
    if (self->_didRunRemotely)
    {
      if (!*((_BYTE *)v4 + 82))
        goto LABEL_58;
    }
    else if (*((_BYTE *)v4 + 82))
    {
      goto LABEL_58;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 0x10) != 0)
  {
    goto LABEL_58;
  }
  shortcutSource = self->_shortcutSource;
  if ((unint64_t)shortcutSource | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](shortcutSource, "isEqual:"))
  {
    goto LABEL_58;
  }
  galleryIdentifier = self->_galleryIdentifier;
  if ((unint64_t)galleryIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](galleryIdentifier, "isEqual:"))
      goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) == 0 || self->_numberOfDialogsPresented != *((_DWORD *)v4 + 12))
      goto LABEL_58;
  }
  else if ((*((_BYTE *)v4 + 84) & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 8) == 0)
      goto LABEL_58;
    if (self->_didPresentShareSheet)
    {
      if (!*((_BYTE *)v4 + 81))
        goto LABEL_58;
    }
    else if (*((_BYTE *)v4 + 81))
    {
      goto LABEL_58;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 8) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 0x20) != 0)
    {
      if (self->_isFromAutomationSuggestion)
      {
        if (!*((_BYTE *)v4 + 83))
          goto LABEL_58;
        goto LABEL_54;
      }
      if (!*((_BYTE *)v4 + 83))
        goto LABEL_54;
    }
LABEL_58:
    v12 = 0;
    goto LABEL_59;
  }
  if ((*((_BYTE *)v4 + 84) & 0x20) != 0)
    goto LABEL_58;
LABEL_54:
  automationSuggestionsTrialIdentifier = self->_automationSuggestionsTrialIdentifier;
  if ((unint64_t)automationSuggestionsTrialIdentifier | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](automationSuggestionsTrialIdentifier, "isEqual:"))
  {
    goto LABEL_58;
  }
  scriptingRunBundleIdentifier = self->_scriptingRunBundleIdentifier;
  if ((unint64_t)scriptingRunBundleIdentifier | *((_QWORD *)v4 + 8))
    v12 = -[NSString isEqual:](scriptingRunBundleIdentifier, "isEqual:");
  else
    v12 = 1;
LABEL_59:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_runSource, "hash");
  v5 = -[NSString hash](self->_automationType, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v6 = 2654435761 * self->_actionCount;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v7 = 2654435761 * self->_completed;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v8 = 2654435761 * self->_didRunRemotely;
    goto LABEL_8;
  }
LABEL_7:
  v8 = 0;
LABEL_8:
  v9 = -[NSString hash](self->_shortcutSource, "hash");
  v10 = -[NSString hash](self->_galleryIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_10;
LABEL_13:
    v12 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_11;
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v11 = 2654435761 * self->_numberOfDialogsPresented;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_10:
  v12 = 2654435761 * self->_didPresentShareSheet;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_11:
  v13 = 2654435761 * self->_isFromAutomationSuggestion;
LABEL_15:
  v14 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  v15 = v11 ^ v12 ^ v13 ^ -[NSString hash](self->_automationSuggestionsTrialIdentifier, "hash");
  return v14 ^ v15 ^ -[NSString hash](self->_scriptingRunBundleIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[WFPBRunShortcutEvent setKey:](self, "setKey:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[WFPBRunShortcutEvent setRunSource:](self, "setRunSource:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBRunShortcutEvent setAutomationType:](self, "setAutomationType:");
    v4 = v7;
  }
  v5 = *((_BYTE *)v4 + 84);
  if ((v5 & 1) != 0)
  {
    self->_actionCount = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 84);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_completed = *((_BYTE *)v4 + 80);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 84) & 0x10) != 0)
  {
LABEL_10:
    self->_didRunRemotely = *((_BYTE *)v4 + 82);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 9))
  {
    -[WFPBRunShortcutEvent setShortcutSource:](self, "setShortcutSource:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[WFPBRunShortcutEvent setGalleryIdentifier:](self, "setGalleryIdentifier:");
    v4 = v7;
  }
  v6 = *((_BYTE *)v4 + 84);
  if ((v6 & 2) != 0)
  {
    self->_numberOfDialogsPresented = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 84);
    if ((v6 & 8) == 0)
    {
LABEL_17:
      if ((v6 & 0x20) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 8) == 0)
  {
    goto LABEL_17;
  }
  self->_didPresentShareSheet = *((_BYTE *)v4 + 81);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 84) & 0x20) != 0)
  {
LABEL_18:
    self->_isFromAutomationSuggestion = *((_BYTE *)v4 + 83);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_19:
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBRunShortcutEvent setAutomationSuggestionsTrialIdentifier:](self, "setAutomationSuggestionsTrialIdentifier:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[WFPBRunShortcutEvent setScriptingRunBundleIdentifier:](self, "setScriptingRunBundleIdentifier:");
    v4 = v7;
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

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setAutomationType:(id)a3
{
  objc_storeStrong((id *)&self->_automationType, a3);
}

- (unsigned)actionCount
{
  return self->_actionCount;
}

- (BOOL)completed
{
  return self->_completed;
}

- (BOOL)didRunRemotely
{
  return self->_didRunRemotely;
}

- (NSString)shortcutSource
{
  return self->_shortcutSource;
}

- (void)setShortcutSource:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutSource, a3);
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_galleryIdentifier, a3);
}

- (unsigned)numberOfDialogsPresented
{
  return self->_numberOfDialogsPresented;
}

- (BOOL)didPresentShareSheet
{
  return self->_didPresentShareSheet;
}

- (BOOL)isFromAutomationSuggestion
{
  return self->_isFromAutomationSuggestion;
}

- (NSString)automationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier;
}

- (void)setAutomationSuggestionsTrialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, a3);
}

- (NSString)scriptingRunBundleIdentifier
{
  return self->_scriptingRunBundleIdentifier;
}

- (void)setScriptingRunBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_scriptingRunBundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutSource, 0);
  objc_storeStrong((id *)&self->_scriptingRunBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, 0);
}

@end
