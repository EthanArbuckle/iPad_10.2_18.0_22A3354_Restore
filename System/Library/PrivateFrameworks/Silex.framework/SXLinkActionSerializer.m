@implementation SXLinkActionSerializer

- (id)URLForAction:(id)a3 type:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "conformsToProtocol:", &unk_254F563B8))
  {
    objc_msgSend(v5, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "URL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
