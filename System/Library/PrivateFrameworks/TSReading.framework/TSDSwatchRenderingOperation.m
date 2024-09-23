@implementation TSDSwatchRenderingOperation

- (TSDSwatchRenderingOperation)initWithPreset:(id)a3 imageSize:(CGSize)a4 imageScale:(double)a5 swatchFrame:(CGRect)a6 documentRoot:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v13;
  CGFloat v14;
  TSDSwatchRenderingOperation *v16;
  objc_super v18;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a4.height;
  v14 = a4.width;
  v18.receiver = self;
  v18.super_class = (Class)TSDSwatchRenderingOperation;
  v16 = -[TSDSwatchRenderingOperation init](&v18, sel_init);
  if (v16)
  {
    v16->mPreset = (TSSPreset *)a3;
    v16->mImageSize.width = v14;
    v16->mImageSize.height = v13;
    v16->mImageScale = a5;
    v16->mSwatchFrame.origin.x = x;
    v16->mSwatchFrame.origin.y = y;
    v16->mSwatchFrame.size.width = width;
    v16->mSwatchFrame.size.height = height;
    v16->mDocumentRoot = (TSKDocumentRoot *)a7;
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->mDeliveredImage);
  v3.receiver = self;
  v3.super_class = (Class)TSDSwatchRenderingOperation;
  -[TSDSwatchRenderingOperation dealloc](&v3, sel_dealloc);
}

- (void)p_animateSwatchIn
{
  CALayer *v3;

  if (self->mView)
  {
    if ((-[TSDSwatchRenderingOperation isCancelled](self, "isCancelled") & 1) == 0)
    {
      v3 = -[UIView layer](self->mView, "layer");
      if (!-[CALayer valueForKey:](v3, "valueForKey:", TSDSwatchRenderingOperationLayerKey)
        || (TSDSwatchRenderingOperation *)-[CALayer valueForKey:](v3, "valueForKey:", TSDSwatchRenderingOperationLayerKey) == self)
      {
        -[CALayer addRotateInAnimationWithDuration:delay:](v3, "addRotateInAnimationWithDuration:delay:", 0.3, 0.0);
        -[CALayer setValue:forKey:](v3, "setValue:forKey:", 0, TSDSwatchRenderingOperationLayerKey);
      }
    }
    -[UIView setHidden:](self->mView, "setHidden:", 0);
  }
}

- (CGImage)p_newSwatchPressedStateBackgroundFromCGImage:(CGImage *)a3
{
  size_t Width;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGContext *v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGImage *Image;
  CGRect v26;

  Width = CGImageGetWidth(a3);
  CGImageGetHeight(a3);
  v6 = TSDRectWithSize();
  v10 = TSDMultiplyRectScalar(v6, v7, v8, v9, self->mImageScale);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = TSDBitmapContextCreate(3, (double)Width);
  CGContextSetFillColorWithColor(v17, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithWhite:alpha:", 0.1, 0.3), "CGColor"));
  -[TSDSwatchRenderingOperation swatchEdgeInsets](self, "swatchEdgeInsets");
  v19 = v12 + v18;
  v22 = v14 - (v20 + v21);
  v26.size.height = v16 - (v18 + v23);
  v26.origin.x = v10 + v20;
  v26.origin.y = v19;
  v26.size.width = v22;
  CGContextFillRect(v17, v26);
  Image = CGBitmapContextCreateImage(v17);
  CGContextRelease(v17);
  return Image;
}

- (void)p_deliverResultOnMainThread:(id)a3
{
  CALayer *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (self->mView)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    v5 = -[UIView layer](self->mView, "layer");
    objc_opt_class();
    v6 = (void *)TSUDynamicCast();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "setImage:forState:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", objc_msgSend(a3, "foreground"), 0, self->mImageScale), 0);
      if (-[TSDSwatchRenderingOperation needsPressedStateBackground](self, "needsPressedStateBackground"))
      {
        v8 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", objc_msgSend(a3, "background"), 0, self->mImageScale);
        v9 = v7;
LABEL_9:
        objc_msgSend(v9, "setBackgroundImage:forState:", v8, 1);
        goto LABEL_10;
      }
      if (objc_msgSend(v7, "backgroundImageForState:", 1))
      {
        v9 = v7;
        v8 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      -[CALayer setContentsScale:](v5, "setContentsScale:", self->mImageScale);
      -[CALayer setContents:](v5, "setContents:", objc_msgSend(a3, "foreground"));
    }
LABEL_10:
    -[CALayer setShouldRasterize:](v5, "setShouldRasterize:", 1);
    -[CALayer setRasterizationScale:](v5, "setRasterizationScale:", self->mImageScale);
    objc_msgSend(MEMORY[0x24BDE57D8], "flush");
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    -[TSDSwatchRenderingOperation p_animateSwatchIn](self, "p_animateSwatchIn");
  }
}

- (void)deliverCGImage:(CGImage *)a3
{
  CGImage *v5;
  TSDSwatchRenderingResult *v6;

  if (-[TSDSwatchRenderingOperation needsPressedStateBackground](self, "needsPressedStateBackground"))
  {
    v5 = -[TSDSwatchRenderingOperation p_newSwatchPressedStateBackgroundFromCGImage:](self, "p_newSwatchPressedStateBackgroundFromCGImage:", a3);
    v6 = +[TSDSwatchRenderingResult renderingResultWithForeground:background:](TSDSwatchRenderingResult, "renderingResultWithForeground:background:", a3, v5);
    if (v5)
      CGImageRelease(v5);
  }
  else
  {
    v6 = +[TSDSwatchRenderingResult renderingResultWithForeground:background:](TSDSwatchRenderingResult, "renderingResultWithForeground:background:", a3, 0);
  }
  self->mDeliveredImage = CGImageRetain(a3);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    -[TSDSwatchRenderingOperation p_deliverResultOnMainThread:](self, "p_deliverResultOnMainThread:", v6);
  else
    -[TSDSwatchRenderingOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_p_deliverResultOnMainThread_, v6, 0);
}

- (CGImage)deliveredImage
{
  return self->mDeliveredImage;
}

- (BOOL)needsPressedStateBackground
{
  return 0;
}

- (UIEdgeInsets)swatchEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)doWorkWithReadLock
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDSwatchRenderingOperation doWorkWithReadLock]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDSwatchRenderingOperation.m"), 271, CFSTR("Subclasses must override"));
}

- (void)main
{
  -[TSKAccessController performRead:withTarget:argument:](-[TSKDocumentRoot accessController](self->mDocumentRoot, "accessController"), "performRead:withTarget:argument:", sel_doWorkWithReadLock, self, 0);
}

- (UIView)view
{
  return (UIView *)objc_getProperty(self, a2, 248, 1);
}

- (void)setView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (TSSPreset)preset
{
  return self->mPreset;
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->mImageSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)imageScale
{
  return self->mImageScale;
}

- (CGRect)swatchFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->mSwatchFrame, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)insertPopoverPageType
{
  return self->mInsertPopoverPageType;
}

- (void)setInsertPopoverPageType:(unint64_t)a3
{
  self->mInsertPopoverPageType = a3;
}

- (unint64_t)insertPopoverPageNumber
{
  return self->mInsertPopoverPageNumber;
}

- (void)setInsertPopoverPageNumber:(unint64_t)a3
{
  self->mInsertPopoverPageNumber = a3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 352, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 352);
}

@end
