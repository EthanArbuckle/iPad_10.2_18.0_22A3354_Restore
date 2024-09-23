@implementation NSURLRequest

- (BOOL)_nsurlsessionproxy_isSafeRequest
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLRequest URL](self, "URL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scheme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("http")) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("https"));

  return v5;
}

@end
