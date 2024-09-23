@implementation OITSUImage

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return +[OI_TSUImageM allocWithZone:](OI_TSUImageM, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___OITSUImage;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

+ (id)imageNamed:(id)a3
{
  return +[OITSUUIImage imageNamed:](OITSUUIImage, "imageNamed:", a3);
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

- (OITSUImage)init
{
  OITSUImage *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OITSUImage;
  v2 = -[OITSUImage init](&v4, sel_init);
  if (v2)
  {
    v2->mImageSlicesOnce = objc_alloc_init(TSUOnce);
    v2->mCachedImageOnce = objc_alloc_init(TSUOnce);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUImage copyWithZone:]");
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m");
  v5 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 721, 0, "Abstract method not overridden by %@", NSStringFromClass(v5));
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, objc_msgSend(v8, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v9), "-[OITSUImage copyWithZone:]"), 0);
  objc_exception_throw(v10);
}

- (OITSUImage)initWithContentsOfFile:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUImage initWithContentsOfFile:]");
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m");
  v5 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 726, 0, "Abstract method not overridden by %@", NSStringFromClass(v5));
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, objc_msgSend(v8, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v9), "-[OITSUImage initWithContentsOfFile:]"), 0);
  objc_exception_throw(v10);
}

- (OITSUImage)initWithData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUImage initWithData:]");
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m");
  v5 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 731, 0, "Abstract method not overridden by %@", NSStringFromClass(v5));
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, objc_msgSend(v8, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v9), "-[OITSUImage initWithData:]"), 0);
  objc_exception_throw(v10);
}

- (OITSUImage)initWithCGImage:(CGImage *)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUImage initWithCGImage:]");
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m");
  v5 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 736, 0, "Abstract method not overridden by %@", NSStringFromClass(v5));
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, objc_msgSend(v8, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v9), "-[OITSUImage initWithCGImage:]"), 0);
  objc_exception_throw(v10);
}

- (OITSUImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;

  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUImage initWithCGImage:scale:orientation:]", a5, a4);
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m");
  v7 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 741, 0, "Abstract method not overridden by %@", NSStringFromClass(v7));
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = *MEMORY[0x24BDBCAB0];
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = (objc_class *)objc_opt_class();
  v12 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, objc_msgSend(v10, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v11), "-[OITSUImage initWithCGImage:scale:orientation:]"), 0);
  objc_exception_throw(v12);
}

- (OITSUImage)initWithImageSourceRef:(CGImageSource *)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUImage initWithImageSourceRef:]");
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m");
  v5 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 746, 0, "Abstract method not overridden by %@", NSStringFromClass(v5));
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, objc_msgSend(v8, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v9), "-[OITSUImage initWithImageSourceRef:]"), 0);
  objc_exception_throw(v10);
}

- (CGSize)size
{
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUImage size]");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m");
  v4 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 752, 0, "Abstract method not overridden by %@", NSStringFromClass(v4));
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  v9 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, objc_msgSend(v7, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v8), "-[OITSUImage size]"), 0);
  objc_exception_throw(v9);
}

- (double)scale
{
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUImage scale]");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m");
  v4 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 756, 0, "Abstract method not overridden by %@", NSStringFromClass(v4));
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  v9 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, objc_msgSend(v7, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v8), "-[OITSUImage scale]"), 0);
  objc_exception_throw(v9);
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
  v4.super_class = (Class)OITSUImage;
  -[OITSUImage dealloc](&v4, sel_dealloc);
}

- (CGImage)CGImageForSize:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUImage CGImageForSize:]", a3.width, a3.height);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m");
  v5 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 771, 0, "Abstract method not overridden by %@", NSStringFromClass(v5));
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, objc_msgSend(v8, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v9), "-[OITSUImage CGImageForSize:]"), 0);
  objc_exception_throw(v10);
}

- (CGImage)CGImage
{
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUImage CGImage]");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m");
  v4 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 775, 0, "Abstract method not overridden by %@", NSStringFromClass(v4));
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  v9 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, objc_msgSend(v7, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v8), "-[OITSUImage CGImage]"), 0);
  objc_exception_throw(v9);
}

- (int64_t)imageOrientation
{
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUImage imageOrientation]");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m");
  v4 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 779, 0, "Abstract method not overridden by %@", NSStringFromClass(v4));
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  v9 = (void *)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, objc_msgSend(v7, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v8), "-[OITSUImage imageOrientation]"), 0);
  objc_exception_throw(v9);
}

- (BOOL)isEmpty
{
  return TSUCGImageIsEmpty(-[OITSUImage CGImage](self, "CGImage"));
}

- (id)TIFFRepresentation
{
  return CGImageTIFFRepresentation(-[OITSUImage CGImage](self, "CGImage"));
}

- (id)JPEGRepresentationWithCompressionQuality:(double)a3
{
  return CGImageJPEGRepresentation((uint64_t)-[OITSUImage CGImage](self, "CGImage"), a3);
}

- (id)PNGRepresentation
{
  return (id)CGImagePNGRepresentation(-[OITSUImage CGImage](self, "CGImage"));
}

- (id)stretchedImageOfSize:(CGSize)a3 leftCapWidth:(double)a4 rightCapWidth:(double)a5 topCapHeight:(double)a6 bottomCapHeight:(double)a7
{
  CGImage *v8;
  double v9;
  OITSUImage *v10;
  _QWORD v12[5];
  CGSize v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __91__OITSUImage_stretchedImageOfSize_leftCapWidth_rightCapWidth_topCapHeight_bottomCapHeight___block_invoke;
  v12[3] = &unk_24F39B0C0;
  v13 = a3;
  v12[4] = self;
  v14 = a6;
  v15 = a7;
  v16 = a4;
  v17 = a5;
  v8 = __91__OITSUImage_stretchedImageOfSize_leftCapWidth_rightCapWidth_topCapHeight_bottomCapHeight___block_invoke((uint64_t)v12, -[OITSUImage CGImageForSize:](self, "CGImageForSize:"), 1.0);
  -[OITSUImage scale](self, "scale");
  v10 = +[OITSUImage imageWithCGImage:scale:orientation:](OITSUImage, "imageWithCGImage:scale:orientation:", v8, -[OITSUImage imageOrientation](self, "imageOrientation"), v9);
  CGImageRelease(v8);
  return v10;
}

CGImageRef __91__OITSUImage_stretchedImageOfSize_leftCapWidth_rightCapWidth_topCapHeight_bottomCapHeight___block_invoke(uint64_t a1, CGImageRef image, double a3)
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
  double v17;
  TSUOnce *mImageSlicesOnce;
  CGImage *mCachedSliceableImage;
  CGFloat v20;
  CGImageRef v21;
  CGImageRef v22;
  CGImageRef v23;
  CGImage *Value;
  CGImage *v25;
  CGImage *v26;
  _QWORD v28[5];
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[OITSUImage CGImageForSize:](self, "CGImageForSize:", a3.size.width, a3.size.height);
  Width = CGImageGetWidth(v10);
  v12 = Width;
  v13 = (double)Width;
  v14 = CGImageGetHeight(v10);
  if ((v12 & 0x80000001) == 1)
    v15 = 1.0;
  else
    v15 = 2.0;
  v16 = floor(v13 * 0.5) - (v15 + -1.0);
  v17 = v13 - (v15 + v16);
  mImageSlicesOnce = self->mImageSlicesOnce;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __57__OITSUImage_drawInRect_context_stretchingCenterWidthBy___block_invoke;
  v28[3] = &unk_24F39A608;
  v28[4] = self;
  -[TSUOnce performBlockOnce:](mImageSlicesOnce, "performBlockOnce:", v28);
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
    v30.size.width = v17;
    v30.size.height = v20;
    v22 = CGImageCreateWithImageInRect(v10, v30);
    v31.origin.y = 0.0;
    v31.origin.x = v16;
    v31.size.width = v15;
    v31.size.height = v20;
    v23 = CGImageCreateWithImageInRect(v10, v31);
    CFDictionarySetValue(self->mImageSlices, &unk_24F46A3C0, v21);
    CFDictionarySetValue(self->mImageSlices, &unk_24F46A3D8, v23);
    CFDictionarySetValue(self->mImageSlices, &unk_24F46A3F0, v22);
    CGImageRelease(v21);
    CGImageRelease(v22);
    CGImageRelease(v23);
  }
  Value = (CGImage *)CFDictionaryGetValue(self->mImageSlices, &unk_24F46A3C0);
  v25 = (CGImage *)CFDictionaryGetValue(self->mImageSlices, &unk_24F46A3D8);
  v26 = (CGImage *)CFDictionaryGetValue(self->mImageSlices, &unk_24F46A3F0);
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
  v34.size.width = v17;
  v34.size.height = height;
  CGContextDrawImage(a4, v34, v26);
}

CFMutableDictionaryRef __57__OITSUImage_drawInRect_context_stretchingCenterWidthBy___block_invoke(uint64_t a1)
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable(0, 12, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = result;
  return result;
}

+ (id)imageWithUIImage:(id)a3
{
  return -[OITSUUIImage initWithUIImage:]([OITSUUIImage alloc], "initWithUIImage:", a3);
}

- (OITSUImage)initWithUIImage:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUImage(UIKitAdditions) initWithUIImage:]");
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUImage.m");
  v5 = (objc_class *)objc_opt_class();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 989, 0, "Abstract method not overridden by %@", NSStringFromClass(v5));
  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, objc_msgSend(v8, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), NSStringFromClass(v9), "-[OITSUImage(UIKitAdditions) initWithUIImage:]"), 0);
  objc_exception_throw(v10);
}

- (UIImage)UIImage
{
  TSUOnce *mCachedImageOnce;
  _QWORD v5[5];

  mCachedImageOnce = self->mCachedImageOnce;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__OITSUImage_UIKitAdditions__UIImage__block_invoke;
  v5[3] = &unk_24F39A608;
  v5[4] = self;
  -[TSUOnce performBlockOnce:](mCachedImageOnce, "performBlockOnce:", v5);
  return (UIImage *)self->mCachedSystemImage;
}

uint64_t __37__OITSUImage_UIKitAdditions__UIImage__block_invoke(uint64_t a1)
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
  v10 = malloc_type_malloc(a4 * a3, 0x54B432FAuLL);
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

- (void)drawInRect:(CGRect)a3 fromRect:(CGRect)a4 isFlipped:(BOOL)a5
{
  double width;
  double v7;
  double v8;
  _BOOL4 v9;
  double x;
  double v11;
  _BOOL4 v12;
  double height;
  double y;
  int v15;
  double v16;
  double v17;
  CGContext *CurrentContext;
  CGFloat MidX;
  CGFloat MidY;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  _BOOL4 v29;
  CGImage *v30;
  CGImage *v31;
  CGImage *v32;
  CGFloat v33;
  CGFloat rect;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  width = -0.0;
  if (a4.size.width < 0.0)
    width = a4.size.width;
  v7 = a4.origin.x + width;
  if (a4.size.width >= 0.0)
    v8 = a4.size.width;
  else
    v8 = -a4.size.width;
  v33 = v8;
  if (a3.size.width < 0.0)
    v9 = a4.size.width >= 0.0;
  else
    v9 = a4.size.width < 0.0;
  if (a3.size.width < 0.0)
    x = a3.origin.x + a3.size.width;
  else
    x = a3.origin.x;
  if (a3.size.width < 0.0)
    v11 = -a3.size.width;
  else
    v11 = a3.size.width;
  v12 = !a5;
  height = -a4.size.height;
  if (a4.size.height < 0.0)
  {
    y = a4.origin.y + a4.size.height;
  }
  else
  {
    v12 = a5;
    y = a4.origin.y;
  }
  if (a4.size.height >= 0.0)
    height = a4.size.height;
  rect = height;
  if (a3.size.height < 0.0)
    v15 = !v12;
  else
    v15 = v12;
  if (a3.size.height < 0.0)
    v16 = a3.origin.y + a3.size.height;
  else
    v16 = a3.origin.y;
  if (a3.size.height < 0.0)
    v17 = -a3.size.height;
  else
    v17 = a3.size.height;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v35.origin.x = x;
  v35.origin.y = v16;
  v35.size.width = v11;
  v35.size.height = v17;
  MidX = CGRectGetMidX(v35);
  v36.origin.x = x;
  v36.origin.y = v16;
  v36.size.width = v11;
  v36.size.height = v17;
  MidY = CGRectGetMidY(v36);
  CGContextTranslateCTM(CurrentContext, MidX, MidY);
  v21 = 1.0;
  if (v9)
    v22 = -1.0;
  else
    v22 = 1.0;
  if (v15)
    v21 = -1.0;
  CGContextScaleCTM(CurrentContext, v22, v21);
  v37.origin.x = x;
  v37.origin.y = v16;
  v37.size.width = v11;
  v37.size.height = v17;
  v23 = -CGRectGetMidX(v37);
  v38.origin.x = x;
  v38.origin.y = v16;
  v38.size.width = v11;
  v38.size.height = v17;
  v24 = CGRectGetMidY(v38);
  CGContextTranslateCTM(CurrentContext, v23, -v24);
  v25 = *MEMORY[0x24BDBEFB0];
  v26 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[OITSUImage size](self, "size");
  v43.size.width = v27;
  v43.size.height = v28;
  v39.origin.x = v7;
  v39.origin.y = y;
  v39.size.width = v33;
  v39.size.height = rect;
  v43.origin.x = v25;
  v43.origin.y = v26;
  v29 = CGRectEqualToRect(v39, v43);
  v30 = -[OITSUImage CGImage](self, "CGImage");
  if (v29)
  {
    v40.origin.x = x;
    v40.origin.y = v16;
    v40.size.width = v11;
    v40.size.height = v17;
    CGContextDrawImage(CurrentContext, v40, v30);
  }
  else
  {
    v41.origin.x = v7;
    v41.origin.y = y;
    v41.size.width = v33;
    v41.size.height = rect;
    v31 = CGImageCreateWithImageInRect(v30, v41);
    if (v31)
    {
      v32 = v31;
      v42.origin.x = x;
      v42.origin.y = v16;
      v42.size.width = v11;
      v42.size.height = v17;
      CGContextDrawImage(CurrentContext, v42, v31);
      CFRelease(v32);
    }
  }
  CGContextRestoreGState(CurrentContext);
}

@end
