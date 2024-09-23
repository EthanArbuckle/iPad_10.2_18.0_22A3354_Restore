@implementation TSDErrorImageProvider

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSDErrorImageProvider;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedInstance
{
  id result;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  result = (id)sharedInstance_sSingletonInstance;
  if (!sharedInstance_sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!sharedInstance_sSingletonInstance)
    {
      v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      sharedInstance_sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDErrorImageProvider sharedInstance]");
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDErrorImageProvider.m"), 29, CFSTR("Couldn't create singleton instance of %@"), a1);
      }
    }
    objc_sync_exit(a1);
    return (id)sharedInstance_sSingletonInstance;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDErrorImageProvider allocWithZone:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDErrorImageProvider.m"), 29, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isError
{
  return 1;
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  CGColor *DeviceRGB;
  CGColor *v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat MaxX;
  CGFloat MaxY;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGPDFDocument *v25;
  CGPDFPage *Page;
  CGPDFPage *v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGAffineTransform transform;
  __n128 v51;
  __int128 v52;
  __int128 v53;
  double v54;
  double v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  CGContextSetShouldAntialias(a3, 1);
  DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
  CGContextSetFillColorWithColor(a3, DeviceRGB);
  CGColorRelease(DeviceRGB);
  v58.origin.x = x;
  v58.origin.y = y;
  v58.size.width = width;
  v58.size.height = height;
  CGContextFillRect(a3, v58);
  v11 = (CGColor *)TSUCGColorCreateDeviceRGB();
  CGContextSetStrokeColorWithColor(a3, v11);
  CGColorRelease(v11);
  memset(&v57, 0, sizeof(v57));
  CGContextGetCTM(&v57, a3);
  v12 = 1.0
      / TSDDistance(v57.tx + v57.a + v57.c * 0.0, v57.ty + v57.b + v57.d * 0.0, v57.tx + v57.c * *(double *)(MEMORY[0x24BDBEFB0] + 8) + v57.a * *MEMORY[0x24BDBEFB0], v57.ty + v57.d * *(double *)(MEMORY[0x24BDBEFB0] + 8) + v57.b * *MEMORY[0x24BDBEFB0]);
  CGContextSetLineWidth(a3, v12);
  v48 = x;
  v49 = y;
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  v60 = CGRectInset(v59, v12 * 0.5, v12 * 0.5);
  v13 = v60.origin.x;
  v14 = v60.origin.y;
  v15 = v60.size.width;
  v16 = v60.size.height;
  CGContextBeginPath(a3);
  v61.origin.x = v13;
  v61.origin.y = v14;
  v61.size.width = v15;
  v61.size.height = v16;
  CGContextAddRect(a3, v61);
  v62.origin.x = v13;
  v62.origin.y = v14;
  v62.size.width = v15;
  v62.size.height = v16;
  MinX = CGRectGetMinX(v62);
  v63.origin.x = v13;
  v63.origin.y = v14;
  v63.size.width = v15;
  v63.size.height = v16;
  MinY = CGRectGetMinY(v63);
  CGContextMoveToPoint(a3, MinX, MinY);
  v64.origin.x = v13;
  v64.origin.y = v14;
  v64.size.width = v15;
  v64.size.height = v16;
  MaxX = CGRectGetMaxX(v64);
  v65.origin.x = v13;
  v65.origin.y = v14;
  v65.size.width = v15;
  v65.size.height = v16;
  MaxY = CGRectGetMaxY(v65);
  CGContextAddLineToPoint(a3, MaxX, MaxY);
  v66.origin.x = v13;
  v66.origin.y = v14;
  v66.size.width = v15;
  v66.size.height = v16;
  v21 = CGRectGetMaxX(v66);
  v67.origin.x = v13;
  v67.origin.y = v14;
  v67.size.width = v15;
  v67.size.height = v16;
  v22 = CGRectGetMinY(v67);
  CGContextMoveToPoint(a3, v21, v22);
  v68.origin.x = v13;
  v68.origin.y = v14;
  v68.size.width = v15;
  v68.size.height = v16;
  v23 = CGRectGetMinX(v68);
  v69.origin.x = v13;
  v69.origin.y = v14;
  v69.size.width = v15;
  v69.size.height = v16;
  v24 = CGRectGetMaxY(v69);
  CGContextAddLineToPoint(a3, v23, v24);
  CGContextStrokePath(a3);
  v25 = -[TSDErrorImageProvider p_iconPDFDocument](self, "p_iconPDFDocument");
  if (v25)
  {
    Page = CGPDFDocumentGetPage(v25, 1uLL);
    if (Page)
    {
      v27 = Page;
      memset(&v56, 0, sizeof(v56));
      v54 = 0.0;
      v55 = 0.0;
      v28 = TSDComputeBoxTransformAndSizeForPDFPage(Page, (uint64_t)&v56, &v54);
      v30 = v29;
      v32 = v31;
      v47 = v33;
      v34 = v54;
      v35 = v55;
      if (TSDMultiplySizeScalar(v54, v55, v12) <= width && v36 <= height)
      {
        v38 = TSDRectWithSize();
        v42 = TSDCenterRectOverRect(v38, v39, v40, v41, v48, v49, width, height);
        v52 = 0u;
        v53 = 0u;
        v51 = 0u;
        transform = v56;
        TSDComputeDrawTransformForPDFPage((__n128 *)&transform, &v51, v34, v35, v42, v43, v44, v45);
        *(__n128 *)&transform.a = v51;
        *(_OWORD *)&transform.c = v52;
        *(_OWORD *)&transform.tx = v53;
        CGContextConcatCTM(a3, &transform);
        v70.origin.x = v28;
        v70.origin.y = v30;
        v70.size.width = v32;
        v70.size.height = v47;
        CGContextClipToRect(a3, v70);
        v71.origin.x = v28;
        v71.origin.y = v30;
        v71.size.width = v32;
        v71.size.height = v47;
        v46 = CGRectGetMaxY(v71);
        CGContextTranslateCTM(a3, 0.0, v46);
        CGContextScaleCTM(a3, 1.0, -1.0);
        CGContextDrawPDFPage(a3, v27);
      }
    }
  }
}

- (CGPDFDocument)p_iconPDFDocument
{
  if (p_iconPDFDocument_onceToken != -1)
    dispatch_once(&p_iconPDFDocument_onceToken, &__block_literal_global_37);
  return (CGPDFDocument *)objc_msgSend((id)p_iconPDFDocument_sIconProvider, "CGPDFDocument");
}

TSDPDFImageProvider *__42__TSDErrorImageProvider_p_iconPDFDocument__block_invoke()
{
  TSDPDFImageProvider *result;

  result = -[TSDImageProvider initWithImageData:]([TSDPDFImageProvider alloc], "initWithImageData:", +[TSPData readOnlyDataFromURL:context:](TSPData, "readOnlyDataFromURL:context:", objc_msgSend((id)TSDBundle(), "URLForResource:withExtension:", CFSTR("TSDErrorImageIcon"), CFSTR("pdf")), 0));
  p_iconPDFDocument_sIconProvider = (uint64_t)result;
  return result;
}

@end
