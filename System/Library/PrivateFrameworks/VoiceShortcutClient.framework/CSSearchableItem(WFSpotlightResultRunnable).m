@implementation CSSearchableItem(WFSpotlightResultRunnable)

- (id)wf_shortcutsRunnableData
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "attributeSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  WFSpotlightResultRunnableAttributeKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "valueForCustomKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

@end
