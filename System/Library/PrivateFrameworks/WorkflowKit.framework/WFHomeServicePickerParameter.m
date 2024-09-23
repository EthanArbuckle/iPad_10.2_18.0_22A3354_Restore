@implementation WFHomeServicePickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)localizedLabelForState:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(a3, "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)allowsMultipleValues
{
  return 0;
}

@end
