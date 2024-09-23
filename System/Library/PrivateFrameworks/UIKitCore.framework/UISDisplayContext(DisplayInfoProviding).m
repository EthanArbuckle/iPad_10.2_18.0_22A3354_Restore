@implementation UISDisplayContext(DisplayInfoProviding)

- (double)homeAffordanceOverlayAllowance
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "displayEdgeInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "homeAffordanceOverlayAllowance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)systemMinimumMargin
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "displayEdgeInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "systemMinimumMargin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)safeAreaInsetsPortrait
{
  void *v1;
  void *v2;
  double v3;

  objc_msgSend(a1, "displayEdgeInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeAreaInsetsPortrait");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper(v2);

  return v3;
}

- (double)peripheryInsets
{
  void *v1;
  void *v2;
  double v3;

  objc_msgSend(a1, "displayEdgeInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "peripheryInsets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper(v2);

  return v3;
}

- (double)safeAreaInsetsLandscapeLeft
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  objc_msgSend(a1, "displayEdgeInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsetsLandscapeLeft");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "displayEdgeInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "safeAreaInsetsLandscapeLeft");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "safeAreaInsetsLandscapeRight");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "displayEdgeInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v7)
      objc_msgSend(v8, "safeAreaInsetsLandscapeRight");
    else
      objc_msgSend(v8, "safeAreaInsetsPortrait");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  v10 = UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper(v6);

  return v10;
}

- (double)safeAreaInsetsPortraitUpsideDown
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;

  objc_msgSend(a1, "displayEdgeInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsetsPortraitUpsideDown");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "displayEdgeInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "safeAreaInsetsPortraitUpsideDown");
  else
    objc_msgSend(v4, "safeAreaInsetsPortrait");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper(v6);

  return v7;
}

- (double)safeAreaInsetsLandscapeRight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  objc_msgSend(a1, "displayEdgeInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsetsLandscapeRight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "displayEdgeInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "safeAreaInsetsLandscapeRight");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "safeAreaInsetsLandscapeLeft");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "displayEdgeInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v7)
      objc_msgSend(v8, "safeAreaInsetsLandscapeLeft");
    else
      objc_msgSend(v8, "safeAreaInsetsPortrait");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  v10 = UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper(v6);

  return v10;
}

@end
