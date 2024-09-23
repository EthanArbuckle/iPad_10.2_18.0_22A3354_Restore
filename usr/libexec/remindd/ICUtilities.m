@implementation ICUtilities

+ (BOOL)isInternetReachable
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ICReachability sharedReachabilityForInternetConnection](ICReachability, "sharedReachabilityForInternetConnection"));
  v3 = objc_msgSend(v2, "currentReachabilityStatus");

  return v3 != 0;
}

@end
