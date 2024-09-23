@implementation EDReference

+ (EDReference)referenceWithFirstRow:(int)a3 lastRow:(int)a4 firstColumn:(int)a5 lastColumn:(int)a6
{
  return (EDReference *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFirstRow:lastRow:firstColumn:lastColumn:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
}

- (EDReference)initWithFirstRow:(int)a3 lastRow:(int)a4 firstColumn:(int)a5 lastColumn:(int)a6
{
  EDReference *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EDReference;
  result = -[EDReference init](&v11, sel_init);
  if (result)
  {
    result->mAreaReference.firstRow = a3;
    result->mAreaReference.firstColumn = a5;
    result->mAreaReference.lastRow = a4;
    result->mAreaReference.lastColumn = a6;
  }
  return result;
}

- (int)firstColumn
{
  return self->mAreaReference.firstColumn;
}

- (int)lastColumn
{
  return self->mAreaReference.lastColumn;
}

- (BOOL)isValidAreaReference
{
  unsigned int firstRow;
  unsigned int lastRow;
  int firstColumn;
  int lastColumn;
  BOOL v7;
  BOOL v8;
  BOOL v9;

  firstRow = self->mAreaReference.firstRow;
  if ((firstRow & 0x80000000) != 0)
    return 0;
  lastRow = self->mAreaReference.lastRow;
  if ((lastRow & 0x80000000) != 0)
    return 0;
  firstColumn = self->mAreaReference.firstColumn;
  if (firstColumn < 0)
    return 0;
  lastColumn = self->mAreaReference.lastColumn;
  if (firstRow > lastRow || lastColumn < 0)
  {
    v9 = 0;
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v9 = __OFSUB__(firstColumn, lastColumn);
    v7 = firstColumn == lastColumn;
    v8 = firstColumn - lastColumn < 0;
  }
  return (v8 ^ v9 | v7) != 0;
}

- (int)firstRow
{
  return self->mAreaReference.firstRow;
}

- (int)lastRow
{
  return self->mAreaReference.lastRow;
}

- (BOOL)containsRow:(int)a3 column:(int)a4
{
  return self->mAreaReference.firstRow <= a3
      && self->mAreaReference.lastRow >= a3
      && self->mAreaReference.firstColumn <= a4
      && self->mAreaReference.lastColumn >= a4;
}

- (EDReference)init
{
  EDReference *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDReference;
  result = -[EDReference init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->mAreaReference.firstRow = -1;
    *(_QWORD *)&result->mAreaReference.lastRow = -1;
  }
  return result;
}

- (void)unionWithRow:(int)a3 column:(int)a4
{
  -[EDReference unionWithFirstRow:lastRow:firstColumn:lastColumn:](self, "unionWithFirstRow:lastRow:firstColumn:lastColumn:", *(_QWORD *)&a3, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a4);
}

- (void)unionWithFirstRow:(int)a3 lastRow:(int)a4 firstColumn:(int)a5 lastColumn:(int)a6
{
  int32x2_t v6;
  int8x8_t v7;
  int8x8_t v8;
  int32x2_t v9;

  v6 = *(int32x2_t *)&self->mAreaReference.firstRow;
  v7 = (int8x8_t)vceq_s32(v6, (int32x2_t)-1);
  v8 = vbsl_s8(vbic_s8(vmvn_s8((int8x8_t)vceq_s32((int32x2_t)__PAIR64__(a5, a3), (int32x2_t)-1)), v7), (int8x8_t)vmin_s32(v6, (int32x2_t)__PAIR64__(a5, a3)), vbsl_s8(v7, (int8x8_t)__PAIR64__(a5, a3), (int8x8_t)v6));
  v9 = vmax_s32(*(int32x2_t *)&self->mAreaReference.lastRow, (int32x2_t)__PAIR64__(a6, a4));
  *(int8x8_t *)&self->mAreaReference.firstRow = v8;
  *(int32x2_t *)&self->mAreaReference.lastRow = v9;
}

- (BOOL)fullyAdjacentToReference:(id)a3
{
  _DWORD *v4;
  int firstRow;
  int v6;
  int *p_lastRow;
  BOOL v8;

  v4 = a3;
  if (!v4)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  firstRow = self->mAreaReference.firstRow;
  v6 = v4[2];
  if (firstRow != v6 || self->mAreaReference.lastRow != v4[4])
  {
    if (self->mAreaReference.firstColumn == v4[3] && self->mAreaReference.lastColumn == v4[5])
    {
      if (firstRow != v4[4] + 1)
      {
        p_lastRow = &self->mAreaReference.lastRow;
        goto LABEL_14;
      }
      goto LABEL_10;
    }
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  if (self->mAreaReference.firstColumn != v4[5] + 1)
  {
    p_lastRow = &self->mAreaReference.lastColumn;
    v6 = v4[3];
LABEL_14:
    v8 = *p_lastRow == v6 - 1;
    goto LABEL_12;
  }
LABEL_10:
  v8 = 1;
LABEL_12:

  return v8;
}

- (BOOL)isEqualToReference:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = self->mAreaReference.firstRow == v4[2]
    && self->mAreaReference.lastRow == v4[4]
    && self->mAreaReference.firstColumn == v4[3]
    && self->mAreaReference.lastColumn == v4[5];

  return v5;
}

- (unint64_t)countOfCellsBeingReferenced
{
  int32x2_t v4;

  if (-[EDReference isValidCellReference](self, "isValidCellReference"))
    return 1;
  if (!-[EDReference isValidAreaReference](self, "isValidAreaReference"))
    return 0;
  v4 = vadd_s32(vsub_s32(*(int32x2_t *)&self->mAreaReference.lastRow, *(int32x2_t *)&self->mAreaReference.firstRow), (int32x2_t)0x100000001);
  return v4.i32[1] * (uint64_t)v4.i32[0];
}

- (BOOL)isValidCellReference
{
  return (self->mAreaReference.firstRow & 0x80000000) == 0
      && self->mAreaReference.lastRow == -1
      && (self->mAreaReference.firstColumn & 0x80000000) == 0
      && self->mAreaReference.lastColumn == -1;
}

+ (EDReference)referenceWithAreaReference:(EDAreaReference *)a3
{
  return (EDReference *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAreaReference:", a3);
}

- (EDReference)initWithAreaReference:(EDAreaReference *)a3
{
  return -[EDReference initWithFirstRow:lastRow:firstColumn:lastColumn:](self, "initWithFirstRow:lastRow:firstColumn:lastColumn:", a3->firstRow, a3->lastRow, a3->firstColumn, a3->lastColumn);
}

- (unint64_t)hash
{
  return (16 * self->mAreaReference.lastRow) | (self->mAreaReference.firstRow << 6) | (4
                                                                                     * self->mAreaReference.firstColumn) | self->mAreaReference.lastColumn;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAreaReference:", &self->mAreaReference);
}

- (BOOL)isEqual:(id)a3
{
  EDReference *v4;
  EDReference *v5;
  BOOL v6;

  v4 = (EDReference *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[EDReference isEqualToReference:](self, "isEqualToReference:", v5);

  return v6;
}

- (void)setFirstRow:(int)a3
{
  self->mAreaReference.firstRow = a3;
}

- (void)setFirstColumn:(int)a3
{
  self->mAreaReference.firstColumn = a3;
}

- (void)setLastRow:(int)a3
{
  self->mAreaReference.lastRow = a3;
}

- (void)setLastColumn:(int)a3
{
  self->mAreaReference.lastColumn = a3;
}

- (void)unionWithReference:(id)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[EDReference unionWithFirstRow:lastRow:firstColumn:lastColumn:](self, "unionWithFirstRow:lastRow:firstColumn:lastColumn:", v4[2], v4[4], v4[3], v4[5]);
  }

}

- (EDReference)initWithReference:(id)a3
{
  id v4;
  uint64_t v5;
  EDReference *v6;
  _QWORD v8[2];

  v4 = a3;
  v8[0] = objc_msgSend(v4, "areaReference");
  v8[1] = v5;
  v6 = -[EDReference initWithAreaReference:](self, "initWithAreaReference:", v8);

  return v6;
}

+ (id)reference
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (EDReference)referenceWithReference:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithReference:", v3);

  return (EDReference *)v4;
}

- (EDAreaReference)areaReference
{
  uint64_t v2;
  uint64_t v3;
  EDAreaReference result;

  v2 = *(_QWORD *)&self->mAreaReference.lastRow;
  v3 = *(_QWORD *)&self->mAreaReference.firstRow;
  result.lastRow = v2;
  result.lastColumn = HIDWORD(v2);
  result.firstRow = v3;
  result.firstColumn = HIDWORD(v3);
  return result;
}

- (BOOL)isCellReference
{
  return self->mAreaReference.firstRow == self->mAreaReference.lastRow
      && self->mAreaReference.firstColumn == self->mAreaReference.lastColumn;
}

- (BOOL)isRowReference
{
  return !self->mAreaReference.firstColumn && self->mAreaReference.lastColumn > 254;
}

- (BOOL)isColumnReference
{
  return !self->mAreaReference.firstRow && self->mAreaReference.lastRow > 65534;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDReference;
  -[EDReference description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
