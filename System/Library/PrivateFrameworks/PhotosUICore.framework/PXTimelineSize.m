@implementation PXTimelineSize

+ (id)sizeDescriptionForSizeClass:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Small");
  else
    return off_1E511B0C0[a3 - 1];
}

+ (CGSize)widgetSizeForSizeClass:(unint64_t)a3
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (a3 > 3)
  {
    v4 = 369.0;
    v3 = 384.0;
  }
  else
  {
    v3 = dbl_1A7C09398[a3];
    v4 = dbl_1A7C093B8[a3];
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  v8 = v4 * v7;
  v9 = v3 * v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (id)allSupportedSizes
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v2, "addObject:", &unk_1E53EB5C8);
  objc_msgSend(v2, "addObject:", &unk_1E53EB5E0);
  objc_msgSend(v2, "addObject:", &unk_1E53EB5F8);
  objc_msgSend(v2, "addObject:", &unk_1E53EB610);
  return v2;
}

@end
