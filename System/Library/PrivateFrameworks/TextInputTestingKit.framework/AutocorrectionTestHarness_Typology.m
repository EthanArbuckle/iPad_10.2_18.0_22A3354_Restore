@implementation AutocorrectionTestHarness_Typology

- (id)makeErrorForTest:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "input");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "touches");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
