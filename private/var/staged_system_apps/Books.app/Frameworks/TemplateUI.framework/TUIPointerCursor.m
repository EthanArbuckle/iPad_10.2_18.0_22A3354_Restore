@implementation TUIPointerCursor

- (TUIPointerCursor)init
{
  TUIPointerCursor *result;
  int64x2_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIPointerCursor;
  result = -[TUIPointerCursor init](&v4, "init");
  if (result)
  {
    v3 = vdupq_n_s64(0x7FF8000000000000uLL);
    result->_shape = 0;
    *(int64x2_t *)&result->_insets.top = v3;
    *(int64x2_t *)&result->_insets.bottom = v3;
    *(_OWORD *)&result->_cornerRadius = xmmword_22FB40;
  }
  return result;
}

+ (id)defaultPointerCursor
{
  return objc_alloc_init((Class)a1);
}

- (TUIPointerCursor)initWithOther:(id)a3
{
  id v4;
  TUIPointerCursor *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUIPointerCursor;
  v5 = -[TUIPointerCursor init](&v13, "init");
  if (v5)
  {
    v5->_shape = (int64_t)objc_msgSend(v4, "shape");
    objc_msgSend(v4, "insets");
    v5->_insets.top = v6;
    v5->_insets.left = v7;
    v5->_insets.bottom = v8;
    v5->_insets.right = v9;
    objc_msgSend(v4, "cornerRadius");
    v5->_cornerRadius = v10;
    objc_msgSend(v4, "scale");
    v5->_scale = v11;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  TUIPointerCursor *v9;
  BOOL v10;
  BOOL v11;

  v4 = a3;
  v6 = objc_opt_class(v4, v5);
  if (v6 == objc_opt_class(self, v7))
    v8 = v4;
  else
    v8 = 0;
  v9 = v8;
  v10 = v9 == self;
  if (v9)
    v11 = v9 == self;
  else
    v11 = 1;
  if (!v11)
    v10 = self->_shape == v9->_shape
       && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.top, *(float64x2_t *)&v9->_insets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.bottom, *(float64x2_t *)&v9->_insets.bottom))), 0xFuLL))) & 1) != 0&& self->_cornerRadius == v9->_cornerRadius&& self->_scale == v9->_scale;

  return v10;
}

- (TUIPointerCursor)pointerCursorWithShape:(int64_t)a3
{
  TUIPointerCursor *v4;
  TUIPointerCursor *v5;

  v4 = self;
  if (v4->_shape != a3)
  {
    v5 = -[TUIPointerCursor initWithOther:]([TUIPointerCursor alloc], "initWithOther:", v4);

    -[TUIPointerCursor setShape:](v5, "setShape:", a3);
    v4 = v5;
  }
  return v4;
}

- (TUIPointerCursor)pointerCursorWithInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  TUIPointerCursor *v7;
  TUIPointerCursor *v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self;
  if (v7->_insets.left != left || v7->_insets.top != top || v7->_insets.right != right || v7->_insets.bottom != bottom)
  {
    v11 = -[TUIPointerCursor initWithOther:]([TUIPointerCursor alloc], "initWithOther:", v7);

    -[TUIPointerCursor setInsets:](v11, "setInsets:", top, left, bottom, right);
    v7 = v11;
  }
  return v7;
}

- (TUIPointerCursor)pointerCursorWithCornerRadius:(double)a3
{
  TUIPointerCursor *v4;
  TUIPointerCursor *v5;

  v4 = self;
  if (v4->_cornerRadius != a3)
  {
    v5 = -[TUIPointerCursor initWithOther:]([TUIPointerCursor alloc], "initWithOther:", v4);

    -[TUIPointerCursor setCornerRadius:](v5, "setCornerRadius:", a3);
    v4 = v5;
  }
  return v4;
}

- (TUIPointerCursor)pointerCursorWithScale:(double)a3
{
  TUIPointerCursor *v4;
  TUIPointerCursor *v5;

  v4 = self;
  if (v4->_scale != a3)
  {
    v5 = -[TUIPointerCursor initWithOther:]([TUIPointerCursor alloc], "initWithOther:", v4);

    -[TUIPointerCursor setScale:](v5, "setScale:", a3);
    v4 = v5;
  }
  return v4;
}

- (id)pointerShapeWithBounds:(CGRect)a3 preview:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double left;
  double top;
  double v12;
  double v13;
  double v14;
  double v15;
  double MidX;
  double MidY;
  double v18;
  CGFloat v19;
  double scale;
  int64_t shape;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  left = self->_insets.left;
  top = self->_insets.top;
  v12 = x + left;
  v13 = y + top;
  v14 = width - (left + self->_insets.right);
  v15 = height - (top + self->_insets.bottom);
  if (self->_scale != 1.0)
  {
    v30.origin.x = v12;
    v30.origin.y = v13;
    v30.size.width = v14;
    v30.size.height = v15;
    MidX = CGRectGetMidX(v30);
    v31.origin.x = v12;
    v31.origin.y = v13;
    v31.size.width = v14;
    v31.size.height = v15;
    MidY = CGRectGetMidY(v31);
    v32.origin.x = v12;
    v32.origin.y = v13;
    v32.size.width = v14;
    v32.size.height = v15;
    v18 = CGRectGetWidth(v32);
    v33.origin.x = v12;
    v33.origin.y = v13;
    v33.size.width = v14;
    v33.size.height = v15;
    v19 = CGRectGetHeight(v33);
    scale = self->_scale;
    v14 = v18 * scale;
    v15 = v19 * scale;
    v12 = MidX - v18 * scale * 0.5;
    v13 = MidY - v19 * scale * 0.5;
  }
  shape = self->_shape;
  if (shape == 1)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v12, v13, v14, v15, self->_cornerRadius));
  }
  else if (shape == 2)
  {
    v34.origin.x = v12;
    v34.origin.y = v13;
    v34.size.width = v14;
    v34.size.height = v15;
    v22 = CGRectGetMidX(v34);
    v35.origin.x = v12;
    v35.origin.y = v13;
    v35.size.width = v14;
    v35.size.height = v15;
    v23 = CGRectGetMidY(v35);
    v36.origin.x = v12;
    v36.origin.y = v13;
    v36.size.width = v14;
    v36.size.height = v15;
    v24 = CGRectGetWidth(v36);
    v37.origin.x = v12;
    v37.origin.y = v13;
    v37.size.width = v14;
    v37.size.height = v15;
    v25 = CGRectGetHeight(v37);
    if (v24 >= v25)
      v26 = v24;
    else
      v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v22 - v26 * 0.5, v23 - v26 * 0.5, v26, v26));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v27));

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (int64_t)shape
{
  return self->_shape;
}

- (void)setShape:(int64_t)a3
{
  self->_shape = a3;
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

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

@end
