@implementation AWDCoreRoutineDeletionRecordStats

- (void)setAgeInDays:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ageInDays = a3;
}

- (void)setHasAgeInDays:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAgeInDays
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineDeletionRecordStats;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineDeletionRecordStats description](&v3, sel_description), -[AWDCoreRoutineDeletionRecordStats dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_ageInDays), CFSTR("ageInDays"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineDeletionRecordStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_ageInDays;
    *((_BYTE *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_ageInDays;
    *((_BYTE *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    LOBYTE(v5) = (*((_BYTE *)a3 + 12) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      LOBYTE(v5) = (*((_BYTE *)a3 + 12) & 1) != 0 && self->_ageInDays == *((_DWORD *)a3 + 2);
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return 2654435761 * self->_ageInDays;
  else
    return 0;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 12) & 1) != 0)
  {
    self->_ageInDays = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unsigned)ageInDays
{
  return self->_ageInDays;
}

@end
