@implementation AVURLAsset

+ (id)rc_preciseTimingAssetWithURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSString *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class(a1));
  v9 = AVURLAssetPreferPreciseDurationAndTimingKey;
  v10 = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v7 = objc_msgSend(v5, "initWithURL:options:", v4, v6);

  return v7;
}

@end
