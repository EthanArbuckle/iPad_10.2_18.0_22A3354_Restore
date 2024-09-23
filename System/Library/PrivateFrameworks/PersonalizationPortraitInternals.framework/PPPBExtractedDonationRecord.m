@implementation PPPBExtractedDonationRecord

- (BOOL)hasSourceBundleId
{
  return self->_sourceBundleId != 0;
}

- (BOOL)hasAlgorithm
{
  return self->_algorithm != 0;
}

- (void)setScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTopicId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_topicId = a3;
}

- (void)setHasTopicId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTopicId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasNamedEntity
{
  return self->_namedEntity != 0;
}

- (void)setUnixTimestampSec:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_unixTimestampSec = a3;
}

- (void)setHasUnixTimestampSec:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUnixTimestampSec
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)PPPBExtractedDonationRecord;
  -[PPPBExtractedDonationRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPPBExtractedDonationRecord dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sourceBundleId;
  NSString *algorithm;
  char has;
  void *v8;
  void *v9;
  NSString *namedEntity;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sourceBundleId = self->_sourceBundleId;
  if (sourceBundleId)
    objc_msgSend(v3, "setObject:forKey:", sourceBundleId, CFSTR("sourceBundleId"));
  algorithm = self->_algorithm;
  if (algorithm)
    objc_msgSend(v4, "setObject:forKey:", algorithm, CFSTR("algorithm"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("score"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_topicId);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("topicId"));

  }
  namedEntity = self->_namedEntity;
  if (namedEntity)
    objc_msgSend(v4, "setObject:forKey:", namedEntity, CFSTR("namedEntity"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_unixTimestampSec);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("unixTimestampSec"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPPBExtractedDonationRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sourceBundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_algorithm)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
  if (self->_namedEntity)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_sourceBundleId)
  {
    objc_msgSend(v4, "setSourceBundleId:");
    v4 = v6;
  }
  if (self->_algorithm)
  {
    objc_msgSend(v6, "setAlgorithm:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_score;
    *((_BYTE *)v4 + 56) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_topicId;
    *((_BYTE *)v4 + 56) |= 2u;
  }
  if (self->_namedEntity)
  {
    objc_msgSend(v6, "setNamedEntity:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_unixTimestampSec;
    *((_BYTE *)v4 + 56) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sourceBundleId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_algorithm, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_score;
    *(_BYTE *)(v5 + 56) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_topicId;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v11 = -[NSString copyWithZone:](self->_namedEntity, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_unixTimestampSec;
    *(_BYTE *)(v5 + 56) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sourceBundleId;
  NSString *algorithm;
  char has;
  char v8;
  NSString *namedEntity;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  sourceBundleId = self->_sourceBundleId;
  if ((unint64_t)sourceBundleId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](sourceBundleId, "isEqual:"))
      goto LABEL_23;
  }
  algorithm = self->_algorithm;
  if ((unint64_t)algorithm | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](algorithm, "isEqual:"))
      goto LABEL_23;
  }
  has = (char)self->_has;
  v8 = *((_BYTE *)v4 + 56);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_score != *((double *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_topicId != *((_QWORD *)v4 + 2))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_23;
  }
  namedEntity = self->_namedEntity;
  if ((unint64_t)namedEntity | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](namedEntity, "isEqual:"))
    {
LABEL_23:
      v10 = 0;
      goto LABEL_24;
    }
    has = (char)self->_has;
    v8 = *((_BYTE *)v4 + 56);
  }
  v10 = (v8 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_unixTimestampSec != *((_QWORD *)v4 + 3))
      goto LABEL_23;
    v10 = 1;
  }
LABEL_24:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  double score;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  NSUInteger v12;
  unint64_t v13;

  v3 = -[NSString hash](self->_sourceBundleId, "hash");
  v4 = -[NSString hash](self->_algorithm, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    score = self->_score;
    v8 = -score;
    if (score >= 0.0)
      v8 = self->_score;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 2) != 0)
    v11 = 2654435761u * self->_topicId;
  else
    v11 = 0;
  v12 = -[NSString hash](self->_namedEntity, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v13 = 2654435761u * self->_unixTimestampSec;
  else
    v13 = 0;
  return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[PPPBExtractedDonationRecord setSourceBundleId:](self, "setSourceBundleId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PPPBExtractedDonationRecord setAlgorithm:](self, "setAlgorithm:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 56);
  if ((v5 & 1) != 0)
  {
    self->_score = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_topicId = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PPPBExtractedDonationRecord setNamedEntity:](self, "setNamedEntity:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    self->_unixTimestampSec = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (void)setSourceBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_sourceBundleId, a3);
}

- (NSString)algorithm
{
  return self->_algorithm;
}

- (void)setAlgorithm:(id)a3
{
  objc_storeStrong((id *)&self->_algorithm, a3);
}

- (double)score
{
  return self->_score;
}

- (unint64_t)topicId
{
  return self->_topicId;
}

- (NSString)namedEntity
{
  return self->_namedEntity;
}

- (void)setNamedEntity:(id)a3
{
  objc_storeStrong((id *)&self->_namedEntity, a3);
}

- (unint64_t)unixTimestampSec
{
  return self->_unixTimestampSec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
  objc_storeStrong((id *)&self->_namedEntity, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
}

@end
