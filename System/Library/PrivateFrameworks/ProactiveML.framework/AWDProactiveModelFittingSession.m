@implementation AWDProactiveModelFittingSession

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasModelInfo
{
  return self->_modelInfo != 0;
}

- (void)setLabel:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_label = a3;
}

- (void)setHasLabel:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLabel
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSparseFloatFeatures
{
  return self->_sparseFloatFeatures != 0;
}

- (void)setSupervisionType:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_supervisionType = a3;
}

- (void)setHasSupervisionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSupervisionType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setConfidenceScore:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_confidenceScore = a3;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasConfidenceScore
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
  v8.super_class = (Class)AWDProactiveModelFittingSession;
  -[AWDProactiveModelFittingSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingSession dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  AWDProactiveModelFittingModelInfo *modelInfo;
  void *v7;
  void *v8;
  AWDProactiveModelFittingSparseFloatVector *sparseFloatFeatures;
  void *v10;
  char has;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

  }
  modelInfo = self->_modelInfo;
  if (modelInfo)
  {
    -[AWDProactiveModelFittingModelInfo dictionaryRepresentation](modelInfo, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("modelInfo"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_label);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("label"));

  }
  sparseFloatFeatures = self->_sparseFloatFeatures;
  if (sparseFloatFeatures)
  {
    -[AWDProactiveModelFittingSparseFloatVector dictionaryRepresentation](sparseFloatFeatures, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("sparseFloatFeatures"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_supervisionType);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("supervisionType"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(float *)&v4 = self->_confidenceScore;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("confidenceScore"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_modelInfo)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_sparseFloatFeatures)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[3] = self->_timestamp;
    *((_BYTE *)v4 + 56) |= 4u;
  }
  v6 = v4;
  if (self->_modelInfo)
  {
    objc_msgSend(v4, "setModelInfo:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_label;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  if (self->_sparseFloatFeatures)
  {
    objc_msgSend(v6, "setSparseFloatFeatures:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_supervisionType;
    *((_BYTE *)v4 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 8) = LODWORD(self->_confidenceScore);
    *((_BYTE *)v4 + 56) |= 8u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 4u;
  }
  v7 = -[AWDProactiveModelFittingModelInfo copyWithZone:](self->_modelInfo, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_label;
    *(_BYTE *)(v6 + 56) |= 1u;
  }
  v9 = -[AWDProactiveModelFittingSparseFloatVector copyWithZone:](self->_sparseFloatFeatures, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v9;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_supervisionType;
    *(_BYTE *)(v6 + 56) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(float *)(v6 + 32) = self->_confidenceScore;
    *(_BYTE *)(v6 + 56) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  AWDProactiveModelFittingModelInfo *modelInfo;
  AWDProactiveModelFittingSparseFloatVector *sparseFloatFeatures;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 56);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_timestamp != *((_QWORD *)v4 + 3))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_27;
  }
  modelInfo = self->_modelInfo;
  if ((unint64_t)modelInfo | *((_QWORD *)v4 + 5))
  {
    if (!-[AWDProactiveModelFittingModelInfo isEqual:](modelInfo, "isEqual:"))
      goto LABEL_27;
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 56);
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_label != *((_QWORD *)v4 + 1))
      goto LABEL_27;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_27;
  }
  sparseFloatFeatures = self->_sparseFloatFeatures;
  if ((unint64_t)sparseFloatFeatures | *((_QWORD *)v4 + 6))
  {
    if (-[AWDProactiveModelFittingSparseFloatVector isEqual:](sparseFloatFeatures, "isEqual:"))
    {
      has = (char)self->_has;
      v6 = *((_BYTE *)v4 + 56);
      goto LABEL_18;
    }
LABEL_27:
    v9 = 0;
    goto LABEL_28;
  }
LABEL_18:
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_supervisionType != *((_QWORD *)v4 + 2))
      goto LABEL_27;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_27;
  }
  v9 = (v6 & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_confidenceScore != *((float *)v4 + 8))
      goto LABEL_27;
    v9 = 1;
  }
LABEL_28:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  float confidenceScore;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[AWDProactiveModelFittingModelInfo hash](self->_modelInfo, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_label;
  else
    v5 = 0;
  v6 = -[AWDProactiveModelFittingSparseFloatVector hash](self->_sparseFloatFeatures, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761u * self->_supervisionType;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_9;
LABEL_14:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_14;
LABEL_9:
  confidenceScore = self->_confidenceScore;
  v9 = confidenceScore;
  if (confidenceScore < 0.0)
    v9 = -confidenceScore;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  AWDProactiveModelFittingModelInfo *modelInfo;
  uint64_t v7;
  AWDProactiveModelFittingSparseFloatVector *sparseFloatFeatures;
  uint64_t v9;
  char v10;
  id v11;

  v4 = a3;
  v5 = v4;
  if ((v4[7] & 4) != 0)
  {
    self->_timestamp = v4[3];
    *(_BYTE *)&self->_has |= 4u;
  }
  modelInfo = self->_modelInfo;
  v7 = *((_QWORD *)v5 + 5);
  v11 = v5;
  if (modelInfo)
  {
    if (!v7)
      goto LABEL_9;
    -[AWDProactiveModelFittingModelInfo mergeFrom:](modelInfo, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[AWDProactiveModelFittingSession setModelInfo:](self, "setModelInfo:");
  }
  v5 = v11;
LABEL_9:
  if ((*((_BYTE *)v5 + 56) & 1) != 0)
  {
    self->_label = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  sparseFloatFeatures = self->_sparseFloatFeatures;
  v9 = *((_QWORD *)v5 + 6);
  if (sparseFloatFeatures)
  {
    if (!v9)
      goto LABEL_17;
    -[AWDProactiveModelFittingSparseFloatVector mergeFrom:](sparseFloatFeatures, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_17;
    -[AWDProactiveModelFittingSession setSparseFloatFeatures:](self, "setSparseFloatFeatures:");
  }
  v5 = v11;
LABEL_17:
  v10 = *((_BYTE *)v5 + 56);
  if ((v10 & 2) != 0)
  {
    self->_supervisionType = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v10 = *((_BYTE *)v5 + 56);
  }
  if ((v10 & 8) != 0)
  {
    self->_confidenceScore = *((float *)v5 + 8);
    *(_BYTE *)&self->_has |= 8u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDProactiveModelFittingModelInfo)modelInfo
{
  return self->_modelInfo;
}

- (void)setModelInfo:(id)a3
{
  objc_storeStrong((id *)&self->_modelInfo, a3);
}

- (unint64_t)label
{
  return self->_label;
}

- (AWDProactiveModelFittingSparseFloatVector)sparseFloatFeatures
{
  return self->_sparseFloatFeatures;
}

- (void)setSparseFloatFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_sparseFloatFeatures, a3);
}

- (unint64_t)supervisionType
{
  return self->_supervisionType;
}

- (float)confidenceScore
{
  return self->_confidenceScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sparseFloatFeatures, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
}

@end
