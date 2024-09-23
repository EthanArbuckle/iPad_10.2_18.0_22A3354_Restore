@implementation AWDProactiveModelFittingLogRegWeights

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

- (BOOL)hasModelInfo
{
  return self->_modelInfo != 0;
}

- (BOOL)hasSparseFloatWeights
{
  return self->_sparseFloatWeights != 0;
}

- (BOOL)hasMinibatchStats
{
  return self->_minibatchStats != 0;
}

- (BOOL)hasEvaluationMetrics
{
  return self->_evaluationMetrics != 0;
}

- (BOOL)hasSparseQuantizedWeights
{
  return self->_sparseQuantizedWeights != 0;
}

- (void)setWeightsScaleFactor:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_weightsScaleFactor = a3;
}

- (void)setHasWeightsScaleFactor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWeightsScaleFactor
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setWeightsL2norm:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_weightsL2norm = a3;
}

- (void)setHasWeightsL2norm:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWeightsL2norm
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasDenseQuantizedWeights
{
  return self->_denseQuantizedWeights != 0;
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
  v8.super_class = (Class)AWDProactiveModelFittingLogRegWeights;
  -[AWDProactiveModelFittingLogRegWeights description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingLogRegWeights dictionaryRepresentation](self, "dictionaryRepresentation");
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
  AWDProactiveModelFittingSparseFloatVector *sparseFloatWeights;
  void *v9;
  AWDProactiveModelFittingMinibatchStats *minibatchStats;
  void *v11;
  AWDProactiveModelFittingEvalMetrics *evaluationMetrics;
  void *v13;
  AWDProactiveModelFittingQuantizedSparseVector *sparseQuantizedWeights;
  void *v15;
  char has;
  void *v17;
  void *v18;
  AWDProactiveModelFittingQuantizedDenseVector *denseQuantizedWeights;
  void *v20;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
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
  sparseFloatWeights = self->_sparseFloatWeights;
  if (sparseFloatWeights)
  {
    -[AWDProactiveModelFittingSparseFloatVector dictionaryRepresentation](sparseFloatWeights, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("sparseFloatWeights"));

  }
  minibatchStats = self->_minibatchStats;
  if (minibatchStats)
  {
    -[AWDProactiveModelFittingMinibatchStats dictionaryRepresentation](minibatchStats, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("minibatchStats"));

  }
  evaluationMetrics = self->_evaluationMetrics;
  if (evaluationMetrics)
  {
    -[AWDProactiveModelFittingEvalMetrics dictionaryRepresentation](evaluationMetrics, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("evaluationMetrics"));

  }
  sparseQuantizedWeights = self->_sparseQuantizedWeights;
  if (sparseQuantizedWeights)
  {
    -[AWDProactiveModelFittingQuantizedSparseVector dictionaryRepresentation](sparseQuantizedWeights, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("sparseQuantizedWeights"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)&v4 = self->_weightsScaleFactor;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("weightsScaleFactor"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&v4 = self->_weightsL2norm;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("weightsL2norm"));

  }
  denseQuantizedWeights = self->_denseQuantizedWeights;
  if (denseQuantizedWeights)
  {
    -[AWDProactiveModelFittingQuantizedDenseVector dictionaryRepresentation](denseQuantizedWeights, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("denseQuantizedWeights"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingLogRegWeightsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
  if (self->_modelInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sparseFloatWeights)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_minibatchStats)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_evaluationMetrics)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sparseQuantizedWeights)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
  if (self->_denseQuantizedWeights)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  v6 = v4;
  if (self->_modelInfo)
  {
    objc_msgSend(v4, "setModelInfo:");
    v4 = v6;
  }
  if (self->_sparseFloatWeights)
  {
    objc_msgSend(v6, "setSparseFloatWeights:");
    v4 = v6;
  }
  if (self->_minibatchStats)
  {
    objc_msgSend(v6, "setMinibatchStats:");
    v4 = v6;
  }
  if (self->_evaluationMetrics)
  {
    objc_msgSend(v6, "setEvaluationMetrics:");
    v4 = v6;
  }
  if (self->_sparseQuantizedWeights)
  {
    objc_msgSend(v6, "setSparseQuantizedWeights:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 17) = LODWORD(self->_weightsScaleFactor);
    *((_BYTE *)v4 + 72) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = LODWORD(self->_weightsL2norm);
    *((_BYTE *)v4 + 72) |= 2u;
  }
  if (self->_denseQuantizedWeights)
  {
    objc_msgSend(v6, "setDenseQuantizedWeights:");
    v4 = v6;
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
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  char has;
  id v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v7 = -[AWDProactiveModelFittingModelInfo copyWithZone:](self->_modelInfo, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;

  v9 = -[AWDProactiveModelFittingSparseFloatVector copyWithZone:](self->_sparseFloatWeights, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v9;

  v11 = -[AWDProactiveModelFittingMinibatchStats copyWithZone:](self->_minibatchStats, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  v13 = -[AWDProactiveModelFittingEvalMetrics copyWithZone:](self->_evaluationMetrics, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v13;

  v15 = -[AWDProactiveModelFittingQuantizedSparseVector copyWithZone:](self->_sparseQuantizedWeights, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v15;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)(v6 + 68) = self->_weightsScaleFactor;
    *(_BYTE *)(v6 + 72) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)(v6 + 64) = self->_weightsL2norm;
    *(_BYTE *)(v6 + 72) |= 2u;
  }
  v18 = -[AWDProactiveModelFittingQuantizedDenseVector copyWithZone:](self->_denseQuantizedWeights, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v18;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  AWDProactiveModelFittingModelInfo *modelInfo;
  AWDProactiveModelFittingSparseFloatVector *sparseFloatWeights;
  AWDProactiveModelFittingMinibatchStats *minibatchStats;
  AWDProactiveModelFittingEvalMetrics *evaluationMetrics;
  AWDProactiveModelFittingQuantizedSparseVector *sparseQuantizedWeights;
  AWDProactiveModelFittingQuantizedDenseVector *denseQuantizedWeights;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_29:
    v11 = 0;
    goto LABEL_30;
  }
  modelInfo = self->_modelInfo;
  if ((unint64_t)modelInfo | *((_QWORD *)v4 + 5)
    && !-[AWDProactiveModelFittingModelInfo isEqual:](modelInfo, "isEqual:"))
  {
    goto LABEL_29;
  }
  sparseFloatWeights = self->_sparseFloatWeights;
  if ((unint64_t)sparseFloatWeights | *((_QWORD *)v4 + 6))
  {
    if (!-[AWDProactiveModelFittingSparseFloatVector isEqual:](sparseFloatWeights, "isEqual:"))
      goto LABEL_29;
  }
  minibatchStats = self->_minibatchStats;
  if ((unint64_t)minibatchStats | *((_QWORD *)v4 + 4))
  {
    if (!-[AWDProactiveModelFittingMinibatchStats isEqual:](minibatchStats, "isEqual:"))
      goto LABEL_29;
  }
  evaluationMetrics = self->_evaluationMetrics;
  if ((unint64_t)evaluationMetrics | *((_QWORD *)v4 + 3))
  {
    if (!-[AWDProactiveModelFittingEvalMetrics isEqual:](evaluationMetrics, "isEqual:"))
      goto LABEL_29;
  }
  sparseQuantizedWeights = self->_sparseQuantizedWeights;
  if ((unint64_t)sparseQuantizedWeights | *((_QWORD *)v4 + 7))
  {
    if (!-[AWDProactiveModelFittingQuantizedSparseVector isEqual:](sparseQuantizedWeights, "isEqual:"))
      goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_weightsScaleFactor != *((float *)v4 + 17))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_weightsL2norm != *((float *)v4 + 16))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_29;
  }
  denseQuantizedWeights = self->_denseQuantizedWeights;
  if ((unint64_t)denseQuantizedWeights | *((_QWORD *)v4 + 2))
    v11 = -[AWDProactiveModelFittingQuantizedDenseVector isEqual:](denseQuantizedWeights, "isEqual:");
  else
    v11 = 1;
LABEL_30:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char has;
  unint64_t v10;
  float weightsScaleFactor;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  float weightsL2norm;
  double v17;
  long double v18;
  double v19;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[AWDProactiveModelFittingModelInfo hash](self->_modelInfo, "hash");
  v5 = -[AWDProactiveModelFittingSparseFloatVector hash](self->_sparseFloatWeights, "hash");
  v6 = -[AWDProactiveModelFittingMinibatchStats hash](self->_minibatchStats, "hash");
  v7 = -[AWDProactiveModelFittingEvalMetrics hash](self->_evaluationMetrics, "hash");
  v8 = -[AWDProactiveModelFittingQuantizedSparseVector hash](self->_sparseQuantizedWeights, "hash");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    weightsScaleFactor = self->_weightsScaleFactor;
    v12 = weightsScaleFactor;
    if (weightsScaleFactor < 0.0)
      v12 = -weightsScaleFactor;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 2) != 0)
  {
    weightsL2norm = self->_weightsL2norm;
    v17 = weightsL2norm;
    if (weightsL2norm < 0.0)
      v17 = -weightsL2norm;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v15 ^ -[AWDProactiveModelFittingQuantizedDenseVector hash](self->_denseQuantizedWeights, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  AWDProactiveModelFittingModelInfo *modelInfo;
  uint64_t v7;
  AWDProactiveModelFittingSparseFloatVector *sparseFloatWeights;
  uint64_t v9;
  AWDProactiveModelFittingMinibatchStats *minibatchStats;
  uint64_t v11;
  AWDProactiveModelFittingEvalMetrics *evaluationMetrics;
  uint64_t v13;
  AWDProactiveModelFittingQuantizedSparseVector *sparseQuantizedWeights;
  uint64_t v15;
  char v16;
  AWDProactiveModelFittingQuantizedDenseVector *denseQuantizedWeights;
  uint64_t v18;
  id v19;

  v4 = a3;
  v5 = v4;
  if ((v4[9] & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  modelInfo = self->_modelInfo;
  v7 = *((_QWORD *)v5 + 5);
  v19 = v5;
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
    -[AWDProactiveModelFittingLogRegWeights setModelInfo:](self, "setModelInfo:");
  }
  v5 = v19;
LABEL_9:
  sparseFloatWeights = self->_sparseFloatWeights;
  v9 = *((_QWORD *)v5 + 6);
  if (sparseFloatWeights)
  {
    if (!v9)
      goto LABEL_15;
    -[AWDProactiveModelFittingSparseFloatVector mergeFrom:](sparseFloatWeights, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[AWDProactiveModelFittingLogRegWeights setSparseFloatWeights:](self, "setSparseFloatWeights:");
  }
  v5 = v19;
LABEL_15:
  minibatchStats = self->_minibatchStats;
  v11 = *((_QWORD *)v5 + 4);
  if (minibatchStats)
  {
    if (!v11)
      goto LABEL_21;
    -[AWDProactiveModelFittingMinibatchStats mergeFrom:](minibatchStats, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_21;
    -[AWDProactiveModelFittingLogRegWeights setMinibatchStats:](self, "setMinibatchStats:");
  }
  v5 = v19;
LABEL_21:
  evaluationMetrics = self->_evaluationMetrics;
  v13 = *((_QWORD *)v5 + 3);
  if (evaluationMetrics)
  {
    if (!v13)
      goto LABEL_27;
    -[AWDProactiveModelFittingEvalMetrics mergeFrom:](evaluationMetrics, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    -[AWDProactiveModelFittingLogRegWeights setEvaluationMetrics:](self, "setEvaluationMetrics:");
  }
  v5 = v19;
LABEL_27:
  sparseQuantizedWeights = self->_sparseQuantizedWeights;
  v15 = *((_QWORD *)v5 + 7);
  if (sparseQuantizedWeights)
  {
    if (!v15)
      goto LABEL_33;
    -[AWDProactiveModelFittingQuantizedSparseVector mergeFrom:](sparseQuantizedWeights, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_33;
    -[AWDProactiveModelFittingLogRegWeights setSparseQuantizedWeights:](self, "setSparseQuantizedWeights:");
  }
  v5 = v19;
LABEL_33:
  v16 = *((_BYTE *)v5 + 72);
  if ((v16 & 4) != 0)
  {
    self->_weightsScaleFactor = *((float *)v5 + 17);
    *(_BYTE *)&self->_has |= 4u;
    v16 = *((_BYTE *)v5 + 72);
  }
  if ((v16 & 2) != 0)
  {
    self->_weightsL2norm = *((float *)v5 + 16);
    *(_BYTE *)&self->_has |= 2u;
  }
  denseQuantizedWeights = self->_denseQuantizedWeights;
  v18 = *((_QWORD *)v5 + 2);
  if (denseQuantizedWeights)
  {
    if (v18)
    {
      -[AWDProactiveModelFittingQuantizedDenseVector mergeFrom:](denseQuantizedWeights, "mergeFrom:");
LABEL_42:
      v5 = v19;
    }
  }
  else if (v18)
  {
    -[AWDProactiveModelFittingLogRegWeights setDenseQuantizedWeights:](self, "setDenseQuantizedWeights:");
    goto LABEL_42;
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

- (AWDProactiveModelFittingSparseFloatVector)sparseFloatWeights
{
  return self->_sparseFloatWeights;
}

- (void)setSparseFloatWeights:(id)a3
{
  objc_storeStrong((id *)&self->_sparseFloatWeights, a3);
}

- (AWDProactiveModelFittingMinibatchStats)minibatchStats
{
  return self->_minibatchStats;
}

- (void)setMinibatchStats:(id)a3
{
  objc_storeStrong((id *)&self->_minibatchStats, a3);
}

- (AWDProactiveModelFittingEvalMetrics)evaluationMetrics
{
  return self->_evaluationMetrics;
}

- (void)setEvaluationMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationMetrics, a3);
}

- (AWDProactiveModelFittingQuantizedSparseVector)sparseQuantizedWeights
{
  return self->_sparseQuantizedWeights;
}

- (void)setSparseQuantizedWeights:(id)a3
{
  objc_storeStrong((id *)&self->_sparseQuantizedWeights, a3);
}

- (float)weightsScaleFactor
{
  return self->_weightsScaleFactor;
}

- (float)weightsL2norm
{
  return self->_weightsL2norm;
}

- (AWDProactiveModelFittingQuantizedDenseVector)denseQuantizedWeights
{
  return self->_denseQuantizedWeights;
}

- (void)setDenseQuantizedWeights:(id)a3
{
  objc_storeStrong((id *)&self->_denseQuantizedWeights, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sparseQuantizedWeights, 0);
  objc_storeStrong((id *)&self->_sparseFloatWeights, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_minibatchStats, 0);
  objc_storeStrong((id *)&self->_evaluationMetrics, 0);
  objc_storeStrong((id *)&self->_denseQuantizedWeights, 0);
}

- (BOOL)hasWeights
{
  return -[AWDProactiveModelFittingLogRegWeights hasSparseFloatWeights](self, "hasSparseFloatWeights")
      || -[AWDProactiveModelFittingLogRegWeights hasSparseQuantizedWeights](self, "hasSparseQuantizedWeights")
      || -[AWDProactiveModelFittingLogRegWeights hasDenseQuantizedWeights](self, "hasDenseQuantizedWeights");
}

@end
