@implementation AWDProactiveModelFittingSparseFloatMatrix

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveModelFittingSparseFloatMatrix;
  -[AWDProactiveModelFittingSparseFloatMatrix dealloc](&v3, sel_dealloc);
}

- (unint64_t)columnIndicesCount
{
  return self->_columnIndices.count;
}

- (unint64_t)columnIndices
{
  return self->_columnIndices.list;
}

- (void)clearColumnIndices
{
  PBRepeatedUInt64Clear();
}

- (void)addColumnIndices:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)columnIndicesAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_columnIndices;
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

- (void)setColumnIndices:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (void)setColumnLength:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_columnLength = a3;
}

- (void)setHasColumnLength:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasColumnLength
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)rowIndicesCount
{
  return self->_rowIndices.count;
}

- (unint64_t)rowIndices
{
  return self->_rowIndices.list;
}

- (void)clearRowIndices
{
  PBRepeatedUInt64Clear();
}

- (void)addRowIndices:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)rowIndicesAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_rowIndices;
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

- (void)setRowIndices:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (void)setRowLength:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_rowLength = a3;
}

- (void)setHasRowLength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRowLength
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)valuesCount
{
  return self->_values.count;
}

- (float)values
{
  return self->_values.list;
}

- (void)clearValues
{
  PBRepeatedFloatClear();
}

- (void)addValues:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)valuesAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_values;
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

- (void)setValues:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
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
  v8.super_class = (Class)AWDProactiveModelFittingSparseFloatMatrix;
  -[AWDProactiveModelFittingSparseFloatMatrix description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingSparseFloatMatrix dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedUInt64NSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("columnIndices"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_columnLength);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("columnLength"));

  }
  PBRepeatedUInt64NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("rowIndices"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_rowLength);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("rowLength"));

  }
  PBRepeatedFloatNSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("values"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingSparseFloatMatrixReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  $7401700F6E393C0442CED440453508D3 *p_values;
  unint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_columnIndices.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v9;
      ++v5;
    }
    while (v5 < self->_columnIndices.count);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v9;
  }
  if (self->_rowIndices.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v9;
      ++v6;
    }
    while (v6 < self->_rowIndices.count);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v9;
  }
  p_values = &self->_values;
  if (p_values->count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v4 = v9;
      ++v8;
    }
    while (v8 < p_values->count);
  }

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
  id v13;

  v13 = a3;
  if (-[AWDProactiveModelFittingSparseFloatMatrix columnIndicesCount](self, "columnIndicesCount"))
  {
    objc_msgSend(v13, "clearColumnIndices");
    v4 = -[AWDProactiveModelFittingSparseFloatMatrix columnIndicesCount](self, "columnIndicesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v13, "addColumnIndices:", -[AWDProactiveModelFittingSparseFloatMatrix columnIndicesAtIndex:](self, "columnIndicesAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v13 + 10) = self->_columnLength;
    *((_BYTE *)v13 + 96) |= 1u;
  }
  if (-[AWDProactiveModelFittingSparseFloatMatrix rowIndicesCount](self, "rowIndicesCount"))
  {
    objc_msgSend(v13, "clearRowIndices");
    v7 = -[AWDProactiveModelFittingSparseFloatMatrix rowIndicesCount](self, "rowIndicesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v13, "addRowIndices:", -[AWDProactiveModelFittingSparseFloatMatrix rowIndicesAtIndex:](self, "rowIndicesAtIndex:", j));
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v13 + 11) = self->_rowLength;
    *((_BYTE *)v13 + 96) |= 2u;
  }
  if (-[AWDProactiveModelFittingSparseFloatMatrix valuesCount](self, "valuesCount"))
  {
    objc_msgSend(v13, "clearValues");
    v10 = -[AWDProactiveModelFittingSparseFloatMatrix valuesCount](self, "valuesCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
      {
        -[AWDProactiveModelFittingSparseFloatMatrix valuesAtIndex:](self, "valuesAtIndex:", k);
        objc_msgSend(v13, "addValues:");
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt64Copy();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v4 + 80) = self->_columnLength;
    *(_BYTE *)(v4 + 96) |= 1u;
  }
  PBRepeatedUInt64Copy();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v4 + 88) = self->_rowLength;
    *(_BYTE *)(v4 + 96) |= 2u;
  }
  PBRepeatedFloatCopy();
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || !PBRepeatedUInt64IsEqual())
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_columnLength != *((_QWORD *)v4 + 10))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    goto LABEL_15;
  }
  if (!PBRepeatedUInt64IsEqual())
  {
LABEL_15:
    IsEqual = 0;
    goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_rowLength != *((_QWORD *)v4 + 11))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    goto LABEL_15;
  }
  IsEqual = PBRepeatedFloatIsEqual();
LABEL_16:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = PBRepeatedUInt64Hash();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761u * self->_columnLength;
  else
    v4 = 0;
  v5 = PBRepeatedUInt64Hash();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761u * self->_rowLength;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ PBRepeatedFloatHash();
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
  unint64_t *v13;

  v13 = (unint64_t *)a3;
  v4 = objc_msgSend(v13, "columnIndicesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[AWDProactiveModelFittingSparseFloatMatrix addColumnIndices:](self, "addColumnIndices:", objc_msgSend(v13, "columnIndicesAtIndex:", i));
  }
  if ((v13[12] & 1) != 0)
  {
    self->_columnLength = v13[10];
    *(_BYTE *)&self->_has |= 1u;
  }
  v7 = objc_msgSend(v13, "rowIndicesCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
      -[AWDProactiveModelFittingSparseFloatMatrix addRowIndices:](self, "addRowIndices:", objc_msgSend(v13, "rowIndicesAtIndex:", j));
  }
  if ((v13[12] & 2) != 0)
  {
    self->_rowLength = v13[11];
    *(_BYTE *)&self->_has |= 2u;
  }
  v10 = objc_msgSend(v13, "valuesCount");
  if (v10)
  {
    v11 = v10;
    for (k = 0; k != v11; ++k)
    {
      objc_msgSend(v13, "valuesAtIndex:", k);
      -[AWDProactiveModelFittingSparseFloatMatrix addValues:](self, "addValues:");
    }
  }

}

- (unint64_t)columnLength
{
  return self->_columnLength;
}

- (unint64_t)rowLength
{
  return self->_rowLength;
}

- (float)valueAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  float v7;
  uint64_t v8;

  v7 = 0.0;
  if (-[AWDProactiveModelFittingSparseFloatMatrix valuesCount](self, "valuesCount"))
  {
    v8 = 0;
    while (-[AWDProactiveModelFittingSparseFloatMatrix rowIndices](self, "rowIndices")[8 * v8] != a3
         || -[AWDProactiveModelFittingSparseFloatMatrix columnIndices](self, "columnIndices")[8 * v8] != a4)
    {
      if (++v8 >= -[AWDProactiveModelFittingSparseFloatMatrix valuesCount](self, "valuesCount"))
        return v7;
    }
    return -[AWDProactiveModelFittingSparseFloatMatrix values](self, "values")[4 * v8];
  }
  return v7;
}

+ (id)sparseFloatMatrixFromDenseMatrix:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setColumnLength:", objc_msgSend(v3, "numberOfColumns"));
  objc_msgSend(v4, "setRowLength:", objc_msgSend(v3, "numberOfRows"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__AWDProactiveModelFittingSparseFloatMatrix_PML__sparseFloatMatrixFromDenseMatrix___block_invoke;
  v7[3] = &unk_24D3DBA38;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateNonZeroValuesWithBlock:", v7);

  return v5;
}

+ (id)sparseFloatMatrixFromSparseMatrix:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setColumnLength:", objc_msgSend(v3, "numberOfColumns"));
  objc_msgSend(v4, "setRowLength:", objc_msgSend(v3, "numberOfRows"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__AWDProactiveModelFittingSparseFloatMatrix_PML__sparseFloatMatrixFromSparseMatrix___block_invoke;
  v7[3] = &unk_24D3DBA38;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateNonZeroValuesWithBlock:", v7);

  return v5;
}

uint64_t __84__AWDProactiveModelFittingSparseFloatMatrix_PML__sparseFloatMatrixFromSparseMatrix___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "addRowIndices:", a2);
  objc_msgSend(*(id *)(a1 + 32), "addColumnIndices:", a3);
  *(float *)&v7 = a4;
  return objc_msgSend(*(id *)(a1 + 32), "addValues:", v7);
}

uint64_t __83__AWDProactiveModelFittingSparseFloatMatrix_PML__sparseFloatMatrixFromDenseMatrix___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "addRowIndices:", a2);
  objc_msgSend(*(id *)(a1 + 32), "addColumnIndices:", a3);
  *(float *)&v7 = a4;
  return objc_msgSend(*(id *)(a1 + 32), "addValues:", v7);
}

@end
