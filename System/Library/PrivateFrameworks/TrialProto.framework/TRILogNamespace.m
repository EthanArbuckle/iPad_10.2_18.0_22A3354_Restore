@implementation TRILogNamespace

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasHashData
{
  return self->_hashData != 0;
}

- (void)setHashIncludesDefaults:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hashIncludesDefaults = a3;
}

- (void)setHasHashIncludesDefaults:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHashIncludesDefaults
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasLatestRolloutId
{
  return self->_latestRolloutId != 0;
}

- (void)setRolloutCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_rolloutCount = a3;
}

- (void)setHasRolloutCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRolloutCount
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
  v8.super_class = (Class)TRILogNamespace;
  -[TRILogNamespace description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRILogNamespace dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSData *hashData;
  void *v7;
  NSString *latestRolloutId;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  hashData = self->_hashData;
  if (hashData)
    objc_msgSend(v4, "setObject:forKey:", hashData, CFSTR("hash_data"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hashIncludesDefaults);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("hash_includes_defaults"));

  }
  latestRolloutId = self->_latestRolloutId;
  if (latestRolloutId)
    objc_msgSend(v4, "setObject:forKey:", latestRolloutId, CFSTR("latest_rollout_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rolloutCount);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("rollout_count"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRILogNamespaceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hashData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_latestRolloutId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v5;
  }
  if (self->_hashData)
  {
    objc_msgSend(v5, "setHashData:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 36) = self->_hashIncludesDefaults;
    *((_BYTE *)v4 + 40) |= 2u;
  }
  if (self->_latestRolloutId)
  {
    objc_msgSend(v5, "setLatestRolloutId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_rolloutCount;
    *((_BYTE *)v4 + 40) |= 1u;
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
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSData copyWithZone:](self->_hashData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 36) = self->_hashIncludesDefaults;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  v10 = -[NSString copyWithZone:](self->_latestRolloutId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_rolloutCount;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSData *hashData;
  char has;
  char v8;
  NSString *latestRolloutId;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_21;
  }
  hashData = self->_hashData;
  if ((unint64_t)hashData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](hashData, "isEqual:"))
      goto LABEL_21;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 40);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0)
      goto LABEL_21;
    if (self->_hashIncludesDefaults)
    {
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_21;
    }
    else if (*((_BYTE *)v4 + 36))
    {
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_21;
  }
  latestRolloutId = self->_latestRolloutId;
  if (!((unint64_t)latestRolloutId | *((_QWORD *)v4 + 2)))
    goto LABEL_17;
  if (!-[NSString isEqual:](latestRolloutId, "isEqual:"))
  {
LABEL_21:
    v10 = 0;
    goto LABEL_22;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 40);
LABEL_17:
  v10 = (v8 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_rolloutCount != *((_DWORD *)v4 + 8))
      goto LABEL_21;
    v10 = 1;
  }
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSData hash](self->_hashData, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_hashIncludesDefaults;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_latestRolloutId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_rolloutCount;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[TRILogNamespace setName:](self, "setName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[TRILogNamespace setHashData:](self, "setHashData:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    self->_hashIncludesDefaults = *((_BYTE *)v4 + 36);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[TRILogNamespace setLatestRolloutId:](self, "setLatestRolloutId:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_rolloutCount = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSData)hashData
{
  return self->_hashData;
}

- (void)setHashData:(id)a3
{
  objc_storeStrong((id *)&self->_hashData, a3);
}

- (BOOL)hashIncludesDefaults
{
  return self->_hashIncludesDefaults;
}

- (NSString)latestRolloutId
{
  return self->_latestRolloutId;
}

- (void)setLatestRolloutId:(id)a3
{
  objc_storeStrong((id *)&self->_latestRolloutId, a3);
}

- (unsigned)rolloutCount
{
  return self->_rolloutCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_latestRolloutId, 0);
  objc_storeStrong((id *)&self->_hashData, 0);
}

@end
