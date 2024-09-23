@implementation CHPValueAxisFormatting

- (BOOL)isObjectSupported:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v6 = a3;
  v18 = a4;
  v19 = v6;
  objc_msgSend(v19, "axes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = 0;
  v10 = 0;
  while (1)
  {
    v11 = v10;
    if (objc_msgSend(v7, "count", v18) <= (unint64_t)v10)
      break;
    objc_msgSend(v7, "objectAtIndex:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;

      objc_msgSend(v13, "contentFormat");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v14, "formatString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPercentageFormattingFlag:", -[CHPValueAxisFormatting isPercentageFormattingInContentFormatString:edValue:](self, "isPercentageFormattingInContentFormatString:edValue:", v15, 0));

      }
    }
    else
    {
      v13 = v8;
      v14 = v9;
    }

    v10 = v11 + 1;
    v8 = v13;
    v9 = v14;
  }
  if (v8 && !v9)
  {
    if ((objc_msgSend(v8, "isPercentageFormattingFlag") & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v19, "seriesCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHPValueAxisFormatting dataPointFormattingInSeriesCollection:](self, "dataPointFormattingInSeriesCollection:", v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v8, "setContentFormat:", v9);
        objc_msgSend(v8, "setIsContentFormatDerivedFromDataPoints:", 1);
        objc_msgSend(v9, "formatString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPercentageFormattingFlag:", -[CHPValueAxisFormatting isPercentageFormattingInContentFormatString:edValue:](self, "isPercentageFormattingInContentFormatString:edValue:", v17, 0));

      }
    }
  }

}

- (id)dataPointFormattingInSeriesCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "count"))
    {
      v6 = objc_msgSend(v5, "count");
      if (v6)
      {
        v7 = 0;
        v8 = 0;
        while (1)
        {
          objc_msgSend(v5, "objectAtIndex:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "valueData");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[CHPValueAxisFormatting dataPointFormattingInData:](self, "dataPointFormattingInData:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            break;
          if (v7)
          {
            if ((objc_msgSend(v11, "isEqual:", v7) & 1) == 0)
              break;
          }
          else
          {
            v7 = v11;
          }

          if (v6 == ++v8)
            goto LABEL_14;
        }

      }
    }
  }
  v7 = 0;
LABEL_14:

  return v7;
}

- (id)dataPointFormattingInData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "contentFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[CHPValueAxisFormatting dataPointFormattingInSources:](self, "dataPointFormattingInSources:", v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isPercentageFormattingInContentFormatString:(id)a3 edValue:(EDValue *)a4
{
  EDString *v5;
  double v6;
  XlFormatSection *v7;
  BOOL v8;

  v5 = (EDString *)a3;
  v6 = 1.0;
  if (a4 && CsLeReadSInt32((unsigned int *)a4) == 2)
    v6 = EDValue::numberValue(a4);
  v7 = (XlFormatSection *)xlSectionForNumberWithFormatting(v6, v5, 0);
  if (v7)
  {
    v8 = *((_BYTE *)v7 + 5) != 0;
    XlFormatSection::~XlFormatSection(v7);
    MEMORY[0x22E2DD408]();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)dataPointFormattingInSources:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "dataValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = 0;
    v8 = 0;
    while (1)
    {
      v9 = objc_msgSend(v5, "dataPointAtIndex:", v7);
      if (v9)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
        objc_msgSend(WeakRetained, "contentFormats");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectWithKey:", *(_QWORD *)(v9 + 24));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          goto LABEL_14;
        if (v8)
        {
          if ((objc_msgSend(v12, "isEqual:", v8) & 1) == 0)
          {
LABEL_14:

            v13 = 0;
            goto LABEL_15;
          }
        }
        else
        {
          v8 = v12;
        }

      }
      if (v6 == ++v7)
        goto LABEL_13;
    }
  }
  v8 = 0;
LABEL_13:
  v8 = v8;
  v13 = v8;
LABEL_15:

  return v13;
}

@end
