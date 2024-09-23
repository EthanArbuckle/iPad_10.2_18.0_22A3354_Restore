@implementation _UICollectionLayoutContainer

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSDirectionalEdgeInsets)effectiveContentInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  double width;
  double v7;
  double v8;
  double v9;
  double height;
  double v11;
  double v12;
  double v13;
  NSDirectionalEdgeInsets result;

  top = self->_contentInsets.top;
  leading = self->_contentInsets.leading;
  bottom = self->_contentInsets.bottom;
  trailing = self->_contentInsets.trailing;
  width = self->_contentSize.width;
  if (leading >= 0.5)
    v7 = 1.0;
  else
    v7 = self->_contentSize.width;
  v8 = leading * v7;
  if (trailing >= 0.5)
    width = 1.0;
  v9 = trailing * width;
  if (top >= 0.5)
    height = 1.0;
  else
    height = self->_contentSize.height;
  v11 = top * height;
  if (bottom >= 0.5)
    v12 = 1.0;
  else
    v12 = self->_contentSize.height;
  v13 = bottom * v12;
  result.trailing = v9;
  result.bottom = v13;
  result.leading = v8;
  result.top = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insetsEnvironment, 0);
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_contentInsets.top;
  leading = self->_contentInsets.leading;
  bottom = self->_contentInsets.bottom;
  trailing = self->_contentInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (double)initWithContentSize:(double)a3 contentInsets:(double)a4
{
  double *v13;
  double *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  if (!a1)
    return 0;
  v18.receiver = a1;
  v18.super_class = (Class)_UICollectionLayoutContainer;
  v13 = (double *)objc_msgSendSuper2(&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13[2] = fmax(a2, 0.0);
    v13[3] = fmax(a3, 0.0);
    v13[4] = a4;
    v13[5] = a5;
    v13[6] = a6;
    v13[7] = a7;
    +[_UIContentInsetsEnvironment nullEnvironment](_UIContentInsetsEnvironment, "nullEnvironment");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v14 + 1);
    *((_QWORD *)v14 + 1) = v15;

  }
  return v14;
}

- (CGSize)effectiveContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[_UICollectionLayoutContainer effectiveContentInsets](self, "effectiveContentInsets");
  v7 = v5 + v6;
  v8 = self->_contentSize.width - (v3 + v4);
  v9 = self->_contentSize.height - v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)initWithContentSize:(double)a3 contentInsets:(double)a4 insetsEnvironment:(double)a5
{
  id *v15;
  id *v16;
  objc_super v18;

  if (!a1)
    return 0;
  v18.receiver = a1;
  v18.super_class = (Class)_UICollectionLayoutContainer;
  v15 = (id *)objc_msgSendSuper2(&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    *((double *)v15 + 2) = fmax(a3, 0.0);
    *((double *)v15 + 3) = fmax(a4, 0.0);
    *((double *)v15 + 4) = a5;
    *((double *)v15 + 5) = a6;
    *((double *)v15 + 6) = a7;
    *((double *)v15 + 7) = a8;
    objc_storeStrong(v15 + 1, a2);
  }
  return v16;
}

- (id)containerUpdatingContentSize:(double)a3
{
  if (a1)
    a1 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:insetsEnvironment:]([_UICollectionLayoutContainer alloc], a1[1], a2, a3, *((double *)a1 + 4), *((double *)a1 + 5), *((double *)a1 + 6), *((double *)a1 + 7));
  return a1;
}

- (BOOL)isEqual:(id)a3
{
  float64x2_t *v4;
  BOOL v5;
  char v6;

  if (a3)
  {
    if (self == a3)
    {
      v6 = 1;
    }
    else
    {
      v4 = (float64x2_t *)a3;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (self->_contentSize.width == v4[1].f64[0] ? (v5 = self->_contentSize.height == v4[1].f64[1]) : (v5 = 0), v5))
      {
        v6 = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentInsets.top, v4[2]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentInsets.bottom, v4[3]))), 0xFuLL)));
      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_contentSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromDirectionalEdgeInsets(self->_contentInsets);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p contentSize=%@; contentInsets=%@}>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)setInsetsEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_insetsEnvironment, a3);
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_contentInsets = a3;
}

@end
