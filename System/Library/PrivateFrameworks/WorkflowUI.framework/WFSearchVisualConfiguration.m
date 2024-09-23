@implementation WFSearchVisualConfiguration

- (WFSearchVisualConfiguration)init
{
  WFSearchVisualConfiguration *v2;
  WFSearchVisualConfiguration *v3;
  WFSearchVisualConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSearchVisualConfiguration;
  v2 = -[WFSearchVisualConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_textFieldWidth = 0.0;
    v2->_textFieldPortraitLayoutInsets.top = 0.0;
    v2->_textFieldPortraitLayoutInsets.left = 0.0;
    v2->_textFieldPortraitLayoutInsets.bottom = 25.0;
    v2->_textFieldLandscapeLayoutInsets.top = 0.0;
    v2->_textFieldLandscapeLayoutInsets.left = 0.0;
    v2->_textFieldPortraitLayoutInsets.right = 0.0;
    *(_OWORD *)&v2->_textFieldLandscapeLayoutInsets.bottom = xmmword_220336C50;
    v4 = v2;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;

  result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((_QWORD *)result + 1) = *(_QWORD *)&self->_textFieldWidth;
    v5 = *(_OWORD *)&self->_textFieldPortraitLayoutInsets.bottom;
    *((_OWORD *)result + 1) = *(_OWORD *)&self->_textFieldPortraitLayoutInsets.top;
    *((_OWORD *)result + 2) = v5;
    v6 = *(_OWORD *)&self->_textFieldLandscapeLayoutInsets.bottom;
    *((_OWORD *)result + 3) = *(_OWORD *)&self->_textFieldLandscapeLayoutInsets.top;
    *((_OWORD *)result + 4) = v6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  WFSearchVisualConfiguration *v4;
  void *v5;
  char isKindOfClass;
  float64x2_t *v7;
  char v8;

  v4 = (WFSearchVisualConfiguration *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      if (self->_textFieldWidth == v7->f64[1]
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_textFieldPortraitLayoutInsets.top, v7[1]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_textFieldPortraitLayoutInsets.bottom, v7[2]))), 0xFuLL))) & 1) != 0)
      {
        v8 = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_textFieldLandscapeLayoutInsets.top, v7[3]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_textFieldLandscapeLayoutInsets.bottom, v7[4]))), 0xFuLL)));
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8 & 1;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_textFieldWidth
                          + self->_textFieldPortraitLayoutInsets.top
                          + self->_textFieldPortraitLayoutInsets.left
                          + self->_textFieldPortraitLayoutInsets.bottom
                          + self->_textFieldPortraitLayoutInsets.right
                          + self->_textFieldLandscapeLayoutInsets.top
                          + self->_textFieldLandscapeLayoutInsets.left
                          + self->_textFieldLandscapeLayoutInsets.bottom
                          + self->_textFieldLandscapeLayoutInsets.right);
}

- (double)textFieldWidth
{
  return self->_textFieldWidth;
}

- (void)setTextFieldWidth:(double)a3
{
  self->_textFieldWidth = a3;
}

- (UIEdgeInsets)textFieldPortraitLayoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textFieldPortraitLayoutInsets.top;
  left = self->_textFieldPortraitLayoutInsets.left;
  bottom = self->_textFieldPortraitLayoutInsets.bottom;
  right = self->_textFieldPortraitLayoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTextFieldPortraitLayoutInsets:(UIEdgeInsets)a3
{
  self->_textFieldPortraitLayoutInsets = a3;
}

- (UIEdgeInsets)textFieldLandscapeLayoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textFieldLandscapeLayoutInsets.top;
  left = self->_textFieldLandscapeLayoutInsets.left;
  bottom = self->_textFieldLandscapeLayoutInsets.bottom;
  right = self->_textFieldLandscapeLayoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTextFieldLandscapeLayoutInsets:(UIEdgeInsets)a3
{
  self->_textFieldLandscapeLayoutInsets = a3;
}

@end
