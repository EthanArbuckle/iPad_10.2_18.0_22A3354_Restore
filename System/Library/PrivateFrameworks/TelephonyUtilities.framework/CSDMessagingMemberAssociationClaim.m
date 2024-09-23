@implementation CSDMessagingMemberAssociationClaim

- (id)tuAssociationForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  TUConversationMemberAssociation *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[CSDMessagingMemberAssociationClaim primaryHandle](self, "primaryHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tuHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSDMessagingMemberAssociationClaim associatedPseudonym](self, "associatedPseudonym");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tuHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v4, "isEqualToHandle:", v6);
  v10 = objc_msgSend(v4, "isEqualToHandle:", v8);

  if ((_DWORD)v9 == v10)
  {
    v11 = 0;
  }
  else
  {
    v11 = objc_alloc_init(TUConversationMemberAssociation);
    -[TUConversationMemberAssociation setType:](v11, "setType:", -[CSDMessagingMemberAssociationClaim type](self, "type"));
    -[TUConversationMemberAssociation setPrimary:](v11, "setPrimary:", v9);
    if ((_DWORD)v9)
    {
      -[TUConversationMemberAssociation setHandle:](v11, "setHandle:", v8);
    }
    else
    {
      -[TUConversationMemberAssociation setHandle:](v11, "setHandle:", v6);
      -[TUConversationMemberAssociation setIdentifier:](v11, "setIdentifier:", -[CSDMessagingMemberAssociationClaim primaryIdentifier](self, "primaryIdentifier"));
      -[CSDMessagingMemberAssociationClaim primaryAvcIdentifier](self, "primaryAvcIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "copy");
      -[TUConversationMemberAssociation setAvcIdentifier:](v11, "setAvcIdentifier:", v13);

    }
  }

  return v11;
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasPrimaryHandle
{
  return self->_primaryHandle != 0;
}

- (void)setPrimaryIdentifier:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_primaryIdentifier = a3;
}

- (void)setHasPrimaryIdentifier:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPrimaryIdentifier
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPrimaryAvcIdentifier
{
  return self->_primaryAvcIdentifier != 0;
}

- (BOOL)hasAssociatedPseudonym
{
  return self->_associatedPseudonym != 0;
}

- (BOOL)hasConversationGroupUUIDString
{
  return self->_conversationGroupUUIDString != 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
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
  v8.super_class = (Class)CSDMessagingMemberAssociationClaim;
  -[CSDMessagingMemberAssociationClaim description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSDMessagingMemberAssociationClaim dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  CSDMessagingHandle *primaryHandle;
  void *v6;
  void *v7;
  NSString *primaryAvcIdentifier;
  CSDMessagingHandle *associatedPseudonym;
  void *v10;
  NSString *conversationGroupUUIDString;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  primaryHandle = self->_primaryHandle;
  if (primaryHandle)
  {
    -[CSDMessagingHandle dictionaryRepresentation](primaryHandle, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("primaryHandle"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_primaryIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("primaryIdentifier"));

  }
  primaryAvcIdentifier = self->_primaryAvcIdentifier;
  if (primaryAvcIdentifier)
    objc_msgSend(v3, "setObject:forKey:", primaryAvcIdentifier, CFSTR("primaryAvcIdentifier"));
  associatedPseudonym = self->_associatedPseudonym;
  if (associatedPseudonym)
  {
    -[CSDMessagingHandle dictionaryRepresentation](associatedPseudonym, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("associatedPseudonym"));

  }
  conversationGroupUUIDString = self->_conversationGroupUUIDString;
  if (conversationGroupUUIDString)
    objc_msgSend(v3, "setObject:forKey:", conversationGroupUUIDString, CFSTR("conversationGroupUUIDString"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("type"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CSDMessagingMemberAssociationClaimReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_primaryHandle)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_primaryAvcIdentifier)
    PBDataWriterWriteStringField();
  if (self->_associatedPseudonym)
    PBDataWriterWriteSubmessage();
  if (self->_conversationGroupUUIDString)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[13] = self->_version;
    *((_BYTE *)v4 + 56) |= 4u;
  }
  v5 = v4;
  if (self->_primaryHandle)
  {
    objc_msgSend(v4, "setPrimaryHandle:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_primaryIdentifier;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  if (self->_primaryAvcIdentifier)
  {
    objc_msgSend(v5, "setPrimaryAvcIdentifier:");
    v4 = v5;
  }
  if (self->_associatedPseudonym)
  {
    objc_msgSend(v5, "setAssociatedPseudonym:");
    v4 = v5;
  }
  if (self->_conversationGroupUUIDString)
  {
    objc_msgSend(v5, "setConversationGroupUUIDString:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[12] = self->_type;
    *((_BYTE *)v4 + 56) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_version;
    *(_BYTE *)(v5 + 56) |= 4u;
  }
  v7 = -[CSDMessagingHandle copyWithZone:](self->_primaryHandle, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_primaryIdentifier;
    *(_BYTE *)(v6 + 56) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_primaryAvcIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v9;

  v11 = -[CSDMessagingHandle copyWithZone:](self->_associatedPseudonym, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v11;

  v13 = -[NSString copyWithZone:](self->_conversationGroupUUIDString, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v13;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_type;
    *(_BYTE *)(v6 + 56) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  CSDMessagingHandle *primaryHandle;
  NSString *primaryAvcIdentifier;
  CSDMessagingHandle *associatedPseudonym;
  NSString *conversationGroupUUIDString;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_version != *((_DWORD *)v4 + 13))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_25;
  }
  primaryHandle = self->_primaryHandle;
  if ((unint64_t)primaryHandle | *((_QWORD *)v4 + 5))
  {
    if (!-[CSDMessagingHandle isEqual:](primaryHandle, "isEqual:"))
    {
LABEL_25:
      v10 = 0;
      goto LABEL_26;
    }
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_primaryIdentifier != *((_QWORD *)v4 + 1))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_25;
  }
  primaryAvcIdentifier = self->_primaryAvcIdentifier;
  if ((unint64_t)primaryAvcIdentifier | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](primaryAvcIdentifier, "isEqual:"))
  {
    goto LABEL_25;
  }
  associatedPseudonym = self->_associatedPseudonym;
  if ((unint64_t)associatedPseudonym | *((_QWORD *)v4 + 2))
  {
    if (!-[CSDMessagingHandle isEqual:](associatedPseudonym, "isEqual:"))
      goto LABEL_25;
  }
  conversationGroupUUIDString = self->_conversationGroupUUIDString;
  if ((unint64_t)conversationGroupUUIDString | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](conversationGroupUUIDString, "isEqual:"))
      goto LABEL_25;
  }
  v10 = (*((_BYTE *)v4 + 56) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_type != *((_DWORD *)v4 + 12))
      goto LABEL_25;
    v10 = 1;
  }
LABEL_26:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  unint64_t v7;
  NSUInteger v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[CSDMessagingHandle hash](self->_primaryHandle, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_primaryIdentifier;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_primaryAvcIdentifier, "hash");
  v7 = -[CSDMessagingHandle hash](self->_associatedPseudonym, "hash");
  v8 = -[NSString hash](self->_conversationGroupUUIDString, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v9 = 2654435761 * self->_type;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  CSDMessagingHandle *primaryHandle;
  uint64_t v7;
  CSDMessagingHandle *associatedPseudonym;
  uint64_t v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if ((v4[14] & 4) != 0)
  {
    self->_version = v4[13];
    *(_BYTE *)&self->_has |= 4u;
  }
  primaryHandle = self->_primaryHandle;
  v7 = *((_QWORD *)v5 + 5);
  v10 = v5;
  if (primaryHandle)
  {
    if (!v7)
      goto LABEL_9;
    -[CSDMessagingHandle mergeFrom:](primaryHandle, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[CSDMessagingMemberAssociationClaim setPrimaryHandle:](self, "setPrimaryHandle:");
  }
  v5 = v10;
LABEL_9:
  if ((*((_BYTE *)v5 + 56) & 1) != 0)
  {
    self->_primaryIdentifier = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v5 + 4))
  {
    -[CSDMessagingMemberAssociationClaim setPrimaryAvcIdentifier:](self, "setPrimaryAvcIdentifier:");
    v5 = v10;
  }
  associatedPseudonym = self->_associatedPseudonym;
  v9 = *((_QWORD *)v5 + 2);
  if (associatedPseudonym)
  {
    if (!v9)
      goto LABEL_19;
    -[CSDMessagingHandle mergeFrom:](associatedPseudonym, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_19;
    -[CSDMessagingMemberAssociationClaim setAssociatedPseudonym:](self, "setAssociatedPseudonym:");
  }
  v5 = v10;
LABEL_19:
  if (*((_QWORD *)v5 + 3))
  {
    -[CSDMessagingMemberAssociationClaim setConversationGroupUUIDString:](self, "setConversationGroupUUIDString:");
    v5 = v10;
  }
  if ((*((_BYTE *)v5 + 56) & 2) != 0)
  {
    self->_type = *((_DWORD *)v5 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (CSDMessagingHandle)primaryHandle
{
  return self->_primaryHandle;
}

- (void)setPrimaryHandle:(id)a3
{
  objc_storeStrong((id *)&self->_primaryHandle, a3);
}

- (unint64_t)primaryIdentifier
{
  return self->_primaryIdentifier;
}

- (NSString)primaryAvcIdentifier
{
  return self->_primaryAvcIdentifier;
}

- (void)setPrimaryAvcIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAvcIdentifier, a3);
}

- (CSDMessagingHandle)associatedPseudonym
{
  return self->_associatedPseudonym;
}

- (void)setAssociatedPseudonym:(id)a3
{
  objc_storeStrong((id *)&self->_associatedPseudonym, a3);
}

- (NSString)conversationGroupUUIDString
{
  return self->_conversationGroupUUIDString;
}

- (void)setConversationGroupUUIDString:(id)a3
{
  objc_storeStrong((id *)&self->_conversationGroupUUIDString, a3);
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryHandle, 0);
  objc_storeStrong((id *)&self->_primaryAvcIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationGroupUUIDString, 0);
  objc_storeStrong((id *)&self->_associatedPseudonym, 0);
}

@end
