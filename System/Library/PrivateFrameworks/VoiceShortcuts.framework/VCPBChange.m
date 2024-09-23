@implementation VCPBChange

- (id)messageTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7AA6660[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMessageType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IntentDefinitionChange")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceShortcutChange")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WorkflowChange")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)changeTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7AA6678[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsChangeType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UPDATED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DELETED")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
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
  v8.super_class = (Class)VCPBChange;
  -[VCPBChange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPBChange dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  unsigned int v6;
  __CFString *v7;
  NSString *uniqueID;
  NSData *message;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_messageType - 1;
  if (v4 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_messageType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E7AA6660[v4];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("messageType"));

  v6 = self->_changeType - 1;
  if (v6 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_changeType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E7AA6678[v6];
  }
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("changeType"));

  uniqueID = self->_uniqueID;
  if (uniqueID)
    objc_msgSend(v3, "setObject:forKey:", uniqueID, CFSTR("uniqueID"));
  message = self->_message;
  if (message)
    objc_msgSend(v3, "setObject:forKey:", message, CFSTR("message"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPBChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  if (!self->_uniqueID)
    __assert_rtn("-[VCPBChange writeTo:]", "VCPBChange.m", 121, "nil != self->_uniqueID");
  PBDataWriterWriteStringField();
  if (!self->_message)
    __assert_rtn("-[VCPBChange writeTo:]", "VCPBChange.m", 126, "nil != self->_message");
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  NSString *uniqueID;
  id v5;

  *((_DWORD *)a3 + 6) = self->_messageType;
  *((_DWORD *)a3 + 2) = self->_changeType;
  uniqueID = self->_uniqueID;
  v5 = a3;
  objc_msgSend(v5, "setUniqueID:", uniqueID);
  objc_msgSend(v5, "setMessage:", self->_message);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_messageType;
  *(_DWORD *)(v5 + 8) = self->_changeType;
  v6 = -[NSString copyWithZone:](self->_uniqueID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSData copyWithZone:](self->_message, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uniqueID;
  NSData *message;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_messageType == *((_DWORD *)v4 + 6)
    && self->_changeType == *((_DWORD *)v4 + 2)
    && ((uniqueID = self->_uniqueID, !((unint64_t)uniqueID | v4[4]))
     || -[NSString isEqual:](uniqueID, "isEqual:")))
  {
    message = self->_message;
    if ((unint64_t)message | v4[2])
      v7 = -[NSData isEqual:](message, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = (2654435761 * self->_changeType) ^ (2654435761 * self->_messageType);
  v4 = -[NSString hash](self->_uniqueID, "hash");
  return v3 ^ v4 ^ -[NSData hash](self->_message, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  self->_messageType = v4[6];
  self->_changeType = v4[2];
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[VCPBChange setUniqueID:](self, "setUniqueID:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[VCPBChange setMessage:](self, "setMessage:");
    v4 = v5;
  }

}

- (int)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int)a3
{
  self->_messageType = a3;
}

- (int)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int)a3
{
  self->_changeType = a3;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (NSData)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
