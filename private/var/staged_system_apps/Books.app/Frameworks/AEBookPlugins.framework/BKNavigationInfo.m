@implementation BKNavigationInfo

+ (id)newEmptyNavigationInfo:(id)a3
{
  id v3;
  double v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  *(_QWORD *)&v4 = objc_opt_class(BKNavigationInfo).n128_u64[0];
  v6 = objc_msgSend(v3, "newByClass:", v5, v4);

  return v6;
}

+ (BOOL)isExcludedFromSampleHash:(id)a3
{
  id v3;

  return !objc_msgSend(a3, "rangeOfString:", CFSTR("com_apple_itunes_epub_end"))
      && v3 == objc_msgSend(CFSTR("com_apple_itunes_epub_end"), "length");
}

- (BOOL)isExcludedFromSample
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKNavigationInfo href](self, "href"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLFragmentString"));

  if (v3)
    v4 = +[BKNavigationInfo isExcludedFromSampleHash:](BKNavigationInfo, "isExcludedFromSampleHash:", v3);
  else
    v4 = 0;

  return v4;
}

@end
