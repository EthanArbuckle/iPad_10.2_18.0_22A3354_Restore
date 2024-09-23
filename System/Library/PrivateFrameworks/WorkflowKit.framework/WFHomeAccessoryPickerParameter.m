@implementation WFHomeAccessoryPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)localizedLabelForState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "triggerActionSetsBuilder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasActions"))
    {
      objc_msgSend(v3, "actionSetsSummary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "summaryText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)allowsMultipleValues
{
  return 0;
}

@end
