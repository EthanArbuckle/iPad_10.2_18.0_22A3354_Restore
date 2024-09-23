@implementation TSUImage

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return +[_TSUImageM allocWithZone:](_TSUImageM, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TSUImage;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  return +[TSUUIImage imageNamed:inBundle:](TSUUIImage, "imageNamed:inBundle:", a3, a4);
}

+ (id)imageWithContentsOfFile:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithContentsOfFile:", a3);
}

+ (id)imageWithData:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithData:", a3);
}

+ (id)imageWithCGImage:(CGImage *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCGImage:", a3);
}

+ (id)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCGImage:scale:orientation:", a3, a5, a4);
}

- (TSUImage)init
{
  TSUImage *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUImage;
  result = -[TSUImage init](&v3, sel_init);
  if (result)
    __dmb(0xBu);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3;
  uint64_t v4;

  v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUImage copyWithZone:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 733, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUImage copyWithZone:]"), 0));
}

- (TSUImage)initWithContentsOfFile:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUImage initWithContentsOfFile:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 739, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUImage initWithContentsOfFile:]"), 0));
}

- (TSUImage)initWithData:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUImage initWithData:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 745, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUImage initWithData:]"), 0));
}

- (TSUImage)initWithCGImage:(CGImage *)a3
{
  id v3;
  uint64_t v4;

  v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUImage initWithCGImage:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 751, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUImage initWithCGImage:]"), 0));
}

- (TSUImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  id v5;
  uint64_t v6;

  v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a5, a4);
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUImage initWithCGImage:scale:orientation:]");
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 757, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUImage initWithCGImage:scale:orientation:]"), 0));
}

- (TSUImage)initWithImageSourceRef:(CGImageSource *)a3
{
  id v3;
  uint64_t v4;

  v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUImage initWithImageSourceRef:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 763, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUImage initWithImageSourceRef:]"), 0));
}

- (CGSize)size
{
  id v2;
  uint64_t v3;

  v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUImage size]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 770, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUImage size]"), 0));
}

- (double)scale
{
  id v2;
  uint64_t v3;

  v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUImage scale]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 775, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUImage scale]"), 0));
}

- (void)dealloc
{
  __CFDictionary *mImageSlices;
  objc_super v4;

  CGImageRelease(self->mCachedSliceableImage);
  mImageSlices = self->mImageSlices;
  if (mImageSlices)
    CFRelease(mImageSlices);

  v4.receiver = self;
  v4.super_class = (Class)TSUImage;
  -[TSUImage dealloc](&v4, sel_dealloc);
}

- (CGImage)CGImageForSize:(CGSize)a3
{
  id v3;
  uint64_t v4;

  v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3.width, a3.height);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUImage CGImageForSize:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 790, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUImage CGImageForSize:]"), 0));
}

- (CGImage)CGImage
{
  id v2;
  uint64_t v3;

  v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUImage CGImage]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 795, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUImage CGImage]"), 0));
}

- (int64_t)imageOrientation
{
  id v2;
  uint64_t v3;

  v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUImage imageOrientation]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 800, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUImage imageOrientation]"), 0));
}

- (BOOL)isEmpty
{
  return TSUCGImageIsEmpty(-[TSUImage CGImage](self, "CGImage"));
}

- (id)imagePartsWithLeftCapWidth:(double)a3 rightCapWidth:(double)a4 topCapHeight:(double)a5 bottomCapHeight:(double)a6
{
  id v11;
  uint64_t v12;
  double v13;
  double v14;
  CGImage *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double Width;
  size_t Height;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  double *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGImage *v34;
  double v35;
  _BYTE v37[16];
  _QWORD v38[35];
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v38[34] = *MEMORY[0x24BDAC8D0];
  if (-[TSUImage imageOrientation](self, "imageOrientation"))
  {
    v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUImage imagePartsWithLeftCapWidth:rightCapWidth:topCapHeight:bottomCapHeight:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 813, CFSTR("Method may not produce desired output if image orientation is not facing up."));
  }
  -[TSUImage scale](self, "scale");
  v14 = v13;
  v15 = -[TSUImage CGImageForContentsScale:](self, "CGImageForContentsScale:");
  v16 = v14 * a3;
  v17 = v14 * a4;
  v18 = v14 * a5;
  v19 = v14 * a6;
  Width = (double)CGImageGetWidth(v15);
  Height = CGImageGetHeight(v15);
  v22 = (double)Height;
  if (v18 >= (double)Height)
    v23 = (double)Height;
  else
    v23 = v18;
  if (v19 >= v22 - v23)
    v24 = v22 - v23;
  else
    v24 = v19;
  if (v16 >= Width)
    v25 = Width;
  else
    v25 = v16;
  if (v17 >= Width - v25)
    v26 = Width - v25;
  else
    v26 = v17;
  TSUSplitRectIntoSlices((uint64_t)v37, 0.0, 0.0, Width, v22, v25, v26, v23, v24);
  v27 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 9);
  v28 = 0;
  v29 = (double *)v38;
  do
  {
    v30 = *(v29 - 2);
    v31 = *(v29 - 1);
    v32 = *v29;
    v33 = v29[1];
    v39.origin.x = v30;
    v39.origin.y = v31;
    v39.size.width = *v29;
    v39.size.height = v33;
    if (CGRectIsEmpty(v39)
      || (v40.origin.x = v30, v40.origin.y = v31, v40.size.width = v32, v40.size.height = v33, CGRectIsNull(v40)))
    {
      objc_msgSend(v27, "insertObject:atIndex:", objc_msgSend(MEMORY[0x24BDBCEF8], "null"), v28);
    }
    else
    {
      v41.origin.x = v30;
      v41.origin.y = v31;
      v41.size.width = v32;
      v41.size.height = v33;
      v34 = CGImageCreateWithImageInRect(v15, v41);
      -[TSUImage scale](self, "scale");
      objc_msgSend(v27, "insertObject:atIndex:", +[TSUImage imageWithCGImage:scale:orientation:](TSUImage, "imageWithCGImage:scale:orientation:", v34, -[TSUImage imageOrientation](self, "imageOrientation"), v35), v28);
      CGImageRelease(v34);
    }
    ++v28;
    v29 += 4;
  }
  while (v28 != 9);
  return v27;
}

- (id)TIFFRepresentation
{
  return TSUCGImageTIFFRepresentation(-[TSUImage CGImage](self, "CGImage"));
}

- (id)JPEGRepresentationWithCompressionQuality:(double)a3
{
  return TSUCGImageJPEGRepresentation((uint64_t)-[TSUImage CGImage](self, "CGImage"), a3);
}

- (id)PNGRepresentation
{
  return (id)TSUCGImagePNGRepresentation(-[TSUImage CGImage](self, "CGImage"));
}

- (id)stretchedImageOfSize:(CGSize)a3 leftCapWidth:(double)a4 rightCapWidth:(double)a5 topCapHeight:(double)a6 bottomCapHeight:(double)a7
{
  CGImage *v8;
  double v9;
  TSUImage *v10;
  _QWORD v12[5];
  CGSize v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __89__TSUImage_stretchedImageOfSize_leftCapWidth_rightCapWidth_topCapHeight_bottomCapHeight___block_invoke;
  v12[3] = &unk_24D61B1C8;
  v13 = a3;
  v12[4] = self;
  v14 = a6;
  v15 = a7;
  v16 = a4;
  v17 = a5;
  v8 = __89__TSUImage_stretchedImageOfSize_leftCapWidth_rightCapWidth_topCapHeight_bottomCapHeight___block_invoke((uint64_t)v12, -[TSUImage CGImageForSize:](self, "CGImageForSize:"), 1.0);
  -[TSUImage scale](self, "scale");
  v10 = +[TSUImage imageWithCGImage:scale:orientation:](TSUImage, "imageWithCGImage:scale:orientation:", v8, -[TSUImage imageOrientation](self, "imageOrientation"), v9);
  CGImageRelease(v8);
  return v10;
}

CGImageRef __89__TSUImage_stretchedImageOfSize_leftCapWidth_rightCapWidth_topCapHeight_bottomCapHeight___block_invoke(uint64_t a1, CGImageRef image, double a3)
{
  double Width;
  double Height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGContext *v20;
  uint64_t i;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGImageRef v30;
  CGImage *v31;
  double MaxY;
  CGFloat MinY;
  CGImageRef v34;
  _BYTE v36[288];
  _BYTE v37[288];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v38 = *MEMORY[0x24BDAC8D0];
  Width = (double)CGImageGetWidth(image);
  Height = (double)CGImageGetHeight(image);
  v8 = fabs(*(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v10 = ceil(v8 * v9 * a3);
  v11 = fabs(*(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v13 = ceil(v11 * v12 * a3);
  v14 = *(double *)(a1 + 64);
  if (*(double *)(a1 + 56) * a3 >= Height)
    v15 = Height;
  else
    v15 = *(double *)(a1 + 56) * a3;
  if (v14 * a3 >= Height - v15)
    v16 = Height - v15;
  else
    v16 = v14 * a3;
  v17 = *(double *)(a1 + 80);
  if (*(double *)(a1 + 72) * a3 >= Width)
    v18 = Width;
  else
    v18 = *(double *)(a1 + 72) * a3;
  if (v17 * a3 >= Width - v18)
    v19 = Width - v18;
  else
    v19 = v17 * a3;
  TSUSplitRectIntoSlices((uint64_t)v37, 0.0, 0.0, Width, Height, v18, v19, v15, v16);
  TSUSplitRectIntoSlices((uint64_t)v36, 0.0, 0.0, v10, v13, v18, v19, v15, v16);
  v20 = TSUCreateRGBABitmapContext(1, v10, v13, 1.0);
  for (i = 0; i != 288; i += 32)
  {
    v22 = *(double *)&v37[i];
    v23 = *(double *)&v37[i + 8];
    v24 = *(double *)&v37[i + 16];
    v25 = *(double *)&v37[i + 24];
    v26 = *(double *)&v36[i];
    v27 = *(double *)&v36[i + 8];
    v28 = *(double *)&v36[i + 16];
    v29 = *(double *)&v36[i + 24];
    v39.origin.x = v22;
    v39.origin.y = v23;
    v39.size.width = v24;
    v39.size.height = v25;
    if (!CGRectIsEmpty(v39))
    {
      v40.origin.x = v22;
      v40.origin.y = v23;
      v40.size.width = v24;
      v40.size.height = v25;
      if (!CGRectIsNull(v40))
      {
        v41.origin.x = v26;
        v41.origin.y = v27;
        v41.size.width = v28;
        v41.size.height = v29;
        if (!CGRectIsEmpty(v41))
        {
          v42.origin.x = v26;
          v42.origin.y = v27;
          v42.size.width = v28;
          v42.size.height = v29;
          if (!CGRectIsNull(v42))
          {
            v43.origin.x = v22;
            v43.origin.y = v23;
            v43.size.width = v24;
            v43.size.height = v25;
            v30 = CGImageCreateWithImageInRect(image, v43);
            if (v30)
            {
              v31 = v30;
              CGContextSaveGState(v20);
              v44.origin.x = v26;
              v44.origin.y = v27;
              v44.size.width = v28;
              v44.size.height = v29;
              MaxY = CGRectGetMaxY(v44);
              v45.origin.x = v26;
              v45.origin.y = v27;
              v45.size.width = v28;
              v45.size.height = v29;
              MinY = CGRectGetMinY(v45);
              CGContextTranslateCTM(v20, 0.0, MaxY + MinY);
              CGContextScaleCTM(v20, 1.0, -1.0);
              v46.origin.x = v26;
              v46.origin.y = v27;
              v46.size.width = v28;
              v46.size.height = v29;
              CGContextDrawImage(v20, v46, v31);
              CGImageRelease(v31);
              CGContextRestoreGState(v20);
            }
          }
        }
      }
    }
  }
  v34 = CGBitmapContextCreateImage(v20);
  CGContextRelease(v20);
  return v34;
}

- (void)drawInRect:(CGRect)a3 context:(CGContext *)a4 stretchingCenterWidthBy:(double)a5
{
  CGFloat height;
  CGFloat y;
  double x;
  CGImage *v10;
  size_t Width;
  int v12;
  double v13;
  size_t v14;
  double v15;
  double v16;
  int64_t mImageSliceCacheLock;
  double v18;
  CGImage *mCachedSliceableImage;
  CGFloat v20;
  CGImageRef v21;
  CGImageRef v22;
  CGImageRef v23;
  CGImage *Value;
  CGImage *v25;
  CGImage *v26;
  _QWORD block[5];
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[TSUImage CGImageForSize:](self, "CGImageForSize:", a3.size.width, a3.size.height);
  Width = CGImageGetWidth(v10);
  v12 = Width;
  v13 = (double)Width;
  v14 = CGImageGetHeight(v10);
  if ((v12 & 0x80000001) == 1)
    v15 = 1.0;
  else
    v15 = 2.0;
  v16 = floor(v13 * 0.5) - (v15 + -1.0);
  mImageSliceCacheLock = self->mImageSliceCacheLock;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__TSUImage_drawInRect_context_stretchingCenterWidthBy___block_invoke;
  block[3] = &unk_24D61AB38;
  block[4] = self;
  if (mImageSliceCacheLock != -1)
    dispatch_once(&self->mImageSliceCacheLock, block);
  v18 = v13 - (v15 + v16);
  mCachedSliceableImage = self->mCachedSliceableImage;
  if (!mCachedSliceableImage || !CFEqual(v10, mCachedSliceableImage))
  {
    v20 = (double)v14;
    self->mCachedSliceableImage = CGImageRetain(v10);
    CFDictionaryRemoveAllValues(self->mImageSlices);
    v29.origin.x = 0.0;
    v29.origin.y = 0.0;
    v29.size.width = v16;
    v29.size.height = (double)v14;
    v21 = CGImageCreateWithImageInRect(v10, v29);
    v30.origin.y = 0.0;
    v30.origin.x = v15 + v16;
    v30.size.width = v18;
    v30.size.height = v20;
    v22 = CGImageCreateWithImageInRect(v10, v30);
    v31.origin.y = 0.0;
    v31.origin.x = v16;
    v31.size.width = v15;
    v31.size.height = v20;
    v23 = CGImageCreateWithImageInRect(v10, v31);
    CFDictionarySetValue(self->mImageSlices, &unk_24D6386E8, v21);
    CFDictionarySetValue(self->mImageSlices, &unk_24D638700, v23);
    CFDictionarySetValue(self->mImageSlices, &unk_24D638718, v22);
    CGImageRelease(v21);
    CGImageRelease(v22);
    CGImageRelease(v23);
  }
  Value = (CGImage *)CFDictionaryGetValue(self->mImageSlices, &unk_24D6386E8);
  v25 = (CGImage *)CFDictionaryGetValue(self->mImageSlices, &unk_24D638700);
  v26 = (CGImage *)CFDictionaryGetValue(self->mImageSlices, &unk_24D638718);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = v16;
  v32.size.height = height;
  CGContextDrawImage(a4, v32, Value);
  v33.origin.x = x + v16;
  v33.origin.y = y;
  v33.size.width = a5;
  v33.size.height = height;
  CGContextDrawImage(a4, v33, v25);
  v34.origin.x = x + v16 + a5;
  v34.origin.y = y;
  v34.size.width = v18;
  v34.size.height = height;
  CGContextDrawImage(a4, v34, v26);
}

CFMutableDictionaryRef __55__TSUImage_drawInRect_context_stretchingCenterWidthBy___block_invoke(uint64_t a1)
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable(0, 12, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = result;
  return result;
}

+ (id)imageWithSize:(CGSize)a3 drawnUsingBlock:(id)a4
{
  CGContextRef CurrentContext;
  TSUImage *v6;

  UIGraphicsBeginImageContextWithOptions(a3, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  (*((void (**)(id, CGContextRef))a4 + 2))(a4, CurrentContext);
  v6 = +[TSUImage imageWithUIImage:](TSUImage, "imageWithUIImage:", UIGraphicsGetImageFromCurrentImageContext());
  UIGraphicsEndImageContext();
  return v6;
}

- (void)drawInRect:(CGRect)a3
{
  -[UIImage drawInRect:](-[TSUImage UIImage](self, "UIImage"), "drawInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)imageWithUIImage:(id)a3
{
  return -[TSUUIImage initWithUIImage:]([TSUUIImage alloc], "initWithUIImage:", a3);
}

- (TSUImage)initWithUIImage:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUImage(UIKitAdditions) initWithUIImage:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUImage.m"), 1089, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSUImage(UIKitAdditions) initWithUIImage:]"), 0));
}

- (UIImage)UIImage
{
  int64_t *p_mCachedImageLock;
  int64_t mCachedImageLock;
  _QWORD block[5];

  mCachedImageLock = self->mCachedImageLock;
  p_mCachedImageLock = &self->mCachedImageLock;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__TSUImage_UIKitAdditions__UIImage__block_invoke;
  block[3] = &unk_24D61AB38;
  block[4] = self;
  if (mCachedImageLock != -1)
    dispatch_once(p_mCachedImageLock, block);
  return (UIImage *)self->mCachedSystemImage;
}

uint64_t __35__TSUImage_UIKitAdditions__UIImage__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  double v4;
  uint64_t result;

  v2 = objc_alloc(MEMORY[0x24BDF6AC8]);
  v3 = objc_msgSend(*(id *)(a1 + 32), "CGImage");
  objc_msgSend(*(id *)(a1 + 32), "scale");
  result = objc_msgSend(v2, "initWithCGImage:scale:orientation:", v3, objc_msgSend(*(id *)(a1 + 32), "imageOrientation"), v4);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = result;
  return result;
}

+ (id)noisePatternWithWidth:(unint64_t)a3 height:(unint64_t)a4 factor:(double)a5
{
  unint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  int v12;
  int v13;
  double v14;
  CGColorSpace *DeviceGray;
  CGContext *v16;
  CGImage *Image;
  void *v18;

  v9 = a4 * a3;
  v10 = malloc_type_malloc(a4 * a3, 0xF5F456F5uLL);
  srand(0x7Cu);
  if (v9)
  {
    v11 = v10;
    do
    {
      v12 = rand();
      if (v12 <= 0)
        v13 = --(char)v12;
      else
        v13 = v12;
      v14 = (double)v13 * a5;
      if (v14 > 255.0)
        v14 = 255.0;
      *v11++ = (int)v14;
      --v9;
    }
    while (v9);
  }
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v16 = CGBitmapContextCreate(v10, a3, a4, 8uLL, a3, DeviceGray, 0);
  Image = CGBitmapContextCreateImage(v16);
  CGColorSpaceRelease(DeviceGray);
  free(v10);
  CGContextRelease(v16);
  v18 = (void *)objc_msgSend(a1, "imageWithCGImage:", Image);
  CGImageRelease(Image);
  return v18;
}

@end
