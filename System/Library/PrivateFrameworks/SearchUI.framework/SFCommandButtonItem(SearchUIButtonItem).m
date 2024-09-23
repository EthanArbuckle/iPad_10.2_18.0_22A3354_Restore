@implementation SFCommandButtonItem(SearchUIButtonItem)

- (id)_searchUIButtonItemGeneratorClass
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "command");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "_searchUIButtonItemGeneratorClass");
  if (!v2)
    v2 = (void *)objc_opt_class();
  v3 = v2;

  return v3;
}

@end
