@implementation AWDCoreRoutineModelTransitionInstance

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineModelTransitionInstance setTransitionHistogram:](self, "setTransitionHistogram:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineModelTransitionInstance;
  -[AWDCoreRoutineModelTransitionInstance dealloc](&v3, sel_dealloc);
}

- (void)setDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDistance:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDistance
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasTransitionHistogram
{
  return self->_transitionHistogram != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineModelTransitionInstance;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineModelTransitionInstance description](&v3, sel_description), -[AWDCoreRoutineModelTransitionInstance dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  AWDCoreRoutineTransitionMotionType *transitionHistogram;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_duration), CFSTR("duration"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_distance), CFSTR("distance"));
  transitionHistogram = self->_transitionHistogram;
  if (transitionHistogram)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineTransitionMotionType dictionaryRepresentation](transitionHistogram, "dictionaryRepresentation"), CFSTR("transitionHistogram"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineModelTransitionInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_transitionHistogram)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  char has;
  AWDCoreRoutineTransitionMotionType *transitionHistogram;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_duration;
    *((_BYTE *)a3 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_distance;
    *((_BYTE *)a3 + 24) |= 1u;
  }
  transitionHistogram = self->_transitionHistogram;
  if (transitionHistogram)
    objc_msgSend(a3, "setTransitionHistogram:", transitionHistogram);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_duration;
    *(_BYTE *)(v5 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_distance;
    *(_BYTE *)(v5 + 24) |= 1u;
  }

  v6[2] = -[AWDCoreRoutineTransitionMotionType copyWithZone:](self->_transitionHistogram, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDCoreRoutineTransitionMotionType *transitionHistogram;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 2) == 0 || self->_duration != *((_DWORD *)a3 + 3))
        goto LABEL_14;
    }
    else if ((*((_BYTE *)a3 + 24) & 2) != 0)
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_distance != *((_DWORD *)a3 + 2))
        goto LABEL_14;
    }
    else if ((*((_BYTE *)a3 + 24) & 1) != 0)
    {
      goto LABEL_14;
    }
    transitionHistogram = self->_transitionHistogram;
    if ((unint64_t)transitionHistogram | *((_QWORD *)a3 + 2))
      LOBYTE(v5) = -[AWDCoreRoutineTransitionMotionType isEqual:](transitionHistogram, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_duration;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[AWDCoreRoutineTransitionMotionType hash](self->_transitionHistogram, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_distance;
  return v3 ^ v2 ^ -[AWDCoreRoutineTransitionMotionType hash](self->_transitionHistogram, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)a3 + 24);
  if ((v3 & 2) != 0)
  {
    self->_duration = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 24);
  }
  if ((v3 & 1) != 0)
  {
    self->_distance = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v4 = *((_QWORD *)a3 + 2);
  if (self->_transitionHistogram)
  {
    if (v4)
      -[AWDCoreRoutineTransitionMotionType mergeFrom:](self->_transitionHistogram, "mergeFrom:");
  }
  else if (v4)
  {
    -[AWDCoreRoutineModelTransitionInstance setTransitionHistogram:](self, "setTransitionHistogram:");
  }
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)distance
{
  return self->_distance;
}

- (AWDCoreRoutineTransitionMotionType)transitionHistogram
{
  return self->_transitionHistogram;
}

- (void)setTransitionHistogram:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
