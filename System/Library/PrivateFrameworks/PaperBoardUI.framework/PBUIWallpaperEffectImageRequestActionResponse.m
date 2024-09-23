@implementation PBUIWallpaperEffectImageRequestActionResponse

- (int64_t)actualStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (CGSize)size
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGSizeValue");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 0;
  else
    return (id)*((_QWORD *)&off_1E6B94DE8 + a3 - 1);
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  CGSize v11;

  v6 = a4;
  v7 = v6;
  if (a5 == 2)
  {
    objc_msgSend(v6, "CGSizeValue");
    NSStringFromCGSize(v11);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a5 != 1)
    {
      v9 = 0;
      goto LABEL_7;
    }
    PBUIWallpaperStyleDescription(objc_msgSend(v6, "integerValue"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_7:

  return v9;
}

@end
