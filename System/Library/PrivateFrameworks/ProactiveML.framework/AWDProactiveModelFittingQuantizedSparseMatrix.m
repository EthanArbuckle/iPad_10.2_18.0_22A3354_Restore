@implementation AWDProactiveModelFittingQuantizedSparseMatrix

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveModelFittingQuantizedSparseMatrix;
  -[AWDProactiveModelFittingQuantizedSparseMatrix dealloc](&v3, sel_dealloc);
}

- (unint64_t)columnIndicesCount
{
  return self->_columnIndices.count;
}

- (unsigned)columnIndices
{
  return self->_columnIndices.list;
}

- (void)clearColumnIndices
{
  PBRepeatedUInt32Clear();
}

- (void)addColumnIndices:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)columnIndicesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_columnIndices;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_columnIndices = &self->_columnIndices;
  count = self->_columnIndices.count;
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
  return p_columnIndices->list[a3];
}

- (void)setColumnIndices:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setColumnLength:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_columnLength = a3;
}

- (void)setHasColumnLength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasColumnLength
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)rowIndicesCount
{
  return self->_rowIndices.count;
}

- (unsigned)rowIndices
{
  return self->_rowIndices.list;
}

- (void)clearRowIndices
{
  PBRepeatedUInt32Clear();
}

- (void)addRowIndices:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)rowIndicesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rowIndices;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_rowIndices = &self->_rowIndices;
  count = self->_rowIndices.count;
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
  return p_rowIndices->list[a3];
}

- (void)setRowIndices:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setRowLength:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_rowLength = a3;
}

- (void)setHasRowLength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRowLength
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)AWDProactiveModelFittingQuantizedSparseMatrix;
  -[AWDProactiveModelFittingQuantizedSparseMatrix description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingQuantizedSparseMatrix dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  void *v7;
  void *v8;
  double v9;
  char has;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedUInt32NSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("columnIndices"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_columnLength);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("columnLength"));

  }
  PBRepeatedUInt32NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("rowIndices"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rowLength);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("rowLength"));

  }
  PBRepeatedUInt32NSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("values"));

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)&v9 = self->_minValue;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("minValue"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(float *)&v9 = self->_bucketSize;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("bucketSize"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingQuantizedSparseMatrixReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char has;

  v4 = a3;
  if (self->_columnIndices.count)
  {
    PBDataWriterPlaceMark();
    if (self->_columnIndices.count)
    {
      v5 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v5;
      }
      while (v5 < self->_columnIndices.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_rowIndices.count)
  {
    PBDataWriterPlaceMark();
    if (self->_rowIndices.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_rowIndices.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_values.count)
  {
    PBDataWriterPlaceMark();
    if (self->_values.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_values.count);
    }
    PBDataWriterRecallMark();
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  unint64_t v10;
  unint64_t v11;
  uint64_t k;
  char has;
  id v14;

  v14 = a3;
  if (-[AWDProactiveModelFittingQuantizedSparseMatrix columnIndicesCount](self, "columnIndicesCount"))
  {
    objc_msgSend(v14, "clearColumnIndices");
    v4 = -[AWDProactiveModelFittingQuantizedSparseMatrix columnIndicesCount](self, "columnIndicesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v14, "addColumnIndices:", -[AWDProactiveModelFittingQuantizedSparseMatrix columnIndicesAtIndex:](self, "columnIndicesAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v14 + 21) = self->_columnLength;
    *((_BYTE *)v14 + 96) |= 2u;
  }
  if (-[AWDProactiveModelFittingQuantizedSparseMatrix rowIndicesCount](self, "rowIndicesCount"))
  {
    objc_msgSend(v14, "clearRowIndices");
    v7 = -[AWDProactiveModelFittingQuantizedSparseMatrix rowIndicesCount](self, "rowIndicesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v14, "addRowIndices:", -[AWDProactiveModelFittingQuantizedSparseMatrix rowIndicesAtIndex:](self, "rowIndicesAtIndex:", j));
    }
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v14 + 23) = self->_rowLength;
    *((_BYTE *)v14 + 96) |= 8u;
  }
  if (-[AWDProactiveModelFittingQuantizedSparseMatrix valuesCount](self, "valuesCount"))
  {
    objc_msgSend(v14, "clearValues");
    v10 = -[AWDProactiveModelFittingQuantizedSparseMatrix valuesCount](self, "valuesCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
        objc_msgSend(v14, "addValues:", -[AWDProactiveModelFittingQuantizedSparseMatrix valuesAtIndex:](self, "valuesAtIndex:", k));
    }
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v14 + 22) = LODWORD(self->_minValue);
    *((_BYTE *)v14 + 96) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v14 + 20) = LODWORD(self->_bucketSize);
    *((_BYTE *)v14 + 96) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v4 + 84) = self->_columnLength;
    *(_BYTE *)(v4 + 96) |= 2u;
  }
  PBRepeatedUInt32Copy();
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v4 + 92) = self->_rowLength;
    *(_BYTE *)(v4 + 96) |= 8u;
  }
  PBRepeatedUInt32Copy();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)(v4 + 88) = self->_minValue;
    *(_BYTE *)(v4 + 96) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(float *)(v4 + 80) = self->_bucketSize;
    *(_BYTE *)(v4 + 96) |= 1u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || !PBRepeatedUInt32IsEqual())
    goto LABEL_24;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_columnLength != *((_DWORD *)v4 + 21))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    goto LABEL_24;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_24;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 8) == 0 || self->_rowLength != *((_DWORD *)v4 + 23))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 96) & 8) != 0)
  {
    goto LABEL_24;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_24:
    v5 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 4) == 0 || self->_minValue != *((float *)v4 + 22))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
    goto LABEL_24;
  }
  v5 = (*((_BYTE *)v4 + 96) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_bucketSize != *((float *)v4 + 20))
      goto LABEL_24;
    v5 = 1;
  }
LABEL_25:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char has;
  unint64_t v9;
  float minValue;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float bucketSize;
  double v16;
  long double v17;
  double v18;

  v3 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_columnLength;
  else
    v4 = 0;
  v5 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v6 = 2654435761 * self->_rowLength;
  else
    v6 = 0;
  v7 = PBRepeatedUInt32Hash();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    minValue = self->_minValue;
    v11 = minValue;
    if (minValue < 0.0)
      v11 = -minValue;
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
  if ((has & 1) != 0)
  {
    bucketSize = self->_bucketSize;
    v16 = bucketSize;
    if (bucketSize < 0.0)
      v16 = -bucketSize;
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
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  uint64_t v11;
  uint64_t k;
  char v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "columnIndicesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[AWDProactiveModelFittingQuantizedSparseMatrix addColumnIndices:](self, "addColumnIndices:", objc_msgSend(v14, "columnIndicesAtIndex:", i));
  }
  if ((*((_BYTE *)v14 + 96) & 2) != 0)
  {
    self->_columnLength = *((_DWORD *)v14 + 21);
    *(_BYTE *)&self->_has |= 2u;
  }
  v7 = objc_msgSend(v14, "rowIndicesCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
      -[AWDProactiveModelFittingQuantizedSparseMatrix addRowIndices:](self, "addRowIndices:", objc_msgSend(v14, "rowIndicesAtIndex:", j));
  }
  if ((*((_BYTE *)v14 + 96) & 8) != 0)
  {
    self->_rowLength = *((_DWORD *)v14 + 23);
    *(_BYTE *)&self->_has |= 8u;
  }
  v10 = objc_msgSend(v14, "valuesCount");
  if (v10)
  {
    v11 = v10;
    for (k = 0; k != v11; ++k)
      -[AWDProactiveModelFittingQuantizedSparseMatrix addValues:](self, "addValues:", objc_msgSend(v14, "valuesAtIndex:", k));
  }
  v13 = *((_BYTE *)v14 + 96);
  if ((v13 & 4) != 0)
  {
    self->_minValue = *((float *)v14 + 22);
    *(_BYTE *)&self->_has |= 4u;
    v13 = *((_BYTE *)v14 + 96);
  }
  if ((v13 & 1) != 0)
  {
    self->_bucketSize = *((float *)v14 + 20);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)columnLength
{
  return self->_columnLength;
}

- (unsigned)rowLength
{
  return self->_rowLength;
}

- (float)minValue
{
  return self->_minValue;
}

- (float)bucketSize
{
  return self->_bucketSize;
}

- (float)originalValueAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  float v7;
  uint64_t v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  float v14;

  v7 = 0.0;
  if (-[AWDProactiveModelFittingQuantizedSparseMatrix valuesCount](self, "valuesCount"))
  {
    v8 = 0;
    while (-[AWDProactiveModelFittingQuantizedSparseMatrix rowIndices](self, "rowIndices")[4 * v8] != a3
         || -[AWDProactiveModelFittingQuantizedSparseMatrix columnIndices](self, "columnIndices")[4 * v8] != a4)
    {
      if (++v8 >= -[AWDProactiveModelFittingQuantizedSparseMatrix valuesCount](self, "valuesCount"))
        return v7;
    }
    -[AWDProactiveModelFittingQuantizedSparseMatrix minValue](self, "minValue");
    v10 = v9;
    v11 = (float)-[AWDProactiveModelFittingQuantizedSparseMatrix values](self, "values")[4 * v8];
    -[AWDProactiveModelFittingQuantizedSparseMatrix bucketSize](self, "bucketSize");
    v13 = (float)(v10 + (float)(v11 * v12));
    -[AWDProactiveModelFittingQuantizedSparseMatrix bucketSize](self, "bucketSize");
    return v14 * 0.5 + v13;
  }
  return v7;
}

+ (id)quantizedSparseMatrixFromSparseMatrix:(id)a3 numberOfBuckets:(unint64_t)a4
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
  void *v18;
  _QWORD v19[4];
  id v20;
  float v21;
  float v22;

  v7 = a3;
  if ((unint64_t)objc_msgSend(v7, "numberOfRows") >> 32)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AWDProactiveModelFittingQuantizedSparseMatrix+PML.m"), 16, CFSTR("Too big matrix (rows: %tu)"), objc_msgSend(v7, "numberOfRows"));

  }
  if ((unint64_t)objc_msgSend(v7, "numberOfColumns") >> 32)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AWDProactiveModelFittingQuantizedSparseMatrix+PML.m"), 17, CFSTR("Too big matrix (cols: %tu)"), objc_msgSend(v7, "numberOfColumns"));

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "minValue");
  v10 = v9;
  objc_msgSend(v7, "maxValue");
  v19[1] = 3221225472;
  v19[0] = MEMORY[0x24BDAC760];
  v19[2] = __108__AWDProactiveModelFittingQuantizedSparseMatrix_PML__quantizedSparseMatrixFromSparseMatrix_numberOfBuckets___block_invoke;
  v19[3] = &unk_24D3DB748;
  v12 = (float)(v11 - v10) / (float)a4;
  v21 = v12;
  v22 = v10;
  v13 = v8;
  v20 = v13;
  objc_msgSend(v7, "enumerateNonZeroValuesWithBlock:", v19);
  *(float *)&v14 = v12;
  objc_msgSend(v13, "setBucketSize:", v14);
  *(float *)&v15 = v10;
  objc_msgSend(v13, "setMinValue:", v15);
  objc_msgSend(v13, "setColumnLength:", objc_msgSend(v7, "numberOfColumns"));
  objc_msgSend(v13, "setRowLength:", objc_msgSend(v7, "numberOfRows"));

  return v13;
}

uint64_t __108__AWDProactiveModelFittingQuantizedSparseMatrix_PML__quantizedSparseMatrixFromSparseMatrix_numberOfBuckets___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  uint64_t v4;
  float v7;

  v7 = *(float *)(a1 + 40);
  if (v7 == 0.0)
    v4 = 0;
  else
    LODWORD(v4) = vcvtms_u32_f32((float)(a4 - *(float *)(a1 + 44)) / v7);
  objc_msgSend(*(id *)(a1 + 32), "addRowIndices:", a2);
  objc_msgSend(*(id *)(a1 + 32), "addColumnIndices:", a3);
  return objc_msgSend(*(id *)(a1 + 32), "addValues:", v4);
}

@end
