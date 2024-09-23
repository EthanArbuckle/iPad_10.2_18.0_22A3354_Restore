@implementation WFPBSuggestAutomationEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("SuggestAutomation");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasSuggestedAutomationIdentifier
{
  return self->_suggestedAutomationIdentifier != 0;
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

- (BOOL)hasSource
{
  return self->_source != 0;
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
  v8.super_class = (Class)WFPBSuggestAutomationEvent;
  -[WFPBSuggestAutomationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBSuggestAutomationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *source;

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
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_interacted);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("interacted"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_completed);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("completed"));

  }
  source = self->_source;
  if (source)
    objc_msgSend(v4, "setObject:forKey:", source, CFSTR("source"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBSuggestAutomationEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_source)
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
  if (self->_suggestedAutomationIdentifier)
  {
    objc_msgSend(v6, "setSuggestedAutomationIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[33] = self->_interacted;
    v4[36] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[32] = self->_completed;
    v4[36] |= 1u;
  }
  if (self->_source)
  {
    objc_msgSend(v6, "setSource:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_suggestedAutomationIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 33) = self->_interacted;
    *(_BYTE *)(v5 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_completed;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v11 = -[NSString copyWithZone:](self->_source, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *suggestedAutomationIdentifier;
  char v7;
  NSString *source;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_18;
  }
  suggestedAutomationIdentifier = self->_suggestedAutomationIdentifier;
  if ((unint64_t)suggestedAutomationIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](suggestedAutomationIdentifier, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
      goto LABEL_18;
    if (self->_interacted)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_18;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
      goto LABEL_24;
LABEL_18:
    v7 = 0;
    goto LABEL_19;
  }
  if ((*((_BYTE *)v4 + 36) & 1) == 0)
    goto LABEL_18;
  if (!self->_completed)
  {
    if (!*((_BYTE *)v4 + 32))
      goto LABEL_24;
    goto LABEL_18;
  }
  if (!*((_BYTE *)v4 + 32))
    goto LABEL_18;
LABEL_24:
  source = self->_source;
  if ((unint64_t)source | *((_QWORD *)v4 + 2))
    v7 = -[NSString isEqual:](source, "isEqual:");
  else
    v7 = 1;
LABEL_19:

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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_interacted;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_source, "hash");
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_completed;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_source, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;
  BOOL *v6;

  v4 = (BOOL *)a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[WFPBSuggestAutomationEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBSuggestAutomationEvent setSuggestedAutomationIdentifier:](self, "setSuggestedAutomationIdentifier:");
    v4 = v6;
  }
  v5 = v4[36];
  if ((v5 & 2) != 0)
  {
    self->_interacted = v4[33];
    *(_BYTE *)&self->_has |= 2u;
    v5 = v4[36];
  }
  if (v5)
  {
    self->_completed = v4[32];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBSuggestAutomationEvent setSource:](self, "setSource:");
    v4 = v6;
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

- (BOOL)interacted
{
  return self->_interacted;
}

- (BOOL)completed
{
  return self->_completed;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAutomationIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
