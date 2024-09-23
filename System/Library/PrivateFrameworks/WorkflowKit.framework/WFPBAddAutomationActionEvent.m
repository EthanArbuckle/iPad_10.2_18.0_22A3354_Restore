@implementation WFPBAddAutomationActionEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("InternalAddAutomationAction");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasShortcutIdentifier
{
  return self->_shortcutIdentifier != 0;
}

- (void)setActionIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_actionIndex = a3;
}

- (void)setHasActionIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasActionIdentifier
{
  return self->_actionIdentifier != 0;
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
  v8.super_class = (Class)WFPBAddAutomationActionEvent;
  -[WFPBAddAutomationActionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBAddAutomationActionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *shortcutIdentifier;
  void *v7;
  NSString *actionIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  shortcutIdentifier = self->_shortcutIdentifier;
  if (shortcutIdentifier)
    objc_msgSend(v4, "setObject:forKey:", shortcutIdentifier, CFSTR("shortcutIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_actionIndex);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("actionIndex"));

  }
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", actionIdentifier, CFSTR("actionIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBAddAutomationActionEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_shortcutIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_actionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    v4 = v5;
  }
  if (self->_shortcutIdentifier)
  {
    objc_msgSend(v5, "setShortcutIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_actionIndex;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_actionIdentifier)
  {
    objc_msgSend(v5, "setActionIdentifier:");
    v4 = v5;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_shortcutIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_actionIndex;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_actionIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *shortcutIdentifier;
  NSString *actionIdentifier;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_13;
  }
  shortcutIdentifier = self->_shortcutIdentifier;
  if ((unint64_t)shortcutIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](shortcutIdentifier, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_actionIndex != *((_DWORD *)v4 + 4))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  actionIdentifier = self->_actionIdentifier;
  if ((unint64_t)actionIdentifier | *((_QWORD *)v4 + 1))
    v8 = -[NSString isEqual:](actionIdentifier, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_shortcutIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_actionIndex;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_actionIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;

  v4 = (unsigned int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBAddAutomationActionEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[WFPBAddAutomationActionEvent setShortcutIdentifier:](self, "setShortcutIdentifier:");
    v4 = v5;
  }
  if ((v4[10] & 1) != 0)
  {
    self->_actionIndex = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[WFPBAddAutomationActionEvent setActionIdentifier:](self, "setActionIdentifier:");
    v4 = v5;
  }

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)setShortcutIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_shortcutIdentifier, a3);
}

- (unsigned)actionIndex
{
  return self->_actionIndex;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_actionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end
