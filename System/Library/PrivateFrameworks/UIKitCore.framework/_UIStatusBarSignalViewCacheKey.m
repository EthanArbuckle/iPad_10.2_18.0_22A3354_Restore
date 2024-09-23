@implementation _UIStatusBarSignalViewCacheKey

- (_UIStatusBarSignalViewCacheKey)initWithClass:(Class)a3 size:(CGSize)a4 rect:(CGRect)a5 radius:(double)a6 lineWidth:(double)a7 alternate:(BOOL)a8 scale:(double)a9
{
  return -[_UIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](self, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a3, a8, a4.width, a4.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6, a7, *MEMORY[0x1E0C9D820], *(_QWORD *)(MEMORY[0x1E0C9D820] + 8), *MEMORY[0x1E0C9D628], *(_QWORD *)(MEMORY[0x1E0C9D628] + 8), *(_QWORD *)(MEMORY[0x1E0C9D628] + 16), *(_QWORD *)(MEMORY[0x1E0C9D628] + 24), *(_QWORD *)&a9);
}

- (double)initWithClass:(double)a3 size:(double)a4 rect:(double)a5 radius:(double)a6 lineWidth:(double)a7 secondarySize:(double)a8 secondaryRect:(double)a9 alternate:(uint64_t)a10 scale:(uint64_t)a11
{
  double *result;
  objc_super v34;

  v34.receiver = a1;
  v34.super_class = (Class)_UIStatusBarSignalViewCacheKey;
  result = (double *)objc_msgSendSuper2(&v34, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = a11;
    result[2] = a2;
    result[3] = a3;
    result[4] = a4;
    result[5] = a5;
    result[6] = a6;
    result[7] = a7;
    result[8] = a8;
    result[9] = a9;
    *((_QWORD *)result + 10) = a17;
    *((_QWORD *)result + 11) = a18;
    *((_QWORD *)result + 12) = a19;
    *((_QWORD *)result + 13) = a20;
    *((_QWORD *)result + 14) = a21;
    *((_QWORD *)result + 15) = a22;
    *((_BYTE *)result + 128) = a12;
    *((_QWORD *)result + 17) = a23;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3;
  int8x16_t v4;

  v3 = -[objc_class hash](self->_classType, "hash");
  v4 = veorq_s8(veorq_s8(veorq_s8((int8x16_t)vcvtq_s64_f64((float64x2_t)self->_size), (int8x16_t)vcvtq_s64_f64((float64x2_t)self->_rect.size)), veorq_s8((int8x16_t)vcvtq_s64_f64((float64x2_t)self->_rect.origin), (int8x16_t)vcvtq_s64_f64(*(float64x2_t *)&self->_radius))), veorq_s8((int8x16_t)vcvtq_s64_f64((float64x2_t)self->_secondarySize), (int8x16_t)vcvtq_s64_f64((float64x2_t)self->_secondaryRect.origin)));
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)) ^ (uint64_t)self->_secondaryRect.size.width ^ (uint64_t)self->_secondaryRect.size.height ^ (uint64_t)self->_scale ^ v3 ^ self->_alternate;
}

- (BOOL)isEqual:(id)a3
{
  _UIStatusBarSignalViewCacheKey *v4;
  BOOL v5;

  v4 = (_UIStatusBarSignalViewCacheKey *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[_UIStatusBarSignalViewCacheKey isEqualToCacheKey:](self, "isEqualToCacheKey:", v4);
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  CGRect *v4;
  CGRect *v5;
  BOOL v6;
  BOOL v7;

  v4 = (CGRect *)a3;
  v5 = v4;
  if (self->_classType != *(Class *)&v4->origin.y
    || (self->_size.width == v4->size.width ? (v6 = self->_size.height == v4->size.height) : (v6 = 0),
        !v6
     || !CGRectEqualToRect(self->_rect, v4[1])
     || vabdd_f64(self->_radius, v5[2].origin.x) > 0.00000011920929
     || vabdd_f64(self->_lineWidth, v5[2].origin.y) > 0.00000011920929))
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = 0;
  if (self->_secondarySize.width == v5[2].size.width && self->_secondarySize.height == v5[2].size.height)
  {
    if (CGRectEqualToRect(self->_secondaryRect, v5[3])
      && self->_alternate == LOBYTE(v5[4].origin.x)
      && vabdd_f64(self->_scale, v5[4].origin.y) <= 0.00000011920929)
    {
      v7 = 1;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v7;
}

@end
