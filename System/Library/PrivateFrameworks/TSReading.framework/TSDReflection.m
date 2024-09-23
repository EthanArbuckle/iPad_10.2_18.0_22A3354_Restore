@implementation TSDReflection

+ (id)reflection
{
  return objc_alloc_init((Class)a1);
}

- (TSDReflection)init
{
  return -[TSDReflection initWithOpacity:fadeAcceleration:](self, "initWithOpacity:fadeAcceleration:", 0.5, 1.79999995);
}

- (TSDReflection)initWithOpacity:(double)a3 fadeAcceleration:(double)a4
{
  TSDReflection *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDReflection;
  v5 = -[TSDReflection init](&v8, sel_init);
  if (v5)
  {
    TSUClamp();
    v5->mOpacity = v6;
    v5->mFadeAcceleration = a4;
  }
  return v5;
}

- (TSDReflection)initWithOpacity:(double)a3
{
  return -[TSDReflection initWithOpacity:fadeAcceleration:](self, "initWithOpacity:fadeAcceleration:", a3, 1.79999995);
}

- (BOOL)isEqual:(id)a3
{
  double v5;
  double v6;
  double v7;

  if (a3 == self)
    return 1;
  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  -[TSDReflection opacity](self, "opacity");
  v6 = v5;
  objc_msgSend(a3, "opacity");
  return v6 == v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TSDReflection opacity](self, "opacity");
  v6 = v5;
  -[TSDReflection fadeAcceleration](self, "fadeAcceleration");
  return (id)objc_msgSend(v4, "initWithOpacity:fadeAcceleration:", v6, v7);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSDMutableReflection *v4;
  double v5;
  double v6;
  double v7;

  v4 = +[TSDMutableReflection allocWithZone:](TSDMutableReflection, "allocWithZone:", a3);
  -[TSDReflection opacity](self, "opacity");
  v6 = v5;
  -[TSDReflection fadeAcceleration](self, "fadeAcceleration");
  return -[TSDReflection initWithOpacity:fadeAcceleration:](v4, "initWithOpacity:fadeAcceleration:", v6, v7);
}

- (unint64_t)hash
{
  return TSUHash();
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  -[TSDReflection opacity](self, "opacity");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p opacity=%g>"), v5, self, v6);
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__TSDReflection_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __38__TSDReflection_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDReflection mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDReflection.m"), 86, CFSTR("nil object after cast"));
  }
  objc_msgSend(*(id *)(a1 + 40), "opacity");
  v6 = v5;
  objc_msgSend(v2, "opacity");
  if (v6 == v7)
    return 5;
  else
    return 4;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__TSDReflection_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDReflection *__50__TSDReflection_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double *v7;
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

  if (!*(_QWORD *)(a1 + 32) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "opacity");
    v4 = v14;
    goto LABEL_6;
  }
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  objc_msgSend(*(id *)(a1 + 40), "opacity");
  v4 = v3;
  if (!v2)
  {
LABEL_6:
    v15 = *(double *)(a1 + 48);
    v7 = (double *)(a1 + 48);
    v9 = v15;
    objc_msgSend(*((id *)v7 - 1), "fadeAcceleration");
    v11 = v16;
    objc_msgSend(*((id *)v7 - 1), "fadeAcceleration");
    v13 = v17;
    v6 = 0.0;
    goto LABEL_7;
  }
  objc_msgSend(v2, "opacity");
  v6 = v5;
  v8 = *(double *)(a1 + 48);
  v7 = (double *)(a1 + 48);
  v9 = v8;
  objc_msgSend(*((id *)v7 - 1), "fadeAcceleration");
  v11 = v10;
  objc_msgSend(v2, "fadeAcceleration");
  v13 = v12;
LABEL_7:
  v18 = TSDMixFloats(v4, v6, v9);
  return -[TSDReflection initWithOpacity:fadeAcceleration:]([TSDReflection alloc], "initWithOpacity:fadeAcceleration:", v18, TSDMixFloats(v11, v13, *v7));
}

+ (BOOL)canMixWithNilObjects
{
  return 1;
}

- (double)opacity
{
  return self->mOpacity;
}

- (double)fadeAcceleration
{
  return self->mFadeAcceleration;
}

@end
