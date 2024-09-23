@implementation _UIPageCurl

+ (void)be_swizzlePageCurlFilter
{
  if (qword_3C1A18 != -1)
    dispatch_once(&qword_3C1A18, &stru_377AE0);
}

- (id)bepageCurlHack_newAnimationForState:(id)a3 withKeyPath:(id)a4 duration:(double)a5 fromValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BEPageCurlConfig shared](BEPageCurlConfig, "shared"));
  v14 = v13;
  if (a5 == 0.4)
  {
    objc_msgSend(v13, "tapAnimationDuration");
    v16 = v15;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pageCurlDelegate"));
    objc_msgSend(v17, "interactiveAnimationDuration");
    v16 = v18;

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_UIPageCurl bepageCurlHack_newAnimationForState:withKeyPath:duration:fromValue:](self, "bepageCurlHack_newAnimationForState:withKeyPath:duration:fromValue:", v12, v11, v10, v16));

  return v19;
}

- (id)bepageCurlHack_newFilter
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_UIPageCurl bepageCurlHack_newFilter](self, "bepageCurlHack_newFilter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BEPageCurlConfig shared](BEPageCurlConfig, "shared"));
  objc_msgSend(v3, "applyToFilter:", v2);

  return v2;
}

@end
