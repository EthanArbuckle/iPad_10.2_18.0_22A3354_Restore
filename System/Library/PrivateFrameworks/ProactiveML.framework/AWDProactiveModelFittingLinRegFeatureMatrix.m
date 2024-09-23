@implementation AWDProactiveModelFittingLinRegFeatureMatrix

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

- (BOOL)hasSparseFloatFeatureMatrix
{
  return self->_sparseFloatFeatureMatrix != 0;
}

- (BOOL)hasMinibatchStats
{
  return self->_minibatchStats != 0;
}

- (BOOL)hasSparseQuantizedFeatureMatrix
{
  return self->_sparseQuantizedFeatureMatrix != 0;
}

- (void)setFeatureMatrixScaleFactor:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_featureMatrixScaleFactor = a3;
}

- (void)setHasFeatureMatrixScaleFactor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFeatureMatrixScaleFactor
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setFeatureMatrixL2norm:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_featureMatrixL2norm = a3;
}

- (void)setHasFeatureMatrixL2norm:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFeatureMatrixL2norm
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)AWDProactiveModelFittingLinRegFeatureMatrix;
  -[AWDProactiveModelFittingLinRegFeatureMatrix description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingLinRegFeatureMatrix dictionaryRepresentation](self, "dictionaryRepresentation");
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
  AWDProactiveModelFittingSparseFloatMatrix *sparseFloatFeatureMatrix;
  void *v9;
  AWDProactiveModelFittingMinibatchStats *minibatchStats;
  void *v11;
  AWDProactiveModelFittingQuantizedSparseMatrix *sparseQuantizedFeatureMatrix;
  void *v13;
  char has;
  void *v15;
  void *v16;

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
  sparseFloatFeatureMatrix = self->_sparseFloatFeatureMatrix;
  if (sparseFloatFeatureMatrix)
  {
    -[AWDProactiveModelFittingSparseFloatMatrix dictionaryRepresentation](sparseFloatFeatureMatrix, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("sparseFloatFeatureMatrix"));

  }
  minibatchStats = self->_minibatchStats;
  if (minibatchStats)
  {
    -[AWDProactiveModelFittingMinibatchStats dictionaryRepresentation](minibatchStats, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("minibatchStats"));

  }
  sparseQuantizedFeatureMatrix = self->_sparseQuantizedFeatureMatrix;
  if (sparseQuantizedFeatureMatrix)
  {
    -[AWDProactiveModelFittingQuantizedSparseMatrix dictionaryRepresentation](sparseQuantizedFeatureMatrix, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("sparseQuantizedFeatureMatrix"));

  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)&v4 = self->_featureMatrixScaleFactor;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("featureMatrixScaleFactor"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&v4 = self->_featureMatrixL2norm;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("featureMatrixL2norm"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingLinRegFeatureMatrixReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_modelInfo)
    PBDataWriterWriteSubmessage();
  if (self->_sparseFloatFeatureMatrix)
    PBDataWriterWriteSubmessage();
  if (self->_minibatchStats)
    PBDataWriterWriteSubmessage();
  if (self->_sparseQuantizedFeatureMatrix)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteFloatField();

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
    *((_BYTE *)v4 + 56) |= 1u;
  }
  v6 = v4;
  if (self->_modelInfo)
  {
    objc_msgSend(v4, "setModelInfo:");
    v4 = v6;
  }
  if (self->_sparseFloatFeatureMatrix)
  {
    objc_msgSend(v6, "setSparseFloatFeatureMatrix:");
    v4 = v6;
  }
  if (self->_minibatchStats)
  {
    objc_msgSend(v6, "setMinibatchStats:");
    v4 = v6;
  }
  if (self->_sparseQuantizedFeatureMatrix)
  {
    objc_msgSend(v6, "setSparseQuantizedFeatureMatrix:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 5) = LODWORD(self->_featureMatrixScaleFactor);
    *((_BYTE *)v4 + 56) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = LODWORD(self->_featureMatrixL2norm);
    *((_BYTE *)v4 + 56) |= 2u;
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
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v7 = -[AWDProactiveModelFittingModelInfo copyWithZone:](self->_modelInfo, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  v9 = -[AWDProactiveModelFittingSparseFloatMatrix copyWithZone:](self->_sparseFloatFeatureMatrix, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v9;

  v11 = -[AWDProactiveModelFittingMinibatchStats copyWithZone:](self->_minibatchStats, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v11;

  v13 = -[AWDProactiveModelFittingQuantizedSparseMatrix copyWithZone:](self->_sparseQuantizedFeatureMatrix, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v13;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)(v6 + 20) = self->_featureMatrixScaleFactor;
    *(_BYTE *)(v6 + 56) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)(v6 + 16) = self->_featureMatrixL2norm;
    *(_BYTE *)(v6 + 56) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  AWDProactiveModelFittingModelInfo *modelInfo;
  AWDProactiveModelFittingSparseFloatMatrix *sparseFloatFeatureMatrix;
  AWDProactiveModelFittingMinibatchStats *minibatchStats;
  AWDProactiveModelFittingQuantizedSparseMatrix *sparseQuantizedFeatureMatrix;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_24:
    v9 = 0;
    goto LABEL_25;
  }
  modelInfo = self->_modelInfo;
  if ((unint64_t)modelInfo | *((_QWORD *)v4 + 4)
    && !-[AWDProactiveModelFittingModelInfo isEqual:](modelInfo, "isEqual:"))
  {
    goto LABEL_24;
  }
  sparseFloatFeatureMatrix = self->_sparseFloatFeatureMatrix;
  if ((unint64_t)sparseFloatFeatureMatrix | *((_QWORD *)v4 + 5))
  {
    if (!-[AWDProactiveModelFittingSparseFloatMatrix isEqual:](sparseFloatFeatureMatrix, "isEqual:"))
      goto LABEL_24;
  }
  minibatchStats = self->_minibatchStats;
  if ((unint64_t)minibatchStats | *((_QWORD *)v4 + 3))
  {
    if (!-[AWDProactiveModelFittingMinibatchStats isEqual:](minibatchStats, "isEqual:"))
      goto LABEL_24;
  }
  sparseQuantizedFeatureMatrix = self->_sparseQuantizedFeatureMatrix;
  if ((unint64_t)sparseQuantizedFeatureMatrix | *((_QWORD *)v4 + 6))
  {
    if (!-[AWDProactiveModelFittingQuantizedSparseMatrix isEqual:](sparseQuantizedFeatureMatrix, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_featureMatrixScaleFactor != *((float *)v4 + 5))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_24;
  }
  v9 = (*((_BYTE *)v4 + 56) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_featureMatrixL2norm != *((float *)v4 + 4))
      goto LABEL_24;
    v9 = 1;
  }
LABEL_25:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char has;
  unint64_t v9;
  float featureMatrixScaleFactor;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float featureMatrixL2norm;
  double v16;
  long double v17;
  double v18;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[AWDProactiveModelFittingModelInfo hash](self->_modelInfo, "hash");
  v5 = -[AWDProactiveModelFittingSparseFloatMatrix hash](self->_sparseFloatFeatureMatrix, "hash");
  v6 = -[AWDProactiveModelFittingMinibatchStats hash](self->_minibatchStats, "hash");
  v7 = -[AWDProactiveModelFittingQuantizedSparseMatrix hash](self->_sparseQuantizedFeatureMatrix, "hash");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    featureMatrixScaleFactor = self->_featureMatrixScaleFactor;
    v11 = featureMatrixScaleFactor;
    if (featureMatrixScaleFactor < 0.0)
      v11 = -featureMatrixScaleFactor;
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
  if ((has & 2) != 0)
  {
    featureMatrixL2norm = self->_featureMatrixL2norm;
    v16 = featureMatrixL2norm;
    if (featureMatrixL2norm < 0.0)
      v16 = -featureMatrixL2norm;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  AWDProactiveModelFittingModelInfo *modelInfo;
  uint64_t v7;
  AWDProactiveModelFittingSparseFloatMatrix *sparseFloatFeatureMatrix;
  uint64_t v9;
  AWDProactiveModelFittingMinibatchStats *minibatchStats;
  uint64_t v11;
  AWDProactiveModelFittingQuantizedSparseMatrix *sparseQuantizedFeatureMatrix;
  uint64_t v13;
  char v14;
  id v15;

  v4 = a3;
  v5 = v4;
  if ((v4[7] & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  modelInfo = self->_modelInfo;
  v7 = *((_QWORD *)v5 + 4);
  v15 = v5;
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
    -[AWDProactiveModelFittingLinRegFeatureMatrix setModelInfo:](self, "setModelInfo:");
  }
  v5 = v15;
LABEL_9:
  sparseFloatFeatureMatrix = self->_sparseFloatFeatureMatrix;
  v9 = *((_QWORD *)v5 + 5);
  if (sparseFloatFeatureMatrix)
  {
    if (!v9)
      goto LABEL_15;
    -[AWDProactiveModelFittingSparseFloatMatrix mergeFrom:](sparseFloatFeatureMatrix, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[AWDProactiveModelFittingLinRegFeatureMatrix setSparseFloatFeatureMatrix:](self, "setSparseFloatFeatureMatrix:");
  }
  v5 = v15;
LABEL_15:
  minibatchStats = self->_minibatchStats;
  v11 = *((_QWORD *)v5 + 3);
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
    -[AWDProactiveModelFittingLinRegFeatureMatrix setMinibatchStats:](self, "setMinibatchStats:");
  }
  v5 = v15;
LABEL_21:
  sparseQuantizedFeatureMatrix = self->_sparseQuantizedFeatureMatrix;
  v13 = *((_QWORD *)v5 + 6);
  if (sparseQuantizedFeatureMatrix)
  {
    if (!v13)
      goto LABEL_27;
    -[AWDProactiveModelFittingQuantizedSparseMatrix mergeFrom:](sparseQuantizedFeatureMatrix, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_27;
    -[AWDProactiveModelFittingLinRegFeatureMatrix setSparseQuantizedFeatureMatrix:](self, "setSparseQuantizedFeatureMatrix:");
  }
  v5 = v15;
LABEL_27:
  v14 = *((_BYTE *)v5 + 56);
  if ((v14 & 4) != 0)
  {
    self->_featureMatrixScaleFactor = *((float *)v5 + 5);
    *(_BYTE *)&self->_has |= 4u;
    v14 = *((_BYTE *)v5 + 56);
  }
  if ((v14 & 2) != 0)
  {
    self->_featureMatrixL2norm = *((float *)v5 + 4);
    *(_BYTE *)&self->_has |= 2u;
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

- (AWDProactiveModelFittingSparseFloatMatrix)sparseFloatFeatureMatrix
{
  return self->_sparseFloatFeatureMatrix;
}

- (void)setSparseFloatFeatureMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_sparseFloatFeatureMatrix, a3);
}

- (AWDProactiveModelFittingMinibatchStats)minibatchStats
{
  return self->_minibatchStats;
}

- (void)setMinibatchStats:(id)a3
{
  objc_storeStrong((id *)&self->_minibatchStats, a3);
}

- (AWDProactiveModelFittingQuantizedSparseMatrix)sparseQuantizedFeatureMatrix
{
  return self->_sparseQuantizedFeatureMatrix;
}

- (void)setSparseQuantizedFeatureMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_sparseQuantizedFeatureMatrix, a3);
}

- (float)featureMatrixScaleFactor
{
  return self->_featureMatrixScaleFactor;
}

- (float)featureMatrixL2norm
{
  return self->_featureMatrixL2norm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sparseQuantizedFeatureMatrix, 0);
  objc_storeStrong((id *)&self->_sparseFloatFeatureMatrix, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_minibatchStats, 0);
}

- (BOOL)hasFeatureMatrix
{
  return -[AWDProactiveModelFittingLinRegFeatureMatrix hasSparseFloatFeatureMatrix](self, "hasSparseFloatFeatureMatrix")
      || -[AWDProactiveModelFittingLinRegFeatureMatrix hasSparseQuantizedFeatureMatrix](self, "hasSparseQuantizedFeatureMatrix");
}

- (float)featureMatrixValueAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  void *v7;
  float v8;
  float v9;

  if (-[AWDProactiveModelFittingLinRegFeatureMatrix hasSparseFloatFeatureMatrix](self, "hasSparseFloatFeatureMatrix"))
  {
    -[AWDProactiveModelFittingLinRegFeatureMatrix sparseFloatFeatureMatrix](self, "sparseFloatFeatureMatrix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueAtRow:column:", a3, a4);
LABEL_5:
    v9 = v8;

    return v9;
  }
  v9 = 0.0;
  if (-[AWDProactiveModelFittingLinRegFeatureMatrix hasSparseQuantizedFeatureMatrix](self, "hasSparseQuantizedFeatureMatrix"))
  {
    -[AWDProactiveModelFittingLinRegFeatureMatrix sparseQuantizedFeatureMatrix](self, "sparseQuantizedFeatureMatrix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "originalValueAtRow:column:", a3, a4);
    goto LABEL_5;
  }
  return v9;
}

@end
