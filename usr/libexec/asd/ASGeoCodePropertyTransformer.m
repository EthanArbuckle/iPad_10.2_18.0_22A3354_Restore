@implementation ASGeoCodePropertyTransformer

+ (id)allowedTopLevelClasses
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v2 = objc_opt_self(CLLocation);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v10[0] = v3;
  v4 = objc_opt_self(CNPostalAddress);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v10[1] = v5;
  v6 = objc_opt_self(NSNull);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v10[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 3));

  return v8;
}

@end
