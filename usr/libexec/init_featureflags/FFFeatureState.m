@implementation FFFeatureState

- (id)name
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FFFeatureState domain](self, "domain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FFFeatureState feature](self, "feature"));
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@/%@"), v4, v5);

  return v6;
}

@end
