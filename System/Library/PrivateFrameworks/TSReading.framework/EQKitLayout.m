@implementation EQKitLayout

- (EQKitLayout)init
{
  return -[EQKitLayout initWithRoot:environment:](self, "initWithRoot:environment:", 0, 0);
}

- (EQKitLayout)initWithRoot:(id)a3 environment:(id)a4
{
  EQKitLayout *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EQKitLayout;
  v6 = -[EQKitLayout init](&v8, sel_init);
  if (v6)
  {
    v6->mRoot = (EQKitRootNode *)a3;
    v6->mEnvironment = (EQKitEnvironmentInstance *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitLayout;
  -[EQKitLayout dealloc](&v3, sel_dealloc);
}

- (EQKitLayout)layoutWithContext:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  _BYTE v13[608];

  self->mBox = 0;
  self->mScale = 1.0;
  if (a3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = -[EQKitRootNode attributeCollection](self->mRoot, "attributeCollection");
      if (v5)
      {
        -[EQKitEnvironmentInstance beginLayout](self->mEnvironment, "beginLayout");
        EQKitLayoutManager::EQKitLayoutManager(v13, a3, self->mEnvironment, v5);
        self->mBox = EQKitLayoutManager::layoutExpression((EQKitLayoutManager *)v13, self->mRoot, &self->mAscent, &self->mDescent, &self->mLeading, &self->mNaturalAlignmentOffset, &self->mSingleLineHeight);
        objc_msgSend(a3, "containerWidth");
        if (v6 > 0.0)
        {
          -[EQKitBox width](self->mBox, "width");
          if (v7 > 0.0)
          {
            objc_msgSend(a3, "containerWidth");
            v9 = v8;
            -[EQKitBox width](self->mBox, "width");
            *(float *)&v10 = v9 / v10;
            self->mScale = fminf(*(float *)&v10, 1.0);
          }
        }
        -[EQKitEnvironmentInstance endLayout](self->mEnvironment, "endLayout");
        EQKitLayoutManager::~EQKitLayoutManager((EQKitLayoutManager *)v13);
      }
    }
    return (EQKitLayout *)(self->mBox != 0);
  }
  else
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[EQKitLayout layoutWithContext:]"), CFSTR("EQKitLayoutPrivate.mm"), 57, CFSTR("invalid inContext"));
    return 0;
  }
}

- (double)height
{
  double mAscent;
  double v4;
  double v5;
  double v6;

  if (self->mSingleLineHeight)
  {
    mAscent = self->mAscent;
  }
  else
  {
    -[EQKitBox height](self->mBox, "height");
    v5 = v4 + self->mLeading * 0.5;
    mAscent = self->mAscent;
    if (v5 > mAscent)
    {
      -[EQKitBox height](self->mBox, "height");
      mAscent = v6 + self->mLeading * 0.5;
    }
  }
  return mAscent * self->mScale;
}

- (double)depth
{
  double mDescent;
  double v4;
  double v5;

  if (self->mSingleLineHeight)
  {
    mDescent = self->mDescent;
  }
  else
  {
    -[EQKitBox depth](self->mBox, "depth");
    mDescent = self->mDescent;
    if (v4 + self->mLeading * 0.5 > mDescent)
    {
      -[EQKitBox depth](self->mBox, "depth");
      mDescent = v5 + self->mLeading * 0.5;
    }
  }
  return mDescent * self->mScale;
}

- (double)width
{
  double v3;

  -[EQKitBox width](self->mBox, "width");
  return v3 * self->mScale;
}

- (double)vsize
{
  double v3;
  double v4;
  double v5;

  -[EQKitLayout height](self, "height");
  v4 = v3;
  -[EQKitLayout depth](self, "depth");
  return v4 + v5;
}

- (double)naturalAlignmentOffset
{
  return self->mNaturalAlignmentOffset * self->mScale;
}

- (CGRect)erasableBounds
{
  EQKitBox *mBox;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGAffineTransform v12;
  CGRect v13;

  mBox = self->mBox;
  if (mBox)
  {
    -[EQKitBox erasableBounds](mBox, "erasableBounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    CGAffineTransformMakeScale(&v12, self->mScale, self->mScale);
    v13.origin.x = v5;
    v13.origin.y = v7;
    v13.size.width = v9;
    v13.size.height = v11;
    return CGRectApplyAffineTransform(v13, &v12);
  }
  else
  {
    return *(CGRect *)*(_QWORD *)&MEMORY[0x24BDBF090];
  }
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  CGAffineTransform v8;

  y = a4.y;
  x = a4.x;
  CGContextSaveGState(a3);
  CGContextScaleCTM(a3, self->mScale, self->mScale);
  CGAffineTransformMakeScale(&v8, 1.0 / self->mScale, 1.0 / self->mScale);
  -[EQKitBox renderIntoContext:offset:](self->mBox, "renderIntoContext:offset:", a3, vaddq_f64(*(float64x2_t *)&v8.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v8.c, y), *(float64x2_t *)&v8.a, x)));
  CGContextRestoreGState(a3);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p box=%@>"), NSStringFromClass(v4), self, self->mBox);
}

- (EQKitBox)box
{
  return self->mBox;
}

@end
