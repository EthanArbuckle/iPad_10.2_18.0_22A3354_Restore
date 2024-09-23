@implementation EDSheetReference

+ (id)referenceWithSheetIndex:(unint64_t)a3 firstRow:(int)a4 lastRow:(int)a5 firstColumn:(int)a6 lastColumn:(int)a7
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSheetIndex:firstRow:lastRow:firstColumn:lastColumn:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

- (EDSheetReference)initWithSheetIndex:(unint64_t)a3 firstRow:(int)a4 lastRow:(int)a5 firstColumn:(int)a6 lastColumn:(int)a7
{
  EDSheetReference *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EDSheetReference;
  result = -[EDReference initWithFirstRow:lastRow:firstColumn:lastColumn:](&v9, sel_initWithFirstRow_lastRow_firstColumn_lastColumn_, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  if (result)
    result->mSheetIndex = a3;
  return result;
}

- (unint64_t)sheetIndex
{
  return self->mSheetIndex;
}

- (BOOL)fullyAdjacentToReference:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    if (self->mSheetIndex == v5[3])
    {
      v8.receiver = self;
      v8.super_class = (Class)EDSheetReference;
      v6 = -[EDReference fullyAdjacentToReference:](&v8, sel_fullyAdjacentToReference_, v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (EDSheetReference)init
{
  EDSheetReference *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDSheetReference;
  result = -[EDReference init](&v3, sel_init);
  if (result)
    result->mSheetIndex = -1;
  return result;
}

- (BOOL)isEqualToTableReference:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (self->mSheetIndex == v4[3])
  {
    v7.receiver = self;
    v7.super_class = (Class)EDSheetReference;
    v5 = -[EDReference isEqualToReference:](&v7, sel_isEqualToReference_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  EDSheetReference *v4;
  EDSheetReference *v5;
  BOOL v6;

  v4 = (EDSheetReference *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[EDSheetReference isEqualToTableReference:](self, "isEqualToTableReference:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t mSheetIndex;
  objc_super v4;

  mSheetIndex = self->mSheetIndex;
  v4.receiver = self;
  v4.super_class = (Class)EDSheetReference;
  return -[EDReference hash](&v4, sel_hash) | (mSheetIndex << 8);
}

- (BOOL)isSheedIndexValid
{
  return self->mSheetIndex != -1;
}

- (void)unionWithReference:(id)a3
{
  _QWORD *v4;
  objc_super v5;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->mSheetIndex != v4[3])
        +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", ECUnsupportedExportFormula);
      v5.receiver = self;
      v5.super_class = (Class)EDSheetReference;
      -[EDReference unionWithReference:](&v5, sel_unionWithReference_, v4);
    }
  }

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDSheetReference;
  -[EDReference description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
