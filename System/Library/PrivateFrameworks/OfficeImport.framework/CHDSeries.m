@implementation CHDSeries

- (CHDSeries)initWithChart:(id)a3
{
  id v4;
  CHDSeries *v5;
  CHDSeries *v6;
  EDKeyedCollection *v7;
  EDKeyedCollection *mDataValuePropertiesCollection;
  EDCollection *v9;
  EDCollection *mTrendlinesCollection;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CHDSeries;
  v5 = -[CHDSeries init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mChart, v4);
    v7 = objc_alloc_init(EDKeyedCollection);
    mDataValuePropertiesCollection = v6->mDataValuePropertiesCollection;
    v6->mDataValuePropertiesCollection = v7;

    v9 = objc_alloc_init(EDCollection);
    mTrendlinesCollection = v6->mTrendlinesCollection;
    v6->mTrendlinesCollection = v9;

    *(_OWORD *)&v6->mOrder = xmmword_22A4BD4B0;
    *(_WORD *)&v6->mDateTimeFormattingFlag = 0;
  }

  return v6;
}

- (void)setOrder:(unint64_t)a3
{
  self->mOrder = a3;
}

- (void)setName:(id)a3
{
  CHDFormula *v5;
  id WeakRetained;
  void *v7;
  CHDFormula *v8;

  v5 = (CHDFormula *)a3;
  if (self->mName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->mName, a3);
    v5 = v8;
    if (v8)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
      objc_msgSend(WeakRetained, "processors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "markObject:processor:", v8, objc_opt_class());

      v5 = v8;
    }
  }

}

- (void)setValueData:(id)a3
{
  CHDData *v5;
  id WeakRetained;
  void *v7;
  CHDData *v8;

  v5 = (CHDData *)a3;
  if (self->mValueData != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->mValueData, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
    objc_msgSend(WeakRetained, "processors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markObject:processor:", v8, objc_opt_class());

    v5 = v8;
  }

}

- (void)setCategoryData:(id)a3
{
  CHDData *v5;
  id WeakRetained;
  void *v7;
  CHDData *v8;

  v5 = (CHDData *)a3;
  if (self->mCategoryData != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->mCategoryData, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
    objc_msgSend(WeakRetained, "processors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markObject:processor:", v8, objc_opt_class());

    v5 = v8;
  }

}

- (id)dataValuePropertiesCollection
{
  return self->mDataValuePropertiesCollection;
}

- (void)setStyleIndex:(unint64_t)a3
{
  self->mStyleIndex = a3;
}

- (void)setGraphicProperties:(id)a3
{
  OADGraphicProperties *v5;
  OADGraphicProperties **p_mGraphicProperties;
  OADGraphicProperties *mGraphicProperties;
  OADGraphicProperties *v8;

  v5 = (OADGraphicProperties *)a3;
  mGraphicProperties = self->mGraphicProperties;
  p_mGraphicProperties = &self->mGraphicProperties;
  if (mGraphicProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mGraphicProperties, a3);
    v5 = v8;
  }

}

- (id)defaultDataLabel
{
  return self->mDefaultDataLabel;
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (unint64_t)styleIndex
{
  return self->mStyleIndex;
}

- (BOOL)isHidden
{
  return self->mHiddenFlag;
}

- (void)setChartType:(id)a3
{
  objc_storeWeak((id *)&self->mChartType, a3);
}

- (int64_t)key
{
  return self->mOrder;
}

- (id)name
{
  return self->mName;
}

- (id)lastCachedName
{
  return self->mLastCachedName;
}

- (id)valueData
{
  return self->mValueData;
}

- (id)categoryData
{
  return self->mCategoryData;
}

- (BOOL)isEmpty
{
  CHDData *mValueData;

  mValueData = self->mValueData;
  return !mValueData || -[CHDData isEmpty](mValueData, "isEmpty");
}

- (id)defaultSeriesNameForIndex:(unint64_t)a3
{
  CHDChart **p_mChart;
  id WeakRetained;
  int v7;
  __CFString *v8;
  CHDChartType **p_mChartType;
  id v10;
  char isKindOfClass;
  id v12;
  char v13;
  id v14;
  void *v15;
  int v16;
  char v17;
  id v18;
  char v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  int v24;
  void *v25;

  p_mChart = &self->mChart;
  WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  v7 = objc_msgSend(WeakRetained, "isMSGraph");

  v8 = CFSTR("Series");
  if (v7)
  {
    p_mChartType = &self->mChartType;
    v10 = objc_loadWeakRetained((id *)p_mChartType);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v8 = CFSTR("Slice ");
    }
    else
    {
      v12 = objc_loadWeakRetained((id *)p_mChartType);
      objc_opt_class();
      v13 = objc_opt_isKindOfClass();

      v14 = objc_loadWeakRetained((id *)p_mChartType);
      v15 = v14;
      if ((v13 & 1) != 0)
      {
        v16 = objc_msgSend(v14, "isColumn");

        if (v16)
          v8 = CFSTR("Column ");
        else
          v8 = CFSTR("Bar ");
      }
      else
      {
        objc_opt_class();
        v17 = objc_opt_isKindOfClass();

        if ((v17 & 1) != 0)
        {
          v8 = CFSTR("Area ");
        }
        else
        {
          v18 = objc_loadWeakRetained((id *)p_mChartType);
          objc_opt_class();
          v19 = objc_opt_isKindOfClass();

          if ((v19 & 1) != 0)
          {
            v8 = CFSTR("Line ");
          }
          else
          {
            v20 = objc_loadWeakRetained((id *)p_mChartType);
            v21 = objc_opt_class();
            v22 = objc_opt_class();

            if (v21 == v22)
              v8 = CFSTR("XY (Scatter) ");
          }
        }
      }
    }
    v23 = objc_loadWeakRetained((id *)p_mChart);
    v24 = objc_msgSend(v23, "is3D");

    if (v24)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("3-D "), v8);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%ld"), v8, a3 + 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)setLastCachedName:(id)a3
{
  CHDDataValue *v5;
  CHDDataValue **p_mLastCachedName;
  CHDDataValue *mLastCachedName;
  CHDDataValue *v8;

  v5 = (CHDDataValue *)a3;
  mLastCachedName = self->mLastCachedName;
  p_mLastCachedName = &self->mLastCachedName;
  if (mLastCachedName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mLastCachedName, a3);
    v5 = v8;
  }

}

- (void)setDateTimeFormattingFlag:(BOOL)a3
{
  self->mDateTimeFormattingFlag = a3;
}

- (BOOL)isDateTimeFormattingFlag
{
  return self->mDateTimeFormattingFlag;
}

- (id)errorBarYAxis
{
  return self->mErrorBarY;
}

- (id)chart
{
  return objc_loadWeakRetained((id *)&self->mChart);
}

- (void)setErrorBar:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    if (objc_msgSend(v12, "direction") == 1)
      -[CHDSeries setErrorBarYAxis:](self, "setErrorBarYAxis:", v12);
    else
      -[CHDSeries setErrorBarXAxis:](self, "setErrorBarXAxis:", v12);
    objc_msgSend(v12, "minusValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
      objc_msgSend(WeakRetained, "processors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "minusValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "markObject:processor:", v7, objc_opt_class());

    }
    objc_msgSend(v12, "plusValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_loadWeakRetained((id *)&self->mChart);
      objc_msgSend(v9, "processors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "plusValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "markObject:processor:", v11, objc_opt_class());

    }
  }

}

- (void)setErrorBarYAxis:(id)a3
{
  CHDErrorBar *v5;
  CHDErrorBar **p_mErrorBarY;
  CHDErrorBar *mErrorBarY;
  CHDErrorBar *v8;

  v5 = (CHDErrorBar *)a3;
  mErrorBarY = self->mErrorBarY;
  p_mErrorBarY = &self->mErrorBarY;
  if (mErrorBarY != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mErrorBarY, a3);
    v5 = v8;
  }

}

- (void)setDefaultDataLabel:(id)a3
{
  CHDDataLabel *v5;
  CHDDataLabel **p_mDefaultDataLabel;
  CHDDataLabel *mDefaultDataLabel;
  CHDDataLabel *v8;

  v5 = (CHDDataLabel *)a3;
  mDefaultDataLabel = self->mDefaultDataLabel;
  p_mDefaultDataLabel = &self->mDefaultDataLabel;
  if (mDefaultDataLabel != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDefaultDataLabel, a3);
    v5 = v8;
  }

}

- (id)chartType
{
  return objc_loadWeakRetained((id *)&self->mChartType);
}

- (id)shallowCopy
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->mChart);
  objc_msgSend(v3, "seriesWithChart:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "setStyleIndex:", self->mStyleIndex);
    objc_msgSend(v5, "setOrder:", self->mOrder);
    objc_msgSend(v5, "setDefaultDataLabel:", self->mDefaultDataLabel);
    objc_msgSend(v5, "setDateTimeFormattingFlag:", self->mDateTimeFormattingFlag);
    v6 = objc_loadWeakRetained((id *)&self->mChartType);
    objc_msgSend(v5, "setChartType:", v6);

    v7 = v5;
  }

  return v5;
}

+ (id)seriesWithChart:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithChart:", v3);

  return v4;
}

- (id)trendlineCollection
{
  return self->mTrendlinesCollection;
}

- (void)setTrendlineCollection:(id)a3
{
  EDCollection *v5;
  EDCollection **p_mTrendlinesCollection;
  EDCollection *mTrendlinesCollection;
  EDCollection *v8;

  v5 = (EDCollection *)a3;
  mTrendlinesCollection = self->mTrendlinesCollection;
  p_mTrendlinesCollection = &self->mTrendlinesCollection;
  if (mTrendlinesCollection != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mTrendlinesCollection, a3);
    v5 = v8;
  }

}

- (id)errorBarXAxis
{
  return self->mErrorBarX;
}

- (void)setErrorBarXAxis:(id)a3
{
  CHDErrorBar *v5;
  CHDErrorBar **p_mErrorBarX;
  CHDErrorBar *mErrorBarX;
  CHDErrorBar *v8;

  v5 = (CHDErrorBar *)a3;
  mErrorBarX = self->mErrorBarX;
  p_mErrorBarX = &self->mErrorBarX;
  if (mErrorBarX != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mErrorBarX, a3);
    v5 = v8;
  }

}

- (void)clearBackPointers
{
  objc_storeWeak((id *)&self->mChart, 0);
  objc_storeWeak((id *)&self->mChartType, 0);
}

- (unint64_t)categoryCount
{
  unint64_t result;

  result = (unint64_t)self->mValueData;
  if (result)
    return objc_msgSend((id)result, "countOfCellsBeingReferenced");
  return result;
}

- (void)setDataValuePropertiesCollection:(id)a3
{
  EDKeyedCollection *v5;
  EDKeyedCollection **p_mDataValuePropertiesCollection;
  EDKeyedCollection *mDataValuePropertiesCollection;
  EDKeyedCollection *v8;

  v5 = (EDKeyedCollection *)a3;
  mDataValuePropertiesCollection = self->mDataValuePropertiesCollection;
  p_mDataValuePropertiesCollection = &self->mDataValuePropertiesCollection;
  if (mDataValuePropertiesCollection != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDataValuePropertiesCollection, a3);
    v5 = v8;
  }

}

- (void)setHiddenFlag:(BOOL)a3
{
  self->mHiddenFlag = a3;
}

- (unint64_t)order
{
  return self->mOrder;
}

- (BOOL)hasTrendlines
{
  EDCollection *mTrendlinesCollection;

  mTrendlinesCollection = self->mTrendlinesCollection;
  if (mTrendlinesCollection)
    LOBYTE(mTrendlinesCollection) = -[EDCollection count](mTrendlinesCollection, "count") != 0;
  return (char)mTrendlinesCollection;
}

- (BOOL)hasErrorBars
{
  return self->mErrorBarX || self->mErrorBarY != 0;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDSeries;
  -[CHDSeries description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
  objc_storeStrong((id *)&self->mDefaultDataLabel, 0);
  objc_storeStrong((id *)&self->mErrorBarY, 0);
  objc_storeStrong((id *)&self->mErrorBarX, 0);
  objc_storeStrong((id *)&self->mTrendlinesCollection, 0);
  objc_storeStrong((id *)&self->mDataValuePropertiesCollection, 0);
  objc_storeStrong((id *)&self->mCategoryData, 0);
  objc_storeStrong((id *)&self->mValueData, 0);
  objc_storeStrong((id *)&self->mLastCachedName, 0);
  objc_storeStrong((id *)&self->mName, 0);
  objc_destroyWeak((id *)&self->mChartType);
  objc_destroyWeak((id *)&self->mChart);
}

@end
