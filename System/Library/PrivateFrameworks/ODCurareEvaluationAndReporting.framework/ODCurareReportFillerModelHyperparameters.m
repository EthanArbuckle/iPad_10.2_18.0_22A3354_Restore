@implementation ODCurareReportFillerModelHyperparameters

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)ODCurareReportFillerModelHyperparameters;
  -[ODCurareReportFillerModelHyperparameters dealloc](&v3, sel_dealloc);
}

- (unint64_t)hyperparameterIndicesCount
{
  return self->_hyperparameterIndices.count;
}

- (unsigned)hyperparameterIndices
{
  return self->_hyperparameterIndices.list;
}

- (void)clearHyperparameterIndices
{
  PBRepeatedUInt32Clear();
}

- (void)addHyperparameterIndices:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)hyperparameterIndicesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_hyperparameterIndices;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_hyperparameterIndices = &self->_hyperparameterIndices;
  count = self->_hyperparameterIndices.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_hyperparameterIndices->list[a3];
}

- (void)setHyperparameterIndices:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)hyperparameterValuesCount
{
  return self->_hyperparameterValues.count;
}

- (float)hyperparameterValues
{
  return self->_hyperparameterValues.list;
}

- (void)clearHyperparameterValues
{
  PBRepeatedFloatClear();
}

- (void)addHyperparameterValues:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)hyperparameterValuesAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_hyperparameterValues;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_hyperparameterValues = &self->_hyperparameterValues;
  count = self->_hyperparameterValues.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_hyperparameterValues->list[a3];
}

- (void)setHyperparameterValues:(float *)a3 count:(unint64_t)a4
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
  v8.super_class = (Class)ODCurareReportFillerModelHyperparameters;
  -[ODCurareReportFillerModelHyperparameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODCurareReportFillerModelHyperparameters dictionaryRepresentation](self, "dictionaryRepresentation");
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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_versionNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("versionNumber"));

  PBRepeatedUInt32NSArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("hyperparameterIndices"));

  PBRepeatedFloatNSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("hyperparameterValues"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerModelHyperparametersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  $7401700F6E393C0442CED440453508D3 *p_hyperparameterValues;
  unint64_t v6;
  id v7;

  v7 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hyperparameterIndices.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v4;
    }
    while (v4 < self->_hyperparameterIndices.count);
  }
  p_hyperparameterValues = &self->_hyperparameterValues;
  if (p_hyperparameterValues->count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v6;
    }
    while (v6 < p_hyperparameterValues->count);
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
  _DWORD *v10;

  v10 = a3;
  v10[14] = self->_versionNumber;
  if (-[ODCurareReportFillerModelHyperparameters hyperparameterIndicesCount](self, "hyperparameterIndicesCount"))
  {
    objc_msgSend(v10, "clearHyperparameterIndices");
    v4 = -[ODCurareReportFillerModelHyperparameters hyperparameterIndicesCount](self, "hyperparameterIndicesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v10, "addHyperparameterIndices:", -[ODCurareReportFillerModelHyperparameters hyperparameterIndicesAtIndex:](self, "hyperparameterIndicesAtIndex:", i));
    }
  }
  if (-[ODCurareReportFillerModelHyperparameters hyperparameterValuesCount](self, "hyperparameterValuesCount"))
  {
    objc_msgSend(v10, "clearHyperparameterValues");
    v7 = -[ODCurareReportFillerModelHyperparameters hyperparameterValuesCount](self, "hyperparameterValuesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[ODCurareReportFillerModelHyperparameters hyperparameterValuesAtIndex:](self, "hyperparameterValuesAtIndex:", j);
        objc_msgSend(v10, "addHyperparameterValues:");
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;

  v4 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[14] = self->_versionNumber;
  PBRepeatedUInt32Copy();
  PBRepeatedFloatCopy();
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_versionNumber == v4[14]
    && PBRepeatedUInt32IsEqual())
  {
    IsEqual = PBRepeatedFloatIsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  v2 = 2654435761 * self->_versionNumber;
  v3 = PBRepeatedUInt32Hash();
  return v2 ^ v3 ^ PBRepeatedFloatHash();
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  id v11;

  v4 = a3;
  self->_versionNumber = v4[14];
  v11 = v4;
  v5 = objc_msgSend(v4, "hyperparameterIndicesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[ODCurareReportFillerModelHyperparameters addHyperparameterIndices:](self, "addHyperparameterIndices:", objc_msgSend(v11, "hyperparameterIndicesAtIndex:", i));
  }
  v8 = objc_msgSend(v11, "hyperparameterValuesCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
    {
      objc_msgSend(v11, "hyperparameterValuesAtIndex:", j);
      -[ODCurareReportFillerModelHyperparameters addHyperparameterValues:](self, "addHyperparameterValues:");
    }
  }

}

- (unsigned)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(unsigned int)a3
{
  self->_versionNumber = a3;
}

@end
