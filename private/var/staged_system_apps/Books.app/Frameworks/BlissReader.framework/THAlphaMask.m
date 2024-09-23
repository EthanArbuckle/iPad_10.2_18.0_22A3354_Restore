@implementation THAlphaMask

- (THAlphaMask)initWithSize:(CGSize)a3 resolution:(int)a4 renderBlock:(id)a5
{
  uint64_t v6;
  double height;
  double width;
  THAlphaMask *v9;
  THAlphaMask *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGContext *v20;
  __int128 v21;
  __int128 v22;
  CGAffineTransform v24;
  objc_super v25;
  CGRect v26;

  v6 = *(_QWORD *)&a4;
  height = a3.height;
  width = a3.width;
  v25.receiver = self;
  v25.super_class = (Class)THAlphaMask;
  v9 = -[THAlphaMask init](&v25, "init");
  v10 = v9;
  if (v9)
  {
    -[THAlphaMask p_maxSizeForResolution:naturalSize:](v9, "p_maxSizeForResolution:naturalSize:", v6, width, height);
    v13 = fmin(v11 / width, v12 / height);
    v14 = TSDMultiplySizeScalar(width, height, v13);
    v17 = TSDCeilSize(v15, v14, v16);
    v19 = v18;
    v20 = (CGContext *)TSDBitmapContextCreate(10);
    v10->_bitmapContext = v20;
    v26.origin.x = 0.0;
    v26.origin.y = 0.0;
    v26.size.width = v17;
    v26.size.height = v19;
    CGContextClearRect(v20, v26);
    CGContextScaleCTM(v10->_bitmapContext, v13, v13);
    if (a5)
      (*((void (**)(id, CGContext *))a5 + 2))(a5, v10->_bitmapContext);
    CGAffineTransformMakeScale(&v24, v13, v13);
    v22 = *(_OWORD *)&v24.c;
    v21 = *(_OWORD *)&v24.tx;
    *(_OWORD *)&v10->_naturalToBitmapTransform.a = *(_OWORD *)&v24.a;
    *(_OWORD *)&v10->_naturalToBitmapTransform.c = v22;
    *(_OWORD *)&v10->_naturalToBitmapTransform.tx = v21;
  }
  return v10;
}

- (void)dealloc
{
  CGContext *bitmapContext;
  objc_super v4;

  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
    CGContextRelease(bitmapContext);
  v4.receiver = self;
  v4.super_class = (Class)THAlphaMask;
  -[THAlphaMask dealloc](&v4, "dealloc");
}

- (BOOL)testPoint:(CGPoint)a3
{
  double y;
  double x;
  BOOL result;
  double v7;
  double v8;
  size_t v9;
  uint64_t v10;
  double v11;
  unint64_t v12;

  y = a3.y;
  x = a3.x;
  if (!self->_bitmapContext)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAlphaMask testPoint:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/THAlphaMask.m"), 67, CFSTR("no bitmap context"));
    if (!self->_bitmapContext)
      return 0;
  }
  result = 0;
  v7 = self->_naturalToBitmapTransform.tx
     + y * self->_naturalToBitmapTransform.c
     + self->_naturalToBitmapTransform.a * x;
  if (v7 >= 0.0)
  {
    v8 = self->_naturalToBitmapTransform.ty
       + y * self->_naturalToBitmapTransform.d
       + self->_naturalToBitmapTransform.b * x;
    if (v8 >= 0.0)
    {
      v9 = (unint64_t)TSURound(0, v8);
      v11 = TSURound(v10, v7);
      if (CGBitmapContextGetHeight(self->_bitmapContext) > v9
        && CGBitmapContextGetWidth(self->_bitmapContext) > (unint64_t)v11)
      {
        v12 = (unint64_t)v11 + CGBitmapContextGetBytesPerRow(self->_bitmapContext) * v9;
        return *((_BYTE *)CGBitmapContextGetData(self->_bitmapContext) + v12) != 0;
      }
      return 0;
    }
  }
  return result;
}

- (CGSize)p_maxSizeForResolution:(int)a3 naturalSize:(CGSize)result
{
  CGFloat v4;

  if (a3 == 2)
  {
    v4 = 64.0;
LABEL_7:
    result.height = v4;
    result.width = v4;
    return result;
  }
  if (a3 == 1)
  {
    v4 = 640.0;
    goto LABEL_7;
  }
  if (a3)
  {
    result.width = CGSizeZero.width;
    result.height = CGSizeZero.height;
  }
  return result;
}

@end
