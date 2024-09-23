@implementation WBSFaviconProviderUtilities

+ (BOOL)isFaviconSize:(CGSize)a3 morePreferrableThanFaviconSize:(CGSize)a4 givenDesiredSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  uint64_t v15;
  uint64_t v16;
  BOOL v18;
  BOOL v19;
  BOOL v20;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v9 = a3.height;
  v10 = a3.width;
  if (objc_msgSend(a1, "computeRelativeSize:referenceSize:") == 6)
    return 0;
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v10 == *MEMORY[0x1E0C9D820] && v9 == v12)
    return 0;
  if (v8 == *MEMORY[0x1E0C9D820] && v7 == v12)
    return 1;
  v15 = objc_msgSend(a1, "computeRelativeSize:referenceSize:", v10, v9, width, height);
  v16 = objc_msgSend(a1, "computeRelativeSize:referenceSize:", v8, v7, width, height);
  if (v15 > v16)
    return 1;
  if (v15 < v16)
    return 0;
  v18 = v10 <= v8;
  if (v9 <= v7)
    v18 = 1;
  v19 = v10 >= v8;
  if (v9 >= v7)
    v19 = 1;
  v20 = v15 != 5 || v19;
  if (v15 == 4)
    return v18;
  else
    return v20;
}

+ (int64_t)computeRelativeSize:(CGSize)a3 referenceSize:(CGSize)a4
{
  if (a3.width == a4.width && a3.height == a4.height)
    return 6;
  if (a3.width == a4.width + a4.width && a3.height == a4.height + a4.height)
    return 3;
  if (a3.width == a4.width * 4.0 && a3.height == a4.height * 4.0)
    return 2;
  if (a3.width == a4.width * 8.0 && a3.height == a4.height * 8.0)
    return 1;
  if (a3.width < a4.width && a3.height < a4.height)
    return 5;
  if (a3.height <= a4.height || a3.width <= a4.width)
    return 0;
  else
    return 4;
}

+ (CGSize)sizeOfImageWithData:(id)a3 closestToPreferredSize:(CGSize)a4 isMultiResolution:(BOOL *)a5
{
  double height;
  double width;
  const __CFData *v9;
  const __CFData *v10;
  double *v11;
  double v12;
  double v13;
  CGImageSource *v14;
  int Count;
  int i;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v9 = (const __CFData *)a3;
  v10 = v9;
  if (a5)
    *a5 = 0;
  v11 = (double *)MEMORY[0x1E0C9D820];
  v13 = *MEMORY[0x1E0C9D820];
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (!v9)
  {
    v18 = *MEMORY[0x1E0C9D820];
    v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_17;
  }
  v14 = CGImageSourceCreateWithData(v9, 0);
  Count = CGImageSourceGetCount(v14);
  if (Count < 1)
  {
    v18 = v13;
    v19 = v12;
    if (!a5)
      goto LABEL_15;
  }
  else
  {
    for (i = 0; i != Count; ++i)
    {
      v18 = sizeOfImageAtIndex(v14, i);
      v19 = v17;
      v20 = v13 == *v11 && v12 == v11[1];
      if (!v20
        && !objc_msgSend(a1, "isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:", v18, v17, v13, v12, width, height))
      {
        v18 = v13;
        v19 = v12;
      }
      v12 = v19;
      v13 = v18;
    }
    if (!a5)
      goto LABEL_15;
  }
  *a5 = Count > 1;
LABEL_15:
  CFRelease(v14);
LABEL_17:

  v21 = v18;
  v22 = v19;
  result.height = v22;
  result.width = v21;
  return result;
}

+ (id)multiResolutionImageFromImageData:(id)a3 withPreferredSize:(CGSize)a4 atScales:(id)a5 didGenerateResolutions:(BOOL *)a6
{
  double height;
  double width;
  const __CFData *v10;
  id v11;
  void *v12;
  CGImageSource *v13;
  size_t Count;
  CGImage *ImageAtIndex;
  CGColorSpace *v16;
  __CFData *Mutable;
  size_t v18;
  CGImageDestination *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  unsigned int v25;
  double v26;
  CGContext *v27;
  CGContext *v28;
  CGImage *Image;
  const __CFData *v30;
  CGImageSource *v32;
  __CFData *v33;
  void *v34;
  const __CFData *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;

  height = a4.height;
  width = a4.width;
  v41 = *MEMORY[0x1E0C80C00];
  v10 = (const __CFData *)a3;
  v11 = a5;
  v12 = v11;
  if (a6)
    *a6 = 0;
  if (!v10 || !objc_msgSend(v11, "count"))
    goto LABEL_24;
  v13 = CGImageSourceCreateWithData(v10, 0);
  Count = CGImageSourceGetCount(v13);
  if (Count == 1)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v13, 0, 0);
    if (!ImageAtIndex)
    {
LABEL_23:
      CFRelease(v13);
LABEL_24:
      v30 = 0;
      goto LABEL_25;
    }
    v16 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D988]);
    Mutable = CFDataCreateMutable(0, 0);
    v18 = objc_msgSend(v12, "count");
    v19 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x1E0CA5B80], v18, 0);
    v32 = v13;
    v33 = Mutable;
    v34 = v12;
    v35 = v10;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v20 = v12;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v25 = objc_msgSend(v24, "unsignedIntValue", v32);
          v26 = height * (double)objc_msgSend(v24, "unsignedIntValue");
          v27 = CGBitmapContextCreate(0, (unint64_t)(width * (double)v25), (unint64_t)v26, 8uLL, (int)vcvtd_n_s64_f64(width * (double)v25, 2uLL), v16, 1u);
          v28 = v27;
          if (v27)
          {
            CGContextSetInterpolationQuality(v27, kCGInterpolationHigh);
            v42.origin.x = 0.0;
            v42.origin.y = 0.0;
            v42.size.width = width * (double)v25;
            v42.size.height = v26;
            CGContextDrawImage(v28, v42, ImageAtIndex);
            Image = CGBitmapContextCreateImage(v28);
            if (Image)
            {
              CGImageDestinationAddImage(v19, Image, 0);
              CFRelease(Image);
            }
            CFRelease(v28);
          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v21);
    }

    v12 = v34;
    v10 = v35;
    v30 = v33;
    CGImageDestinationFinalize(v19);
    CGColorSpaceRelease(v16);
    CFRelease(v19);
    CFRelease(ImageAtIndex);
    CFRelease(v32);
    if (a6)
      *a6 = 1;
  }
  else
  {
    if (!Count)
      goto LABEL_23;
    CFRelease(v13);
    v30 = v10;
  }
LABEL_25:

  return v30;
}

+ (id)imageWithURL:(id)a3 closetToPreferredSize:(CGSize)a4
{
  double height;
  double width;
  const __CFURL *v7;
  double *v8;
  double v9;
  double v10;
  CGImageSource *v11;
  int v12;
  int v13;
  double v14;
  double v15;
  double v16;
  CGImageRef ImageAtIndex;
  void *v19;

  height = a4.height;
  width = a4.width;
  v7 = (const __CFURL *)a3;
  v8 = (double *)MEMORY[0x1E0C9D820];
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v11 = CGImageSourceCreateWithURL(v7, 0);
  if (!v11)
    goto LABEL_15;
  v12 = 0;
  v13 = 0;
  while (v12 < (int)CGImageSourceGetCount(v11))
  {
    v15 = sizeOfImageAtIndex(v11, v12);
    v16 = v14;
    if (v9 == *v8 && v10 == v8[1])
    {
      v13 = v12;
    }
    else if (objc_msgSend(a1, "isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:", v15, v14, v9, v10, width, height))
    {
      v13 = v12;
    }
    else
    {
      v15 = v9;
      v16 = v10;
    }
    ++v12;
    v9 = v15;
    v10 = v16;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v11, v13, 0);
  CFRelease(v11);
  if (ImageAtIndex)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:", ImageAtIndex);
    CFRelease(ImageAtIndex);
  }
  else
  {
LABEL_15:
    v19 = 0;
  }

  return v19;
}

@end
