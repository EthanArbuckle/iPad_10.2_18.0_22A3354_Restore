@implementation CHPSeriesValueSynthesizer

- (BOOL)isObjectSupported:(id)a3
{
  id v3;
  id v4;
  void *v5;
  char v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "valueData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEmpty") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "categoryData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEmpty");

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v5;
  void *v6;
  CHDData *v7;
  CHDData *v8;
  id WeakRetained;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  EDValue *v13;
  EDValue v14;
  unint64_t v15;
  CsData v16;
  uint64_t v17;

  v5 = a3;
  objc_msgSend(v5, "valueData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryData");
  v7 = (CHDData *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = [CHDData alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
    v7 = -[CHDData initWithResources:](v8, "initWithResources:", WeakRetained);

    objc_msgSend(v5, "setCategoryData:", v7);
  }
  if (-[CHDData isEmpty](v7, "isEmpty"))
  {
    -[CHDData dataValues](v7, "dataValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "countOfCellsBeingReferenced");
    if (v11)
    {
      v12 = 1;
      do
      {
        CsData::CsData(&v16);
        v15 = v12 - 1;
        EDValue::makeWithNumber(v13, (double)v12, (uint64_t)&v14);
        EDValue::operator=((uint64_t)&v16, &v14.type);
        EDValue::~EDValue(&v14);
        v17 = -1;
        objc_msgSend(v10, "addDataPoint:", &v15);
        EDValue::~EDValue((EDValue *)&v16);
        ++v12;
      }
      while (v12 <= v11);
    }
    objc_msgSend(v10, "finishReading");

  }
}

@end
