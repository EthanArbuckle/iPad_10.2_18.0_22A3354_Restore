@implementation WFPBRemoteExecutionEvent

- (NSString)key
{
  if (self->_key)
    return self->_key;
  else
    return (NSString *)CFSTR("RemoteExecution");
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (BOOL)hasActionIdentifier
{
  return self->_actionIdentifier != 0;
}

- (BOOL)hasDestinationType
{
  return self->_destinationType != 0;
}

- (BOOL)hasConnectionType
{
  return self->_connectionType != 0;
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
  v8.super_class = (Class)WFPBRemoteExecutionEvent;
  -[WFPBRemoteExecutionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPBRemoteExecutionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *source;
  NSString *actionIdentifier;
  NSString *destinationType;
  NSString *connectionType;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  source = self->_source;
  if (source)
    objc_msgSend(v4, "setObject:forKey:", source, CFSTR("source"));
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier)
    objc_msgSend(v4, "setObject:forKey:", actionIdentifier, CFSTR("actionIdentifier"));
  destinationType = self->_destinationType;
  if (destinationType)
    objc_msgSend(v4, "setObject:forKey:", destinationType, CFSTR("destinationType"));
  connectionType = self->_connectionType;
  if (connectionType)
    objc_msgSend(v4, "setObject:forKey:", connectionType, CFSTR("connectionType"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_completed);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("completed"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFPBRemoteExecutionEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_actionIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_destinationType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_connectionType)
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
  if (self->_source)
  {
    objc_msgSend(v5, "setSource:");
    v4 = v5;
  }
  if (self->_actionIdentifier)
  {
    objc_msgSend(v5, "setActionIdentifier:");
    v4 = v5;
  }
  if (self->_destinationType)
  {
    objc_msgSend(v5, "setDestinationType:");
    v4 = v5;
  }
  if (self->_connectionType)
  {
    objc_msgSend(v5, "setConnectionType:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[48] = self->_completed;
    v4[52] |= 1u;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_source, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_actionIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  v12 = -[NSString copyWithZone:](self->_destinationType, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[NSString copyWithZone:](self->_connectionType, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_completed;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *key;
  NSString *source;
  NSString *actionIdentifier;
  NSString *destinationType;
  NSString *connectionType;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:"))
      goto LABEL_14;
  }
  source = self->_source;
  if ((unint64_t)source | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](source, "isEqual:"))
      goto LABEL_14;
  }
  actionIdentifier = self->_actionIdentifier;
  if ((unint64_t)actionIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](actionIdentifier, "isEqual:"))
      goto LABEL_14;
  }
  destinationType = self->_destinationType;
  if ((unint64_t)destinationType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](destinationType, "isEqual:"))
      goto LABEL_14;
  }
  connectionType = self->_connectionType;
  if ((unint64_t)connectionType | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](connectionType, "isEqual:"))
      goto LABEL_14;
  }
  v10 = (*((_BYTE *)v4 + 52) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0)
    {
LABEL_14:
      v10 = 0;
      goto LABEL_15;
    }
    if (self->_completed)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_14;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_14;
    }
    v10 = 1;
  }
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_source, "hash");
  v5 = -[NSString hash](self->_actionIdentifier, "hash");
  v6 = -[NSString hash](self->_destinationType, "hash");
  v7 = -[NSString hash](self->_connectionType, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_completed;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[WFPBRemoteExecutionEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[WFPBRemoteExecutionEvent setSource:](self, "setSource:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[WFPBRemoteExecutionEvent setActionIdentifier:](self, "setActionIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[WFPBRemoteExecutionEvent setDestinationType:](self, "setDestinationType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[WFPBRemoteExecutionEvent setConnectionType:](self, "setConnectionType:");
    v4 = v5;
  }
  if (v4[52])
  {
    self->_completed = v4[48];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_actionIdentifier, a3);
}

- (NSString)destinationType
{
  return self->_destinationType;
}

- (void)setDestinationType:(id)a3
{
  objc_storeStrong((id *)&self->_destinationType, a3);
}

- (NSString)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(id)a3
{
  objc_storeStrong((id *)&self->_connectionType, a3);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_destinationType, 0);
  objc_storeStrong((id *)&self->_connectionType, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end
