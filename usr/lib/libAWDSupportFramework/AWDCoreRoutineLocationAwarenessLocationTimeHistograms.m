@implementation AWDCoreRoutineLocationAwarenessLocationTimeHistograms

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setLessThan10mHistogram:](self, "setLessThan10mHistogram:", 0);
  -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setLessThan20mHistogram:](self, "setLessThan20mHistogram:", 0);
  -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setLessThan55mHistogram:](self, "setLessThan55mHistogram:", 0);
  -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setLessThan200mHistogram:](self, "setLessThan200mHistogram:", 0);
  -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setAnyPositiveHistogram:](self, "setAnyPositiveHistogram:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessLocationTimeHistograms;
  -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLessThan10mHistogram
{
  return self->_lessThan10mHistogram != 0;
}

- (BOOL)hasLessThan20mHistogram
{
  return self->_lessThan20mHistogram != 0;
}

- (BOOL)hasLessThan55mHistogram
{
  return self->_lessThan55mHistogram != 0;
}

- (BOOL)hasLessThan200mHistogram
{
  return self->_lessThan200mHistogram != 0;
}

- (BOOL)hasAnyPositiveHistogram
{
  return self->_anyPositiveHistogram != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessLocationTimeHistograms;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms description](&v3, sel_description), -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  AWDCoreRoutineLocationAwarenessBasicHistogram *lessThan10mHistogram;
  AWDCoreRoutineLocationAwarenessBasicHistogram *lessThan20mHistogram;
  AWDCoreRoutineLocationAwarenessBasicHistogram *lessThan55mHistogram;
  AWDCoreRoutineLocationAwarenessBasicHistogram *lessThan200mHistogram;
  AWDCoreRoutineLocationAwarenessBasicHistogram *anyPositiveHistogram;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_duration), CFSTR("duration"));
  lessThan10mHistogram = self->_lessThan10mHistogram;
  if (lessThan10mHistogram)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](lessThan10mHistogram, "dictionaryRepresentation"), CFSTR("LessThan10mHistogram"));
  lessThan20mHistogram = self->_lessThan20mHistogram;
  if (lessThan20mHistogram)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](lessThan20mHistogram, "dictionaryRepresentation"), CFSTR("LessThan20mHistogram"));
  lessThan55mHistogram = self->_lessThan55mHistogram;
  if (lessThan55mHistogram)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](lessThan55mHistogram, "dictionaryRepresentation"), CFSTR("LessThan55mHistogram"));
  lessThan200mHistogram = self->_lessThan200mHistogram;
  if (lessThan200mHistogram)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](lessThan200mHistogram, "dictionaryRepresentation"), CFSTR("LessThan200mHistogram"));
  anyPositiveHistogram = self->_anyPositiveHistogram;
  if (anyPositiveHistogram)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](anyPositiveHistogram, "dictionaryRepresentation"), CFSTR("AnyPositiveHistogram"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLocationAwarenessLocationTimeHistogramsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_lessThan10mHistogram)
    PBDataWriterWriteSubmessage();
  if (self->_lessThan20mHistogram)
    PBDataWriterWriteSubmessage();
  if (self->_lessThan55mHistogram)
    PBDataWriterWriteSubmessage();
  if (self->_lessThan200mHistogram)
    PBDataWriterWriteSubmessage();
  if (self->_anyPositiveHistogram)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 64) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_duration;
    *((_BYTE *)a3 + 64) |= 1u;
  }
  if (self->_lessThan10mHistogram)
    objc_msgSend(a3, "setLessThan10mHistogram:");
  if (self->_lessThan20mHistogram)
    objc_msgSend(a3, "setLessThan20mHistogram:");
  if (self->_lessThan55mHistogram)
    objc_msgSend(a3, "setLessThan55mHistogram:");
  if (self->_lessThan200mHistogram)
    objc_msgSend(a3, "setLessThan200mHistogram:");
  if (self->_anyPositiveHistogram)
    objc_msgSend(a3, "setAnyPositiveHistogram:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 64) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_duration;
    *(_BYTE *)(v5 + 64) |= 1u;
  }

  *(_QWORD *)(v6 + 32) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_lessThan10mHistogram, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 48) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_lessThan20mHistogram, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 56) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_lessThan55mHistogram, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 40) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_lessThan200mHistogram, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 24) = -[AWDCoreRoutineLocationAwarenessBasicHistogram copyWithZone:](self->_anyPositiveHistogram, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDCoreRoutineLocationAwarenessBasicHistogram *lessThan10mHistogram;
  AWDCoreRoutineLocationAwarenessBasicHistogram *lessThan20mHistogram;
  AWDCoreRoutineLocationAwarenessBasicHistogram *lessThan55mHistogram;
  AWDCoreRoutineLocationAwarenessBasicHistogram *lessThan200mHistogram;
  AWDCoreRoutineLocationAwarenessBasicHistogram *anyPositiveHistogram;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_22;
    }
    else if ((*((_BYTE *)a3 + 64) & 2) != 0)
    {
LABEL_22:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_duration != *((_QWORD *)a3 + 1))
        goto LABEL_22;
    }
    else if ((*((_BYTE *)a3 + 64) & 1) != 0)
    {
      goto LABEL_22;
    }
    lessThan10mHistogram = self->_lessThan10mHistogram;
    if (!((unint64_t)lessThan10mHistogram | *((_QWORD *)a3 + 4))
      || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](lessThan10mHistogram, "isEqual:")) != 0)
    {
      lessThan20mHistogram = self->_lessThan20mHistogram;
      if (!((unint64_t)lessThan20mHistogram | *((_QWORD *)a3 + 6))
        || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](lessThan20mHistogram, "isEqual:")) != 0)
      {
        lessThan55mHistogram = self->_lessThan55mHistogram;
        if (!((unint64_t)lessThan55mHistogram | *((_QWORD *)a3 + 7))
          || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](lessThan55mHistogram, "isEqual:")) != 0)
        {
          lessThan200mHistogram = self->_lessThan200mHistogram;
          if (!((unint64_t)lessThan200mHistogram | *((_QWORD *)a3 + 5))
            || (v5 = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](lessThan200mHistogram, "isEqual:")) != 0)
          {
            anyPositiveHistogram = self->_anyPositiveHistogram;
            if ((unint64_t)anyPositiveHistogram | *((_QWORD *)a3 + 3))
              LOBYTE(v5) = -[AWDCoreRoutineLocationAwarenessBasicHistogram isEqual:](anyPositiveHistogram, "isEqual:");
            else
              LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761u * self->_duration;
LABEL_6:
  v5 = v4 ^ v3 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_lessThan10mHistogram, "hash");
  v6 = -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_lessThan20mHistogram, "hash");
  v7 = v5 ^ v6 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_lessThan55mHistogram, "hash");
  v8 = -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_lessThan200mHistogram, "hash");
  return v7 ^ v8 ^ -[AWDCoreRoutineLocationAwarenessBasicHistogram hash](self->_anyPositiveHistogram, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  AWDCoreRoutineLocationAwarenessBasicHistogram *lessThan10mHistogram;
  uint64_t v7;
  AWDCoreRoutineLocationAwarenessBasicHistogram *lessThan20mHistogram;
  uint64_t v9;
  AWDCoreRoutineLocationAwarenessBasicHistogram *lessThan55mHistogram;
  uint64_t v11;
  AWDCoreRoutineLocationAwarenessBasicHistogram *lessThan200mHistogram;
  uint64_t v13;
  AWDCoreRoutineLocationAwarenessBasicHistogram *anyPositiveHistogram;
  uint64_t v15;

  v5 = *((_BYTE *)a3 + 64);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 64);
  }
  if ((v5 & 1) != 0)
  {
    self->_duration = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  lessThan10mHistogram = self->_lessThan10mHistogram;
  v7 = *((_QWORD *)a3 + 4);
  if (lessThan10mHistogram)
  {
    if (v7)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](lessThan10mHistogram, "mergeFrom:");
  }
  else if (v7)
  {
    -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setLessThan10mHistogram:](self, "setLessThan10mHistogram:");
  }
  lessThan20mHistogram = self->_lessThan20mHistogram;
  v9 = *((_QWORD *)a3 + 6);
  if (lessThan20mHistogram)
  {
    if (v9)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](lessThan20mHistogram, "mergeFrom:");
  }
  else if (v9)
  {
    -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setLessThan20mHistogram:](self, "setLessThan20mHistogram:");
  }
  lessThan55mHistogram = self->_lessThan55mHistogram;
  v11 = *((_QWORD *)a3 + 7);
  if (lessThan55mHistogram)
  {
    if (v11)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](lessThan55mHistogram, "mergeFrom:");
  }
  else if (v11)
  {
    -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setLessThan55mHistogram:](self, "setLessThan55mHistogram:");
  }
  lessThan200mHistogram = self->_lessThan200mHistogram;
  v13 = *((_QWORD *)a3 + 5);
  if (lessThan200mHistogram)
  {
    if (v13)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](lessThan200mHistogram, "mergeFrom:");
  }
  else if (v13)
  {
    -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setLessThan200mHistogram:](self, "setLessThan200mHistogram:");
  }
  anyPositiveHistogram = self->_anyPositiveHistogram;
  v15 = *((_QWORD *)a3 + 3);
  if (anyPositiveHistogram)
  {
    if (v15)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram mergeFrom:](anyPositiveHistogram, "mergeFrom:");
  }
  else if (v15)
  {
    -[AWDCoreRoutineLocationAwarenessLocationTimeHistograms setAnyPositiveHistogram:](self, "setAnyPositiveHistogram:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)lessThan10mHistogram
{
  return self->_lessThan10mHistogram;
}

- (void)setLessThan10mHistogram:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)lessThan20mHistogram
{
  return self->_lessThan20mHistogram;
}

- (void)setLessThan20mHistogram:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)lessThan55mHistogram
{
  return self->_lessThan55mHistogram;
}

- (void)setLessThan55mHistogram:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)lessThan200mHistogram
{
  return self->_lessThan200mHistogram;
}

- (void)setLessThan200mHistogram:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (AWDCoreRoutineLocationAwarenessBasicHistogram)anyPositiveHistogram
{
  return self->_anyPositiveHistogram;
}

- (void)setAnyPositiveHistogram:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
