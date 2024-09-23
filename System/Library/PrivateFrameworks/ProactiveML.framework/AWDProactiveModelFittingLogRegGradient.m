@implementation AWDProactiveModelFittingLogRegGradient

- (BOOL)hasGradient
{
  return -[AWDProactiveModelFittingLogRegGradient hasSparseFloatGradient](self, "hasSparseFloatGradient")
      || -[AWDProactiveModelFittingLogRegGradient hasSparseQuantizedGradient](self, "hasSparseQuantizedGradient")
      || -[AWDProactiveModelFittingLogRegGradient hasDenseQuantizedGradient](self, "hasDenseQuantizedGradient");
}

- (float)gradientValueAtIndex:(unint64_t)a3
{
  void *v5;
  float v6;
  void *v7;
  float v8;

  if (-[AWDProactiveModelFittingLogRegGradient hasSparseFloatGradient](self, "hasSparseFloatGradient"))
  {
    -[AWDProactiveModelFittingLogRegGradient sparseFloatGradient](self, "sparseFloatGradient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueAtIndex:", a3);
LABEL_8:
    v8 = v6;

    return v8;
  }
  if (-[AWDProactiveModelFittingLogRegGradient hasSparseQuantizedGradient](self, "hasSparseQuantizedGradient"))
  {
    -[AWDProactiveModelFittingLogRegGradient sparseQuantizedGradient](self, "sparseQuantizedGradient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v5 = v7;
    objc_msgSend(v7, "originalValueAtIndex:", a3);
    goto LABEL_8;
  }
  v8 = 0.0;
  if (-[AWDProactiveModelFittingLogRegGradient hasDenseQuantizedGradient](self, "hasDenseQuantizedGradient"))
  {
    -[AWDProactiveModelFittingLogRegGradient denseQuantizedGradient](self, "denseQuantizedGradient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  return v8;
}

- (unint64_t)gradientLength
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  if (-[AWDProactiveModelFittingLogRegGradient hasSparseFloatGradient](self, "hasSparseFloatGradient"))
  {
    -[AWDProactiveModelFittingLogRegGradient sparseFloatGradient](self, "sparseFloatGradient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");
LABEL_7:
    v5 = v4;
    goto LABEL_8;
  }
  if (!-[AWDProactiveModelFittingLogRegGradient hasSparseQuantizedGradient](self, "hasSparseQuantizedGradient"))
  {
    if (!-[AWDProactiveModelFittingLogRegGradient hasDenseQuantizedGradient](self, "hasDenseQuantizedGradient"))
      return 0;
    -[AWDProactiveModelFittingLogRegGradient denseQuantizedGradient](self, "denseQuantizedGradient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "valuesCount");
    goto LABEL_7;
  }
  -[AWDProactiveModelFittingLogRegGradient sparseQuantizedGradient](self, "sparseQuantizedGradient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "length");
LABEL_8:

  return v5;
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

- (BOOL)hasModelInfo
{
  return self->_modelInfo != 0;
}

- (BOOL)hasSparseFloatGradient
{
  return self->_sparseFloatGradient != 0;
}

- (BOOL)hasMinibatchStats
{
  return self->_minibatchStats != 0;
}

- (BOOL)hasEvaluationMetrics
{
  return self->_evaluationMetrics != 0;
}

- (void)setIteration:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_iteration = a3;
}

- (void)setHasIteration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIteration
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSparseQuantizedGradient
{
  return self->_sparseQuantizedGradient != 0;
}

- (void)setGradientScaleFactor:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_gradientScaleFactor = a3;
}

- (void)setHasGradientScaleFactor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasGradientScaleFactor
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setGradientL2norm:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_gradientL2norm = a3;
}

- (void)setHasGradientL2norm:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasGradientL2norm
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasDenseQuantizedGradient
{
  return self->_denseQuantizedGradient != 0;
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
  v8.super_class = (Class)AWDProactiveModelFittingLogRegGradient;
  -[AWDProactiveModelFittingLogRegGradient description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingLogRegGradient dictionaryRepresentation](self, "dictionaryRepresentation");
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
  AWDProactiveModelFittingSparseFloatVector *sparseFloatGradient;
  void *v9;
  AWDProactiveModelFittingMinibatchStats *minibatchStats;
  void *v11;
  AWDProactiveModelFittingEvalMetrics *evaluationMetrics;
  void *v13;
  void *v14;
  AWDProactiveModelFittingQuantizedSparseVector *sparseQuantizedGradient;
  void *v16;
  char has;
  void *v18;
  void *v19;
  AWDProactiveModelFittingQuantizedDenseVector *denseQuantizedGradient;
  void *v21;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
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
  sparseFloatGradient = self->_sparseFloatGradient;
  if (sparseFloatGradient)
  {
    -[AWDProactiveModelFittingSparseFloatVector dictionaryRepresentation](sparseFloatGradient, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("sparseFloatGradient"));

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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_iteration);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("iteration"));

  }
  sparseQuantizedGradient = self->_sparseQuantizedGradient;
  if (sparseQuantizedGradient)
  {
    -[AWDProactiveModelFittingQuantizedSparseVector dictionaryRepresentation](sparseQuantizedGradient, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("sparseQuantizedGradient"));

  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)&v4 = self->_gradientScaleFactor;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("gradientScaleFactor"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(float *)&v4 = self->_gradientL2norm;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("gradientL2norm"));

  }
  denseQuantizedGradient = self->_denseQuantizedGradient;
  if (denseQuantizedGradient)
  {
    -[AWDProactiveModelFittingQuantizedDenseVector dictionaryRepresentation](denseQuantizedGradient, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("denseQuantizedGradient"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingLogRegGradientReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
  if (self->_modelInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_sparseFloatGradient)
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
  if (self->_sparseQuantizedGradient)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
  if (self->_denseQuantizedGradient)
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((_BYTE *)v4 + 80) |= 2u;
  }
  v6 = v4;
  if (self->_modelInfo)
  {
    objc_msgSend(v4, "setModelInfo:");
    v4 = v6;
  }
  if (self->_sparseFloatGradient)
  {
    objc_msgSend(v6, "setSparseFloatGradient:");
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_iteration;
    *((_BYTE *)v4 + 80) |= 1u;
  }
  if (self->_sparseQuantizedGradient)
  {
    objc_msgSend(v6, "setSparseQuantizedGradient:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 11) = LODWORD(self->_gradientScaleFactor);
    *((_BYTE *)v4 + 80) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 10) = LODWORD(self->_gradientL2norm);
    *((_BYTE *)v4 + 80) |= 4u;
  }
  if (self->_denseQuantizedGradient)
  {
    objc_msgSend(v6, "setDenseQuantizedGradient:");
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
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
  v7 = -[AWDProactiveModelFittingModelInfo copyWithZone:](self->_modelInfo, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v7;

  v9 = -[AWDProactiveModelFittingSparseFloatVector copyWithZone:](self->_sparseFloatGradient, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v9;

  v11 = -[AWDProactiveModelFittingMinibatchStats copyWithZone:](self->_minibatchStats, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v11;

  v13 = -[AWDProactiveModelFittingEvalMetrics copyWithZone:](self->_evaluationMetrics, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v13;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_iteration;
    *(_BYTE *)(v6 + 80) |= 1u;
  }
  v15 = -[AWDProactiveModelFittingQuantizedSparseVector copyWithZone:](self->_sparseQuantizedGradient, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v15;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)(v6 + 44) = self->_gradientScaleFactor;
    *(_BYTE *)(v6 + 80) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(float *)(v6 + 40) = self->_gradientL2norm;
    *(_BYTE *)(v6 + 80) |= 4u;
  }
  v18 = -[AWDProactiveModelFittingQuantizedDenseVector copyWithZone:](self->_denseQuantizedGradient, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v18;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  AWDProactiveModelFittingModelInfo *modelInfo;
  AWDProactiveModelFittingSparseFloatVector *sparseFloatGradient;
  AWDProactiveModelFittingMinibatchStats *minibatchStats;
  AWDProactiveModelFittingEvalMetrics *evaluationMetrics;
  char has;
  char v10;
  AWDProactiveModelFittingQuantizedSparseVector *sparseQuantizedGradient;
  AWDProactiveModelFittingQuantizedDenseVector *denseQuantizedGradient;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_timestamp != *((_QWORD *)v4 + 2))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_35;
  }
  modelInfo = self->_modelInfo;
  if ((unint64_t)modelInfo | *((_QWORD *)v4 + 7)
    && !-[AWDProactiveModelFittingModelInfo isEqual:](modelInfo, "isEqual:"))
  {
    goto LABEL_35;
  }
  sparseFloatGradient = self->_sparseFloatGradient;
  if ((unint64_t)sparseFloatGradient | *((_QWORD *)v4 + 8))
  {
    if (!-[AWDProactiveModelFittingSparseFloatVector isEqual:](sparseFloatGradient, "isEqual:"))
      goto LABEL_35;
  }
  minibatchStats = self->_minibatchStats;
  if ((unint64_t)minibatchStats | *((_QWORD *)v4 + 6))
  {
    if (!-[AWDProactiveModelFittingMinibatchStats isEqual:](minibatchStats, "isEqual:"))
      goto LABEL_35;
  }
  evaluationMetrics = self->_evaluationMetrics;
  if ((unint64_t)evaluationMetrics | *((_QWORD *)v4 + 4))
  {
    if (!-[AWDProactiveModelFittingEvalMetrics isEqual:](evaluationMetrics, "isEqual:"))
      goto LABEL_35;
  }
  has = (char)self->_has;
  v10 = *((_BYTE *)v4 + 80);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_iteration != *((_QWORD *)v4 + 1))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_35;
  }
  sparseQuantizedGradient = self->_sparseQuantizedGradient;
  if ((unint64_t)sparseQuantizedGradient | *((_QWORD *)v4 + 9))
  {
    if (!-[AWDProactiveModelFittingQuantizedSparseVector isEqual:](sparseQuantizedGradient, "isEqual:"))
    {
LABEL_35:
      v13 = 0;
      goto LABEL_36;
    }
    has = (char)self->_has;
    v10 = *((_BYTE *)v4 + 80);
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_gradientScaleFactor != *((float *)v4 + 11))
      goto LABEL_35;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_35;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_gradientL2norm != *((float *)v4 + 10))
      goto LABEL_35;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_35;
  }
  denseQuantizedGradient = self->_denseQuantizedGradient;
  if ((unint64_t)denseQuantizedGradient | *((_QWORD *)v4 + 3))
    v13 = -[AWDProactiveModelFittingQuantizedDenseVector isEqual:](denseQuantizedGradient, "isEqual:");
  else
    v13 = 1;
LABEL_36:

  return v13;
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
  float gradientScaleFactor;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  float gradientL2norm;
  double v17;
  long double v18;
  double v19;
  unint64_t v21;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v21 = 2654435761u * self->_timestamp;
  else
    v21 = 0;
  v3 = -[AWDProactiveModelFittingModelInfo hash](self->_modelInfo, "hash");
  v4 = -[AWDProactiveModelFittingSparseFloatVector hash](self->_sparseFloatGradient, "hash");
  v5 = -[AWDProactiveModelFittingMinibatchStats hash](self->_minibatchStats, "hash");
  v6 = -[AWDProactiveModelFittingEvalMetrics hash](self->_evaluationMetrics, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761u * self->_iteration;
  else
    v7 = 0;
  v8 = -[AWDProactiveModelFittingQuantizedSparseVector hash](self->_sparseQuantizedGradient, "hash");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    gradientScaleFactor = self->_gradientScaleFactor;
    v12 = gradientScaleFactor;
    if (gradientScaleFactor < 0.0)
      v12 = -gradientScaleFactor;
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
  if ((has & 4) != 0)
  {
    gradientL2norm = self->_gradientL2norm;
    v17 = gradientL2norm;
    if (gradientL2norm < 0.0)
      v17 = -gradientL2norm;
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
  return v3 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v15 ^ -[AWDProactiveModelFittingQuantizedDenseVector hash](self->_denseQuantizedGradient, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  AWDProactiveModelFittingModelInfo *modelInfo;
  uint64_t v7;
  AWDProactiveModelFittingSparseFloatVector *sparseFloatGradient;
  uint64_t v9;
  AWDProactiveModelFittingMinibatchStats *minibatchStats;
  uint64_t v11;
  AWDProactiveModelFittingEvalMetrics *evaluationMetrics;
  uint64_t v13;
  AWDProactiveModelFittingQuantizedSparseVector *sparseQuantizedGradient;
  uint64_t v15;
  char v16;
  AWDProactiveModelFittingQuantizedDenseVector *denseQuantizedGradient;
  uint64_t v18;
  id v19;

  v4 = a3;
  v5 = v4;
  if ((v4[10] & 2) != 0)
  {
    self->_timestamp = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  modelInfo = self->_modelInfo;
  v7 = *((_QWORD *)v5 + 7);
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
    -[AWDProactiveModelFittingLogRegGradient setModelInfo:](self, "setModelInfo:");
  }
  v5 = v19;
LABEL_9:
  sparseFloatGradient = self->_sparseFloatGradient;
  v9 = *((_QWORD *)v5 + 8);
  if (sparseFloatGradient)
  {
    if (!v9)
      goto LABEL_15;
    -[AWDProactiveModelFittingSparseFloatVector mergeFrom:](sparseFloatGradient, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[AWDProactiveModelFittingLogRegGradient setSparseFloatGradient:](self, "setSparseFloatGradient:");
  }
  v5 = v19;
LABEL_15:
  minibatchStats = self->_minibatchStats;
  v11 = *((_QWORD *)v5 + 6);
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
    -[AWDProactiveModelFittingLogRegGradient setMinibatchStats:](self, "setMinibatchStats:");
  }
  v5 = v19;
LABEL_21:
  evaluationMetrics = self->_evaluationMetrics;
  v13 = *((_QWORD *)v5 + 4);
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
    -[AWDProactiveModelFittingLogRegGradient setEvaluationMetrics:](self, "setEvaluationMetrics:");
  }
  v5 = v19;
LABEL_27:
  if ((*((_BYTE *)v5 + 80) & 1) != 0)
  {
    self->_iteration = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  sparseQuantizedGradient = self->_sparseQuantizedGradient;
  v15 = *((_QWORD *)v5 + 9);
  if (sparseQuantizedGradient)
  {
    if (!v15)
      goto LABEL_35;
    -[AWDProactiveModelFittingQuantizedSparseVector mergeFrom:](sparseQuantizedGradient, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_35;
    -[AWDProactiveModelFittingLogRegGradient setSparseQuantizedGradient:](self, "setSparseQuantizedGradient:");
  }
  v5 = v19;
LABEL_35:
  v16 = *((_BYTE *)v5 + 80);
  if ((v16 & 8) != 0)
  {
    self->_gradientScaleFactor = *((float *)v5 + 11);
    *(_BYTE *)&self->_has |= 8u;
    v16 = *((_BYTE *)v5 + 80);
  }
  if ((v16 & 4) != 0)
  {
    self->_gradientL2norm = *((float *)v5 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }
  denseQuantizedGradient = self->_denseQuantizedGradient;
  v18 = *((_QWORD *)v5 + 3);
  if (denseQuantizedGradient)
  {
    if (v18)
    {
      -[AWDProactiveModelFittingQuantizedDenseVector mergeFrom:](denseQuantizedGradient, "mergeFrom:");
LABEL_44:
      v5 = v19;
    }
  }
  else if (v18)
  {
    -[AWDProactiveModelFittingLogRegGradient setDenseQuantizedGradient:](self, "setDenseQuantizedGradient:");
    goto LABEL_44;
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

- (AWDProactiveModelFittingSparseFloatVector)sparseFloatGradient
{
  return self->_sparseFloatGradient;
}

- (void)setSparseFloatGradient:(id)a3
{
  objc_storeStrong((id *)&self->_sparseFloatGradient, a3);
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

- (unint64_t)iteration
{
  return self->_iteration;
}

- (AWDProactiveModelFittingQuantizedSparseVector)sparseQuantizedGradient
{
  return self->_sparseQuantizedGradient;
}

- (void)setSparseQuantizedGradient:(id)a3
{
  objc_storeStrong((id *)&self->_sparseQuantizedGradient, a3);
}

- (float)gradientScaleFactor
{
  return self->_gradientScaleFactor;
}

- (float)gradientL2norm
{
  return self->_gradientL2norm;
}

- (AWDProactiveModelFittingQuantizedDenseVector)denseQuantizedGradient
{
  return self->_denseQuantizedGradient;
}

- (void)setDenseQuantizedGradient:(id)a3
{
  objc_storeStrong((id *)&self->_denseQuantizedGradient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sparseQuantizedGradient, 0);
  objc_storeStrong((id *)&self->_sparseFloatGradient, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_minibatchStats, 0);
  objc_storeStrong((id *)&self->_evaluationMetrics, 0);
  objc_storeStrong((id *)&self->_denseQuantizedGradient, 0);
}

@end
