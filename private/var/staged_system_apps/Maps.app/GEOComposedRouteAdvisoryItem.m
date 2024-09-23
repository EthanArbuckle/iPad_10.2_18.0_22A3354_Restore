@implementation GEOComposedRouteAdvisoryItem

- (void)updateModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteAdvisoryItem titleString](self, "titleString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringWithDefaultOptions"));
  objc_msgSend(v4, "setFirstLine:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteAdvisoryItem subtitleString](self, "subtitleString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringWithDefaultOptions"));
  objc_msgSend(v4, "setSecondLine:", v7);

}

@end
