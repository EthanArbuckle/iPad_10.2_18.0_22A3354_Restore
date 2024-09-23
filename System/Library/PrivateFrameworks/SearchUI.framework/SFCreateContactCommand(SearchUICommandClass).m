@implementation SFCreateContactCommand(SearchUICommandClass)

- (id)_searchUICommandHandlerClass
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "person");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v1 = (void *)objc_opt_class();
  v3 = v1;

  return v3;
}

@end
