@implementation CHPScatterWithStringValueX

- (BOOL)isObjectSupported:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;

  v3 = a3;
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
    v5 = objc_msgSend(v3, "isEmpty") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  unint64_t v8;
  unint64_t i;
  EDValue *v10;
  EDValue v11;
  unint64_t v12;
  CsData v13;

  v4 = a3;
  objc_msgSend(v4, "dataValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsStringValue");

  if (v6)
  {
    objc_msgSend(v4, "dataValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    objc_msgSend(v7, "resetWithDataPointCount:", v8);
    if (v8)
    {
      for (i = 1; i <= v8; ++i)
      {
        CsData::CsData(&v13);
        v12 = i - 1;
        EDValue::makeWithNumber(v10, (double)i, (uint64_t)&v11);
        EDValue::operator=((uint64_t)&v13, &v11.type);
        EDValue::~EDValue(&v11);
        objc_msgSend(v7, "addDataPoint:", &v12);
        EDValue::~EDValue((EDValue *)&v13);
      }
    }
    objc_msgSend(v7, "finishReading");
    objc_msgSend(v4, "setFormula:chart:", 0, 0);

  }
}

@end
