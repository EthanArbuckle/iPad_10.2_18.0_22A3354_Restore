@implementation CHDData

+ (CHDData)dataWithResources:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v3);

  return (CHDData *)v4;
}

- (CHDData)initWithResources:(id)a3
{
  id v4;
  CHDData *v5;
  CHDData *v6;
  CHDDataValuesCollection *v7;
  CHDDataValuesCollection *mDataValues;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CHDData;
  v5 = -[CHDData init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v7 = objc_alloc_init(CHDDataValuesCollection);
    mDataValues = v6->mDataValues;
    v6->mDataValues = v7;

    *(_OWORD *)&v6->mContentFormatId = xmmword_22A4C1930;
  }

  return v6;
}

- (id)formula
{
  return self->mFormula;
}

- (id)dataValues
{
  return self->mDataValues;
}

+ (CHDData)dataWithDataPointCount:(unint64_t)a3 resources:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDataPointCount:resources:", a3, v5);

  return (CHDData *)v6;
}

- (CHDData)initWithDataPointCount:(unint64_t)a3 resources:(id)a4
{
  id v6;
  CHDData *v7;
  CHDData *v8;
  CHDDataValuesCollection *v9;
  CHDDataValuesCollection *mDataValues;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHDData;
  v7 = -[CHDData init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->mResources, v6);
    v9 = -[CHDDataValuesCollection initWithDataPointCount:]([CHDDataValuesCollection alloc], "initWithDataPointCount:", a3);
    mDataValues = v8->mDataValues;
    v8->mDataValues = v9;

    *(_OWORD *)&v8->mContentFormatId = xmmword_22A4C1930;
  }

  return v8;
}

- (void)setFormula:(id)a3 chart:(id)a4
{
  id v7;
  CHDFormula **p_mFormula;
  CHDFormula *mFormula;
  void *v10;
  CHDFormula *v11;

  v11 = (CHDFormula *)a3;
  v7 = a4;
  mFormula = self->mFormula;
  p_mFormula = &self->mFormula;
  if (mFormula != v11)
  {
    objc_storeStrong((id *)p_mFormula, a3);
    if (*p_mFormula)
    {
      objc_msgSend(v7, "processors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "markObject:processor:", v11, objc_opt_class());

    }
  }

}

- (void)setDataValueIndexCount:(unint64_t)a3
{
  self->mDataValueIndexCount = a3;
}

- (void)setContentFormatId:(unint64_t)a3
{
  self->mContentFormatId = a3;
}

- (BOOL)isEmpty
{
  CHDFormula *mFormula;

  mFormula = self->mFormula;
  return (!mFormula || !-[EDFormula isSupportedFormula](mFormula, "isSupportedFormula"))
      && -[CHDData dataValueIndexCount](self, "dataValueIndexCount") == 0;
}

- (id)contentFormat
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "contentFormats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectWithKey:", self->mContentFormatId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)dataValueIndexCount
{
  unint64_t v3;
  unint64_t result;

  v3 = -[CHDDataValuesCollection count](self->mDataValues, "count");
  result = self->mDataValueIndexCount;
  if (v3 > result)
  {
    result = -[CHDDataValuesCollection count](self->mDataValues, "count");
    self->mDataValueIndexCount = result;
  }
  return result;
}

- (unint64_t)countOfCellsBeingReferenced
{
  void *v3;

  -[CHDFormula references](self->mFormula, "references");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return -[CHDFormula countOfCellsBeingReferenced](self->mFormula, "countOfCellsBeingReferenced");
  else
    return -[CHDData dataValueIndexCount](self, "dataValueIndexCount");
}

- (void)setContentFormat:(id)a3
{
  unint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "formatId");
  if (v4 == -1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    objc_msgSend(WeakRetained, "contentFormats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v6, "addOrEquivalentObject:", v8));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->mContentFormatId = objc_msgSend(v7, "formatId");

  }
  else
  {
    self->mContentFormatId = v4;
  }

}

- (CGPoint)minMaxValues
{
  double v3;
  double v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  CHDDataPoint *v10;
  EDValue *p_value;
  double v12;
  _BOOL4 v13;
  _BOOL4 v14;
  double v15;
  double v16;
  CGPoint result;

  v3 = *MEMORY[0x24BDBEFB0];
  v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v5 = -[CHDDataValuesCollection count](self->mDataValues, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 2.22507386e-308;
    v9 = 2.22507386e-308;
    while (1)
    {
      v10 = -[CHDDataValuesCollection dataPointAtIndex:](self->mDataValues, "dataPointAtIndex:", v7);
      if (v10)
      {
        p_value = &v10->value;
        if (CsLeReadSInt32((unsigned int *)&v10->value) == 2)
        {
          v12 = EDValue::numberValue(p_value);
          if (v9 == 2.22507386e-308 && v8 == 2.22507386e-308)
          {
            v9 = v12;
          }
          else if (v12 <= v8)
          {
            if (v12 < v9)
              v9 = v12;
            goto LABEL_10;
          }
          v8 = v12;
        }
      }
LABEL_10:
      if (v6 == ++v7)
        goto LABEL_15;
    }
  }
  v9 = 2.22507386e-308;
  v8 = 2.22507386e-308;
LABEL_15:
  v13 = v9 != 2.22507386e-308;
  v14 = v8 != 2.22507386e-308;
  if (v13 && v14)
    v15 = v9;
  else
    v15 = v3;
  if (v13 && v14)
    v16 = v8;
  else
    v16 = v4;
  result.y = v16;
  result.x = v15;
  return result;
}

- (unint64_t)averageDataPointDecimalCount
{
  unint64_t result;
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  CHDDataPoint *v7;
  EDValue *p_value;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  result = -[CHDDataValuesCollection count](self->mDataValues, "count");
  if (result)
  {
    v4 = result;
    v5 = 0;
    v17 = 0;
    for (i = 0; i != v4; ++i)
    {
      v7 = -[CHDDataValuesCollection dataPointAtIndex:](self->mDataValues, "dataPointAtIndex:", i);
      if (v7)
      {
        p_value = &v7->value;
        if (CsLeReadSInt32((unsigned int *)&v7->value) == 2)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", EDValue::numberValue(p_value));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = objc_msgSend(v10, "rangeOfString:", CFSTR("."));
          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v12 = objc_msgSend(v10, "length");
            v13 = v12 + ~v11;
            if (v13 >= 0xF)
            {
              objc_msgSend(v10, "substringWithRange:", 0, objc_msgSend(v10, "length") - 1);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v14, "hasSuffix:", CFSTR("0")))
              {
                v13 = v12 - v11 - 2;
                while (objc_msgSend(v14, "hasSuffix:", CFSTR("0")))
                {
                  objc_msgSend(v14, "substringWithRange:", 0, objc_msgSend(v14, "length") - 1);
                  v15 = objc_claimAutoreleasedReturnValue();

                  --v13;
                  v14 = (void *)v15;
                }
              }
              else if (objc_msgSend(v14, "hasSuffix:", CFSTR("9")))
              {
                while (objc_msgSend(v14, "hasSuffix:", CFSTR("9")))
                {
                  objc_msgSend(v14, "substringWithRange:", 0, objc_msgSend(v14, "length") - 1);
                  v16 = objc_claimAutoreleasedReturnValue();

                  --v13;
                  v14 = (void *)v16;
                }
              }
              v10 = v14;
            }
            v5 += v13;
          }
          ++v17;

        }
      }
    }
    if (v17)
      return vcvtas_u32_f32((float)v5 / (float)v17);
    else
      return 0;
  }
  return result;
}

- (id)firstValueContentFormatWithWorkbook:(id)a3
{
  id v4;
  CHDFormula *mFormula;
  void *v6;
  void *v7;
  void *v8;
  CHDDataPoint *v9;
  EDResources *WeakRetained;
  void *v11;

  v4 = a3;
  mFormula = self->mFormula;
  if (mFormula)
  {
    -[CHDFormula references](mFormula, "references");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CHDFormula references](self->mFormula, "references");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDReferenceIterator referenceIteratorWithReferenceArray:workbook:](EDReferenceIterator, "referenceIteratorWithReferenceArray:workbook:", v7, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (CHDDataPoint *)objc_msgSend(v8, "nextCell");
      if (!v9)
      {
LABEL_9:

        goto LABEL_11;
      }
      WeakRetained = (EDResources *)objc_loadWeakRetained((id *)&self->mResources);
      styleForEDCell((EDCellHeader *)v9, WeakRetained);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contentFormat");
      v9 = (CHDDataPoint *)objc_claimAutoreleasedReturnValue();

LABEL_8:
      goto LABEL_9;
    }
  }
  if (!-[CHDDataValuesCollection count](self->mDataValues, "count"))
  {
    v9 = 0;
    goto LABEL_11;
  }
  v9 = -[CHDDataValuesCollection dataPointAtIndex:](self->mDataValues, "dataPointAtIndex:", 0);
  if (v9)
  {
    v8 = objc_loadWeakRetained((id *)&self->mResources);
    objc_msgSend(v8, "contentFormats");
    WeakRetained = (EDResources *)objc_claimAutoreleasedReturnValue();
    -[EDResources objectWithKey:](WeakRetained, "objectWithKey:", v9->contentFormatId);
    v9 = (CHDDataPoint *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_11:

  return v9;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDData;
  -[CHDData description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mResources);
  objc_storeStrong((id *)&self->mFormula, 0);
  objc_storeStrong((id *)&self->mDataValues, 0);
}

- (unint64_t)contentFormatId
{
  return self->mContentFormatId;
}

@end
