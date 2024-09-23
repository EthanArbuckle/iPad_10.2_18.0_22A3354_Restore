@implementation EQKitPathBox

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 paddingLeft:(double)a5 paddingRight:(double)a6 cgColor:(CGColor *)a7 drawingMode:(int)a8 lineWidth:(double)a9
{
  EQKitPathBox *v16;
  CGMutablePathRef MutableCopy;
  CGColor *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)EQKitPathBox;
  v16 = -[EQKitPathBox init](&v20, sel_init);
  if (v16)
  {
    if (a3)
      MutableCopy = CGPathCreateMutableCopy(a3);
    else
      MutableCopy = 0;
    v16->mCGPath = MutableCopy;
    v16->mHeight = a4;
    v16->mPaddingLeft = a5;
    v16->mPaddingRight = a6;
    if (a7)
      v18 = (CGColor *)CFRetain(a7);
    else
      v18 = 0;
    v16->mCGColor = v18;
    v16->mDrawingMode = a8;
    v16->mLineWidth = a9;
  }
  return v16;
}

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 paddingLeft:(double)a5 paddingRight:(double)a6 cgColor:(CGColor *)a7
{
  return -[EQKitPathBox initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:](self, "initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:", a3, a7, 0, a4, a5, a6, 1.0);
}

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 cgColor:(CGColor *)a5
{
  return -[EQKitPathBox initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:](self, "initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:", a3, a5, 0, a4, 0.0, 0.0, 1.0);
}

- (EQKitPathBox)initWithCGPath:(CGPath *)a3 height:(double)a4 cgColor:(CGColor *)a5 drawingMode:(int)a6 lineWidth:(double)a7
{
  return -[EQKitPathBox initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:](self, "initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:", a3, a5, *(_QWORD *)&a6, a4, 0.0, 0.0, a7);
}

- (EQKitPathBox)init
{
  return -[EQKitPathBox initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:](self, "initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:", 0, 0, 0, 0.0, 0.0, 0.0, 1.0);
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->mCGPath);
  CGColorRelease(self->mCGColor);
  v3.receiver = self;
  v3.super_class = (Class)EQKitPathBox;
  -[EQKitPathBox dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  CGPath *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGColor *v12;
  uint64_t v13;
  double v14;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[EQKitPathBox cgPath](self, "cgPath");
  -[EQKitPathBox height](self, "height");
  v7 = v6;
  -[EQKitPathBox paddingLeft](self, "paddingLeft");
  v9 = v8;
  -[EQKitPathBox paddingRight](self, "paddingRight");
  v11 = v10;
  v12 = -[EQKitPathBox color](self, "color");
  v13 = -[EQKitPathBox drawingMode](self, "drawingMode");
  -[EQKitPathBox lineWidth](self, "lineWidth");
  return (id)objc_msgSend(v4, "initWithCGPath:height:paddingLeft:paddingRight:cgColor:drawingMode:lineWidth:", v5, v12, v13, v7, v9, v11, v14);
}

- (BOOL)isEqual:(id)a3
{
  EQKitPathBox *v3;
  BOOL v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  double v17;
  double v18;
  const CGPath *v19;
  EQKitPathBox *v20;

  v3 = self;
  v4 = self == a3;
  LOBYTE(self) = self == a3;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
      if ((_DWORD)self)
      {
        -[EQKitPathBox height](v3, "height");
        v7 = v6;
        objc_msgSend(a3, "height");
        if (v7 != v8)
          goto LABEL_14;
        -[EQKitPathBox paddingLeft](v3, "paddingLeft");
        v10 = v9;
        objc_msgSend(a3, "paddingLeft");
        if (v10 != v11)
          goto LABEL_14;
        -[EQKitPathBox paddingRight](v3, "paddingRight");
        v13 = v12;
        objc_msgSend(a3, "paddingRight");
        if (v13 != v14)
          goto LABEL_14;
        LODWORD(self) = CGColorEqualToColor(-[EQKitPathBox color](v3, "color"), (CGColorRef)objc_msgSend(a3, "color"));
        if (!(_DWORD)self)
          return (char)self;
        v15 = -[EQKitPathBox drawingMode](v3, "drawingMode");
        if (v15 != objc_msgSend(a3, "drawingMode")
          || (-[EQKitPathBox lineWidth](v3, "lineWidth"), v17 = v16, objc_msgSend(a3, "lineWidth"), v17 != v18))
        {
LABEL_14:
          LOBYTE(self) = 0;
          return (char)self;
        }
        v19 = -[EQKitPathBox cgPath](v3, "cgPath");
        self = (EQKitPathBox *)objc_msgSend(a3, "cgPath");
        if (v19 == (const CGPath *)self)
        {
          LOBYTE(self) = 1;
        }
        else
        {
          v20 = self;
          LOBYTE(self) = 0;
          if (v19 && v20)
            LOBYTE(self) = CGPathEqualToPath(v19, (CGPathRef)v20);
        }
      }
    }
  }
  return (char)self;
}

- (double)depth
{
  if (!self->mDimensionsValid)
  {
    -[EQKitPathBox p_cacheDimensions](self, "p_cacheDimensions");
    self->mDimensionsValid = 1;
  }
  return self->mDepth;
}

- (double)width
{
  if (!self->mDimensionsValid)
  {
    -[EQKitPathBox p_cacheDimensions](self, "p_cacheDimensions");
    self->mDimensionsValid = 1;
  }
  return self->mWidth;
}

- (CGRect)erasableBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (self->mErasableBoundsValid)
  {
    x = self->mErasableBounds.origin.x;
    y = self->mErasableBounds.origin.y;
    width = self->mErasableBounds.size.width;
    height = self->mErasableBounds.size.height;
  }
  else
  {
    -[EQKitPathBox p_cacheErasableBounds](self, "p_cacheErasableBounds");
    self->mErasableBounds.origin.x = x;
    self->mErasableBounds.origin.y = y;
    self->mErasableBounds.size.width = width;
    self->mErasableBounds.size.height = height;
    self->mErasableBoundsValid = 1;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  CGColor *mCGColor;

  if (a3 && self->mCGPath)
  {
    y = a4.y;
    x = a4.x;
    CGContextSaveGState(a3);
    CGContextTranslateCTM(a3, x + self->mPaddingLeft, y - self->mHeight);
    CGContextAddPath(a3, self->mCGPath);
    mCGColor = self->mCGColor;
    if (mCGColor)
    {
      CGContextSetFillColorWithColor(a3, mCGColor);
      CGContextSetStrokeColorWithColor(a3, self->mCGColor);
    }
    CGContextSetLineWidth(a3, self->mLineWidth);
    CGContextDrawPath(a3, (CGPathDrawingMode)self->mDrawingMode);
    CGContextRestoreGState(a3);
  }
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  CGPath *mCGPath;
  CGPoint v6;

  mCGPath = self->mCGPath;
  if (mCGPath)
  {
    v6.x = a4.x + self->mPaddingLeft;
    v6.y = a4.y - self->mHeight;
    EQKit::OpticalKern::Spec::appendEntry((EQKit::OpticalKern::Spec *)a3, v6, mCGPath);
  }
  return mCGPath != 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitPathBox height](self, "height");
  v6 = v5;
  -[EQKitPathBox depth](self, "depth");
  v8 = v7;
  -[EQKitPathBox width](self, "width");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f"), v4, self, v6, v8, v9);
}

- (void)p_cacheDimensions
{
  CGPath *mCGPath;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  CGRect PathBoundingBox;
  CGRect v11;
  CGRect v12;

  self->mDepth = 0.0;
  self->mWidth = 0.0;
  mCGPath = self->mCGPath;
  if (mCGPath)
  {
    PathBoundingBox = CGPathGetPathBoundingBox(mCGPath);
    x = PathBoundingBox.origin.x;
    y = PathBoundingBox.origin.y;
    width = PathBoundingBox.size.width;
    height = PathBoundingBox.size.height;
    if (!CGRectIsEmpty(PathBoundingBox))
    {
      v11.origin.x = x;
      v11.origin.y = y;
      v11.size.width = width;
      v11.size.height = height;
      v8 = CGRectGetHeight(v11);
      -[EQKitPathBox height](self, "height");
      self->mDepth = v8 - v9;
      v12.origin.x = x;
      v12.origin.y = y;
      v12.size.width = width;
      v12.size.height = height;
      self->mWidth = CGRectGetWidth(v12) + self->mPaddingLeft + self->mPaddingRight;
    }
  }
}

- (CGRect)p_cacheErasableBounds
{
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGPath *mCGPath;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect PathBoundingBox;
  CGRect result;

  v4 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  mCGPath = self->mCGPath;
  if (mCGPath)
  {
    PathBoundingBox = CGPathGetPathBoundingBox(mCGPath);
    x = PathBoundingBox.origin.x;
    y = PathBoundingBox.origin.y;
    width = PathBoundingBox.size.width;
    height = PathBoundingBox.size.height;
    if (!CGRectIsEmpty(PathBoundingBox))
    {
      -[EQKitPathBox height](self, "height");
      v3 = y - v12;
      v4 = x + self->mPaddingLeft;
      v5 = width;
      v6 = height;
    }
  }
  v13 = v4;
  v14 = v3;
  v15 = v5;
  v16 = v6;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGPath)cgPath
{
  return self->mCGPath;
}

- (double)height
{
  return self->mHeight;
}

- (double)paddingLeft
{
  return self->mPaddingLeft;
}

- (double)paddingRight
{
  return self->mPaddingRight;
}

- (CGColor)color
{
  return self->mCGColor;
}

- (int)drawingMode
{
  return self->mDrawingMode;
}

- (double)lineWidth
{
  return self->mLineWidth;
}

@end
