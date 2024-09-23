@implementation SFCommandButtonItem(BATCHCOLLECTION)

- (id)_searchUI_requestAppClipCommand
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "command");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
