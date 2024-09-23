@implementation EQKitOffsetVBox

- (EQKitOffsetVBox)init
{
  return -[EQKitOffsetVBox initWithChildBoxes:pivotIndex:offset:](self, "initWithChildBoxes:pivotIndex:offset:", 0, 0, 0.0);
}

- (EQKitOffsetVBox)initWithChildBoxes:(id)a3
{
  return -[EQKitOffsetVBox initWithChildBoxes:pivotIndex:offset:](self, "initWithChildBoxes:pivotIndex:offset:", a3, 0, 0.0);
}

- (EQKitOffsetVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4
{
  return -[EQKitOffsetVBox initWithChildBoxes:pivotIndex:offset:](self, "initWithChildBoxes:pivotIndex:offset:", a3, (double)a4);
}

- (EQKitOffsetVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4 offset:(double)a5
{
  EQKitOffsetVBox *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EQKitOffsetVBox;
  result = -[EQKitVBox initWithChildBoxes:pivotIndex:](&v7, sel_initWithChildBoxes_pivotIndex_, a3, a4);
  if (result)
    result->mOffset = a5;
  return result;
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EQKitOffsetVBox;
  -[EQKitVBox p_cacheDimensionsForHeight:depth:width:](&v8, sel_p_cacheDimensionsForHeight_depth_width_, a3, a4, a5);
  if (a3)
    *a3 = self->mOffset + *a3;
  if (a4)
    *a4 = *a4 - self->mOffset;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NSArray *v5;
  unint64_t v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[EQKitCompoundBox childBoxes](self, "childBoxes");
  v6 = -[EQKitVBox pivotIndex](self, "pivotIndex");
  -[EQKitOffsetVBox offset](self, "offset");
  return (id)objc_msgSend(v4, "initWithChildBoxes:pivotIndex:offset:", v5, v6);
}

- (BOOL)isEqual:(id)a3
{
  EQKitOffsetVBox *v3;
  BOOL v4;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  EQKitOffsetVBox *v10;
  EQKitOffsetVBox *v11;

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
        v6 = -[EQKitVBox pivotIndex](v3, "pivotIndex");
        if (v6 == objc_msgSend(a3, "pivotIndex")
          && (-[EQKitOffsetVBox offset](v3, "offset"), v8 = v7, objc_msgSend(a3, "offset"), v8 == v9))
        {
          v10 = -[EQKitCompoundBox childBoxes](v3, "childBoxes");
          self = (EQKitOffsetVBox *)objc_msgSend(a3, "childBoxes");
          if (v10 == self)
          {
            LOBYTE(self) = 1;
          }
          else
          {
            v11 = self;
            LOBYTE(self) = 0;
            if (v10 && v11)
              LOBYTE(self) = -[EQKitOffsetVBox isEqual:](v10, "isEqual:");
          }
        }
        else
        {
          LOBYTE(self) = 0;
        }
      }
    }
  }
  return (char)self;
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
  uint64_t v10;
  NSArray *v11;
  unint64_t v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitCompoundBox height](self, "height");
  v6 = v5;
  -[EQKitCompoundBox depth](self, "depth");
  v8 = v7;
  -[EQKitCompoundBox width](self, "width");
  v10 = v9;
  v11 = -[EQKitCompoundBox childBoxes](self, "childBoxes");
  v12 = -[EQKitVBox pivotIndex](self, "pivotIndex");
  -[EQKitOffsetVBox offset](self, "offset");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f childBoxes=%@ pivotIndex=%lu offset=%f"), v4, self, v6, v8, v10, v11, v12, v13);
}

- (double)offset
{
  return self->mOffset;
}

@end
