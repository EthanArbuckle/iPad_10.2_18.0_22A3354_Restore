@implementation SCRCPhotoEvaluatorLuminance

+ (id)detect:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SCRCPhotoEvaluatorResultLuminance *v10;
  SCRCPhotoEvaluatorResultLuminance *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 *v32;
  int v33;
  int v34;
  int v35;
  unsigned int v36;
  double v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  if (CGRectIsEmpty(v38))
    goto LABEL_4;
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  if (CGRectIsNull(v39)
    || (v40.origin.x = x, v40.origin.y = y, v40.size.width = width, v40.size.height = height, CGRectIsInfinite(v40)))
  {
LABEL_4:
    objc_msgSend(a1, "detect:", v9);
    v10 = (SCRCPhotoEvaluatorResultLuminance *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_msgSend(v9, "data");
    v14 = objc_msgSend(v9, "bytesPerPixel");
    v15 = objc_msgSend(v9, "width");
    v16 = objc_msgSend(v9, "height");
    v17 = (uint64_t)width;
    v18 = (uint64_t)height;
    v19 = (uint64_t)y;
    v20 = v15 - (uint64_t)width;
    if (v20 >= (uint64_t)x)
      v20 = (uint64_t)x;
    if ((uint64_t)x >= 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v16 - v18;
    if (v16 - v18 >= v19)
      v22 = (uint64_t)y;
    if (v19 >= 0)
      v23 = v22;
    else
      v23 = 0;
    if (v17 < 1)
    {
      v29 = 0;
      v28 = 0;
      v27 = 0;
      v26 = 0;
      v25 = 0;
    }
    else
    {
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v30 = v13 + v14 * (v21 + v23 * v15) + 2;
      do
      {
        v31 = (uint64_t)height;
        v32 = (unsigned __int8 *)v30;
        if (v18 >= 1)
        {
          do
          {
            v33 = *(v32 - 2);
            v34 = *(v32 - 1);
            v35 = *v32;
            v29 += v33;
            v28 += v34;
            v27 += v35;
            v36 = v34 + v33 + v35;
            if (v36 < 0xC0)
              ++v26;
            if (v36 > 0x242)
              ++v25;
            v32 += v15 * v14;
            --v31;
          }
          while (v31);
        }
        ++v24;
        v30 += v14;
      }
      while (v24 != v17);
    }
    v37 = (double)(v17 * v18);
    v10 = -[SCRCPhotoEvaluatorResultLuminance initWithDarknessLevel:brightnessLevel:averageLevel:]([SCRCPhotoEvaluatorResultLuminance alloc], "initWithDarknessLevel:brightnessLevel:averageLevel:", (double)v26 / v37, (double)v25 / v37, ((double)v29 / (v37 * 255.0) + (double)v28 / (v37 * 255.0) + (double)v27 / (v37 * 255.0)) / 3.0);
  }
  v11 = v10;

  return v11;
}

@end
