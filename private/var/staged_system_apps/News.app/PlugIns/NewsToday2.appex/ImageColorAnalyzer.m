@implementation ImageColorAnalyzer

+ (id)colorsForImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  id v14;
  id v15;
  uint64_t v16;
  void *k;
  uint64_t v18;
  id v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];

  v20 = a3;
  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "analyzeImage:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dominantColors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v5, "addObject:", v22);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v21;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v10 = objc_msgSend(v5, "copy", v20);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v29 != v12)
                objc_enumerationMutation(v10);
              if ((objc_msgSend(v4, "color:isCloseToOtherColor:", v9, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j)) & 1) != 0)
              {

                goto LABEL_16;
              }
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
            if (v11)
              continue;
            break;
          }
        }

        objc_msgSend(v5, "addObject:", v9);
LABEL_16:
        ;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v6);
  }

  if ((unint64_t)objc_msgSend(v5, "count") <= 7)
  {
    objc_msgSend(v5, "removeAllObjects");
    objc_msgSend(v5, "addObject:", v22);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = obj;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v25;
      do
      {
        for (k = 0; k != v15; k = (char *)k + 1)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v14);
          v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)k);
          if ((objc_msgSend(v4, "color:isCloseToOtherColor:", v18, v22, v20) & 1) == 0)
            objc_msgSend(v5, "addObject:", v18);
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v15);
    }

  }
  return v5;
}

- (void)analyzeImage:(id)a3
{
  CGImage *v4;
  CGColorSpace *SRGB;
  CGImageRef CopyWithColorSpace;
  CGImage *v7;
  CGContext *v8;
  CGRect v9;

  v4 = (CGImage *)objc_msgSend(objc_retainAutorelease(a3), "CGImage");
  SRGB = (CGColorSpace *)CGColorSpaceGetSRGB();
  if (SRGB)
  {
    CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v4, SRGB);
    v7 = CopyWithColorSpace;
    if (CopyWithColorSpace)
      v4 = CopyWithColorSpace;
  }
  else
  {
    v7 = 0;
  }
  v8 = TSDBitmapContextCreate(3, 102.0, 102.0);
  CGContextSetInterpolationQuality(v8, kCGInterpolationHigh);
  if (v8)
  {
    v9.origin.x = CGPointZero.x;
    v9.origin.y = CGPointZero.y;
    v9.size.width = 102.0;
    v9.size.height = 102.0;
    CGContextDrawImage(v8, v9, v4);
  }
  if (v7)
    CGImageRelease(v7);
  AnalyzeImagePlease((_BOOL8)v8, &self->_analyzedColors);
  if (v8)
    CGContextRelease(v8);
}

- (UIColor)backgroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", self->_analyzedColors.backgroundColor.mRed, self->_analyzedColors.backgroundColor.mGreen, self->_analyzedColors.backgroundColor.mBlue, self->_analyzedColors.backgroundColor.mAlpha);
}

- (NSArray)dominantColors
{
  void *v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *__p;
  _BYTE *v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  __p = 0;
  v10 = 0;
  v11 = 0;
  sub_100014A94(&__p, self->_analyzedColors.completeColorList.__begin_, (uint64_t)self->_analyzedColors.completeColorList.__end_, self->_analyzedColors.completeColorList.__end_ - self->_analyzedColors.completeColorList.__begin_);
  v4 = (char *)__p;
  if (v10 != __p)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", *(double *)&v4[v5], *(double *)&v4[v5 + 8], *(double *)&v4[v5 + 16], *(double *)&v4[v5 + 24]));
      objc_msgSend(v3, "addObject:", v7);

      ++v6;
      v4 = (char *)__p;
      v5 += 32;
    }
    while (v6 < (v10 - (_BYTE *)__p) >> 5);
  }
  if (__p)
  {
    v10 = __p;
    operator delete(__p);
  }
  return (NSArray *)v3;
}

- (BOOL)color:(id)a3 isCloseToOtherColor:(id)a4
{
  return _objc_msgSend(a3, "_isSimilarToColor:withinPercentage:", a4, 0.2);
}

- (void).cxx_destruct
{
  sub_1000149B4(&self->_analyzedColors.backgroundColor.mRed);
}

- (id).cxx_construct
{
  sub_100014A14((uint64_t)&self->_analyzedColors);
  return self;
}

@end
