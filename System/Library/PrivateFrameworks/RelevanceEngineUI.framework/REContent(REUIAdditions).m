@implementation REContent(REUIAdditions)

- (id)summaryTextProvider
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "objectForKey:", CFSTR("REUISummaryTextProviderKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(a1, "description1TextProvider");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (uint64_t)setSummaryTextProvider:()REUIAdditions
{
  return objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("REUISummaryTextProviderKey"));
}

- (id)summaryImageProvider
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("REUISummaryImageProviderKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (uint64_t)setSummaryImageProvider:()REUIAdditions
{
  return objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("REUISummaryImageProviderKey"));
}

- (id)circularTempate
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("REUICircularTemplateKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (void)setCircularTempate:()REUIAdditions
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setObject:forKey:", v4, CFSTR("REUICircularTemplateKey"));

}

- (id)gaugeProvider
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:", CFSTR("REUIGaugeProviderKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (void)setGaugeProvider:()REUIAdditions
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setObject:forKey:", v4, CFSTR("REUIGaugeProviderKey"));

}

@end
