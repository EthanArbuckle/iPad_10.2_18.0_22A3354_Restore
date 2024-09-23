@implementation AWDPowerStateResidencyAndWeight

- (void)setResidency:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_residency = a3;
}

- (void)setHasResidency:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResidency
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWeight:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_weight = a3;
}

- (void)setHasWeight:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWeight
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDPowerStateResidencyAndWeight;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDPowerStateResidencyAndWeight description](&v3, sel_description), -[AWDPowerStateResidencyAndWeight dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_residency), CFSTR("residency"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_weight), CFSTR("weight"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerStateResidencyAndWeightReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return;
LABEL_5:
    *((_DWORD *)a3 + 3) = self->_weight;
    *((_BYTE *)a3 + 16) |= 2u;
    return;
  }
  *((_DWORD *)a3 + 2) = self->_residency;
  *((_BYTE *)a3 + 16) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_residency;
    *((_BYTE *)result + 16) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_weight;
    *((_BYTE *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 16) & 1) == 0 || self->_residency != *((_DWORD *)a3 + 2))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 16) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 16) & 2) == 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 16) & 2) == 0 || self->_weight != *((_DWORD *)a3 + 3))
        goto LABEL_11;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_residency;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_weight;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 16) & 1) == 0)
  {
    if ((*((_BYTE *)a3 + 16) & 2) == 0)
      return;
LABEL_5:
    self->_weight = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }
  self->_residency = *((_DWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 16) & 2) != 0)
    goto LABEL_5;
}

- (unsigned)residency
{
  return self->_residency;
}

- (unsigned)weight
{
  return self->_weight;
}

@end
