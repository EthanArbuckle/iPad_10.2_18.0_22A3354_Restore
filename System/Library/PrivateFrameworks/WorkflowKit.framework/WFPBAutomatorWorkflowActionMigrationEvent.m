@implementation WFPBAutomatorWorkflowActionMigrationEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("AutomatorWorkflowActionMigrationEvent");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasAutomatorActionIdentifier
{
  return self->_automatorActionIdentifier != 0;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFPBAutomatorWorkflowActionMigrationEvent;
  -[WFPBAutomatorWorkflowActionMigrationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBAutomatorWorkflowActionMigrationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *automatorActionIdentifier;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  automatorActionIdentifier = self->_automatorActionIdentifier;
  if (automatorActionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", automatorActionIdentifier, CFSTR("automatorActionIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_completed);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("completed"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBAutomatorWorkflowActionMigrationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_automatorActionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v5;
  }
  if (self->_automatorActionIdentifier)
  {
    objc_msgSend(v5, "setAutomatorActionIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_completed;
    v4[28] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_automatorActionIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_completed;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *automatorActionIdentifier;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_8;
  }
  automatorActionIdentifier = self->_automatorActionIdentifier;
  if ((unint64_t)automatorActionIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](automatorActionIdentifier, "isEqual:"))
      goto LABEL_8;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      v7 = 0;
      goto LABEL_9;
    }
    if (self->_completed)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_8;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_8;
    }
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_automatorActionIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_completed;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBAutomatorWorkflowActionMigrationEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[WFPBAutomatorWorkflowActionMigrationEvent setAutomatorActionIdentifier:](self, "setAutomatorActionIdentifier:");
    v4 = v5;
  }
  if (v4[28])
  {
    self->_completed = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)automatorActionIdentifier
{
  return self->_automatorActionIdentifier;
}

- (void)setAutomatorActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_automatorActionIdentifier, a3);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_automatorActionIdentifier, 0);
}

@end
