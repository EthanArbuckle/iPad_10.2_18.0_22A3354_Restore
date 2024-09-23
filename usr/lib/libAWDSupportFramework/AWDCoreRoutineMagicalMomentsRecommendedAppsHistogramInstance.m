@implementation AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance setBundleId:](self, "setBundleId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance;
  -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setRank:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRank
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setConfidence:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance description](&v3, sel_description), -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bundleId;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v3, "setObject:forKey:", bundleId, CFSTR("bundleId"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_rank), CFSTR("rank"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_confidence), CFSTR("confidence"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_bundleId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has;

  if (self->_bundleId)
    objc_msgSend(a3, "setBundleId:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_rank;
    *((_BYTE *)a3 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_confidence;
    *((_BYTE *)a3 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 8) = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_rank;
    *(_BYTE *)(v5 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_confidence;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *bundleId;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    bundleId = self->_bundleId;
    if (!((unint64_t)bundleId | *((_QWORD *)a3 + 1)) || (v5 = -[NSString isEqual:](bundleId, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 24) & 2) == 0 || self->_rank != *((_DWORD *)a3 + 5))
          goto LABEL_13;
      }
      else if ((*((_BYTE *)a3 + 24) & 2) != 0)
      {
LABEL_13:
        LOBYTE(v5) = 0;
        return v5;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) == 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_confidence != *((_DWORD *)a3 + 4))
          goto LABEL_13;
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_bundleId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_rank;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_confidence;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if (*((_QWORD *)a3 + 1))
    -[AWDCoreRoutineMagicalMomentsRecommendedAppsHistogramInstance setBundleId:](self, "setBundleId:");
  v5 = *((_BYTE *)a3 + 24);
  if ((v5 & 2) != 0)
  {
    self->_rank = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 24);
  }
  if ((v5 & 1) != 0)
  {
    self->_confidence = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (int)rank
{
  return self->_rank;
}

- (int)confidence
{
  return self->_confidence;
}

@end
