@implementation UIInternalPreference

id _UIInternalPreference_ViewControllersInheritTraitsFromViewHierarchy_block_invoke_2(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "rangeOfString:options:", CFSTR("Controller"), 12);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v1, "substringToIndex:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

id _UIInternalPreference_ForceIOSDeviceInsets_block_invoke(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "parentModalViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(v1, "parentViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end
