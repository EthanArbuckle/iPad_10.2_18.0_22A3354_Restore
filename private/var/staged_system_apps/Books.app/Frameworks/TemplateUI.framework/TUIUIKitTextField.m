@implementation TUIUIKitTextField

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIUIKitTextField;
  -[TUIUIKitTextField layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIUIKitTextField _fieldEditor](self, "_fieldEditor"));
  if (v3)
    -[TUIUIKitTextField bringSubviewToFront:](self, "bringSubviewToFront:", v3);

}

- (CGRect)textRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float64x2_t v16;
  float64x2_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)TUIUIKitTextField;
  -[TUIUIKitTextField textRectForBounds:](&v22, "textRectForBounds:");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  if (!CGRectIsEmpty(v23))
  {
    v16 = *(float64x2_t *)&self->_editingInsets.top;
    v17 = *(float64x2_t *)&self->_editingInsets.bottom;
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&UIEdgeInsetsZero.top, v16), (int32x4_t)vceqq_f64(*(float64x2_t *)&UIEdgeInsetsZero.bottom, v17))), 0xFuLL))) & 1) == 0)
    {
      v9 = v9 + v16.f64[1];
      v11 = v11 + v16.f64[0];
      v13 = v13 - (v16.f64[1] + v17.f64[1]);
      v15 = v15 - (v16.f64[0] + v17.f64[0]);
    }
  }
  v18 = v9;
  v19 = v11;
  v20 = v13;
  v21 = v15;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TUIUIKitTextField textRectForBounds:](self, "textRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIEdgeInsets)editingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_editingInsets.top;
  left = self->_editingInsets.left;
  bottom = self->_editingInsets.bottom;
  right = self->_editingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEditingInsets:(UIEdgeInsets)a3
{
  self->_editingInsets = a3;
}

@end
