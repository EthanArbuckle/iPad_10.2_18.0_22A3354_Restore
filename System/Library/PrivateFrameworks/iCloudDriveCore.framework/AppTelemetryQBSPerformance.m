@implementation AppTelemetryQBSPerformance

- (BOOL)hasOperationType
{
  return self->_operationType != 0;
}

- (void)setTotalTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_totalTime = a3;
}

- (void)setHasTotalTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setRecordsFetched:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_recordsFetched = a3;
}

- (void)setHasRecordsFetched:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRecordsFetched
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRecordsFetchedTotalMetadataSize:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_recordsFetchedTotalMetadataSize = a3;
}

- (void)setHasRecordsFetchedTotalMetadataSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecordsFetchedTotalMetadataSize
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setXattrsFetchedTotalSize:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_xattrsFetchedTotalSize = a3;
}

- (void)setHasXattrsFetchedTotalSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasXattrsFetchedTotalSize
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)AppTelemetryQBSPerformance;
  -[AppTelemetryQBSPerformance description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppTelemetryQBSPerformance dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *operationType;
  char has;
  void *v7;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  operationType = self->_operationType;
  if (operationType)
    objc_msgSend(v3, "setObject:forKey:", operationType, CFSTR("operationType"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_totalTime);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("totalTime"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
LABEL_11:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_recordsFetchedTotalMetadataSize);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("recordsFetchedTotalMetadataSize"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v4;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_recordsFetched);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("recordsFetched"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_xattrsFetchedTotalSize);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("xattrsFetchedTotalSize"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AppTelemetryQBSPerformanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_operationType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
LABEL_11:
      PBDataWriterWriteUint64Field();
      v4 = v6;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
LABEL_8:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_operationType)
  {
    v6 = v4;
    objc_msgSend(v4, "setOperationType:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_totalTime;
    *((_BYTE *)v4 + 48) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
LABEL_11:
      *((_QWORD *)v4 + 2) = self->_recordsFetchedTotalMetadataSize;
      *((_BYTE *)v4 + 48) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 1) = self->_recordsFetched;
  *((_BYTE *)v4 + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *((_QWORD *)v4 + 4) = self->_xattrsFetchedTotalSize;
    *((_BYTE *)v4 + 48) |= 8u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_operationType, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_totalTime;
    *(_BYTE *)(v5 + 48) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v5 + 16) = self->_recordsFetchedTotalMetadataSize;
      *(_BYTE *)(v5 + 48) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 8) = self->_recordsFetched;
  *(_BYTE *)(v5 + 48) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_QWORD *)(v5 + 32) = self->_xattrsFetchedTotalSize;
    *(_BYTE *)(v5 + 48) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *operationType;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  operationType = self->_operationType;
  if ((unint64_t)operationType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](operationType, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_totalTime != *((_QWORD *)v4 + 3))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
LABEL_23:
    v6 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_recordsFetched != *((_QWORD *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_recordsFetchedTotalMetadataSize != *((_QWORD *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_23;
  }
  v6 = (*((_BYTE *)v4 + 48) & 8) == 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_xattrsFetchedTotalSize != *((_QWORD *)v4 + 4))
      goto LABEL_23;
    v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_operationType, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4 = 2654435761u * self->_totalTime;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761u * self->_recordsFetched;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761u * self->_recordsFetchedTotalMetadataSize;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761u * self->_xattrsFetchedTotalSize;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  char v5;
  unint64_t *v6;

  v4 = (unint64_t *)a3;
  if (v4[5])
  {
    v6 = v4;
    -[AppTelemetryQBSPerformance setOperationType:](self, "setOperationType:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 4) != 0)
  {
    self->_totalTime = v4[3];
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 48);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0)
        goto LABEL_6;
LABEL_11:
      self->_recordsFetchedTotalMetadataSize = v4[2];
      *(_BYTE *)&self->_has |= 2u;
      if ((v4[6] & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((v4[6] & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_recordsFetched = v4[1];
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((v5 & 8) != 0)
  {
LABEL_7:
    self->_xattrsFetchedTotalSize = v4[4];
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_8:

}

- (NSString)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(id)a3
{
  objc_storeStrong((id *)&self->_operationType, a3);
}

- (unint64_t)totalTime
{
  return self->_totalTime;
}

- (unint64_t)recordsFetched
{
  return self->_recordsFetched;
}

- (unint64_t)recordsFetchedTotalMetadataSize
{
  return self->_recordsFetchedTotalMetadataSize;
}

- (unint64_t)xattrsFetchedTotalSize
{
  return self->_xattrsFetchedTotalSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationType, 0);
}

@end
