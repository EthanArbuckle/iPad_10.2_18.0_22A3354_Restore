@implementation TSDMaskInfo

- (TSDMaskInfo)initWithContext:(id)a3 geometry:(id)a4 pathSource:(id)a5
{
  TSDMaskInfo *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDMaskInfo;
  v6 = -[TSDDrawableInfo initWithContext:geometry:](&v10, sel_initWithContext_geometry_, a3, a4);
  if (v6)
  {
    if (!a5)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMaskInfo initWithContext:geometry:pathSource:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskInfo.m"), 33, CFSTR("invalid nil value for '%s'"), "pathSource");
    }
    -[TSDMaskInfo setPathSource:](v6, "setPathSource:", a5);
  }
  return v6;
}

- (TSDMaskInfo)initWithContext:(id)a3 geometry:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMaskInfo initWithContext:geometry:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskInfo.m"), 41, CFSTR("call -initWithContext:geometry:style: please"));
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMaskInfo;
  -[TSDDrawableInfo dealloc](&v3, sel_dealloc);
}

- (id)copyWithContext:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDMaskInfo;
  v4 = -[TSDDrawableInfo copyWithContext:](&v6, sel_copyWithContext_, a3);
  if (v4)
    v4[18] = -[TSDPathSource copyWithZone:](self->mPathSource, "copyWithZone:", -[TSDMaskInfo zone](self, "zone"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = v4;
    LOBYTE(v4) = -[TSDInfoGeometry isEqual:](-[TSDDrawableInfo geometry](self, "geometry"), "isEqual:", objc_msgSend(v4, "geometry"))&& (objc_msgSend(-[TSDPathSource bezierPath](-[TSDMaskInfo pathSource](self, "pathSource"), "bezierPath"), "isEqual:", objc_msgSend((id)objc_msgSend(v5, "pathSource"), "bezierPath")) & 1) != 0;
  }
  return (char)v4;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return 0;
}

- (void)setGeometry:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSDMaskInfo;
  -[TSDDrawableInfo setGeometry:](&v12, sel_setGeometry_);
  if (-[TSDDrawableInfo geometry](self, "geometry") == a3)
  {
    -[TSDInfoGeometry size](-[TSDDrawableInfo geometry](self, "geometry"), "size");
    v6 = v5;
    v8 = v7;
    -[TSDPathSource naturalSize](self->mPathSource, "naturalSize");
    if (v10 != v6 || v9 != v8)
    {
      -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 526);
      -[TSPObject willModify](self, "willModify");
      -[TSDPathSource setNaturalSize:](self->mPathSource, "setNaturalSize:", v6, v8);
    }
  }
}

- (void)setPathSource:(id)a3
{
  void *v5;
  uint64_t v6;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMaskInfo setPathSource:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskInfo.m"), 109, CFSTR("invalid nil value for '%s'"), "newPathSource");
  }
  if (self->mPathSource != a3)
  {
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 526);
    -[TSPObject willModify](self, "willModify");

    self->mPathSource = (TSDPathSource *)a3;
  }
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__TSDMaskInfo_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __36__TSDMaskInfo_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMaskInfo mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMaskInfo.m"), 126, CFSTR("nil object after cast"));
  }
  if (TSDMixingTypeWithPossiblyNilObjects(objc_msgSend(*(id *)(a1 + 40), "geometry"), objc_msgSend(v2, "geometry")) == 5)
    v5 = 5;
  else
    v5 = 3;
  v6 = TSDMixingTypeWithPossiblyNilObjects(objc_msgSend(*(id *)(a1 + 40), "pathSource"), objc_msgSend(v2, "pathSource"));
  result = TSDMixingTypeBestFromMixingTypes(v5, v6);
  if (result != 4)
    return 2;
  return result;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__TSDMaskInfo_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDMaskInfo *__48__TSDMaskInfo_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  return -[TSDMaskInfo initWithContext:geometry:pathSource:]([TSDMaskInfo alloc], "initWithContext:geometry:pathSource:", objc_msgSend(*(id *)(a1 + 40), "context"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "geometry"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "geometry"), *(double *)(a1 + 48)), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "pathSource"), "mixedObjectWithFraction:ofObject:", objc_msgSend(v2, "pathSource"), *(double *)(a1 + 48)));
}

- (TSDPathSource)pathSource
{
  return self->mPathSource;
}

@end
