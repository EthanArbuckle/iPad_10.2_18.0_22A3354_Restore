@implementation WFPBSetupSuggestedAutomationEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("SetupSuggestedAutomation");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasSuggestedAutomationIdentifier
{
  return self->_suggestedAutomationIdentifier != 0;
}

- (void)setCurrentStep:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_currentStep = a3;
}

- (void)setHasCurrentStep:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCurrentStep
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCompleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_completed = a3;
}

- (void)setHasCompleted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCompleted
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
  v8.super_class = (Class)WFPBSetupSuggestedAutomationEvent;
  -[WFPBSetupSuggestedAutomationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBSetupSuggestedAutomationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *suggestedAutomationIdentifier;
  char has;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  suggestedAutomationIdentifier = self->_suggestedAutomationIdentifier;
  if (suggestedAutomationIdentifier)
    objc_msgSend(v4, "setObject:forKey:", suggestedAutomationIdentifier, CFSTR("suggestedAutomationIdentifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_currentStep);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("currentStep"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_completed);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("completed"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBSetupSuggestedAutomationEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_suggestedAutomationIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
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
  if (self->_suggestedAutomationIdentifier)
  {
    objc_msgSend(v6, "setSuggestedAutomationIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_currentStep;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_completed;
    *((_BYTE *)v4 + 36) |= 2u;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_suggestedAutomationIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_currentStep;
    *(_BYTE *)(v5 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_completed;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *suggestedAutomationIdentifier;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_13;
  }
  suggestedAutomationIdentifier = self->_suggestedAutomationIdentifier;
  if ((unint64_t)suggestedAutomationIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](suggestedAutomationIdentifier, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_currentStep != *((_DWORD *)v4 + 2))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_13;
  }
  v7 = (*((_BYTE *)v4 + 36) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
    {
LABEL_13:
      v7 = 0;
      goto LABEL_14;
    }
    if (self->_completed)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_13;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_13;
    }
    v7 = 1;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_suggestedAutomationIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_currentStep;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_completed;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBSetupSuggestedAutomationEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBSetupSuggestedAutomationEvent setSuggestedAutomationIdentifier:](self, "setSuggestedAutomationIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 1) != 0)
  {
    self->_currentStep = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_completed = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)suggestedAutomationIdentifier
{
  return self->_suggestedAutomationIdentifier;
}

- (void)setSuggestedAutomationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedAutomationIdentifier, a3);
}

- (unsigned)currentStep
{
  return self->_currentStep;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAutomationIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
