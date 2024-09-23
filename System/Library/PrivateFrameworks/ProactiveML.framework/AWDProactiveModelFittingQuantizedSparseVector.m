@implementation AWDProactiveModelFittingQuantizedSparseVector

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveModelFittingQuantizedSparseVector;
  -[AWDProactiveModelFittingQuantizedSparseVector dealloc](&v3, sel_dealloc);
}

- (unint64_t)indicesCount
{
  return self->_indices.count;
}

- (unsigned)indices
{
  return self->_indices.list;
}

- (void)clearIndices
{
  PBRepeatedUInt32Clear();
}

- (void)addIndices:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)indicesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_indices;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_indices = &self->_indices;
  count = self->_indices.count;
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
  return p_indices->list[a3];
}

- (void)setIndices:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)valuesCount
{
  return self->_values.count;
}

- (unsigned)values
{
  return self->_values.list;
}

- (void)clearValues
{
  PBRepeatedUInt32Clear();
}

- (void)addValues:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)valuesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_values;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_values = &self->_values;
  count = self->_values.count;
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
  return p_values->list[a3];
}

- (void)setValues:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setLength:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_length = a3;
}

- (void)setHasLength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLength
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMinValue:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_minValue = a3;
}

- (void)setHasMinValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinValue
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setBucketSize:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bucketSize = a3;
}

- (void)setHasBucketSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBucketSize
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)AWDProactiveModelFittingQuantizedSparseVector;
  -[AWDProactiveModelFittingQuantizedSparseVector description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingQuantizedSparseVector dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  char has;
  void *v8;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedUInt32NSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("indices"));

  PBRepeatedUInt32NSArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("values"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(float *)&v6 = self->_minValue;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("minValue"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("length"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(float *)&v6 = self->_bucketSize;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("bucketSize"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingQuantizedSparseVectorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  char has;

  v4 = a3;
  if (self->_indices.count)
  {
    PBDataWriterPlaceMark();
    if (self->_indices.count)
    {
      v5 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v5;
      }
      while (v5 < self->_indices.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_values.count)
  {
    PBDataWriterPlaceMark();
    if (self->_values.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_values.count);
    }
    PBDataWriterRecallMark();
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_13;
LABEL_17:
    PBDataWriterWriteFloatField();
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_17;
LABEL_13:
  if ((has & 1) != 0)
LABEL_14:
    PBDataWriterWriteFloatField();
LABEL_15:

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  char has;
  id v11;

  v11 = a3;
  if (-[AWDProactiveModelFittingQuantizedSparseVector indicesCount](self, "indicesCount"))
  {
    objc_msgSend(v11, "clearIndices");
    v4 = -[AWDProactiveModelFittingQuantizedSparseVector indicesCount](self, "indicesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v11, "addIndices:", -[AWDProactiveModelFittingQuantizedSparseVector indicesAtIndex:](self, "indicesAtIndex:", i));
    }
  }
  if (-[AWDProactiveModelFittingQuantizedSparseVector valuesCount](self, "valuesCount"))
  {
    objc_msgSend(v11, "clearValues");
    v7 = -[AWDProactiveModelFittingQuantizedSparseVector valuesCount](self, "valuesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v11, "addValues:", -[AWDProactiveModelFittingQuantizedSparseVector valuesAtIndex:](self, "valuesAtIndex:", j));
    }
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_11;
LABEL_15:
    *((_DWORD *)v11 + 16) = LODWORD(self->_minValue);
    *((_BYTE *)v11 + 68) |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  *((_DWORD *)v11 + 15) = self->_length;
  *((_BYTE *)v11 + 68) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_15;
LABEL_11:
  if ((has & 1) != 0)
  {
LABEL_12:
    *((_DWORD *)v11 + 14) = LODWORD(self->_bucketSize);
    *((_BYTE *)v11 + 68) |= 1u;
  }
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(float *)(v4 + 64) = self->_minValue;
    *(_BYTE *)(v4 + 68) |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v4;
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 60) = self->_length;
  *(_BYTE *)(v4 + 68) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(float *)(v4 + 56) = self->_bucketSize;
    *(_BYTE *)(v4 + 68) |= 1u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_length != *((_DWORD *)v4 + 15))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
LABEL_18:
    v5 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_minValue != *((float *)v4 + 16))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_18;
  }
  v5 = (*((_BYTE *)v4 + 68) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_bucketSize != *((float *)v4 + 14))
      goto LABEL_18;
    v5 = 1;
  }
LABEL_19:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  char has;
  uint64_t v6;
  float minValue;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  float bucketSize;
  double v14;
  long double v15;
  double v16;

  v3 = PBRepeatedUInt32Hash();
  v4 = PBRepeatedUInt32Hash();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v6 = 2654435761 * self->_length;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_8:
    v11 = 0;
    goto LABEL_11;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_3:
  minValue = self->_minValue;
  v8 = minValue;
  if (minValue < 0.0)
    v8 = -minValue;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_11:
  if ((has & 1) != 0)
  {
    bucketSize = self->_bucketSize;
    v14 = bucketSize;
    if (bucketSize < 0.0)
      v14 = -bucketSize;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  char v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "indicesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[AWDProactiveModelFittingQuantizedSparseVector addIndices:](self, "addIndices:", objc_msgSend(v11, "indicesAtIndex:", i));
  }
  v7 = objc_msgSend(v11, "valuesCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
      -[AWDProactiveModelFittingQuantizedSparseVector addValues:](self, "addValues:", objc_msgSend(v11, "valuesAtIndex:", j));
  }
  v10 = *((_BYTE *)v11 + 68);
  if ((v10 & 2) == 0)
  {
    if ((*((_BYTE *)v11 + 68) & 4) == 0)
      goto LABEL_9;
LABEL_13:
    self->_minValue = *((float *)v11 + 16);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v11 + 68) & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  self->_length = *((_DWORD *)v11 + 15);
  *(_BYTE *)&self->_has |= 2u;
  v10 = *((_BYTE *)v11 + 68);
  if ((v10 & 4) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v10 & 1) != 0)
  {
LABEL_10:
    self->_bucketSize = *((float *)v11 + 14);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_11:

}

- (unsigned)length
{
  return self->_length;
}

- (float)minValue
{
  return self->_minValue;
}

- (float)bucketSize
{
  return self->_bucketSize;
}

- (float)originalValueAtIndex:(unint64_t)a3
{
  float v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  double v11;
  float v12;

  v5 = 0.0;
  if (-[AWDProactiveModelFittingQuantizedSparseVector valuesCount](self, "valuesCount"))
  {
    v6 = 0;
    while (-[AWDProactiveModelFittingQuantizedSparseVector indices](self, "indices")[4 * v6] != a3)
    {
      if (++v6 >= -[AWDProactiveModelFittingQuantizedSparseVector valuesCount](self, "valuesCount"))
        return v5;
    }
    -[AWDProactiveModelFittingQuantizedSparseVector minValue](self, "minValue");
    v8 = v7;
    v9 = (float)-[AWDProactiveModelFittingQuantizedSparseVector values](self, "values")[4 * v6];
    -[AWDProactiveModelFittingQuantizedSparseVector bucketSize](self, "bucketSize");
    v11 = (float)(v8 + (float)(v9 * v10));
    -[AWDProactiveModelFittingQuantizedSparseVector bucketSize](self, "bucketSize");
    return v12 * 0.5 + v11;
  }
  return v5;
}

+ (id)quantizedSparseVectorFromDenseVector:(id)a3 numberOfBuckets:(unint64_t)a4
{
  void *v6;
  void *v7;

  +[PMLSparseVector sparseVectorFromDense:](PMLSparseVector, "sparseVectorFromDense:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "quantizedSparseVectorFromSparseVector:numberOfBuckets:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)quantizedSparseVectorFromSparseVector:(id)a3 numberOfBuckets:(unint64_t)a4
{
  id v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  id v13;
  double v14;
  double v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  float v20;
  float v21;

  v7 = a3;
  if ((unint64_t)objc_msgSend(v7, "length") >> 32)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AWDProactiveModelFittingQuantizedSparseVector+PML.m"), 23, CFSTR("Too big vector (length: %tu)"), objc_msgSend(v7, "length"));

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "minValue");
  v10 = v9;
  objc_msgSend(v7, "maxValue");
  v18[1] = 3221225472;
  v18[0] = MEMORY[0x24BDAC760];
  v18[2] = __108__AWDProactiveModelFittingQuantizedSparseVector_PML__quantizedSparseVectorFromSparseVector_numberOfBuckets___block_invoke;
  v18[3] = &unk_24D3DBCF0;
  v12 = (float)(v11 - v10) / (float)a4;
  v20 = v12;
  v21 = v10;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v7, "enumerateNonZeroValuesWithBlock:", v18);
  *(float *)&v14 = v12;
  objc_msgSend(v13, "setBucketSize:", v14);
  *(float *)&v15 = v10;
  objc_msgSend(v13, "setMinValue:", v15);
  objc_msgSend(v13, "setLength:", objc_msgSend(v7, "length"));

  return v13;
}

uint64_t __108__AWDProactiveModelFittingQuantizedSparseVector_PML__quantizedSparseVectorFromSparseVector_numberOfBuckets___block_invoke(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v3;
  float v5;

  v5 = *(float *)(a1 + 40);
  if (v5 == 0.0)
    v3 = 0;
  else
    LODWORD(v3) = vcvtms_u32_f32((float)(a3 - *(float *)(a1 + 44)) / v5);
  objc_msgSend(*(id *)(a1 + 32), "addIndices:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "addValues:", v3);
}

@end
