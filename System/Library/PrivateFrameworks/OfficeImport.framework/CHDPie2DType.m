@implementation CHDPie2DType

- (CHDPie2DType)initWithChart:(id)a3
{
  CHDPie2DType *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHDPie2DType;
  result = -[CHDChartType initWithChart:](&v4, sel_initWithChart_, a3);
  if (result)
  {
    *((_DWORD *)&result->super.mVaryColors + 1) = 0;
    LOBYTE(result->mFirstSliceAngle) = 0;
    BYTE1(result->mFirstSliceAngle) = 0;
    BYTE2(result->mFirstSliceAngle) = 0;
  }
  return result;
}

- (void)setFirstSliceAngle:(int)a3
{
  *((_DWORD *)&self->super.mVaryColors + 1) = a3;
}

- (BOOL)isDoughnutType
{
  return self->mFirstSliceAngle;
}

- (void)setDoughnutType:(BOOL)a3
{
  LOBYTE(self->mFirstSliceAngle) = a3;
}

- (void)setPieOfPieType:(BOOL)a3
{
  BYTE1(self->mFirstSliceAngle) = a3;
}

- (int)firstSliceAngle
{
  return *((_DWORD *)&self->super.mVaryColors + 1);
}

- (BOOL)isPieOfPieType
{
  return BYTE1(self->mFirstSliceAngle);
}

- (BOOL)isBarOfPieType
{
  return BYTE2(self->mFirstSliceAngle);
}

- (void)setBarOfPieType:(BOOL)a3
{
  BYTE2(self->mFirstSliceAngle) = a3;
}

- (int)defaultLabelPosition
{
  CHDDataLabel *mDefaultDataLabel;

  mDefaultDataLabel = self->super.mDefaultDataLabel;
  if (mDefaultDataLabel && -[CHDDataLabel position](mDefaultDataLabel, "position"))
    return -[CHDDataLabel position](self->super.mDefaultDataLabel, "position");
  else
    return 9;
}

- (id)contentFormat
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[CHDChartType seriesCollection](self, "seriesCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CHDChartType seriesCollection](self, "seriesCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "valueData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_10:

      return v8;
    }
    objc_msgSend(WeakRetained, "defaultDataLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(WeakRetained, "defaultDataLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentFormat");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        return v8;
    }
    else
    {

    }
  }
  -[CHDChartType defaultDataLabel](self, "defaultDataLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11
    || (-[CHDChartType defaultDataLabel](self, "defaultDataLabel"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "contentFormat"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v8))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super.mChart);
    objc_msgSend(WeakRetained, "defaultContentFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  return v8;
}

- (BOOL)hasExplosion
{
  uint64_t v2;
  uint64_t i;
  void *v4;
  char isKindOfClass;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  int v13;
  void *v15;
  void *v16;

  -[CHDChartType seriesCollection](self, "seriesCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v16, "count");
  if (v2)
  {
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v16, "objectAtIndex:", i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
        goto LABEL_14;
      v6 = v4;
      if ((int)objc_msgSend(v6, "explosion") >= 1)
      {

LABEL_14:
        goto LABEL_15;
      }
      objc_msgSend(v6, "dataValuePropertiesCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v4;
      v8 = v2;
      v9 = objc_msgSend(v7, "count", v15);
      if (v9)
      {
        v10 = 0;
        v11 = 1;
        while (1)
        {
          objc_opt_class();
          objc_msgSend(v7, "objectAtIndex:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "explosion");

          if (v13 >= 1)
            break;
          v11 = ++v10 < v9;
          if (v9 == v10)
            goto LABEL_9;
        }

        if (v11)
        {
          isKindOfClass = 1;
          goto LABEL_15;
        }
      }
      else
      {
LABEL_9:

      }
      v2 = v8;
    }
  }
  isKindOfClass = 0;
LABEL_15:

  return isKindOfClass & 1;
}

@end
