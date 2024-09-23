@implementation WFPosterPickerParameter

- (BOOL)shouldOnlyShowEligiblePhotosPosters
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  -[WFParameter definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("VisiblePosters"));
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

  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("EligiblePhotos"));
  return v6;
}

- (BOOL)handlesDefaultPoster
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  -[WFParameter definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HandlesDefaultPoster"));
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

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end
