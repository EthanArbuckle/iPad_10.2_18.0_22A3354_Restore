@implementation IPARegion

- (IPARegion)init
{
  IPARegion *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IPARegion;
  v2 = -[IPARegion init](&v5, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_OWORD *)v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    *(_DWORD *)(v3 + 32) = 1065353216;
    v2->_imp = (void *)v3;
  }
  return v2;
}

- (IPARegion)initWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  IPARegion *v8;
  uint64_t v9;
  PA::Region *imp;
  IPARegion *result;
  _QWORD v12[4];
  objc_super v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsInfinite(a3))
  {
    result = (IPARegion *)_PFAssertFailHandler();
    __break(1u);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)IPARegion;
    v8 = -[IPARegion init](&v13, sel_init);
    if (v8)
    {
      v9 = operator new();
      *(_OWORD *)v9 = 0u;
      *(_OWORD *)(v9 + 16) = 0u;
      *(_DWORD *)(v9 + 32) = 1065353216;
      v8->_imp = (void *)v9;
      v14.origin.x = x;
      v14.origin.y = y;
      v14.size.width = width;
      v14.size.height = height;
      if (!CGRectIsEmpty(v14))
      {
        imp = (PA::Region *)v8->_imp;
        *(CGFloat *)v12 = x;
        *(CGFloat *)&v12[1] = y;
        *(CGFloat *)&v12[2] = width;
        *(CGFloat *)&v12[3] = height;
        PA::Region::Add(imp, (const PA::Rect *)v12);
      }
    }
    return v8;
  }
  return result;
}

- (IPARegion)initWithRegion:(id)a3
{
  uint64_t *v4;
  IPARegion *v5;
  uint64_t v6;
  IPARegion *result;
  objc_super v8;

  v4 = (uint64_t *)a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)IPARegion;
    v5 = -[IPARegion init](&v8, sel_init);
    if (v5)
    {
      v6 = operator new();
      std::unordered_set<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::unordered_set(v6, v4[1]);
      v5->_imp = (void *)v6;
    }

    return v5;
  }
  else
  {
    result = (IPARegion *)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

- (IPARegion)initWithRectArray:(id)a3
{
  id v4;
  IPARegion *v5;
  uint64_t v6;
  IPARegion *result;
  _QWORD v8[4];
  IPARegion *v9;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)IPARegion;
    v5 = -[IPARegion init](&v10, sel_init);
    if (v5)
    {
      v6 = operator new();
      *(_OWORD *)v6 = 0u;
      *(_OWORD *)(v6 + 16) = 0u;
      *(_DWORD *)(v6 + 32) = 1065353216;
      v5->_imp = (void *)v6;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __31__IPARegion_initWithRectArray___block_invoke;
      v8[3] = &unk_1E986E010;
      v9 = v5;
      objc_msgSend(v4, "enumerateRects:", v8);

    }
    return v5;
  }
  else
  {
    result = (IPARegion *)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

- (void)dealloc
{
  void *imp;
  uint64_t v4;
  objc_super v5;

  imp = self->_imp;
  if (imp)
  {
    v4 = std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)imp);
    MEMORY[0x1D82668A8](v4, 0x10A0C408EF24B1CLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)IPARegion;
  -[IPARegion dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __24__IPARegion_description__block_invoke;
  v11[3] = &unk_1E986E010;
  v4 = v3;
  v12 = v4;
  -[IPARegion enumerateRects:](self, "enumerateRects:", v11);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  v7 = -[IPARegion count](self, "count");
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p %lu rects: %@>"), v6, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[IPARegion initWithRegion:](+[IPAMutableRegion allocWithZone:](IPAMutableRegion, "allocWithZone:", a3), "initWithRegion:", self);
}

- (unint64_t)count
{
  return *((_QWORD *)self->_imp + 3);
}

- (BOOL)isEmpty
{
  return *((_QWORD *)self->_imp + 3) == 0;
}

- (unint64_t)hash
{
  uint64_t *v2;
  unint64_t result;
  int64x2_t v4;
  int8x16_t v5;

  v2 = (uint64_t *)*((_QWORD *)self->_imp + 2);
  if (!v2)
    return 0;
  result = 0;
  v4 = vdupq_n_s64(0xFFFuLL);
  do
  {
    v5 = vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vaddq_s64(*(int64x2_t *)(v2 + 3), v4), (uint64x2_t)xmmword_1D4CCD110), (int8x16_t)xmmword_1D4CCD120);
    result ^= (v2[2] + 4095) & 0xFFFFFFFF00000000 ^ v5.i64[0] ^ v5.i64[1] ^ ((unint64_t)(v2[5] + 4095) >> 32);
    v2 = (uint64_t *)*v2;
  }
  while (v2);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "isEqualToRegion:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqualToRegion:(id)a3
{
  _QWORD *imp;
  _QWORD *v4;
  _QWORD *v5;
  BOOL result;
  int8x8_t v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  unint64_t v14;
  BOOL v15;

  if (!a3)
    return 0;
  imp = self->_imp;
  v4 = (_QWORD *)*((_QWORD *)a3 + 1);
  if (imp[3] == v4[3])
  {
    v5 = imp + 2;
    while (1)
    {
      v5 = (_QWORD *)*v5;
      result = v5 == 0;
      if (!v5)
        return result;
      v7 = (int8x8_t)v4[1];
      if (!*(_QWORD *)&v7)
        return 0;
      v8 = (v5[2] + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(v5[3] + 4095) >> 32 << 24) ^ ((unint64_t)(v5[4] + 4095) >> 32 << 8) ^ ((unint64_t)(v5[5] + 4095) >> 32);
      v9 = (uint8x8_t)vcnt_s8(v7);
      v9.i16[0] = vaddlv_u8(v9);
      v10 = v9.u32[0];
      if (v9.u32[0] > 1uLL)
      {
        v11 = (v5[2] + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(v5[3] + 4095) >> 32 << 24) ^ ((unint64_t)(v5[4] + 4095) >> 32 << 8) ^ ((unint64_t)(v5[5] + 4095) >> 32);
        if (v8 >= *(_QWORD *)&v7)
          v11 = v8 % *(_QWORD *)&v7;
      }
      else
      {
        v11 = v8 & (*(_QWORD *)&v7 - 1);
      }
      v12 = *(_QWORD **)(*v4 + 8 * v11);
      if (!v12)
        return 0;
      v13 = (_QWORD *)*v12;
      if (!*v12)
        return 0;
      while (1)
      {
        v14 = v13[1];
        if (v8 == v14)
          break;
        if (v10 > 1)
        {
          if (v14 >= *(_QWORD *)&v7)
            v14 %= *(_QWORD *)&v7;
        }
        else
        {
          v14 &= *(_QWORD *)&v7 - 1;
        }
        if (v14 != v11)
          return 0;
LABEL_20:
        v13 = (_QWORD *)*v13;
        if (!v13)
          return 0;
      }
      if (!PA::RectEqualTo::operator()(v13 + 2, v5 + 2))
        goto LABEL_20;
      v15 = PA::RectEqualTo::operator()(v5 + 2, v13 + 2);
      result = 0;
      if (!v15)
        return result;
    }
  }
  return 0;
}

- (void)enumerateRects:(id)a3
{
  double *i;

  for (i = (double *)*((_QWORD *)self->_imp + 2); i; i = *(double **)i)
    (*((void (**)(id, SEL, double, double, double, double))a3 + 2))(a3, a2, i[2], i[3], i[4], i[5]);
}

- (CGRect)bounds
{
  double Bounds;
  double v3;
  double v4;
  double v5;
  CGRect result;

  Bounds = PA::Region::GetBounds(*((PA::Region **)self->_imp + 2));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = Bounds;
  return result;
}

- (BOOL)intersectsRect:(CGRect)a3
{
  _QWORD *imp;
  CGRect v5;
  _BYTE v6[40];

  imp = self->_imp;
  v5 = a3;
  PA::Region::Region((PA::Region *)v6, (const PA::Rect *)&v5);
  LOBYTE(imp) = PA::Region::Intersects(imp[2], (uint64_t)v6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v6);
  return (char)imp;
}

- (BOOL)intersectsRegion:(id)a3
{
  if (a3)
    return PA::Region::Intersects(*((_QWORD *)self->_imp + 2), *((_QWORD *)a3 + 1));
  else
    return 0;
}

- (BOOL)includesRect:(CGRect)a3
{
  PA::Region *imp;
  CGRect v5;
  _BYTE v6[40];

  imp = (PA::Region *)self->_imp;
  v5 = a3;
  PA::Region::Region((PA::Region *)v6, (const PA::Rect *)&v5);
  LOBYTE(imp) = PA::Region::Includes(imp, (const PA::Region *)v6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v6);
  return (char)imp;
}

- (BOOL)includesRegion:(id)a3
{
  return a3 && PA::Region::Includes((PA::Region *)self->_imp, *((const PA::Region **)a3 + 1));
}

- (double)area
{
  double *v2;
  double result;

  v2 = (double *)*((_QWORD *)self->_imp + 2);
  if (!v2)
    return 0.0;
  result = 0.0;
  do
  {
    result = result + v2[4] * v2[5];
    v2 = *(double **)v2;
  }
  while (v2);
  return result;
}

void __24__IPARegion_description__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{%g, %g}, {%g, %g}}"), *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:");

}

uint64_t __31__IPARegion_initWithRectArray___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  PA::Region *v5;
  _QWORD v7[4];

  v5 = *(PA::Region **)(*(_QWORD *)(a1 + 32) + 8);
  *(double *)v7 = a2;
  *(double *)&v7[1] = a3;
  *(double *)&v7[2] = a4;
  *(double *)&v7[3] = a5;
  return PA::Region::Add(v5, (const PA::Rect *)v7);
}

+ (id)region
{
  return objc_alloc_init((Class)a1);
}

+ (id)regionWithRect:(CGRect)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (id)regionWithRectArray:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRectArray:", v4);

  return v5;
}

+ (id)regionWithRegion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRegion:", v4);

  return v5;
}

- (id)regionByAddingRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v7, "addRect:", x, y, width, height);
  return v7;
}

- (id)regionByAddingRegion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "addRegion:", v4);

  return v5;
}

- (id)regionByAddingRectArray:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "addRectArray:", v4);

  return v5;
}

- (id)regionByRemovingRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v7, "removeRect:", x, y, width, height);
  return v7;
}

- (id)regionByRemovingRegion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "removeRegion:", v4);

  return v5;
}

- (id)regionByRemovingRectArray:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "removeRectArray:", v4);

  return v5;
}

- (id)regionByClippingToRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v7, "clipToRect:", x, y, width, height);
  return v7;
}

- (id)regionByClippingToRegion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "clipToRegion:", v4);

  return v5;
}

- (id)regionByClippingToRectArray:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "clipToRectArray:", v4);

  return v5;
}

- (id)regionByExcludingRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v7, "diffWithRect:", x, y, width, height);
  return v7;
}

- (id)regionByExcludingRegion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "diffWithRegion:", v4);

  return v5;
}

- (id)regionByScalingBy:(CGPoint)a3
{
  double y;
  double x;
  void *v5;

  y = a3.y;
  x = a3.x;
  v5 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "scaleBy:", x, y);
  return v5;
}

- (id)regionByTranslatingBy:(CGPoint)a3
{
  double y;
  double x;
  void *v5;

  y = a3.y;
  x = a3.x;
  v5 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "translateBy:", x, y);
  return v5;
}

- (id)regionByGrowingBy:(CGPoint)a3
{
  double y;
  double x;
  void *v5;

  y = a3.y;
  x = a3.x;
  v5 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "growBy:", x, y);
  return v5;
}

- (id)regionByGrowingBy:(CGPoint)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.y;
  v9 = a3.x;
  v10 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v10, "growBy:inRect:", v9, v8, x, y, width, height);
  return v10;
}

- (id)regionByShrinkingBy:(CGPoint)a3
{
  double y;
  double x;
  void *v5;

  y = a3.y;
  x = a3.x;
  v5 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "shrinkBy:", x, y);
  return v5;
}

- (id)regionByShrinkingBy:(CGPoint)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.y;
  v9 = a3.x;
  v10 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v10, "shrinkBy:inRect:", v9, v8, x, y, width, height);
  return v10;
}

- (id)regionByRoundingUp
{
  void *v2;

  v2 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v2, "roundUp");
  return v2;
}

- (id)regionByRoundingDown
{
  void *v2;

  v2 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v2, "roundDown");
  return v2;
}

- (id)regionByApplyingOrientation:(int64_t)a3 imageSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;

  height = a4.height;
  width = a4.width;
  v7 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v7, "applyOrientation:imageSize:", a3, width, height);
  return v7;
}

- (id)regionByApplyingAffineTransform:(CGAffineTransform *)a3
{
  void *v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  v5 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->tx;
  objc_msgSend(v4, "applyAffineTransform:", v7);
  return v4;
}

- (id)regionByFlippingInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)-[IPARegion mutableCopy](self, "mutableCopy");
  objc_msgSend(v7, "flipInRect:", x, y, width, height);
  return v7;
}

@end
