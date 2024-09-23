@implementation WFPBTriggeredAutomationEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("TriggeredAutomation");
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
  *(_BYTE *)&self->_has |= 4u;
  self->_requiredRuntimeConfirmation = a3;
}

- (void)setHasRequiredRuntimeConfirmation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRequiredRuntimeConfirmation
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBatchCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_batchCount = a3;
}

- (void)setHasBatchCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBatchCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setBatchDroppedCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_batchDroppedCount = a3;
}

- (void)setHasBatchDroppedCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBatchDroppedCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setShowsNotification:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_showsNotification = a3;
}

- (void)setHasShowsNotification:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasShowsNotification
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)WFPBTriggeredAutomationEvent;
  -[WFPBTriggeredAutomationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBTriggeredAutomationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v10;
  void *v11;
  void *v12;

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
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiredRuntimeConfirmation);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("requiredRuntimeConfirmation"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_batchDroppedCount);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("batchDroppedCount"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_batchCount);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("batchCount"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 8) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_showsNotification);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("showsNotification"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBTriggeredAutomationEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
LABEL_13:
      PBDataWriterWriteUint32Field();
      v4 = v6;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 8) != 0)
  {
LABEL_9:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_10:

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
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_requiredRuntimeConfirmation;
    *((_BYTE *)v4 + 36) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
LABEL_13:
      *((_DWORD *)v4 + 3) = self->_batchDroppedCount;
      *((_BYTE *)v4 + 36) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 2) = self->_batchCount;
  *((_BYTE *)v4 + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 8) != 0)
  {
LABEL_9:
    *((_BYTE *)v4 + 33) = self->_showsNotification;
    *((_BYTE *)v4 + 36) |= 8u;
  }
LABEL_10:

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

  v8 = -[NSString copyWithZone:](self->_triggerType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_requiredRuntimeConfirmation;
    *(_BYTE *)(v5 + 36) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 12) = self->_batchDroppedCount;
      *(_BYTE *)(v5 + 36) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 8) = self->_batchCount;
  *(_BYTE *)(v5 + 36) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_BYTE *)(v5 + 33) = self->_showsNotification;
    *(_BYTE *)(v5 + 36) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *triggerType;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_26;
  }
  triggerType = self->_triggerType;
  if ((unint64_t)triggerType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](triggerType, "isEqual:"))
      goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0)
      goto LABEL_26;
    if (self->_requiredRuntimeConfirmation)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_26;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_26;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_batchCount != *((_DWORD *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_batchDroppedCount != *((_DWORD *)v4 + 3))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_26;
  }
  v7 = (*((_BYTE *)v4 + 36) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) != 0)
    {
      if (self->_showsNotification)
      {
        if (!*((_BYTE *)v4 + 33))
          goto LABEL_26;
      }
      else if (*((_BYTE *)v4 + 33))
      {
        goto LABEL_26;
      }
      v7 = 1;
      goto LABEL_27;
    }
LABEL_26:
    v7 = 0;
  }
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_triggerType, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761 * self->_requiredRuntimeConfirmation;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_batchCount;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v7 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v7 = 2654435761 * self->_batchDroppedCount;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v8 = 2654435761 * self->_showsNotification;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
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
    -[WFPBTriggeredAutomationEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBTriggeredAutomationEvent setTriggerType:](self, "setTriggerType:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 4) != 0)
  {
    self->_requiredRuntimeConfirmation = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0)
        goto LABEL_8;
LABEL_13:
      self->_batchDroppedCount = *((_DWORD *)v4 + 3);
      *(_BYTE *)&self->_has |= 2u;
      if ((*((_BYTE *)v4 + 36) & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 1) == 0)
  {
    goto LABEL_7;
  }
  self->_batchCount = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((v5 & 8) != 0)
  {
LABEL_9:
    self->_showsNotification = *((_BYTE *)v4 + 33);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_10:

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

- (unsigned)batchCount
{
  return self->_batchCount;
}

- (unsigned)batchDroppedCount
{
  return self->_batchDroppedCount;
}

- (BOOL)showsNotification
{
  return self->_showsNotification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
