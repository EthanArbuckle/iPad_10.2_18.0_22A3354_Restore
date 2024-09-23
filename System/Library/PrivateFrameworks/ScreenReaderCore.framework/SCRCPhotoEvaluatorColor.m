@implementation SCRCPhotoEvaluatorColor

+ (id)detect:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SCRCPhotoEvaluatorResultColor *v10;
  SCRCPhotoEvaluatorResultColor *v11;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 *v30;
  double v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  if (CGRectIsEmpty(v32))
    goto LABEL_4;
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  if (CGRectIsNull(v33)
    || (v34.origin.x = x, v34.origin.y = y, v34.size.width = width, v34.size.height = height, CGRectIsInfinite(v34)))
  {
LABEL_4:
    objc_msgSend(a1, "detect:", v9);
    v10 = (SCRCPhotoEvaluatorResultColor *)objc_claimAutoreleasedReturnValue();
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
      v28 = v13 + v14 * (v21 + v23 * v15) + 2;
      do
      {
        v29 = (uint64_t)height;
        v30 = (unsigned __int8 *)v28;
        if (v18 >= 1)
        {
          do
          {
            v27 += *(v30 - 2);
            v26 += *(v30 - 1);
            v25 += *v30;
            v30 += v15 * v14;
            --v29;
          }
          while (v29);
        }
        ++v24;
        v28 += v14;
      }
      while (v24 != v17);
    }
    v31 = (double)(v17 * v18) * 255.0;
    v10 = -[SCRCPhotoEvaluatorResultColor initWithRedLevel:blueLevel:greenLevel:]([SCRCPhotoEvaluatorResultColor alloc], "initWithRedLevel:blueLevel:greenLevel:", (double)v27 / v31, (double)v25 / v31, (double)v26 / v31);
  }
  v11 = v10;

  return v11;
}

@end
