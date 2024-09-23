@implementation CHPSeriesDateTimeFormatting

- (BOOL)isObjectSupported:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      objc_msgSend(v4, "valueData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEmpty"))
      {
        objc_msgSend(v4, "categoryData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v8, "isEmpty") ^ 1;

      }
      else
      {
        LOBYTE(v7) = 1;
      }
    }
    else
    {
      objc_msgSend(v4, "valueData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEmpty") ^ 1;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "valueData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEmpty") & 1) == 0)
    objc_msgSend(v7, "setDateTimeFormattingFlag:", -[CHPSeriesDateTimeFormatting isDateTimeFomrattingInData:](self, "isDateTimeFomrattingInData:", v5));
  if ((objc_msgSend(v7, "isDateTimeFormattingFlag") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "categoryData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEmpty") & 1) == 0)
        objc_msgSend(v7, "setDateTimeFormattingFlag:", -[CHPSeriesDateTimeFormatting isDateTimeFomrattingInData:](self, "isDateTimeFomrattingInData:", v6));

    }
  }

}

- (BOOL)isDateTimeFomrattingInData:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  EDCellHeader *v13;
  EDResources *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  if ((objc_msgSend(v4, "isEmpty") & 1) != 0)
    goto LABEL_2;
  objc_msgSend(v4, "contentFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "formatString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CHPSeriesDateTimeFormatting isDateTimeFormattingInContentFormatString:edCell:](self, "isDateTimeFormattingInContentFormatString:edCell:", v8, 0);
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v4, "formula");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "formula");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "references");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->super.mWorkbook);
    +[EDReferenceIterator referenceIteratorWithReferenceArray:workbook:](EDReferenceIterator, "referenceIteratorWithReferenceArray:workbook:", v8, WeakRetained);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (EDCellHeader *)objc_msgSend(v12, "nextCell");
    if (v13)
    {
      v14 = (EDResources *)objc_loadWeakRetained((id *)&self->super.mResources);
      styleForEDCell(v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contentFormat");
      v16 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v16;
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v7, "formatString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CHPSeriesDateTimeFormatting isDateTimeFormattingInContentFormatString:edCell:](self, "isDateTimeFormattingInContentFormatString:edCell:", v17, v13);

    goto LABEL_10;
  }
LABEL_2:
  v5 = 0;
LABEL_11:

  return v5;
}

- (BOOL)isDateTimeFormattingInContentFormatString:(id)a3 edCell:(EDCellHeader *)a4
{
  EDString *v6;
  double v7;
  EDWorkbook *WeakRetained;
  XlFormatSection *v9;
  BOOL v10;

  v6 = (EDString *)a3;
  v7 = 1.0;
  if (a4 && typeForEDCell(a4) == 2)
    v7 = numberValueForEDCell(a4);
  WeakRetained = (EDWorkbook *)objc_loadWeakRetained((id *)&self->super.mWorkbook);
  v9 = (XlFormatSection *)xlSectionForNumberWithFormatting(v7, v6, WeakRetained);

  if (v9)
  {
    v10 = *((_BYTE *)v9 + 2) != 0;
    XlFormatSection::~XlFormatSection(v9);
    MEMORY[0x22E2DD408]();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
