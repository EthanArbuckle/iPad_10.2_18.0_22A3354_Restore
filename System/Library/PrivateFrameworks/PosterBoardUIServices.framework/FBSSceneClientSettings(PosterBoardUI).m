@implementation FBSSceneClientSettings(PosterBoardUI)

- (uint64_t)pruis_switcherLayoutMode
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 25612);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  return v7;
}

- (uint64_t)pruis_switcherContextID
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 25613);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = objc_msgSend(v6, "unsignedLongLongValue");
  return v7;
}

- (double)pruis_primaryPosterScale
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 25614);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (double)pruis_primaryPosterOffset
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 25615);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "CGPointValue");
  v8 = v7;

  return v8;
}

@end
