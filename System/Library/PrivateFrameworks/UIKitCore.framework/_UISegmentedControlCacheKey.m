@implementation _UISegmentedControlCacheKey

- (_UISegmentedControlCacheKey)initWithCornerRadius:(double)a3 capSize:(CGSize)a4 scale:(double)a5 state:(unint64_t)a6 primaryColor:(CGColor *)a7
{
  CGFloat height;
  CGFloat width;
  _UISegmentedControlCacheKey *v13;
  _UISegmentedControlCacheKey *v14;
  objc_super v16;

  height = a4.height;
  width = a4.width;
  v16.receiver = self;
  v16.super_class = (Class)_UISegmentedControlCacheKey;
  v13 = -[_UISegmentedControlCacheKey init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_size.height = height;
    v13->_cornerRadius = a3;
    v13->_size.width = width;
    v13->_state = a6;
    CGColorRetain(a7);
    v14->_primaryColor = a7;
    v14->_scale = a5;
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_primaryColor);
  v3.receiver = self;
  v3.super_class = (Class)_UISegmentedControlCacheKey;
  -[_UISegmentedControlCacheKey dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  float64x2_t v2;
  CGSize size;
  CFHashCode primaryColor;
  unint64_t state;
  int8x16_t v6;
  CGSize v8;
  float64x2_t v9;

  v2 = *(float64x2_t *)&self->_cornerRadius;
  size = self->_size;
  state = self->_state;
  primaryColor = (CFHashCode)self->_primaryColor;
  if (primaryColor)
  {
    v8 = size;
    v9 = v2;
    primaryColor = CFHash((CFTypeRef)primaryColor);
    size = v8;
    v2 = v9;
  }
  v6 = veorq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)size), (int8x16_t)vcvtq_u64_f64(v2));
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) ^ primaryColor ^ state;
}

- (_UISegmentedControlCacheKey)initWithSize:(int)a3 scale:(double)a4 primaryColor:(CGColor *)a5 background:(BOOL)a6
{
  _BOOL4 v6;
  _UISegmentedControlCacheKey *v10;
  _UISegmentedControlCacheKey *v11;
  objc_super v13;

  v6 = a6;
  v13.receiver = self;
  v13.super_class = (Class)_UISegmentedControlCacheKey;
  v10 = -[_UISegmentedControlCacheKey init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_size.width = 0.0;
    v10->_size.height = (double)a3;
    CGColorRetain(a5);
    v11->_state = v6;
    v11->_primaryColor = a5;
    v11->_scale = a4;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  _UISegmentedControlCacheKey *v4;
  BOOL v5;

  v4 = (_UISegmentedControlCacheKey *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[_UISegmentedControlCacheKey isEqualToCacheKey:](self, "isEqualToCacheKey:", v4);
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  CGColorRef *v4;
  CGColorRef *v5;
  BOOL v6;
  BOOL v7;

  v4 = (CGColorRef *)a3;
  v5 = v4;
  v7 = v4
    && (self->_size.width == *((double *)v4 + 1) ? (v6 = self->_size.height == *((double *)v4 + 2)) : (v6 = 0),
        v6
     && self->_cornerRadius == *((double *)v4 + 3)
     && self->_scale == *((double *)v4 + 4)
     && (CGColorRef)self->_state == v4[5])
    && CGColorEqualToColor(self->_primaryColor, v4[6]);

  return v7;
}

@end
