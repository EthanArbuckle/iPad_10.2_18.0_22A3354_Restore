@implementation CHPSeriesNameSynthesizer

- (BOOL)isObjectSupported:(id)a3
{
  id v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "lastCachedName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v7 == 0;

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
  id v4;
  EDValue *v5;
  CHDDataValue *v6;
  EDValue v7;

  v4 = a3;
  objc_msgSend(v4, "defaultSeriesNameForIndex:", objc_msgSend(v4, "styleIndex"));
  v5 = (EDValue *)objc_claimAutoreleasedReturnValue();
  EDValue::makeWithNSString(v5, (uint64_t)&v7);

  v6 = -[CHDDataValue initWithIndex:value:]([CHDDataValue alloc], "initWithIndex:value:", -1, &v7);
  objc_msgSend(v4, "setLastCachedName:", v6);

  EDValue::~EDValue(&v7);
}

@end
