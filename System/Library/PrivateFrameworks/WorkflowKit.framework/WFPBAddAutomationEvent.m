@implementation WFPBAddAutomationEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("AddAutomation");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasTriggerType
{
  return self->_triggerType != 0;
}

- (BOOL)hasIntentType
{
  return self->_intentType != 0;
}

- (BOOL)hasSource
{
  return self->_source != 0;
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

- (BOOL)hasShortcutIdentifier
{
  return self->_shortcutIdentifier != 0;
}

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
}

- (BOOL)hasActivityType
{
  return self->_activityType != 0;
}

- (BOOL)hasAutomationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier != 0;
}

- (void)setShowsNotification:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_showsNotification = a3;
}

- (void)setHasShowsNotification:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasShowsNotification
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setRequiresRuntimeConfirmation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requiresRuntimeConfirmation = a3;
}

- (void)setHasRequiresRuntimeConfirmation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequiresRuntimeConfirmation
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)WFPBAddAutomationEvent;
  -[WFPBAddAutomationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBAddAutomationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *triggerType;
  NSString *intentType;
  NSString *source;
  void *v9;
  NSString *shortcutIdentifier;
  NSString *appBundleIdentifier;
  NSString *activityType;
  NSString *automationSuggestionsTrialIdentifier;
  char has;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  triggerType = self->_triggerType;
  if (triggerType)
    objc_msgSend(v4, "setObject:forKey:", triggerType, CFSTR("triggerType"));
  intentType = self->_intentType;
  if (intentType)
    objc_msgSend(v4, "setObject:forKey:", intentType, CFSTR("intentType"));
  source = self->_source;
  if (source)
    objc_msgSend(v4, "setObject:forKey:", source, CFSTR("source"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_actionCount);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("actionCount"));

  }
  shortcutIdentifier = self->_shortcutIdentifier;
  if (shortcutIdentifier)
    objc_msgSend(v4, "setObject:forKey:", shortcutIdentifier, CFSTR("shortcutIdentifier"));
  appBundleIdentifier = self->_appBundleIdentifier;
  if (appBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", appBundleIdentifier, CFSTR("appBundleIdentifier"));
  activityType = self->_activityType;
  if (activityType)
    objc_msgSend(v4, "setObject:forKey:", activityType, CFSTR("activityType"));
  automationSuggestionsTrialIdentifier = self->_automationSuggestionsTrialIdentifier;
  if (automationSuggestionsTrialIdentifier)
    objc_msgSend(v4, "setObject:forKey:", automationSuggestionsTrialIdentifier, CFSTR("automationSuggestionsTrialIdentifier"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_showsNotification);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("showsNotification"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresRuntimeConfirmation);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("requiresRuntimeConfirmation"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBAddAutomationEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_triggerType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_intentType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_shortcutIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_appBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_activityType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_automationSuggestionsTrialIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
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
  if (self->_triggerType)
  {
    objc_msgSend(v6, "setTriggerType:");
    v4 = v6;
  }
  if (self->_intentType)
  {
    objc_msgSend(v6, "setIntentType:");
    v4 = v6;
  }
  if (self->_source)
  {
    objc_msgSend(v6, "setSource:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_actionCount;
    *((_BYTE *)v4 + 84) |= 1u;
  }
  if (self->_shortcutIdentifier)
  {
    objc_msgSend(v6, "setShortcutIdentifier:");
    v4 = v6;
  }
  if (self->_appBundleIdentifier)
  {
    objc_msgSend(v6, "setAppBundleIdentifier:");
    v4 = v6;
  }
  if (self->_activityType)
  {
    objc_msgSend(v6, "setActivityType:");
    v4 = v6;
  }
  if (self->_automationSuggestionsTrialIdentifier)
  {
    objc_msgSend(v6, "setAutomationSuggestionsTrialIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)v4 + 81) = self->_showsNotification;
    *((_BYTE *)v4 + 84) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 80) = self->_requiresRuntimeConfirmation;
    *((_BYTE *)v4 + 84) |= 2u;
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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_triggerType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v8;

  v10 = -[NSString copyWithZone:](self->_intentType, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_source, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_actionCount;
    *(_BYTE *)(v5 + 84) |= 1u;
  }
  v14 = -[NSString copyWithZone:](self->_shortcutIdentifier, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v16 = -[NSString copyWithZone:](self->_appBundleIdentifier, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v18 = -[NSString copyWithZone:](self->_activityType, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;

  v20 = -[NSString copyWithZone:](self->_automationSuggestionsTrialIdentifier, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v20;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 81) = self->_showsNotification;
    *(_BYTE *)(v5 + 84) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 80) = self->_requiresRuntimeConfirmation;
    *(_BYTE *)(v5 + 84) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *triggerType;
  NSString *intentType;
  NSString *source;
  NSString *shortcutIdentifier;
  NSString *appBundleIdentifier;
  NSString *activityType;
  NSString *automationSuggestionsTrialIdentifier;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_33;
  }
  triggerType = self->_triggerType;
  if ((unint64_t)triggerType | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](triggerType, "isEqual:"))
      goto LABEL_33;
  }
  intentType = self->_intentType;
  if ((unint64_t)intentType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](intentType, "isEqual:"))
      goto LABEL_33;
  }
  source = self->_source;
  if ((unint64_t)source | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](source, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_actionCount != *((_DWORD *)v4 + 2))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    goto LABEL_33;
  }
  shortcutIdentifier = self->_shortcutIdentifier;
  if ((unint64_t)shortcutIdentifier | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](shortcutIdentifier, "isEqual:"))
  {
    goto LABEL_33;
  }
  appBundleIdentifier = self->_appBundleIdentifier;
  if ((unint64_t)appBundleIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](appBundleIdentifier, "isEqual:"))
      goto LABEL_33;
  }
  activityType = self->_activityType;
  if ((unint64_t)activityType | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](activityType, "isEqual:"))
      goto LABEL_33;
  }
  automationSuggestionsTrialIdentifier = self->_automationSuggestionsTrialIdentifier;
  if ((unint64_t)automationSuggestionsTrialIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](automationSuggestionsTrialIdentifier, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 4) == 0)
      goto LABEL_33;
    if (self->_showsNotification)
    {
      if (!*((_BYTE *)v4 + 81))
        goto LABEL_33;
    }
    else if (*((_BYTE *)v4 + 81))
    {
      goto LABEL_33;
    }
  }
  else if ((*((_BYTE *)v4 + 84) & 4) != 0)
  {
    goto LABEL_33;
  }
  v13 = (*((_BYTE *)v4 + 84) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 2) != 0)
    {
      if (self->_requiresRuntimeConfirmation)
      {
        if (!*((_BYTE *)v4 + 80))
          goto LABEL_33;
      }
      else if (*((_BYTE *)v4 + 80))
      {
        goto LABEL_33;
      }
      v13 = 1;
      goto LABEL_34;
    }
LABEL_33:
    v13 = 0;
  }
LABEL_34:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v14;

  v14 = -[NSString hash](self->_key, "hash");
  v3 = -[NSString hash](self->_triggerType, "hash");
  v4 = -[NSString hash](self->_intentType, "hash");
  v5 = -[NSString hash](self->_source, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_actionCount;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_shortcutIdentifier, "hash");
  v8 = -[NSString hash](self->_appBundleIdentifier, "hash");
  v9 = -[NSString hash](self->_activityType, "hash");
  v10 = -[NSString hash](self->_automationSuggestionsTrialIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v11 = 2654435761 * self->_showsNotification;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v12 = 0;
    return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v12 = 2654435761 * self->_requiresRuntimeConfirmation;
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[WFPBAddAutomationEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[WFPBAddAutomationEvent setTriggerType:](self, "setTriggerType:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[WFPBAddAutomationEvent setIntentType:](self, "setIntentType:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[WFPBAddAutomationEvent setSource:](self, "setSource:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    self->_actionCount = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[WFPBAddAutomationEvent setShortcutIdentifier:](self, "setShortcutIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBAddAutomationEvent setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBAddAutomationEvent setActivityType:](self, "setActivityType:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[WFPBAddAutomationEvent setAutomationSuggestionsTrialIdentifier:](self, "setAutomationSuggestionsTrialIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 84);
  if ((v5 & 4) != 0)
  {
    self->_showsNotification = *((_BYTE *)v4 + 81);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 84);
  }
  if ((v5 & 2) != 0)
  {
    self->_requiresRuntimeConfirmation = *((_BYTE *)v4 + 80);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(id)a3
{
  objc_storeStrong((id *)&self->_triggerType, a3);
}

- (NSString)intentType
{
  return self->_intentType;
}

- (void)setIntentType:(id)a3
{
  objc_storeStrong((id *)&self->_intentType, a3);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (unsigned)actionCount
{
  return self->_actionCount;
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)setShortcutIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutIdentifier, a3);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, a3);
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_activityType, a3);
}

- (NSString)automationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier;
}

- (void)setAutomationSuggestionsTrialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, a3);
}

- (BOOL)showsNotification
{
  return self->_showsNotification;
}

- (BOOL)requiresRuntimeConfirmation
{
  return self->_requiresRuntimeConfirmation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
