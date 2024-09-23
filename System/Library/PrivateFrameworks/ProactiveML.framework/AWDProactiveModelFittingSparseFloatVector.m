@implementation AWDProactiveModelFittingSparseFloatVector

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveModelFittingSparseFloatVector;
  -[AWDProactiveModelFittingSparseFloatVector dealloc](&v3, sel_dealloc);
}

- (unint64_t)indicesCount
{
  return self->_indices.count;
}

- (unint64_t)indices
{
  return self->_indices.list;
}

- (void)clearIndices
{
  PBRepeatedUInt64Clear();
}

- (void)addIndices:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)indicesAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_indices;
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

- (void)setIndices:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
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

- (void)setLength:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_length = a3;
}

- (void)setHasLength:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLength
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
  v8.super_class = (Class)AWDProactiveModelFittingSparseFloatVector;
  -[AWDProactiveModelFittingSparseFloatVector description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingSparseFloatVector dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedUInt64NSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("indices"));

  PBRepeatedFloatNSArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("values"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_length);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("length"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingSparseFloatVectorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_indices.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v7;
      ++v5;
    }
    while (v5 < self->_indices.count);
  }
  if (self->_values.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v4 = v7;
      ++v6;
    }
    while (v6 < self->_values.count);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v7;
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
  id v10;

  v10 = a3;
  if (-[AWDProactiveModelFittingSparseFloatVector indicesCount](self, "indicesCount"))
  {
    objc_msgSend(v10, "clearIndices");
    v4 = -[AWDProactiveModelFittingSparseFloatVector indicesCount](self, "indicesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v10, "addIndices:", -[AWDProactiveModelFittingSparseFloatVector indicesAtIndex:](self, "indicesAtIndex:", i));
    }
  }
  if (-[AWDProactiveModelFittingSparseFloatVector valuesCount](self, "valuesCount"))
  {
    objc_msgSend(v10, "clearValues");
    v7 = -[AWDProactiveModelFittingSparseFloatVector valuesCount](self, "valuesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[AWDProactiveModelFittingSparseFloatVector valuesAtIndex:](self, "valuesAtIndex:", j);
        objc_msgSend(v10, "addValues:");
      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v10 + 7) = self->_length;
    *((_BYTE *)v10 + 64) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt64Copy();
  PBRepeatedFloatCopy();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v4 + 56) = self->_length;
    *(_BYTE *)(v4 + 64) |= 1u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || !PBRepeatedUInt64IsEqual()
    || !PBRepeatedFloatIsEqual())
  {
    goto LABEL_8;
  }
  v5 = (*((_BYTE *)v4 + 64) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) != 0 && self->_length == *((_QWORD *)v4 + 7))
    {
      v5 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v5 = 0;
  }
LABEL_9:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = PBRepeatedUInt64Hash();
  v4 = PBRepeatedFloatHash();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_length;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  unint64_t *v10;

  v10 = (unint64_t *)a3;
  v4 = objc_msgSend(v10, "indicesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[AWDProactiveModelFittingSparseFloatVector addIndices:](self, "addIndices:", objc_msgSend(v10, "indicesAtIndex:", i));
  }
  v7 = objc_msgSend(v10, "valuesCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
    {
      objc_msgSend(v10, "valuesAtIndex:", j);
      -[AWDProactiveModelFittingSparseFloatVector addValues:](self, "addValues:");
    }
  }
  if ((v10[8] & 1) != 0)
  {
    self->_length = v10[7];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unint64_t)length
{
  return self->_length;
}

- (float)valueAtIndex:(unint64_t)a3
{
  float v5;
  uint64_t v6;

  v5 = 0.0;
  if (-[AWDProactiveModelFittingSparseFloatVector valuesCount](self, "valuesCount"))
  {
    v6 = 0;
    while (-[AWDProactiveModelFittingSparseFloatVector indices](self, "indices")[8 * v6] != a3)
    {
      if (++v6 >= -[AWDProactiveModelFittingSparseFloatVector valuesCount](self, "valuesCount"))
        return v5;
    }
    return -[AWDProactiveModelFittingSparseFloatVector values](self, "values")[4 * v6];
  }
  return v5;
}

+ (id)sparseFloatVectorFromModelWeights:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  float v7;
  double v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setLength:", (int)objc_msgSend(v3, "length"));
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    do
    {
      v6 = objc_retainAutorelease(v3);
      v7 = *(float *)(objc_msgSend(v6, "values") + 4 * v5);
      if (v7 != 0.0)
      {
        objc_msgSend(v4, "addIndices:", v5);
        *(float *)&v8 = v7;
        objc_msgSend(v4, "addValues:", v8);
      }
      ++v5;
    }
    while (v5 < (int)objc_msgSend(v6, "length"));
  }

  return v4;
}

+ (id)sparseFloatVectorFromSparseVector:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setLength:", objc_msgSend(v3, "length"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__AWDProactiveModelFittingSparseFloatVector_PML__sparseFloatVectorFromSparseVector___block_invoke;
  v7[3] = &unk_24D3DB888;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateNonZeroValuesWithBlock:", v7);

  return v5;
}

uint64_t __84__AWDProactiveModelFittingSparseFloatVector_PML__sparseFloatVectorFromSparseVector___block_invoke(uint64_t a1, uint64_t a2, float a3)
{
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "addIndices:", a2);
  *(float *)&v5 = a3;
  return objc_msgSend(*(id *)(a1 + 32), "addValues:", v5);
}

@end
