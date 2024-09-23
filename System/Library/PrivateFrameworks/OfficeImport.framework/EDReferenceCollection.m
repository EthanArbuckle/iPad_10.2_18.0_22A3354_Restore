@implementation EDReferenceCollection

- (EDReferenceCollection)init
{
  EDReferenceCollection *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDReferenceCollection;
  result = -[EDCollection init](&v3, sel_init);
  if (result)
    result->mCoalesce = 1;
  return result;
}

- (unint64_t)addObject:(id)a3
{
  id v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EDReferenceCollection;
  -[EDCollection addObject:](&v6, sel_addObject_, v4);
  if (self->mCoalesce)
    -[EDReferenceCollection coalesce](self, "coalesce");

  return -1;
}

- (void)coalesce
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[EDCollection count](self, "count");
  v4 = v3 - 2;
  if (v3 >= 2)
  {
    v5 = v3 - 1;
    v6 = 2;
    if (v4 < 2)
      v6 = v3 - 2;
    v7 = v6 + 1;
    while (!-[EDReferenceCollection coalesceReferenceAtIndex1:index2:](self, "coalesceReferenceAtIndex1:index2:", v4, v5))
    {
      --v4;
      if (!--v7)
        return;
    }
    -[EDReferenceCollection coalesce](self, "coalesce");
  }
}

- (BOOL)coalesceReferenceAtIndex1:(unint64_t)a3 index2:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  -[EDCollection objectAtIndex:](self, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDCollection objectAtIndex:](self, "objectAtIndex:", a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v6 && v7)
  {
    if ((objc_msgSend(v6, "fullyAdjacentToReference:", v7) & 1) != 0
      || (objc_msgSend(v6, "isEqualToReference:", v8) & 1) != 0)
    {
      objc_msgSend(v6, "unionWithReference:", v8);
      -[EDCollection removeObjectAtIndex:](self, "removeObjectAtIndex:", a4);
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)countOfCellsBeingReferenced
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;

  v3 = -[EDCollection count](self, "count");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  for (i = 0; i != v4; ++i)
  {
    -[EDCollection objectAtIndex:](self, "objectAtIndex:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v5 += objc_msgSend(v7, "countOfCellsBeingReferenced");

  }
  return v5;
}

+ (id)noCoalesceCollection
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWihNoCoalesce");
}

- (id)initWihNoCoalesce
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDReferenceCollection;
  result = -[EDCollection init](&v3, sel_init);
  if (result)
    *((_BYTE *)result + 16) = 0;
  return result;
}

- (id)reverseReferencesByRow:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;

  v3 = a3;
  if (-[EDCollection count](self, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "collection");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      *(_BYTE *)(v5 + 16) = 0;
      v7 = -[EDReferenceCollection countOfCellsBeingReferenced](self, "countOfCellsBeingReferenced");
      if (v7)
      {
        v8 = v7 - 1;
        do
        {
          -[EDReferenceCollection referenceToCellWithIndex:byRow:](self, "referenceToCellWithIndex:byRow:", v8, v3);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v6, "addObject:", v9);

          --v8;
        }
        while (v8 != -1);
      }
      v10 = v6;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)referenceToCellWithIndex:(unint64_t)a3 byRow:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  int v22;
  int v23;
  unint64_t v24;

  v4 = a4;
  v7 = -[EDCollection count](self, "count");
  if (!v7)
  {
LABEL_7:
    v13 = 0;
    return v13;
  }
  v8 = v7;
  v9 = 0;
  while (1)
  {
    -[EDCollection objectAtIndex:](self, "objectAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      break;
LABEL_6:

    if (v8 == ++v9)
      goto LABEL_7;
  }
  v12 = objc_msgSend(v10, "countOfCellsBeingReferenced");
  if (a3 >= v12)
  {
    a3 -= v12;
    goto LABEL_6;
  }
  if (v4)
  {
    v14 = objc_msgSend(v11, "lastColumn");
    v15 = objc_msgSend(v11, "firstColumn");
    v16 = objc_msgSend(v11, "firstRow");
    v17 = objc_msgSend(v11, "firstColumn");
    v18 = v14 - v15 + 1;
    v19 = v16 + (a3 / v18);
    v20 = a3 % v18;
  }
  else
  {
    v21 = objc_msgSend(v11, "lastRow");
    v22 = objc_msgSend(v11, "firstRow");
    v23 = objc_msgSend(v11, "firstRow");
    v17 = objc_msgSend(v11, "firstColumn");
    v24 = v21 - v22 + 1;
    v20 = a3 / v24;
    v19 = v23 + (a3 % v24);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    +[EDSheetReference referenceWithSheetIndex:firstRow:lastRow:firstColumn:lastColumn:](EDSheetReference, "referenceWithSheetIndex:firstRow:lastRow:firstColumn:lastColumn:", objc_msgSend(v11, "sheetIndex"), v19, v19, (v17 + v20), (v17 + v20));
  else
    +[EDReference referenceWithFirstRow:lastRow:firstColumn:lastColumn:](EDReference, "referenceWithFirstRow:lastRow:firstColumn:lastColumn:", v19, v19, (v17 + v20), (v17 + v20));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)coalesceCollection
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)coalesceProgressiveCellReferencesCollection
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  unint64_t v15;
  int v16;
  id v17;

  v3 = -[EDCollection count](self, "count");
  if (v3 >= 2)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = 0xFFFFFFFFLL;
    v8 = 0xFFFFFFFFLL;
    v9 = 0xFFFFFFFFLL;
    v10 = 0xFFFFFFFFLL;
    while (1)
    {
      -[EDCollection objectAtIndex:](self, "objectAtIndex:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        break;
      v17 = v11;
      if (!objc_msgSend(v11, "isCellReference"))
        goto LABEL_19;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_19;
      if (v6)
      {
        if (v5 != objc_msgSend(v17, "sheetIndex"))
          goto LABEL_19;
        v12 = objc_msgSend(v17, "areaReference");
        v13 = (unint64_t)objc_msgSend(v17, "areaReference") >> 32;
        if ((_DWORD)v7 == (_DWORD)v12)
        {
          v11 = v17;
          if ((int)v7 < (int)v8)
            break;
          v14 = v10 + 1;
          v10 = v13;
          if (v14 != (_DWORD)v13)
            break;
        }
        else
        {
          v11 = v17;
        }
        if ((_DWORD)v9 == (_DWORD)v13)
        {
          if ((int)v9 < (int)v10)
            break;
          v16 = v8 + 1;
          v8 = v12;
          if (v16 != (_DWORD)v12)
            break;
        }
      }
      else
      {
        v8 = objc_msgSend(v17, "areaReference");
        v15 = objc_msgSend(v17, "areaReference");
        v5 = objc_msgSend(v17, "sheetIndex");
        v10 = HIDWORD(v15);
        v9 = v10;
        v7 = v8;
        v11 = v17;
      }

      if (v4 == ++v6)
      {
        +[EDSheetReference referenceWithSheetIndex:firstRow:lastRow:firstColumn:lastColumn:](EDSheetReference, "referenceWithSheetIndex:firstRow:lastRow:firstColumn:lastColumn:", v5, v7, v8, v9, v10);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        -[EDCollection removeAllObjects](self, "removeAllObjects");
        -[EDReferenceCollection addObject:](self, "addObject:", v17);
LABEL_19:
        v11 = v17;
        break;
      }
    }

  }
}

@end
