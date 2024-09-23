@implementation WFPBRunShortcutErrorEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("RunShortcutError");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (BOOL)hasActionIdentifier
{
  return self->_actionIdentifier != 0;
}

- (void)setDidRunRemotely:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_didRunRemotely = a3;
}

- (void)setHasDidRunRemotely:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDidRunRemotely
{
  return *(_BYTE *)&self->_has & 1;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFPBRunShortcutErrorEvent;
  -[WFPBRunShortcutErrorEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBRunShortcutErrorEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *errorDomain;
  NSString *errorCode;
  NSString *actionIdentifier;
  void *v9;
  NSString *runSource;
  NSString *automationType;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v4, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  errorCode = self->_errorCode;
  if (errorCode)
    objc_msgSend(v4, "setObject:forKey:", errorCode, CFSTR("errorCode"));
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", actionIdentifier, CFSTR("actionIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didRunRemotely);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("didRunRemotely"));

  }
  runSource = self->_runSource;
  if (runSource)
    objc_msgSend(v4, "setObject:forKey:", runSource, CFSTR("runSource"));
  automationType = self->_automationType;
  if (automationType)
    objc_msgSend(v4, "setObject:forKey:", automationType, CFSTR("automationType"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBRunShortcutErrorEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_errorCode)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_actionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_runSource)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_automationType)
  {
    PBDataWriterWriteStringField();
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
  if (self->_errorDomain)
  {
    objc_msgSend(v5, "setErrorDomain:");
    v4 = v5;
  }
  if (self->_errorCode)
  {
    objc_msgSend(v5, "setErrorCode:");
    v4 = v5;
  }
  if (self->_actionIdentifier)
  {
    objc_msgSend(v5, "setActionIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[56] = self->_didRunRemotely;
    v4[60] |= 1u;
  }
  if (self->_runSource)
  {
    objc_msgSend(v5, "setRunSource:");
    v4 = v5;
  }
  if (self->_automationType)
  {
    objc_msgSend(v5, "setAutomationType:");
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_errorCode, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_actionIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 56) = self->_didRunRemotely;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v14 = -[NSString copyWithZone:](self->_runSource, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[NSString copyWithZone:](self->_automationType, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *errorDomain;
  NSString *errorCode;
  NSString *actionIdentifier;
  NSString *runSource;
  NSString *automationType;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_22;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:"))
      goto LABEL_22;
  }
  errorCode = self->_errorCode;
  if ((unint64_t)errorCode | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](errorCode, "isEqual:"))
      goto LABEL_22;
  }
  actionIdentifier = self->_actionIdentifier;
  if ((unint64_t)actionIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](actionIdentifier, "isEqual:"))
      goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) != 0)
    {
      if (self->_didRunRemotely)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_22;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_18;
    }
LABEL_22:
    v11 = 0;
    goto LABEL_23;
  }
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
    goto LABEL_22;
LABEL_18:
  runSource = self->_runSource;
  if ((unint64_t)runSource | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](runSource, "isEqual:"))
    goto LABEL_22;
  automationType = self->_automationType;
  if ((unint64_t)automationType | *((_QWORD *)v4 + 2))
    v11 = -[NSString isEqual:](automationType, "isEqual:");
  else
    v11 = 1;
LABEL_23:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_errorDomain, "hash");
  v5 = -[NSString hash](self->_errorCode, "hash");
  v6 = -[NSString hash](self->_actionIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_didRunRemotely;
  else
    v7 = 0;
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[NSString hash](self->_runSource, "hash");
  return v8 ^ v9 ^ -[NSString hash](self->_automationType, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[WFPBRunShortcutErrorEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[WFPBRunShortcutErrorEvent setErrorDomain:](self, "setErrorDomain:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBRunShortcutErrorEvent setErrorCode:](self, "setErrorCode:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[WFPBRunShortcutErrorEvent setActionIdentifier:](self, "setActionIdentifier:");
    v4 = v5;
  }
  if (v4[60])
  {
    self->_didRunRemotely = v4[56];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[WFPBRunShortcutErrorEvent setRunSource:](self, "setRunSource:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBRunShortcutErrorEvent setAutomationType:](self, "setAutomationType:");
    v4 = v5;
  }

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
  objc_storeStrong((id *)&self->_errorCode, a3);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_actionIdentifier, a3);
}

- (BOOL)didRunRemotely
{
  return self->_didRunRemotely;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end
