@implementation AWDProactiveModelFittingQuantizedDenseVector

- (float)originalValueAtIndex:(unint64_t)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  double v9;
  float v10;

  -[AWDProactiveModelFittingQuantizedDenseVector minValue](self, "minValue");
  v6 = v5;
  v7 = (float)-[AWDProactiveModelFittingQuantizedDenseVector values](self, "values")[4 * a3];
  -[AWDProactiveModelFittingQuantizedDenseVector bucketSize](self, "bucketSize");
  v9 = (float)(v6 + (float)(v7 * v8));
  -[AWDProactiveModelFittingQuantizedDenseVector bucketSize](self, "bucketSize");
  return v10 * 0.5 + v9;
}

+ (id)quantizedDenseVectorFromDenseVector:(id)a3 numberOfBuckets:(unint64_t)a4
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
  if ((unint64_t)objc_msgSend(v7, "count") >> 32)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AWDProactiveModelFittingQuantizedDenseVector+PML.m"), 17, CFSTR("Too big vector (length: %tu)"), objc_msgSend(v7, "count"));

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "minValue");
  v10 = v9;
  objc_msgSend(v7, "maxValue");
  v18[1] = 3221225472;
  v18[0] = MEMORY[0x24BDAC760];
  v18[2] = __105__AWDProactiveModelFittingQuantizedDenseVector_PML__quantizedDenseVectorFromDenseVector_numberOfBuckets___block_invoke;
  v18[3] = &unk_24D3DBCF0;
  v12 = (float)(v11 - v10) / (float)a4;
  v20 = v12;
  v21 = v10;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v7, "enumerateValuesWithBlock:", v18);
  *(float *)&v14 = v12;
  objc_msgSend(v13, "setBucketSize:", v14);
  *(float *)&v15 = v10;
  objc_msgSend(v13, "setMinValue:", v15);

  return v13;
}

uint64_t __105__AWDProactiveModelFittingQuantizedDenseVector_PML__quantizedDenseVectorFromDenseVector_numberOfBuckets___block_invoke(uint64_t a1, float a2, uint64_t a3, uint64_t a4)
{
  float v4;

  v4 = *(float *)(a1 + 40);
  if (v4 == 0.0)
    a4 = 0;
  else
    LODWORD(a4) = vcvtms_u32_f32((float)(a2 - *(float *)(a1 + 44)) / v4);
  return objc_msgSend(*(id *)(a1 + 32), "addValues:", a4);
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDProactiveModelFittingQuantizedDenseVector;
  -[AWDProactiveModelFittingQuantizedDenseVector dealloc](&v3, sel_dealloc);
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
  *(_BYTE *)&self->_has |= 2u;
  self->_minValue = a3;
}

- (void)setHasMinValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)AWDProactiveModelFittingQuantizedDenseVector;
  -[AWDProactiveModelFittingQuantizedDenseVector description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingQuantizedDenseVector dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  double v5;
  char has;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedUInt32NSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("values"));

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&v5 = self->_minValue;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("minValue"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(float *)&v5 = self->_bucketSize;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("bucketSize"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingQuantizedDenseVectorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  char has;

  v4 = a3;
  if (self->_values.count)
  {
    PBDataWriterPlaceMark();
    if (self->_values.count)
    {
      v5 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v5;
      }
      while (v5 < self->_values.count);
    }
    PBDataWriterRecallMark();
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
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
  char has;
  id v8;

  v8 = a3;
  if (-[AWDProactiveModelFittingQuantizedDenseVector valuesCount](self, "valuesCount"))
  {
    objc_msgSend(v8, "clearValues");
    v4 = -[AWDProactiveModelFittingQuantizedDenseVector valuesCount](self, "valuesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v8, "addValues:", -[AWDProactiveModelFittingQuantizedDenseVector valuesAtIndex:](self, "valuesAtIndex:", i));
    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v8 + 9) = LODWORD(self->_minValue);
    *((_BYTE *)v8 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v8 + 8) = LODWORD(self->_bucketSize);
    *((_BYTE *)v8 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)(v4 + 36) = self->_minValue;
    *(_BYTE *)(v4 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(float *)(v4 + 32) = self->_bucketSize;
    *(_BYTE *)(v4 + 40) |= 1u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || !PBRepeatedUInt32IsEqual())
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_minValue != *((float *)v4 + 9))
      goto LABEL_12;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  v5 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_bucketSize != *((float *)v4 + 8))
      goto LABEL_12;
    v5 = 1;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  char has;
  unint64_t v5;
  float minValue;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  float bucketSize;
  double v12;
  long double v13;
  double v14;

  v3 = PBRepeatedUInt32Hash();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    minValue = self->_minValue;
    v7 = minValue;
    if (minValue < 0.0)
      v7 = -minValue;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 1) != 0)
  {
    bucketSize = self->_bucketSize;
    v12 = bucketSize;
    if (bucketSize < 0.0)
      v12 = -bucketSize;
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
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  char v7;
  float *v8;

  v8 = (float *)a3;
  v4 = objc_msgSend(v8, "valuesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[AWDProactiveModelFittingQuantizedDenseVector addValues:](self, "addValues:", objc_msgSend(v8, "valuesAtIndex:", i));
  }
  v7 = *((_BYTE *)v8 + 40);
  if ((v7 & 2) != 0)
  {
    self->_minValue = v8[9];
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v8 + 40);
  }
  if ((v7 & 1) != 0)
  {
    self->_bucketSize = v8[8];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (float)minValue
{
  return self->_minValue;
}

- (float)bucketSize
{
  return self->_bucketSize;
}

@end
