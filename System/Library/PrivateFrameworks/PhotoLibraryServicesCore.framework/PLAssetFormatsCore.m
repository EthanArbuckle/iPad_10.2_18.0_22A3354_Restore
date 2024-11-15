@implementation PLAssetFormatsCore

+ (CGSize)sizeForFormat:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a3 <= 4039)
  {
    switch(a3)
    {
      case 1095:
        v4 = 75.0;
        goto LABEL_18;
      case 1096:
        v4 = 150.0;
        goto LABEL_18;
      case 3039:
        v4 = 120.0;
        v3 = 160.0;
        break;
    }
  }
  else if (a3 > 5002)
  {
    if (a3 == 5003)
    {
      v4 = 256.0;
      goto LABEL_18;
    }
    if (a3 == 5005)
    {
      v4 = 360.0;
      goto LABEL_18;
    }
  }
  else
  {
    if (a3 == 4040)
    {
      v4 = 166.0;
      goto LABEL_18;
    }
    if (a3 == 4140)
    {
      v4 = 332.0;
LABEL_18:
      v3 = v4;
    }
  }
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)scaledSizeForSize:(CGSize)a3 format:(int64_t)a4 capLength:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v5 = a5;
  height = a3.height;
  width = a3.width;
  if (objc_msgSend(a1, "formatSizeIsShortSide:"))
  {
    objc_msgSend(a1, "sizeForFormat:", a4);
    if (v10 < v11)
      v10 = v11;
    if (v5)
      v12 = 5 * (int)v10;
    else
      v12 = 0x7FFFFFFFLL;
    v13 = PLScaleDimensionsForThumbnailCore((int)v10, (int)v10, v12, 2, (uint64_t)width, (uint64_t)height);
  }
  else
  {
    +[PLAssetFormatsCore sizeForFormat:](PLAssetFormatsCore, "sizeForFormat:", a4);
    v13 = PLScaledSizeWithinSizeCore(width, height, v15, v16);
  }
  result.height = v14;
  result.width = v13;
  return result;
}

+ (CGRect)centeredRectForSourceSize:(CGSize)a3 destinationSize:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v6 = PLScaledSizeWithinSizeCore(a3.width, a3.height, a4.width, a4.height);
  v8 = v7;
  v9 = floor((width - v6) * 0.5);
  v10 = floor((height - v7) * 0.5);
  result.size.height = v8;
  result.size.width = v6;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

+ (BOOL)formatSizeIsShortSide:(int64_t)a3
{
  return a3 == 5003 || a3 == 5005;
}

+ (int64_t)wildcatStackFormat
{
  pl_dispatch_once(&PLPhysicalScreenScale_didCheck, &__block_literal_global_133_3455);
  if (*(double *)&PLPhysicalScreenScale_screenScale <= 1.0)
    return 4040;
  else
    return 4140;
}

+ (int64_t)masterThumbnailFormat
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__PLAssetFormatsCore_masterThumbnailFormat__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (masterThumbnailFormat_s_onceToken != -1)
    dispatch_once(&masterThumbnailFormat_s_onceToken, v3);
  return masterThumbnailFormat_s_format;
}

void __43__PLAssetFormatsCore_masterThumbnailFormat__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;

  +[PLFormatChooser defaultFormatChooser](PLFormatChooser, "defaultFormatChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "masterThumbnailFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "formatID");

  v5 = v4;
  if (v4 != 5003)
  {
    if (v4 == 5005)
    {
      v5 = 5005;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PLAssetFormatsCore.m"), 174, CFSTR("Master thumb format %lu does not map to any DCIM formats"), v5);

      v5 = 5003;
    }
  }
  masterThumbnailFormat_s_format = v5;
}

@end
