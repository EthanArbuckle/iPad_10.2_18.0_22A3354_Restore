@implementation WFPBPersonalAutomationSuggestionEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("PersonalAutomationSuggestion");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasIntentType
{
  return self->_intentType != 0;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (void)setVisible:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_visible = a3;
}

- (void)setHasVisible:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVisible
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setInteracted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_interacted = a3;
}

- (void)setHasInteracted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInteracted
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
}

- (BOOL)hasActivityType
{
  return self->_activityType != 0;
}

- (BOOL)hasTriggerType
{
  return self->_triggerType != 0;
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
  v8.super_class = (Class)WFPBPersonalAutomationSuggestionEvent;
  -[WFPBPersonalAutomationSuggestionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBPersonalAutomationSuggestionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *intentType;
  NSString *source;
  char has;
  void *v9;
  NSString *appBundleIdentifier;
  NSString *activityType;
  NSString *triggerType;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  intentType = self->_intentType;
  if (intentType)
    objc_msgSend(v4, "setObject:forKey:", intentType, CFSTR("intentType"));
  source = self->_source;
  if (source)
    objc_msgSend(v4, "setObject:forKey:", source, CFSTR("source"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_visible);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("visible"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_interacted);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("interacted"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_completed);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("completed"));

  }
LABEL_11:
  appBundleIdentifier = self->_appBundleIdentifier;
  if (appBundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", appBundleIdentifier, CFSTR("appBundleIdentifier"));
  activityType = self->_activityType;
  if (activityType)
    objc_msgSend(v4, "setObject:forKey:", activityType, CFSTR("activityType"));
  triggerType = self->_triggerType;
  if (triggerType)
    objc_msgSend(v4, "setObject:forKey:", triggerType, CFSTR("triggerType"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBPersonalAutomationSuggestionEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_10:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_11:
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
  if (self->_triggerType)
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
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[58] = self->_visible;
    v4[60] |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v4[57] = self->_interacted;
  v4[60] |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_10:
    v4[56] = self->_completed;
    v4[60] |= 1u;
  }
LABEL_11:
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
  if (self->_triggerType)
  {
    objc_msgSend(v6, "setTriggerType:");
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
  char has;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_intentType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_source, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v5 + 57) = self->_interacted;
    *(_BYTE *)(v5 + 60) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_BYTE *)(v5 + 58) = self->_visible;
  *(_BYTE *)(v5 + 60) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 56) = self->_completed;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
LABEL_5:
  v13 = -[NSString copyWithZone:](self->_appBundleIdentifier, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;

  v15 = -[NSString copyWithZone:](self->_activityType, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v15;

  v17 = -[NSString copyWithZone:](self->_triggerType, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v17;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *intentType;
  NSString *source;
  NSString *appBundleIdentifier;
  NSString *activityType;
  NSString *triggerType;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_38;
  }
  intentType = self->_intentType;
  if ((unint64_t)intentType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](intentType, "isEqual:"))
      goto LABEL_38;
  }
  source = self->_source;
  if ((unint64_t)source | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](source, "isEqual:"))
      goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0)
      goto LABEL_38;
    if (self->_visible)
    {
      if (!*((_BYTE *)v4 + 58))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 58))
    {
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0)
      goto LABEL_38;
    if (self->_interacted)
    {
      if (!*((_BYTE *)v4 + 57))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 57))
    {
      goto LABEL_38;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) != 0)
    {
      if (self->_completed)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_38;
        goto LABEL_32;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_32;
    }
LABEL_38:
    v11 = 0;
    goto LABEL_39;
  }
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
    goto LABEL_38;
LABEL_32:
  appBundleIdentifier = self->_appBundleIdentifier;
  if ((unint64_t)appBundleIdentifier | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](appBundleIdentifier, "isEqual:"))
  {
    goto LABEL_38;
  }
  activityType = self->_activityType;
  if ((unint64_t)activityType | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](activityType, "isEqual:"))
      goto LABEL_38;
  }
  triggerType = self->_triggerType;
  if ((unint64_t)triggerType | *((_QWORD *)v4 + 6))
    v11 = -[NSString isEqual:](triggerType, "isEqual:");
  else
    v11 = 1;
LABEL_39:

  return v11;
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
  NSUInteger v11;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_intentType, "hash");
  v5 = -[NSString hash](self->_source, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v6 = 2654435761 * self->_visible;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v7 = 2654435761 * self->_interacted;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v8 = 2654435761 * self->_completed;
LABEL_8:
  v9 = v4 ^ v3 ^ v5 ^ v6;
  v10 = v7 ^ v8 ^ -[NSString hash](self->_appBundleIdentifier, "hash");
  v11 = v9 ^ v10 ^ -[NSString hash](self->_activityType, "hash");
  return v11 ^ -[NSString hash](self->_triggerType, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;
  BOOL *v6;

  v4 = (BOOL *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[WFPBPersonalAutomationSuggestionEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBPersonalAutomationSuggestionEvent setIntentType:](self, "setIntentType:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[WFPBPersonalAutomationSuggestionEvent setSource:](self, "setSource:");
    v4 = v6;
  }
  v5 = v4[60];
  if ((v5 & 4) != 0)
  {
    self->_visible = v4[58];
    *(_BYTE *)&self->_has |= 4u;
    v5 = v4[60];
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if (!v5)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((v4[60] & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_interacted = v4[57];
  *(_BYTE *)&self->_has |= 2u;
  if (v4[60])
  {
LABEL_10:
    self->_completed = v4[56];
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBPersonalAutomationSuggestionEvent setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[WFPBPersonalAutomationSuggestionEvent setActivityType:](self, "setActivityType:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[WFPBPersonalAutomationSuggestionEvent setTriggerType:](self, "setTriggerType:");
    v4 = v6;
  }

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
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

- (BOOL)visible
{
  return self->_visible;
}

- (BOOL)interacted
{
  return self->_interacted;
}

- (BOOL)completed
{
  return self->_completed;
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

- (NSString)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(id)a3
{
  objc_storeStrong((id *)&self->_triggerType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
