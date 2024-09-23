@implementation ICIAMMessagePresentationTrigger

- (BOOL)hasTriggerName
{
  return self->_triggerName != 0;
}

- (int)kind
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_kind;
  else
    return 0;
}

- (void)setKind:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_kind = a3;
}

- (void)setHasKind:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKind
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)kindAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Event");
  if (a3 == 1)
  {
    v3 = CFSTR("ContextProperty");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsKind:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Event")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ContextProperty"));

  return v4;
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
  v8.super_class = (Class)ICIAMMessagePresentationTrigger;
  -[ICIAMMessagePresentationTrigger description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIAMMessagePresentationTrigger dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *triggerName;
  int kind;
  __CFString *v7;
  NSString *bundleIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  triggerName = self->_triggerName;
  if (triggerName)
    objc_msgSend(v3, "setObject:forKey:", triggerName, CFSTR("triggerName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    kind = self->_kind;
    if (kind)
    {
      if (kind == 1)
      {
        v7 = CFSTR("ContextProperty");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_kind);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("Event");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("kind"));

  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v4, "setObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMMessagePresentationTriggerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_triggerName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_bundleIdentifier)
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
  if (self->_triggerName)
  {
    objc_msgSend(v4, "setTriggerName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_kind;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v5, "setBundleIdentifier:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_triggerName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_kind;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *triggerName;
  NSString *bundleIdentifier;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  triggerName = self->_triggerName;
  if ((unint64_t)triggerName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](triggerName, "isEqual:"))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_kind != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((_QWORD *)v4 + 1))
    v7 = -[NSString isEqual:](bundleIdentifier, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_triggerName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_kind;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSString hash](self->_bundleIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[ICIAMMessagePresentationTrigger setTriggerName:](self, "setTriggerName:");
    v4 = v5;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_kind = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ICIAMMessagePresentationTrigger setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v5;
  }

}

- (NSString)triggerName
{
  return self->_triggerName;
}

- (void)setTriggerName:(id)a3
{
  objc_storeStrong((id *)&self->_triggerName, a3);
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
  objc_storeStrong((id *)&self->_triggerName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
