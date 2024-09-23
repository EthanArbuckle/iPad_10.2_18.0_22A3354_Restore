@implementation UIKBShadowEffect

- (BOOL)isValid
{
  double v2;

  -[UIKBShadowEffect weight](self, "weight");
  return v2 > 0.0;
}

- (BOOL)usesRGBColors
{
  CGColor *v2;
  BOOL v3;

  v2 = -[UIKBShadowEffect CGColor](self, "CGColor");
  v3 = UIKBColorUsesRGB((_BOOL8)v2);
  CFRelease(v2);
  return v3;
}

- (UIKBGradient)gradient
{
  return 0;
}

- (BOOL)renderUnder
{
  return 1;
}

- (void)renderEffectWithRenderer:(id)a3 traits:(id)a4
{
  objc_msgSend(a3, "renderShadowEffect:withTraits:", self, a4);
}

+ (id)effectWithColor:(id)a3 offset:(CGSize)a4 insets:(UIEdgeInsets)a5 weight:(double)a6
{
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  id v14;
  void *v15;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithColor:offset:insets:weight:", v14, width, height, top, left, bottom, right, a6);

  return v15;
}

- (UIKBShadowEffect)initWithColor:(id)a3 offset:(CGSize)a4 insets:(UIEdgeInsets)a5 weight:(double)a6
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  id v15;
  UIKBShadowEffect *v16;
  UIKBShadowEffect *v17;
  objc_super v19;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  height = a4.height;
  width = a4.width;
  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UIKBShadowEffect;
  v16 = -[UIKBShadowEffect init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_colorName, a3);
    v17->_offset.height = height;
    v17->_insets.top = top;
    v17->_insets.left = left;
    v17->_insets.bottom = bottom;
    v17->_insets.right = right;
    v17->_weight = a6;
    v17->_offset.width = width;
  }

  return v17;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CGSize v9;
  UIEdgeInsets v10;
  UIEdgeInsets v11;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("; color = %@"), self->_colorName);
  -[UIKBShadowEffect offset](self, "offset");
  NSStringFromCGSize(v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; offset = %@"), v4);

  -[UIKBShadowEffect insets](self, "insets");
  NSStringFromUIEdgeInsets(v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; insets = %@"), v5);

  -[UIKBShadowEffect concaveInsets](self, "concaveInsets");
  NSStringFromUIEdgeInsets(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; concaveInsets = %@"), v6);

  -[UIKBShadowEffect weight](self, "weight");
  objc_msgSend(v3, "appendFormat:", CFSTR("; weight = %f"), v7);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  UIKBShadowEffect *v4;
  NSString *colorName;
  BOOL v6;
  BOOL v7;

  v4 = (UIKBShadowEffect *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0
      && (colorName = self->_colorName, (v4->_colorName == 0) != (colorName != 0))
      && (!colorName || -[NSString isEqualToString:](colorName, "isEqualToString:"))
      && (self->_offset.width == v4->_offset.width ? (v6 = self->_offset.height == v4->_offset.height) : (v6 = 0),
          v6
       && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.top, *(float64x2_t *)&v4->_insets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.bottom, *(float64x2_t *)&v4->_insets.bottom))), 0xFuLL))) & 1) != 0&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_concaveInsets.top, *(float64x2_t *)&v4->_concaveInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_concaveInsets.bottom,
                                                      *(float64x2_t *)&v4->_concaveInsets.bottom))),
                                     0xFuLL))) & 1) != 0)
      && self->_weight == v4->_weight;
  }

  return v7;
}

- (CGColor)CGColor
{
  CGColor *result;
  CGColor *v3;

  result = (CGColor *)self->_colorName;
  if (result)
  {
    v3 = (CGColor *)UIKBGetNamedColor(result);
    return CGColorRetain(v3);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBShadowEffect *v4;
  NSString *colorName;
  double v6;
  double v7;
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
  UIKBShadowEffect *v19;

  v4 = +[UIKBShadowEffect allocWithZone:](UIKBShadowEffect, "allocWithZone:", a3);
  colorName = self->_colorName;
  -[UIKBShadowEffect offset](self, "offset");
  v7 = v6;
  v9 = v8;
  -[UIKBShadowEffect insets](self, "insets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UIKBShadowEffect weight](self, "weight");
  v19 = -[UIKBShadowEffect initWithColor:offset:insets:weight:](v4, "initWithColor:offset:insets:weight:", colorName, v7, v9, v11, v13, v15, v17, v18);
  -[UIKBShadowEffect concaveInsets](self, "concaveInsets");
  -[UIKBShadowEffect setConcaveInsets:](v19, "setConcaveInsets:");
  return v19;
}

- (CGSize)offset
{
  double width;
  double height;
  CGSize result;

  width = self->_offset.width;
  height = self->_offset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOffset:(CGSize)a3
{
  self->_offset = a3;
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (UIEdgeInsets)concaveInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_concaveInsets.top;
  left = self->_concaveInsets.left;
  bottom = self->_concaveInsets.bottom;
  right = self->_concaveInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setConcaveInsets:(UIEdgeInsets)a3
{
  self->_concaveInsets = a3;
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorName, 0);
}

@end
