@implementation TVRCUpNextInfo(TVRUIUpNextViewControllerAdditions)

- (BOOL)tvruiupnextvc_hasPercentComplete
{
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(a1, "timestamp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  return v3;
}

- (double)tvruiupnextvc_percentComplete
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  objc_msgSend(a1, "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "progress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    objc_msgSend(a1, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      return 0.0;
    objc_msgSend(a1, "mediaInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v8;
    if (v8)
    {
      objc_msgSend(v8, "duration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      objc_msgSend(a1, "timestamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v14 = v13 / 1000000000.0;

      if (v14 <= 0.0)
        v5 = 0.0;
      else
        v5 = v14 / v11;
    }
    else
    {
      v5 = 0.0;
    }
  }

  return v5;
}

- (uint64_t)tvruiupnextvc_minutesRemaining
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  objc_msgSend(a1, "mediaInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_6;
  objc_msgSend(a1, "timeRemaining");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(a1, "tvruiupnextvc_percentComplete");
    if (v7 > 0.0)
    {
      v8 = v7;
      objc_msgSend(v2, "duration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      v6 = (uint64_t)((v11 - v11 * v8) / 60.0);
      goto LABEL_7;
    }
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  objc_msgSend(a1, "timeRemaining");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = (uint64_t)(v5 / 60.0);

LABEL_7:
  return v6;
}

- (id)tvruiupnextvc_favoritesIdentifier
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "mediaInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "kind") == 1)
      objc_msgSend(v2, "showIdentifier");
    else
      objc_msgSend(v2, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
