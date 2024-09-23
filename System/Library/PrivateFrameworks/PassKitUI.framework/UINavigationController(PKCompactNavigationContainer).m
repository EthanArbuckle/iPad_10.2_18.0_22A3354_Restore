@implementation UINavigationController(PKCompactNavigationContainer)

- (id)pkui_compactNavigationContainer
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v5, "containedNavigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == a1)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

@end
