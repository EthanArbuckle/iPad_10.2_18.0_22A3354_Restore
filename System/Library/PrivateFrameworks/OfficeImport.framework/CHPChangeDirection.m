@implementation CHPChangeDirection

- (BOOL)isObjectSupported:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;

  v3 = a3;
  if (!v3)
    goto LABEL_26;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_26;
  v4 = v3;
  objc_msgSend(v4, "seriesCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || !objc_msgSend(v5, "nonEmptySeriesCount"))
  {
    v13 = 0;
LABEL_12:

    goto LABEL_27;
  }
  v7 = objc_opt_class();
  if (v7 == objc_opt_class() || (v8 = objc_opt_class(), v8 == objc_opt_class()))
  {
    v13 = 1;
    goto LABEL_12;
  }
  objc_msgSend(v4, "chart");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "plotArea");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chartTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && (unint64_t)objc_msgSend(v11, "count") > 1)
  {
    v12 = 0;
    v13 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v4, "isGroupingStacked") & 1) != 0
    || objc_msgSend(v6, "nonEmptySeriesCount") != 1)
  {
    v12 = 1;
    goto LABEL_24;
  }
  objc_msgSend(v6, "firstNonEmptySeries");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "dataValuePropertiesCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v14;
  if (!v14 || (unint64_t)objc_msgSend(v14, "count") < 2)
    goto LABEL_42;
  objc_msgSend(v37, "graphicProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15
    && (objc_msgSend(v37, "graphicProperties"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "hasFill"),
        v16,
        v15,
        v17))
  {
    objc_msgSend(v37, "graphicProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fill");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_45;
    objc_msgSend(v19, "color");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_45;
    objc_msgSend(v19, "color");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "index");

  }
  else
  {
    v23 = -1;
  }
  v38 = objc_msgSend(v39, "count");
  if (!v38)
  {
LABEL_42:
    v12 = 1;
    goto LABEL_43;
  }
  v36 = v23;
  v25 = 0;
  while (1)
  {
    objc_msgSend(v39, "objectAtIndex:", v25, v36);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v26;
    if (!v26)
      goto LABEL_41;
    objc_msgSend(v26, "graphicProperties");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
      goto LABEL_41;
    objc_msgSend(v19, "graphicProperties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "hasFill");

    if (!v29)
      goto LABEL_41;
    objc_msgSend(v19, "graphicProperties");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fill");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_44;
    objc_msgSend(v31, "color");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v33 = objc_opt_isKindOfClass();

    if ((v33 & 1) == 0)
      goto LABEL_44;
    objc_msgSend(v31, "color");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "index");
    if (v36 == -1)
    {
      v36 = v35;
      goto LABEL_40;
    }
    if (v36 != v35)
      break;
LABEL_40:

LABEL_41:
    if (v38 == ++v25)
      goto LABEL_42;
  }

LABEL_44:
LABEL_45:

  v12 = 0;
LABEL_43:

LABEL_24:
  v13 = 1;
LABEL_25:

  if ((v12 & 1) != 0)
LABEL_26:
    v13 = 0;
LABEL_27:

  return v13;
}

- (void)changeChartDirection:(id)a3 sheet:(id)a4
{
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v27;

  v27 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(v27, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "seriesCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "nonEmptySeriesCount") != 1
    || (objc_msgSend(v6, "firstNonEmptySeries"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "valueData"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = ((unint64_t)objc_msgSend(v8, "countOfCellsBeingReferenced") > 1) | isKindOfClass,
        v8,
        v7,
        (v9 & 1) != 0))
  {
    objc_msgSend(v5, "plotArea");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "chartTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && (unint64_t)objc_msgSend(v11, "count") >= 2)
    {
      +[CHDSeriesCollection seriesCollectionWithChart:](CHDSeriesCollection, "seriesCollectionWithChart:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v5;

      v13 = objc_msgSend(v11, "count");
      if (v13)
      {
        v14 = 0;
        do
        {
          objc_msgSend(v11, "objectAtIndex:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "seriesCollection");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v17)
            {
              v19 = objc_msgSend(v17, "count");
              if (v19)
              {
                v20 = 0;
                do
                {
                  objc_msgSend(v18, "objectAtIndex:", v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "addObject:", v21);

                  ++v20;
                }
                while (v19 != v20);
              }
            }

          }
          ++v14;
        }
        while (v14 != v13);
      }
      v5 = v25;
      if (!(((unint64_t)objc_msgSend(v12, "nonEmptySeriesCount") < 2) | isKindOfClass & 1))
        goto LABEL_24;
    }
    else
    {
      v12 = v6;
    }
    -[CHPChangeDirection getSeriesCollectionForOrthogonalDirection:forChart:](self, "getSeriesCollectionForOrthogonalDirection:forChart:", v12, v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22 && objc_msgSend(v22, "count"))
    {
      -[CHPChangeDirection cleanUpOldSeriesCollection:](self, "cleanUpOldSeriesCollection:", v12);
      objc_msgSend(v27, "setSeriesCollection:", v23);
      objc_msgSend(v5, "setDirectionChanged:", 1);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = objc_msgSend(v27, "overlap");
      objc_msgSend(v27, "setOverlap:", objc_msgSend(v27, "gapWidth"));
      objc_msgSend(v27, "setGapWidth:", v24);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v27, "setGapWidth:", 40);
    }

LABEL_24:
    v6 = v12;
  }

}

- (id)getSeriesCollectionForOrthogonalDirection:(id)a3 forChart:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  -[CHPChangeDirection createNewSeriesCollectionForOrthogonalDirection:forChart:](self, "createNewSeriesCollectionForOrthogonalDirection:forChart:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    -[CHPChangeDirection mapSeriesCollection:from:forChart:](self, "mapSeriesCollection:from:forChart:", v9, v6, v7);
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createNewSeriesCollectionForOrthogonalDirection:(id)a3 forChart:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  id WeakRetained;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;

  v30 = a3;
  v31 = a4;
  objc_msgSend(v30, "firstNonEmptySeries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countOfCellsBeingReferenced");

  objc_msgSend(v6, "valueData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "graphicProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hasFill") & 1) != 0)
  {
    objc_msgSend(v6, "graphicProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fill");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isOverridden");

    if ((v14 & 1) != 0)
    {
      v15 = 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "chartType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v16, "isVaryColors");

LABEL_6:
  +[CHDSeriesCollection seriesCollectionWithChart:](CHDSeriesCollection, "seriesCollectionWithChart:", v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v6, "shallowCopy");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if ((_DWORD)v15)
        objc_msgSend(v19, "setStyleIndex:", i);
      objc_msgSend(v20, "setOrder:", i);
      WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
      +[CHDData dataWithResources:](CHDData, "dataWithResources:", WeakRetained);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setValueData:", v22);

      if (v10)
      {
        objc_msgSend(v20, "valueData");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setContentFormat:", v10);

      }
      objc_msgSend(v6, "defaultDataLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDefaultDataLabel:", v24);

      objc_msgSend(v6, "trendlineCollection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTrendlineCollection:", v25);

      objc_msgSend(v6, "errorBarXAxis");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setErrorBarXAxis:", v26);

      objc_msgSend(v6, "errorBarYAxis");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setErrorBarYAxis:", v27);

      -[CHPChangeDirection getGraphicPropertiesForSeriesWithIndex:fromCollection:isVaryColors:forChart:](self, "getGraphicPropertiesForSeriesWithIndex:fromCollection:isVaryColors:forChart:", i, v30, v15, v31);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setGraphicProperties:", v28);

      objc_msgSend(v17, "addObject:", v20);
    }
  }

  return v17;
}

- (id)getGraphicPropertiesForSeriesWithIndex:(unint64_t)a3 fromCollection:(id)a4 isVaryColors:(BOOL)a5 forChart:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  OADGraphicProperties *v14;
  void *v16;
  OADDrawingTheme *v17;
  void *v18;
  void *v19;
  OADDrawingTheme *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char isKindOfClass;
  void *v31;

  v7 = a5;
  v9 = a4;
  v10 = a6;
  objc_msgSend(v9, "firstNonEmptySeries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataValuePropertiesCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectWithKey:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "graphicProperties");
  v14 = (OADGraphicProperties *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (!v7)
      goto LABEL_15;
    objc_msgSend(v9, "objectWithKey:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "graphicProperties");
    v14 = (OADGraphicProperties *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      if (objc_msgSend(v9, "count") > a3)
        goto LABEL_15;
      v14 = objc_alloc_init(OADGraphicProperties);
      v17 = [OADDrawingTheme alloc];
      objc_msgSend(v10, "workbook");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "theme");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[OADDrawingTheme initWithTheme:colorMap:colorPalette:](v17, "initWithTheme:colorMap:colorPalette:", v19, 0, 0);

      +[CHAutoStyling autoStylingWithChart:drawingTheme:](CHAutoStyling, "autoStylingWithChart:drawingTheme:", v10, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "resolveGraphicPropertiesOfSeries:forSeriesIndex:", v14, a3);
      objc_msgSend(v11, "graphicProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v11, "graphicProperties");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "hasStroke"))
        {
          objc_msgSend(v23, "stroke");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (!v24)
            goto LABEL_11;
          objc_msgSend(v24, "fill");
          v26 = objc_claimAutoreleasedReturnValue();
          if (!v26
            || (v31 = (void *)v26,
                objc_msgSend(v25, "fill"),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                isKindOfClass = objc_opt_isKindOfClass(),
                v27,
                v31,
                (isKindOfClass & 1) != 0))
          {
LABEL_11:
            +[OADStroke nullStroke](OADStroke, "nullStroke");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[OADGraphicProperties setStroke:](v14, "setStroke:", v28);

          }
        }

      }
      if (!v14)
      {
LABEL_15:
        objc_msgSend(v11, "graphicProperties");
        v14 = (OADGraphicProperties *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(v9, "objectWithKey:", a3);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "graphicProperties");
          v14 = (OADGraphicProperties *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
  }

  return v14;
}

- (void)mapSeriesCollection:(id)a3 from:(id)a4 forChart:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  uint64_t i;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int j;
  void *v27;
  void *v28;
  void *v29;
  CHDFormula *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unsigned int k;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  char v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v59;
  id v60;

  v60 = a3;
  v7 = a4;
  v53 = a5;
  v8 = objc_msgSend(v7, "nonEmptySeriesCount");
  objc_msgSend(v7, "firstNonEmptySeries");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v7;
  v57 = objc_msgSend(v60, "count");
  if (v8 == 1)
    v9 = 1;
  else
    v9 = objc_msgSend(v7, "count");
  +[EDReferenceCollection noCoalesceCollection](EDReferenceCollection, "noCoalesceCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
  +[CHDData dataWithResources:](CHDData, "dataWithResources:", WeakRetained);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v56, "categoryData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentFormat");
  v13 = objc_claimAutoreleasedReturnValue();

  v51 = (void *)v13;
  if (v13)
    objc_msgSend(v59, "setContentFormat:", v13);
  objc_msgSend(v56, "chartType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "chart");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "direction");

  if (v9)
  {
    v54 = 0;
    v17 = 0;
    for (i = 0; i != v9; ++i)
    {
      if (v8 == 1)
      {
        v19 = v56;
      }
      else
      {
        objc_msgSend(v52, "objectAtIndex:", i);
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      v20 = v19;
      if ((objc_msgSend(v19, "isEmpty") & 1) == 0)
      {
        objc_msgSend(v20, "lastCachedName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v20, "lastCachedName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "dataValues");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[CHPChangeDirection addDataValue:to:withIndex:](self, "addDataValue:to:withIndex:", v22, v23, i);

        }
        objc_msgSend(v20, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "references");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          for (j = 0; objc_msgSend(v25, "count") > (unint64_t)j; ++j)
          {
            objc_msgSend(v25, "objectAtIndex:", j);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v27);

          }
        }
        else
        {
          v54 = 1;
        }
        objc_msgSend(v20, "defaultDataLabel");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
          v17 |= objc_msgSend(v28, "isShowLeaderLines");
        -[CHPChangeDirection mapSeriesValues:to:forIndex:byRow:forChart:](self, "mapSeriesValues:to:forIndex:byRow:forChart:", v20, v60, i, v16 != 2, v53);

      }
    }
  }
  else
  {
    LOBYTE(v17) = 0;
    v54 = 0;
  }
  if (!((objc_msgSend(v10, "count") == 0) | v54 & 1))
  {
    v30 = objc_alloc_init(CHDFormula);
    v31 = objc_loadWeakRetained((id *)&self->super.mWorkbook);
    -[CHDFormula setWorkbook:](v30, "setWorkbook:", v31);

    objc_msgSend(v10, "coalesceProgressiveCellReferencesCollection");
    -[CHDFormula setReferences:](v30, "setReferences:", v10);
    objc_msgSend(v59, "setFormula:chart:", v30, v53);

  }
  objc_msgSend(v56, "categoryData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    objc_msgSend(v32, "formula");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      objc_msgSend(v34, "setCleaned:", 1);
      objc_msgSend(v35, "references");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v55 = 0;
    }

  }
  else
  {
    v55 = 0;
  }
  if (v57)
  {
    v36 = 0;
    for (k = 0; k < v57; v36 = ++k)
    {
      objc_msgSend(v60, "objectAtIndex:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setCategoryData:", v59);
      if (v33)
      {
        objc_msgSend(v33, "dataValues");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "dataValueWithIndex:", (int)k);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40 && objc_msgSend(v40, "contentFormatId") == -1 && objc_msgSend(v33, "contentFormatId") != -1)
          objc_msgSend(v40, "setContentFormatId:", objc_msgSend(v33, "contentFormatId"));
        objc_msgSend(v38, "setLastCachedName:", v40);
        objc_msgSend(v55, "referenceToCellWithIndex:byRow:", v36, v16 != 2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          +[CHDFormula formulaWithReference:](CHDFormula, "formulaWithReference:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_loadWeakRetained((id *)&self->super.mWorkbook);
          objc_msgSend(v42, "setWorkbook:", v43);

          objc_msgSend(v38, "setName:", v42);
        }

      }
      objc_msgSend(v38, "valueData");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "formula");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v45;
      if (v45)
      {
        objc_msgSend(v45, "references");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47;
        if (v47)
          objc_msgSend(v47, "coalesceProgressiveCellReferencesCollection");

      }
      objc_msgSend(v38, "defaultDataLabel");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (((v49 != 0) & v17) == 1)
        objc_msgSend(v49, "setShowLeaderLines:", 1);

    }
  }

}

- (void)addDataValue:(id)a3 to:(id)a4 withIndex:(unint64_t)a5
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (v8 && v7)
  {
    objc_msgSend(v8, "setIndex:", a5);
    objc_msgSend(v7, "addDataValue:", v8);
  }

}

- (void)mapSeriesValues:(id)a3 to:(id)a4 forIndex:(unint64_t)a5 byRow:(BOOL)a6 forChart:(id)a7
{
  _BOOL8 v8;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  CHDFormula *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int isKindOfClass;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;

  v8 = a6;
  v33 = a3;
  v38 = a4;
  v39 = a7;
  objc_msgSend(v33, "valueData");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "dataValuePropertiesCollection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "formula");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "references");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v38, "count");
  if (v12)
  {
    for (i = 0; v12 != i; ++i)
    {
      objc_msgSend(v38, "objectAtIndex:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "referenceToCellWithIndex:byRow:", i, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v14, "valueData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "formula");
        v17 = (CHDFormula *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          v17 = objc_alloc_init(CHDFormula);
          WeakRetained = objc_loadWeakRetained((id *)&self->super.mWorkbook);
          -[CHDFormula setWorkbook:](v17, "setWorkbook:", WeakRetained);

          objc_msgSend(v16, "setFormula:chart:", v17, v39);
          objc_msgSend(v14, "setValueData:", 0);
          objc_msgSend(v14, "setValueData:", v16);
        }
        -[CHDFormula references](v17, "references");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          +[EDReferenceCollection noCoalesceCollection](EDReferenceCollection, "noCoalesceCollection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[CHDFormula setReferences:](v17, "setReferences:", v19);
        }
        objc_msgSend(v19, "addObject:", v15);

      }
      objc_msgSend(v37, "dataValues");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dataValueWithIndex:", i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v14, "valueData");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dataValues");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CHPChangeDirection addDataValue:to:withIndex:](self, "addDataValue:to:withIndex:", v21, v23, a5);

      }
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v25 = objc_msgSend(v39, "hasVisibleSeriesNames");
      objc_msgSend(v35, "objectWithKey:", i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        objc_msgSend(v26, "shallowCopyWithIndex:", a5);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v28, "isExplosionSet") & 1) == 0)
          objc_msgSend(v28, "setExplosion:", objc_msgSend(v33, "explosion"));
        objc_msgSend(v14, "dataValuePropertiesCollection");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v28);
      }
      else
      {
        if (((isKindOfClass | v25) & 1) == 0)
          goto LABEL_21;
        objc_msgSend(v33, "graphicProperties");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
          goto LABEL_21;
        if ((isKindOfClass & 1) != 0)
          +[CHDDataValueProperties dataValueProperties](CHDPieDataValueProperties, "dataValueProperties");
        else
          +[CHDDataValueProperties dataValueProperties](CHDDataValueProperties, "dataValueProperties");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "graphicProperties");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setGraphicProperties:", v31);

        objc_msgSend(v27, "setDataValueIndex:", a5);
        objc_msgSend(v27, "dataLabel");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v28)
        {
          objc_msgSend(v33, "defaultDataLabel");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setDataLabel:", v32);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v27, "setExplosion:", objc_msgSend(v33, "explosion"));
        objc_msgSend(v14, "dataValuePropertiesCollection");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v27);
      }

LABEL_21:
    }
  }

}

- (void)cleanUpOldSeriesCollection:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = objc_msgSend(v7, "count");
  if (v3)
  {
    v4 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
        objc_msgSend(v5, "clearBackPointers");

      ++v4;
    }
    while (v3 != v4);
  }

}

- (void)changeBarColumnDirection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "chart");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plotArea");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chartTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "seriesCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if (((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v13, "isGroupingStacked") & 1) == 0)
      && (unint64_t)objc_msgSend(v7, "nonEmptySeriesCount") >= 2)
    {
      objc_msgSend(v7, "firstNonEmptySeries");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "countOfCellsBeingReferenced") == 1)
      {
        if (v6)
        {
          v10 = objc_msgSend(v6, "count");

          if (v10 > 1)
            goto LABEL_17;
        }
        else
        {

        }
        objc_msgSend(v4, "setVisibleSeriesNames:", 1);
        -[CHPChangeDirection getSeriesCollectionForOrthogonalDirection:forChart:](self, "getSeriesCollectionForOrthogonalDirection:forChart:", v7, v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v11;
        if (v11 && objc_msgSend(v11, "count"))
        {
          -[CHPChangeDirection cleanUpOldSeriesCollection:](self, "cleanUpOldSeriesCollection:", v7);
          objc_msgSend(v13, "setSeriesCollection:", v8);
          objc_msgSend(v4, "setDirectionChanged:", 1);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = objc_msgSend(v13, "overlap");
          objc_msgSend(v13, "setOverlap:", objc_msgSend(v13, "gapWidth"));
          objc_msgSend(v13, "setGapWidth:", v12);
        }
      }
      else
      {

      }
    }
  }
LABEL_17:

}

@end
