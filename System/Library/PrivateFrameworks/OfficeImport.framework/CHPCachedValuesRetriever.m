@implementation CHPCachedValuesRetriever

- (BOOL)isObjectSupported:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    objc_msgSend(v3, "formula");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  EDCellHeader *v14;
  EDCellHeader *v15;
  uint64_t *v16;
  EDResources *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  EDValue v23;
  uint64_t v24;
  CsData v25;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v8, "dataValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formula");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "references");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "count");
  CsData::CsData(&v25);
  v21 = v7;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mWorkbook);
  +[EDReferenceIterator referenceIteratorWithReferenceArray:workbook:](EDReferenceIterator, "referenceIteratorWithReferenceArray:workbook:", v22, WeakRetained);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  while (1)
  {
    v14 = (EDCellHeader *)objc_msgSend(v13, "nextCell", v21);
    v15 = v14;
    if (!v14)
      break;
    if (v11)
    {
      v16 = (uint64_t *)objc_msgSend(v9, "dataPointAtIndex:", objc_msgSend(v13, "currentCellIndex"));
      if (v16)
      {
LABEL_8:
        v17 = (EDResources *)objc_loadWeakRetained((id *)&self->super.mResources);
        styleForEDCell(v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v18, "contentFormat");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v18, "contentFormat");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v16[3] = objc_msgSend(v20, "formatId");

          }
        }
        if (!v11)
          objc_msgSend(v9, "addDataPoint:", v16);

      }
    }
    else if (typeForEDCell(v14))
    {
      EDValue::makeFromCell((EDValue *)v15, (uint64_t)&v23);
      EDValue::operator=((uint64_t)&v25, &v23.type);
      EDValue::~EDValue(&v23);
      v24 = objc_msgSend(v13, "currentCellIndex");
      v26 = 0;
      v16 = &v24;
      goto LABEL_8;
    }
  }

  EDValue::~EDValue((EDValue *)&v25);
}

@end
