@implementation CHPCategoryAndSeriesReordering

- (BOOL)isObjectSupported:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v3;
    objc_msgSend(v4, "seriesCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "count"))
    {
      objc_opt_class();
      v7 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  -[CHPCategoryAndSeriesReordering reorderCategoryAndSeries:sheet:clearAxisReversedFlag:](self, "reorderCategoryAndSeries:sheet:clearAxisReversedFlag:", a3, a4, 1);
}

- (void)reorderCategoryAndSeries:(id)a3 sheet:(id)a4 clearAxisReversedFlag:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a5;
  v10 = a3;
  objc_msgSend(v10, "chart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "plotArea");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCategoryAxesReversed:", v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!(_DWORD)v9)
      goto LABEL_6;
    goto LABEL_5;
  }
  if ((_DWORD)v9 == objc_msgSend(v10, "isColumn"))
LABEL_5:
    -[CHPCategoryAndSeriesReordering applyCategoryReorderingPreprocessor:](self, "applyCategoryReorderingPreprocessor:", v10);
LABEL_6:
  if (-[CHPCategoryAndSeriesReordering isObjectSupportedForSeriesReorderingPreprocessor:isCategoryOrderReversed:](self, "isObjectSupportedForSeriesReorderingPreprocessor:isCategoryOrderReversed:", v10, v9))
  {
    -[CHPCategoryAndSeriesReordering applySeriesReorderingPreprocessor:](self, "applySeriesReorderingPreprocessor:", v10);
  }

}

- (BOOL)isObjectSupportedForSeriesReorderingPreprocessor:(id)a3 isCategoryOrderReversed:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  unint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "seriesCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 < 2)
    goto LABEL_2;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_23;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v5, "isColumn")
        || (objc_msgSend((id)objc_opt_class(), "is3DType") & 1) != 0)
      {
        goto LABEL_2;
      }
LABEL_19:
      LOBYTE(v8) = 1;
      goto LABEL_24;
    }
    if (objc_msgSend(v5, "isColumn"))
    {
LABEL_23:
      v8 = objc_msgSend(v5, "isGroupingStacked") ^ 1;
      goto LABEL_24;
    }
LABEL_2:
    LOBYTE(v8) = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_opt_class();
      if (v10 != objc_opt_class())
        goto LABEL_23;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_19;
    goto LABEL_2;
  }
  v9 = v5;
  if ((objc_msgSend(v9, "isColumn") & 1) != 0)
    LOBYTE(v8) = 0;
  else
    v8 = objc_msgSend(v9, "isGroupingStacked") ^ 1;

LABEL_24:
  return v8;
}

- (void)applyCategoryReorderingPreprocessor:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "seriesCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countOfCellsBeingReferenced");

      if (v10 > v7)
        v7 = v10;

      ++v6;
    }
    while (v5 != v6);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v17, "chart");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "direction");

  if (v5)
  {
    v13 = 0;
    v14 = 1;
    do
    {
      objc_msgSend(v4, "objectAtIndex:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHPCategoryAndSeriesReordering reorderSeriesCategory:dataPointCount:byRow:](self, "reorderSeriesCategory:dataPointCount:byRow:", v15, v7, v12 != 2);

      v13 = v14;
    }
    while (v5 > v14++);
  }

}

- (void)reorderSeriesCategory:(id)a3 dataPointCount:(unint64_t)a4 byRow:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  id v10;

  v5 = a5;
  v10 = a3;
  if (a4 >= 2)
  {
    objc_msgSend(v10, "valueData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHPCategoryAndSeriesReordering reorderData:dataPointCount:byRow:](self, "reorderData:dataPointCount:byRow:", v8, a4, v5);

    objc_msgSend(v10, "categoryData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHPCategoryAndSeriesReordering reorderData:dataPointCount:byRow:](self, "reorderData:dataPointCount:byRow:", v9, a4, v5);

    -[CHPCategoryAndSeriesReordering reorderValueProperties:dataPointCount:](self, "reorderValueProperties:dataPointCount:", v10, a4);
  }

}

- (void)reorderData:(id)a3 dataPointCount:(unint64_t)a4 byRow:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  void *v9;
  int64_t v10;
  id v11;

  v5 = a5;
  v11 = a3;
  if ((objc_msgSend(v11, "isEmpty") & 1) == 0)
  {
    v8 = objc_msgSend(v11, "dataValueIndexCount");
    objc_msgSend(v11, "dataValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CHPCategoryAndSeriesReordering reorderDataValues:dataPointCount:](self, "reorderDataValues:dataPointCount:", v9, a4);

    if (v8 <= v10)
      objc_msgSend(v11, "setDataValueIndexCount:", v10 + 1);
    -[CHPCategoryAndSeriesReordering reorderDataFormula:dataPointCount:byRow:](self, "reorderDataFormula:dataPointCount:byRow:", v11, a4, v5);
  }

}

- (int64_t)reorderDataValues:(id)a3 dataPointCount:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t *v10;
  int64_t v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "count");
    if (v7)
    {
      v8 = 0;
      v9 = -1;
      do
      {
        v10 = (int64_t *)objc_msgSend(v6, "dataPointAtIndex:", v8);
        if (v10)
        {
          v11 = ~*v10 + a4;
          if (v11 > v9)
            v9 = ~*v10 + a4;
          *v10 = v11;
        }
        ++v8;
      }
      while (v7 != v8);
    }
    else
    {
      v9 = -1;
    }
    objc_msgSend(v6, "finishReading");
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (void)reorderDataFormula:(id)a3 dataPointCount:(unint64_t)a4 byRow:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  id v13;

  v5 = a5;
  v13 = a3;
  objc_msgSend(v13, "formula");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "references");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reverseReferencesByRow:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    while (objc_msgSend(v10, "count") > a4)
      objc_msgSend(v10, "removeObjectAtIndex:", 0);
    +[CHDFormula formulaWithReferences:](CHDFormula, "formulaWithReferences:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super.mWorkbook);
    objc_msgSend(v11, "setWorkbook:", WeakRetained);

    objc_msgSend(v11, "prepareTokens");
    objc_msgSend(v11, "setCleaned:", 1);
    objc_msgSend(v13, "setFormula:chart:", v11, 0);

  }
}

- (void)reorderValueProperties:(id)a3 dataPointCount:(unint64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "dataValuePropertiesCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDCollection collection](EDKeyedCollection, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  if (v7)
  {
    v8 = v7 - 1;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDataValueIndex:", ~objc_msgSend(v9, "dataValueIndex") + a4);
      objc_msgSend(v6, "addObject:", v9);
      objc_msgSend(v5, "removeObjectAtIndex:", v8);

      --v8;
    }
    while (v8 != -1);
  }
  objc_msgSend(v10, "setDataValuePropertiesCollection:", v6);

}

- (void)applySeriesReorderingPreprocessor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "seriesCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "chart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDSeriesCollection seriesCollectionWithChart:](CHDSeriesCollection, "seriesCollectionWithChart:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v3, "count");
  v7 = v6 - 1;
  if (v6)
  {
    v8 = v6 - 1;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setOrder:", v7 - objc_msgSend(v9, "order"));
      objc_msgSend(v5, "addObject:", v9);
      objc_msgSend(v3, "removeObjectAtIndex:", v8);

      --v8;
    }
    while (v8 != -1);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v5, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "categoryData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v10, "categoryData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "formula");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(v5, "objectAtIndex:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "categoryData");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v14, "categoryData");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "formula");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v14, "categoryData");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setCategoryData:", v18);

              objc_msgSend(v14, "setCategoryData:", 0);
            }
          }

        }
      }

    }
  }
  objc_msgSend(v19, "setSeriesCollection:", v5);

}

@end
