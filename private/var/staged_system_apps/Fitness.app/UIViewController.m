@implementation UIViewController

- (id)ch_rootViewController
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController parentViewController](self, "parentViewController"));
  v4 = objc_opt_class(CHRootViewController, v3);
  if ((objc_opt_isKindOfClass(v2, v4) & 1) != 0)
    v5 = v2;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ch_rootViewController"));
  v6 = v5;

  return v6;
}

@end
