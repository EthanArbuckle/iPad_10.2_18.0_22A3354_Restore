@implementation EQKitCompoundBox

- (EQKitCompoundBox)initWithChildBoxes:(id)a3
{
  EQKitCompoundBox *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EQKitCompoundBox;
  v4 = -[EQKitCompoundBox init](&v6, sel_init);
  if (v4)
    v4->mChildBoxes = (NSArray *)objc_msgSend(a3, "copy");
  return v4;
}

- (EQKitCompoundBox)init
{
  return -[EQKitCompoundBox initWithChildBoxes:](self, "initWithChildBoxes:", 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitCompoundBox;
  -[EQKitCompoundBox dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithChildBoxes:", -[EQKitCompoundBox childBoxes](self, "childBoxes"));
}

- (BOOL)isEqual:(id)a3
{
  EQKitCompoundBox *v3;
  BOOL v4;
  EQKitCompoundBox *v6;
  EQKitCompoundBox *v7;

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
        v6 = -[EQKitCompoundBox childBoxes](v3, "childBoxes");
        self = (EQKitCompoundBox *)objc_msgSend(a3, "childBoxes");
        if (v6 == self)
        {
          LOBYTE(self) = 1;
        }
        else
        {
          v7 = self;
          LOBYTE(self) = 0;
          if (v6 && v7)
            LOBYTE(self) = -[EQKitCompoundBox isEqual:](v6, "isEqual:");
        }
      }
    }
  }
  return (char)self;
}

- (double)height
{
  if (!self->mDimensionsValid)
  {
    -[EQKitCompoundBox p_cacheDimensionsForHeight:depth:width:](self, "p_cacheDimensionsForHeight:depth:width:", &self->mHeight, &self->mDepth, &self->mWidth);
    self->mDimensionsValid = 1;
  }
  return self->mHeight;
}

- (double)depth
{
  if (!self->mDimensionsValid)
  {
    -[EQKitCompoundBox p_cacheDimensionsForHeight:depth:width:](self, "p_cacheDimensionsForHeight:depth:width:", &self->mHeight, &self->mDepth, &self->mWidth);
    self->mDimensionsValid = 1;
  }
  return self->mDepth;
}

- (double)width
{
  if (!self->mDimensionsValid)
  {
    -[EQKitCompoundBox p_cacheDimensionsForHeight:depth:width:](self, "p_cacheDimensionsForHeight:depth:width:", &self->mHeight, &self->mDepth, &self->mWidth);
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
    -[EQKitCompoundBox p_cacheErasableBounds](self, "p_cacheErasableBounds");
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
  -[EQKitCompoundBox height](self, "height");
  v6 = v5;
  -[EQKitCompoundBox depth](self, "depth");
  v8 = v7;
  -[EQKitCompoundBox width](self, "width");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f childBoxes=%@"), v4, self, v6, v8, v9, -[EQKitCompoundBox childBoxes](self, "childBoxes"));
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  if (a3)
    *a3 = 0.0;
  if (a4)
    *a4 = 0.0;
  if (a5)
    *a5 = 0.0;
}

- (CGRect)p_cacheErasableBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSArray)childBoxes
{
  return self->mChildBoxes;
}

@end
