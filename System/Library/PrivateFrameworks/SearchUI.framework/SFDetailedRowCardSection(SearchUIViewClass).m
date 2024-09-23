@implementation SFDetailedRowCardSection(SearchUIViewClass)

- (uint64_t)_searchUIViewClass
{
  return objc_opt_class();
}

- (id)_searchUIHorizontalViewClass
{
  void *v1;
  double v2;
  double v3;
  void *v4;

  objc_msgSend(a1, "thumbnail");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "size");
  v3 = v2;

  if (v3 <= 150.0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
