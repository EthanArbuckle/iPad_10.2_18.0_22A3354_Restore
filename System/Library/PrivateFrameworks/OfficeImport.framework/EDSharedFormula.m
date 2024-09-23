@implementation EDSharedFormula

- (EDSharedFormula)init
{
  EDSharedFormula *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDSharedFormula;
  result = -[EDFormula init](&v3, sel_init);
  if (result)
  {
    result->_baseFormulaIndex = -1;
    result->_rowBaseOrOffset = -1;
    result->_columnBaseOrOffset = -1;
  }
  return result;
}

- (void)setRowBaseOrOffset:(int)a3
{
  self->_rowBaseOrOffset = a3;
}

- (void)setColumnBaseOrOffset:(int)a3
{
  self->_columnBaseOrOffset = a3;
}

- (void)setBaseFormulaIndex:(unint64_t)a3
{
  self->_baseFormulaIndex = a3;
}

- (BOOL)isBaseFormula
{
  return !-[EDSharedFormula forceNonBaseFormula](self, "forceNonBaseFormula")
      && -[EDSharedFormula baseFormulaIndex](self, "baseFormulaIndex") == -1;
}

- (id)warningWithRowBlocks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EDSharedFormula;
  -[EDFormula warning](&v11, sel_warning);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[EDSharedFormula baseFormulaWithRowBlocks:](self, "baseFormulaWithRowBlocks:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8
      && ((objc_msgSend(v8, "isContainsRelativeReferences") & 1) != 0
       || (objc_msgSend(v9, "isCleanedWithEvaluationStack") & 1) != 0))
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v9, "warning");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v7;
}

- (id)baseFormulaWithRowBlocks:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[EDSharedFormula baseFormulaIndex](self, "baseFormulaIndex") == -1)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "formulas");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", -[EDSharedFormula baseFormulaIndex](self, "baseFormulaIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (int)rowBaseOrOffset
{
  return self->_rowBaseOrOffset;
}

- (int)columnBaseOrOffset
{
  return self->_columnBaseOrOffset;
}

- (EDSharedFormula)initWithFormula:(id)a3
{
  EDSharedFormula *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EDSharedFormula;
  result = -[EDFormula initWithFormula:](&v4, sel_initWithFormula_, a3);
  if (result)
  {
    result->_baseFormulaIndex = -1;
    result->_rowBaseOrOffset = -1;
    result->_columnBaseOrOffset = -1;
  }
  return result;
}

- (BOOL)convertTokensToShared
{
  return -[EDFormula convertTokensToSharedAtRow:column:](self, "convertTokensToSharedAtRow:column:", -[EDSharedFormula rowBaseOrOffset](self, "rowBaseOrOffset"), -[EDSharedFormula columnBaseOrOffset](self, "columnBaseOrOffset"));
}

- (BOOL)isSharedFormula
{
  return 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDSharedFormula;
  -[EDFormula description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)baseFormulaIndex
{
  return self->_baseFormulaIndex;
}

- (BOOL)forceNonBaseFormula
{
  return self->_forceNonBaseFormula;
}

- (void)setForceNonBaseFormula:(BOOL)a3
{
  self->_forceNonBaseFormula = a3;
}

- (EDReference)baseFormulaRange
{
  return self->_baseFormulaRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseFormulaRange, 0);
}

- (void)updateBaseFormulaRangeWithRow:(int)a3 column:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  EDReference *v8;
  EDReference *v9;
  EDReference *v10;
  EDReference *baseFormulaRange;
  void *v12;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[EDSharedFormula baseFormulaRange](self, "baseFormulaRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else if (-[EDSharedFormula rowBaseOrOffset](self, "rowBaseOrOffset") == -1
         || -[EDSharedFormula columnBaseOrOffset](self, "columnBaseOrOffset") == -1)
  {
    v10 = -[EDReference initWithFirstRow:lastRow:firstColumn:lastColumn:]([EDReference alloc], "initWithFirstRow:lastRow:firstColumn:lastColumn:", v5, v5, v4, v4);
    baseFormulaRange = self->_baseFormulaRange;
    self->_baseFormulaRange = v10;

    return;
  }
  if (!self->_baseFormulaRange)
  {
    v8 = -[EDReference initWithFirstRow:lastRow:firstColumn:lastColumn:]([EDReference alloc], "initWithFirstRow:lastRow:firstColumn:lastColumn:", -[EDSharedFormula rowBaseOrOffset](self, "rowBaseOrOffset"), -[EDSharedFormula rowBaseOrOffset](self, "rowBaseOrOffset"), -[EDSharedFormula columnBaseOrOffset](self, "columnBaseOrOffset"), -[EDSharedFormula columnBaseOrOffset](self, "columnBaseOrOffset"));
    v9 = self->_baseFormulaRange;
    self->_baseFormulaRange = v8;

  }
  -[EDSharedFormula baseFormulaRange](self, "baseFormulaRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unionWithRow:column:", v5, v4);

}

- (void)unarchiveFromData:(__CFData *)a3 offset:(unint64_t *)a4
{
  unint64_t v7;
  EDReference *v8;
  EDReference *baseFormulaRange;
  UInt8 v10[16];
  objc_super v11;
  CFRange v12;
  CFRange v13;
  CFRange v14;
  CFRange v15;
  CFRange v16;

  if (a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)EDSharedFormula;
    -[EDFormula unarchiveFromData:offset:](&v11, sel_unarchiveFromData_offset_);
    v7 = *a4;
    v12.location = *a4;
    v12.length = 8;
    CFDataGetBytes(a3, v12, (UInt8 *)&self->_baseFormulaIndex);
    *a4 += 8;
    v13.location = v7 + 8;
    v13.length = 1;
    CFDataGetBytes(a3, v13, (UInt8 *)&self->_forceNonBaseFormula);
    ++*a4;
    v14.location = v7 + 9;
    v14.length = 4;
    CFDataGetBytes(a3, v14, (UInt8 *)&self->_rowBaseOrOffset);
    *a4 += 4;
    v15.location = v7 + 13;
    v15.length = 4;
    CFDataGetBytes(a3, v15, (UInt8 *)&self->_columnBaseOrOffset);
    *a4 += 4;
    v16.location = v7 + 17;
    v16.length = 16;
    CFDataGetBytes(a3, v16, v10);
    *a4 += 16;
    v8 = -[EDReference initWithAreaReference:]([EDReference alloc], "initWithAreaReference:", v10);
    baseFormulaRange = self->_baseFormulaRange;
    self->_baseFormulaRange = v8;

  }
}

- (void)archiveByAppendingToMutableData:(__CFData *)a3
{
  uint64_t v5;
  _QWORD v6[2];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EDSharedFormula;
  -[EDFormula archiveByAppendingToMutableData:](&v7, sel_archiveByAppendingToMutableData_);
  CFDataAppendBytes(a3, (const UInt8 *)&self->_baseFormulaIndex, 8);
  CFDataAppendBytes(a3, (const UInt8 *)&self->_forceNonBaseFormula, 1);
  CFDataAppendBytes(a3, (const UInt8 *)&self->_rowBaseOrOffset, 4);
  CFDataAppendBytes(a3, (const UInt8 *)&self->_columnBaseOrOffset, 4);
  v6[0] = -[EDReference areaReference](self->_baseFormulaRange, "areaReference");
  v6[1] = v5;
  CFDataAppendBytes(a3, (const UInt8 *)v6, 16);
}

@end
