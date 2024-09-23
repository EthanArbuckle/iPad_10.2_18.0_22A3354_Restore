@implementation PAPBAccess

- (BOOL)hasAccessor
{
  return self->_accessor != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (int)kind
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_kind;
  else
    return 0;
}

- (void)setKind:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_kind = a3;
}

- (void)setHasKind:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKind
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTimestampAdjustment:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestampAdjustment = a3;
}

- (void)setHasTimestampAdjustment:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampAdjustment
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearAssetIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_assetIdentifiers, "removeAllObjects");
}

- (void)addAssetIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *assetIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  assetIdentifiers = self->_assetIdentifiers;
  v8 = v4;
  if (!assetIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_assetIdentifiers;
    self->_assetIdentifiers = v6;

    v4 = v8;
    assetIdentifiers = self->_assetIdentifiers;
  }
  -[NSMutableArray addObject:](assetIdentifiers, "addObject:", v4);

}

- (unint64_t)assetIdentifiersCount
{
  return -[NSMutableArray count](self->_assetIdentifiers, "count");
}

- (id)assetIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_assetIdentifiers, "objectAtIndexedSubscript:", a3);
}

+ (Class)assetIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)setAccessCount:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_accessCount = a3;
}

- (void)setHasAccessCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAccessCount
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
  v8.super_class = (Class)PAPBAccess;
  -[PAPBAccess description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAPBAccess dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PAPBApplication *accessor;
  void *v5;
  NSData *identifier;
  char has;
  void *v8;
  void *v9;
  NSMutableArray *assetIdentifiers;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessor = self->_accessor;
  if (accessor)
  {
    -[PAPBApplication dictionaryRepresentation](accessor, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accessor"));

  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", identifier, CFSTR("identifier"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_kind);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("kind"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestampAdjustment);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("timestampAdjustment"));

  }
  assetIdentifiers = self->_assetIdentifiers;
  if (assetIdentifiers)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", assetIdentifiers, CFSTR("assetIdentifiers"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_accessCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("accessCount"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PAPBAccessReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_accessor)
    PBDataWriterWriteSubmessage();
  if (self->_identifier)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_assetIdentifiers;
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
        PBDataWriterWriteDataField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PAPBApplication copyWithZone:](self->_accessor, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSData copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_kind;
    *(_BYTE *)(v5 + 52) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_timestampAdjustment;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_assetIdentifiers;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addAssetIdentifiers:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_accessCount;
    *(_BYTE *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PAPBApplication *accessor;
  NSData *identifier;
  char has;
  NSMutableArray *assetIdentifiers;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  accessor = self->_accessor;
  if ((unint64_t)accessor | *((_QWORD *)v4 + 3))
  {
    if (!-[PAPBApplication isEqual:](accessor, "isEqual:"))
      goto LABEL_23;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](identifier, "isEqual:"))
      goto LABEL_23;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_kind != *((_DWORD *)v4 + 12))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_timestampAdjustment != *((double *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_23;
  }
  assetIdentifiers = self->_assetIdentifiers;
  if ((unint64_t)assetIdentifiers | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](assetIdentifiers, "isEqual:"))
    {
LABEL_23:
      v9 = 0;
      goto LABEL_24;
    }
    has = (char)self->_has;
  }
  v9 = (*((_BYTE *)v4 + 52) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_accessCount != *((_DWORD *)v4 + 4))
      goto LABEL_23;
    v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double timestampAdjustment;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[PAPBApplication hash](self->_accessor, "hash");
  v4 = -[NSData hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761 * self->_kind;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v10 = 0;
    goto LABEL_11;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  timestampAdjustment = self->_timestampAdjustment;
  v7 = -timestampAdjustment;
  if (timestampAdjustment >= 0.0)
    v7 = self->_timestampAdjustment;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  v11 = -[NSMutableArray hash](self->_assetIdentifiers, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v12 = 2654435761 * self->_accessCount;
  else
    v12 = 0;
  return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PAPBApplication *accessor;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  accessor = self->_accessor;
  v6 = *((_QWORD *)v4 + 3);
  if (accessor)
  {
    if (v6)
      -[PAPBApplication mergeFrom:](accessor, "mergeFrom:");
  }
  else if (v6)
  {
    -[PAPBAccess setAccessor:](self, "setAccessor:");
  }
  if (*((_QWORD *)v4 + 5))
    -[PAPBAccess setIdentifier:](self, "setIdentifier:");
  v7 = *((_BYTE *)v4 + 52);
  if ((v7 & 4) != 0)
  {
    self->_kind = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 4u;
    v7 = *((_BYTE *)v4 + 52);
  }
  if ((v7 & 1) != 0)
  {
    self->_timestampAdjustment = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v4 + 4);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[PAPBAccess addAssetIdentifiers:](self, "addAssetIdentifiers:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    self->_accessCount = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (PAPBApplication)accessor
{
  return self->_accessor;
}

- (void)setAccessor:(id)a3
{
  objc_storeStrong((id *)&self->_accessor, a3);
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (double)timestampAdjustment
{
  return self->_timestampAdjustment;
}

- (NSMutableArray)assetIdentifiers
{
  return self->_assetIdentifiers;
}

- (void)setAssetIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_assetIdentifiers, a3);
}

- (int)accessCount
{
  return self->_accessCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_assetIdentifiers, 0);
  objc_storeStrong((id *)&self->_accessor, 0);
}

@end
