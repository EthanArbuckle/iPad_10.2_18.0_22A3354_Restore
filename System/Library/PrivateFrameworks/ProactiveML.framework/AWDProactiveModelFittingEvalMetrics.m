@implementation AWDProactiveModelFittingEvalMetrics

+ (AWDProactiveModelFittingEvalMetrics)evalMetricsWithRmse:(float)a3 f1:(float)a4
{
  void *v6;
  double v7;
  double v8;

  v6 = (void *)objc_opt_new();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "setRmse:", v7);
  *(float *)&v8 = a4;
  objc_msgSend(v6, "setF1:", v8);
  return (AWDProactiveModelFittingEvalMetrics *)v6;
}

+ (AWDProactiveModelFittingEvalMetrics)evalMetricsWithRmse:(float)a3 f1:(float)a4 truePositives:(unint64_t)a5 trueNegatives:(unint64_t)a6 falsePositives:(unint64_t)a7 falseNegatives:(unint64_t)a8
{
  void *v14;
  double v15;
  double v16;

  v14 = (void *)objc_opt_new();
  *(float *)&v15 = a3;
  objc_msgSend(v14, "setRmse:", v15);
  *(float *)&v16 = a4;
  objc_msgSend(v14, "setF1:", v16);
  objc_msgSend(v14, "setTruePositives:", a5);
  objc_msgSend(v14, "setTrueNegatives:", a6);
  objc_msgSend(v14, "setFalsePositives:", a7);
  objc_msgSend(v14, "setFalseNegatives:", a8);
  return (AWDProactiveModelFittingEvalMetrics *)v14;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveModelFittingEvalMetrics;
  -[AWDProactiveModelFittingEvalMetrics dealloc](&v3, sel_dealloc);
}

- (void)setRmse:(float)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_rmse = a3;
}

- (void)setHasRmse:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRmse
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setF1:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_f1 = a3;
}

- (void)setHasF1:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasF1
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTruePositives:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_truePositives = a3;
}

- (void)setHasTruePositives:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTruePositives
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setTrueNegatives:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_trueNegatives = a3;
}

- (void)setHasTrueNegatives:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTrueNegatives
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setFalsePositives:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_falsePositives = a3;
}

- (void)setHasFalsePositives:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFalsePositives
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFalseNegatives:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_falseNegatives = a3;
}

- (void)setHasFalseNegatives:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFalseNegatives
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)positiveScoresCount
{
  return self->_positiveScores.count;
}

- (float)positiveScores
{
  return self->_positiveScores.list;
}

- (void)clearPositiveScores
{
  PBRepeatedFloatClear();
}

- (void)addPositiveScores:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)positiveScoresAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_positiveScores;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_positiveScores = &self->_positiveScores;
  count = self->_positiveScores.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_positiveScores->list[a3];
}

- (void)setPositiveScores:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)negativeScoresCount
{
  return self->_negativeScores.count;
}

- (float)negativeScores
{
  return self->_negativeScores.list;
}

- (void)clearNegativeScores
{
  PBRepeatedFloatClear();
}

- (void)addNegativeScores:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)negativeScoresAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_negativeScores;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_negativeScores = &self->_negativeScores;
  count = self->_negativeScores.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_negativeScores->list[a3];
}

- (void)setNegativeScores:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (void)setSecsToExecute:(float)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_secsToExecute = a3;
}

- (void)setHasSecsToExecute:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSecsToExecute
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
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
  v8.super_class = (Class)AWDProactiveModelFittingEvalMetrics;
  -[AWDProactiveModelFittingEvalMetrics description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingEvalMetrics dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  char has;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(float *)&v4 = self->_rmse;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("rmse"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&v4 = self->_f1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("f1"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_truePositives);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("truePositives"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_trueNegatives);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("trueNegatives"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_falsePositives);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("falsePositives"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_falseNegatives);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("falseNegatives"));

  }
LABEL_8:
  PBRepeatedFloatNSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("positiveScores"));

  PBRepeatedFloatNSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("negativeScores"));

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(float *)&v9 = self->_secsToExecute;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("secsToExecute"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingEvalMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_7:
    PBDataWriterWriteUint64Field();
LABEL_8:
  if (self->_positiveScores.count)
  {
    PBDataWriterPlaceMark();
    if (self->_positiveScores.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v6;
      }
      while (v6 < self->_positiveScores.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_negativeScores.count)
  {
    PBDataWriterPlaceMark();
    if (self->_negativeScores.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v7;
      }
      while (v7 < self->_negativeScores.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  id v12;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[23] = LODWORD(self->_rmse);
    *((_BYTE *)v4 + 100) |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[22] = LODWORD(self->_f1);
  *((_BYTE *)v4 + 100) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)v4 + 10) = self->_truePositives;
  *((_BYTE *)v4 + 100) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
LABEL_23:
    *((_QWORD *)v4 + 8) = self->_falsePositives;
    *((_BYTE *)v4 + 100) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_22:
  *((_QWORD *)v4 + 9) = self->_trueNegatives;
  *((_BYTE *)v4 + 100) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_23;
LABEL_6:
  if ((has & 1) != 0)
  {
LABEL_7:
    *((_QWORD *)v4 + 7) = self->_falseNegatives;
    *((_BYTE *)v4 + 100) |= 1u;
  }
LABEL_8:
  v12 = v4;
  if (-[AWDProactiveModelFittingEvalMetrics positiveScoresCount](self, "positiveScoresCount"))
  {
    objc_msgSend(v12, "clearPositiveScores");
    v6 = -[AWDProactiveModelFittingEvalMetrics positiveScoresCount](self, "positiveScoresCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[AWDProactiveModelFittingEvalMetrics positiveScoresAtIndex:](self, "positiveScoresAtIndex:", i);
        objc_msgSend(v12, "addPositiveScores:");
      }
    }
  }
  if (-[AWDProactiveModelFittingEvalMetrics negativeScoresCount](self, "negativeScoresCount"))
  {
    objc_msgSend(v12, "clearNegativeScores");
    v9 = -[AWDProactiveModelFittingEvalMetrics negativeScoresCount](self, "negativeScoresCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[AWDProactiveModelFittingEvalMetrics negativeScoresAtIndex:](self, "negativeScoresAtIndex:", j);
        objc_msgSend(v12, "addNegativeScores:");
      }
    }
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v12 + 24) = LODWORD(self->_secsToExecute);
    *((_BYTE *)v12 + 100) |= 0x40u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(float *)(v4 + 92) = self->_rmse;
    *(_BYTE *)(v4 + 100) |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v4 + 88) = self->_f1;
  *(_BYTE *)(v4 + 100) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *(_QWORD *)(v4 + 80) = self->_truePositives;
  *(_BYTE *)(v4 + 100) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *(_QWORD *)(v4 + 72) = self->_trueNegatives;
  *(_BYTE *)(v4 + 100) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_15:
  *(_QWORD *)(v4 + 64) = self->_falsePositives;
  *(_BYTE *)(v4 + 100) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_7:
    *(_QWORD *)(v4 + 56) = self->_falseNegatives;
    *(_BYTE *)(v4 + 100) |= 1u;
  }
LABEL_8:
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    *(float *)(v5 + 96) = self->_secsToExecute;
    *(_BYTE *)(v5 + 100) |= 0x40u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x20) == 0 || self->_rmse != *((float *)v4 + 23))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 100) & 0x20) != 0)
  {
LABEL_38:
    v5 = 0;
    goto LABEL_39;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x10) == 0 || self->_f1 != *((float *)v4 + 22))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 100) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 8) == 0 || self->_truePositives != *((_QWORD *)v4 + 10))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 100) & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 4) == 0 || self->_trueNegatives != *((_QWORD *)v4 + 9))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 100) & 4) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 2) == 0 || self->_falsePositives != *((_QWORD *)v4 + 8))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 100) & 2) != 0)
  {
    goto LABEL_38;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 1) == 0 || self->_falseNegatives != *((_QWORD *)v4 + 7))
      goto LABEL_38;
  }
  else if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
    goto LABEL_38;
  }
  if (!PBRepeatedFloatIsEqual() || !PBRepeatedFloatIsEqual())
    goto LABEL_38;
  v5 = (*((_BYTE *)v4 + 100) & 0x40) == 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 100) & 0x40) == 0 || self->_secsToExecute != *((float *)v4 + 24))
      goto LABEL_38;
    v5 = 1;
  }
LABEL_39:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float rmse;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float f1;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  float secsToExecute;
  double v21;
  long double v22;
  double v23;
  unint64_t v25;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    rmse = self->_rmse;
    v6 = rmse;
    if (rmse < 0.0)
      v6 = -rmse;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 0x10) != 0)
  {
    f1 = self->_f1;
    v11 = f1;
    if (f1 < 0.0)
      v11 = -f1;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 8) != 0)
  {
    v25 = 2654435761u * self->_truePositives;
    if ((has & 4) != 0)
    {
LABEL_19:
      v14 = 2654435761u * self->_trueNegatives;
      if ((has & 2) != 0)
        goto LABEL_20;
LABEL_24:
      v15 = 0;
      if ((has & 1) != 0)
        goto LABEL_21;
      goto LABEL_25;
    }
  }
  else
  {
    v25 = 0;
    if ((has & 4) != 0)
      goto LABEL_19;
  }
  v14 = 0;
  if ((has & 2) == 0)
    goto LABEL_24;
LABEL_20:
  v15 = 2654435761u * self->_falsePositives;
  if ((has & 1) != 0)
  {
LABEL_21:
    v16 = 2654435761u * self->_falseNegatives;
    goto LABEL_26;
  }
LABEL_25:
  v16 = 0;
LABEL_26:
  v17 = PBRepeatedFloatHash();
  v18 = PBRepeatedFloatHash();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    secsToExecute = self->_secsToExecute;
    v21 = secsToExecute;
    if (secsToExecute < 0.0)
      v21 = -secsToExecute;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  return v9 ^ v4 ^ v25 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  float *v12;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 100);
  if ((v5 & 0x20) != 0)
  {
    self->_rmse = *((float *)v4 + 23);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = *((_BYTE *)v4 + 100);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*((_BYTE *)v4 + 100) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_f1 = *((float *)v4 + 22);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 100);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  self->_truePositives = *((_QWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 100);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  self->_trueNegatives = *((_QWORD *)v4 + 9);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 100);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  self->_falsePositives = *((_QWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 100) & 1) != 0)
  {
LABEL_7:
    self->_falseNegatives = *((_QWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_8:
  v12 = (float *)v4;
  v6 = objc_msgSend(v4, "positiveScoresCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v12, "positiveScoresAtIndex:", i);
      -[AWDProactiveModelFittingEvalMetrics addPositiveScores:](self, "addPositiveScores:");
    }
  }
  v9 = objc_msgSend(v12, "negativeScoresCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
    {
      objc_msgSend(v12, "negativeScoresAtIndex:", j);
      -[AWDProactiveModelFittingEvalMetrics addNegativeScores:](self, "addNegativeScores:");
    }
  }
  if (((_BYTE)v12[25] & 0x40) != 0)
  {
    self->_secsToExecute = v12[24];
    *(_BYTE *)&self->_has |= 0x40u;
  }

}

- (float)rmse
{
  return self->_rmse;
}

- (float)f1
{
  return self->_f1;
}

- (unint64_t)truePositives
{
  return self->_truePositives;
}

- (unint64_t)trueNegatives
{
  return self->_trueNegatives;
}

- (unint64_t)falsePositives
{
  return self->_falsePositives;
}

- (unint64_t)falseNegatives
{
  return self->_falseNegatives;
}

- (float)secsToExecute
{
  return self->_secsToExecute;
}

- (id)toDictionary
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  id v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[8];
  _QWORD v26[9];

  v26[8] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[AWDProactiveModelFittingEvalMetrics positiveScoresCount](self, "positiveScoresCount"));
  if (-[AWDProactiveModelFittingEvalMetrics positiveScoresCount](self, "positiveScoresCount"))
  {
    v4 = 0;
    do
    {
      v5 = (void *)MEMORY[0x2199EA600]();
      v6 = objc_alloc(MEMORY[0x24BDD16E0]);
      LODWORD(v7) = (_DWORD)-[AWDProactiveModelFittingEvalMetrics positiveScores](self, "positiveScores")[4 * v4];
      v8 = (void *)objc_msgSend(v6, "initWithFloat:", v7);
      objc_msgSend(v3, "addObject:", v8);

      objc_autoreleasePoolPop(v5);
      ++v4;
    }
    while (-[AWDProactiveModelFittingEvalMetrics positiveScoresCount](self, "positiveScoresCount") > v4);
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[AWDProactiveModelFittingEvalMetrics negativeScoresCount](self, "negativeScoresCount"));
  if (-[AWDProactiveModelFittingEvalMetrics negativeScoresCount](self, "negativeScoresCount"))
  {
    v10 = 0;
    do
    {
      v11 = (void *)MEMORY[0x2199EA600]();
      v12 = objc_alloc(MEMORY[0x24BDD16E0]);
      LODWORD(v13) = (_DWORD)-[AWDProactiveModelFittingEvalMetrics negativeScores](self, "negativeScores")[4 * v10];
      v14 = (void *)objc_msgSend(v12, "initWithFloat:", v13);
      objc_msgSend(v9, "addObject:", v14);

      objc_autoreleasePoolPop(v11);
      ++v10;
    }
    while (-[AWDProactiveModelFittingEvalMetrics negativeScoresCount](self, "negativeScoresCount") > v10);
  }
  v25[0] = CFSTR("rmse");
  v15 = (void *)MEMORY[0x24BDD16E0];
  -[AWDProactiveModelFittingEvalMetrics rmse](self, "rmse");
  objc_msgSend(v15, "numberWithFloat:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v25[1] = CFSTR("f1");
  v17 = (void *)MEMORY[0x24BDD16E0];
  -[AWDProactiveModelFittingEvalMetrics f1](self, "f1");
  objc_msgSend(v17, "numberWithFloat:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v18;
  v25[2] = CFSTR("truePositives");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[AWDProactiveModelFittingEvalMetrics truePositives](self, "truePositives"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v19;
  v25[3] = CFSTR("trueNegatives");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[AWDProactiveModelFittingEvalMetrics trueNegatives](self, "trueNegatives"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v20;
  v25[4] = CFSTR("falsePositives");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[AWDProactiveModelFittingEvalMetrics falsePositives](self, "falsePositives"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v21;
  v25[5] = CFSTR("falseNegatives");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[AWDProactiveModelFittingEvalMetrics falseNegatives](self, "falseNegatives"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v22;
  v26[6] = v3;
  v25[6] = CFSTR("positiveScores");
  v25[7] = CFSTR("negativeScores");
  v26[7] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

@end
