@implementation AWDCoreRoutineFMCViewedInstance

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineFMCViewedInstance setParkingId:](self, "setParkingId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineFMCViewedInstance;
  -[AWDCoreRoutineFMCViewedInstance dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasParkingId
{
  return self->_parkingId != 0;
}

- (void)setUiPlacement:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_uiPlacement = a3;
}

- (void)setHasUiPlacement:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUiPlacement
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineFMCViewedInstance;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineFMCViewedInstance description](&v3, sel_description), -[AWDCoreRoutineFMCViewedInstance dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *parkingId;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  parkingId = self->_parkingId;
  if (parkingId)
    objc_msgSend(v3, "setObject:forKey:", parkingId, CFSTR("parkingId"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_uiPlacement), CFSTR("uiPlacement"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineFMCViewedInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_parkingId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 28) |= 1u;
  }
  if (self->_parkingId)
    objc_msgSend(a3, "setParkingId:");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_uiPlacement;
    *((_BYTE *)a3 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 28) |= 1u;
  }

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_parkingId, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_uiPlacement;
    *(_BYTE *)(v6 + 28) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *parkingId;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_14;
    }
    else if ((*((_BYTE *)a3 + 28) & 1) != 0)
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    parkingId = self->_parkingId;
    if ((unint64_t)parkingId | *((_QWORD *)a3 + 2))
    {
      v5 = -[NSString isEqual:](parkingId, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 28) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 2) == 0 || self->_uiPlacement != *((_DWORD *)a3 + 6))
        goto LABEL_14;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_parkingId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_uiPlacement;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 28) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[AWDCoreRoutineFMCViewedInstance setParkingId:](self, "setParkingId:");
  if ((*((_BYTE *)a3 + 28) & 2) != 0)
  {
    self->_uiPlacement = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)parkingId
{
  return self->_parkingId;
}

- (void)setParkingId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int)uiPlacement
{
  return self->_uiPlacement;
}

@end
