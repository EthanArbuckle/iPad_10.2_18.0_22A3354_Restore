@implementation UIKBEdgeEffect

+ (id)effectWithColor:(id)a3 edges:(unint64_t)a4 inset:(double)a5 weight:(double)a6
{
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  v10 = a3;
  v11 = objc_alloc((Class)a1);
  v12 = 0.0;
  if ((a4 & 1) != 0)
    v13 = a5;
  else
    v13 = 0.0;
  if ((a4 & 2) != 0)
    v14 = a5;
  else
    v14 = 0.0;
  if ((a4 & 4) != 0)
    v15 = a5;
  else
    v15 = 0.0;
  if ((a4 & 8) != 0)
    v12 = a5;
  v16 = (void *)objc_msgSend(v11, "initWithColor:edges:insets:weight:", v10, a4, v13, v14, v15, v12, a6);

  return v16;
}

- (UIKBEdgeEffect)initWithColor:(id)a3 edges:(unint64_t)a4 insets:(UIEdgeInsets)a5 weight:(double)a6
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v14;
  UIKBEdgeEffect *v15;
  UIKBEdgeEffect *v16;
  objc_super v18;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v14 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIKBEdgeEffect;
  v15 = -[UIKBEdgeEffect init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_colorName, a3);
    v16->_edges = a4;
    v16->_insets.top = top;
    v16->_insets.left = left;
    v16->_insets.bottom = bottom;
    v16->_insets.right = right;
    v16->_weight = a6;
    v16->_opacity = 1.0;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
}

- (BOOL)isValid
{
  double v3;
  BOOL v4;
  void *v5;
  double v6;

  if (self->_colorName)
  {
    -[UIKBEdgeEffect weight](self, "weight");
    return v3 > 0.0 && -[UIKBEdgeEffect edges](self, "edges") != 0;
  }
  else
  {
    -[UIKBEdgeEffect gradient](self, "gradient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 && (-[UIKBEdgeEffect weight](self, "weight"), v6 > 0.0) && -[UIKBEdgeEffect edges](self, "edges") != 0;

  }
  return v4;
}

- (BOOL)usesRGBColors
{
  void *v3;
  void *v4;
  char v5;
  CGColor *v6;

  -[UIKBEdgeEffect gradient](self, "gradient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKBEdgeEffect gradient](self, "gradient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "usesRGBColors");

  }
  else
  {
    v6 = -[UIKBEdgeEffect CGColor](self, "CGColor");
    v5 = UIKBColorUsesRGB((_BOOL8)v6);
    CFRelease(v6);
  }
  return v5;
}

- (BOOL)renderUnder
{
  return 0;
}

- (void)renderEffectWithRenderer:(id)a3 traits:(id)a4
{
  objc_msgSend(a3, "renderEdgeEffect:withTraits:", self, a4);
}

+ (id)effectWithColor:(id)a3 edges:(unint64_t)a4 insets:(UIEdgeInsets)a5 weight:(double)a6
{
  double right;
  double bottom;
  double left;
  double top;
  id v13;
  void *v14;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithColor:edges:insets:weight:", v13, a4, top, left, bottom, right, a6);

  return v14;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  UIEdgeInsets v11;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[UIKBEdgeEffect gradient](self, "gradient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKBEdgeEffect gradient](self, "gradient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; gradient = %@"), v5);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("; color = %@"), self->_colorName);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("; edges = %x"), -[UIKBEdgeEffect edges](self, "edges"));
  -[UIKBEdgeEffect insets](self, "insets");
  NSStringFromUIEdgeInsets(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; insets = %@"), v6);

  -[UIKBEdgeEffect weight](self, "weight");
  objc_msgSend(v3, "appendFormat:", CFSTR("; weight = %f"), v7);
  -[UIKBEdgeEffect opacity](self, "opacity");
  if (v8 != 1.0)
  {
    -[UIKBEdgeEffect opacity](self, "opacity");
    objc_msgSend(v3, "appendFormat:", CFSTR("; opacity = %f"), v9);
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  UIKBEdgeEffect *v4;
  NSString *colorName;
  UIKBGradient *gradient;
  BOOL v7;

  v4 = (UIKBEdgeEffect *)a3;
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
      && (gradient = self->_gradient, (gradient != 0) != (v4->_gradient == 0))
      && (!gradient || -[UIKBGradient isEqual:](gradient, "isEqual:"))
      && self->_edges == v4->_edges
      && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.top, *(float64x2_t *)&v4->_insets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.bottom, *(float64x2_t *)&v4->_insets.bottom))), 0xFuLL))) & 1) != 0&& self->_weight == v4->_weight&& self->_opacity == v4->_opacity;
  }

  return v7;
}

- (CGColor)CGColor
{
  NSString *colorName;
  CGColor *v4;
  double v5;
  CGFloat v6;

  colorName = self->_colorName;
  if (!colorName)
    return 0;
  v4 = (CGColor *)UIKBGetNamedColor(colorName);
  -[UIKBEdgeEffect opacity](self, "opacity");
  if (v5 != 1.0)
  {
    -[UIKBEdgeEffect opacity](self, "opacity");
    return CGColorCreateCopyWithAlpha(v4, v6);
  }
  CGColorRetain(v4);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBEdgeEffect *v4;
  NSString *colorName;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v4 = +[UIKBEdgeEffect allocWithZone:](UIKBEdgeEffect, "allocWithZone:", a3);
  colorName = self->_colorName;
  v6 = -[UIKBEdgeEffect edges](self, "edges");
  -[UIKBEdgeEffect insets](self, "insets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UIKBEdgeEffect weight](self, "weight");
  v16 = -[UIKBEdgeEffect initWithColor:edges:insets:weight:](v4, "initWithColor:edges:insets:weight:", colorName, v6, v8, v10, v12, v14, v15);
  v17 = -[UIKBGradient copy](self->_gradient, "copy");
  v18 = *(void **)(v16 + 32);
  *(_QWORD *)(v16 + 32) = v17;

  *(double *)(v16 + 40) = self->_opacity;
  return (id)v16;
}

- (unint64_t)edges
{
  return self->_edges;
}

- (void)setEdges:(unint64_t)a3
{
  self->_edges = a3;
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

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (UIKBGradient)gradient
{
  return self->_gradient;
}

- (void)setGradient:(id)a3
{
  objc_storeStrong((id *)&self->_gradient, a3);
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

@end
