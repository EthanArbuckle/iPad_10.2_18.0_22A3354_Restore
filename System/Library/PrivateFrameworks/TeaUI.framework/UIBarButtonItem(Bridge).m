@implementation UIBarButtonItem(Bridge)

- (id)ts_compressibleBarButtonItemView
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "valueForKey:", CFSTR("view"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1 && objc_msgSend(v1, "conformsToProtocol:", &unk_1EEF537C0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)ts_barButtonItemView
{
  void *v1;
  id v2;

  objc_msgSend(a1, "valueForKey:", CFSTR("view"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

@end
