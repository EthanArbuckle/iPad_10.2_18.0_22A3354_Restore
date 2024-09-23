@implementation SharedChannelCreateRequest

- (BOOL)hasChannelTopic
{
  return self->_channelTopic != 0;
}

- (BOOL)hasAuthCredential
{
  return self->_authCredential != 0;
}

- (int)channelOwnershipType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_channelOwnershipType;
  else
    return 0;
}

- (void)setChannelOwnershipType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_channelOwnershipType = a3;
}

- (void)setHasChannelOwnershipType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelOwnershipType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)channelOwnershipTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("SELF_USER_OWNERSHIP");
  if (a3 == 1)
  {
    v3 = CFSTR("SHARED_OWNERSHIP");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsChannelOwnershipType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SELF_USER_OWNERSHIP")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SHARED_OWNERSHIP"));

  return v4;
}

- (BOOL)hasAdopter
{
  return self->_adopter != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SharedChannelCreateRequest;
  -[SharedChannelCreateRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SharedChannelCreateRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *channelTopic;
  AuthCredential *authCredential;
  void *v7;
  int channelOwnershipType;
  __CFString *v9;
  NSString *adopter;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  channelTopic = self->_channelTopic;
  if (channelTopic)
    objc_msgSend(v3, "setObject:forKey:", channelTopic, CFSTR("channel_topic"));
  authCredential = self->_authCredential;
  if (authCredential)
  {
    -[AuthCredential dictionaryRepresentation](authCredential, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("auth_credential"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    channelOwnershipType = self->_channelOwnershipType;
    if (channelOwnershipType)
    {
      if (channelOwnershipType == 1)
      {
        v9 = CFSTR("SHARED_OWNERSHIP");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_channelOwnershipType);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = CFSTR("SELF_USER_OWNERSHIP");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("channel_ownership_type"));

  }
  adopter = self->_adopter;
  if (adopter)
    objc_msgSend(v4, "setObject:forKey:", adopter, CFSTR("adopter"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelCreateRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_channelTopic)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_authCredential)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_adopter)
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
  if (self->_channelTopic)
  {
    objc_msgSend(v4, "setChannelTopic:");
    v4 = v5;
  }
  if (self->_authCredential)
  {
    objc_msgSend(v5, "setAuthCredential:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_channelOwnershipType;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_adopter)
  {
    objc_msgSend(v5, "setAdopter:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_channelTopic, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[AuthCredential copyWithZone:](self->_authCredential, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_channelOwnershipType;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_adopter, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *channelTopic;
  AuthCredential *authCredential;
  NSString *adopter;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  channelTopic = self->_channelTopic;
  if ((unint64_t)channelTopic | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](channelTopic, "isEqual:"))
      goto LABEL_13;
  }
  authCredential = self->_authCredential;
  if ((unint64_t)authCredential | *((_QWORD *)v4 + 2))
  {
    if (!-[AuthCredential isEqual:](authCredential, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_channelOwnershipType != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  adopter = self->_adopter;
  if ((unint64_t)adopter | *((_QWORD *)v4 + 1))
    v8 = -[NSString isEqual:](adopter, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_channelTopic, "hash");
  v4 = -[AuthCredential hash](self->_authCredential, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_channelOwnershipType;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_adopter, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  AuthCredential *authCredential;
  uint64_t v6;
  int *v7;

  v4 = (int *)a3;
  v7 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[SharedChannelCreateRequest setChannelTopic:](self, "setChannelTopic:");
    v4 = v7;
  }
  authCredential = self->_authCredential;
  v6 = *((_QWORD *)v4 + 2);
  if (authCredential)
  {
    if (!v6)
      goto LABEL_9;
    -[AuthCredential mergeFrom:](authCredential, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[SharedChannelCreateRequest setAuthCredential:](self, "setAuthCredential:");
  }
  v4 = v7;
LABEL_9:
  if ((v4[10] & 1) != 0)
  {
    self->_channelOwnershipType = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[SharedChannelCreateRequest setAdopter:](self, "setAdopter:");
    v4 = v7;
  }

}

- (NSString)channelTopic
{
  return self->_channelTopic;
}

- (void)setChannelTopic:(id)a3
{
  objc_storeStrong((id *)&self->_channelTopic, a3);
}

- (AuthCredential)authCredential
{
  return self->_authCredential;
}

- (void)setAuthCredential:(id)a3
{
  objc_storeStrong((id *)&self->_authCredential, a3);
}

- (NSString)adopter
{
  return self->_adopter;
}

- (void)setAdopter:(id)a3
{
  objc_storeStrong((id *)&self->_adopter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelTopic, 0);
  objc_storeStrong((id *)&self->_authCredential, 0);
  objc_storeStrong((id *)&self->_adopter, 0);
}

@end
