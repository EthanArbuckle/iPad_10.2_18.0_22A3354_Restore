@implementation WFPBSetupAutomationEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("SetupAutomationEvent");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasTriggerType
{
  return self->_triggerType != 0;
}

- (void)setRequiredRuntimeConfirmation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requiredRuntimeConfirmation = a3;
}

- (void)setHasRequiredRuntimeConfirmation:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequiredRuntimeConfirmation
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setShowsNotification:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_showsNotification = a3;
}

- (void)setHasShowsNotification:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShowsNotification
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasActionIdentifier
{
  return self->_actionIdentifier != 0;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
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
  v8.super_class = (Class)WFPBSetupAutomationEvent;
  -[WFPBSetupAutomationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBSetupAutomationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  char has;
  void *v8;
  void *v9;
  NSString *actionIdentifier;
  NSString *bundleIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  triggerType = self->_triggerType;
  if (triggerType)
    objc_msgSend(v4, "setObject:forKey:", triggerType, CFSTR("triggerType"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiredRuntimeConfirmation);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("requiredRuntimeConfirmation"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_showsNotification);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("showsNotification"));

  }
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", actionIdentifier, CFSTR("actionIdentifier"));
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBSetupAutomationEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  has = (char)self->_has;
  if ((has & 1) != 0)
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
  if (self->_actionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_bundleIdentifier)
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
  if (self->_triggerType)
  {
    objc_msgSend(v6, "setTriggerType:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[40] = self->_requiredRuntimeConfirmation;
    v4[44] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[41] = self->_showsNotification;
    v4[44] |= 2u;
  }
  if (self->_actionIdentifier)
  {
    objc_msgSend(v6, "setActionIdentifier:");
    v4 = v6;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v6, "setBundleIdentifier:");
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
  char has;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_triggerType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_requiredRuntimeConfirmation;
    *(_BYTE *)(v5 + 44) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 41) = self->_showsNotification;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  v11 = -[NSString copyWithZone:](self->_actionIdentifier, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v11;

  v13 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *triggerType;
  NSString *actionIdentifier;
  NSString *bundleIdentifier;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_26;
  }
  triggerType = self->_triggerType;
  if ((unint64_t)triggerType | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](triggerType, "isEqual:"))
      goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0)
      goto LABEL_26;
    if (self->_requiredRuntimeConfirmation)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_26;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_26;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_showsNotification)
      {
        if (!*((_BYTE *)v4 + 41))
          goto LABEL_26;
        goto LABEL_22;
      }
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_22;
    }
LABEL_26:
    v9 = 0;
    goto LABEL_27;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
    goto LABEL_26;
LABEL_22:
  actionIdentifier = self->_actionIdentifier;
  if ((unint64_t)actionIdentifier | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](actionIdentifier, "isEqual:"))
  {
    goto LABEL_26;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((_QWORD *)v4 + 2))
    v9 = -[NSString isEqual:](bundleIdentifier, "isEqual:");
  else
    v9 = 1;
LABEL_27:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_triggerType, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_requiredRuntimeConfirmation;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_showsNotification;
LABEL_6:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_actionIdentifier, "hash");
  return v7 ^ -[NSString hash](self->_bundleIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;
  BOOL *v6;

  v4 = (BOOL *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBSetupAutomationEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[WFPBSetupAutomationEvent setTriggerType:](self, "setTriggerType:");
    v4 = v6;
  }
  v5 = v4[44];
  if (v5)
  {
    self->_requiredRuntimeConfirmation = v4[40];
    *(_BYTE *)&self->_has |= 1u;
    v5 = v4[44];
  }
  if ((v5 & 2) != 0)
  {
    self->_showsNotification = v4[41];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[WFPBSetupAutomationEvent setActionIdentifier:](self, "setActionIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBSetupAutomationEvent setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v6;
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

- (BOOL)requiredRuntimeConfirmation
{
  return self->_requiredRuntimeConfirmation;
}

- (BOOL)showsNotification
{
  return self->_showsNotification;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_actionIdentifier, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end
