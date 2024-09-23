@implementation AVMetadataItem(TVPAdditions)

- (id)tvp_numberValue
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "value");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    v3 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v1, "doubleValue");
    objc_msgSend(v3, "numberWithDouble:");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v2;
LABEL_7:

  return v4;
}

@end
