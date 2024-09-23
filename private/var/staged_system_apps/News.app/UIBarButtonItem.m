@implementation UIBarButtonItem

- (id)fr_barButtonItemView
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(UIView, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIBarButtonItem valueForKey:](self, "valueForKey:", CFSTR("view")));
  v5 = FCDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

@end
