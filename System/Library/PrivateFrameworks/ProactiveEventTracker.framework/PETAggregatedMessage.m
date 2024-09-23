@implementation PETAggregatedMessage

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDistribution
{
  return self->_distribution != 0;
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
  v8.super_class = (Class)PETAggregatedMessage;
  -[PETAggregatedMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETAggregatedMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PETAggregationKey *key;
  void *v5;
  void *v6;
  PETDistribution *distribution;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  key = self->_key;
  if (key)
  {
    -[PETAggregationKey dictionaryRepresentation](key, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("key"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_count);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("count"));

  }
  distribution = self->_distribution;
  if (distribution)
  {
    -[PETDistribution dictionaryRepresentation](distribution, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("distribution"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PETAggregatedMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_distribution)
  {
    PBDataWriterWriteSubmessage();
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_count;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  if (self->_distribution)
  {
    objc_msgSend(v5, "setDistribution:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PETAggregationKey copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_count;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v8 = -[PETDistribution copyWithZone:](self->_distribution, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PETAggregationKey *key;
  PETDistribution *distribution;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  key = self->_key;
  if ((unint64_t)key | *((_QWORD *)v4 + 3))
  {
    if (!-[PETAggregationKey isEqual:](key, "isEqual:"))
      goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_count != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  distribution = self->_distribution;
  if ((unint64_t)distribution | *((_QWORD *)v4 + 2))
    v7 = -[PETDistribution isEqual:](distribution, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[PETAggregationKey hash](self->_key, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_count;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[PETDistribution hash](self->_distribution, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PETAggregationKey *key;
  uint64_t v6;
  PETDistribution *distribution;
  uint64_t v8;
  id v9;

  v4 = a3;
  key = self->_key;
  v6 = *((_QWORD *)v4 + 3);
  v9 = v4;
  if (key)
  {
    if (!v6)
      goto LABEL_7;
    -[PETAggregationKey mergeFrom:](key, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PETAggregatedMessage setKey:](self, "setKey:");
  }
  v4 = v9;
LABEL_7:
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_count = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  distribution = self->_distribution;
  v8 = *((_QWORD *)v4 + 2);
  if (distribution)
  {
    if (v8)
    {
      -[PETDistribution mergeFrom:](distribution, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[PETAggregatedMessage setDistribution:](self, "setDistribution:");
    goto LABEL_14;
  }

}

- (PETAggregationKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (unsigned)count
{
  return self->_count;
}

- (PETDistribution)distribution
{
  return self->_distribution;
}

- (void)setDistribution:(id)a3
{
  objc_storeStrong((id *)&self->_distribution, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_distribution, 0);
}

@end
