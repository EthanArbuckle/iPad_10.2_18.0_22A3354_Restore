@implementation PLJournalEntryHeader

- (int)entryType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_entryType;
  else
    return 0;
}

- (void)setEntryType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_entryType = a3;
}

- (void)setHasEntryType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEntryType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)entryTypeAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E3678108 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEntryType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Insert")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Update")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Delete")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasPayloadUUID
{
  return self->_payloadUUID != 0;
}

- (BOOL)hasPayloadID
{
  return self->_payloadID != 0;
}

- (void)setPayloadVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_payloadVersion = a3;
}

- (void)setHasPayloadVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPayloadVersion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPayloadLength:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_payloadLength = a3;
}

- (void)setHasPayloadLength:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPayloadLength
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPayloadCRC:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_payloadCRC = a3;
}

- (void)setHasPayloadCRC:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPayloadCRC
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearNilProperties
{
  -[NSMutableArray removeAllObjects](self->_nilProperties, "removeAllObjects");
}

- (void)addNilProperties:(id)a3
{
  id v4;
  NSMutableArray *nilProperties;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  nilProperties = self->_nilProperties;
  v8 = v4;
  if (!nilProperties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_nilProperties;
    self->_nilProperties = v6;

    v4 = v8;
    nilProperties = self->_nilProperties;
  }
  -[NSMutableArray addObject:](nilProperties, "addObject:", v4);

}

- (unint64_t)nilPropertiesCount
{
  return -[NSMutableArray count](self->_nilProperties, "count");
}

- (id)nilPropertiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_nilProperties, "objectAtIndex:", a3);
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
  v8.super_class = (Class)PLJournalEntryHeader;
  -[PLJournalEntryHeader description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLJournalEntryHeader dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t entryType;
  void *v5;
  NSData *payloadUUID;
  NSString *payloadID;
  char has;
  void *v9;
  NSMutableArray *nilProperties;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    entryType = self->_entryType;
    if (entryType >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_entryType);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E3678108 + entryType);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("entryType"));

  }
  payloadUUID = self->_payloadUUID;
  if (payloadUUID)
    objc_msgSend(v3, "setObject:forKey:", payloadUUID, CFSTR("payloadUUID"));
  payloadID = self->_payloadID;
  if (payloadID)
    objc_msgSend(v3, "setObject:forKey:", payloadID, CFSTR("payloadID"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_payloadVersion);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("payloadVersion"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_12:
      if ((has & 4) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_payloadLength);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("payloadLength"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_payloadCRC);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("payloadCRC"));

  }
LABEL_14:
  nilProperties = self->_nilProperties;
  if (nilProperties)
    objc_msgSend(v3, "setObject:forKey:", nilProperties, CFSTR("nilProperties"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PLJournalEntryHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_payloadUUID)
    PBDataWriterWriteDataField();
  if (self->_payloadID)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 4) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field();
LABEL_11:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_nilProperties;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _DWORD *v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[4] = self->_entryType;
    *((_BYTE *)v4 + 60) |= 2u;
  }
  v10 = v4;
  if (self->_payloadUUID)
  {
    objc_msgSend(v4, "setPayloadUUID:");
    v4 = v10;
  }
  if (self->_payloadID)
  {
    objc_msgSend(v10, "setPayloadID:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
LABEL_17:
    *((_QWORD *)v4 + 1) = self->_payloadLength;
    *((_BYTE *)v4 + 60) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v4[14] = self->_payloadVersion;
  *((_BYTE *)v4 + 60) |= 8u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_17;
LABEL_9:
  if ((has & 4) != 0)
  {
LABEL_10:
    v4[8] = self->_payloadCRC;
    *((_BYTE *)v4 + 60) |= 4u;
  }
LABEL_11:
  if (-[PLJournalEntryHeader nilPropertiesCount](self, "nilPropertiesCount"))
  {
    objc_msgSend(v10, "clearNilProperties");
    v6 = -[PLJournalEntryHeader nilPropertiesCount](self, "nilPropertiesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[PLJournalEntryHeader nilPropertiesAtIndex:](self, "nilPropertiesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addNilProperties:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char has;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_entryType;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  v7 = -[NSData copyWithZone:](self->_payloadUUID, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v7;

  v9 = -[NSString copyWithZone:](self->_payloadID, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_payloadVersion;
    *(_BYTE *)(v6 + 60) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 8) = self->_payloadLength;
  *(_BYTE *)(v6 + 60) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 32) = self->_payloadCRC;
    *(_BYTE *)(v6 + 60) |= 4u;
  }
LABEL_7:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_nilProperties;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v6, "addNilProperties:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *payloadUUID;
  NSString *payloadID;
  NSMutableArray *nilProperties;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_entryType != *((_DWORD *)v4 + 4))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
LABEL_28:
    v8 = 0;
    goto LABEL_29;
  }
  payloadUUID = self->_payloadUUID;
  if ((unint64_t)payloadUUID | *((_QWORD *)v4 + 6) && !-[NSData isEqual:](payloadUUID, "isEqual:"))
    goto LABEL_28;
  payloadID = self->_payloadID;
  if ((unint64_t)payloadID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](payloadID, "isEqual:"))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_payloadVersion != *((_DWORD *)v4 + 14))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_payloadLength != *((_QWORD *)v4 + 1))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_payloadCRC != *((_DWORD *)v4 + 8))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_28;
  }
  nilProperties = self->_nilProperties;
  if ((unint64_t)nilProperties | *((_QWORD *)v4 + 3))
    v8 = -[NSMutableArray isEqual:](nilProperties, "isEqual:");
  else
    v8 = 1;
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_entryType;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_payloadUUID, "hash");
  v5 = -[NSString hash](self->_payloadID, "hash");
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_9:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
LABEL_10:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSMutableArray hash](self->_nilProperties, "hash");
  }
  v6 = 2654435761 * self->_payloadVersion;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_9;
LABEL_6:
  v7 = 2654435761u * self->_payloadLength;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_7:
  v8 = 2654435761 * self->_payloadCRC;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSMutableArray hash](self->_nilProperties, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[15] & 2) != 0)
  {
    self->_entryType = v4[4];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 6))
    -[PLJournalEntryHeader setPayloadUUID:](self, "setPayloadUUID:");
  if (*((_QWORD *)v5 + 5))
    -[PLJournalEntryHeader setPayloadID:](self, "setPayloadID:");
  v6 = *((_BYTE *)v5 + 60);
  if ((v6 & 8) != 0)
  {
    self->_payloadVersion = *((_DWORD *)v5 + 14);
    *(_BYTE *)&self->_has |= 8u;
    v6 = *((_BYTE *)v5 + 60);
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v5 + 60) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_payloadLength = *((_QWORD *)v5 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v5 + 60) & 4) != 0)
  {
LABEL_10:
    self->_payloadCRC = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_11:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v5 + 3);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[PLJournalEntryHeader addNilProperties:](self, "addNilProperties:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NSData)payloadUUID
{
  return self->_payloadUUID;
}

- (void)setPayloadUUID:(id)a3
{
  objc_storeStrong((id *)&self->_payloadUUID, a3);
}

- (NSString)payloadID
{
  return self->_payloadID;
}

- (void)setPayloadID:(id)a3
{
  objc_storeStrong((id *)&self->_payloadID, a3);
}

- (unsigned)payloadVersion
{
  return self->_payloadVersion;
}

- (unint64_t)payloadLength
{
  return self->_payloadLength;
}

- (unsigned)payloadCRC
{
  return self->_payloadCRC;
}

- (NSMutableArray)nilProperties
{
  return self->_nilProperties;
}

- (void)setNilProperties:(id)a3
{
  objc_storeStrong((id *)&self->_nilProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUUID, 0);
  objc_storeStrong((id *)&self->_payloadID, 0);
  objc_storeStrong((id *)&self->_nilProperties, 0);
}

+ (Class)nilPropertiesType
{
  return (Class)objc_opt_class();
}

@end
