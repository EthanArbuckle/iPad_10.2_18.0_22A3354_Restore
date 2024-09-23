@implementation PLAssetFormats

+ (id)descriptionForImageFormat:(unsigned __int16)a3
{
  void *v3;
  __CFString *v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shortDescription");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("0-PLUnknownImageFormat");
  }
  return v4;
}

+ (CGSize)sizeForFormat:(unsigned __int16)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "size");
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v5 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

@end
