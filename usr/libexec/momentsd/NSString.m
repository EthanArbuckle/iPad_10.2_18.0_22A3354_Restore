@implementation NSString

- (unint64_t)associatedEventPermission
{
  if (-[NSString isEqualToString:](self, "isEqualToString:", MOEventBundleSourceTypeContact[0]))
    return 10;
  if (-[NSString isEqualToString:](self, "isEqualToString:", MOEventBundleSourceTypeMedia[0]))
    return 4;
  if (-[NSString isEqualToString:](self, "isEqualToString:", MOEventBundleSourceTypePeopleContext[0]))
    return 23;
  if (-[NSString isEqualToString:](self, "isEqualToString:", MOEventBundleSourceTypePhoto[0]))
    return 5;
  if (-[NSString isEqualToString:](self, "isEqualToString:", MOEventBundleSourceTypeThirdPartyMedia[0]))
    return 4;
  if (-[NSString isEqualToString:](self, "isEqualToString:", MOEventBundleSourceTypeStateOfMind[0]))
    return 24;
  if (-[NSString isEqualToString:](self, "isEqualToString:", MOEventBundleSourceTypeVisitLocation[0]))
    return 1;
  if (-[NSString isEqualToString:](self, "isEqualToString:", MOEventBundleSourceTypeActivity))
    return 2;
  return 0;
}

- (id)mask
{
  __CFString *v3;
  void *v4;
  unint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  void *v9;
  void *v10;

  if (-[NSString length](self, "length"))
  {
    if ((id)-[NSString length](self, "length") == (id)1)
    {
      v3 = CFSTR("*");
    }
    else
    {
      if ((id)-[NSString length](self, "length") == (id)2)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self, "substringToIndex:", 1));
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@*"), v4));
      }
      else
      {
        v5 = (unint64_t)((double)-[NSString length](self, "length") * 0.499999);
        v6 = -[NSString length](self, "length");
        if ((v6 - v5) >> 1 <= 1)
          v7 = 1;
        else
          v7 = (v6 - v5) >> 1;
        v8 = -[NSString length](self, "length");
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](self, "substringToIndex:", v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_1002B68D0, "stringByPaddingToLength:withString:startingAtIndex:", v5, CFSTR("*"), 0));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](self, "substringFromIndex:", (char *)-[NSString length](self, "length") + v5 - v8 + v7));
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), v4, v9, v10));

      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
